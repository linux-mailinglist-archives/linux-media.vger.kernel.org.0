Return-Path: <linux-media+bounces-5754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C9860E94
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193FE1F22332
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8915CDCA;
	Fri, 23 Feb 2024 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CpnixD7+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E25C8F8
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708681540; cv=none; b=NZDeimjMYV6ESoXAtuFgQ40aYI+2twYRqEl8cY+2ke/dW+HghP0DC8qij+PClpC39uSy2OSEmaOLDoApEH8EzlguBWwcBniYXB8r9wRBxSyTnBiO+4kS63YnbjweqEmf4zGosALtkrPNr0xc2qf07QwN9+4CnD+RLIWgkWUri6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708681540; c=relaxed/simple;
	bh=T/ycFm6OqQjisrML/lmb8xC5p3xXUa9tcvJlLkvc9Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rs0BlczPPdmu7j/5YM2YsyydnLW7oQ4yC02g4OH7dZXsciH/+2VvhOAdYet+AhibDKFgnLGgnZ6/qY4MtyVXiQ1b7xrNoZfmzCoKlR+0g8ugjTxeN0H60dqUz9ArHPSTl5052kOPj3+35oW+UfYkkJL1yfGXxii88XTk4zWmVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CpnixD7+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 836F09B6;
	Fri, 23 Feb 2024 10:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708681526;
	bh=T/ycFm6OqQjisrML/lmb8xC5p3xXUa9tcvJlLkvc9Lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpnixD7+1+iFM4KV43p24hwuhShupnh7QxYaw0bXjTCOnXRYqnja7NLCPc1Jc/YaU
	 9XXtV5ppUol4nr4covzM+ougcnEJCH+KxLvpdszOLolBybd2mU5jQaqLH35mMrieP4
	 tF0eX0yw39100qRdGjZJEydywaKXuJgPJSesFESA=
Date: Fri, 23 Feb 2024 10:45:32 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 3/8] media: Add a pixel format for BRG48 and RGB48
Message-ID: <jj6dqxxdzura5bikml6of4discv2oegmxn5vfl42ywvdutgwo3@eu2jmxcolbib>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-4-jacopo.mondi@ideasonboard.com>
 <170750015052.493890.8248324138903208198@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170750015052.493890.8248324138903208198@ping.linuxembedded.co.uk>

Hi Kieran

On Fri, Feb 09, 2024 at 05:35:50PM +0000, Kieran Bingham wrote:
> In $SUBJECT s/BRG48/BGR48/
>
>
> The other references all look like they state BGR correctly so with that
> fixed:
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> I think I heard you might have run this through some new linux-media CI
> system. Does that produce artifacts that make it easy to see the
> produced documentation? That would be easier to look at than the source
> to see the table.
>

The pipeline fails at checkpatch stage
https://gitlab.freedesktop.org/linux-media/media-staging/-/pipelines/1099269

and does not continue further.

As in this case the checkpatch errors are to be ignored, I opened an
issue asking for pipelines not to be stopped if checkpatch fails
https://gitlab.freedesktop.org/linux-media/media-ci/-/issues/25

Thanks
  j

> --
> Kieran
>
>
>
> Quoting Jacopo Mondi (2024-02-09 16:48:18)
> > Add BGR48 and RGB48 16-bit per component image formats.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 39 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c         |  2 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
> >  include/uapi/linux/videodev2.h                |  4 ++
> >  4 files changed, 47 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > index b71b80d634d6..458308ae4eb8 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > @@ -996,6 +996,45 @@ arranged in little endian order.
> >
> >      \normalsize
> >
> > +16 Bits Per Component
> > +=====================
> > +
> > +These formats store an RGB triplet in six bytes, with 16 bits per component.
> > +
> > +.. raw:: latex
> > +
> > +    \small
> > +
> > +.. flat-table:: RGB Formats With 16 Bits Per Component
> > +    :header-rows:  1
> > +
> > +    * - Identifier
> > +      - Code
> > +      - Byte 1-0
> > +      - Byte 3-2
> > +      - Byte 5-4
> > +    * .. _V4L2-PIX-FMT-BGR48:
> > +
> > +      - ``V4L2_PIX_FMT_BGR48``
> > +      - 'BGR6'
> > +
> > +      - B\ :sub:`15-0`
> > +      - G\ :sub:`15-0`
> > +      - R\ :sub:`15-0`
> > +      -
> > +    * .. _V4L2-PIX-FMT-RGB48:
> > +
> > +      - ``V4L2_PIX_FMT_RGB48``
> > +      - 'RGB6'
> > +
> > +      - R\ :sub:`15-0`
> > +      - G\ :sub:`15-0`
> > +      - B\ :sub:`15-0`
> > +
> > +.. raw:: latex
> > +
> > +    \normalsize
> > +
> >  Deprecated RGB Formats
> >  ======================
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index d34d210908d9..ff4b4d2de9d2 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -253,6 +253,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >                 { .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_BGR48_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +               { .format = V4L2_PIX_FMT_BGR48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > +               { .format = V4L2_PIX_FMT_RGB48, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_ABGR64_12, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_RGBA1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> >                 { .format = V4L2_PIX_FMT_RGBX1010102, .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 24f52485e59c..3c9b5b2f456c 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1298,6 +1298,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >         case V4L2_PIX_FMT_RGBX1010102:  descr = "32-bit RGBX 10-10-10-2"; break;
> >         case V4L2_PIX_FMT_RGBA1010102:  descr = "32-bit RGBA 10-10-10-2"; break;
> >         case V4L2_PIX_FMT_ARGB2101010:  descr = "32-bit ARGB 2-10-10-10"; break;
> > +       case V4L2_PIX_FMT_BGR48:        descr = "48-bit BGR 16-16-16"; break;
> > +       case V4L2_PIX_FMT_RGB48:        descr = "48-bit RGB 16-16-16"; break;
> >         case V4L2_PIX_FMT_BGR48_12:     descr = "12-bit Depth BGR"; break;
> >         case V4L2_PIX_FMT_ABGR64_12:    descr = "12-bit Depth BGRA"; break;
> >         case V4L2_PIX_FMT_GREY:         descr = "8-bit Greyscale"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 94a0373e8234..2782c7962974 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -584,6 +584,10 @@ struct v4l2_pix_format {
> >  #define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
> >  #define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
> >
> > +/* RGB formats (6 bytes per pixel) */
> > +#define V4L2_PIX_FMT_BGR48 v4l2_fourcc('B', 'G', 'R', '6') /* 16  BGR-16-16-16 */
> > +#define V4L2_PIX_FMT_RGB48 v4l2_fourcc('R', 'G', 'B', '6') /* 16  RGB-16-16-16 */
> > +
> >  /* Grey formats */
> >  #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
> >  #define V4L2_PIX_FMT_Y4      v4l2_fourcc('Y', '0', '4', ' ') /*  4  Greyscale     */
> > --
> > 2.43.0
> >

