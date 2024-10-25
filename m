Return-Path: <linux-media+bounces-20299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 777329AFC5D
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A7051C21802
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 08:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FAA1D0DDE;
	Fri, 25 Oct 2024 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="NC3vnxa+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D93018CBF8
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.246.76.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729844469; cv=none; b=BkjSDuBASSfmFJaeOFX/w0cucX8IGv1htnCh6s0PA84DGnplKADe4Kb/7Yyri5SpLHB9o2PNinNKqZkxoGXH44tTYJrVrQe8/GtqHRZ6UIH2TWJE07swIm7xJzmOucyt9W54VfQx9PkCR100jhnriG08D98ms88EFLTQSvOZgU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729844469; c=relaxed/simple;
	bh=G/6ckttVcaH30xmrrUOhZM99NObo8lQEa+x32+FeI14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWRQZ5u6o2Od/rhfkSZutRpr4F6AY+1WG9qSjBEjXaPacD5dqX/t8sqDIEFCMFTrQ1VoLFmM6NBnhQVV7Zm1gg+XxPV6rZWsCXXYDUeZTnx/sGRDuHEb4PA31In61fLlpsGEJ2diRP7Nzf7N/H+vpcvCrRI5tuv4Marj8eushug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=NC3vnxa+; arc=none smtp.client-ip=207.246.76.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1729844449;
 bh=LkZZAR59UvfigAsheIWK4sIE2MkApoDkQ9BtG/CzxhA=;
 b=NC3vnxa+lDaylXiMJFMcPI5QLU6Lqo63iMH+9de0Mr3oCL6PsrJhHk36Dv7+JZyjtHKJy5crt
 1NiLQAgRkCSRmMyzeCzYBJthJRLGSZhromlxRlIbinFA/w9z+eF+AsQc4rLRf0lxls5jCo1YKgM
 dAWkVQNdY/unyUQr92Eb5yJ63ZTb3qkkjlH5EYXLwqEx5sk8oT9r54+3MQ4KBBJGAawq/+MUXQh
 9td3NIo3nMnx/3sUqvgZ3WqfskSwb2DdIr3LIgKEeEbbbEiYtogsjwCZNjohYahlkDVh/mOXWAc
 TYz+YlXB0W+toDWMxoWMo9Mo5YsnywCbyM05JDi4V83g==
Message-ID: <71159f58-be8b-41a4-9fed-522e09a7a564@kwiboo.se>
Date: Fri, 25 Oct 2024 10:20:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] media: rkvdec: Add H.264 High 10 and 4:2:2
 profile support
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240909192522.1076704-1-jonas@kwiboo.se>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 671b54df038a5e08a321fe5c

Hi Sebastian,

Will you have time to look at this series any time soon?

Would like to send a v2 of the now one year old rkvdec hevc series but
this series is sort of holding that back ;-)

Regards,
Jonas

