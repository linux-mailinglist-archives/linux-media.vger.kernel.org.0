Return-Path: <linux-media+bounces-19532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B041A99C0BB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4F31C22227
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0599146000;
	Mon, 14 Oct 2024 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="iiraORVc"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004113FD83;
	Mon, 14 Oct 2024 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889650; cv=pass; b=W605tuOz+jDkw37tcGE+YIhGzVn+BrgmRhXYzTMh908nJ5Ow0c9wnXrtBN9sIjE113pH3QRfHTnxQhBr9/EqGykvKf2CnPjk+N7PT1CJGWNJxJAQRWyrN+ODdzEwD49BnoNmCZUOsSWAOrXMBTU8elI/5nLJs/OSch/pY2ArYpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889650; c=relaxed/simple;
	bh=QmwV6ZRlTh3j+kOjLLxeD1k5Sgj8QIfovSHn2ug6unU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggh0zcOHuzDjDBHfowKywXPyexuDwOXbjQmjnZWnyte6m2+j+shf5dhaz/IZt6TEfnWh6G8pU9MJPZFq5XFcDAjXIlCrBipsn2wN4AUyCbu867URUqzG82K5SNSlMtVCHxSFc9vale4Esr7uV1S1eQSPTCS8osdK7fa5QSZO/VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=iiraORVc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728889626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cnJQxBq2HoeZytIXgUdcyu7x9YJjdBWyDbit5LrOpybi/jEO98/XRBNp4wx2IJQcPnaK8YPn04E/0B9NKpaxdVvIADU7Cb0qtl7AQel4+X9D0bXfiwt731C1/LcWNBucPWOuV6NTog9MoP7ucJjF5Xgm9rslGWgQr7nO8Yu/bZ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728889626; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0A9IsFta4OZE0agwgaaWd+5WVs3WNNoO0kjYMJq+9Dc=; 
	b=IkBl4/p7QP0bFJKd004aHiKvd5PfhAzMVu6PPG6y69kyxHH7bebPK6zrgT4vLVfOSTsaQSt9ztDPpVBwPivAz97RWVvw3LRErGbBhGRhx8ENi5kI/hEv6LMwOM+lruDS777EZH1KF5vC3KwBiTPpR2SbQnr+v01GMU7B11TXiDk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728889626;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0A9IsFta4OZE0agwgaaWd+5WVs3WNNoO0kjYMJq+9Dc=;
	b=iiraORVctYQj1JgJt4vSz1J8gD+Gz/slYEGQcSr5UzsWQAC54ezG4PjtCB5x4XDe
	QZybkGSEw6sXeKwWTWoPsjcilMSZWfLpAFlMWtKLbodqP6u1KpSRJnLNH119b/wyCtq
	dEiCw4dBJOBusf5fCwxh0FfoHQdcdNsFwaWQC4e0=
Received: by mx.zohomail.com with SMTPS id 1728889625542850.7313795427783;
	Mon, 14 Oct 2024 00:07:05 -0700 (PDT)
Message-ID: <3017b1e4-ffa6-4601-b844-0e6f7d95a475@collabora.com>
Date: Mon, 14 Oct 2024 09:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] media: videodev2: Add flag to unconditionally
 enumerate pixel formats
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240826172407.140538-1-benjamin.gaignard@collabora.com>
 <010201918fb77141-93148d3e-6899-4b09-bff3-5d4f146f1449-000000@eu-west-1.amazonses.com>
 <250bf825-7e64-4132-9c70-fa25c5976ed3@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <250bf825-7e64-4132-9c70-fa25c5976ed3@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 11/10/2024 à 15:29, Hans Verkuil a écrit :
> Hi Benjamin,
>
> On 26/08/2024 19:24, Benjamin Gaignard wrote:
>> When the index is ORed with V4L2_FMTDESC_FLAG_ENUM_ALL the
>> driver clears the flag and enumerate all the possible formats,
>> ignoring any limitations from the current configuration.
>> Drivers which do not support this flag yet always return an EINVAL.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> change in version 7:
>> - Rework documentation about which drivers should use the flag
>>
>>   .../media/v4l/vidioc-enum-fmt.rst              | 18 +++++++++++++++++-
>>   .../media/videodev2.h.rst.exceptions           |  1 +
>>   include/uapi/linux/videodev2.h                 |  3 +++
>>   3 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> index 3adb3d205531..e39c87bcbfc3 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> @@ -85,7 +85,17 @@ the ``mbus_code`` field is handled differently:
>>       * - __u32
>>         - ``index``
>>         - Number of the format in the enumeration, set by the application.
>> -	This is in no way related to the ``pixelformat`` field.
>> +        This is in no way related to the ``pixelformat`` field.
>> +        When the index is ORed with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` the
>> +        driver clears the flag and enumerates all the possible formats,
>> +        ignoring any limitations from the current configuration. Drivers
>> +        which do not support this flag always return an ``EINVAL``
>> +        error code.
> I would like to add: " without clearing this flag."
>
>> +        Formats enumerated when using ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
>> +        shouldn't be used when calling :c:func:`VIDIOC_ENUM_FRAMESIZES`
>> +        or :c:func:`VIDIOC_ENUM_FRAMEINTERVALS`.
>> +        ``V4L2_FMTDESC_FLAG_ENUM_ALL`` should only be used by drivers that
>> +        can return different format list depending on this flag.
>>       * - __u32
>>         - ``type``
>>         - Type of the data stream, set by the application. Only these types
>> @@ -234,6 +244,12 @@ the ``mbus_code`` field is handled differently:
>>   	valid. The buffer consists of ``height`` lines, each having ``width``
>>   	Data Units of data and the offset (in bytes) between the beginning of
>>   	each two consecutive lines is ``bytesperline``.
>> +    * - ``V4L2_FMTDESC_FLAG_ENUM_ALL``
>> +      - 0x80000000
>> +      - When the applications ORs ``index`` with ``V4L2_FMTDESC_FLAG_ENUM_ALL`` flag
>> +        the driver enumerates all the possible pixel formats without taking care
>> +        of any already set configuration. Drivers which do not support this flag,
>> +        always return ``EINVAL``.
> Ditto.
>
> If you agree, then I can make that change myself, no need to post a new version.

Of I agree :-)

Thanks a lot.
Benjamin

>
> Regards,
>
> 	Hans
>
>>   
>>   Return Value
>>   ============
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index bdc628e8c1d6..0a9ea9686c24 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -216,6 +216,7 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>>   replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>> +replace define V4L2_FMTDESC_FLAG_ENUM_ALL fmtdesc-flags
>>   
>>   # V4L2 timecode types
>>   replace define V4L2_TC_TYPE_24FPS timecode-type
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 4e91362da6da..421a30cb0c51 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -904,6 +904,9 @@ struct v4l2_fmtdesc {
>>   #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>>   #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>>   
>> +/*  Format description flag, to be ORed with the index */
>> +#define V4L2_FMTDESC_FLAG_ENUM_ALL		0x80000000
>> +
>>   	/* Frame Size and frame rate enumeration */
>>   /*
>>    *	F R A M E   S I Z E   E N U M E R A T I O N
>

