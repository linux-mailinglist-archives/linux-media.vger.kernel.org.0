Return-Path: <linux-media+bounces-15157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA318937893
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 15:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1286B1C2186D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 13:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F07E13F458;
	Fri, 19 Jul 2024 13:37:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262A1E489;
	Fri, 19 Jul 2024 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721396237; cv=none; b=rDRQ61BE2UeppZKy16RXvjHvGPezc8utEmi8aWQkz5b5btWi+rCktz0zJpl3FCvZzob4eOYCYAbHapnt5xUC/Cg0+c9DQJNfmgc10tlQEkzXT83WFllLxZGh3dJPTCOdcyQ1QHf6YkGtP2Lb+85uwCFAXrlVKZalnKJWyedBEWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721396237; c=relaxed/simple;
	bh=MG1Wb8BUciLNMbxSZvs3dEYg0gH8n2QrccD504GNswY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shtupyLVB5oiZjKe9yfCsTXO01V7FTD6f7r2ivP6Xk5nh6oAk6pdSbR8D1Tcmk+sDhFiy/LPyBcTC4DfB0cE5HQi4ABMnqflsVwqsu/AdfgUlOKee2UJSgm/4dCuW2RUmBhwMSjYGx7YhtuTFcSy9MoJUgjpZgaWUVOchas077I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038C4C32782;
	Fri, 19 Jul 2024 13:37:14 +0000 (UTC)
Message-ID: <98f5cd5c-cb9c-45ca-a7c7-a546f525c393@xs4all.nl>
Date: Fri, 19 Jul 2024 15:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Enumerate all pixels formats
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <07f62fbb-d1eb-41c3-86a8-13a082a8374f@xs4all.nl>
 <743e2589-c0df-461d-97d4-fafe78c334ea@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <743e2589-c0df-461d-97d4-fafe78c334ea@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/07/2024 15:15, Benjamin Gaignard wrote:
> 
> Le 19/07/2024 à 14:57, Hans Verkuil a écrit :
>> On 17/07/2024 15:14, Benjamin Gaignard wrote:
>>> The goal of this series is to let userland applications enumerate
>>> all the supported pixels formats of a stateless decoder without
>>> setting all the possible codec-dependent control.
>>> That offer a simplest solution for applications to discover
>>> supported pixels formats and possibly let them doing smarter
>>> choice between stateless decoders.
>>>
>>> An example of how it can be used in GStreamer to discover the
>>> supported pixels formats for stateless decoder is available here:
>>> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads
>> So effectively specifying this flag makes ENUM_FMT also return
>> formats that do not match the bit depth.
>>
>> So the AV1 (for example) compressed video uses e.g. 8 bit depth, but instead of just
>> listing only 8 bit uncompressed pixelformats, you want to list them for any
>> bit depth.
>>
>> But what is the point of that if the decoder can't decode 8 bit compressed to,
>> say, 10 bit uncompressed video?
> 
> No decoder will do 8 bits to 10 bits (as far I knows).
> The point is to be able to say that decoder could produce 10 bit frames without
> setting a full sps/pps for each case (and for each supported codec).
> 
>>
>> I actually thought that this flag would just list all formats, independent
>> of the output format (e.g. AV1, H264, etc.), but that does not appear to be
>> the case? I.e., if capture pixelformat X is only available with AV1, will that still
>> be listed if the output pixel is set to H264?
>>
>> I think you need to describe a real use-case here, and I am not convinced about
>> the name of the flag either.
> 
> I may have miss something but yes the goal is to list all formats independently
> of the output format.
> When a SoC have multiple decoders for the same codec, knowing the supported formats
> is key to select the better one.
> Since I will have to do more iteration, feel free to provide a better name for the
> flag(s). I'm always bad for naming this kind of thing.

That really needs to be clarified, since in patch 1/2 it says:

+   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the driver must enumerate
+     all the supported formats without taking care of codec-dependent controls
+     set on the ``OUTPUT`` queue. To indicate that the driver has take care of this
+     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each format while
+     enumerating.

Here it just talks about 'codec-dependent controls set on the ``OUTPUT`` queue', it
doesn't say anything about the compressed pixelformat set for the OUTPUT queue.

And patch 2/2 sets the ignore_depth_match boolean, suggesting also that it is
not listing all formats, but just ignoring a specific check.

But if you list all pixelformats without taking the OUTPUT pixelformat into
account, how do you know which pixelformat is valid for which codec?

Say that only MPEG support NV12 (just for the sake of argument), and that's
what you want to use, you have no way of knowing that NV12 is specific to MPEG,
you would have to try each codec and see if NV12 is supported for that codec.

I just don't see how this can be used in practice.

What exactly is the problem you want to solve? A real-life problem, not a theoretical
one :-)

Regards,

	Hans

> 
> 
>>
>>> changes in version 4:
>>> - Explicitly document that the new flags are targeting mem2mem devices.
>>>
>>> changes in version 3:
>>> - Add a flag to inform userspace application that driver
>>>    as take care of the flag.
>>>
>>> changes in version 2:
>>> - Clarify documentation.
>>> - Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.
>>>
>>> Benjamin
>>>
>>> Benjamin Gaignard (2):
>>>    media: videodev2: Add flags to unconditionnaly enumerate pixels
>>>      formats
>> I.e.: it is not unconditionally, it still depends on the chosen codec.
>>
>> Regards,
>>
>>     Hans
>>
>>>    media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag
>>>
>>>   .../media/v4l/dev-stateless-decoder.rst          |  6 ++++++
>>>   .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 11 +++++++++++
>>>   .../media/videodev2.h.rst.exceptions             |  2 ++
>>>   drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
>>>   drivers/media/v4l2-core/v4l2-ioctl.c             |  3 +++
>>>   include/uapi/linux/videodev2.h                   |  2 ++
>>>   6 files changed, 37 insertions(+), 3 deletions(-)
>>>
>>
> 