On 2024-09-09 21:24, Jonas Karlman wrote:
> This series add H.264 High 10 and 4:2:2 profile support to the Rockchip
> Video Decoder driver.
> 
> Patch 1 add helpers for calculating plane bytesperline and sizeimage.
> Patch 2 add two new pixelformats for semi-planer 10-bit 4:2:0/4:2:2 YUV.
> 
> Patch 3 change to use bytesperline and buffer height to configure strides.
> Patch 4 change to use values from SPS/PPS control to configure the HW.
> 
> Patch 5-9 refactor code to support filtering of CAPUTRE formats based
> on the image format returned from a get_image_fmt ops.
> 
> Patch 10 add final bits to support H.264 High 10 and 4:2:2 profiles.
> 
> Patch 11 add a fix for enumerated frame sizes returned to userspace.
> 
> Tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> 
>   v4l2-compliance 1.28.1, 64 bits, 64-bit time_t
>   ...
>   Total for rkvdec device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
> 
>   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-v4l2request
>   ...
>   Ran 65/69 tests successfully
> 
>   Running test suite JVT-AVC_V1 with decoder FFmpeg-H.264-v4l2request
>   ...
>   Ran 129/135 tests successfully
> 
> Before this series:
> 
>   Running test suite JVT-FR-EXT with decoder FFmpeg-H.264-v4l2request
>   ...
>   Ran 44/69 tests successfully
> 
> Changes in v6:
> - Change to use fmt_idx instead of j++ tucked inside a condition (Dan)
> - Add patch to fix enumerated frame sizes returned to userspace (Alex)
> - Fluster test score is same as v4 and v5, see [4] and [5]
> Link to v5: https://lore.kernel.org/linux-media/20240618194647.742037-1-jonas@kwiboo.se/
> 
> Changes in v5:
> - Drop Remove SPS validation at streaming start patch
> - Move buffer align from rkvdec_fill_decoded_pixfmt to min/step_width
> - Use correct profiles for V4L2_CID_MPEG_VIDEO_H264_PROFILE
> - Collect r-b and t-b tags
> - Fluster test score is same as v4, see [4] and [5]
> Link to v4: https://lore.kernel.org/linux-media/20231105165521.3592037-1-jonas@kwiboo.se/
> 
> Changes in v4:
> - Fix failed v4l2-compliance tests related to CAPTURE queue
> - Rework CAPTURE format filter anv validate to use an image format
> - Run fluster test suite JVT-FR-EXT [4] and JVT-AVC_V1 [5]
> Link to v3: https://lore.kernel.org/linux-media/20231029183427.1781554-1-jonas@kwiboo.se/
> 
> Changes in v3:
> - Drop merged patches
> - Use bpp and bpp_div instead of prior misuse of block_w/block_h
> - New patch to use values from SPS/PPS control to configure the HW
> - New patch to remove an unnecessary call to validate sps at streaming start
> - Reworked pixel format validation
> Link to v2: https://lore.kernel.org/linux-media/20200706215430.22859-1-jonas@kwiboo.se/
> 
> Changes in v2:
> - Collect r-b tags
> - SPS pic width and height in mbs validation moved to rkvdec_try_ctrl
> - New patch to not override output buffer sizeimage
> - Reworked pixel format validation
> - Only align decoded buffer instead of changing frmsize step_width
> Link to v1: https://lore.kernel.org/linux-media/20200701215616.30874-1-jonas@kwiboo.se/
> 
> To fully runtime test this series you may need FFmpeg patches from [1]
> and fluster patches from [2], this series is also available at [3].
> 
> [1] https://github.com/Kwiboo/FFmpeg/commits/v4l2request-2024-v2-rkvdec/
> [2] https://github.com/Kwiboo/fluster/commits/ffmpeg-v4l2request-rkvdec/
> [3] https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v6/
> [4] https://gist.github.com/Kwiboo/f4ac15576b2c72887ae2bc5d58b5c865
> [5] https://gist.github.com/Kwiboo/459a1c8f1dcb56e45dc7a7a29cc28adf
> 
> Regards,
> Jonas
> 
> Alex Bee (1):
>   media: rkvdec: h264: Don't hardcode SPS/PPS parameters
> 
> Jonas Karlman (10):
>   media: v4l2-common: Add helpers to calculate bytesperline and
>     sizeimage
>   media: v4l2: Add NV15 and NV20 pixel formats
>   media: rkvdec: h264: Use bytesperline and buffer height as virstride
>   media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
>   media: rkvdec: Move rkvdec_reset_decoded_fmt helper
>   media: rkvdec: Extract decoded format enumeration into helper
>   media: rkvdec: Add image format concept
>   media: rkvdec: Add get_image_fmt ops
>   media: rkvdec: h264: Support High 10 and 4:2:2 profiles
>   media: rkvdec: Fix enumerate frame sizes
> 
>  .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  80 +++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  drivers/staging/media/rkvdec/rkvdec-h264.c    |  64 +++--
>  drivers/staging/media/rkvdec/rkvdec.c         | 239 +++++++++++++-----
>  drivers/staging/media/rkvdec/rkvdec.h         |  18 +-
>  include/uapi/linux/videodev2.h                |   2 +
>  7 files changed, 410 insertions(+), 123 deletions(-)
> 


