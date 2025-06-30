Return-Path: <linux-media+bounces-36315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8734AEE15C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 16:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3992D188E823
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E0628C87F;
	Mon, 30 Jun 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="CnaA+VsE"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C5328C868;
	Mon, 30 Jun 2025 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294606; cv=none; b=UneeGDv1chDfDqywVNa1VhR/nDdB850Eywf1ZB1eSpdFibFVAXoUApqfGQ8DaVy0iTkNPmKxNYM3TN3b+JlaM0TnPFRKslZq8KXPf3Kpm03WHoURgTNctJ5zJxJalzP2WWbCU5cblBKUNb0S9g5taGJNfzgpslN6GkE+uttF6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294606; c=relaxed/simple;
	bh=ilmhCUcpL/i5Mksi9L81Yb0NbqlLiM9joUwzKLfdgFM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JBc9VFic7H2u4JdtN3AwJZFnCx5eLtelVvfB0nO82PepyDqklAH/ziYh1mVf5mkIApTz6e4aYOlw5wQw0c1p7HwA9+e40oVat8jh304k+EvDQNzvARBSubvGHIRDX6vYnmk3oWEHYieLyrnX48Zf+K54qzaAye8ipaPsnEXLvmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=CnaA+VsE; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bW86K2f5Yz19Vq;
	Mon, 30 Jun 2025 14:43:21 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.108]) by freedom.nl (Postfix) with ESMTPSA id 4bW86J6jHGz2xWq;
	Mon, 30 Jun 2025 14:43:20 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=CnaA+VsE;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1751294601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HgIxYYWW7PGDTgooNb8M5sfCGnHXfJotXMCL7q2P04g=;
	b=CnaA+VsE7wLrE1veVf2zmo9ECiE4Bhz3w3gZa5Gx+GAjA67SPDAVp3ASzjMqIFPAwbfx7z
	sIGV5kCjR2W8NCKEUz2VsARYOXcmIxuAT/dOdoAFXozo1B3NEx5zGgvrZpVTggP+OCjpOG
	iajtEUR5JzcwY/YVLV+0BTb9jUjv5/WUCCfXfGrZOtIRyv2HlBJfuiW59IWqvbquSQLEhS
	SxzcK6UqS9argctMI5jSm44qp+N4AlX6to5qSCssm/oYnSK5IJzx9q74+HfT+47YAfqbs1
	TG6ZhVVR6vQPl5np9XOP6/JGWmMEenjgF5kMc6eUp2nl4vPseYay9blhNDUdog==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=6862a289 a=IkcTkHD0fZMA:10 a=WN6_cwnCAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=Za3Eev7SAAAA:8 a=T8oQY5rHyaLtZB5ehecA:9 a=QEXdDO2ut3YA:10 a=ndfOWLLM0rR49n6Yv1rF:22 a=I3fWsOZ8Wfyo0pj9SUN0:22
Message-ID: <08670ad6-063e-4d56-a58d-9b8bb5520b54@jjverkuil.nl>
Date: Mon, 30 Jun 2025 16:43:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v3 8/8] media: uvcvideo: uvc_v4l2_unlocked_ioctl: Invert
 PM logic
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250630-uvc-grannular-invert-v3-0-abd5cb5c45b7@chromium.org>
 <20250630-uvc-grannular-invert-v3-8-abd5cb5c45b7@chromium.org>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250630-uvc-grannular-invert-v3-8-abd5cb5c45b7@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 30/06/2025 16:20, Ricardo Ribalda wrote:
> Instead of listing the IOCTLs that do not need to turn on the camera,
> list the IOCTLs that need to turn it on. This makes the code more
> maintainable.
> 
> This patch changes the behaviour for unsupported IOCTLs. Those IOCTLs
> will not turn on the camera.
> 
> Suggested-by: Hans Verkuil <hans@jjverkuil.nl>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hans@hverkuil.nl>

Much nicer!

Regards,

	Hans

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 52 +++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 350cd2cc88f872d2e8bd19e2b8fb067894916364..94dc97448446d36a85a1b36d16c29f22af89c640 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1222,37 +1222,35 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
>  				    unsigned int cmd, unsigned long arg)
>  {
>  	struct uvc_fh *handle = file->private_data;
> +	unsigned int converted_cmd = v4l2_translate_cmd(cmd);
>  	int ret;
>  
> -	/* The following IOCTLs do not need to turn on the camera. */
> -	switch (cmd) {
> -	case UVCIOC_CTRL_MAP:
> -	case VIDIOC_CREATE_BUFS:
> -	case VIDIOC_DQBUF:
> -	case VIDIOC_ENUM_FMT:
> -	case VIDIOC_ENUM_FRAMEINTERVALS:
> -	case VIDIOC_ENUM_FRAMESIZES:
> -	case VIDIOC_ENUMINPUT:
> -	case VIDIOC_EXPBUF:
> -	case VIDIOC_G_FMT:
> -	case VIDIOC_G_PARM:
> -	case VIDIOC_G_SELECTION:
> -	case VIDIOC_QBUF:
> -	case VIDIOC_QUERYCAP:
> -	case VIDIOC_REQBUFS:
> -	case VIDIOC_SUBSCRIBE_EVENT:
> -	case VIDIOC_UNSUBSCRIBE_EVENT:
> -		return video_ioctl2(file, cmd, arg);
> -	}
> -
> -	ret = uvc_pm_get(handle->stream->dev);
> -	if (ret)
> +	/* The following IOCTLs need to turn on the camera. */
> +	switch (converted_cmd) {
> +	case UVCIOC_CTRL_QUERY:
> +	case VIDIOC_G_CTRL:
> +	case VIDIOC_G_EXT_CTRLS:
> +	case VIDIOC_G_INPUT:
> +	case VIDIOC_QUERYCTRL:
> +	case VIDIOC_QUERYMENU:
> +	case VIDIOC_QUERY_EXT_CTRL:
> +	case VIDIOC_S_CTRL:
> +	case VIDIOC_S_EXT_CTRLS:
> +	case VIDIOC_S_FMT:
> +	case VIDIOC_S_INPUT:
> +	case VIDIOC_S_PARM:
> +	case VIDIOC_TRY_EXT_CTRLS:
> +	case VIDIOC_TRY_FMT:
> +		ret = uvc_pm_get(handle->stream->dev);
> +		if (ret)
> +			return ret;
> +		ret = video_ioctl2(file, cmd, arg);
> +		uvc_pm_put(handle->stream->dev);
>  		return ret;
> +	}
>  
> -	ret = video_ioctl2(file, cmd, arg);
> -
> -	uvc_pm_put(handle->stream->dev);
> -	return ret;
> +	/* The other IOCTLs can run with the camera off. */
> +	return video_ioctl2(file, cmd, arg);
>  }
>  
>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
> 


