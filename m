Return-Path: <linux-media+bounces-22932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF49E987F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C7AF1882BDF
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8140D1B0424;
	Mon,  9 Dec 2024 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ntba/Mfu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D19233157
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753524; cv=none; b=sbZZioZblqcv6F4m2tMKRP9IG459sXFFiB7+CnVs7jbX4sIkxo5lb/2zhzx6TKqWC8ovGerSc8GKyra+f//ifimzMotlkxKzq3Bbvf+CU8Y5OUa6O/8cRhwrMX77Tm/o9XvX9sAyzp/v2scHGkEa9e3iXHg+1F3eyro605nFMCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753524; c=relaxed/simple;
	bh=HUA4b4M8JnCMR3m0/iw02mhSWeK2KScSMgJfj1k3/No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtrroDuNVAzT3NlkknRgTq3d0hnq1f6BoYdj7jdqX0VUbxGywC0E6udSEyXpcnj8WULF8cYtA/A9fb9SZD2aju+qOmr4mOtAkZqfOBEcWYeODTbbX9xHFuNR8Efel8vUwbJ01KNkoKuYoZTS87FpRZo4WqyWYeEUXJ5YTnZWxZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ntba/Mfu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733753521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+4+nlTVwxPvy1lSFfkyjyoPQLwpzbUibFlcQJuLdCc=;
	b=Ntba/MfuhvI0ae3MVyLGvHLtT9a20oFRk5WD6IIA82wpPmbHP5Y9Sc0Byeraz2YDhE1/+5
	F0TCzu8L7SCWwt9S8AvEc3MRgykDYuiIPzgnp6+9aaACYxMTcYAa2RvhIdA1yEWFtXjx7r
	gRltcdSDm9HvUri5bNdHAKEhFwEo4FE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-siYoBvc9MieOnnylkjh6QQ-1; Mon, 09 Dec 2024 09:11:59 -0500
X-MC-Unique: siYoBvc9MieOnnylkjh6QQ-1
X-Mimecast-MFC-AGG-ID: siYoBvc9MieOnnylkjh6QQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa69c41994dso11760466b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753518; x=1734358318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+4+nlTVwxPvy1lSFfkyjyoPQLwpzbUibFlcQJuLdCc=;
        b=EK7HNNcuf0mImnYRDkL8QOyTTT1usN2jEPanm6R66GTePALWcGcRO5+Tc+cUILLVXE
         4Xzc+dpFcotwEPgE0wGWTPyNTy3hMerqDH7KeiSc0x7F9TSfkuuvcjxjR1mcT7/bNJMJ
         L1/KfqqTwuw2iN93d15Fqt/cR+5qzTSTO4IRAX+SCOrs9LF9Xi+RR0+urlG5VnmQobuH
         2sU9eyeecOmG1mWTaM08+NGsRqtvgqbx2K10q98PSustVtFoDm4DPvOD9gQBr96V4rpQ
         dA8uiAo0bIGzuO1QotZSCuIN57iJdl9arEA1pysbJbmI0rMXWSubWzf7CE7M+j5G/9Qk
         4RFA==
X-Forwarded-Encrypted: i=1; AJvYcCU3n1pW4m7Yow7zsG3zmdbedMy0XgJIYldOIx8IADlplYpWX9uEKGk0NlLf4rkHv32AQpn38/ksZLtwCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe1vehjUHUBqydd+iL65YwpACYxiKAjhdaVV7O0Y+ecFNkUHB4
	wcm35OC84nquHhmKjmYewufroA6v/9xRXPZNA7ViCGNICQeQ9C3aM928+7t1KdG8pX7Afo6CsFe
	mbH9atdjj+oHAvxk/hH/Z8mEepwL9qiswnfqRwJwCF2YcM7IWYgSIf7apo3QT
X-Gm-Gg: ASbGncu/GnT6s9yESvgO0Jop6JZAU+OBaBIfWsehUFPHxr1AkkqA4/7h2mGEnl1NGQp
	CzBVX4RIsdBMXrQ+FmZ1TsB4yBAeK5LlNUB+QOrmdffVluf73wo7Phza+O59fMWK17Oe4gsw9+Z
	NqnvbecfToBDtqWmVsBuQoz0nRJsEkGyFSVXSk3wcd8wfnhSE7vPiDJi2AT73oXtg1wCsDxGwzm
	FyTW0u/k1UNkupjCwT2biDKeYTg/0HKNA+pha6vPePHV7E8xapcvQ==
X-Received: by 2002:a05:6402:4315:b0:5d1:1064:326a with SMTP id 4fb4d7f45d1cf-5d41853edd6mr1844021a12.15.1733753517904;
        Mon, 09 Dec 2024 06:11:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpxg+1Gf1R8AT9wVN7m/GsAbasHVdsDYLb1ALuKdf0POhrVzOzG6/X89WZcBRq4P9o59TDOQ==
X-Received: by 2002:a05:6402:4315:b0:5d1:1064:326a with SMTP id 4fb4d7f45d1cf-5d41853edd6mr1843947a12.15.1733753517478;
        Mon, 09 Dec 2024 06:11:57 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm3154356a12.56.2024.12.09.06.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:11:57 -0800 (PST)
Message-ID: <8258ce59-cd06-46ba-b275-97eb9ae4d64c@redhat.com>
Date: Mon, 9 Dec 2024 15:11:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 17/19] media: uvcvideo: Add sanity check to
 uvc_ioctl_xu_ctrl_map
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-17-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-17-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> Do not process unknown data types.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5000c74271e0..4c88dab15554 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -106,6 +106,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
>  	struct uvc_control_mapping *map;
>  	int ret;
>  
> +	if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
> +		uvc_dbg(chain->dev, CONTROL,
> +			"Unsupported UVC data type %u\n", xmap->data_type);
> +		return -ENOTTY;

This seems like a textbook case for -EINVAL ?

Otherwise patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> +	}
> +
>  	map = kzalloc(sizeof(*map), GFP_KERNEL);
>  	if (map == NULL)
>  		return -ENOMEM;
> 


