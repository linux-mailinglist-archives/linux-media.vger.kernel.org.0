Return-Path: <linux-media+bounces-22936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E89E991E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9351887DCA
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4A51BEF98;
	Mon,  9 Dec 2024 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IzEvMQKg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A01B0403
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733755008; cv=none; b=nRyHgO8oPMbiFbO8tEBTg3fr4jAY8GrqkxxCCth5RklwRZzKLFAajsXl/LBbj0IS71uIcQwjN18jSyFaWM3mn5307UelvgpwLj2sNOUjBRsTm9sbKS5in+GZGY8XAwRg7/iQJ0vagB8m6RlTHo6UUdYJ9PWpUhxB+p4OkouvzOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733755008; c=relaxed/simple;
	bh=NHNe+93DHhB797GK7c5znVNGQABOBhQC7x45Bs7eSPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8ark+bt8EcFAa1baHcvtBGIu5Mk4VwEm1hySlkJ/kxdPcZXhHRaa6O0zRQQVPVteUcDkWyKwPs9ITobKOLdSnydQ/BvMBFzQ8ukTWn66MM0NFxNVT/Ld0oxSx3ac+6ZEqMfq0ZUOgU9Wj1+AFv8jd2Coqf6Kfo49WlGnSsyjPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IzEvMQKg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733755005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bcrpYX2WuEB5tkLHVCFwFguMfZXN6HGk3NUD/+Ntxo=;
	b=IzEvMQKg2l+OLf4XXrsEOke9uJNYc8P3vig0kdhZr61xSWwnmE1iHFhqyOfNjWy5+5j63K
	VOrGk1SgjhyaWcSBLFqo/noz1Jwg6n4VzeBs0lzC3v06m1lEM0UAbtpbenflcQXYNjBUcZ
	zPPo4b9K/lS8SYE6XsAuF6iyXS/6h9E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-5U2AMNViNmicAgTjM-N-nA-1; Mon, 09 Dec 2024 09:36:41 -0500
X-MC-Unique: 5U2AMNViNmicAgTjM-N-nA-1
X-Mimecast-MFC-AGG-ID: 5U2AMNViNmicAgTjM-N-nA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6704ffcaeso164835166b.2
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733755000; x=1734359800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bcrpYX2WuEB5tkLHVCFwFguMfZXN6HGk3NUD/+Ntxo=;
        b=jcSzTvHefNUhIEk7w4xnQBgNVglkVY5ScpdIJH8qVQeDnAGBm9FV9lcpOwiK6NWADc
         L426DcE4do1UX/DX1CtKtZIDEuuwgIys5rM5dYhrIyxY7O4d8EFwzCzR5QbI1UEmIPo8
         s5Xp0aeP2HAl+FM95yZb5CSDyuwitRLsLLW7voGILl91fFjcvt52WNbmVZ5zMqDwENw2
         Ajk6Ksg4ksJUUj/o9ptrkcInjv0X66cj0mev9v5HZUaIu2tzbIttnkCHrG5gvgOgLf+N
         eB2napoMWyApM8+BMM4fzPNGDIjyOmoKTM3cRC0KoHDnsP15Mf0FrXgAcKrLmLYVuFmM
         n97A==
X-Forwarded-Encrypted: i=1; AJvYcCVt8dxu7oNWs5vVtuCgEZ4PJ2Ga1taZTCrTdO6GjbcOJg6Xn8ZcoNCXF9Xi56SlTRvE1sFF1KRjV9u22w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3i3nyf+35MyrUJRglLE1FsvrTjsJ6oTeEwveBBFudcZDx8y+
	Ga3M7DNdZ1L6hLI2PI5bTF/uUrEMSn7eI24513osiLVJzWWnPKW7R59Lkd/LGsqTFogdjADBNXk
	HHtV/TyiwLrSBEpLdbxwuRcvxXQmQzOHxWg8TRfIT+qUeMYgw2TqockBq8GTr
X-Gm-Gg: ASbGncu2igqgfyGVAHMsCfDUVPAzLLPe058DpCGupuwSR1OFD8CZUKyrb3FxOhfTcXT
	qt5tQAT7BlcDbnHVk8CkOgfnaID62h2Z5Tr1CzCbEBR04oEBJlr1GtRUnndsMw7Msg0U7F4H/Vx
	F7nGresTmaKsvkms6CWHu0JqgdiHOpz7NyTP33WSbrnnMs2SObm327OQxZabczpP+qUs5HmjhQ6
	5F4HfH6f84mH1qdzOPgN2Znmc2wLrgr65g4kS7QYJw0c1WLqq6iwQ==
