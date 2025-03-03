Return-Path: <linux-media+bounces-27354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FDAA4C584
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C214C165710
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5312147EE;
	Mon,  3 Mar 2025 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSn95J4n"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C579F214818
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741016648; cv=none; b=JYSIp5pV3KDUN4Ust5C4QBfZEoMPPWmddDkAFSZDtstqZBntzLp906ESjvrEUk+AivwaMRu/FTUFYAKokvHU/M6VYrHFlGm+7L648avB81RMQ4noPEOc96DMz+lSYDeUPCveNzMy2QOtmPSo9CCzFBewuFi7dLrYBayExd4Ehnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741016648; c=relaxed/simple;
	bh=cgLIn6Vi8l6YHgOvHn4WESJXdJstmdBTRnpwj4gE/u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKQP9hik9ZqbydeA3mxWbGJeUrpPaOpcFoIF731WUKWwLllKWN9xlZzbBUqFQR/2i2eRNnzWt/ZIM+DDCYpOFTzqxs51UTjh7MTLCc7zWy+JKinzV8b3V48TS5FYuynSYoXIEZS4sxG0YOLyPGIVHcogNrgo1iGiplBfUwnk+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSn95J4n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741016645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yS1bTZI7Ld1FbjeovSjVfqwcM/6nHOuroLM80Ys20ls=;
	b=RSn95J4nGOFw3gumZDp2zEQqQ/n0I4bkVOQmvCN8x83ye8GyQbNC7GbEgCAizPtb3kNtF3
	JR/VqzgnpJF7mp53imjWosmie4dvMSzsgpRqU36+O/7GTPRW371fs0ZKpauBMNnKcnUMJ6
	H/ATDHHUJEmlHfPtywG+AL9QXJvzKO4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-bOxbHXbTMaSVWSYzC_Mutw-1; Mon, 03 Mar 2025 10:43:54 -0500
X-MC-Unique: bOxbHXbTMaSVWSYzC_Mutw-1
X-Mimecast-MFC-AGG-ID: bOxbHXbTMaSVWSYzC_Mutw_1741016633
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-abf68178603so190707066b.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 07:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741016632; x=1741621432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS1bTZI7Ld1FbjeovSjVfqwcM/6nHOuroLM80Ys20ls=;
        b=igZh8wX7LZ5+7hZuqLbjMy9mLMei+aJcmRfibr7d/DG/fDyncaZZgu84849sQiTvYX
         0nj1FTDZfs7UwWSSQKm0Gn3vwH5HrT+FF9vPUaMxM48xI1yhwfXQirB2cH8T24FqsF62
         GvtI49H2Jqx9n8aqgy9iavbZz/kpUblv9ppicGxEApSIgI1bJ3RNhCCW1DzihOktG4I0
         Z+h4HVKqnqtkywn/T1thZV6MLMG14WfNLh9gxmub8XKOKwmJysRzEujn2bM+ULMu2lSG
         7KRwL0F9zA9vtH/BUglP2t+pv+7Wytqb9LKxJCgZkGIkD66bzQxjL3H6l976qSGr80Mt
         KnSw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ggf/Tw0dG1gROU49O/9up48rME1nBG/Q9d/4qhCWnMgxNtIatlUkATduYkPLOVgDRY8J1t+54th4Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXmUWKEXFjIkd/AnwBt1DOxWOsIIx1TW1CnJiVGrwtzQq6gDn
	Kqvk/NTq2yloHGlL9gNMVCcavac+4zShPFWr1llWQdwKluTXsJ5Y/bt2qJaPR15i1SpgPn/BfVC
	Bxe3bqTRiDDGDwc+5NYh/4qDNQZOokruQwJ9vnzmb7l4ry6J4xIzmfUB0mNXEM3QmUA58
X-Gm-Gg: ASbGncseJQO7A7ss5ZEJNWffZ/++zsZw265Yvbj4CMePMlE3w7CGRM5cxIOqXTh6sRe
	I2ynQ9yovBp8IYPYdAasMEJnpCBpo6By7F1IRPjkbznrB5GqCggTogiBVfAJhL0JkD/vH1e80dy
	KI8EfCrkIsioqixe8NWAVRHzYsEoaCvpfcidr+bbFE2YhSrT3D3GivacAhG76Uiac0CUrmd4ktN
	vYA/AnQiKFmOD3WF35vtMl9Yxk0WohsMLtZWKw5Uzj4yFgqfKTU+7uI5ii9xEfFCHTaCSPrgj6l
	eHrAZHQ3AMk+aGtCHGg=
