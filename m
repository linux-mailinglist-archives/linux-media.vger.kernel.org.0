Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183E5416E7A
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 11:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245111AbhIXJHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 05:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245103AbhIXJHk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 05:07:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE41C061574;
        Fri, 24 Sep 2021 02:06:07 -0700 (PDT)
Received: from [IPv6:2a01:e0a:4cb:a870:c58e:ea8f:b5a4:d24f] (unknown [IPv6:2a01:e0a:4cb:a870:c58e:ea8f:b5a4:d24f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC3A71F449A9;
        Fri, 24 Sep 2021 10:06:03 +0100 (BST)
Subject: Re: [PATCH v5 02/10] hantro: postproc: Introduce struct
 hantro_postproc_ops
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210922101146.13762-1-andrzej.p@collabora.com>
 <20210922101146.13762-3-andrzej.p@collabora.com>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <109f6e13-9793-0b1a-696d-d8d4838ca52f@collabora.com>
Date:   Fri, 24 Sep 2021 11:06:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922101146.13762-3-andrzej.p@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 22/09/2021 à 12:11, Andrzej Pietrasiewicz a écrit :
> From: Ezequiel Garcia <ezequiel@collabora.com>
>
> Turns out the post-processor block on the G2 core is substantially
> different from the one on the G1 core. Introduce hantro_postproc_ops
> with .enable and .disable methods, which will allow to support
> the G2 post-processor cleanly.

Introducing post-proc structure will be help to add scaling
support too.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>   drivers/staging/media/hantro/hantro.h         |  5 +--
>   drivers/staging/media/hantro/hantro_hw.h      | 13 +++++++-
>   .../staging/media/hantro/hantro_postproc.c    | 33 ++++++++++++++-----
>   drivers/staging/media/hantro/imx8m_vpu_hw.c   |  2 +-
>   .../staging/media/hantro/rockchip_vpu_hw.c    |  6 ++--
>   .../staging/media/hantro/sama5d4_vdec_hw.c    |  2 +-
>   6 files changed, 44 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index c2e2dca38628..c2e01959dc00 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -28,6 +28,7 @@
>   
>   struct hantro_ctx;
>   struct hantro_codec_ops;
> +struct hantro_postproc_ops;
>   
>   #define HANTRO_JPEG_ENCODER	BIT(0)
>   #define HANTRO_ENCODERS		0x0000ffff
> @@ -59,6 +60,7 @@ struct hantro_irq {
>    * @num_dec_fmts:		Number of decoder formats.
>    * @postproc_fmts:		Post-processor formats.
>    * @num_postproc_fmts:		Number of post-processor formats.
> + * @postproc_ops:		Post-processor ops.
>    * @codec:			Supported codecs
>    * @codec_ops:			Codec ops.
>    * @init:			Initialize hardware, optional.
> @@ -69,7 +71,6 @@ struct hantro_irq {
>    * @num_clocks:			number of clocks in the array
>    * @reg_names:			array of register range names
>    * @num_regs:			number of register range names in the array
> - * @postproc_regs:		&struct hantro_postproc_regs pointer
>    */
>   struct hantro_variant {
>   	unsigned int enc_offset;
> @@ -80,6 +81,7 @@ struct hantro_variant {
>   	unsigned int num_dec_fmts;
>   	const struct hantro_fmt *postproc_fmts;
>   	unsigned int num_postproc_fmts;
> +	const struct hantro_postproc_ops *postproc_ops;
>   	unsigned int codec;
>   	const struct hantro_codec_ops *codec_ops;
>   	int (*init)(struct hantro_dev *vpu);
> @@ -90,7 +92,6 @@ struct hantro_variant {
>   	int num_clocks;
>   	const char * const *reg_names;
>   	int num_regs;
> -	const struct hantro_postproc_regs *postproc_regs;
>   };
>   
>   /**
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index df7b5e3a57b9..4323e63dfbfc 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -170,6 +170,17 @@ struct hantro_postproc_ctx {
>   	struct hantro_aux_buf dec_q[VB2_MAX_FRAME];
>   };
>   
> +/**
> + * struct hantro_postproc_ops - post-processor operations
> + *
> + * @enable:	Enable the post-processor block. Optional.
> + * @disable:	Disable the post-processor block. Optional.
> + */
> +struct hantro_postproc_ops {
> +	void (*enable)(struct hantro_ctx *ctx);
> +	void (*disable)(struct hantro_ctx *ctx);
> +};
> +
>   /**
>    * struct hantro_codec_ops - codec mode specific operations
>    *
> @@ -217,7 +228,7 @@ extern const struct hantro_variant rk3328_vpu_variant;
>   extern const struct hantro_variant rk3399_vpu_variant;
>   extern const struct hantro_variant sama5d4_vdec_variant;
>   
> -extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
> +extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
>   
>   extern const u32 hantro_vp8_dec_mc_filter[8][6];
>   
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 07842152003f..882fb8bc5ddd 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -15,14 +15,14 @@
>   #define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
>   { \
>   	hantro_reg_write(vpu, \
> -			 &(vpu)->variant->postproc_regs->reg_name, \
> +			 &hantro_g1_postproc_regs.reg_name, \
>   			 val); \
>   }
>   
>   #define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
>   { \
>   	hantro_reg_write_s(vpu, \
> -			   &(vpu)->variant->postproc_regs->reg_name, \
> +			   &hantro_g1_postproc_regs.reg_name, \
>   			   val); \
>   }
>   
> @@ -64,16 +64,13 @@ bool hantro_needs_postproc(const struct hantro_ctx *ctx,
>   	return fmt->fourcc != V4L2_PIX_FMT_NV12;
>   }
>   
> -void hantro_postproc_enable(struct hantro_ctx *ctx)
> +static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
>   {
>   	struct hantro_dev *vpu = ctx->dev;
>   	struct vb2_v4l2_buffer *dst_buf;
>   	u32 src_pp_fmt, dst_pp_fmt;
>   	dma_addr_t dst_dma;
>   
> -	if (!vpu->variant->postproc_regs)
> -		return;
> -
>   	/* Turn on pipeline mode. Must be done first. */
>   	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
>   
> @@ -154,12 +151,30 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>   	return 0;
>   }
>   
> +static void hantro_postproc_g1_disable(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +
> +	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> +}
> +
>   void hantro_postproc_disable(struct hantro_ctx *ctx)
>   {
>   	struct hantro_dev *vpu = ctx->dev;
>   
> -	if (!vpu->variant->postproc_regs)
> -		return;
> +	if (vpu->variant->postproc_ops && vpu->variant->postproc_ops->disable)
> +		vpu->variant->postproc_ops->disable(ctx);
> +}
>   
> -	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
> +void hantro_postproc_enable(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +
> +	if (vpu->variant->postproc_ops && vpu->variant->postproc_ops->enable)
> +		vpu->variant->postproc_ops->enable(ctx);
>   }
> +
> +const struct hantro_postproc_ops hantro_g1_postproc_ops = {
> +	.enable = hantro_postproc_g1_enable,
> +	.disable = hantro_postproc_g1_disable,
> +};
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index ea919bfb9891..22fa7d2f3b64 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -262,7 +262,7 @@ const struct hantro_variant imx8mq_vpu_variant = {
>   	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
>   	.postproc_fmts = imx8m_vpu_postproc_fmts,
>   	.num_postproc_fmts = ARRAY_SIZE(imx8m_vpu_postproc_fmts),
> -	.postproc_regs = &hantro_g1_postproc_regs,
> +	.postproc_ops = &hantro_g1_postproc_ops,
>   	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>   		 HANTRO_H264_DECODER,
>   	.codec_ops = imx8mq_vpu_codec_ops,
> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> index d4f52957cc53..6c1ad5534ce5 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> @@ -460,7 +460,7 @@ const struct hantro_variant rk3036_vpu_variant = {
>   	.num_dec_fmts = ARRAY_SIZE(rk3066_vpu_dec_fmts),
>   	.postproc_fmts = rockchip_vpu1_postproc_fmts,
>   	.num_postproc_fmts = ARRAY_SIZE(rockchip_vpu1_postproc_fmts),
> -	.postproc_regs = &hantro_g1_postproc_regs,
> +	.postproc_ops = &hantro_g1_postproc_ops,
>   	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>   		 HANTRO_H264_DECODER,
>   	.codec_ops = rk3036_vpu_codec_ops,
> @@ -485,7 +485,7 @@ const struct hantro_variant rk3066_vpu_variant = {
>   	.num_dec_fmts = ARRAY_SIZE(rk3066_vpu_dec_fmts),
>   	.postproc_fmts = rockchip_vpu1_postproc_fmts,
>   	.num_postproc_fmts = ARRAY_SIZE(rockchip_vpu1_postproc_fmts),
> -	.postproc_regs = &hantro_g1_postproc_regs,
> +	.postproc_ops = &hantro_g1_postproc_ops,
>   	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
>   		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
>   	.codec_ops = rk3066_vpu_codec_ops,
> @@ -505,7 +505,7 @@ const struct hantro_variant rk3288_vpu_variant = {
>   	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
>   	.postproc_fmts = rockchip_vpu1_postproc_fmts,
>   	.num_postproc_fmts = ARRAY_SIZE(rockchip_vpu1_postproc_fmts),
> -	.postproc_regs = &hantro_g1_postproc_regs,
> +	.postproc_ops = &hantro_g1_postproc_ops,
>   	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
>   		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
>   	.codec_ops = rk3288_vpu_codec_ops,
> diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> index 9c3b8cd0b239..f3fecc7248c4 100644
> --- a/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> +++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> @@ -100,7 +100,7 @@ const struct hantro_variant sama5d4_vdec_variant = {
>   	.num_dec_fmts = ARRAY_SIZE(sama5d4_vdec_fmts),
>   	.postproc_fmts = sama5d4_vdec_postproc_fmts,
>   	.num_postproc_fmts = ARRAY_SIZE(sama5d4_vdec_postproc_fmts),
> -	.postproc_regs = &hantro_g1_postproc_regs,
> +	.postproc_ops = &hantro_g1_postproc_ops,
>   	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>   		 HANTRO_H264_DECODER,
>   	.codec_ops = sama5d4_vdec_codec_ops,
