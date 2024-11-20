Return-Path: <linux-media+bounces-21643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D99EE9D3D80
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ABBE1F21496
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333C71AA7A6;
	Wed, 20 Nov 2024 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D8wUmjZ7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E28A2746D;
	Wed, 20 Nov 2024 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732112746; cv=none; b=kF+N0BruoCkpK3HgvdNqeHTCEfjOdnc3pAXooAIZcYxZekRsxvRVHD29f6JgN63xAdtTNlvBlG9HkDe+C9eyzEy30/BJBdMl9c/vTKHM+v2wAyXIGOjPCgz7SLVAkYFDCp4j0j8sjMP2dlHLz9OaJ6pCrqfhAxKpvqR2uwsOa+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732112746; c=relaxed/simple;
	bh=KvjyYEigGAIEzNiagxO3KwdHG5J+fB7bQo5wDhPsuow=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jxYg7KEQqCsFVFpuZlNbWW3FoJTYM5rZUY6OKhJd3eS6P/W69WL5TknzkaAVYvCeU9ULKeZfyMpRtqU5evtA+mpA+D5MLmQl7RHKE8TS+ggdvcC3EzUmVfRpVKH53oOlQQj2VfJNi7oPU1TZFyykYE+KoHf6tziXq8FGKeH4LC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D8wUmjZ7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732112742;
	bh=KvjyYEigGAIEzNiagxO3KwdHG5J+fB7bQo5wDhPsuow=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=D8wUmjZ773YcWqtqoIdCnL8G3IgaI23r8gG0+swCd2x2iZnoLK/WlpWSVGF5lohqm
	 X6rgiHmLh5amj44p62PlpxdOxN50lgFChNYhm4+R4mW1lWRAkLnvwIRsYrNviE3mJm
	 mQuV/BXTfbsnXxLz1B3NwTLQ7o+afmpqAZ13XA9QA/avQPLObf4DtiKjl7xXP3o0pY
	 hBvSGUhCFaSJIdjxQqMO2i3Lt4bdkGxPxP9bfRrVA1+VgCFKfNJ5tI5pdvHeeiZHx0
	 z9C9p99iL4NZDqK4ICtTWBz/k0YRbuMOVyyIHbK8vFHHil5oSnnRtHGkxpnCd63cGG
	 qe6qZNXXnwfzQ==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::580])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3653417E36B9;
	Wed, 20 Nov 2024 15:25:41 +0100 (CET)
Message-ID: <c9f19faacccd47b8a72fc4a29a0f75b30bce1aa1.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] media: verisilicon: add WebP decoding support
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
Date: Wed, 20 Nov 2024 09:25:39 -0500
In-Reply-To: <20241120110105.244413-3-hugues.fruchet@foss.st.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
	 <20241120110105.244413-3-hugues.fruchet@foss.st.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 20 novembre 2024 à 12:01 +0100, Hugues Fruchet a écrit :
> Add WebP picture decoding support to VP8 stateless decoder.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
>  .../media/platform/verisilicon/hantro_g1_regs.h |  1 +
>  .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>  .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>  .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>  4 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> index c623b3b0be18..e7d4db788e57 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
> +++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
> @@ -232,6 +232,7 @@
>  #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
>  #define G1_REG_ADDR_STR					0x030
>  #define G1_REG_ADDR_DST					0x034
> +#define G1_REG_ADDR_DST_CHROMA				0x038
>  #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
>  #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
>  #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
> diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> index 851eb67f19f5..c83ee6f5edc8 100644
> --- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
> @@ -307,6 +307,12 @@ static void cfg_parts(struct hantro_ctx *ctx,
>  			   G1_REG_DEC_CTRL3_STREAM_LEN(dct_part_total_len),
>  			   G1_REG_DEC_CTRL3);
>  
> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
> +		vdpu_write_relaxed(vpu,
> +				   G1_REG_DEC_CTRL3_STREAM_LEN_EXT
> +					(dct_part_total_len >> 24),
> +				   G1_REG_DEC_CTRL3);
> +
>  	/* DCT partitions base address */
>  	for (i = 0; i < hdr->num_dct_parts; i++) {
>  		u32 byte_offset = dct_part_offset + dct_size_part_size + count;
> @@ -427,6 +433,12 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>  
>  	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
>  	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> +
> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
> +		vdpu_write_relaxed(vpu, dst_dma +
> +				   ctx->dst_fmt.plane_fmt[0].bytesperline *
> +				   ctx->dst_fmt.height,
> +				   G1_REG_ADDR_DST_CHROMA);
>  }
>  
>  int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
> @@ -471,6 +483,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
>  		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
>  	if (hdr->lf.level == 0)
>  		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
> +	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_WEBP_FRAME)
> +		reg |= G1_REG_DEC_CTRL0_WEBP_E;
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>  
>  	/* Frame dimensions */
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 2513adfbd825..7075b2ba1ec2 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -470,6 +470,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
>  		break;
>  	case V4L2_PIX_FMT_MPEG2_SLICE:
>  	case V4L2_PIX_FMT_VP8_FRAME:
> +	case V4L2_PIX_FMT_WEBP_FRAME:
>  	case V4L2_PIX_FMT_H264_SLICE:
>  	case V4L2_PIX_FMT_HEVC_SLICE:
>  	case V4L2_PIX_FMT_VP9_FRAME:
> @@ -492,6 +493,7 @@ hantro_update_requires_hold_capture_buf(struct hantro_ctx *ctx, u32 fourcc)
>  	case V4L2_PIX_FMT_JPEG:
>  	case V4L2_PIX_FMT_MPEG2_SLICE:
>  	case V4L2_PIX_FMT_VP8_FRAME:
> +	case V4L2_PIX_FMT_WEBP_FRAME:
>  	case V4L2_PIX_FMT_HEVC_SLICE:
>  	case V4L2_PIX_FMT_VP9_FRAME:
>  		vq->subsystem_flags &= ~(VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
> diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> index 833821120b20..48d6912c3bab 100644
> --- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
> @@ -22,10 +22,10 @@ static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
>  		.codec_mode = HANTRO_MODE_NONE,
>  		.frmsize = {
>  			.min_width = FMT_MIN_WIDTH,
> -			.max_width = FMT_FHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>  			.step_width = MB_DIM,
>  			.min_height = FMT_MIN_HEIGHT,
> -			.max_height = FMT_FHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,

I'm a little surprised of this change, since this is modifying VP8_FRAME, while
we should instead introduce WEBP_FRAME.

>  			.step_height = MB_DIM,
>  		},
>  	},
> @@ -68,6 +68,19 @@ static const struct hantro_fmt stm32mp25_venc_fmts[] = {
>  		.codec_mode = HANTRO_MODE_NONE,
>  		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
>  	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_WEBP_FRAME,
> +		.codec_mode = HANTRO_MODE_VP8_DEC,
> +		.max_depth = 2,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},

This is venc_fmt (encoder), this shouldn't be there.

>  	{
>  		.fourcc = V4L2_PIX_FMT_YUYV,
>  		.codec_mode = HANTRO_MODE_NONE,


