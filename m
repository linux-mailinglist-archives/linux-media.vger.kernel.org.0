Return-Path: <linux-media+bounces-20307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F59B0026
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 12:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F403A2840A5
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3C51DD54B;
	Fri, 25 Oct 2024 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="enWVHTqS"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9BE22B65A;
	Fri, 25 Oct 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729852253; cv=pass; b=B68bQeqBQePIbHvavB47Nnhi0pB3oIFNpLCf1p0+jiI3fpdnQR48vvGt3ItE9hrxOyMYZGphgkVZNX35KSi8nal/xkV8K8WGmdvubOYFezp9NS3r8O44A2PfvLj7TDn8vCjaGLoEmmF7uJVgh7lqY9AKFRAIW3Q6LVOeE9r2mjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729852253; c=relaxed/simple;
	bh=65xMrVlluKhumR+3klu3NhLNiqwi2jS1GqPr0vP5IO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx2p66NQub23Ycx0wj9NAERgLdbNPNmxm6Qtk4iLVUL0o3PZushNP8+P1yZVzPBFynvyZYVxP1MZhruRcpIBVut2blVP5J0XnAt5F5sye6UefejP2Btht8EDPlSydtmkbUJKjGR3R1QbFK/vY5/74y4ZtXp/b/kuulo0u0Uife0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=enWVHTqS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1729852229; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eEfLbRyKI0pumJ+ktY40BIqULXnsnbz5bZnFbfz5JGXUrTM5U26rrYbcOMD97aHWOg7Z9Xsj0Ci46DMNe2kDX6s6Pq4CtLXkcEyQ3X9rh298iRdkRHFlpq04vZTUu06neuJRChwjtqk8s93QW7/XbA14CCgU/YKVboctzy6DsHI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729852229; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+9mVhEtzkKFNjwJHVZdas57FP868lJ/b1QfbF+NQLL8=; 
	b=ehqWJY3SlqzYc1CiKkQWKBijZTXQrBVgdmHmYamvOxxtBV3E/MqCGMQrQZgGwImvXZYTfwOaj/GOCiMpC1uc/j7ZiagHoAay2U5cmILBMVrbPSsLlzmJ/Z65rhZwRHTIkvsL8WQmJ0aU8HfoeqSBOzK9YohWfEObNZKz4jYAmEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729852229;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=+9mVhEtzkKFNjwJHVZdas57FP868lJ/b1QfbF+NQLL8=;
	b=enWVHTqSpTAheKshjZA5wBgoV2bGGfuNJ5RBbZdcRldDzWanVorPXm0/IDbxe4z9
	OG/k5pIDQ8x7PTk9JgwzIIxnLpm4UZKO/HC5nviC8xy1g7tYdpyj1x+Hxn8/RxRr8rE
	Z5sc028uBB90lI0YPUx+Ld+2itEUNNOHTaETRTbI=
Received: by mx.zohomail.com with SMTPS id 1729852227667906.5869458822274;
	Fri, 25 Oct 2024 03:30:27 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:30:22 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/11] media: rkvdec: Add H.264 High 10 and 4:2:2
 profile support
Message-ID: <20241025103022.yuaepqxllwi7gghb@basti-XPS-13-9310>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
 <71159f58-be8b-41a4-9fed-522e09a7a564@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <71159f58-be8b-41a4-9fed-522e09a7a564@kwiboo.se>
X-ZohoMailClient: External

Hey Jonas,

On 25.10.2024 10:20, Jonas Karlman wrote:
>Hi Sebastian,
>
>Will you have time to look at this series any time soon?
>
>Would like to send a v2 of the now one year old rkvdec hevc series but
>this series is sort of holding that back ;-)

Sorry for the delay we (maintainer & reviewer from Collabora) are
currently a bit busy, this is on top of our review list however, so
please another 1 or 2 weeks of patience :).

>
>Regards,
>Jonas

Thanks for your work and regards!
Sebastian

