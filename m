Return-Path: <linux-media+bounces-31017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB785A9C2C6
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A68E27AA501
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680B23C8B3;
	Fri, 25 Apr 2025 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="YO1N0ix2"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDDA2356A8;
	Fri, 25 Apr 2025 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571615; cv=none; b=Bi5eVL+o2IwgqiUXzDtSdJMEelRjaW3mazR5PHJcrFJmPLVx2cBJ2V9fnvKf/BGcQMQwd9tH7DBMpq34PVZ3cvAJUF6CNcRaqd5eqf2NKLRm5fNkD3hJ9sRnlvpZKk+sTnAaFYfFnCbtkqDTVheBB8bRdAFJwwxuv8b1uMCdpDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571615; c=relaxed/simple;
	bh=pL6a7vTITX5kkWE9MGLH1BU6Hb4KM83vxU1uj0XZhh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQdIII8HBFBl5blWXyq9y6dRwnM8uOtZS+gI6jXnatA95qTfWmNDpbmMNijPvTDj4r8qQRMVYnuYUSTRrBWRPP8Pd4TA8xqGmX4iPNpsrUFNyerjVXILStT5oI16Q+iLY/Ppm2SfsE4lIrH7o60Vp+2XpPsJ4VZlnP2+pXNb9n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=YO1N0ix2; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZkRcp69rjz1HY3;
	Fri, 25 Apr 2025 09:00:10 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4ZkRcp1SyGz4Q;
	Fri, 25 Apr 2025 09:00:10 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=YO1N0ix2;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745571610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dJwBAdZXMldHFkl0QrKaHnjwuJCR8Ojs5pgRUocE23g=;
	b=YO1N0ix2NNxzzyEc92Zg+Jg6dA+PRp4KujXHrunV9Q5r5AvHQHr4+lj0u6ow8CwUFAvkR4
	xOXF6lBfM/UdkQqM618EimXgD0e0FMpiT97M7WDhc+RgwxVtx1lm1Qjf8vt8SBBlacKZq9
	FeM6QnjlSJf+XYXoiIVj+Ye2i1JAymiS4Ia1ExqKPmLU2P77KLnZV0xveULRsgvhY7YYiK
	EDWC8tMGMe3UHORmXMOMtGAPGrjC7H/QKdsJkYH+5TadXNU2qn+vu9zDYV9AiMpjv6mUu8
	+i1Pe1H30kmj6EyBlmnhvURLRT0IdpIyOccWrBJWTzzJ/Bn/FjnF1SGU6eTIgQ==
X-CM-Envelope: MS4xfKhvMAFM3rn5Q4UPuc4fkiy8+G3CSi0OBFg8WRmoBmUKVAI64xVMdPzFRRQRVrZpsNtsWsy1hNuDoeAFbS/lOFo3jtyYnxvZCddpoFQo3qGWUHSPhgLy F1Ke7v6PrDSBN99POe9ejTResAhx0oDMzEB4gY7UMsTSfA8yhgsc8QK+UUQUwA3Qex7N83/wOHutbQEnQqQEXepYY2H8AeTEbg/v9+kgczXZgF2NwASGYML8 n+2kNGR0maaZ5bDowyfGsBGqKZViqY6mGyBZ5eiEraf3ttPuiFRAhppE1HEZYOWXiqxaCVdETZkTBuDI3H0zid0HIBGMS5GiBlYrrbTUwJUiVaZKAxvV5LwK qRdY4MRg
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=680b4f1a a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=xq3W2uTSAAAA:8 a=EUspDBNiAAAA:8 a=cajtFFVKkiF0S9Jybq0A:9 a=QEXdDO2ut3YA:10 a=P5L7wpMTXyg1GfFA3Gwx:22
Message-ID: <ba2f5862-b503-44d8-9b01-a9a7686808ba@jjverkuil.nl>
Date: Fri, 25 Apr 2025 11:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] media: adv7511-v4l2: use constants for BT.2020
 colorimetry
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250417-adv7511-ec-const-v1-1-74301e17646e@oss.qualcomm.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250417-adv7511-ec-const-v1-1-74301e17646e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 17/04/2025 00:46, Dmitry Baryshkov wrote:
> Replace numeric values with constants from hdmi.h.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Just for future reference: please don't resend. If it is in
https://patchwork.linuxtv.org/ then it will be picked up eventually.

Regards,

	Hans

> ---
>  drivers/media/i2c/adv7511-v4l2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
> index f95a99d85360aa782279a127eee37132f9ad08fb..853c7806de928da2129f603e7cb673440a1fcfac 100644
> --- a/drivers/media/i2c/adv7511-v4l2.c
> +++ b/drivers/media/i2c/adv7511-v4l2.c
> @@ -1370,9 +1370,9 @@ static int adv7511_set_fmt(struct v4l2_subdev *sd,
>  	case V4L2_COLORSPACE_BT2020:
>  		c = HDMI_COLORIMETRY_EXTENDED;
>  		if (y && format->format.ycbcr_enc == V4L2_YCBCR_ENC_BT2020_CONST_LUM)
> -			ec = 5; /* Not yet available in hdmi.h */
> +			ec = HDMI_EXTENDED_COLORIMETRY_BT2020_CONST_LUM;
>  		else
> -			ec = 6; /* Not yet available in hdmi.h */
> +			ec = HDMI_EXTENDED_COLORIMETRY_BT2020;
>  		break;
>  	default:
>  		break;
> 
> ---
> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
> change-id: 20250408-adv7511-ec-const-b46796340439
> 
> Best regards,


