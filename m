Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D1936FAD1
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 14:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbhD3MqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 08:46:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232588AbhD3Mp3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 08:45:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48E6661468;
        Fri, 30 Apr 2021 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619786681;
        bh=aWOY8yCD3XeORturh27KsdNRXUQJPRlZ72BNyuj1wOI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OUGF4NRAAk2RVPUxlUV2qSNu9wlevcOttM3R8uFg/CNQZWFY3l9CFgGKTU6zxAn4k
         ipu7axCdBTd2JOkiRiWcHTU0b1HAljHh8rkugbz+nybstbaibTYYRv82wXWmldFpcz
         dntii4kONGBnHwh775YhvX+bbvyjacxVNZSQeI9eTcaXh4WS8EHCGTxDv/3AAf70lZ
         YJaeYyif+ZI0cr9WV9oP8GtmOATO6ldqMOjiprBeft6p5Id8BGlMusVWjYQoGN1tYG
         Ca5Jlf1U6hsd+rOOG8QsqDfriIuYJaeRpkA/VUUG5AJnKU8wHHjqc12+EaSLt8VlKr
         WV4v/AYPNA7eQ==
Date:   Fri, 30 Apr 2021 14:44:36 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, p.zabel@pengutronix.de,
        slongerbeam@gmail.com, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG
 media bus formats
Message-ID: <20210430144436.2c09c99a@coco.lan>
In-Reply-To: <YIrkjcuF/+huMotl@pendragon.ideasonboard.com>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
        <20210427120701.21809-2-m.felsch@pengutronix.de>
        <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
        <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
        <20210429104441.3e85d81b@coco.lan>
        <YIrkjcuF/+huMotl@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 29 Apr 2021 19:53:33 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Thu, Apr 29, 2021 at 10:44:41AM +0200, Mauro Carvalho Chehab wrote:
> > Em Thu, 29 Apr 2021 09:49:03 +0200 Marco Felsch escreveu:  
> > > On 21-04-29 04:51, Laurent Pinchart wrote:  
> > > > On Tue, Apr 27, 2021 at 02:06:56PM +0200, Marco Felsch wrote:    
> > > > > Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
> > > > > camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
> > > > > with the interleaved IR pixels looks like:
> > > > > 
> > > > >         |  G |  R |  G |  B | ...
> > > > >         +----+----+----+----+---
> > > > >         | IR |  G | IR |  G | ...
> > > > >         +----+----+----+----+---
> > > > >         |  G |  B |  G |  R | ...
> > > > >         +----+----+----+----+---
> > > > >         | IR |  G | IR |  G | ...
> > > > >         +----+----+----+----+---
> > > > >         | .. | .. | .. | .. | ..
> > > > > 
> > > > > [1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf    
> > > > 
> > > > I think we're reaching a limit of the media bus codes model here, due to
> > > > a historical mistake. The four possible Bayer patterns, times the
> > > > different number of bits per pixel, creates a lot of media bus codes,
> > > > and drivers for CSI-2 receivers and IP cores further down the pipeline
> > > > have to support them all.    
> > > 
> > > That's correct but it is not bayer related.  
> > 
> > Err... there are two separate things here:
> > 
> > 1) for the uAPI part, we're not even close to the limit of a 4-bytes
> >    fourcc;
> > 
> > 2) the kAPI is currently sharing the same fourcc from the uAPI,
> >    because it is a lot simpler than doing something different.  
> 
> Please note that we're talking about media bus codes here, not pixel
> formats. Both are part of the UAPI though, and pixel formats suffer from
> a similar issue, but I'd like to focus on the media bus codes first.

Yes, I'm aware of that, but the same principle used by fourcc pixel
formats can also be applied to media bus codes and vice versa[1].

[1] IMO, a kAPI change like that should consider the big picture, 
    and allow using the same process for both, even if we start
    implementing it for media bus (where it makes more sense).

On both cases, we're talking about a 32-bit code (either encoded
as fourcc or via MEDIA_BUS_FMT_* codespace).

Both can be 1:1 mapped to some structure similar to:

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

And new drivers can use such struct, instead of handling the
fourcc/mbus code directly.

Also, this can be gradually implemented, in order to avoid the
need of touching at the existing drivers.

Thanks,
Mauro