X-Received: by 2002:a17:907:b98:b0:aa6:23ba:d8c8 with SMTP id a640c23a62f3a-aa69cd0fcdfmr57953466b.11.1733755000126;
        Mon, 09 Dec 2024 06:36:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBCeKpuTbagd3g67kcny4NRpBP1NH8f0KuTh7WoQ/CKsQIXJ4FcgExWewvtk/Moeo4c20u+Q==
X-Received: by 2002:a17:907:b98:b0:aa6:23ba:d8c8 with SMTP id a640c23a62f3a-aa69cd0fcdfmr57950166b.11.1733754999676;
        Mon, 09 Dec 2024 06:36:39 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa687bbe83bsm165002666b.188.2024.12.09.06.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:36:39 -0800 (PST)
Message-ID: <13a3c23e-7a8a-4957-bdd7-d8de2844b904@redhat.com>
Date: Mon, 9 Dec 2024 15:36:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 19/19] media: uvcvideo: document UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-19-64cfeb56b6f8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-19-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> From: Yunke Cao <yunkec@google.com>
> 
> Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> 
> An example of a userspace implementing this feature can be found at:
> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> --->  .../userspace-api/media/drivers/uvcvideo.rst       | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index a290f9fadae9..1cdcd45907a3 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
>  	UVC_CTRL_DATA_TYPE_BOOLEAN	Boolean
>  	UVC_CTRL_DATA_TYPE_ENUM		Enumeration
>  	UVC_CTRL_DATA_TYPE_BITMASK	Bitmask
> +	UVC_CTRL_DATA_TYPE_RECT		Rectangular area
>  
>  
>  UVCIOC_CTRL_QUERY - Query a UVC XU control
> @@ -255,3 +256,66 @@ Argument: struct uvc_xu_control_query
>  	__u8	query		Request code to send to the device
>  	__u16	size		Control data size (in bytes)
>  	__u8	*data		Control value
> +
> +
> +Driver-specific V4L2 controls
> +-----------------------------
> +
> +The uvcvideo driver implements the following UVC-specific controls:
> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
> +	This control determines the region of interest (ROI). ROI is a
> +	rectangular area represented by a struct :c:type:`v4l2_rect`. The
> +	rectangle is in global sensor coordinates and pixel units. It is

Maybe: "The rectangle is in global sensor coordinates using pixel units" ?

being "in pixel units" sounds a bit weird and had me confused for a moment.

> +	independent of the field of view, not impacted by any cropping or
> +	scaling.
> +
> +	Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
> +	the range of rectangle sizes.
> +
> +	Setting a ROI allows the camera to optimize the capture for the region.
> +	The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
> +	the detailed behavior.
> +
> +	An example of use of this control, can be found in the:
> +	`Chrome OS USB camera HAL.
> +	<https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/>`

Hmm, not sure we want this in the API documentation. OTOH why not ? Anyone else
have an opinion on this ?

> +
> +
> +``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
> +	This determines which, if any, on-board features should track to the
> +	Region of Interest specified by the current value of
> +	``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
> +
> +	Max value is a mask indicating all supported Auto Controls.
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE``
> +      - Setting this bit causes automatic exposure to track the region of
> +	interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
> +      - Setting this bit causes automatic iris to track the region of interest
> +        instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
> +      - Setting this bit causes automatic white balance to track the region
> +	of interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
> +      - Setting this bit causes automatic focus adjustment to track the region
> +        of interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
> +      - Setting this bit causes automatic face detection to track the region of
> +        interest instead of the whole image.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
> +      - Setting this bit enables automatic face detection and tracking. The
> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the driver.
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
> +      - Setting this bit enables automatic image stabilization. The
> +	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
> +	the driver.

This one I do not understand. Since the ROI is not a crop, I don't see how
this interacts with image-stabilization. Typically digital image-stabilization
uses a moving slightly smaller crop of the full sensor rectangle which it moves
around in realtime to compensate for camera movements.

So I wonder what this is expected to do. Does this set the ROI to the image
stabilization crop ? I guess that combined with reading back the ROI that might be
somewhat useful to follow what the image stabilization code is doing.

OTOH this does not seem useful for using as region for AEC / AWB ?


> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Setting this bit enables automatically capture the specified region
> +        with higher quality if possible.
> 

Otherwise this looks good to me. But I would still like to see
a discussion about using UVC custom ctrls instead of something standardized
for this. Although I guess maybe that already happened before I got involved ?

Regards,

Hans


