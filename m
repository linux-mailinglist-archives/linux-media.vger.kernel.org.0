Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5EA31C0A0
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 18:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhBORaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 12:30:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:31096 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231216AbhBOR2s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 12:28:48 -0500
IronPort-SDR: Ni82cT65yEdjd32NMCRIqbA4cxHJbxQVZQAOzQcARj1peIdIA/Lma7WDfH4Jwk8j3hoJXxX6J8
 BEMzbdOlaCOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="179225125"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="179225125"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:27:01 -0800
IronPort-SDR: KdQlONftpO4RJ2iHd76wR0aG16wYNCqK3rhzi/QeiX6kO7qI4q0Tn3/VucBRbZC0m/R1Am21TF
 sjdA81WNN2ag==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="363866876"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:26:57 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2CC5220518;
        Mon, 15 Feb 2021 19:26:55 +0200 (EET)
Date:   Mon, 15 Feb 2021 19:26:55 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <20210215172655.GL3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 15, 2021 at 03:41:14PM +0200, Andy Shevchenko wrote:
...
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index ca41e8c00ad7..a5c9fe2e56b3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -771,21 +771,21 @@ static void intel_plane_uapi_info(struct seq_file *m, struct intel_plane *plane)
> >  	const struct intel_plane_state *plane_state =
> >  		to_intel_plane_state(plane->base.state);
> >  	const struct drm_framebuffer *fb = plane_state->uapi.fb;
> > -	struct drm_format_name_buf format_name;
> >  	struct drm_rect src, dst;
> >  	char rot_str[48];
> >  
> >  	src = drm_plane_state_src(&plane_state->uapi);
> >  	dst = drm_plane_state_dest(&plane_state->uapi);
> >  
> > -	if (fb)
> > -		drm_get_format_name(fb->format->format, &format_name);
> > -
> >  	plane_rotation(rot_str, sizeof(rot_str),
> >  		       plane_state->uapi.rotation);
> >  
> > -	seq_printf(m, "\t\tuapi: [FB:%d] %s,0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> > -		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
> > +	seq_printf(m, "\t\tuapi: [FB:%d] ", fb ? fb->base.id : 0);
> > +	if (fb)
> > +		seq_printf(m, "%p4cc", &fb->format->format);
> > +	else
> > +		seq_puts(m, "n/a");
> 
> > +	seq_printf(m, ",0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> 
> Why not to keep two seq_printf() calls?
> 
> if (fb) {
> 	seq_printf();
> } else {
> 	seq_printf();
> }
> 
> ?

I could, but it'd repeat a lot of the same format string that is very
complicated right now. Therefore I thought it's better to split.

Or do you mean seq_printf() vs. seq_puts()? checkpatch.pl (rightly) warns
about it.

> 
> >  		   fb ? fb->modifier : 0,
> >  		   fb ? fb->width : 0, fb ? fb->height : 0,
> >  		   plane_visibility(plane_state),

-- 
Sakari Ailus
