Return-Path: <linux-media+bounces-5750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D3860DBB
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B90371C22895
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63854C626;
	Fri, 23 Feb 2024 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Np66mtw9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C21222067
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708679737; cv=none; b=CvQvSm6GeR3Ly+PXwmRCW7XSREVR3qCr5qQzStvG4/ybhNFTZnsvagO2yc9n24ukvPPDW2wCa06ur9AF9BfUTJmuv5P3/K/cSNHyUQawwelOIxT3zGBEYWf3NHXM8e0DsSv6Gi+RAiwVZefm56gwkjIqTumttU9zXlzTchc6Suk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708679737; c=relaxed/simple;
	bh=daQJjqeI+fcI+v+rUZeh0C2n7daJhF1fTbHQ/bX+YsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prraxjGfopLI6rM+FJiakAfjaEj0Lot/Qf4yuvsknAhR36rKImBOfEB6CybDB8qQHduKmAkxvk2M8S0UcFI2shJi1EWEPwE++FoAdVKSUSqoN8j7idqydPHnZ+yUK2torZqvzNt0FD540l2VzA7hwpegmvX2zDPiHxDYcllUvc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Np66mtw9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 141719B6;
	Fri, 23 Feb 2024 10:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708679724;
	bh=daQJjqeI+fcI+v+rUZeh0C2n7daJhF1fTbHQ/bX+YsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Np66mtw9UK9kNfr2pGorwk6qiDUROE5baVG2WxFlQjH/zWUMpuBeewctMirbxcY6E
	 p9BxysL8BLbJPUMXuCZnHMHnGvEvTI/n78oxeQA6oLaRPYDQDYOyZ4uO0gshdoF2tR
	 Q3zBc3eRZZMa5vfTRYOesvp1kAEIjeGS/qyIG9mg=
Date: Fri, 23 Feb 2024 10:15:29 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 1/8] media: Add a pixel format for MIPI packed 12bit luma
 only.
Message-ID: <twreqfn35r763hotu23wbdz7fm6marw5s3t7wzn3vinxsbz332@25tnkt2hofqs>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-2-jacopo.mondi@ideasonboard.com>
 <1cd5ff6b9d24588a2fb0aa69cc1e8c0dfb63e597.camel@ndufresne.ca>
 <CAPY8ntBJuZsm+h=zFy59M5u6D5hbwtnrRVEOjwQRWQv-ZyogfQ@mail.gmail.com>
 <05259197166f5077ccbad5a98246b0f257207b8c.camel@ndufresne.ca>
 <CAPY8ntD7ceWJiyHokpv08cfJFpxnW07FGEvdufjtvynkcRSxug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntD7ceWJiyHokpv08cfJFpxnW07FGEvdufjtvynkcRSxug@mail.gmail.com>

Hello

On Mon, Feb 12, 2024 at 11:58:32AM +0000, Dave Stevenson wrote:
> On Fri, 9 Feb 2024 at 21:15, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> >
> > Le vendredi 09 février 2024 à 19:28 +0000, Dave Stevenson a écrit :
> > > Hi Nicolas
> > >
> > > On Fri, 9 Feb 2024 at 17:53, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > >
> > > > Le vendredi 09 février 2024 à 17:48 +0100, Jacopo Mondi a écrit :
> > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > >
> > > > > This is the format used by monochrome 12bit image sensors.
> > > > >
> > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/pixfmt-y12p.rst   | 38 +++++++++++++++++++
> > > > >  .../userspace-api/media/v4l/yuv-formats.rst   |  1 +
> > > > >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> > > > >  include/uapi/linux/videodev2.h                |  1 +
> > > > >  4 files changed, 41 insertions(+)
> > > > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > > > > new file mode 100644
> > > > > index 000000000000..b2eb4a72724d
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-y12p.rst
> > > > > @@ -0,0 +1,38 @@
> > > > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > > > +
> > > > > +.. _V4L2-PIX-FMT-Y12P:
> > > > > +
> > > > > +******************************
> > > > > +V4L2_PIX_FMT_Y12P ('Y12P')
> > > > > +******************************
> > > > > +
> > > > > +Grey-scale image as a MIPI RAW12 packed array
> > > > > +
> > > > > +
> > > > > +Description
> > > > > +===========
> > > > > +
> > > > > +This is a packed grey-scale image format with a depth of 12 bits per
> > > > > +pixel. Two consecutive pixels are packed into 3 bytes. The first 2 bytes
> > > > > +contain the 8 high order bits of the pixels, and the 3rd byte contains the 4
> > > > > +least significants bits of each pixel, in the same order.
> > > >
> > > > This is an interesting arrangement, which make me feel that Y12P is perhaps bit
> > > > too generic ? Perhaps something like:
> > > >
> > > >   V4L2_PIX_FMT_Y12_MIPI
> > > >
> > > > That being said, I don't mind if you reserve the nice and short name for the
> > > > first occurrence of such format in 20 years (it might equally be the last). Will
> > > > they do the same for Y10, by storing 4 bytes of higher 8bit of 4 pixels, and
> > > > packing the remaining lower 2 bits packed in the fif bytes ? Cause for this one,
> > > > we'd have confusion, since CODEC usually just place all the bits in order over 5
> > > > bytes here (which have its own issues of course).
> > >
> > > We already have V4L2_PIX_FMT_Y10P defined for the MIPI packing for
> > > 10bit luma-only.
> > > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-yuv-luma.html
> > >
> > > This is only extending the definitions for the other bit depths using
> > > the same pattern.
> > >

