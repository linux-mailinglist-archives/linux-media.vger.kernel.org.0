Return-Path: <linux-media+bounces-15154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8893780D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 14:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C86461C216E5
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEC413C681;
	Fri, 19 Jul 2024 12:58:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A761439FF3;
	Fri, 19 Jul 2024 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721393879; cv=none; b=Xlpydt/2RKoZUvmRTEVW+6C1fQV+Wmfl5GHRlRGdHm29iNY6AlpHUggwuY97rT0jalKKjpdDKzWK7hMDBKN/xaDGr3/boIJjwTOAFEHP/6fkfK5kCrww+0AeLtyIgw7gBiYzPlMi4HT+5AvquMz8asPk55lbzF1tbbc4mHM4fpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721393879; c=relaxed/simple;
	bh=6OOeu7dqjPnu8jEdVwpuXKmVDmwAPZSpnz1Wh32intw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJg/OMJJnukNqZq6KNMiOCLV4/Lps0Cg4MsoKH93Rx0APUsUbA18oN8dI6mM+AHfhQiy7YIgl76m6BVsCNBJecNjkQimbabx7Wr/RSVO6bVBQ3x7+6QIkDCUCOCRPu8t3y0G4ubKsfSzxOCcHIkJfs9mR+9tJvZSYWGZMzPjiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC600C32782;
	Fri, 19 Jul 2024 12:57:57 +0000 (UTC)
Message-ID: <07f62fbb-d1eb-41c3-86a8-13a082a8374f@xs4all.nl>
Date: Fri, 19 Jul 2024 14:57:56 +0200
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
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2024 15:14, Benjamin Gaignard wrote:
> The goal of this series is to let userland applications enumerate
> all the supported pixels formats of a stateless decoder without
> setting all the possible codec-dependent control.
> That offer a simplest solution for applications to discover
> supported pixels formats and possibly let them doing smarter
> choice between stateless decoders.
> 
> An example of how it can be used in GStreamer to discover the
> supported pixels formats for stateless decoder is available here:
> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads

So effectively specifying this flag makes ENUM_FMT also return
formats that do not match the bit depth.

So the AV1 (for example) compressed video uses e.g. 8 bit depth, but instead of just
listing only 8 bit uncompressed pixelformats, you want to list them for any
bit depth.

But what is the point of that if the decoder can't decode 8 bit compressed to,
say, 10 bit uncompressed video?

I actually thought that this flag would just list all formats, independent
of the output format (e.g. AV1, H264, etc.), but that does not appear to be
the case? I.e., if capture pixelformat X is only available with AV1, will that still
be listed if the output pixel is set to H264?

I think you need to describe a real use-case here, and I am not convinced about
the name of the flag either.

> 
> changes in version 4:
> - Explicitly document that the new flags are targeting mem2mem devices.
> 
> changes in version 3:
> - Add a flag to inform userspace application that driver
>   as take care of the flag.
> 
> changes in version 2:
> - Clarify documentation.
> - Only keep V4L2_FMT_FLAG_ALL_FORMATS flag in ioctl.
> 
> Benjamin
> 
> Benjamin Gaignard (2):
>   media: videodev2: Add flags to unconditionnaly enumerate pixels
>     formats

I.e.: it is not unconditionally, it still depends on the chosen codec.

Regards,

	Hans

>   media: verisilicon: Use V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag
> 
>  .../media/v4l/dev-stateless-decoder.rst          |  6 ++++++
>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst  | 11 +++++++++++
>  .../media/videodev2.h.rst.exceptions             |  2 ++
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 16 +++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c             |  3 +++
>  include/uapi/linux/videodev2.h                   |  2 ++
>  6 files changed, 37 insertions(+), 3 deletions(-)
> 


