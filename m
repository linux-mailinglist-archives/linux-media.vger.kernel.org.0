Return-Path: <linux-media+bounces-21544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2A59D1587
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 17:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C7A51F22F5F
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 16:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C215D1BDAAA;
	Mon, 18 Nov 2024 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXLMa8da"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85611B3921
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948113; cv=none; b=bRwCMYtokUB9lvt5Z72FPRqCo/GAJ5jSzyTs+quKtJtV0CeXH9OkfzDaKE48qCSvt6O5HsRHzmy98RVeOzHbhdi1UI8iW2hJ/gOgmV6qGEZzV2NTDG8lsE3m3wdNJJT7pP+7ORCOTtN8emwKxZcYi0SJYYDkry5sNdn5Udr9MzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948113; c=relaxed/simple;
	bh=aUsL5IWdjSRh34hOMMp6Hubde4ga3tZPUzNFXYpnCks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+Q6xbkhnuKFYxnwuXm0msECIQIf64n3PGe8WUHKDgbFRibWPGLtHxY16d2v9rzxDgstjEaxGvv7uQTF8b10ZtXpFrX1tN+22nuJYniC3knt297UdJ6DztOKF8Iv1YOxF6P0+OMsR6oUK2YbjiEFrEXxrA7AAhkW6yQx/7r3e2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXLMa8da; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731948110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IzFi/St31LRRMqxfA+sQazAK82/XTfJZ0YY59UT2Gqc=;
	b=NXLMa8daL8MsPk3oK8r8pWHSNeDfPwTE4qcF8klTqSthQjvNNXxMMEPFFpZ+WH6K6dVgK9
	gxM3Lr27qGvVkLffn81ZJUCWAcp+PRSaCEthb0EnK64qv/0pVjNRRlRUKOP5+C+DHPsl0P
	0r8zpQ7f+GQGtJ/HYuvv/K/9/tBu7C4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-QZitFTt5Pwy6SjoxH98H3g-1; Mon, 18 Nov 2024 11:41:49 -0500
X-MC-Unique: QZitFTt5Pwy6SjoxH98H3g-1
X-Mimecast-MFC-AGG-ID: QZitFTt5Pwy6SjoxH98H3g
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5cfdd7e1491so80451a12.3
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 08:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731948108; x=1732552908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzFi/St31LRRMqxfA+sQazAK82/XTfJZ0YY59UT2Gqc=;
        b=wZZxwLY2z880IetXhSAxRaH2ZEepssID5DDAc2AxYZKawgz8VxOhrxYBfAmDyh1wBX
         qxyCILH3ETHUd+QVrTbpnjrmaUPDltTvU2eXS9curCmJ7lg+lLC47wtCC28n9aY/21bV
         /kktTEolBIUh9oCRPQTs1MiwPO5TC14ObGx/x/RhpFTlzgNjmixnIHqS5ufFmhxePa9o
         uRNoB5L8VeLooA9PHPT7w8sTNp9M5ymtsQ/oX5sPS5AvGNNNoCKtEoB1hGxiQNSsDUuO
         zCzcLwEAZXTD2RvBRIOxYbJy1CegFJb/Hrn0fHKVNkYWs3akRIi5UyFSvkWid1KN9zy8
         jvQw==
X-Gm-Message-State: AOJu0YzIxopRKjrKOhfXOb63hz6DJpsu+ZGDchZu4sr8cgsruXeUXM1L
	sJl92lLafPgfAfTCYxL5n7vqxnRG88ATt05Myw8D6JcIXuiPKWxKx0QISOexWYV+3PHrdOrO0dU
	9Ffz54v/0axfHtwFCYMPk1QqIu2qqYNWcLyKH9yDCZjAHRJO9/T/LL2wb1f+w
X-Received: by 2002:a05:6402:90c:b0:5ce:fb4a:6aaf with SMTP id 4fb4d7f45d1cf-5cf8fc6d4ecmr9097760a12.20.1731948108115;
        Mon, 18 Nov 2024 08:41:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWFQnujbE7NoNpSHc3E5OZ7IbzpVGA6YjdmJe6OOoz58Hko/lDcKMADcdDZRTw1wnKA43AUQ==
