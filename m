Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F3536E741
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 10:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239885AbhD2Ipm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 04:45:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239903AbhD2Ipg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 04:45:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 138D3613CC;
        Thu, 29 Apr 2021 08:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619685889;
        bh=nreTIL12xFUZvcTt96xXR/SXb8AuvPvSOpFf5HLbZBk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ctm04I2L0o3FWHtSWTxE2sQX1e+ZmPA5xsrdUhXKKaW8D+JLzhpvrWKpOuSvnLtXx
         hTDc4pYn65X695XUfiFQOUwoqVA4SUmM11S4aoKAgRJjyqmpHGQLZ7KHLUBrDA2GGH
         p8WZA84JGK703LsszUILEkGefqaTcCPxWsLJdPfhohHqCTz7w+OBR+LySL/kAeyKtv
         xwEuHOJkDEEPKXKk2bMovqcj/idehQwNAzKoNd1o/5gSAOco95JBuS+aeNYCeJbTSu
         nDJbuuv23IGBSos6VNYrz1yqAZhdMLJENlE6A/HbKpFNjXX2mbmWJkXbtf/twEu0YM
         4JzILU/CZ1k4w==
Date:   Thu, 29 Apr 2021 10:44:41 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        p.zabel@pengutronix.de, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG
 media bus formats
Message-ID: <20210429104441.3e85d81b@coco.lan>
In-Reply-To: <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
        <20210427120701.21809-2-m.felsch@pengutronix.de>
        <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
        <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 29 Apr 2021 09:49:03 +0200
Marco Felsch <m.felsch@pengutronix.de> escreveu:

> Hi Laurent,
> 
> On 21-04-29 04:51, Laurent Pinchart wrote:
> > Hi Marco,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Apr 27, 2021 at 02:06:56PM +0200, Marco Felsch wrote:  
> > > Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
> > > camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
> > > with the interleaved IR pixels looks like:
> > > 
> > >         |  G |  R |  G |  B | ...
> > >         +----+----+----+----+---
> > >         | IR |  G | IR |  G | ...
> > >         +----+----+----+----+---
> > >         |  G |  B |  G |  R | ...
> > >         +----+----+----+----+---
> > >         | IR |  G | IR |  G | ...
> > >         +----+----+----+----+---
> > >         | .. | .. | .. | .. | ..
> > > 
> > > [1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf  
> > 
> > I think we're reaching a limit of the media bus codes model here, due to
> > a historical mistake. The four possible Bayer patterns, times the
> > different number of bits per pixel, creates a lot of media bus codes,
> > and drivers for CSI-2 receivers and IP cores further down the pipeline
> > have to support them all.  
> 
> That's correct but it is not bayer related.

Err... there are two separate things here:

1) for the uAPI part, we're not even close to the limit of a 4-bytes
   fourcc;

2) the kAPI is currently sharing the same fourcc from the uAPI,
   because it is a lot simpler than doing something different.

Yet, nothing prevents that the kAPI could be improved in order to
better describe each format, provided that:

1. there will be a 1:1 mapping with the uAPI.
   In other words, it would be possible to write a function that
   would convert a "struct foo" from/to a 32-bits fourcc;

2. such new kAPI should be optional, as usually only drivers
   for hardware with ISP (plus the UVC driver) would be flexible
   enough to allow random formats. For the rest, the bridges are
   typically limited to support only a few formats, so it doesn't
   make sense to modify existing drivers to use such new kAPI.

Ok, someone has to come up with a proposal about what a "struct foo"
would contain. On a real quick brainstorm, something like this could
be a start:

enum v4l2_pixformat_type {
	VIDEO_PIXFORMAT_RGB,
	VIDEO_PIXFORMAT_YUV,
	VIDEO_PIXFORMAT_COMPRESSED,
	VIDEO_PIXFORMAT_BAYER_RGB,
	VIDEO_PIXFORMAT_BAYER_RGB_IR,
};

struct v4l2_pixformat_desc {
	enum v4l2_pixformat_type	pixfmt_type;
	bool				is_packed;
	int				bits_per_component;

	union {
		enum v4l2_pixformat_rgb_order		rgb_order;
		enum v4l2_pixformat_yuv_order		yuv_order;
		enum v4l2_pixformat_bayer_rgb_order	bayer_rgb_order;
		enum v4l2_pixformat_bayer_rgb_ir_order	bayer_rgb_ir_order;
		enum v4l2_pixformat_compress_type	compress_type;
	};
	...
};

Btw, I remember someone suggested a model similar to that in the past,
shared with DRM. Well, I don't think it would be easy to share
an internal subsystem-specific kAPI like that with other subsystems,
as this is the kind of thing that people will change from time to time,
and coordinating something like that can be painful, but we can try
to fork the model applied to DRM on media. For instance, I doubt that
Bayer RGB + IR would make any sense for DRM drivers.

Thanks,
Mauro