>
>On 2024-09-09 21:24, Jonas Karlman wrote:
>> This series add H.264 High 10 and 4:2:2 profile support to the Rockchip
>> Video Decoder driver.
>>
>> Patch 1 add helpers for calculating plane bytesperline and sizeimage.
>> Patch 2 add two new pixelformats for semi-planer 10-bit 4:2:0/4:2:2 YUV.
>>
>> Patch 3 change to use bytesperline and buffer height to configure strides.
>> Patch 4 change to use values from SPS/PPS control to configure the HW.
>>
>> Patch 5-9 refactor code to support filtering of CAPUTRE formats based
>> on the image format returned from a get_image_fmt ops.
>>
>> Patch 10 add final bits to support H.264 High 10 and 4:2:2 profiles.
>>
>> Patch 11 add a fix for enumerated frame sizes returned to userspace.
>>
>> Tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
>>
>>   v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>>   ...
>>   Total for rkvdec device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
>>
>>   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-v4l2request
>>   ...
>>   Ran 65/69 tests successfully
>>
>>   Running test suite JVT-AVC_V1 with decoder FFmpeg-H.264-v4l2request
>>   ...
>>   Ran 129/135 tests successfully
>>
>> Before this series:
>>
>>   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-v4l2request
>>   ...
>>   Ran 44/69 tests successfully
>>
>> Changes in v6:
>> - Change to use fmt_idx instead of j++ tucked inside a condition (Dan)
>> - Add patch to fix enumerated frame sizes returned to userspace (Alex)
>> - Fluster test score is same as v4 and v5, see [4] and [5]
>> Link to v5: https://lore.kernel.org/linux-media/20240618194647.742037-1-jonas@kwiboo.se/
>>
>> Changes in v5:
>> - Drop Remove SPS validation at streaming start patch
>> - Move buffer align from rkvdec_fill_decoded_pixfmt to min/step_width
>> - Use correct profiles for V4L2_CID_MPEG_VIDEO_H264_PROFILE
>> - Collect r-b and t-b tags
>> - Fluster test score is same as v4, see [4] and [5]
>> Link to v4: https://lore.kernel.org/linux-media/20231105165521.3592037-1-jonas@kwiboo.se/
>>
>> Changes in v4:
>> - Fix failed v4l2-compliance tests related to CAPTURE queue
>> - Rework CAPTURE format filter anv validate to use an image format
>> - Run fluster test suite JVT-FR-EXT [4] and JVT-AVC_V1 [5]
>> Link to v3: https://lore.kernel.org/linux-media/20231029183427.1781554-1-jonas@kwiboo.se/
>>
>> Changes in v3:
>> - Drop merged patches
>> - Use bpp and bpp_div instead of prior misuse of block_w/block_h
>> - New patch to use values from SPS/PPS control to configure the HW
>> - New patch to remove an unnecessary call to validate sps at streaming start
>> - Reworked pixel format validation
>> Link to v2: https://lore.kernel.org/linux-media/20200706215430.22859-1-jonas@kwiboo.se/
>>
>> Changes in v2:
>> - Collect r-b tags
>> - SPS pic width and height in mbs validation moved to rkvdec_try_ctrl
>> - New patch to not override output buffer sizeimage
>> - Reworked pixel format validation
>> - Only align decoded buffer instead of changing frmsize step_width
>> Link to v1: https://lore.kernel.org/linux-media/20200701215616.30874-1-jonas@kwiboo.se/
>>
>> To fully runtime test this series you may need FFmpeg patches from [1]
>> and fluster patches from [2], this series is also available at [3].
>>
>> [1] https://github.com/Kwiboo/FFmpeg/commits/v4l2request-2024-v2-rkvdec/
>> [2] https://github.com/Kwiboo/fluster/commits/ffmpeg-v4l2request-rkvdec/
>> [3] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v6/
>> [4] https://gist.github.com/Kwiboo/f4ac15576b2c72887ae2bc5d58b5c865
>> [5] https://gist.github.com/Kwiboo/459a1c8f1dcb56e45dc7a7a29cc28adf
>>
>> Regards,
>> Jonas
>>
>> Alex Bee (1):
>>   media: rkvdec: h264: Don't hardcode SPS/PPS parameters
>>
>> Jonas Karlman (10):
>>   media: v4l2-common: Add helpers to calculate bytesperline and
>>     sizeimage
>>   media: v4l2: Add NV15 and NV20 pixel formats
>>   media: rkvdec: h264: Use bytesperline and buffer height as virstride
>>   media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
>>   media: rkvdec: Move rkvdec_reset_decoded_fmt helper
>>   media: rkvdec: Extract decoded format enumeration into helper
>>   media: rkvdec: Add image format concept
>>   media: rkvdec: Add get_image_fmt ops
>>   media: rkvdec: h264: Support High 10 and 4:2:2 profiles
>>   media: rkvdec: Fix enumerate frame sizes
>>
>>  .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++
>>  drivers/media/v4l2-core/v4l2-common.c         |  80 +++---
>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>>  drivers/staging/media/rkvdec/rkvdec-h264.c    |  64 +++--
>>  drivers/staging/media/rkvdec/rkvdec.c         | 239 +++++++++++++-----
>>  drivers/staging/media/rkvdec/rkvdec.h         |  18 +-
>>  include/uapi/linux/videodev2.h                |   2 +
>>  7 files changed, 410 insertions(+), 123 deletions(-)
>>
>
>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

