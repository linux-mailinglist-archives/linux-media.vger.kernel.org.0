Return-Path: <linux-media+bounces-22028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 437589D8ADC
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 18:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AFCBB30E02
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264011B4F0D;
	Mon, 25 Nov 2024 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWMC3NBh"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA5D1ABED8
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550491; cv=none; b=lN9G7fYsuLW4GK/mKiigfoTfvLJSGVo5B+LbdG8YjPdPDKwXs+nm4UXvLzD/2gkiU0XkN6xIF/KNSb08PQEZk7A6DECRZpVER6HvaH8AORdZcZ//+XM8Zdnf3JgiC1sh/YnMpAUXpCVqHYnUfh48aTo1iNpkyvnYMEHcMo1EhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550491; c=relaxed/simple;
	bh=Pluboec6B86D6ws6bYAgKSR1YGIcc9GTafVmWwbJSj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qcnbf7X0Gi0SRxxVdKeSeHx9WOKtVkYmxBtksjputlsT38WORc0/t2pcIt3DFJOsz0b1W/Q838WINszusDCT+HC7gY7IuW52QGxpi42Ed8ole1uOZWIqCizM9MmPg5b2xL2e5MyrYwWIoQDHHNMz3bWn+0uRzQXLtm/TlzH4fw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WWMC3NBh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732550489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGIGpXHEYfpIIvt0UvOdEb2pgVXsrLcxjgtqNDiti3Q=;
	b=WWMC3NBh+mZo7vOW9i3Pz9y8DSpDrETR8DK1RIilFDDgeCx6zQdK9ZhM6uL2OlTHSinZfG
	FTYKCi/fu71PP9uKd8LYt5/xDIglEV24ETqFlp39yqibJSB7mBQtWltuanN15fglPwGKUg
	+cOwpkRI7CRXzFUXdziCxWgfqLXkyjo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-yws_FMddPv2sADBoe5EOxA-1; Mon, 25 Nov 2024 11:01:26 -0500
X-MC-Unique: yws_FMddPv2sADBoe5EOxA-1
X-Mimecast-MFC-AGG-ID: yws_FMddPv2sADBoe5EOxA
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5cfba4f3c6dso3116614a12.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 08:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732550483; x=1733155283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGIGpXHEYfpIIvt0UvOdEb2pgVXsrLcxjgtqNDiti3Q=;
        b=jOkVL/4nE8b5fpAiWGkN1n3HHViaRU5Q7WHovO+zq63nJ7R/XCMTs6H78avSRwVZAg
         9RW94MdhhRt5Flv/BaJ3DIzALl0LGFv3/7PRfdxJMzhMiv4GZ4dV+VMddfwrj0wolh7A
         XVdX5fvBsVHQCVbC7dIPnO/5Qf/Qux2TewHBI6uHsHyBrZkjYiCDaZZNon3a7ln+ol7f
         ywT6u88K3DzdrZ9F6ppXaYGAfl6rQ5FYNfWweHUyjGSQ2VS9mgNlbt6b5B1YIcwlN/UR
         hoDKSvYLTm3ULMsBgXj5Ed3w/zyer49GWZnA+qVySfkOPUbAEACiTFGxSE9t+Nrtobwd
         1dig==
X-Forwarded-Encrypted: i=1; AJvYcCXBZhOTIydTNdH/74FOvbQMzmZ1WNbckaKC67IXUJpMaNZqdDJNaH9yKDWak5Jnuy/M0Z6CbmDW9i/iPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIlqm4oDhTro1qcV+5tB0pHM9eun0TVv6rxenZdcK86fC1wLl
	JgA0a2ArKTgDNjUh5Numgq8gxOlSdjc0z0dTkAfN7kRMQx592kTmEY6skSjjbAMEljy9zEbKxUh
	y1reahzeNrToqfOG6NkoXPDk94VUs/E9Pbn974tZV3na0X5Dueqw/XJ1K+Lla
X-Gm-Gg: ASbGncu0Slp4xIGRpKkI0yKiaoHlbqc3ok+arFl31fTKnqhCZJE+QoYwpLEMUJTg4vz
	BxWbCIFbzO2BiuBDP+bhdIbhBFQsBpA2GqKJHlc370nUDj0oaKHdlME7TwAyKJapXPCQNYOuOMS
	2mEWYuJLBnQXtCXVa+4TC/pf7YwCZWSjljp8aDiMbAMj+Z79Gsfmtwbpt0oDKSTDE1aTFJCfVV4
	6TftSL4IflFJ31gEYTvqhmHSDDEENKkhD+CH0hbnsFUcu6mLJWzJbTTNIILHxc4yguf22/g+w74
	qvF7ZP9x+rtiEzoVhM1kN6xmkO4mHsod26i9AB6qT+euMoPThX2DghridZuu6FmjC2uKpK/xLET
	8qZVBdgWL+6uZiTZ1pqT1fLRO
X-Received: by 2002:a05:6402:3896:b0:5cf:e9d6:cc8a with SMTP id 4fb4d7f45d1cf-5d0206257c4mr11826326a12.20.1732550481885;
        Mon, 25 Nov 2024 08:01:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQbWf0jO1klkeWEEobeV5FhDZOLY+CFfN2xGEVK/87HU7FApwBNZxs1UJfr7YKCXLn8oTsrw==
X-Received: by 2002:a05:6402:3896:b0:5cf:e9d6:cc8a with SMTP id 4fb4d7f45d1cf-5d0206257c4mr11825847a12.20.1732550477578;
        Mon, 25 Nov 2024 08:01:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc745sm4278689a12.64.2024.11.25.08.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 08:01:16 -0800 (PST)
Message-ID: <f7d29368-c05f-4fbc-ba8d-2bbc95b21c37@redhat.com>
Date: Mon, 25 Nov 2024 17:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 08/19] media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls:
 handle NoP case
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-8-64cfeb56b6f8@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-8-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> If nothing needs to be done. Exit early.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 02fd5cbc3474..65dbb53b1e75 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1081,6 +1081,9 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
>  	u32 which;
>  	int ret;
>  
> +	if (!ctrls->count)
> +		return 0;
> +
>  	switch (ctrls->which) {
>  	case V4L2_CTRL_WHICH_DEF_VAL:
>  	case V4L2_CTRL_WHICH_CUR_VAL:
> @@ -1121,6 +1124,9 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
>  	unsigned int i;
>  	int ret;
>  
> +	if (!ctrls->count)
> +		return 0;
> +
>  	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
>  	if (ret < 0)
>  		return ret;
> 


