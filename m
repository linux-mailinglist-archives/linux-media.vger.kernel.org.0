Return-Path: <linux-media+bounces-7024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1A87B340
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 22:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9821C224BE
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 21:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DF252F7A;
	Wed, 13 Mar 2024 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N04HLlpU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05812E6C
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710364200; cv=none; b=G8gUUPVLZo7z7dVsfmtFyEioNGQOSR1AsJDbmxX5uE6oBXiKZ/Ujr2nUXHfIVybHXApjY8oqG0pZzvT/16mK/hvFvZm5iW/4WapUaU3iod+FzHG9wPZMtaqqAvTQFjzOOTVveNTp9fxAYzB5BqburMAjhJWecJLF4WW//TYSI7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710364200; c=relaxed/simple;
	bh=4/0ULE33bmYh1BxoxjgCmxHhCv1bFcLqttxpsHOLVcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoVa70WLucC6Umix7m26aGypVvtDtIPk0+qn/oHyJGjhYybhAzgdHJgMbOGtxnuJRClz/XBx9jAUNJjGenzo6ZORX8RzRUzWyYNdlBrnaPuxLXQS/ta4zJJCJiY092dbiwn/JTehhu/JE9ewuwxPWnBOJsg3gdHKFKap09ERzt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N04HLlpU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF701899;
	Wed, 13 Mar 2024 22:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710364173;
	bh=4/0ULE33bmYh1BxoxjgCmxHhCv1bFcLqttxpsHOLVcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N04HLlpUnwWYcvsR5cvdH4zj1rk/aGppaM8zxnyLxvxoUym6oVVYV8/Ahw0/nTJVE
	 R43gjf0nh/0ruQ2WvP7wCZJKB/XyKvVYJuyUEJtZd0gXOt9uTDcZ/wIqArgVxbbs5m
	 s49svu/weYcGLcTpmDiqC6hla62iYmrGS/rje2P4=
Date: Wed, 13 Mar 2024 23:10:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
	Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-common: Add Y210 and Y216 format info
Message-ID: <20240313211003.GA2441@pendragon.ideasonboard.com>
References: <20240313154128.75089-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313154128.75089-1-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Mar 13, 2024 at 04:41:27PM +0100, Jacopo Mondi wrote:
> According to the formats description in videodev2.h Y210, Y212 and Y216
> are YCbCr packed formats. For each Y2xx format, xx bits of valid data
> occupy the MSBs of the 16 bit components, and 16-xx bits of zero padding
> occupy the LSBs.
> 
> The Y210 and Y216 formats are missing an entry in the v4l2_format_info[]
> table. Add it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 273d83de2a87..adb82d8f5a31 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -263,7 +263,9 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_YVYU,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_UYVY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_VYUY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_Y210,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
>  		  .block_w = { 16, 8, 0, 0 }, .block_h = { 32, 16, 0, 0 }},

-- 
Regards,

Laurent Pinchart

