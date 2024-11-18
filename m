Return-Path: <linux-media+bounces-21545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C99D15B2
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 17:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73C0F285744
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 16:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33DD1C1F21;
	Mon, 18 Nov 2024 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dj+zFfPh"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00151C6F70
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948325; cv=none; b=ps5QMfhVY4G+XPDZGXQLsjvI3TCRdslNn4AZ9P6p3lwgic+nO9dxh1cF00uhb2MBRF19LAaigCjUdH93D5nDrkVPlOFF8TQOxtgCFLUATx2cljBzRvAU5sTASeKjsna/6c2ORvoX3iGbCYa6M0bdIZMjNLvLOUgiADJrZ8/wqwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948325; c=relaxed/simple;
	bh=M8qRZwuPSHZzmXncbrgn/s/Tt5ePgg+efoKISTCGEos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOxkNEefLpJYghy98LhA1u4AiWzN8Q+Fvh2zJ2T9LoogJBskHXPIgtnlYyAEin5k4jqhS0w0aUtOx8i+AegIE60W81WxwPz6RApsjksljxq16xljP3RxBodBWIj/0i2j2082MmaK/siJ/XhIlp7JJQa3WHwuxXvUdFU41KadNsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dj+zFfPh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731948322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D++6g6lRdyP0JIFnmfdsxSr8uKDFgQCiSM+h9Fjlq0k=;
	b=dj+zFfPhywfgLHLo078UOS53SQrpkFb/rPIOzkqeViB0eTP4P05+izHmDWfVTTjJUYJ/rS
	H7hAEhs0r5fbLPFbn7c6FHd0EKgizu+AjhX9zsarEE80aPIhrtFzguYEIWvJeg2y4hZ6PI
	p/ri3fAlCLZIBBl8r60MYw/LKkJzT7M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-zi3vtN4iOg-Ww3U5wgIDOg-1; Mon, 18 Nov 2024 11:45:21 -0500
X-MC-Unique: zi3vtN4iOg-Ww3U5wgIDOg-1
X-Mimecast-MFC-AGG-ID: zi3vtN4iOg-Ww3U5wgIDOg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a1b872d8bso113151566b.1
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 08:45:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731948320; x=1732553120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D++6g6lRdyP0JIFnmfdsxSr8uKDFgQCiSM+h9Fjlq0k=;
        b=gJTUNiG/e48jdtcTCsTO0LLZ7I7C2O0Dat6lY7gXaCRfzFk3rldQ1uz7UvNvD/D3iB
         6v4tLENuy+dILEqlMnTOa1lq119cK1xeWWwwfriZYi4gsInkmVovtrC/AA4/05tqHC3w
         aRWtSK7YK2P/ZQPDFuM/LjqcRuOuLt754QZyogKdnn6Gn8bfoMTC/7RkBPCWKFvY1lvI
         y9WilOqN3PRn5sKlwTAq1xf6RI0TX5ONff3ppklP9zafO7Gygkqdpqc2eCHMoQlRpX/Z
         y/G7JarpIfaGznIZADAfpO8gjjuleyNYbV3swLvDlDheSdIf8VNFswHfKtezPP6RG4Lb
         a7Ww==
X-Gm-Message-State: AOJu0YwjalxOX4MUkCGg8dnJIpYD0B5wM8+5Fz6JUSKDRz7i4zIj/WTp
	FEb1MTV4bxSABlgahLJLAh1kM9osteRvLFqRNEO2OhlbfHB50czkM8VF/VAUhFdTJ6icMvPSUU0
	Fy6NIfA+3H89ghLVGCckH23GeICrPaJNmB0Ca7OZpHG669VtrhvW0FAOCYqlU
X-Received: by 2002:a17:907:3e1f:b0:a99:d782:2e2b with SMTP id a640c23a62f3a-aa4834543e4mr1083129666b.30.1731948320220;
        Mon, 18 Nov 2024 08:45:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXl8O9GsIyhuXzg5nGHjHl/pfG7DfEkgnUofIDwvqnvdm/ClXmO+TdQXQb1pKYHJ1yTUY9NA==
X-Received: by 2002:a17:907:3e1f:b0:a99:d782:2e2b with SMTP id a640c23a62f3a-aa4834543e4mr1083127166b.30.1731948319861;
        Mon, 18 Nov 2024 08:45:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4a18e7e4dsm292474366b.201.2024.11.18.08.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 08:45:19 -0800 (PST)
Message-ID: <4ce7cac7-6e4a-45b8-8d0e-a8f16a77839f@redhat.com>
Date: Mon, 18 Nov 2024 17:45:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Add more logging to
 uvc_query_ctrl()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org>
 <20241008-uvc-readless-v2-2-04d9d51aee56@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241008-uvc-readless-v2-2-04d9d51aee56@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

Thank you for your patch.

On 8-Oct-24 5:00 PM, Ricardo Ribalda wrote:
> If we fail to query the ctrl error code there is no information on dmesg
> or in uvc_dbg. This makes difficult to debug the issue.
> 
> Print a proper error message when we cannot retrieve the error code from
> the device.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f125b3ba50f2..6efbfa609059 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -111,8 +111,12 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	error = *(u8 *)data;
>  	*(u8 *)data = tmp;
>  
> -	if (ret != 1)
> -		return ret < 0 ? ret : -EPIPE;
> +	if (ret != 1) {
> +		dev_err(&dev->udev->dev,
> +			"Failed to query (%s) UVC error code control %u on unit %u: %d (exp. 1).\n",
> +			uvc_query_name(query), cs, unit, ret);
> +		return ret ? ret : -EPIPE;

Adding error logging is always good, but again please drop the change
to the return condition and stick with the:

	return ret < 0 ? ret : -EPIPE;

pattern used everywhere.

Also in this case the return condition change really should have
been in a separate patch since unlike before the success condition
did not change, so it really is unrelated to adding the error
logging.

Regards,

Hans