X-Received: by 2002:a05:6402:90c:b0:5ce:fb4a:6aaf with SMTP id 4fb4d7f45d1cf-5cf8fc6d4ecmr9097744a12.20.1731948107788;
        Mon, 18 Nov 2024 08:41:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e043b84sm558019366b.137.2024.11.18.08.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 08:41:47 -0800 (PST)
Message-ID: <5a5de76c-31a4-47af-bd31-b3a09b411663@redhat.com>
Date: Mon, 18 Nov 2024 17:41:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Support partial control reads
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
References: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>
 <20241008-uvc-readless-v2-1-04d9d51aee56@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241008-uvc-readless-v2-1-04d9d51aee56@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

Thank you for your patch.

On 8-Oct-24 5:00 PM, Ricardo Ribalda wrote:
> Some cameras, like the ELMO MX-P3, do not return all the bytes
> requested from a control if it can fit in less bytes.
> Eg: Returning 0xab instead of 0x00ab.
> usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> 
> Extend the returned value from the camera and return it.
> 
> Cc: stable@vger.kernel.org
> Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index cd9c29532fb0..f125b3ba50f2 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -76,14 +76,29 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  
>  	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
>  				UVC_CTRL_CONTROL_TIMEOUT);
> -	if (likely(ret == size))
> +	if (ret > 0) {
> +		if (size == ret)
> +			return 0;
> +
> +		/*
> +		 * In UVC the data is represented in little-endian by default.
> +		 * Some devices return shorter control packages that expected
> +		 * for GET_DEF/MAX/MIN if the return value can fit in less
> +		 * bytes.

What about GET_CUR/GET_RES ? are those not affected?

And if it is not affected should we limit this special handling to
GET_DEF/MAX/MIN ?


> +		 * Zero all the bytes that the device have not written.
> +		 */
> +		memset(data + ret, 0, size - ret);

So your new work around automatically applies to all UVC devices which
gives us a short return. I think that is both good and bad at the same
time. Good because it avoids the need to add quirks. Bad because what
if we get a short return for another reason.

You do warn on the short return. So if we get bugs due to hitting the short
return for another reason the warning will be i the logs.

So all in all think the good outways the bad.

So yes this seems like a good solution.

> +		dev_warn(&dev->udev->dev,
> +			 "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> +			 uvc_query_name(query), cs, unit, ret, size);

I do wonder if we need to use dev_warn_ratelimited()
or dev_warn_once() here though.

If this only impacts GET_DEF/MAX/MIN we will only hit this
once per ctrl, after which the cache will be populated.

But if GET_CUR is also affected then userspace can trigger
this warning. So in that case I think we really should use
dev_warn_once() or have a flag per ctrl to track this
and only warn once per ctrl if we want to know which
ctrls exactly are buggy.

What we really do not want is userspace repeatedly calling
VIDIOC_G_CTRL / VIDIOC_G_EXT_CTRLS resulting in a message
in dmesg every call.

>  		return 0;
> +	}
>  
>  	if (ret != -EPIPE) {
>  		dev_err(&dev->udev->dev,
>  			"Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>  			uvc_query_name(query), cs, unit, ret, size);
> -		return ret < 0 ? ret : -EPIPE;
> +		return ret ? ret : -EPIPE;

It took me a minute to wrap my brain around this and even
though I now understand this change I do not like it.

There is no need to optimize an error-handling path like this
and IMHO the original code is much easier to read:

		return ret < 0 ? ret : -ESOMETHING;

is a well known pattern to check results from functions which
return a negative errno, or the amount of bytes read, combined
with an earlier success check for ret == amount-expected .

By changing this to:

		return ret ? ret : -EPIPE;

You are breaking the pattern recognition people familiar with
this kinda code have and IMHO this is not necessary.

Also not changing this reduces the patch-size / avoids code-churn
which also is a good thing.

Please drop this part of the patch.

Regards,

Hans