I now wonder why creating two new files instead of adding Y12P and
Y14P to the table of luma-only formats we have in the above mentioned
file.

In the notes at the bottom of the page we can indeed report that the P
variants of the Y10 Y12 and Y14 formats are packed according to the
MIPI CSI-2 specification, even if, as Dave said, this is a pretty
standard convention for the educated readers of the v4l2 spec.

In facts, this is what has been done already for the existing luma
formats in:
af4f45057695 ("media: doc: pixfmt-yuv: Move all luma-only YUV formats to common file")

So I guess it's correct to keep expanding the existing file instead of
adding new ones. Sorry for not having realized it earlier.


> > > Adding the P is also the same pattern as for the Bayer formats -
> > > V4L2_PIX_FMT_SRGGB10 for the 10bit unpacked to 16bit, and
> > > V4L2_PIX_FMT_SRGGB10P for the MIPI packed variant.
> > >
> > > I'm not inventing anything new here :)
> >
> > A bit sad, but what can we do, I keep missing patches ;-P
>
> Not recently though.
>
> V4L2_PIX_FMT_Y10P was added in July 2018. [1]
> The use of V4L2_PIX_FMT_Sxxxx10P for Bayer format MIPI 10 bit packing
> was added in Dec 2014 [2]
>
>   Dave
>
> [1] 6e15bec49f36 media: v4l: Add new 10-bit packed grayscale format
> [2] 4353e36ee84d [media] v4l: Add packed Bayer raw10 pixel formats
>
> > Nicolas
> >
> > >
> > >   Dave
> > >
> > > > > +
> > > > > +**Byte Order.**
> > > > > +Each cell is one byte.
> > > > > +
> > > > > +.. tabularcolumns:: |p{2.2cm}|p{1.2cm}|p{1.2cm}|p{3.1cm}|
> > > > > +
> > > > > +
> > > > > +.. flat-table::
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       2 1 1 1
> > > > > +
> > > > > +
> > > > > +    -  -  start + 0:
> > > > > +       -  Y'\ :sub:`00high`
> > > > > +       -  Y'\ :sub:`01high`
> > > > > +       -  Y'\ :sub:`01low`\ (bits 7--4)
> > > > > +
> > > > > +          Y'\ :sub:`00low`\ (bits 3--0)
> > > > > +
> > > > > diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > > > index 24b34cdfa6fe..7c9ccfdd94cd 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> > > > > @@ -267,6 +267,7 @@ image.
> > > > >      pixfmt-packed-yuv
> > > > >      pixfmt-yuv-planar
> > > > >      pixfmt-yuv-luma
> > > > > +    pixfmt-y12p
> > > > >      pixfmt-y8i
> > > > >      pixfmt-y12i
> > > > >      pixfmt-uv8
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > index 33076af4dfdb..483498c55899 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > @@ -1311,6 +1311,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > > > >       case V4L2_PIX_FMT_Y16_BE:       descr = "16-bit Greyscale BE"; break;
> > > > >       case V4L2_PIX_FMT_Y10BPACK:     descr = "10-bit Greyscale (Packed)"; break;
> > > > >       case V4L2_PIX_FMT_Y10P:         descr = "10-bit Greyscale (MIPI Packed)"; break;
> > > > > +     case V4L2_PIX_FMT_Y12P:         descr = "12-bit Greyscale (MIPI Packed)"; break;
> > > > >       case V4L2_PIX_FMT_IPU3_Y10:     descr = "10-bit greyscale (IPU3 Packed)"; break;
> > > > >       case V4L2_PIX_FMT_Y8I:          descr = "Interleaved 8-bit Greyscale"; break;
> > > > >       case V4L2_PIX_FMT_Y12I:         descr = "Interleaved 12-bit Greyscale"; break;
> > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > > > index a8015e5e7fa4..11ebf9b22ccb 100644
> > > > > --- a/include/uapi/linux/videodev2.h
> > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > @@ -598,6 +598,7 @@ struct v4l2_pix_format {
> > > > >  /* Grey bit-packed formats */
> > > > >  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
> > > > >  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> > > > > +#define V4L2_PIX_FMT_Y12P    v4l2_fourcc('Y', '1', '2', 'P') /* 12  Greyscale, MIPI RAW12 packed */
> > > > >  #define V4L2_PIX_FMT_IPU3_Y10                v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
> > > > >
> > > > >  /* Palette formats */
> > > >
> >

