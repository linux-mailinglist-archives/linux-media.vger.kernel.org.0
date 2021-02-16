Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370D531C928
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 11:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhBPK5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 05:57:31 -0500
Received: from mga17.intel.com ([192.55.52.151]:38679 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhBPK5a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 05:57:30 -0500
IronPort-SDR: dWv1UsUmFFr7oLr+Lmgyagb0KrKhoTqgWkKAiQp36nD2pqYDPQN4u/U0SaGvvDdIX7QtgeLr3N
 SlVGf+94PU8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162622562"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="162622562"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 02:55:39 -0800
IronPort-SDR: K/LCoTRRj2skVEigNtRgGbmiWl7VPsq9Xk5of6rTkxjO4Csd6HfCfVlrMP0TNZiJKJ4o7J3C2+
 0eIWCxqUh+QQ==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="366415880"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 02:55:34 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBy0x-005ReY-75; Tue, 16 Feb 2021 12:55:31 +0200
Date:   Tue, 16 Feb 2021 12:55:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v8 3/4] drm: Switch to %p4cc format modifier
Message-ID: <YCuko55bGhmxvNiq@smile.fi.intel.com>
References: <20210216101931.2110-1-sakari.ailus@linux.intel.com>
 <20210216101931.2110-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216101931.2110-4-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 16, 2021 at 12:19:30PM +0200, Sakari Ailus wrote:
> Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid of a
> large number of temporary variables at the same time.

...

> -	seq_printf(m, "\t\tuapi: [FB:%d] %s,0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> -		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
> +	seq_printf(m, "\t\tuapi: [FB:%d] ", fb ? fb->base.id : 0);
> +	if (fb)
> +		seq_printf(m, "%p4cc", &fb->format->format);
> +	else
> +		seq_puts(m, "n/a");
> +	seq_printf(m, ",0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
>  		   fb ? fb->modifier : 0,
>  		   fb ? fb->width : 0, fb ? fb->height : 0,
>  		   plane_visibility(plane_state),

I still think this can be improved. See below for the example:

  seq_puts(m, "\t\tuapi: ");
  if (fb)
    seq_printf(m, "[FB:%d] %p4cc,0x%llx,%dx%d, ",
       fb->base.id, &fb->format->format, fb->modifier, fb->width, fb->height);
  else
    seq_puts(m, "[FB:0] n/a,0,0x0, ");
  seq_printf(m, "visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
       plane_visibility(plane_state), DRM_RECT_FP_ARG(&src),
       DRM_RECT_ARG(&dst), rot_str);

This will show logical parts separately and clear view on what would be printed
when !fb. Also it uses seq_puts() without any needs for formatting.

-- 
With Best Regards,
Andy Shevchenko


