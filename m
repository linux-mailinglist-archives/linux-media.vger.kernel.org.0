Return-Path: <linux-media+bounces-23326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EAF9EE8B5
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 15:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D11E165DDE
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 14:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18286214A7D;
	Thu, 12 Dec 2024 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ki6Yq+XB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639348837;
	Thu, 12 Dec 2024 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734013613; cv=none; b=rvFFDBHYimlXpqN7twLTkcX4uYBmLT/JsAdIAqn+l8pJ3YV5fCQhCyXOZcn8qVbci9erzVS7TFlIIm7FCMkCPpyqsonZviUaiG0ZMhLLKEdtSFOMt2kIr0fxyqjvA8TKrlC/AjNFaKlQaJ+AZ/bQhXVjoFCxOj/Zoh6BW06uIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734013613; c=relaxed/simple;
	bh=WY0yDhTwQaObU/ZfX3CIya5sYXTBGAfaLA5EU3pTQ/g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ttiq9l90WdTqCOPkzzwNv45KDZ3LqcS4ZiCbllLFEcYZOnp6Tv2mL+OCy/FpEnhwf8COx4I4X2AEwBqKrvPA/H+E53peP777EQlR5ZpnMURaQrgsIbNIxEZap8pBUg7Y8vqIwuijwZ2wsOvfRU13UMqf+PKCWf+viP0nczmzdm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ki6Yq+XB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734013609;
	bh=WY0yDhTwQaObU/ZfX3CIya5sYXTBGAfaLA5EU3pTQ/g=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Ki6Yq+XBhKrYI1rehEH6ytA9Zy5LsJve0243a/H1kgdh5r9VQxQ5sjhbywMqqTeP1
	 rPwi8Slb9DH+S6KoCiN/I+u+E5C5drtfFpxl4iyX12dj2+8Hxx0fkVGVlg+hqgqhmI
	 y4BhvNawe5Wkjzqt3bhUVU3un0N8mU2d68pDWp/gi0fLQIWWL52wqkLSeXw2NvhVcA
	 7jZhVdElyEg9xGU2wVzsTW2lxLczo3ImvfS/Bq8qd9t6HHCfnNQFkCGCiEsFd5M9ng
	 HqxkpOnjpvO5lHijAHxNQfSjk69JGcW3DyixIDfkCFzyrYk2bxzgWsZA6d/4y1LH/i
	 VppIFbE0CthQg==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACFA617E3767;
	Thu, 12 Dec 2024 15:26:47 +0100 (CET)
Message-ID: <2b5a496fc2c114ae40b4d623ac8ad0884d334b60.camel@collabora.com>
Subject: Re: [PATCH v2 3/3] media: verisilicon: postproc: 4K support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Fritz Koenig	 <frkoenig@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,  Daniel Almeida
 <daniel.almeida@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 12 Dec 2024 09:26:46 -0500
In-Reply-To: <20241120110105.244413-4-hugues.fruchet@foss.st.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
	 <20241120110105.244413-4-hugues.fruchet@foss.st.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 20 novembre 2024 à 12:01 +0100, Hugues Fruchet a écrit :
> Support input larger than 4096x2048 using extended input width/height
> fields of swreg92.
> This is needed to decode large WebP or JPEG pictures.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

This can likely be picked independently as it already improve JPEG support.

Nicolas

> ---
>  drivers/media/platform/verisilicon/hantro.h          | 2 ++
>  drivers/media/platform/verisilicon/hantro_g1_regs.h  | 2 +-
>  drivers/media/platform/verisilicon/hantro_postproc.c | 6 +++++-
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 811260dc3c77..d1337f7742e4 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -321,6 +321,8 @@ struct hantro_postproc_regs {
>  	struct hantro_reg output_fmt;
>  	struct hantro_reg orig_width;
>  	struct hantro_reg display_width;
> +	struct hantro_reg input_width_ext;
> +	struct hantro_reg input_height_ext;
>  };
>  
>  struct hantro_vp9_decoded_buffer_info {
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> index e7d4db788e57..f6e5bbeb1914 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -351,7 +351,7 @@
>  #define     G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v) << 4) & GENMASK(14, 4))
>  #define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
>  #define     G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
> -#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
> +#define G1_REG_PP_DISPLAY_WIDTH_IN_EXT	G1_SWREG(92)
>  #define G1_REG_PP_FUSE			G1_SWREG(99)
>  
>  #endif /* HANTRO_G1_REGS_H_ */
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
> index 232c93eea7ee..84c8e287470d 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -49,7 +49,9 @@ static const struct hantro_postproc_regs hantro_g1_postproc_regs = {
>  	.input_fmt = {G1_REG_PP_CONTROL, 29, 0x7},
>  	.output_fmt = {G1_REG_PP_CONTROL, 26, 0x7},
>  	.orig_width = {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
> -	.display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
> +	.display_width = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 0, 0xfff},
> +	.input_width_ext = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 26, 0x7},
> +	.input_height_ext = {G1_REG_PP_DISPLAY_WIDTH_IN_EXT, 29, 0x7},
>  };
>  
>  bool hantro_needs_postproc(const struct hantro_ctx *ctx,
> @@ -103,6 +105,8 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
>  	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.height);
>  	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
>  	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
> +	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) >> 9);
> +	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.height >> 8));
>  }
>  
>  static int down_scale_factor(struct hantro_ctx *ctx)