X-Received: by 2002:a17:906:6a09:b0:ab7:f096:61d8 with SMTP id a640c23a62f3a-abf2621812fmr1663905766b.29.1741016632308;
        Mon, 03 Mar 2025 07:43:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2TN/9pE+LsA9mzXJ+6QHhCbHSEE7+HJRnCy9fkYYOcYoUIpNdPsKj0Bmn1yPtSwgeIH9K6Q==
X-Received: by 2002:a17:906:6a09:b0:ab7:f096:61d8 with SMTP id a640c23a62f3a-abf2621812fmr1663903166b.29.1741016631846;
        Mon, 03 Mar 2025 07:43:51 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf3e117114sm593499566b.147.2025.03.03.07.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 07:43:51 -0800 (PST)
Message-ID: <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>
Date: Mon, 3 Mar 2025 16:43:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
 <c6ab8640-d96c-4a71-929a-a4ad6bb2647d@redhat.com>
 <20250303151346.GC32048@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250303151346.GC32048@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Mar-25 16:13, Laurent Pinchart wrote:
> On Mon, Mar 03, 2025 at 03:47:51PM +0100, Hans de Goede wrote:
>> On 26-Feb-25 14:00, Ricardo Ribalda wrote:
>>> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
>>> V4L2_META_FMT_D4XX. The only difference between the two of them is that
>>> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
>>> V4L2_META_FMT_D4XX copies the whole metadata section.
>>>
>>> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
>>> devices, but it is useful for any device where vendors include other
>>> metadata, such as the one described by Microsoft:
>>> - https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
>>>
>>> This patch removes the UVC_INFO_META macro and enables
>>> V4L2_META_FMT_D4XX for every device. It also updates the documentation
>>> to reflect the change.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> I don't quite agree, sorry.
> 
> The reason why the current mechanism has been implemented this way is to
> ensure we have documentation for the metadata format of devices that
> expose metadata to userspace.
> 
> If you want to expose the MS metadata, you can create a new metadata
> format for that, and enable it on devices that implement it.

Looking at the long list of quirks this removes just for the D4xx
cameras I do not believe that having quirked based relaying of
which metadata fmt is used to userspace is something which scales
on the long term. Given the large amount of different UVC cameras
I really think we should move the USB VID:PID -> metadata format
mapping out of the kernel.

I do agree that using V4L2_META_FMT_D4XX for every device is
probably not the best idea. So my suggestion would be to add
a new V4L2_META_FMT_CUSTOM metadata fmt and for index 1
metadata fmt use V4L2_META_FMT_D4XX for the currently quirked
cams and use V4L2_META_FMT_CUSTOM for other cameras.

This can then be combined with a udev-rule + hwdb to provide
info of what V4L2_META_FMT_CUSTOM should be mapped to in userspace,
moving further VID:PID -> extended-metadata fmt mappings out of
the kernel.

Regards,

Hans



