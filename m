Return-Path: <linux-media+bounces-15521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8101F940969
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C6C7285133
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D666718FC6C;
	Tue, 30 Jul 2024 07:19:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7809916B3B7;
	Tue, 30 Jul 2024 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323951; cv=none; b=Wg87tits3e8muwjUDwwFsQeA1oJrNZ8B7hA8h1zUkU15PoP+KCLna3CSYrDrTQYhH66y1MrJLuIXl3WqSvKLX6XsNKjwOdoON20GwfC0DeY7A97xJJJmgwVMW+VA1vXjwHzA5wc7dXfsz1ou4fTUckcefSNk9asoW2DApzhqXzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323951; c=relaxed/simple;
	bh=hUV9f/5+nlfX4Hbz4wtavhHxRO4PKRY8agHJdpj7Qjg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=suq4aoCC6RiK7QCDBJhMKsZBhvpcyX+w4y71j2Um5+dDkNQ3XOx4C3EOn6EovXnGnAXn6Rhc+bQ6Keq2pabZ9fG33WgKM6eEqvGrx9aBL61pB/ZzTjEwJ4sTpjUccZXy7KtI7bc4XjL0KtJS1m+QW2EP0bIHbO5A8fBeZKZb8Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBA0C32782;
	Tue, 30 Jul 2024 07:19:08 +0000 (UTC)
Message-ID: <3459c15d-5492-4765-b81c-9360d4291384@xs4all.nl>
Date: Tue, 30 Jul 2024 09:19:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: videodev2: Add flag to unconditionnaly
 enumerate pixels formats
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-2-benjamin.gaignard@collabora.com>
 <0b4e2f13-8d79-4931-b868-6100f8b8893f@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <0b4e2f13-8d79-4931-b868-6100f8b8893f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2024 09:08, Hans Verkuil wrote:
> On 22/07/2024 17:05, Benjamin Gaignard wrote:
>> When the index field is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver
>> will ignore any configuration and enumerate all the possible formats.
>> Drivers which do not support this flag yet always return an EINVAL
>> error code.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> changes in version 5:
>> - Reset the proposal to follow Hans's advices
>> - Add new flag to be used with index field.
>>
>>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst      | 12 +++++++++++-
>>  .../userspace-api/media/videodev2.h.rst.exceptions   |  1 +
>>  include/uapi/linux/videodev2.h                       |  3 +++
>>  3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> index 3adb3d205531..12e1e65e6a71 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> @@ -85,7 +85,11 @@ the ``mbus_code`` field is handled differently:
>>      * - __u32
>>        - ``index``
>>        - Number of the format in the enumeration, set by the application.
>> -	This is in no way related to the ``pixelformat`` field.
>> +        This is in no way related to the ``pixelformat`` field. When the
> 
> You need to start a new paragraph before 'When'. Otherwise you might read
> that the 'When' sentence is somehow related to the previous sentence.
> 
>> +        index is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver will ignore
>> +        any configuration and enumerate all the possible formats. Drivers
> 
> I'd rephrase this a little bit:
> 
> the driver will enumerate all the possible formats, ignoring any limitations
> from the current configuration.
> 
> And after that I would like to see an example of a use-case.

Should the flag be kept on return of VIDIOC_ENUM_FMT or should it be cleared?
For reference: VIDIOC_QUERYCTRL will clear the V4L2_CTRL_FLAG_NEXT_CTRL flag.

Regardless of what we pick, it should be documented.

Regards,

	Hans

> 
>> +        which do not support this flag yet always return an ``EINVAL``
>> +        error code.
>>      * - __u32
>>        - ``type``
>>        - Type of the data stream, set by the application. Only these types
>> @@ -234,6 +238,12 @@ the ``mbus_code`` field is handled differently:
>>  	valid. The buffer consists of ``height`` lines, each having ``width``
>>  	Data Units of data and the offset (in bytes) between the beginning of
>>  	each two consecutive lines is ``bytesperline``.
>> +    * - ``V4L2_FMT_FLAG_ENUM_ALL``
> 
> I am not really happy with this name since the prefix is identical to that
> of other V4L2_FMT_FLAG_ defines. How about: V4L2_FMTDESC_FLAG_ENUM_ALL?
> Or V4L2_FMT_IDX_ENUM_ALL?
> 
>> +      - 0x80000000
>> +      - When the applications ORs ``index`` with ``V4L2_FMT_FLAG_ENUM_ALL`` flag
>> +        the driver enumerates all the possible pixel formats without taking care
>> +        of any already set configuration. Drivers which do not support this flag
>> +        yet always return ``EINVAL``.
>>  
>>  Return Value
>>  ============
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index bdc628e8c1d6..8dc10a500fc6 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>> +replace define V4L2_FMT_FLAG_ENUM_ALL fmtdesc-flags
>>  
>>  # V4L2 timecode types
>>  replace define V4L2_TC_TYPE_24FPS timecode-type
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 4e91362da6da..3d11f91273a1 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
>>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>>  #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>>  
>> +/*  Format description flag, to be ORed with the index */
>> +#define V4L2_FMT_FLAG_ENUM_ALL			0x80000000
>> +
>>  	/* Frame Size and frame rate enumeration */
>>  /*
>>   *	F R A M E   S I Z E   E N U M E R A T I O N
> 
> Regards,
> 
> 	Hans
> 


