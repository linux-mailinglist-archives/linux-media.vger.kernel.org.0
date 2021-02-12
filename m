Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE60D319C4A
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 11:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbhBLKDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Feb 2021 05:03:41 -0500
Received: from mga18.intel.com ([134.134.136.126]:24132 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhBLKDg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Feb 2021 05:03:36 -0500
IronPort-SDR: gx7R40SxeodEU6QpCNEaT2Z+Ov6J1owzbe8NsK0HfSoJ9zsW6gxcwn41yLiMA49CA+9/7/5SZ+
 gnQkSeDgHPSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="170059826"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="170059826"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 02:01:47 -0800
IronPort-SDR: ehlZTpGZ5wEitMMPpLCdIWlxBduBTxxBfLgyWANj1C32rvXqbw/7Ut+u7zm3dz8zioBr4Iy+ev
 lVydzinX/niA==
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="363665377"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 02:01:42 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E29C820345;
        Fri, 12 Feb 2021 12:01:40 +0200 (EET)
Date:   Fri, 12 Feb 2021 12:01:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v6 2/3] v4l: ioctl: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <20210212100140.GC3@paasikivi.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-3-sakari.ailus@linux.intel.com>
 <YCVb8hxawwd2l2yx@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCVb8hxawwd2l2yx@alley>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petr,

On Thu, Feb 11, 2021 at 05:31:46PM +0100, Petr Mladek wrote:
> On Mon 2021-02-08 22:09:02, Sakari Ailus wrote:
> > Now that we can print FourCC codes directly using printk, make use of the
> > feature in V4L2 core.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 85 +++++++---------------------
> >  1 file changed, 21 insertions(+), 64 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 31d1342e61e8..31662c3a8c9e 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -265,13 +265,9 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
> >  {
> >  	const struct v4l2_fmtdesc *p = arg;
> >  
> > -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
> > +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%p4cc, mbus_code=0x%04x, description='%.*s'\n",
> 
> Is %p4cc really acceptable here?
> 
> The original code printed only the 4 characters. The original code
> would print something like:
> 
>   index=21, type=bla, flags=0x0, pixelformat=BG12, mbus_code=0x0a9f, descrition="bla bla bla"
> 
> while the new code will do:
> 
>   index=21, type=bla, flags=0x0, pixelformat=BG12 little-endian (0x32314742), mbus_code=0x0a9f, descrition="bla bla bla"
> 
> This is much harder to parse because there are spaces also inside
> pixel_format=<value>

Note that also the fourcc code itself could contains spaces so that's not
new.

The fourcc (debug) form is now one and the same for V4L2 and DRM, but I
guess nothing would prevent adding a shorter form if needed. This is not
continuously happening during streaming so this is also not performance
critical in any way. The fourcc code was used to be printed this way here
mainly because it was, well, easy to do for "just" debugging purposes.

Hans, any opinion?

-- 
Kind regards,

Sakari Ailus
