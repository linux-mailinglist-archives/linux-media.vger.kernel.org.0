Return-Path: <linux-media+bounces-15911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9194A33E
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547621C226C4
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3D31C9EBF;
	Wed,  7 Aug 2024 08:46:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D373B3A267;
	Wed,  7 Aug 2024 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723020384; cv=none; b=chuRMttWyAbnpNVhPARxBm3nwtnmrE7nMCXiKPEYGxrb9Uu8kqzaa4t89fc+MuWwxLpCi+owH1XHDAw2axSxODhcT98OHutFifUP5xTwiPwILrh1TZOA7+3PJ7n8cyvglcfrsMsuPZVJkEf4pPoi6kT6oyoNGjFyPg50HEPrGCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723020384; c=relaxed/simple;
	bh=GRn1lhuBv7dWgVDIIISU2pr5nJJB5Nl3fhgqXkXs6Po=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eTHjcMnFCGbBFkURckcTeeTyiXUvAf86vTTDT3P+WrQvdVQEb4c0Mz7ovM7xMvMBt65N0kmtLOJ4gFkrh+E0oW2iX09GUrOJ1V1ySfqzZ5ZM8OpjGrF58F1lNL9n27cPgOxpsVJJUOR62EnInT6shVgFGhpVB7xzHwZRpLLv84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3E4C32782;
	Wed,  7 Aug 2024 08:46:23 +0000 (UTC)
Message-ID: <9281e270-01a9-434d-b19a-92978cdbdcc5@xs4all.nl>
Date: Wed, 7 Aug 2024 10:46:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] media: videodev2: Add flag to unconditionally
 enumerate pixel formats
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240731093457.29095-1-benjamin.gaignard@collabora.com>
 <20240731093457.29095-2-benjamin.gaignard@collabora.com>
 <c9e6ed97-bb42-465a-9bce-797adb44906f@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <c9e6ed97-bb42-465a-9bce-797adb44906f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2024 10:39, Hans Verkuil wrote:
> On 31/07/2024 11:34, Benjamin Gaignard wrote:
>> When the index is ORed with V4L2_FMTDESC_FLAG_ENUM_ALL the
>> driver clears the flag and enumerate all the possible formats,
>> ignoring any limitations from the current configuration.
>> Drivers which do not support this flag yet always return an EINVAL.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> change in version 6:
>> - Change flag name.
>> - Improve documentation.
>>
>>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 16 +++++++++++++++-
>>  .../media/videodev2.h.rst.exceptions             |  1 +
>>  include/uapi/linux/videodev2.h                   |  3 +++
>>  3 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> index 3adb3d205531..1112dc9044b2 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> @@ -85,7 +85,15 @@ the ``mbus_code`` field is handled differently:
>>      * - __u32
>>        - ``index``
>>        - Number of the format in the enumeration, set by the application.
>> -	This is in no way related to the ``pixelformat`` field.
>> +        This is in no way related to the ``pixelformat`` field.
>> +        When the index is ORed with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` the
>> +        driver clears the flag and enumerate all the possible formats,
> 
> enumerate -> enumerates
> 
>> +        ignoring any limitations from the current configuration. Drivers
>> +        which do not support this flag yet always return an ``EINVAL``
> 
> Drop the 'yet'.
> 
> But this raises a question: should this flag only be supported by drivers
> that can actually return different format lists depending on this flag?
> 
> Or can it be supported as well by a driver where this makes no difference?
> 
> I'm inclined to limit it to drivers that actually can return different
> results. If nothing else, that will indicate to the application that this
> is actually possible.
> 
> If we agree on that, then that should be documented as well.

I also think that this flag makes no sense for drivers that have
V4L2_CAP_IO_MC set, since in that case the list of returned formats shall
not depend on the active configuration (see
https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-enum-fmt.html ).

I think this should be mentioned in the documentation and tested for in the
compliance test.

Regards,

	Hans

> 
>> +        error code.
>> +        Formats enumerated when using ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
>> +        shouldn't be used when calling :c:func:`VIDIOC_ENUM_FRAMESIZES`
>> +        or :c:func:`VIDIOC_ENUM_FRAMEINTERVALS`.
>>      * - __u32
>>        - ``type``
>>        - Type of the data stream, set by the application. Only these types
>> @@ -234,6 +242,12 @@ the ``mbus_code`` field is handled differently:
>>  	valid. The buffer consists of ``height`` lines, each having ``width``
>>  	Data Units of data and the offset (in bytes) between the beginning of
>>  	each two consecutive lines is ``bytesperline``.
>> +    * - ``V4L2_FMTDESC_FLAG_ENUM_ALL``
>> +      - 0x80000000
>> +      - When the applications ORs ``index`` with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
>> +        the driver enumerates all the possible pixel formats without taking care
>> +        of any already set configuration. Drivers which do not support this flag
>> +        yet, always return ``EINVAL``.
> 
> Drop 'yet'
> 
>>  
>>  Return Value
>>  ============
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index bdc628e8c1d6..0a9ea9686c24 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>> +replace define V4L2_FMTDESC_FLAG_ENUM_ALL fmtdesc-flags
>>  
>>  # V4L2 timecode types
>>  replace define V4L2_TC_TYPE_24FPS timecode-type
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 4e91362da6da..421a30cb0c51 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
>>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>>  #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>>  
>> +/*  Format description flag, to be ORed with the index */
>> +#define V4L2_FMTDESC_FLAG_ENUM_ALL		0x80000000
>> +
>>  	/* Frame Size and frame rate enumeration */
>>  /*
>>   *	F R A M E   S I Z E   E N U M E R A T I O N
> 
> Regards,
> 
> 	Hans
> 


