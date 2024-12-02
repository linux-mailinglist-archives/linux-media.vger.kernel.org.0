Return-Path: <linux-media+bounces-22477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13B9E0A9A
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 19:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FD5AB8335F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269F419995B;
	Mon,  2 Dec 2024 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgN6GVxv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578AAD51;
	Mon,  2 Dec 2024 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156697; cv=none; b=FjzjlkMurKI08ibU2ZKSVHC5+aHLznCQsN9fiIXG3DbYfYjEGZqHVs0DmHhck8oOw+f7Bflf6GWKth7GpTwhpQV8681gUCs4cs15QMKxh+Vo6tLfuofwz7n/KCLmQjAFOUUbueJtFkWcqE726hLYR8g8fLQNKiZwsdoXXSddjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156697; c=relaxed/simple;
	bh=izSs0FmoAiW41CKlfqR52r5gwjKjez8AUBIxKV9qYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6a5erUAjRcviofqx0E575aVgY4LMHwXTl9VZi8EbkEX/nz1XqEAHGfscE0F3EKc4V8EbWhta4yy1Uk0v0LcC2BbhD79k/g/0zZwaQZCEVibis4/lqY8mxkLAfnHQW9p7YhT7ZzT6pVxsBffK+lhDZ7TwvqRQ67MnR9J8iat/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgN6GVxv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37E2C4CED1;
	Mon,  2 Dec 2024 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733156696;
	bh=izSs0FmoAiW41CKlfqR52r5gwjKjez8AUBIxKV9qYXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgN6GVxvuSg/C+xiVgczYxHNbsPNaJvOLGQrcTatCDKjMlMkfux7IWPgt6plpseK/
	 /tElV2/5wcC491iK69+WelHtf5qKZk2F7ieh3aCMaXLuI9HX1+Mnn4N2pDwD+i78Ew
	 EiLqsExR2WmZC3qecZ1CapqQhTOdqydsAFqPDz/u/FE6HVwqzuQSAftPqKVj/8pC2D
	 QUPP6QSDpYuxZGPPCLMvbOwzhfy0HLThDVifzJHUs/OjbGpGeOPEjU/9njYzQwSrN8
	 qZc6QkMzDz3zbuWA/e1KNQZx17nnt573cBS9mGqQvXY3s72+4k57HoswRrL9oD4zgb
	 Veha6oYIPQx+w==
Date: Mon, 2 Dec 2024 09:24:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler
 warning
Message-ID: <20241202162454.GA2848026@thelio-3990X>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>

 Mon, Dec 02, 2024 at 03:47:17PM +0000, Ricardo Ribalda wrote:
> llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
> the same enum type, but their are part of the same ternary operator.
> 
> vpu_inst.id is of type int, so we can just rewrite a bit the code and
> avoid the following llvm9 warning:

LLVM 19, not LLVM 9, as the minimum version for building the kernel is
LLVM 13.

> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

FYI, Arnd basically sent the same patch October 18 but I guess it has
not been picked up?

https://lore.kernel.org/20241018152127.3958436-1-arnd@kernel.org/

Hopefully the new media committers model will help patches like that get
picked up in a more timely manner.

> ---
>  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..4786062e879a 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
>  
>  static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  {
> -	const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
>  	int ret = 0;
>  	struct venc_h264_inst *inst;
>  
> @@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  
>  	inst->ctx = ctx;
>  	inst->vpu_inst.ctx = ctx;
> -	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +	if (MTK_ENC_CTX_IS_EXT(ctx))
> +		inst->vpu_inst.id = SCP_IPI_VENC_H264;
> +	else
> +		inst->vpu_inst.id = IPI_VENC_H264;
>  	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
>  
>  	ret = vpu_enc_init(&inst->vpu_inst);
> 
> -- 
> 2.47.0.338.g60cca15819-goog
> 

