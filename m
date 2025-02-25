Return-Path: <linux-media+bounces-26946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F4A43FB1
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B52473AD929
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D98268C5A;
	Tue, 25 Feb 2025 12:51:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B45D20F076;
	Tue, 25 Feb 2025 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740487897; cv=none; b=fgG30UTArYscM/8wCqFEHqM2tKjuOP69scBByr3KMmaoJUFws1o5BsxyxusC6oniPcj4TiCiBOWdxtrAg76lnPaxHdsVU0fyO/yXNxQW+Q6amJCoPiiRrrdj1/lBB2gwQ/menjBB4AIUDLug/8xltT2+mMvQlTq0QcOB14sNd44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740487897; c=relaxed/simple;
	bh=YwPrwj31duZW2WVUvPMVeFpYM+8XG+hDz8X47ewiTvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+H+6R6uuWT3rFWRPjmgHgLujjdU3N3Y09QPrjcmyTirYATzR0QfQIjo3/WHxRg6WFsyTxElMQLj28nByVggP9skK6kZq/tUlYevWzuuxDXTgunvFPMpo9P6zhuZQBdNX86E5DM2v2r7IhAI/mXEgCtWcnrJIdW2o8erBFDEyRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5465DC4CEDD;
	Tue, 25 Feb 2025 12:51:33 +0000 (UTC)
Message-ID: <9db356bd-4d71-4975-91c6-7435bee8aef3@xs4all.nl>
Date: Tue, 25 Feb 2025 13:51:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/12] media: v4l2-common: Add helpers to calculate
 bytesperline and sizeimage
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
 <20250225-rkvdec_h264_high10_and_422_support-v7-1-7992a68a4910@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-1-7992a68a4910@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/25 10:40, Sebastian Fricke wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Add helper functions to calculate plane bytesperline and sizeimage,
> these new helpers consider bpp div, block width and height when
> calculating plane bytesperline and sizeimage.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 78 +++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index e4b2de3833ee3d440493f94fca5ee2049b013ef0..fdab16b9d481300eecf2202b3930fdf0a97a3023 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -357,6 +357,34 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
>  	return info->block_h[plane];
>  }
>  
> +static inline unsigned int v4l2_format_plane_stride(const struct v4l2_format_info *info, int plane,
> +						   unsigned int width)

Note that there was a small fixup for this function here:

https://patchwork.linuxtv.org/project/linux-media/patch/20250225124008.195405-1-sebastian.fricke@collabora.com/

Just so it isn't forgotten when this series is merged.

Regards,

	Hans

> +{
> +	unsigned int hdiv = plane ? info->hdiv : 1;
> +	unsigned int aligned_width =
> +		ALIGN(width, v4l2_format_block_width(info, plane));
> +
> +	return DIV_ROUND_UP(aligned_width, hdiv) *
> +	       info->bpp[plane] / info->bpp_div[plane];
> +}
> +
> +static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_info *info, int plane,
> +						    unsigned int height)
> +{
> +	unsigned int vdiv = plane ? info->vdiv : 1;
> +	unsigned int aligned_height =
> +		ALIGN(height, v4l2_format_block_height(info, plane));
> +
> +	return DIV_ROUND_UP(aligned_height, vdiv);
> +}
> +
> +static inline unsigned int v4l2_format_plane_size(const struct v4l2_format_info *info, int plane,
> +						  unsigned int width, unsigned int height)
> +{
> +	return v4l2_format_plane_stride(info, plane, width) *
> +	       v4l2_format_plane_height(info, plane, height);
> +}
> +
>  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>  				    const struct v4l2_frmsize_stepwise *frmsize)
>  {
> @@ -392,37 +420,19 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>  
>  	if (info->mem_planes == 1) {
>  		plane = &pixfmt->plane_fmt[0];
> -		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0] / info->bpp_div[0];
> +		plane->bytesperline = v4l2_format_plane_stride(info, 0, width);
>  		plane->sizeimage = 0;
>  
> -		for (i = 0; i < info->comp_planes; i++) {
> -			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> -			unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
> -			unsigned int aligned_width;
> -			unsigned int aligned_height;
> -
> -			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> -			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> -
> -			plane->sizeimage += info->bpp[i] *
> -				DIV_ROUND_UP(aligned_width, hdiv) *
> -				DIV_ROUND_UP(aligned_height, vdiv) / info->bpp_div[i];
> -		}
> +		for (i = 0; i < info->comp_planes; i++)
> +			plane->sizeimage +=
> +				v4l2_format_plane_size(info, i, width, height);
>  	} else {
>  		for (i = 0; i < info->comp_planes; i++) {
> -			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> -			unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
> -			unsigned int aligned_width;
> -			unsigned int aligned_height;
> -
> -			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> -			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> -
>  			plane = &pixfmt->plane_fmt[i];
>  			plane->bytesperline =
> -				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) / info->bpp_div[i];
> -			plane->sizeimage =
> -				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
> +				v4l2_format_plane_stride(info, i, width);
> +			plane->sizeimage = plane->bytesperline *
> +				v4l2_format_plane_height(info, i, height);
>  		}
>  	}
>  	return 0;
> @@ -446,22 +456,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>  	pixfmt->width = width;
>  	pixfmt->height = height;
>  	pixfmt->pixelformat = pixelformat;
> -	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0] / info->bpp_div[0];
> +	pixfmt->bytesperline = v4l2_format_plane_stride(info, 0, width);
>  	pixfmt->sizeimage = 0;
>  
> -	for (i = 0; i < info->comp_planes; i++) {
> -		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
> -		unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
> -		unsigned int aligned_width;
> -		unsigned int aligned_height;
> -
> -		aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
> -		aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
> -
> -		pixfmt->sizeimage += info->bpp[i] *
> -			DIV_ROUND_UP(aligned_width, hdiv) *
> -			DIV_ROUND_UP(aligned_height, vdiv) / info->bpp_div[i];
> -	}
> +	for (i = 0; i < info->comp_planes; i++)
> +		pixfmt->sizeimage +=
> +			v4l2_format_plane_size(info, i, width, height);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> 


