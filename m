Return-Path: <linux-media+bounces-23727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1969F6F2E
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1811E188BD5F
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9B91FBCBE;
	Wed, 18 Dec 2024 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XptmSsLx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D861FBE8C
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734555786; cv=none; b=aDH1k+VY2UNFvNesFv9yi3VUCagdqDOf62pLEZteT8JiRraVTpOGy7h/ZFPhx+INuCpNMFyNy6Hx5pQQCBmeOv96nABJ5ARgQa0JIZxIcDoQn1WnRDrAE1+SGe+o/6MB4r88xHuoe8nds6ubGvmmqncTGa2XRuG68VtLx0lYKns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734555786; c=relaxed/simple;
	bh=YB7v5774twjxabHwuvYu9rC+1i8/nD+yrKHfnQmaHW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyeqaautlNg8dt0ePXMcTA6JlyCQaDdaMgMJJ+HAyueo/NVj1LUZn991pGOwJFa3z/5Oh1NmXarNZimXJfZhfrICjlqgyhjeqtR/rmIXTPgbWQMyd5BMKjDftZ4rEwpMLZk22WVvrwa9wKTf9jazhXaBYwCtGTh/OhxP3RK/zU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XptmSsLx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734555783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQ+pVxPumk8RzLmQGLx7tipaROnJdOd9kkSMc7lELKM=;
	b=XptmSsLxoi7PWo9Mf1A5PW5s74aw1TgZF5+kMrYAZ7q+Aj6iVjqy2Vh7F3hozrZmapXp5F
	yiLMLJcWPtIDEe/cP2SflX72FYXoICJy967AnB4x6nhWlH08RnVu3O4ITB/Jm6O9xryghP
	A5wraWPtzGxmq6RKcsu+BTWYwyJcXDw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-_FI7e7STN_64TtxOkQBKgQ-1; Wed, 18 Dec 2024 16:03:02 -0500
X-MC-Unique: _FI7e7STN_64TtxOkQBKgQ-1
X-Mimecast-MFC-AGG-ID: _FI7e7STN_64TtxOkQBKgQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa622312962so871266b.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734555781; x=1735160581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ+pVxPumk8RzLmQGLx7tipaROnJdOd9kkSMc7lELKM=;
        b=HGHmoKL46MVO9iiIG/Z50sc2eZNI0jNCQuNo2/QTrtvXvsF/8FpsW0miYT/x8ynexS
         ItqRDK/2eu1QjhFfT/06g2weaBWR4iBsr+9KudYbd/jEWWDjejhdhH67GXFEaQldAFAP
         NfSU3cN6/buxKE2zieUTYbuT+fTpMJPehximonWKIpmcSQEroRa+aLxv5ry71Xw1N5by
         UhlNkB2EDanCQIi8yWEcazlONlaFpTqD5nL/NQ/7hr7HNbXKtnZ34aqSidYWFUv37Ffn
         4npFU/hIQGVbk4yaDH4nmq2wRY1Fwlrcw1K611AtRn7ApuDwsmPGjRJPNErYXsNVIKWU
         dxwA==
X-Forwarded-Encrypted: i=1; AJvYcCUCPKazSYoQ5tdVkb2P2FaRbwffUXm+EKClARsd2ktiqHt3p4zN/EmebhquJwu1GKwl2asFJMaB/xNs6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMEuuqzyzSOwHHS1hkNlD/dGg0xizSSUGkoL/EjqGewzb+umDQ
	aXQ9ZbgxdwIG4JIjsUDamjUOiAOmFvL5gvpjklCsxrOn8owqiF0+6f0vlHomYRxAxXJfEE0wPb9
	JzaEYWDhpG2AOXw1FW0f9M7emFZbAx60YPdUtfWb16EJx9DnCSPBvWwevOrYk
X-Gm-Gg: ASbGncsTykMn6cbyHMvbONliJ8f+V5OgKlZrIkKLiWDDIilVKUpybGQJHN1zwUamABs
	u6loehUS9fM/HlB1Yi5cq/NdxoB3ol1cM0cjw9H58KJlg3pmsayv7Eht984fzC7U3dLb0XEnIFH
	LRlRPgEY5n2bVJELBjNFlhXZmFz3+l9boBBCc8gz3lpNlz7M1+FAyN5jRmQ1cYk8Khmt5SR4V4B
	8Qthfn+WdXJPnijx6Tc+zIswj8LMMyDqOzUxUouXabqvb+rQvYdCQPJBsh8TiS6L44JIrRr0Iea
	KpqhGxz9VAuNxTeB5E4cS1eMe5t4PasiKR4DYvwm7gzubIBnxMSURaGI9Rc7eGGUa+nBT/Rcu36
	uRljdJ/jpifDaISwZgPbnUFwZe0GHOJg=
X-Received: by 2002:a17:906:3099:b0:aa6:73ae:b3b3 with SMTP id a640c23a62f3a-aabf47c7394mr403435266b.32.1734555780638;
        Wed, 18 Dec 2024 13:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgjHQ1ZCj+vq+ip/9PIIRIYJGSlQs7hcKApOeMr5UyNVlr1asC6hzC8BE5BOPRo7QsGjVDOw==
X-Received: by 2002:a17:906:3099:b0:aa6:73ae:b3b3 with SMTP id a640c23a62f3a-aabf47c7394mr403433966b.32.1734555780256;
        Wed, 18 Dec 2024 13:03:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aabf932d600sm97495766b.86.2024.12.18.13.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 13:02:59 -0800 (PST)
Message-ID: <b8834304-ef76-4db9-be8a-c1aa015a5c7e@redhat.com>
Date: Wed, 18 Dec 2024 22:02:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 18/18] media: uvcvideo: document UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
 <20241210-uvc-roi-v16-18-e8201f7e8e57@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241210-uvc-roi-v16-18-e8201f7e8e57@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Dec-24 10:42 AM, Ricardo Ribalda wrote:
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
> Tested-by: Yunke Cao <yunkec@google.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, new version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../userspace-api/media/drivers/uvcvideo.rst       | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index a290f9fadae9..dbb30ad389ae 100644
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
> +	rectangle is in global sensor coordinates using pixel units. It is
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
> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
> +      - Setting this bit enables automatically capture the specified region
> +        with higher quality if possible.
> 


