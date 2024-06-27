Return-Path: <linux-media+bounces-14272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3091AD54
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 18:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C231B23D3F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 16:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0FE199EAD;
	Thu, 27 Jun 2024 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="J0BkKl8V"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7761199E95
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719507580; cv=pass; b=rlhFs7tXK+Udsb+nozLVr6CoGAxkTjkNGLFM1XoN43gTzN0LrF88p6viBeBqIcsLhNJ5MGmJ87+vtcbXRV58iJFsjc8UZ47t5sLIxbhfKFR0hOYmuSIOBev1rWH/oH7POz9MNPaK13oyiYZ1VHZ1neL70NqQCGvFtz/vAy9Veuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719507580; c=relaxed/simple;
	bh=Gu0cyC5PLLWmmX/KJtKi0eoTsUO3ZriWeH5pI5ruo8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmjpMcV3fe8UM8sbWRS4j8vdWMG8CD6AFHQqu6WJ8VB04E6neRln5uYrhV+iqKoB0D86dkBtyZ5LbSKSMItaKvEnxzyysJaATpDSv+gMXb60dWgfxCzR38fGzZZ60iRwB33AftYdnkjj6Kzicd2hyA9Uc3jfEBTQ7Z9/lmyvB1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=J0BkKl8V; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4W94YM4zpgz49Pv3;
	Thu, 27 Jun 2024 19:59:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719507575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TZRWgCNPuI/B16yUhfASLehWzjU6E7LAzuC/piugIWg=;
	b=J0BkKl8VeewH6zwte/46wlwSmcPpVzcjh8kwzT1RCVgIG1tpcL4zlV3UjfxHFiyysXEsXc
	DTbvZHB6K+bwLm8hqHtWLwBMdQin62OdfkGS51EP3rd9aiw+wftNNRqXqQY4C5zcCyw269
	LlNhVIIPRQd5ss8zuF10grdN0zK7v+vvyFbJzC389MVqWiT0a9WdeI4wjpR/HKQu3Vbldt
	QFdGphlgY/7rQYPfIcOozU50EKyOp6QxNUXAeqivRbQfG3kL0wOBxwwg0b5Y/KVjKNQW0c
	mxMIbOkV81YGyINGWjojS3QNg3+rWxmjGhO370t36nRCpz5CspCVt80jaHkhFw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719507575; a=rsa-sha256;
	cv=none;
	b=NOBGtEhz1cLLDURZKahD7dHJO6Pioqqznt2FKA0+asghp53OCVym9GEVSlvwOB/y7uyXIq
	86FpgDPZk0pmXpJNl/AJBD0r45XO6rmWMeygZh08SrLdqwsD6vr87iRnImN53z3ufY4lMj
	PRErRblyisfjkwshdhlmFRY1cUwtVk8A+o3sVasLzsMMJKbg9lxAzFIp9erqn0fIEHudgW
	WruDgNWgRNkYat1kVVGuZP9NZ5KWzDVIeK4ugQZpoOdw2UUVUFOAOI9QvgRJWrbvEpdcy8
	dqZrUnRrURqJr817F5hMQGWzOxned0pGbFag+yg+2v2W1CrA5CAbVHDEnaWNbQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719507575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TZRWgCNPuI/B16yUhfASLehWzjU6E7LAzuC/piugIWg=;
	b=F0O/xRBOFmmT9EFyuuJN1F25Y4ZZFFD6bCgndxr2+MdwoTM1kDUW2ZIYKGswMLD1UpQTEr
	xrtFpwP7wvjoqpRx6MQC1OtwGKEz5yG4rQo5qGhWFyu1S4XrSFVs/Bkkk/LNulSpNf0ve+
	msAlfrXGPZvYV2uTblOqbCuN8HVE8uBlDn84U5ApbWvOhTsRLMyakJTCeryA19iDcsm9RG
	GZKugtMjAhpqFReMEGSTpRodU4cqAKjQgDLqQgPl5pKXx2AklPhUSWYySTjE4XsY3NVWTI
	LlvNiAL2zxnkb5gxAAa1KirAhuS5t4nrWUqi698MJH0FgywZ/VQJMKqIMnzv9g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 74EE5634C93;
	Thu, 27 Jun 2024 19:59:35 +0300 (EEST)
Date: Thu, 27 Jun 2024 16:59:35 +0000
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
Message-ID: <Zn2adz-fFpcxvXzm@valkosipuli.retiisi.eu>
References: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
 <20240627143059.300796-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627143059.300796-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

On Thu, Jun 27, 2024 at 04:30:57PM +0200, Jacopo Mondi wrote:
> Add definition and test for 32-bits image formats to the pisp_common.h
> uAPI header.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> ---
> RPi: I found not traces of this in your BSP pisp_types.h header but
> these identifiers are used by libpisp and are part of the pisp_types.h
> header shipped with the library.
> 
> https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/backend/backend_prepare.cpp#L374
> https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/common/pisp_types.h#L137
> 
> in mainline, pisp_types.h has been absorbed by pisp_common.h so I'm
> adding it here (only PISP_IMAGE_FORMAT_bpp_32, as it's the only one used
> by libpisp).
> 
> Could you ack/nack this patch please ?
> ---
> ---
>  include/uapi/linux/media/raspberrypi/pisp_common.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
> index b2522e29c976..031fdaa4da69 100644
> --- a/include/uapi/linux/media/raspberrypi/pisp_common.h
> +++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
> @@ -72,6 +72,8 @@ enum pisp_image_format {
>  	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
>  	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,
> 
> +	PISP_IMAGE_FORMAT_BPP_32                 = 0x00100000,
> +
>  	PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
>  	PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
>  	PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
> @@ -134,6 +136,7 @@ enum pisp_image_format {
>  	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
>  #define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
>  	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
> +#define PISP_IMAGE_FORMAT_bpp_32(fmt) ((fmt) & PISP_IMAGE_FORMAT_BPP_32)

Why lower case "bpp"?

As this isn't a definition of a value as such, I'd call it differently,
e.g. PISP_IMAGE_FORMAT_BPP_IS_32.

>  #define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
>  	((fmt) &                                                               \
>  	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))

-- 
Regards,

Sakari Ailus

