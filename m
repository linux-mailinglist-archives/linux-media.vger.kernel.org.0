Return-Path: <linux-media+bounces-34862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C714BADA9C6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19AAC17223A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 07:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B111213E74;
	Mon, 16 Jun 2025 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="Cirxe2KQ"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29992116E7;
	Mon, 16 Jun 2025 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059792; cv=none; b=O7j1ni1k/Os+9ocp+svZ00caOwkPuugSb706OTXDg9x4BBL+Nk5eBP1M7YpGthM19WglqLhyKGcFmSLppcTCREx7vggCCoto3jhCjyKIL1skbFAP+KpDUZgjsfn+z3f06v+EvQiBJKFhlN32hg4mkDgrp4LB6suDEGp85Z/eG8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059792; c=relaxed/simple;
	bh=sdOv8I5FszEKtA9uQQNoGfF6Znmcu/87+GwqjzHPmG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhgW5U8q2Nq1P0wDByEtvTFewfFz+Pb+TeLu/18jYQJhvIl/E81dZOwo9ApeKA9lLNAgh4mK1p9m9ZKXq9Ns+Mokbq9CorNQgrsbBprsM7Kw6Hn1saZgnC5roQbLqmNX9HXRLvi8w+Q2DePefYjNO+yg/gDqOlzd1rUSeDsR5tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=Cirxe2KQ; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bLMRh5cr2z1BNS;
	Mon, 16 Jun 2025 07:42:56 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bLMRh0HYlz2xTl;
	Mon, 16 Jun 2025 07:42:56 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=Cirxe2KQ;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750059776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ji9EjV2f/+C+4sR5G+qqR2R1PnJeGvOchiXD3Nn58Fo=;
	b=Cirxe2KQR/k/ycrZxTIx0eGE8pkP0AzTROZeEbuA0xnkO+xORVklOKhHf/q9GOt22EGF+Z
	9k9cZ32LUZ6sCqC+wcJu627YMLkJOndkYloRnFfQ+z/jGb3qn2+N/TfT9X9nDVtFJn9n6X
	thp/2uuspI3+BwdroQMeB7e/IKpM00roSeOG19CS5EljDL50jvU9dPssGonbfLlFCkc4DY
	kUF5MwI4DJ/rfnqIi7mpTbhxeOG1PvwaAth9j1vT5hjSdW4dQ6Z1xjPg6fGq0E2VXS9ICZ
	csT9WlZpTlFlgpyUqdaNC2dtJoW8cHmCWppCabGJbaikMClTDtG35lyM1qNCfA==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=684fcb00 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=0Q78ZbYSvavFInoFntYA:9 a=QEXdDO2ut3YA:10
Message-ID: <1f014140-a4fe-400c-8ba8-3ad0a42375d8@jjverkuil.nl>
Date: Mon, 16 Jun 2025 09:42:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] media: gc2145: Fix the RGB MBUS format
To: Maxime Ripard <mripard@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
 <20250612-csi-bgr-rgb-v1-4-dc8a309118f8@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250612-csi-bgr-rgb-v1-4-dc8a309118f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 12/06/2025 14:53, Maxime Ripard wrote:
> The GalaxyCore GC2145 is an MIPI-CSI2 sensor. is an HDMI to MIPI-CSI2

Is it a sensor or an HDMI-to-CSI bridge? This looks like a copy-and-paste
mistake.

Regards,

	Hans

> bridge. Among others, it support the MIPI-CSI2 RGB565 format, listed in
> the driver as MEDIA_BUS_FMT_RGB565_1X16.
> 
> Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB565_1X16 to
> V4L2_PIX_FMT_RGB565.
> 
> However, V4L2_PIX_FMT_RGB565 is defined as having its color components
> in the R, G and B order, from left to right. MIPI-CSI2 however defines
> the RGB565 format with blue first.
> 
> This essentially means that the R and B will be swapped compared to what
> V4L2_PIX_FMT_RGB565 defines.
> 
> The proper MBUS format would be BGR565, so let's use that.
> 
> Fixes: 03cc7fefbb09 ("media: i2c: gc2145: Galaxy Core GC2145 sensor support")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/media/i2c/gc2145.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
> index ba02161d46e723d14e8670ef89ba10b270d7d178..12ce1c7aa0a9e028bd7d4c84356e0e166294a1f6 100644
> --- a/drivers/media/i2c/gc2145.c
> +++ b/drivers/media/i2c/gc2145.c
> @@ -579,11 +579,11 @@ static const struct gc2145_format supported_formats[] = {
>  		.colorspace	= V4L2_COLORSPACE_SRGB,
>  		.datatype	= MIPI_CSI2_DT_YUV422_8B,
>  		.output_fmt	= 0x03,
>  	},
>  	{
> -		.code		= MEDIA_BUS_FMT_RGB565_1X16,
> +		.code		= MEDIA_BUS_FMT_BGR565_1X16,
>  		.colorspace	= V4L2_COLORSPACE_SRGB,
>  		.datatype	= MIPI_CSI2_DT_RGB565,
>  		.output_fmt	= 0x06,
>  		.switch_bit	= true,
>  	},
> @@ -696,11 +696,11 @@ static int gc2145_init_state(struct v4l2_subdev *sd,
>  	struct v4l2_rect *crop;
>  
>  	/* Initialize pad format */
>  	format = v4l2_subdev_state_get_format(state, 0);
>  	gc2145_update_pad_format(gc2145, &supported_modes[0], format,
> -				 MEDIA_BUS_FMT_RGB565_1X16,
> +				 MEDIA_BUS_FMT_BGR565_1X16,
>  				 V4L2_COLORSPACE_SRGB);
>  
>  	/* Initialize crop rectangle. */
>  	crop = v4l2_subdev_state_get_crop(state, 0);
>  	*crop = supported_modes[0].crop;
> 


