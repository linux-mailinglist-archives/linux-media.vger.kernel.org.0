Return-Path: <linux-media+bounces-22469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8A9E07B8
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCC91BA288D
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FD1205AB0;
	Mon,  2 Dec 2024 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gp5mJXSG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3031FE47F
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 15:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151880; cv=none; b=Uy9vh7/xNVH9agiQimlKsNogEyiej3253CX4g4EfIgT+6XtBfGvEaVtZRfcJ1xXzKlc1o4EepCGMzAeU+BiwcaBw5GKmPxN1I7rsDVU3DWfz4bZaOAOJN8i1MB+UhFdf+D9CICI3oIo69L6XWU5bMLKy8yl2z6ow7BUhKO6fki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151880; c=relaxed/simple;
	bh=vJUarVCgzLbRIG6joq/iHyey3+rZ0pgyQXMOAdtKj/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLYcrt5VDN6Ogbg0G4Y7iwmuERKWAC5BjvJ5VurKkq7RZC8goK+XMBJBsWRURKM4i6RYYz3NDYbR9SmXgfCENWwcGAUmRk6MCQFcCTVDUfAK3ch4tT8USUN7AEgjudktAoq8T4Fdqy7taUcMzjhEOW2tJoCWDyNNPHPrZJthmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gp5mJXSG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733151878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LM16Ab71QF2/aMjr/9GiFpGYvFVS70nYhp6dqdWKglA=;
	b=Gp5mJXSGEKI+9K4paGdVvQjDTpt2rtaTXe/odMvu7a9/PyIV/RF93jgixZKcuWR7qHpd/b
	Pqy0hhHYIK4FvUuw0OesjBzuwYPleCGv2Qh550T8iDBQb9x3oho4XGy8s2TyuSeYga2U0Q
	mgsdyPxyjdVSI1Y5OFACEtfz43Rfors=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-zWi8tyZMN6Ojf6B5crbFCA-1; Mon, 02 Dec 2024 10:04:36 -0500
X-MC-Unique: zWi8tyZMN6Ojf6B5crbFCA-1
X-Mimecast-MFC-AGG-ID: zWi8tyZMN6Ojf6B5crbFCA
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d0b5036394so2254656a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 07:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151874; x=1733756674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LM16Ab71QF2/aMjr/9GiFpGYvFVS70nYhp6dqdWKglA=;
        b=HkbeZKbFHXZmfVR/Bk0qFYL5iwTxuasn5VH9cAt7HmQ4K1Ma/hMkioB0Z7zazA+YfB
         UFl4N4RHkAd+MPg2GuUTAvm3VorpO7Mibt1UwiTqFht5UQGTq5MN6kW9JE0N7Gspf96W
         Cm+YeQ1HwsnXxoHfwZ75hhHzBbCC1X8lyiiutwIoU9Asndzd106+Zi0KmUXmc7E0Jm2p
         Jc6HP+WR3ys5GvCr5mATHHHMjgNr8f/NN89zu8mcKZnCqNfZJN/5jQzEvkGFYSUYQmbV
         ASB2qqJefnw3rIeOD0y2XLwp7nt91fTwhLjT4d+HlthYPMdDZ2yUmHIIt/Q87dTim9MY
         KmXg==
X-Gm-Message-State: AOJu0YxsKYz1N1msHEH16DhsdKgiN96gE4JBPrSHre0ZXYplRqklod2q
	yHDRfMFPMA0L81BQsthT8LddsFM+3y9UzDaMktdOIEGM1TQODFwqbxFipWW96mUpAFApzzTcxUJ
	0TFR+XOI/CCOT9VKjRW7EKPWelmTmlDnM+dLInnQZUeVRMGQ2cAwDZiiSmGL4
X-Gm-Gg: ASbGncsbMge1g/1i7TVWPOTdGW+pXWErV4b3+vVpWlJAxHPTnvL43FqBxP3Bx8FU+2i
	4yajFKUSHvk55nQwtxL09CODnmNzQk6puxO0SQi353sCjubAxGYn2JVkbpvWzC+XihudaLowO/i
	tV9U0xZyhWAFLJ1oVyZ935O9zJK9c16f4JKTI26O13BRpGPryQ4iqUm89vFe7JJ5i49glQMtLPe
	NwvjupW4znR+Ku+VoyRn/JWWAwcFhQ25FuPzefTuSN3lS92GKg1Pw==
X-Received: by 2002:a05:6402:1d4a:b0:5d0:bf27:ef8a with SMTP id 4fb4d7f45d1cf-5d0bf27f17fmr15030164a12.26.1733151871241;
        Mon, 02 Dec 2024 07:04:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH89JizN6dfc6LIjrO4IFDhOO72gnXCi8c/ckPglRq/Z/u3VGXGUFjQSMP8IFSUTjS94QFJ2g==
X-Received: by 2002:a05:6402:1d4a:b0:5d0:bf27:ef8a with SMTP id 4fb4d7f45d1cf-5d0bf27f17fmr15029908a12.26.1733151869120;
        Mon, 02 Dec 2024 07:04:29 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0ccbf4e3fsm3042592a12.47.2024.12.02.07.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:04:28 -0800 (PST)
Message-ID: <85e10e91-54f6-44b0-aafe-565c83b5cf26@redhat.com>
Date: Mon, 2 Dec 2024 16:04:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Use uvc_query_name in uvc_get_video_ctrl
To: Xiong Nandi <xndchn@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241129151723.48275-1-xndchn@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241129151723.48275-1-xndchn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Nov-24 4:17 PM, Xiong Nandi wrote:
> uvc_query_name was introduced to print query name in uvc_query_ctrl.
> So we can also use it in uvc_get_video_ctrl.
> 
> Signed-off-by: Xiong Nandi <xndchn@gmail.com>

Thank you for your patch.

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

with the line-wrapping fixed to 80 chars.

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e00f38dd07d9..93cacd2c8721 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -297,8 +297,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  		goto out;
>  	} else if (ret != size) {
>  		dev_err(&stream->intf->dev,
> -			"Failed to query (%u) UVC %s control : %d (exp. %u).\n",
> -			query, probe ? "probe" : "commit", ret, size);
> +			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
> +			uvc_query_name(query), probe ? "probe" : "commit", ret, size);
>  		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
>  		goto out;
>  	}


