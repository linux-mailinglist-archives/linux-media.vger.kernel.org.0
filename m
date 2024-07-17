Return-Path: <linux-media+bounces-15089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCD933DE0
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15D91C21802
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E309180A7B;
	Wed, 17 Jul 2024 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="5cGvkWuv"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C9180A67;
	Wed, 17 Jul 2024 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223868; cv=none; b=Qpi5lWjOBIKDexjgrgfKbtY9pZnspp5P1MaolacUHYSOwFNn4twEzDXpbcdqcEB41GP/owqxS1udja8Xmj2wQrGyUusK7omszjB9r+v/Na1+qoRtehbBXDQrBm12x1mXG6tonQDbFuJ9rrcwMSllPkfaXCWEJNBAe3AurVZQYqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223868; c=relaxed/simple;
	bh=qPMItOrbNwbO5O8SDfWFm+dgaEsAf6LrMflcfDMOaWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk+2IF82lE1nz82YG3X18hYuFCaSo6HlxowM8wsT1nAtWrHQ0cwPqSG71iA4HuWl/zxlv05/gOkTIbV0AgS3eHW9dsdiuYK4tCdCTWJDQKaqt0SimRWj0OQNfPI5f+JwPM3VnpHe8yaHh2iNQ5HGWyXpsE3m3gSgp8Q/YXdKdtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=5cGvkWuv; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721223865;
	bh=qPMItOrbNwbO5O8SDfWFm+dgaEsAf6LrMflcfDMOaWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=5cGvkWuvF4FUFxCQbTpc/59gCAp6nhN/+0xCOybww/+EtbaFZpfkmwClNv9RKs51x
	 MyZYtUJYnSgtZxSKVA8aIj/LFihi9mMwjnH9aP2F5Jn3HzLA5S9WLx0zQSAtVla+sH
	 hU54pjPM6po4lnqaGC+ED0xPkIG5x6ouzN18IaRIyPShAFLt91RZsQBNsTzAbVER7R
	 YI7wNFviRK+1RunW9iYlyaDtAcP0uDwpEFLC7RoQrWMfnTGk6122Rg5Yn5k+guxlBd
	 rwW3tXLZW6gtDGJrgRfQ3ccqG6Tln0YmRZ54A8Y2r5rtSYrmPZ0lvIgLo+AdWhKHkQ
	 fsuN8zuLU3Jwg==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89E7337805D6;
	Wed, 17 Jul 2024 13:44:24 +0000 (UTC)
Message-ID: <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>
Date: Wed, 17 Jul 2024 15:44:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
 <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/07/2024 à 15:20, Jacopo Mondi a écrit :
> Hi Benjamin
>
> On Wed, Jul 17, 2024 at 03:14:29PM GMT, Benjamin Gaignard wrote:
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
>> changes in version 4:
>> - Explicitly document that the new flags are targeting mem2mem devices.
>>
>>   .../userspace-api/media/v4l/dev-stateless-decoder.rst |  6 ++++++
>>   .../userspace-api/media/v4l/vidioc-enum-fmt.rst       | 11 +++++++++++
>>   .../userspace-api/media/videodev2.h.rst.exceptions    |  2 ++
>>   drivers/media/v4l2-core/v4l2-ioctl.c                  |  3 +++
>>   include/uapi/linux/videodev2.h                        |  2 ++
>>   5 files changed, 24 insertions(+)
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
>> index 3adb3d205531..15bc2f59c05a 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> @@ -234,6 +234,17 @@ the ``mbus_code`` field is handled differently:
>>   	valid. The buffer consists of ``height`` lines, each having ``width``
>>   	Data Units of data and the offset (in bytes) between the beginning of
>>   	each two consecutive lines is ``bytesperline``.
>> +    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
>> +      - 0x0400
>> +      - Set by userland applications to enumerate all possible pixel formats
>> +        without taking care of any OUTPUT or CAPTURE queue configuration.
>> +        This flag is relevant only for mem2mem devices.
>> +    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
>> +      - 0x0800
>> +      - Set by the driver to indicated that format have been enumerated because
>> +        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-set-csc>` has
>> +        been set by the userland application.
>> +        This flag is relevant only for mem2mem devices.
> Thanks, however I think this can be wrapper on the previous line

ok

>
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
> Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) in the
> flags returned to userspace ? Shouldn't be drivers to set
> V4L2_FMT_FLAG_ALL_FORMATS instead ?

memset_after zeroed flags field so we need this to send V4L2_FMT_FLAG_ENUM_ALL_FORMATS
flag to drivers. Return it to userspace is a side effect but I don't that is problem
since it set it anyway.

>
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
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com

