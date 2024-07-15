Return-Path: <linux-media+bounces-15006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F8930DCF
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 08:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDBC1F2152D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 06:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAA1183095;
	Mon, 15 Jul 2024 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cCRdKqiQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810325779;
	Mon, 15 Jul 2024 06:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721023800; cv=none; b=sZIOcWu3mzh1O2m5qZ7HQfXbl3XRUboRTH4OWUv9Yv8v6VkMdD5Nvnyk0jmU3fRaiMkNGbATgmHomfnVWS8dtqx/UPQD07i7lBzUm2t6g4AwuSTQbp/pbcOYKN/phC3zrvfFeERHAHGT3Wf+zKd89l1/o01TOU5n8yH782ip8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721023800; c=relaxed/simple;
	bh=QKuNqCEPwme9J+HyljwyzRrQNe7tGsB+c6hUv/0hsZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yh6VU2O+GpJypfTujExADCD1mrV7V86ICIaSTEsPA5iscxFF0U+P+QBVRP9MIDzda4X89XPHLevdNNz5DBbYKmussWi5mDDUqdfCh2a/fM/kAsZhqRTgRZKTKPyWc8J8HhYJ2daU46VU+9ipPyYd0jf52j+NumJYVZkZzYooOU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cCRdKqiQ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721023796;
	bh=QKuNqCEPwme9J+HyljwyzRrQNe7tGsB+c6hUv/0hsZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cCRdKqiQOstIvs1FAsqJBCWUYe//mDp1WYP8IyEYcNgneRJlt9gfrppjlI5ntHDR/
	 Otf6Z31HrBwKI0CTjZUDNNxdi5TrSX5b2idGOMb4GkCiEwqFNebWIDh8rnxL62uDCv
	 c3d2pg2jKV1sKr1gHgHFfo4Lk3poB2ULFRbQJHoK311XEJHLqIOq8gaA3XzyJg8/lO
	 c4GTsCXnbshXHPMpCBb0bA5QMmT5CXdCIe7SBf4t+28By1IkMl8gDNM3Stm5D2spwk
	 gyGWTJsg9iW2Nwv6ZDgWAtDJuGUu3PLou+8vTN60aGzXwWxUNCm7Ip0m+1spzckAbi
	 o4EM5HXVfuhBQ==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F403837811B9;
	Mon, 15 Jul 2024 06:09:55 +0000 (UTC)
Message-ID: <bc239839-bef4-486e-a636-0afab6723718@collabora.com>
Date: Mon, 15 Jul 2024 08:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20240712103000.16655-1-benjamin.gaignard@collabora.com>
 <20240712103000.16655-2-benjamin.gaignard@collabora.com>
 <a4jvi5wg7ag6apodn4hkdr556r6dq6vknjzrqpti6mlsq56cpf@ygh6edcz5nci>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <a4jvi5wg7ag6apodn4hkdr556r6dq6vknjzrqpti6mlsq56cpf@ygh6edcz5nci>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 12/07/2024 à 18:31, Jacopo Mondi a écrit :
> Hi Benjamin
>
> On Fri, Jul 12, 2024 at 12:29:59PM GMT, Benjamin Gaignard wrote:
>> Add new flags to enumerate all pixels formats when calling VIDIOC_ENUM_FMT ioctl.
>> When this V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag is set drivers must
>> ignore the configuration and return the hardware supported pixel
>> formats for the specified queue.
>> To distinguish this particular enumeration case V4L2_FMT_FLAG_ALL_FORMATS
>> flag must be set by the drivers to highlight support of this feature
>> to user space applications.
>> This will permit to discover which pixel formats are supported
>> without setting codec-specific information so userland can more easily
>> know if the driver suits its needs well.
>> The main target are stateless decoders so update the documentation
>> about how to use this flag.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> changes in version 3:
>> - Add a flag to inform userspace application that driver
>>    as take care of the flag.
>>
>>   .../userspace-api/media/v4l/dev-stateless-decoder.rst    | 6 ++++++
>>   .../userspace-api/media/v4l/vidioc-enum-fmt.rst          | 9 +++++++++
>>   .../userspace-api/media/videodev2.h.rst.exceptions       | 2 ++
>>   drivers/media/v4l2-core/v4l2-ioctl.c                     | 3 +++
>>   include/uapi/linux/videodev2.h                           | 2 ++
>>   5 files changed, 22 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> index 35ed05f2695e..b0b657de910d 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> @@ -58,6 +58,12 @@ Querying capabilities
>>        default values for these controls being used, and a returned set of formats
>>        that may not be usable for the media the client is trying to decode.
>>
>> +   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the driver must enumerate
>> +     all the supported formats without taking care of codec-dependent controls
>> +     set on the ``OUTPUT`` queue. To indicate that the driver has take care of this
>> +     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each format while
>> +     enumerating.
>> +
>>   3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supported
>>      resolutions for a given format, passing desired pixel format in
>>      :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> index 3adb3d205531..0399e0fc09b3 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> @@ -234,6 +234,15 @@ the ``mbus_code`` field is handled differently:
>>   	valid. The buffer consists of ``height`` lines, each having ``width``
>>   	Data Units of data and the offset (in bytes) between the beginning of
>>   	each two consecutive lines is ``bytesperline``.
>> +    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
>> +      - 0x0400
>> +      - Set by userland applications to enumerate all possible pixel formats
>> +        without taking care of any OUTPUT or CAPTURE queue configuration.
> This seems to be only relevant for codecs and m2m devices.
>
> For 'regular' capture (and I presume output) devices isn't the default
> behaviour to enumerate all pixel formats, and userspace can decide to
> restrict them by providing a media bus code (if the device reports the
> V4L2_CAP_IO_MC capability)

Yes is targeting codecs because they have two queues.
When device have only one queue, like 'regular' capture devices,
pixel enumeration doesn't have to take care of the other queue
configuration because it doesn't exist.

>
>
>> +    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
>> +      - 0x0800
>> +      - Set by the driver to indicated that format have been enumerated because
>> +        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-set-csc>` has
>> +        been set by the userland application.
>>
>>   Return Value
>>   ============
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index bdc628e8c1d6..7a3a1e9dc055 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -216,6 +216,8 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>> +replace define V4L2_FMT_FLAG_ENUM_ALL_FORMATS fmtdesc-flags
>> +replace define V4L2_FMT_FLAG_ALL_FORMATS fmtdesc-flags
>>
>>   # V4L2 timecode types
>>   replace define V4L2_TC_TYPE_24FPS timecode-type
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 4c76d17b4629..5785a98b6ba2 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>   	int ret = check_fmt(file, p->type);
>>   	u32 mbus_code;
>>   	u32 cap_mask;
>> +	u32 flags;
>>
>>   	if (ret)
>>   		return ret;
>> @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>   		p->mbus_code = 0;
>>
>>   	mbus_code = p->mbus_code;
>> +	flags = p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
>>   	memset_after(p, 0, type);
>>   	p->mbus_code = mbus_code;
>> +	p->flags = flags;
>>
>>   	switch (p->type) {
>>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index fe6b67e83751..b6a5da79ba21 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
>>   #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>>   #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>>   #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>> +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
>> +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
>>
>>   	/* Frame Size and frame rate enumeration */
>>   /*
>> --
>> 2.43.0
>>
>>

