(function (jQuery) {
    jQuery.fn.deserialize = function(data) {
        var f = jQuery(this),
            map = {},
            find = function(selector) { 
                return f.find(selector); 
            };
        //Get map of values
        jQuery.each(data.split("&"), function () {
            var nv = this.split("="),
                n = decodeURIComponent(nv[0]),
                v = nv.length > 1 ? decodeURIComponent(nv[1]) : null;
            if (!(n in map)) {
                map[n] = [];
            }
            map[n].push(v);
        })
        //Set values for all form elements in the data
        jQuery.each(map, function (n, v) {
            if(find("[name='" + n + "']").is("input:checkbox,input:radio")) {
                find("[name='" + n + "']").val(v);
            } else {
                find("[name='" + n + "']").val(String(v).replace(/\+/g,' '));
            }
        })
        return this;
    };
})(jQuery);