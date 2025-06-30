Return-Path: <linux-media+bounces-36314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76273AEE14B
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9329D3A53B7
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAC728C87A;
	Mon, 30 Jun 2025 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="azRt7egx"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5195F9D6;
	Mon, 30 Jun 2025 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294539; cv=none; b=XjNWELuEpDCriYe2//XVTPbhRctv1IOY9rJ93iRkfuk4Mb2KjOlgN66I31FXddt+atfjdSJghnHK0pr4AXUp6VeTCjrFd/HYbklBVssPiBOu31Qk1KE5k4dhV06HKIq3H74adKDWaWH6cqNaT1c3rKFRTz7fdsW1o4A2fCaDbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294539; c=relaxed/simple;
	bh=7rRLWTSIYgRgKpl7chljwX5P3VJunIFaGVfmvydxrJY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lZtzNi5EFwMlU5vuDFPc8741IKY393ODwmOf8yGTuPJPf/rWu2yd9aMV86wvYv/zLoVH3VWl6wttsCcZ3BYtJHWFgvracWW2oRDcOeZkXM5n7ysuRa/yg9waDC5642i1YoHJtVyhkpfPk5+AQAi60HIN5zU1pkVK/mY7TfNnI+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=azRt7egx; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bW84x3lD3z19T1;
	Mon, 30 Jun 2025 14:42:09 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bW84x0Dbkz2xWq;
	Mon, 30 Jun 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=azRt7egx;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1751294529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Oefc1I1TGBbFAU5VsJxxdk7pMhWRjgBMKnVGuJzRmaw=;
	b=azRt7egxZ37ieo+2aeLq7D3TCyVFZ1LQVAzDxu2GOI4OwhoHxphePeA3vouOxKLgy2mlVe
	FwR5Eu9m9Mbi4ulOcQH22CxzPOMqdFF5ZKQ0fDHJc7WZ+i0fA+nJ73A++TFrVj3d1QYcWY
	x0LHkuusfrAIaNXHLkNr1PU05WG5zRAUEb4jtsqVyJRCRvK8v11ZXJlSzIyo9zNAoxWKTx
	6Jx6XO2Ea9iElYf9HXKKWg/qaL2yoqv7WtnjmsemiUowTE4cigYVs1ldN8ixqlH/JXLLhX
	QP/TdGKjOTbpGQ6P02DcPKo0ojMQID9e8U1qA0d+tzIGdpqP99q8enYibDttXg==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=6862a241 a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=cm27Pg_UAAAA:8 a=xOd6jRPJAAAA:8 a=7tNz1FnvlWAMBOXk5aYA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfC9CKFQdDf0bIrpch3LVRP2Zf0Fi7GbcxYzlxlva5c775EYS7FsttBA3Zwyzdpf+9K5MF5pcEf+S89ieBCeWFB0IsY2XR31biyz2tECzRzdksARa1ts+ h0heybhZ06L6Qi/CtOcOVWDcXtEGMqsOEyy3LOIR6tmpHKyMI4jTPm68GDF5IqYK0P0N//ojNQ81CR9/aTvzBMgeqWScc4qE7libJ3f4rIuxH2fw2E8Qdy/z HwVvB2c0Em66FYvKLVoO6KzikkS/aZdlTTKvPbOvC53ZGY5999CG9szX9AkwYF2yLp3+2rfyW2NdjRJnlXFaaM/1TW88CO/ZwwaeAk1TYAaXYHAG/q1ao8/B 4hkl89aw1TQFo6W9a5+cEV+irOYcqdUOMfCcMw6+7xASGkR0nsU=
Message-ID: <a8e3b608-f26b-42dc-b69a-df51afc5edf3@jjverkuil.nl>
Date: Mon, 30 Jun 2025 16:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: hans@jjverkuil.nl
Subject: Re: [PATCH v3 7/8] media: core: export v4l2_translate_cmd
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
 <20250630-uvc-grannular-invert-v3-7-abd5cb5c45b7@chromium.org>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250630-uvc-grannular-invert-v3-7-abd5cb5c45b7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 30/06/2025 16:20, Ricardo Ribalda wrote:
> video_translate_cmd() can be useful for drivers to convert between the
> VIDIOC_*32 and VIDIOC_ defines. Let's export it.
> 
> Now that the function is exported, use this opportunity to rename the
> function with the v4l2_ prefix, that is less ambiguous than video_
> 
> The VIDIOC_*32 defines are not accessible by the drivers, they live in
> v4l2-compat-ioctl32.c.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 5 +++--
>  include/media/v4l2-ioctl.h           | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 650dc1956f73d2f1943b56c42140c7b8d757259f..1e22ca898ab77e581d78c1a618e1de0e57281cde 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3245,7 +3245,7 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>  	return ret;
>  }
>  
> -static unsigned int video_translate_cmd(unsigned int cmd)
> +unsigned int v4l2_translate_cmd(unsigned int cmd)
>  {
>  #if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
>  	switch (cmd) {
> @@ -3266,6 +3266,7 @@ static unsigned int video_translate_cmd(unsigned int cmd)
>  
>  	return cmd;
>  }
> +EXPORT_SYMBOL(v4l2_translate_cmd);

Please use EXPORT_SYMBOL_GPL.

With that change:

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

>  
>  static int video_get_user(void __user *arg, void *parg,
>  			  unsigned int real_cmd, unsigned int cmd,
> @@ -3426,7 +3427,7 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  	size_t  array_size = 0;
>  	void __user *user_ptr = NULL;
>  	void	**kernel_ptr = NULL;
> -	unsigned int cmd = video_translate_cmd(orig_cmd);
> +	unsigned int cmd = v4l2_translate_cmd(orig_cmd);
>  	const size_t ioc_size = _IOC_SIZE(cmd);
>  
>  	/*  Copy arguments into temp kernel buffer  */
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index c6ec87e88dfef9e6cfe1d1fb587c1600882fb14d..82695c3a300a73219f262fb556ed61a8f09d273e 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -679,6 +679,7 @@ long int v4l2_compat_ioctl32(struct file *file, unsigned int cmd,
>  #endif
>  
>  unsigned int v4l2_compat_translate_cmd(unsigned int cmd);
> +unsigned int v4l2_translate_cmd(unsigned int cmd);
>  int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd);
>  int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd);
>  int v4l2_compat_get_array_args(struct file *file, void *mbuf,
> 


