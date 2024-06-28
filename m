Return-Path: <linux-media+bounces-14307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCD91B7CF
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 09:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3225B21C1D
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 07:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21BF13E037;
	Fri, 28 Jun 2024 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O9pT8xWs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD2125AC
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719558558; cv=none; b=ACPnf0YnVHmVmWl7Crp8o3fj9y0xsY9oU04jXo9moTtNK3jI5U9FDd79i9C3b4u4HwxrzPRm6PPMBYf8r6hpc6lmc1v+dkXVAG7vln4rrH3ifXyxMfJZu1jqflOzRPOFIxpdxfDy0lYqKPIUeoiGMemr5pPSYLuafE9fliNyJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719558558; c=relaxed/simple;
	bh=RWeTl7a5l/haa2WRwHkXJmQUf/RzG4iq30YBO0y3TjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HL7ktWi30E0MACsyOlN7W8fuh5Uh0Q8aSz1fraiK+Wut6HH+tqC8l/O1ItIJ94msxQb/8/XqO0R6cv8ZhJWuaKvWGSAFBxmfrDiQEEXRPVQbfbxXVs/JtS7+LEnB4irtga/xOR59saADUzaAJxk+0kPo03m0oH19oKeANhc1vFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O9pT8xWs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEC58735;
	Fri, 28 Jun 2024 09:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719558528;
	bh=RWeTl7a5l/haa2WRwHkXJmQUf/RzG4iq30YBO0y3TjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9pT8xWscvtD84zzg//nJEax/ucbWt8hwXX64Ttu+Y42E1CkZL232Pzwr94bez8pv
	 OTWZ3N6VGspp9bTbgdcC258Mr6vlg0E7UzG5s7Xy9ojyGQ63nUuJCzJB14NoJFiJLO
	 nzCYuz4R4iYHsafZ7MUjLRQjV8qpGqQR1+Sc53r0=
Date: Fri, 28 Jun 2024 09:09:10 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Naushir Patuck <naush@raspberrypi.com>, David Plowman <david.plowman@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/2] media: uapi: pisp_common: Add 32 bpp format test
Message-ID: <gqcx24icekazg4cqqxmmjoi3yxd6x6etwve3u2la7hhfbzmypa@u5336prltr3c>
References: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
 <20240627143059.300796-3-jacopo.mondi@ideasonboard.com>
 <Zn2adz-fFpcxvXzm@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zn2adz-fFpcxvXzm@valkosipuli.retiisi.eu>

Hi Sakari

On Thu, Jun 27, 2024 at 04:59:35PM GMT, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Jun 27, 2024 at 04:30:57PM +0200, Jacopo Mondi wrote:
> > Add definition and test for 32-bits image formats to the pisp_common.h
> > uAPI header.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > ---
> > RPi: I found not traces of this in your BSP pisp_types.h header but
> > these identifiers are used by libpisp and are part of the pisp_types.h
> > header shipped with the library.
> >
> > https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/backend/backend_prepare.cpp#L374
> > https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/common/pisp_types.h#L137
> >
> > in mainline, pisp_types.h has been absorbed by pisp_common.h so I'm
> > adding it here (only PISP_IMAGE_FORMAT_bpp_32, as it's the only one used
> > by libpisp).
> >
> > Could you ack/nack this patch please ?
> > ---
> > ---
> >  include/uapi/linux/media/raspberrypi/pisp_common.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
> > index b2522e29c976..031fdaa4da69 100644
> > --- a/include/uapi/linux/media/raspberrypi/pisp_common.h
> > +++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
> > @@ -72,6 +72,8 @@ enum pisp_image_format {
> >  	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
> >  	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,
> >
> > +	PISP_IMAGE_FORMAT_BPP_32                 = 0x00100000,
> > +
> >  	PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
> >  	PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
> >  	PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
> > @@ -134,6 +136,7 @@ enum pisp_image_format {
> >  	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
> >  #define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
> >  	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
> > +#define PISP_IMAGE_FORMAT_bpp_32(fmt) ((fmt) & PISP_IMAGE_FORMAT_BPP_32)
>
> Why lower case "bpp"?

No idea, I don't like it but the existing

PISP_IMAGE_FORMAT_bps_8
PISP_IMAGE_FORMAT_bps_10
PISP_IMAGE_FORMAT_bps_12
PISP_IMAGE_FORMAT_bps_16
PISP_IMAGE_FORMAT_three_channel
PISP_IMAGE_FORMAT_single_channel

etc etc

are all lowecase.

Also it is not clear to me why this is _bpp_ the other _bps_.

If I had to upstream this code from scratch I would use uppercase.

>
> As this isn't a definition of a value as such, I'd call it differently,
> e.g. PISP_IMAGE_FORMAT_BPP_IS_32.
>
> >  #define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
> >  	((fmt) &                                                               \
> >  	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
>
> --
> Regards,
>
> Sakari Ailus

