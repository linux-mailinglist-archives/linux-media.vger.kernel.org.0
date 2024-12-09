Return-Path: <linux-media+bounces-22948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D779E9AA2
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7201887AAD
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7B01F0E30;
	Mon,  9 Dec 2024 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIfHKBYE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9501C5CAA
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733758295; cv=none; b=JxloW9Q3/Wv5r1vK76mgXkP6R1kdtWtQrqZWrs+Ic24drobiYkT07F/GUdpFIyM2xgoJbGBCvV9bAcwPwF3N8cGpERaOhe/clWL05c/yPvUYKu3D682D5i/ff/0f85fV++wQtQeh+nttb+0sqC7ylcdtL6MDDW9ulCd+gf0mkyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733758295; c=relaxed/simple;
	bh=rhmAbbFE389OWi7Qqlx7FhnIGzuR/ojMrk9rsBpDcJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMbw/KiBfSVS5FtqBaU1j0QJmEy+ghts+QrDy/+7HacfAzobpmyd4AdKh2eHAFfuf3jR070WpCWw/J7AswFQGkOGyIutszYnScH3zmBP3tt5NGBwOjUxLDbDS8yw8vpP4kcKfcVSUoEwu2LGNvAm8I4zGoc0WNqXBkOY70j7DT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fIfHKBYE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733758292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+pfazl4ro4Z0q3+aAWow2eofy7cY7lz2m7JpJlKTGm8=;
	b=fIfHKBYENUXjQYvtN4mAlQmaPnuMDAJKXMVfZmI75eyQeNu2oPU3ShCoWJkkwAjZBww14z
	xK3DzWGBPLrQnhJQVdHMuRjm+KNw5990kQaXsdTJZJWIDzsqVDAa0d6EPA29vH3G/4+UEq
	LVn5Q9mPd9DVv3dKMX7iW/Fm4mkglMk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-jMWi4p_INlKMxT7FFCnZIA-1; Mon, 09 Dec 2024 10:31:29 -0500
X-MC-Unique: jMWi4p_INlKMxT7FFCnZIA-1
X-Mimecast-MFC-AGG-ID: jMWi4p_INlKMxT7FFCnZIA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa66bc3b46dso116877166b.3
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 07:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733758288; x=1734363088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pfazl4ro4Z0q3+aAWow2eofy7cY7lz2m7JpJlKTGm8=;
        b=ZhXkgbRRB2CgnYvgzc8kDZqlb+QkpvX12BHtpnpgch+fWEVmCIe3vbeXt4dn1e2G+Y
         uTzFPJUHL3zE25qEwMowAzR2xPdfPUZO/tF7tQqxWQGwdkKQ/0fcy/wBnVLe5IsqhgGM
         Sx+CUoOwlNmwB9eWwyOex73Fbup122bQpuZBcVocdqZl3d4TdmYS+WkkLRgj5A2I0Kj5
         p0SCyyzyb2RDfBH7r4OxrOu2dlL2fHqfOkL13/btei+qhtGrZBEUsvuxHxCwIK8enPQ/
         kt/YCOV9cFO2OcNOJu8opeqh2chcb3di6g1zfP7RerrWk+tyatGqs5oky3uUlnq7dnoW
         c3fA==
X-Forwarded-Encrypted: i=1; AJvYcCWjNfddp8/46dD6kIeflYC2hVbMhTaCLugsHS7ExVuaJsvUIpLh++421xvwW6Pp4KOx6SoXN22f8ZURMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6FZ4SzIa8bWYBEExB32objuvTIVLPbOH9EM7e2IhYpTMqcPEO
	O06lgPlmoapCbxgeZ6zQBsyPsTSul3eY8cYiXnQOD+3dkAZqMNwa9oMu0tRu4+mGLKMQXClEdF3
	qNWHvGnke60W7OmsWBEbSc3WWkKNF5DgdT187dg9iyGzj+VtAKwGLSlFnhAHt
X-Gm-Gg: ASbGncv+64+8R8O61NZWM/ACsIltzFtalK1ueTqUQqp+JNSMJQmyaAMowYKcSiSJsAV
	xMyB4fuVRqLcXt+HWeQiwO7xJyVim7bqydKp/jCIKvZe0MRd+d20QLrJ4dFKq3BLFT6ouMMdWbl
	m9OYzc/tITB89sYUPHrP78UMtni4/r65liuw9vN8/r1H2IbYaQxtDusFSX6tu/7bD2tSWl5qC8U
	XY38l0DCOSRZjRECtmFxXPP6MnvUb9EwXOivJToZ5TJ1tWVmMIt5A==
X-Received: by 2002:a05:6402:1d50:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5d4185d61cbmr2135472a12.22.1733758287708;
        Mon, 09 Dec 2024 07:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIygLNw4RGjyPR9wVkpz580F7qpOA4x36Zoh10CEUjmfOImUBPgUgpvagmFQjmX9b4EMlGyg==
X-Received: by 2002:a05:6402:1d50:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5d4185d61cbmr2135404a12.22.1733758287177;
        Mon, 09 Dec 2024 07:31:27 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6770d7698sm274659966b.43.2024.12.09.07.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:31:26 -0800 (PST)
Message-ID: <8bb30f4e-1e70-4413-bb50-d5562a7f6a1e@redhat.com>
Date: Mon, 9 Dec 2024 16:31:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 19/19] media: uvcvideo: document UVC v1.5 ROI
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-19-64cfeb56b6f8@chromium.org>
 <13a3c23e-7a8a-4957-bdd7-d8de2844b904@redhat.com>
 <CANiDSCsphbdkHePXManvtR_i4iSUmHkFXQLzZGSc7BJ900c1Hw@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCsphbdkHePXManvtR_i4iSUmHkFXQLzZGSc7BJ900c1Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Dec-24 4:22 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 9 Dec 2024 at 15:36, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
