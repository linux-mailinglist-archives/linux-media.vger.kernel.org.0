Return-Path: <linux-media+bounces-19419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6E99A42B
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AE2728531A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 12:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE4D218588;
	Fri, 11 Oct 2024 12:46:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5D716426;
	Fri, 11 Oct 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728650816; cv=none; b=K+xmIopsr/djmj57Q/sd2WDdWDKfOPjmN6p4MxU/+/eejzWoY6/efMiqTfxEdpA7gzCEJadfIPwfVxOimqeZ8Z04tbjSxjNObuzK/OzuG6UFpf3dO0YJeWF9VOYY0oZlYYhjA1sYQUyJkBFFQKGfhKB1TJJujc3nByn+P2PenZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728650816; c=relaxed/simple;
	bh=i0ed9CtLCsNM06hRXOqootR9nu6z6R79XY2MRKNYTLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwFvDtAfmip+PYkm8ouZCC/vBBwkBawAT9MZ6+imUv3ZAtpulGLdrKsG4AekjmXnzSwkVRwlNBEI3HcDwGr1eR/dc+HyPVuBIhS/f94+yDO40LzHzIGVAW2NrL7FjW1N+Q97pihRrPl8pAg0cySTySqMrlxXoR5zpAFvCyUIYyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18D9C4CEC3;
	Fri, 11 Oct 2024 12:46:53 +0000 (UTC)
Message-ID: <c09e7819-a7d9-432f-baab-732e81b3f489@xs4all.nl>
Date: Fri, 11 Oct 2024 14:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: s5p-mfc: Corrected NV12M/NV21M plane-sizes
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 gost.dev@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com
References: <CGME20240806120911epcas5p1b0defc027a7f03ee9bf5f21036d3ae5e@epcas5p1.samsung.com>
 <20240806115714.29828-1-aakarsh.jain@samsung.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240806115714.29828-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2024 13:57, Aakarsh Jain wrote:
> There is a possibility of getting page fault if the overall
> buffer size is not aligned to 256bytes. Since MFC does read
> operation only and it won't corrupt the data values even if
> it reads the extra bytes.
> Corrected luma and chroma plane sizes for V4L2_PIX_FMT_NV12M
> and V4L2_PIX_FMT_NV21M pixel format.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  .../media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c    | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> index 73f7af674c01..03c957221fc4 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c
> @@ -498,8 +498,8 @@ static void s5p_mfc_dec_calc_dpb_size_v6(struct s5p_mfc_ctx *ctx)
>  	case V4L2_PIX_FMT_NV21M:
>  		ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12MT_HALIGN_V6);
>  		ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12MT_HALIGN_V6);
> -		ctx->luma_size = calc_plane(ctx->stride[0], ctx->img_height);
> -		ctx->chroma_size = calc_plane(ctx->stride[1], (ctx->img_height / 2));
> +		ctx->luma_size = calc_plane(ctx->img_width, ctx->img_height);
> +		ctx->chroma_size = calc_plane(ctx->img_width, (ctx->img_height >> 1));

I don't really understand why this is changed. Looking at the implementation of
calc_plane and the various #define values that are used here and in calc_plane,
the number should be the same.

I think the original code makes more sense.

If I missed something, let me know.

>  		break;
>  	case V4L2_PIX_FMT_YUV420M:
>  	case V4L2_PIX_FMT_YVU420M:
> @@ -539,9 +539,11 @@ static void s5p_mfc_dec_calc_dpb_size_v6(struct s5p_mfc_ctx *ctx)
>  static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
>  {
>  	unsigned int mb_width, mb_height;
> +	unsigned int default_size;
>  
>  	mb_width = MB_WIDTH(ctx->img_width);
>  	mb_height = MB_HEIGHT(ctx->img_height);
> +	default_size = (mb_width * mb_height) * 256;
>  
>  	if (IS_MFCV12(ctx->dev)) {
>  		switch (ctx->src_fmt->fourcc) {
> @@ -549,8 +551,8 @@ static void s5p_mfc_enc_calc_src_size_v6(struct s5p_mfc_ctx *ctx)
>  		case V4L2_PIX_FMT_NV21M:
>  			ctx->stride[0] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
>  			ctx->stride[1] = ALIGN(ctx->img_width, S5P_FIMV_NV12M_HALIGN_V6);
> -			ctx->luma_size = ctx->stride[0] * ALIGN(ctx->img_height, 16);
> -			ctx->chroma_size =  ctx->stride[0] * ALIGN(ctx->img_height / 2, 16);
> +			ctx->luma_size = ALIGN(default_size, 256);
> +			ctx->chroma_size = ALIGN(default_size / 2, 256);

Isn't this effectively the same as doing:

			ctx->luma_size = ALIGN(ctx->luma_size, 256);
			ctx->chroma_size = ALIGN(ctx->chroma_size, 256);

I.e., the bug is that these sizes are not rounded up to a multiple of 256,
so just add that, rather than changing code elsewhere.

I might be wrong, but this seems a much simpler solution.

Regards,

	Hans

>  			break;
>  		case V4L2_PIX_FMT_YUV420M:
>  		case V4L2_PIX_FMT_YVU420M:


