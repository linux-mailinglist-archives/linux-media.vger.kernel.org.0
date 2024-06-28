Return-Path: <linux-media+bounces-14331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169691BDC1
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AED5285FBC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 11:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE3E158208;
	Fri, 28 Jun 2024 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="TsrPqPry"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EAA154433
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575261; cv=pass; b=UG6bi70+yPQzEzxDanPiiOYLhx0f180vUCDylkZ5Lal2W5QVqqtSFugHlxnXiMwiuUvz62aiU7Eu0Ah9TtgnUtDzo92l2ncxqltv5wiabiJYghRlN7JI0V1oJlfHZHURWBA5YtGE9rxpH6/Gkkp/m09hgGrjXzVxibrxrwMKiOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575261; c=relaxed/simple;
	bh=3cHk9tEK2EuX3kgvurju54cS3LYTJObAfIksqe5taes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6CUitTmFeIRvXVwzNnw/Mfo9nMzJYEr532d/zz2Yim+C2Wo1YJ42sITpqtTHtwAy1LC3ibZD9attsx+8qJEu6TZ4vKqDD1NpnSPzPFGOWYiopGAkfswW6mx63a7gFiIq8htuUkYd/VhROHozzYAfOahh2NjF5d4oM673xIEdzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=TsrPqPry; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W9YZn13Vvz49Ptk;
	Fri, 28 Jun 2024 14:47:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719575249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aUvfdcXvBf430hupyM7kCbYt9xwLj4tN09+hSsRAcso=;
	b=TsrPqPryRly2rl1ETJ5YwlNUfkmQGxELr8Yy+E/e9O2OvX7UR9nObCloSybgDRFK2apQg9
	N/dBSPM/wasLG8Lba/kF0Prynes3dUo/UKJw97WS11SDzgRHxifnE5O/MgS5NxHMR9ZnyA
	qhZFqbY3BWDZAvllAX+eBK9VZZaFhY2WNXx/Sms2WIkgdFmEEYrtTKyBLK/jkTE27sYUTG
	P3uhj0AOy7YOb770oNzATJ9ouziXVUq2nG9ZFEuYI76PMYnEnoS4Q0Y0kmSFtu/hnm7iGf
	txbg1j4vI1X2bipl1pT6M4VL7ay4dy170/GD/srpqItajJazw7yZ8jALo1H4tg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719575249; a=rsa-sha256;
	cv=none;
	b=XYTdyMz7ju/LGqmLqR4XTRsv110yrNUrvbjejzjASUBCpkQhkEnun8GfZmws+leeAmD13D
	g+ZzP2Rtki5uJJeL7gdcb3NZ+UIYFeweacM+kNPSqKTgLPn2MVgyjJc744gv2A0m39DoTr
	+m0F94ACgA9i3xveb2+2jlpbzDaWi8lGQbwKeLuJ89AQz8u2on6Z2hfrIS3pd0quapKN/k
	czUpQnzn2pYi1jfrjgNcvltfCTcCF9yalJq24gZqhaRIUV345tWwZ8weteb1+VLpL3hF+u
	xwBk/FN9Z+pgPd8Vqr9KxgCKfsUiC+QJmRECCvpw5yxig1KqiT59Ih76TdfKMw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719575249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aUvfdcXvBf430hupyM7kCbYt9xwLj4tN09+hSsRAcso=;
	b=OhlrPJ9iJzkXuZs26Rgp7FWRrfpNu+TEytacOCykTxKuYWIBL/cwX+rh2shca9ANOaJEyS
	V6wkLwcP/IsCndiDXo0xuK5xvIMSg6jV7tgi6bz9N/xFFyVuOx0dCCmvDquwX+rkmiQ68Z
	CiUJXA7jtpx1KIg8KYHqeH0PXE9aGTMRJ+wGL8f6xT0Sk1+GfVdyrxpaxurNc0A8/mr6YG
	rakujmt7RU0YErpx1LHbjkFXOpkKgLN+qTjlpJsRdIaYr2WeqaPFvJpadGOKE7skUXHeaP
	F5KVdlapXhdgWk9NhELhz0zDfZhpkPMHdHWXQYUA4Mkbk8SbXXG6FMAMe1s5bw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9CDE7634C93;
	Fri, 28 Jun 2024 14:47:28 +0300 (EEST)
Date: Fri, 28 Jun 2024 11:47:28 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/2] media: uapi: pisp_common: Add 32 bpp format test
Message-ID: <Zn6i0BHJFVhQJgz5@valkosipuli.retiisi.eu>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gqcx24icekazg4cqqxmmjoi3yxd6x6etwve3u2la7hhfbzmypa@u5336prltr3c>

On Fri, Jun 28, 2024 at 09:09:10AM +0200, Jacopo Mondi wrote:
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
> 
> If I had to upstream this code from scratch I would use uppercase.

Ack, fine for me then. It's a driver specific header anyway and the
all-important somehow reasonable prefix is there so ok.

-- 
Sakari Ailus

