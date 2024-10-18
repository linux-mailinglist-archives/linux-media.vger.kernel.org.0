Return-Path: <linux-media+bounces-19913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D582D9A49BA
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 00:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C7A7B21331
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 22:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54BF190664;
	Fri, 18 Oct 2024 22:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evCiJPUC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34833188A18;
	Fri, 18 Oct 2024 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729291299; cv=none; b=nWssB9qJRQ2VDnQdHKm9Bt1etRuzaNBlvvXlvBFteMc8jP/tIVrAl0dH2q5/PHm5jXQjqnQ/kBQyS1KfnGhtyC/fd2lbPx8hRVl7gcsyreTTUSEgaqZE6xAMaMjdJLSdkvUAsZOfXEA8VQmSyTVCqL4eOU31eNpmDEQ1LIy0hL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729291299; c=relaxed/simple;
	bh=9MYUEN+y7bGhQ5uRf0uI07lO/K3C7KNY5c2cLXqPh0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7XQbJFLS0gzBdvOBeTcZFLAOfnqahuQ3HqtKxeZtJZfwxS8RL/hY93esqsSKv7m8CdohbBRk1BAZePqvJbDHqQcEriyXLhBp0hsZMzXlCaG70/oj7YVe/oSNO7qG8KgW0uqCyOr2ZdTVcFYfEn2jAO2bWn5UZwkF7+/mlQjuco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evCiJPUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF23AC4CEC3;
	Fri, 18 Oct 2024 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729291298;
	bh=9MYUEN+y7bGhQ5uRf0uI07lO/K3C7KNY5c2cLXqPh0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evCiJPUCO4yWevyL7//o8c6xzDvBdx/+3P2JRJAqCmxhOZZopbmfBAFE3SkJ2WB4F
	 N3epTMeT3tBOeG0y4vV5TL3iB5+jmxyD9kNSL6nWxs9ZMV1iTQ1IkqhcsJqU2yKAwu
	 S1FAYgcgxQacKOd5biXHyWF17AI7ZQ7SxQELEuQRU+4Hhss2hi0M4g0mk7xsk6yny1
	 IHn4kMB3qyiF+HxFqtNeLZNP9rs+SW7W+COuFysLxjLdcKa33lcFLjbXD4bFjL9thn
	 JfzDmpIDXTh63O2CEqPlHNDUEOkMw5CNFJghTHun6XRErBfJxQXJABqLecAldvKfHf
	 2s0Gi/iuKgAsw==
Date: Fri, 18 Oct 2024 15:41:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Alexandre Courbot <acourbot@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Fei Shao <fshao@chromium.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mtk-vcodec: venc: avoid
 -Wenum-compare-conditional warning
Message-ID: <20241018224136.GB2635543@thelio-3990X>
References: <20241018152127.3958436-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018152127.3958436-1-arnd@kernel.org>

On Fri, Oct 18, 2024 at 03:21:10PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is one of three clang warnings about incompatible enum types
> in a conditional expression:
> 
> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: error: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Werror,-Wenum-compare-conditional]
>   597 |         inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
>       |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~
> 
> The code is correct, so just rework it to avoid the warning.
> 
> Fixes: 0dc4b3286125 ("media: mtk-vcodec: venc: support SCP firmware")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..8522f71fc901 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -594,7 +594,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  
>  	inst->ctx = ctx;
>  	inst->vpu_inst.ctx = ctx;
> -	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +	if (is_ext)
> +		inst->vpu_inst.id = SCP_IPI_VENC_H264;
> +	else
> +		inst->vpu_inst.id = IPI_VENC_H264;
> +
>  	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
>  
>  	ret = vpu_enc_init(&inst->vpu_inst);
> -- 
> 2.39.5
> 

