Return-Path: <linux-media+bounces-15519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E31940934
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A68611C2275C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA7F190480;
	Tue, 30 Jul 2024 07:13:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D26190046;
	Tue, 30 Jul 2024 07:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323588; cv=none; b=O49QmGIEEulHjp0079WUh3wWHOiRnnSn8eiY6XVDkSS5k23h7Bj5ydeK6YOCo4mHXeanyDBbjkkhuRo3Ml/RI8XWc1Fyp7zgmebfg4XvZm2qbYYYQj75TbqrdREkJUweiGSrPVvYz78Fwpb7RiubPj/uXElQqCD60Sp64SmVc44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323588; c=relaxed/simple;
	bh=r8XFMCc2tBAslYu2aU/ssjPkstwHvi9+kn9Z5Bj7R9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlYK6fPzexMZ+U22YGxUtrXG1Wmmnt7s4fs6/Ke6adLQ+E+Mo/VqJFQwEn6OYOAohcZRedbcgaGnAfMW2salr/6Uuz2+h4v94pO1vThdsxE+5qqn6DNkoNFwc/BnPfEotbohXMJ6+RkXUm4mdxBzbKo/nRMx0oM5cHMNrMq/Li4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B2DC32782;
	Tue, 30 Jul 2024 07:13:06 +0000 (UTC)
Message-ID: <92c88d0f-219e-43b4-9dce-5ae99585b767@xs4all.nl>
Date: Tue, 30 Jul 2024 09:13:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: test-drivers: Use V4L2_FMT_FLAG_ENUM_ALL
 flag
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-3-benjamin.gaignard@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240722150523.149667-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2024 17:05, Benjamin Gaignard wrote:
> Since V4L2_FMT_FLAG_ENUM_ALL flag mostly targeting stateless
> decoder pixel formats enumeration, update vicodec visl test
> drivers to use it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/test-drivers/vicodec/vicodec-core.c |  7 ++++---
>  drivers/media/test-drivers/visl/visl-video.c      | 11 +++++++----
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 3e011fe62ae1..1b4cd8ddd7c2 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -706,6 +706,7 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
>  		    bool is_out)
>  {
>  	bool is_uncomp = (ctx->is_enc && is_out) || (!ctx->is_enc && !is_out);
> +	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;

This is not what I am looking for: to properly test this in v4l2-compliance this
flag actually has to make a difference in the result. I.e. you actually have to
add some limitation. This might be easier to do in visl than vicodec. As long as
at least one test-driver support this, then that's good enough for me.

Regards,

	Hans

>  
>  	if (V4L2_TYPE_IS_MULTIPLANAR(f->type) && !multiplanar)
>  		return -EINVAL;
> @@ -718,18 +719,18 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
>  
>  		if (ctx->is_enc ||
>  		    !vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q))
> -			info = v4l2_fwht_get_pixfmt(f->index);
> +			info = v4l2_fwht_get_pixfmt(index);
>  		else
>  			info = v4l2_fwht_find_nth_fmt(info->width_div,
>  						     info->height_div,
>  						     info->components_num,
>  						     info->pixenc,
> -						     f->index);
> +						     index);
>  		if (!info)
>  			return -EINVAL;
>  		f->pixelformat = info->id;
>  	} else {
> -		if (f->index)
> +		if (index)
>  			return -EINVAL;
>  		f->pixelformat = ctx->is_stateless ?
>  			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
> diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
> index f8d970319764..c5f3e13b4198 100644
> --- a/drivers/media/test-drivers/visl/visl-video.c
> +++ b/drivers/media/test-drivers/visl/visl-video.c
> @@ -341,21 +341,24 @@ static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
>  				 struct v4l2_fmtdesc *f)
>  {
>  	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>  
> -	if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
> +	if (index >= ctx->coded_format_desc->num_decoded_fmts)
>  		return -EINVAL;
>  
> -	f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
> +	f->pixelformat = ctx->coded_format_desc->decoded_fmts[index];
>  	return 0;
>  }
>  
>  static int visl_enum_fmt_vid_out(struct file *file, void *priv,
>  				 struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(visl_coded_fmts))
> +	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
> +
> +	if (index >= ARRAY_SIZE(visl_coded_fmts))
>  		return -EINVAL;
>  
> -	f->pixelformat = visl_coded_fmts[f->index].pixelformat;
> +	f->pixelformat = visl_coded_fmts[index].pixelformat;
>  	return 0;
>  }
>  


