Return-Path: <linux-media+bounces-15155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C06937832
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 15:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125A92821FF
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 13:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C49E142642;
	Fri, 19 Jul 2024 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="sEffHSyP"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A684037;
	Fri, 19 Jul 2024 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721394930; cv=none; b=QnqzOA//xTKQHkD8RnqW2wUmhGXNeSoKt/qgXWdkioy0H3xweZ25uzV3NTeF8gYlTgxZbNZpVcDsvQF1qG699aBDl9ltYDJLLb273936t3wpaNuU2q0UyQ/DOHo6l3gs6zsjin5VCtrZQnt95D5mbAeE5knWG+gVQoPaykNjTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721394930; c=relaxed/simple;
	bh=wv3SYSINOeLlF7w3hXpbrZqk6piSSBONxifGogb2qIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+iasIPaUX1is+WuxAgJ2Fd2XsUWOHRL9P0HkoMQUabJ6y38QOvoSol0IX6F5DliqmpUu/DTr+QwvCzdF6+Nycsi9TQUFd88fFY2tKBtyAWZri6T5EMd/bpc0Xazp+RAShhBzLYQGEPu1DtVV3KtKRKmLE41B/l5OkYl6mqvyno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=sEffHSyP; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721394927;
	bh=wv3SYSINOeLlF7w3hXpbrZqk6piSSBONxifGogb2qIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sEffHSyPRwE5TsWoan/5QaEKl7Qf3vOrEd8eayR/jA+Fo1OA83/3wXu3476B1EtH6
	 8rjhDDmTn+ToPXiHkLAQhsMR4pq4iL3c6dcSH9X+DnKMFroeM8vv2fEtfwbeGfA8P9
	 3pOx2SYcNuxjfGvWHdAqsr9qBrHTb0J7Cxl/RNRAi1WlUYAmwP9G6beOS0bhgFZyNt
	 AwAO4mA6mKb9DY0Sb23JB8/5LYaMYV68Nm1Xsg9hTPTT8dICK6k9UX3twv5V2PY9Km
	 HBiMPUJf+Wcb+ScLwYmH6VhKkTTrVpHmd0QmKsCuet70gYZlE7stc827D3VqVGb9oI
	 LRn1DEk8Ug4DA==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D49CF378215E;
	Fri, 19 Jul 2024 13:15:26 +0000 (UTC)
Message-ID: <743e2589-c0df-461d-97d4-fafe78c334ea@collabora.com>
Date: Fri, 19 Jul 2024 15:15:26 +0200
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
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <07f62fbb-d1eb-41c3-86a8-13a082a8374f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 19/07/2024 à 14:57, Hans Verkuil a écrit :
> On 17/07/2024 15:14, Benjamin Gaignard wrote:
>> The goal of this series is to let userland applications enumerate
>> all the supported pixels formats of a stateless decoder without
>> setting all the possible codec-dependent control.
>> That offer a simplest solution for applications to discover
>> supported pixels formats and possibly let them doing smarter
>> choice between stateless decoders.
>>
>> An example of how it can be used in GStreamer to discover the
>> supported pixels formats for stateless decoder is available here:
>> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads
> So effectively specifying this flag makes ENUM_FMT also return
> formats that do not match the bit depth.
>
> So the AV1 (for example) compressed video uses e.g. 8 bit depth, but instead of just
> listing only 8 bit uncompressed pixelformats, you want to list them for any
> bit depth.
>
> But what is the point of that if the decoder can't decode 8 bit compressed to,
> say, 10 bit uncompressed video?

No decoder will do 8 bits to 10 bits (as far I knows).
The point is to be able to say that decoder could produce 10 bit frames without
setting a full sps/pps for each case (and for each supported codec).

>
> I actually thought that this flag would just list all formats, independent
> of the output format (e.g. AV1, H264, etc.), but that does not appear to be
> the case? I.e., if capture pixelformat X is only available with AV1, will that still
> be listed if the output pixel is set to H264?
>
> I think you need to describe a real use-case here, and I am not convinced about
> the name of the flag either.

I may have miss something but yes the goal is to list all formats independently
of the output format.
When a SoC have multiple decoders for the same codec, knowing the supported formats
is key to select the better one.
Since I will have to do more iteration, feel free to provide a better name for the
flag(s). I'm always bad for naming this kind of thing.


>
>> changes in version 4:
>> - Explicitly document that the new flags are targeting mem2mem devices.
>>
>> changes in version 3:
>> - Add a flag to inform userspace application that driver
>>    as take care of the flag.
>>
>> changes in version 2:
>> - Clarify documentation.
>> - Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.
>>
>> Benjamin
>>
>> Benjamin Gaignard (2):
>>    media: videodev2: Add flags to unconditionnaly enumerate pixels
>>      formats
> I.e.: it is not unconditionally, it still depends on the chosen codec.
>
> Regards,
>
> 	Hans
>
>>    media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag
>>
>>   .../media/v4l/dev-stateless-decoder.rst          |  6 ++++++
>>   .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 11 +++++++++++
>>   .../media/videodev2.h.rst.exceptions             |  2 ++
>>   drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
>>   drivers/media/v4l2-core/v4l2-ioctl.c             |  3 +++
>>   include/uapi/linux/videodev2.h                   |  2 ++
>>   6 files changed, 37 insertions(+), 3 deletions(-)
>>
>

