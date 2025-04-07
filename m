Return-Path: <linux-media+bounces-29494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE10A7DBED
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2357B16C242
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F6323A9BA;
	Mon,  7 Apr 2025 11:11:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759017A2F2
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024268; cv=none; b=Ks5z2RA1A8AAA59pEU0rpfVdy2+uXSFG/AI4fDXgl1oaUgPDIfgWvfyPtnrLPW7rwpSfrt6wUQzgJyItXm9y3I+bjPrx8g2ZRrbrnMgUCuT7WKd+cvgcMSL3Xjx8nrXx7Dyv5eoyi5/RI21x8d9eXPurhxz3MdijDOTWftA2S8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024268; c=relaxed/simple;
	bh=WgKUKTYlGlnQBqOBCgY7hVBa2ZHvgMkJcgXRNc+0lOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LiiNFGnnbN7+zM+yB208Ma2hxTIRcIqwtQPRDCpvbKXn5kUa3A7idMbU2d0DcQcRivNOFIUPvar8J+aIbL8V2jZ7E1jymSsswsX2nUDK9rBhqnFdQNWjkdJbjWliFeDXGolqKT2Z+ZWXj9h7um7rjBMjUCiA3Rluf8HQ7ZGvIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30DBC4CEDD;
	Mon,  7 Apr 2025 11:11:07 +0000 (UTC)
Message-ID: <1b7c3c7a-69b6-4a40-9345-f52e18d07b18@xs4all.nl>
Date: Mon, 7 Apr 2025 13:11:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: GIT PULL FOR 6.16] Enable 10bit and YCbCr 422 in RKVDEC H.264
 decoder
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org
References: <fc348bb52d60acaaa15d3221aaba8217d67d349c.camel@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <fc348bb52d60acaaa15d3221aaba8217d67d349c.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 22:09, Nicolas Dufresne wrote:
> Hey Hans & Mauro,
> 
> The following changes since commit f2151613e040973c868d28c8b00885dfab69eb75:
> 
>   media: pci: mgb4: include linux/errno.h (2025-03-07 12:05:42 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-6.16-rkvdec-h264-high10-and-422
> 
> for you to fetch changes up to 619d9391efd5ed93f805734279034fa34f537347:
> 
>   media: rkvdec: Fix frame size enumeration (2025-04-01 15:25:07 -0400)
> 
> ----------------------------------------------------------------
> Enable 10bit and YCbCr 422 in RKVDEC H.264 decoder
> 
> ----------------------------------------------------------------
> Alex Bee (1):
>       media: rkvdec: h264: Don't hardcode SPS/PPS parameters
> 
> Jonas Karlman (10):
>       media: v4l2-common: Add helpers to calculate bytesperline and sizeimage
>       media: v4l2: Add NV15 and NV20 pixel formats
>       media: rkvdec: h264: Use bytesperline and buffer height as virstride
>       media: rkvdec: Extract rkvdec_fill_decoded_pixfmt into helper
>       media: rkvdec: Move rkvdec_reset_decoded_fmt helper
>       media: rkvdec: Extract decoded format enumeration into helper
>       media: rkvdec: Add image format concept
>       media: rkvdec: Add get_image_fmt ops

So this patch needs more work.

>       media: rkvdec: h264: Support High 10 and 4:2:2 profiles

and this depends on the previous patch.

>       media: rkvdec: Fix frame size enumeration
> 
> Sebastian Fricke (1):
>       media: rkvdec: h264: Limit minimum profile to constrained baseline

I can take all other patches except those two. Would that work for you, Nicolas?

Regards,

	Hans

> 
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 128 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c                       |  80 +++++++++++++++++++++++++++++++++++++-----------------------------------
>  drivers/media/v4l2-core/v4l2-ioctl.c                        |   2 ++
>  drivers/staging/media/rkvdec/rkvdec-h264.c                  |  64 ++++++++++++++++++++++++++++++++++++++--------------------
>  drivers/staging/media/rkvdec/rkvdec.c                       | 239 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------
>  drivers/staging/media/rkvdec/rkvdec.h                       |  18 ++++++++++++++++-
>  include/uapi/linux/videodev2.h                              |   2 ++
>  7 files changed, 410 insertions(+), 123 deletions(-)
> 


