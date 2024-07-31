Return-Path: <linux-media+bounces-15606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D694273E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AEAD1F23277
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5671A4B42;
	Wed, 31 Jul 2024 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bHvJaHi2"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD718A6DE;
	Wed, 31 Jul 2024 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409191; cv=none; b=NRwL8BIR+3dWmU4j43Mf/WERGe6iMubH7nj/syP3ldvfb1061TMfFsoobKtRIOl1pWussDJMlgG1yPh31SnfaUdUClqn215icjBanIU2QfY0U+NsRqAIkM3JzTn39IiLyf7JCZh9bTqEaL0+TjzQcak2vaniEIcENHvRiDWf72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409191; c=relaxed/simple;
	bh=n+CAh0szVygNgHKy0GYO4UDd48RX8zU1dm4Bwzwuils=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLtQGYf7io2azP7pITLR7EmlqCPXwKEiTR5SxWIUeh08B4nqMEGJu/QCHXI9aYkZNByS1FNbMwaVUABakW/aXszr1cCi8WlVFfbdOMBAKAQqD6saQAXp48MeRXjkt6NLz40bro9v69L1Sxdx1z4Jcg6iSRgs/TCPYIGHOk+B1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bHvJaHi2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722409188;
	bh=n+CAh0szVygNgHKy0GYO4UDd48RX8zU1dm4Bwzwuils=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bHvJaHi2ybkPNIcCmoLEFYV5ImEwTDPqbnS36j4jPWcD6IRvA6/zb0HGiv+h3wosH
	 M3VJHoKgu0+88L80NhBvbnle7DeIO4DflMh50h6LOMrLtshjC4LRFloFZcqn84Kr/b
	 YZd6FRRM3WHxfOzqkz7m7ZXBlNRQdhTIPGJaS7NAScEvhwregrNlzih+HJcZAdovoy
	 I7Kl/kotzWDrWGP9eJqW+RgU81s2z5WlkGHbMC0nXNEFjo5nIlH78UxUU5bHLnVYvw
	 kV9dNVHP2FKviPeybvKe13y1CB+TvG/INmUxcQHgJkUNIg4DDpp/0/+JpqDAqMaJjM
	 BlOy6KEsJ54oA==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D0D773780B79;
	Wed, 31 Jul 2024 06:59:47 +0000 (UTC)
Message-ID: <3e5659f2-582a-4e20-9e45-9841e5b191da@collabora.com>
Date: Wed, 31 Jul 2024 08:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] media: videodev2: Add flag to unconditionnaly
 enumerate pixels formats
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-2-benjamin.gaignard@collabora.com>
 <0b4e2f13-8d79-4931-b868-6100f8b8893f@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <0b4e2f13-8d79-4931-b868-6100f8b8893f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 30/07/2024 à 09:08, Hans Verkuil a écrit :
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
>>   .../userspace-api/media/v4l/vidioc-enum-fmt.rst      | 12 +++++++++++-
>>   .../userspace-api/media/videodev2.h.rst.exceptions   |  1 +
>>   include/uapi/linux/videodev2.h                       |  3 +++
>>   3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> index 3adb3d205531..12e1e65e6a71 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> @@ -85,7 +85,11 @@ the ``mbus_code`` field is handled differently:
>>       * - __u32
>>         - ``index``
>>         - Number of the format in the enumeration, set by the application.
>> -	This is in no way related to the ``pixelformat`` field.
>> +        This is in no way related to the ``pixelformat`` field. When the
> You need to start a new paragraph before 'When'. Otherwise you might read
> that the 'When' sentence is somehow related to the previous sentence.
>
>> +        index is ORed with V4L2_FMT_FLAG_ENUM_ALL the driver will ignore
>> +        any configuration and enumerate all the possible formats. Drivers
> I'd rephrase this a little bit:
>
> the driver will enumerate all the possible formats, ignoring any limitations
> from the current configuration.
>
> And after that I would like to see an example of a use-case.
>
>> +        which do not support this flag yet always return an ``EINVAL``
>> +        error code.
>>       * - __u32
>>         - ``type``
>>         - Type of the data stream, set by the application. Only these types
>> @@ -234,6 +238,12 @@ the ``mbus_code`` field is handled differently:
>>   	valid. The buffer consists of ``height`` lines, each having ``width``
>>   	Data Units of data and the offset (in bytes) between the beginning of
>>   	each two consecutive lines is ``bytesperline``.
>> +    * - ``V4L2_FMT_FLAG_ENUM_ALL``
> I am not really happy with this name since the prefix is identical to that
> of other V4L2_FMT_FLAG_ defines. How about: V4L2_FMTDESC_FLAG_ENUM_ALL?
> Or V4L2_FMT_IDX_ENUM_ALL?

I will use V4L2_FMTDESC_FLAG_ENUM_ALL in the next version.

Regards,
Benjamin

>
>> +      - 0x80000000
>> +      - When the applications ORs ``index`` with ``V4L2_FMT_FLAG_ENUM_ALL`` flag
>> +        the driver enumerates all the possible pixel formats without taking care
>> +        of any already set configuration. Drivers which do not support this flag
>> +        yet always return ``EINVAL``.
>>   
>>   Return Value
>>   ============
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index bdc628e8c1d6..8dc10a500fc6 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>> +replace define V4L2_FMT_FLAG_ENUM_ALL fmtdesc-flags
>>   
>>   # V4L2 timecode types
>>   replace define V4L2_TC_TYPE_24FPS timecode-type
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 4e91362da6da..3d11f91273a1 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
>>   #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>>   #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>>   
>> +/*  Format description flag, to be ORed with the index */
>> +#define V4L2_FMT_FLAG_ENUM_ALL			0x80000000
>> +
>>   	/* Frame Size and frame rate enumeration */
>>   /*
>>    *	F R A M E   S I Z E   E N U M E R A T I O N
> Regards,
>
> 	Hans
>

