Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2AB670D7E7
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 10:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236007AbjEWIwb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 04:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235949AbjEWIwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 04:52:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E6AFE;
        Tue, 23 May 2023 01:52:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6925A6233F;
        Tue, 23 May 2023 08:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519F9C4339B;
        Tue, 23 May 2023 08:52:22 +0000 (UTC)
Message-ID: <ba69ba2f-fcaf-75b0-507f-6cd82d48a5b8@xs4all.nl>
Date:   Tue, 23 May 2023 10:52:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 12/13] media: verisilicon: Enable AV1 decoder on rk3588
Content-Language: en-US
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230503083438.85139-1-benjamin.gaignard@collabora.com>
 <20230503083438.85139-13-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230503083438.85139-13-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Nicolas,

Can you review this patch? This is the only one without a Reviewed-by
from you. Once I have that, then I can make a PR.

I'll do a test build with sparse/smatch tests as well today to check that
there are no new warnings etc. introduced.

Regards,

	Hans

On 03/05/2023 10:34, Benjamin Gaignard wrote:
> Add rk3588 AV1 decoder to Hantro variant.
> The hardware support image from 64x64 up to 7680x4320
> by steps of 16 pixels.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/platform/verisilicon/hantro_drv.c   |   1 +
>  .../media/platform/verisilicon/hantro_hw.h    |   2 +
>  .../platform/verisilicon/rockchip_vpu_hw.c    | 134 ++++++++++++++++++
>  3 files changed, 137 insertions(+)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index be1f06c21910..dd41a6de1a0c 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -713,6 +713,7 @@ static const struct of_device_id of_hantro_match[] = {
>  	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>  	{ .compatible = "rockchip,rk3568-vepu", .data = &rk3568_vepu_variant, },
>  	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
> +	{ .compatible = "rockchip,rk3588-av1-vpu", .data = &rk3588_vpu981_variant, },
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 021fad15d66f..7f33f7b07ce4 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -403,11 +403,13 @@ extern const struct hantro_variant rk3328_vpu_variant;
>  extern const struct hantro_variant rk3399_vpu_variant;
>  extern const struct hantro_variant rk3568_vepu_variant;
>  extern const struct hantro_variant rk3568_vpu_variant;
> +extern const struct hantro_variant rk3588_vpu981_variant;
>  extern const struct hantro_variant sama5d4_vdec_variant;
>  extern const struct hantro_variant sunxi_vpu_variant;
>  
>  extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
>  extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
> +extern const struct hantro_postproc_ops rockchip_vpu981_postproc_ops;
>  
>  extern const u32 hantro_vp8_dec_mc_filter[8][6];
>  
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 8de6fd2e8eef..816ffa905a4b 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -13,9 +13,13 @@
>  #include "hantro_g1_regs.h"
>  #include "hantro_h1_regs.h"
>  #include "rockchip_vpu2_regs.h"
> +#include "rockchip_vpu981_regs.h"
>  
>  #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
>  #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
> +#define RK3588_ACLK_MAX_FREQ (300 * 1000 * 1000)
> +
> +#define ROCKCHIP_VPU981_MIN_SIZE 64
>  
>  /*
>   * Supported formats.
> @@ -74,6 +78,37 @@ static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] = {
>  	},
>  };
>  
> +static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.postprocessed = true,
> +		.frmsize = {
> +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_P010,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.postprocessed = true,
> +		.frmsize = {
> +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +};
> +
>  static const struct hantro_fmt rk3066_vpu_dec_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12,
> @@ -277,6 +312,48 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
>  	},
>  };
>  
> +static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12_4L4,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.frmsize = {
> +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV15_4L4,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.frmsize = {
> +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_AV1_FRAME,
> +		.codec_mode = HANTRO_MODE_AV1_DEC,
> +		.max_depth = 2,
> +		.frmsize = {
> +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_width = FMT_UHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +};
> +
>  static irqreturn_t rockchip_vpu1_vepu_irq(int irq, void *dev_id)
>  {
>  	struct hantro_dev *vpu = dev_id;
> @@ -331,6 +408,24 @@ static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t rk3588_vpu981_irq(int irq, void *dev_id)
> +{
> +	struct hantro_dev *vpu = dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	status = vdpu_read(vpu, AV1_REG_INTERRUPT);
> +	state = (status & AV1_REG_INTERRUPT_DEC_RDY_INT) ?
> +		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +	vdpu_write(vpu, 0, AV1_REG_INTERRUPT);
> +	vdpu_write(vpu, AV1_REG_CONFIG_DEC_CLK_GATE_E, AV1_REG_CONFIG);
> +
> +	hantro_irq_done(vpu, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int rk3036_vpu_hw_init(struct hantro_dev *vpu)
>  {
>  	/* Bump ACLK to max. possible freq. to improve performance. */
> @@ -346,6 +441,13 @@ static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>  	return 0;
>  }
>  
> +static int rk3588_vpu981_hw_init(struct hantro_dev *vpu)
> +{
> +	/* Bump ACLKs to max. possible freq. to improve performance. */
> +	clk_set_rate(vpu->clocks[0].clk, RK3588_ACLK_MAX_FREQ);
> +	return 0;
> +}
> +
>  static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
>  {
>  	/* Bump ACLK to max. possible freq. to improve performance. */
> @@ -498,6 +600,14 @@ static const struct hantro_codec_ops rk3568_vepu_codec_ops[] = {
>  	},
>  };
>  
> +static const struct hantro_codec_ops rk3588_vpu981_codec_ops[] = {
> +	[HANTRO_MODE_AV1_DEC] = {
> +		.run = rockchip_vpu981_av1_dec_run,
> +		.init = rockchip_vpu981_av1_dec_init,
> +		.exit = rockchip_vpu981_av1_dec_exit,
> +		.done = rockchip_vpu981_av1_dec_done,
> +	},
> +};
>  /*
>   * VPU variant.
>   */
> @@ -529,10 +639,18 @@ static const char * const rk3066_vpu_clk_names[] = {
>  	"aclk_vepu", "hclk_vepu"
>  };
>  
> +static const struct hantro_irq rk3588_vpu981_irqs[] = {
> +	{ "vdpu", rk3588_vpu981_irq },
> +};
> +
>  static const char * const rockchip_vpu_clk_names[] = {
>  	"aclk", "hclk"
>  };
>  
> +static const char * const rk3588_vpu981_vpu_clk_names[] = {
> +	"aclk", "hclk", "aclk_vdpu_root", "hclk_vdpu_root"
> +};
> +
>  /* VDPU1/VEPU1 */
>  
>  const struct hantro_variant rk3036_vpu_variant = {
> @@ -678,3 +796,19 @@ const struct hantro_variant px30_vpu_variant = {
>  	.clk_names = rockchip_vpu_clk_names,
>  	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
>  };
> +
> +const struct hantro_variant rk3588_vpu981_variant = {
> +	.dec_offset = 0x0,
> +	.dec_fmts = rockchip_vpu981_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(rockchip_vpu981_dec_fmts),
> +	.postproc_fmts = rockchip_vpu981_postproc_fmts,
> +	.num_postproc_fmts = ARRAY_SIZE(rockchip_vpu981_postproc_fmts),
> +	.postproc_ops = &rockchip_vpu981_postproc_ops,
> +	.codec = HANTRO_AV1_DECODER,
> +	.codec_ops = rk3588_vpu981_codec_ops,
> +	.irqs = rk3588_vpu981_irqs,
> +	.num_irqs = ARRAY_SIZE(rk3588_vpu981_irqs),
> +	.init = rk3588_vpu981_hw_init,
> +	.clk_names = rk3588_vpu981_vpu_clk_names,
> +	.num_clocks = ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
> +};