>>> From: Yunke Cao <yunkec@google.com>
>>>
>>> Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
>>> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>>>
>>> An example of a userspace implementing this feature can be found at:
>>> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/
>>>
>>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>>> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> --->  .../userspace-api/media/drivers/uvcvideo.rst       | 64 ++++++++++++++++++++++
>>>  1 file changed, 64 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
>>> index a290f9fadae9..1cdcd45907a3 100644
>>> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
>>> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
>>> @@ -181,6 +181,7 @@ Argument: struct uvc_xu_control_mapping
>>>       UVC_CTRL_DATA_TYPE_BOOLEAN      Boolean
>>>       UVC_CTRL_DATA_TYPE_ENUM         Enumeration
>>>       UVC_CTRL_DATA_TYPE_BITMASK      Bitmask
>>> +     UVC_CTRL_DATA_TYPE_RECT         Rectangular area
>>>
>>>
>>>  UVCIOC_CTRL_QUERY - Query a UVC XU control
>>> @@ -255,3 +256,66 @@ Argument: struct uvc_xu_control_query
>>>       __u8    query           Request code to send to the device
>>>       __u16   size            Control data size (in bytes)
>>>       __u8    *data           Control value
>>> +
>>> +
>>> +Driver-specific V4L2 controls
>>> +-----------------------------
>>> +
>>> +The uvcvideo driver implements the following UVC-specific controls:
>>> +
>>> +``V4L2_CID_UVC_REGION_OF_INTEREST_RECT (struct)``
>>> +     This control determines the region of interest (ROI). ROI is a
>>> +     rectangular area represented by a struct :c:type:`v4l2_rect`. The
>>> +     rectangle is in global sensor coordinates and pixel units. It is
>>
>> Maybe: "The rectangle is in global sensor coordinates using pixel units" ?
>>
>> being "in pixel units" sounds a bit weird and had me confused for a moment.
>>
>>> +     independent of the field of view, not impacted by any cropping or
>>> +     scaling.
>>> +
>>> +     Use ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` to query
>>> +     the range of rectangle sizes.
>>> +
>>> +     Setting a ROI allows the camera to optimize the capture for the region.
>>> +     The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control determines
>>> +     the detailed behavior.
>>> +
>>> +     An example of use of this control, can be found in the:
>>> +     `Chrome OS USB camera HAL.
>>> +     <https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/>`
>>
>> Hmm, not sure we want this in the API documentation. OTOH why not ? Anyone else
>> have an opinion on this ?
> 
> Laurent requested this:
> https://lore.kernel.org/linux-media/20231218034413.GN5290@pendragon.ideasonboard.com/

Ok, keeping this as is works for me.

>>> +
>>> +
>>> +``V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (bitmask)``
>>> +     This determines which, if any, on-board features should track to the
>>> +     Region of Interest specified by the current value of
>>> +     ``V4L2_CID_UVD__REGION_OF_INTEREST_RECT``.
>>> +
>>> +     Max value is a mask indicating all supported Auto Controls.
>>> +
>>> +.. flat-table::
>>> +    :header-rows:  0
>>> +    :stub-columns: 0
>>> +
>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE``
>>> +      - Setting this bit causes automatic exposure to track the region of
>>> +     interest instead of the whole image.
>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS``
>>> +      - Setting this bit causes automatic iris to track the region of interest
>>> +        instead of the whole image.
>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
>>> +      - Setting this bit causes automatic white balance to track the region
>>> +     of interest instead of the whole image.
>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS``
>>> +      - Setting this bit causes automatic focus adjustment to track the region
>>> +        of interest instead of the whole image.
>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT``
>>> +      - Setting this bit causes automatic face detection to track the region of
>>> +        interest instead of the whole image.
>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
>>> +      - Setting this bit enables automatic face detection and tracking. The
>>> +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
>>> +     the driver.
>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
>>> +      - Setting this bit enables automatic image stabilization. The
>>> +     current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
>>> +     the driver.
>>
>> This one I do not understand. Since the ROI is not a crop, I don't see how
>> this interacts with image-stabilization. Typically digital image-stabilization
>> uses a moving slightly smaller crop of the full sensor rectangle which it moves
>> around in realtime to compensate for camera movements.
>>
>> So I wonder what this is expected to do. Does this set the ROI to the image
>> stabilization crop ? I guess that combined with reading back the ROI that might be
>> somewhat useful to follow what the image stabilization code is doing.
>>
>> OTOH this does not seem useful for using as region for AEC / AWB ?
> 
> Unfortunately, the standard is not very verbose about this:
> https://ibb.co/VppnQ43
> 
> What about:
> 
> - ``Image Stabilization`` bit from the UVC's bmAutoControls Region of
> Interest Control.
> > ?

I have no strong preference for either the current wording or the new
wording you just suggested. Either one seems pretty vague / unclear to me,
but I realize that is just the result of the specification being unclear
on this point.

So use what you think is best and then we'll just have to live with
this being a bit vague.

>>> +    * - ``V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
>>> +      - Setting this bit enables automatically capture the specified region
>>> +        with higher quality if possible.
>>>
>>
>> Otherwise this looks good to me. But I would still like to see
>> a discussion about using UVC custom ctrls instead of something standardized
>> for this. Although I guess maybe that already happened before I got involved ?
> 
> Seems like both Hans V and Laurent preferred uvc custom controls:
> 
> https://lore.kernel.org/linux-media/a0fe2b49-12b7-8eaf-c3ef-7af1a247e595@xs4all.nl

Ack.

Regards,

Hans



