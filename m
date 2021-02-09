Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A33314B2F
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 10:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhBIJMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 04:12:16 -0500
Received: from mga12.intel.com ([192.55.52.136]:12467 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230444AbhBIJGG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 04:06:06 -0500
IronPort-SDR: D/GSWDht4f3DtbfLGoyF6mqZBOcMEKz+OU3lDqYl4fEm18IZPKUlwZGEn1lkOmcBIhGXGR2CtZ
 QIG0O3oKJtog==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="161003451"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="161003451"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 01:03:38 -0800
IronPort-SDR: SU9qFKNtrmpEC6JKaNynq0fO/IFTngaOUhFXJnX/iTmDVW546Xcv/uiyj8dNX0p6k3nyU9cVh5
 o+4WbDlsXhSg==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; 
   d="scan'208";a="436017955"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 01:03:34 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8B611206D0; Tue,  9 Feb 2021 11:03:02 +0200 (EET)
Date:   Tue, 9 Feb 2021 11:03:02 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Joe Perches <joe@perches.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v6 3/3] drm/fourcc: Switch to %p4cc format modifier
Message-ID: <20210209090302.GB32460@paasikivi.fi.intel.com>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-4-sakari.ailus@linux.intel.com>
 <CAKMK7uEsRvhrw4v5yGhbCZV1=EOVY3X7vzdQc6zroPT2EX4J7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEsRvhrw4v5yGhbCZV1=EOVY3X7vzdQc6zroPT2EX4J7Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the comments.

On Tue, Feb 09, 2021 at 08:27:10AM +0100, Daniel Vetter wrote:
> On Mon, Feb 8, 2021 at 9:20 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Instead of constructing the FourCC code manually, use the %p4cc printk
> > modifier to print it. Also leave a message to avoid using this function.
> >
> > The next step would be to convert the users to use %p4cc directly instead
> > and removing the function.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_fourcc.c | 16 +++-------------
> >  1 file changed, 3 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 03262472059c..4ff40f2f27c0 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -30,11 +30,6 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_fourcc.h>
> >
> > -static char printable_char(int c)
> > -{
> > -       return isascii(c) && isprint(c) ? c : '?';
> > -}
> > -
> >  /**
> >   * drm_mode_legacy_fb_format - compute drm fourcc code from legacy description
> >   * @bpp: bits per pixels
> > @@ -134,17 +129,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
> >   * drm_get_format_name - fill a string with a drm fourcc format's name
> >   * @format: format to compute name of
> >   * @buf: caller-supplied buffer
> > + *
> > + * Please use %p4cc printk format modifier instead of this function.
> 
> I think would be nice if we could roll this out and outright delete
> this one here ... Quick git grep says there's not that many, and %p4cc
> is quite a bit shorter than what we have now.

Sounds good; I can submit patches for that but I think I'll do that once we
have the %p4cc modifier in.

-- 
Regards,

Sakari Ailus
