Return-Path: <linux-media+bounces-15158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E99378B3
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 15:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E8781C21784
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 13:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD1E14388F;
	Fri, 19 Jul 2024 13:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Jb9eS6xt"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF78288F;
	Fri, 19 Jul 2024 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721396824; cv=none; b=hR/KPf0P9LrXTRXlePnD4yRqXxBrxf253ZHD7Xt7cd6+i+SZnhicF/Ufy87GT6D5jp40d5uzq99d9KUJkETU8BIdaJ7xgAQ4KLJSCCFVRbNOf9TmZlmgTrS8rJYXWou+DQkAwpKjeTt8lM3kE4m5edkUO6AlxXgPxP3TwFfIWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721396824; c=relaxed/simple;
	bh=IY4wRPdAXfQMvr8U6r2C6IT9buMDJ+CirgNK6vvN1WY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o89s89VUqrZSMTIsMIqI4S5mlIIzmNDENcN36Tjhyspyh3vh9v3W5xf2VSeEmWdcTlFroUo+FVNhhN5i+TKcJ+vnl8GpABsGwgibF4HBinsWf28uOsIH7ZrRtZXHC4GKGq2zMoCsUOe9yPIriJK2+SvqKTxNG++yp27WaWLUCyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Jb9eS6xt; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721396821;
	bh=IY4wRPdAXfQMvr8U6r2C6IT9buMDJ+CirgNK6vvN1WY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jb9eS6xtfEUzTHKktUKSl9Etx/t42vUhyd/bHDFPtS6K4EdWY1VF2jpzN4ThXQXe5
	 YMMhp2pxgeF3zRpxLdiciAmIqYWgvH+qzRd02s9rkVbH57Qv6WaiwqcXuKkLGWp8gJ
	 BU/SZIhp4Ptwf7KP7fXt2pGB0maBxF6mcl3JjQMd5aHYq6N8Ijb1eoP/ap/pv+mfnx
	 ErGdi/bofU0iGJ1Lc09xtoFY29xxkL9144hnu/d1iPLLhv29fHDilrahFEScCyv3DF
	 dr4NuFr/gf8dS//vtaZS0MJ860zb2TMaKf1Mhi0Y8/jdwtRyoVzzr9i9pEdDuUB8CQ
	 3WX8lY05D/Syw==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 011FF3780520;
	Fri, 19 Jul 2024 13:47:00 +0000 (UTC)
Message-ID: <2eec786d-f2b6-4445-87f4-4b6d162a2d9a@collabora.com>
Date: Fri, 19 Jul 2024 15:47:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Enumerate all pixels formats
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <07f62fbb-d1eb-41c3-86a8-13a082a8374f@xs4all.nl>
 <743e2589-c0df-461d-97d4-fafe78c334ea@collabora.com>
 <98f5cd5c-cb9c-45ca-a7c7-a546f525c393@xs4all.nl>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <98f5cd5c-cb9c-45ca-a7c7-a546f525c393@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 19/07/2024 à 15:37, Hans Verkuil a écrit :
> On 19/07/2024 15:15, Benjamin Gaignard wrote:
>> Le 19/07/2024 à 14:57, Hans Verkuil a écrit :
>>> On 17/07/2024 15:14, Benjamin Gaignard wrote:
>>>> The goal of this series is to let userland applications enumerate
>>>> all the supported pixels formats of a stateless decoder without
>>>> setting all the possible codec-dependent control.
>>>> That offer a simplest solution for applications to discover
>>>> supported pixels formats and possibly let them doing smarter
>>>> choice between stateless decoders.
>>>>
>>>> An example of how it can be used in GStreamer to discover the
>>>> supported pixels formats for stateless decoder is available here:
>>>> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads
>>> So effectively specifying this flag makes ENUM_FMT also return
>>> formats that do not match the bit depth.
>>>
>>> So the AV1 (for example) compressed video uses e.g. 8 bit depth, but instead of just
>>> listing only 8 bit uncompressed pixelformats, you want to list them for any
>>> bit depth.
>>>
>>> But what is the point of that if the decoder can't decode 8 bit compressed to,
>>> say, 10 bit uncompressed video?
>> No decoder will do 8 bits to 10 bits (as far I knows).
>> The point is to be able to say that decoder could produce 10 bit frames without
>> setting a full sps/pps for each case (and for each supported codec).
>>
>>> I actually thought that this flag would just list all formats, independent
>>> of the output format (e.g. AV1, H264, etc.), but that does not appear to be
>>> the case? I.e., if capture pixelformat X is only available with AV1, will that still
>>> be listed if the output pixel is set to H264?
>>>
>>> I think you need to describe a real use-case here, and I am not convinced about
>>> the name of the flag either.
>> I may have miss something but yes the goal is to list all formats independently
>> of the output format.
>> When a SoC have multiple decoders for the same codec, knowing the supported formats
>> is key to select the better one.
>> Since I will have to do more iteration, feel free to provide a better name for the
>> flag(s). I'm always bad for naming this kind of thing.
> That really needs to be clarified, since in patch 1/2 it says:
>
> +   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the driver must enumerate
> +     all the supported formats without taking care of codec-dependent controls
> +     set on the ``OUTPUT`` queue. To indicate that the driver has take care of this
> +     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each format while
> +     enumerating.
>
> Here it just talks about 'codec-dependent controls set on the ``OUTPUT`` queue', it
> doesn't say anything about the compressed pixelformat set for the OUTPUT queue.
>
> And patch 2/2 sets the ignore_depth_match boolean, suggesting also that it is
> not listing all formats, but just ignoring a specific check.
>
> But if you list all pixelformats without taking the OUTPUT pixelformat into
> account, how do you know which pixelformat is valid for which codec?
>
> Say that only MPEG support NV12 (just for the sake of argument), and that's
> what you want to use, you have no way of knowing that NV12 is specific to MPEG,
> you would have to try each codec and see if NV12 is supported for that codec.
>
> I just don't see how this can be used in practice.
>
> What exactly is the problem you want to solve? A real-life problem, not a theoretical
> one :-)

On real-life: on a board with 2 different stateless decoders being able to detect the
one which can decode 10 bits bitstreams without testing all codec-dependent controls.

Regards,
Benjamin

>
> Regards,
>
> 	Hans
>
>>
>>>> changes in version 4:
>>>> - Explicitly document that the new flags are targeting mem2mem devices.
>>>>
>>>> changes in version 3:
>>>> - Add a flag to inform userspace application that driver
>>>>     as take care of the flag.
>>>>
>>>> changes in version 2:
>>>> - Clarify documentation.
>>>> - Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.
>>>>
>>>> Benjamin
>>>>
>>>> Benjamin Gaignard (2):
>>>>     media: videodev2: Add flags to unconditionnaly enumerate pixels
>>>>       formats
>>> I.e.: it is not unconditionally, it still depends on the chosen codec.
>>>
>>> Regards,
>>>
>>>      Hans
>>>
>>>>     media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag
>>>>
>>>>    .../media/v4l/dev-stateless-decoder.rst          |  6 ++++++
>>>>    .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 11 +++++++++++
>>>>    .../media/videodev2.h.rst.exceptions             |  2 ++
>>>>    drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
>>>>    drivers/media/v4l2-core/v4l2-ioctl.c             |  3 +++
>>>>    include/uapi/linux/videodev2.h                   |  2 ++
>>>>    6 files changed, 37 insertions(+), 3 deletions(-)
>>>>
>

