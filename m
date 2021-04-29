Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5423B36EE6A
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 18:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbhD2QyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 12:54:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54916 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbhD2QyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 12:54:23 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 096C7E70;
        Thu, 29 Apr 2021 18:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619715215;
        bh=M1TSHAqOinUf7AT5IuCbV3F44dwON6e0TFjtqNBEZBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xs5+0VZKIoGFY3SAw7t9X+tqIjpsNMFxmgNxEtR153zzXxS3AW/OQXR8W6l0pb0dC
         PAAgAzZQJ9xS4hs+L3q0CGlWvV2P+sbzwW4ZChRG9X20Sp18bynDniJUqbILOpZAMj
         lq1lAx8Fz3FV73amI8JEjLyBl3oOU1ZZ++lO+1Zc=
Date:   Thu, 29 Apr 2021 19:53:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, p.zabel@pengutronix.de,
        slongerbeam@gmail.com, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG
 media bus formats
Message-ID: <YIrkjcuF/+huMotl@pendragon.ideasonboard.com>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
 <20210427120701.21809-2-m.felsch@pengutronix.de>
 <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
 <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
 <20210429104441.3e85d81b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210429104441.3e85d81b@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Apr 29, 2021 at 10:44:41AM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 29 Apr 2021 09:49:03 +0200 Marco Felsch escreveu:
> > On 21-04-29 04:51, Laurent Pinchart wrote:
> > > On Tue, Apr 27, 2021 at 02:06:56PM +0200, Marco Felsch wrote:  
> > > > Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
> > > > camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
> > > > with the interleaved IR pixels looks like:
> > > > 
> > > >         |  G |  R |  G |  B | ...
> > > >         +----+----+----+----+---
> > > >         | IR |  G | IR |  G | ...
> > > >         +----+----+----+----+---
> > > >         |  G |  B |  G |  R | ...
> > > >         +----+----+----+----+---
> > > >         | IR |  G | IR |  G | ...
> > > >         +----+----+----+----+---
> > > >         | .. | .. | .. | .. | ..
> > > > 
> > > > [1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf  
> > > 
> > > I think we're reaching a limit of the media bus codes model here, due to
> > > a historical mistake. The four possible Bayer patterns, times the
> > > different number of bits per pixel, creates a lot of media bus codes,
> > > and drivers for CSI-2 receivers and IP cores further down the pipeline
> > > have to support them all.  
> > 
> > That's correct but it is not bayer related.
> 
> Err... there are two separate things here:
> 
> 1) for the uAPI part, we're not even close to the limit of a 4-bytes
>    fourcc;
> 
> 2) the kAPI is currently sharing the same fourcc from the uAPI,
>    because it is a lot simpler than doing something different.

Please note that we're talking about media bus codes here, not pixel
formats. Both are part of the UAPI though, and pixel formats suffer from
a similar issue, but I'd like to focus on the media bus codes first.

> Yet, nothing prevents that the kAPI could be improved in order to
> better describe each format, provided that:
> 
> 1. there will be a 1:1 mapping with the uAPI.
>    In other words, it would be possible to write a function that
>    would convert a "struct foo" from/to a 32-bits fourcc;
> 
> 2. such new kAPI should be optional, as usually only drivers
>    for hardware with ISP (plus the UVC driver) would be flexible
>    enough to allow random formats. For the rest, the bridges are
>    typically limited to support only a few formats, so it doesn't
>    make sense to modify existing drivers to use such new kAPI.
> 
> Ok, someone has to come up with a proposal about what a "struct foo"
> would contain. On a real quick brainstorm, something like this could
> be a start:
> 
> enum v4l2_pixformat_type {
> 	VIDEO_PIXFORMAT_RGB,
> 	VIDEO_PIXFORMAT_YUV,
> 	VIDEO_PIXFORMAT_COMPRESSED,
> 	VIDEO_PIXFORMAT_BAYER_RGB,
> 	VIDEO_PIXFORMAT_BAYER_RGB_IR,
> };
> 
> struct v4l2_pixformat_desc {
> 	enum v4l2_pixformat_type	pixfmt_type;
> 	bool				is_packed;
> 	int				bits_per_component;
> 
> 	union {
> 		enum v4l2_pixformat_rgb_order		rgb_order;
> 		enum v4l2_pixformat_yuv_order		yuv_order;
> 		enum v4l2_pixformat_bayer_rgb_order	bayer_rgb_order;
> 		enum v4l2_pixformat_bayer_rgb_ir_order	bayer_rgb_ir_order;
> 		enum v4l2_pixformat_compress_type	compress_type;
> 	};
> 	...
> };
> 
> Btw, I remember someone suggested a model similar to that in the past,
> shared with DRM. Well, I don't think it would be easy to share
> an internal subsystem-specific kAPI like that with other subsystems,
> as this is the kind of thing that people will change from time to time,
> and coordinating something like that can be painful, but we can try
> to fork the model applied to DRM on media. For instance, I doubt that
> Bayer RGB + IR would make any sense for DRM drivers.

-- 
Regards,

Laurent Pinchart