> 
>>> ---
>>>  .../userspace-api/media/v4l/metafmt-d4xx.rst       | 19 +++--
>>>  .../userspace-api/media/v4l/metafmt-uvc.rst        |  6 +-
>>>  drivers/media/usb/uvc/uvc_driver.c                 | 83 ----------------------
>>>  drivers/media/usb/uvc/uvc_metadata.c               | 15 ++--
>>>  drivers/media/usb/uvc/uvcvideo.h                   |  1 -
>>>  5 files changed, 23 insertions(+), 101 deletions(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
>>> index 0686413b16b2..1b18ef056934 100644
>>> --- a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
>>> +++ b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
>>> @@ -6,12 +6,23 @@
>>>  V4L2_META_FMT_D4XX ('D4XX')
>>>  *******************************
>>>  
>>> -Intel D4xx UVC Cameras Metadata
>>> +UVC Full Payload Header Data (formerly known as Intel D4xx UVC Cameras
>>> +Metadata).
>>>  
>>>  
>>>  Description
>>>  ===========
>>>  
>>> +V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
>>> +V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
>>> +payload header data. It was originally implemented for Intel D4xx cameras, and
>>> +thus the name, but now it can be used by any UVC device, when userspace wants
>>> +full access to the UVC Metadata.
>>> +
>>> +
>>> +Intel D4xx Metadata
>>> +===================
>>> +
>>>  Intel D4xx (D435, D455 and others) cameras include per-frame metadata in their UVC
>>>  payload headers, following the Microsoft(R) UVC extension proposal [1_]. That
>>>  means, that the private D4XX metadata, following the standard UVC header, is
>>> @@ -21,10 +32,8 @@ types are MetadataId_CaptureStats (ID 3), MetadataId_CameraExtrinsics (ID 4),
>>>  and MetadataId_CameraIntrinsics (ID 5). For their description see [1_]. This
>>>  document describes proprietary metadata types, used by D4xx cameras.
>>>  
>>> -V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
>>> -V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
>>> -payload header data. D4xx cameras use bulk transfers and only send one payload
>>> -per frame, therefore their headers cannot be larger than 255 bytes.
>>> +D4xx cameras use bulk transfers and only send one payload per frame, therefore
>>> +their headers cannot be larger than 255 bytes.
>>>  
>>>  This document implements Intel Configuration version 3 [9_].
>>>  
>>> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
>>> index 784346d14bbd..a3aae580e89e 100644
>>> --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
>>> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
>>> @@ -6,7 +6,7 @@
>>>  V4L2_META_FMT_UVC ('UVCH')
>>>  *******************************
>>>  
>>> -UVC Payload Header Data
>>> +UVC Partial Payload Header Data (formerly known as UVC Payload Header Data).
>>>  
>>>  
>>>  Description
>>> @@ -44,7 +44,9 @@ Each individual block contains the following fields:
>>>          them
>>>      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
>>>      * - __u8 length;
>>> -      - length of the rest of the block, including this field
>>> +      - length of the rest of the block, including this field (please note that
>>> +        regardless of this value, the driver will never copy more than 12
>>> +        bytes).
>>>      * - __u8 flags;
>>>        - Flags, indicating presence of other standard UVC fields
>>>      * - __u8 buf[];
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index deadbcea5e22..f19dcd4a7ac6 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -2488,8 +2488,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>>>  };
>>>  
>>>  #define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
>>> -#define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
>>> -	{.meta_format = m}
>>>  
>>>  /*
>>>   * The Logitech cameras listed below have their interface class set to
>>> @@ -3107,87 +3105,6 @@ static const struct usb_device_id uvc_ids[] = {
>>>  	  .bInterfaceSubClass	= 1,
>>>  	  .bInterfaceProtocol	= 0,
>>>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
>>> -	/* Intel D410/ASR depth camera */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0ad2,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel D415/ASRC depth camera */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0ad3,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel D430/AWG depth camera */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0ad4,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel RealSense D4M */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0b03,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel D435/AWGC depth camera */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0b07,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel D435i depth camera */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0b3a,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel D405 Depth Camera */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0b5b,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel D455 Depth Camera */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x0b5c,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>> -	/* Intel D421 Depth Module */
>>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
>>> -	  .idVendor		= 0x8086,
>>> -	  .idProduct		= 0x1155,
>>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
>>> -	  .bInterfaceSubClass	= 1,
>>> -	  .bInterfaceProtocol	= 0,
>>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
>>>  	/* Generic USB Video Class */
>>>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
>>>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
>>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
>>> index 82de7781f5b6..5c44e6cdb83c 100644
>>> --- a/drivers/media/usb/uvc/uvc_metadata.c
>>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
>>> @@ -60,18 +60,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>>>  				    struct v4l2_format *format)
>>>  {
>>>  	struct v4l2_fh *vfh = file->private_data;
>>> -	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>>> -	struct uvc_device *dev = stream->dev;
>>>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
>>> -	u32 fmeta = fmt->dataformat;
>>> +	u32 fmeta = fmt->dataformat == V4L2_META_FMT_D4XX ?
>>> +		    V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
>>>  
>>>  	if (format->type != vfh->vdev->queue->type)
>>>  		return -EINVAL;
>>>  
>>>  	memset(fmt, 0, sizeof(*fmt));
>>>  
>>> -	fmt->dataformat = fmeta == dev->info->meta_format
>>> -			? fmeta : V4L2_META_FMT_UVC;
>>> +	fmt->dataformat = fmeta;
>>>  	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>>>  
>>>  	return 0;
>>> @@ -110,19 +108,16 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>>>  				      struct v4l2_fmtdesc *fdesc)
>>>  {
>>>  	struct v4l2_fh *vfh = file->private_data;
>>> -	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>>> -	struct uvc_device *dev = stream->dev;
>>>  	u32 index = fdesc->index;
>>>  
>>> -	if (fdesc->type != vfh->vdev->queue->type ||
>>> -	    index > 1U || (index && !dev->info->meta_format))
>>> +	if (fdesc->type != vfh->vdev->queue->type || index > 1U)
>>>  		return -EINVAL;
>>>  
>>>  	memset(fdesc, 0, sizeof(*fdesc));
>>>  
>>>  	fdesc->type = vfh->vdev->queue->type;
>>>  	fdesc->index = index;
>>> -	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
>>> +	fdesc->pixelformat = index ? V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
>>>  
>>>  	return 0;
>>>  }
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 5e388f05f3fc..cc2092ae9987 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -534,7 +534,6 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
>>>  
>>>  struct uvc_device_info {
>>>  	u32	quirks;
>>> -	u32	meta_format;
>>>  	u16	uvc_version;
>>>  };
>>>  
>>>
>>> ---
>>> base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
>>> change-id: 20250226-uvc-metadata-2e7e445966de
> 


