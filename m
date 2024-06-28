Return-Path: <linux-media+bounces-14308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2DA91B84C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 09:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9493285C65
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 07:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B4E13FD69;
	Fri, 28 Jun 2024 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v7Zq96y6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D32D05E
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719559731; cv=none; b=mBTE0aT2is34ODxw9dxEUo2evhBXFLAOv/se38sXDczHcpd415kNvAqHhjqMCMcqudYkR2xlqa2mwh9y8GJFiMlGRU20gjRIO0L3Vi/0f5fWiWPo9vp4L819SiGDoftzZcPRr5d2opv0v8MdJF3C1Y3Ls74ttqAmewfEG6orFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719559731; c=relaxed/simple;
	bh=gjUXV4hczxKd8sx+zVG7dLKE04dHK8VZAip5Kul1qkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL6bY2tBXTIDZtmxC90Je52/K8bHEnYMOtK1d5BpPwtmEu7aGP7adnwpvUOCHuMfa1ycDf5I7tp0Ncom3Gt91KTzdZsC4Y4sxahgGjemDSIXFvLDLjBk6UiRsRB/QJ0aGM63n9IzotyMJr/HrTAF+bda0RgiveZQEAjVV7Rt3Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v7Zq96y6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CE52735;
	Fri, 28 Jun 2024 09:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719559703;
	bh=gjUXV4hczxKd8sx+zVG7dLKE04dHK8VZAip5Kul1qkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v7Zq96y6LbP+MICPw+Rj/vmBONX+8Nf3QroSOvl+wYxam9RYjepC/Fdj/+MSDWdck
	 30YoPuwwP/DvOp/UVHQykC+9eIdqvk6WrBHSf5TP+6u53vJnXsSkTC84BP/YAPrW4k
	 TMVsD3BzGVqRmHvN2hmsVkSp58EP2VRUI+1fgKHs=
Date: Fri, 28 Jun 2024 09:28:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Naushir Patuck <naush@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/2] media: uapi: pisp_common: Add 32 bpp format test
Message-ID: <v6v3o5g5xadwoijfkpwkknuipoehjgkbnsslew64pmh4c2ju4z@crtyc2hd4ghr>
References: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
 <20240627143059.300796-3-jacopo.mondi@ideasonboard.com>
 <Zn2adz-fFpcxvXzm@valkosipuli.retiisi.eu>
 <gqcx24icekazg4cqqxmmjoi3yxd6x6etwve3u2la7hhfbzmypa@u5336prltr3c>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gqcx24icekazg4cqqxmmjoi3yxd6x6etwve3u2la7hhfbzmypa@u5336prltr3c>

Hi again

On Fri, Jun 28, 2024 at 09:09:10AM GMT, Jacopo Mondi wrote:
> Hi Sakari
>
> On Thu, Jun 27, 2024 at 04:59:35PM GMT, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Thu, Jun 27, 2024 at 04:30:57PM +0200, Jacopo Mondi wrote:
> > > Add definition and test for 32-bits image formats to the pisp_common.h
> > > uAPI header.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >
> > > ---
> > > RPi: I found not traces of this in your BSP pisp_types.h header but
> > > these identifiers are used by libpisp and are part of the pisp_types.h
> > > header shipped with the library.
> > >
> > > https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/backend/backend_prepare.cpp#L374
> > > https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/common/pisp_types.h#L137
> > >
> > > in mainline, pisp_types.h has been absorbed by pisp_common.h so I'm
> > > adding it here (only PISP_IMAGE_FORMAT_bpp_32, as it's the only one used
> > > by libpisp).
> > >
> > > Could you ack/nack this patch please ?
> > > ---
> > > ---
> > >  include/uapi/linux/media/raspberrypi/pisp_common.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
> > > index b2522e29c976..031fdaa4da69 100644
> > > --- a/include/uapi/linux/media/raspberrypi/pisp_common.h
> > > +++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
> > > @@ -72,6 +72,8 @@ enum pisp_image_format {
> > >  	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
> > >  	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,
> > >
> > > +	PISP_IMAGE_FORMAT_BPP_32                 = 0x00100000,
> > > +
> > >  	PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
> > >  	PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
> > >  	PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
> > > @@ -134,6 +136,7 @@ enum pisp_image_format {
> > >  	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
> > >  #define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
> > >  	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
> > > +#define PISP_IMAGE_FORMAT_bpp_32(fmt) ((fmt) & PISP_IMAGE_FORMAT_BPP_32)
> >
> > Why lower case "bpp"?
>
> No idea, I don't like it but the existing
>
> PISP_IMAGE_FORMAT_bps_8
> PISP_IMAGE_FORMAT_bps_10
> PISP_IMAGE_FORMAT_bps_12
> PISP_IMAGE_FORMAT_bps_16
> PISP_IMAGE_FORMAT_three_channel
> PISP_IMAGE_FORMAT_single_channel
>
> etc etc
>
> are all lowecase.
>
> Also it is not clear to me why this is _bpp_ the other _bps_.

Ah, https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
at page 10 provides a description.

The _bps_ identify the bits-per-sample while the _bpp_32 describe
RGB formats where a single pixel is packed in 32 bits. As the
datasheet uses _bps_ and _bpp_ I would keep using them here.

Also, I can use uppercase for all macros here if preferred (I'll send
a patch for libpisp in case)

>
> If I had to upstream this code from scratch I would use uppercase.
>
> >
> > As this isn't a definition of a value as such, I'd call it differently,
> > e.g. PISP_IMAGE_FORMAT_BPP_IS_32.
> >
> > >  #define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
> > >  	((fmt) &                                                               \
> > >  	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
> >
> > --
> > Regards,
> >
> > Sakari Ailus

