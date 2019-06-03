Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B236433051
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 14:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfFCMyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 08:54:44 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:51113 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726791AbfFCMyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 08:54:43 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id XmU1hLaFcsDWyXmU4htASV; Mon, 03 Jun 2019 14:54:41 +0200
Subject: Re: [PATCH v3 09/10] media: hantro: add initial i.MX8MM support
 (untested)
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
 <20190531085523.10892-10-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a49db696-a31e-7f80-f2c3-bcb162c03dee@xs4all.nl>
Date:   Mon, 3 Jun 2019 14:54:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531085523.10892-10-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFJUr62JRl6hyfKtUr3UuOOZWPQMVTiZGTl1xL6MXvd1ehAVrwIS2I1RO1RTZdpxR5iSke0Ds6Kx6/QsBRtr3ch7HLAl1juLLymrrp3s8Ltj8F8U+jVQ
 aRV+tQsE8siwrmWGMrgqSDgMuIClt7CDepHSlJNBsEvXk1SjZ/qaIxYyYF8JHTUEDam1FbDYS27gQV20WADeBRw7mX3Lit+ZUs4DI4NkoPAnzf6d3dBIFjqh
 DvTo4wj/wUAy7b9RA53usPEO/IZKQd4rAm9FxwWJVd1OihiObfCQlpPFphVq2FOwXPw+ppSP1xWYOg3xAoVMfHgMlsGGs8KoPVv1G9f6uzjHhP3PrpAbXgqX
 9wlizEjWRioJalgkgW6RZJV/3YJTfn9Z4SrYs/9Y8133ggoKgay+01qJxhQhvbO1j+5NMQ4Yv7UQEXCYPuGHAdUGHbg//g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/31/19 10:55 AM, Philipp Zabel wrote:
> This should enable MPEG-2 decoding on the Hantro G1 and JPEG encoding on
> the Hantro H1 on i.MX8MM.

That's the i.MX8M Mini, right? I think that's the official name for this
SoC.

In any case, I don't like merging this until someone was able to test it.

Regards,

	Hans

> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Changes since v2 [1]:
>  - Adapted to changes in patches 4 and 5
> 
> [1] https://patchwork.linuxtv.org/patch/56425/
> ---
>  drivers/staging/media/hantro/hantro_drv.c   |   1 +
>  drivers/staging/media/hantro/hantro_hw.h    |   1 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 137 ++++++++++++++++++++
>  3 files changed, 139 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index bf88e594d440..ef2b29d50100 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -419,6 +419,7 @@ static const struct of_device_id of_hantro_match[] = {
>  	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>  	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
>  	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
> +	{ .compatible = "nxp,imx8mm-vpu", .data = &imx8mm_vpu_variant, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_hantro_match);
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index fd6ad017a1cf..1c69669dba54 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -82,6 +82,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
>  extern const struct hantro_variant rk3328_vpu_variant;
>  extern const struct hantro_variant rk3288_vpu_variant;
>  extern const struct hantro_variant imx8mq_vpu_variant;
> +extern const struct hantro_variant imx8mm_vpu_variant;
>  
>  void hantro_watchdog(struct work_struct *work);
>  void hantro_run(struct hantro_ctx *ctx);
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index 3da5cbd1eab1..fbe84c5f5619 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -15,14 +15,17 @@
>  #define CTRL_SOFT_RESET		0x00
>  #define RESET_G1		BIT(1)
>  #define RESET_G2		BIT(0)
> +#define RESET_H1		BIT(2)
>  
>  #define CTRL_CLOCK_ENABLE	0x04
>  #define CLOCK_G1		BIT(1)
>  #define CLOCK_G2		BIT(0)
> +#define CLOCK_H1		BIT(2)
>  
>  #define CTRL_G1_DEC_FUSE	0x08
>  #define CTRL_G1_PP_FUSE		0x0c
>  #define CTRL_G2_DEC_FUSE	0x10
> +#define CTRL_H1_ENC_FUSE	0x14
>  
>  static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
>  {
> @@ -73,6 +76,30 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
>  	return 0;
>  }
>  
> +static int imx8mm_runtime_resume(struct hantro_dev *vpu)
> +{
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
> +	if (ret) {
> +		dev_err(vpu->dev, "Failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2 | RESET_H1);
> +	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2 | RESET_H1);
> +
> +	/* Set values of the fuse registers */
> +	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> +	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> +	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> +	writel(0xffffffff, vpu->ctrl_base + CTRL_H1_ENC_FUSE);
> +
> +	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
> +
> +	return 0;
> +}
> +
>  /*
>   * Supported formats.
>   */
> @@ -97,6 +124,43 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
>  	},
>  };
>  
> +static const struct hantro_fmt imx8mm_vpu_enc_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUV420M,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420P,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12M,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420SP,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUYV,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.enc_fmt = RK3288_VPU_ENC_FMT_YUYV422,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_UYVY,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.enc_fmt = RK3288_VPU_ENC_FMT_UYVY422,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_JPEG,
> +		.codec_mode = HANTRO_MODE_JPEG_ENC,
> +		.max_depth = 2,
> +		.header_size = JPEG_HEADER_SIZE,
> +		.frmsize = {
> +			.min_width = 96,
> +			.max_width = 8192,
> +			.step_width = JPEG_MB_DIM,
> +			.min_height = 32,
> +			.max_height = 8192,
> +			.step_height = JPEG_MB_DIM,
> +		},
> +	},
> +};
> +
>  static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
>  {
>  	struct hantro_dev *vpu = dev_id;
> @@ -115,6 +179,25 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t imx8mm_vpu_h1_irq(int irq, void *dev_id)
> +{
> +	struct hantro_dev *vpu = dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status, bytesused;
> +
> +	status = vepu_read(vpu, VEPU_REG_INTERRUPT);
> +	bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
> +	state = (status & VEPU_REG_INTERRUPT_FRAME_RDY) ?
> +		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
> +	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
> +
> +	hantro_irq_done(vpu, bytesused, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
>  {
>  	vpu->dec_base = vpu->bases[0];
> @@ -123,6 +206,15 @@ static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
>  	return 0;
>  }
>  
> +static int imx8mm_vpu_hw_init(struct hantro_dev *vpu)
> +{
> +	vpu->dec_base = vpu->bases[0];
> +	vpu->enc_base = vpu->bases[2];
> +	vpu->ctrl_base = vpu->bases[vpu->variant->num_regs - 1];
> +
> +	return 0;
> +}
> +
>  static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
> @@ -130,6 +222,13 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
>  	imx8m_soft_reset(vpu, RESET_G1);
>  }
>  
> +static void imx8mm_vpu_h1_reset(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +
> +	imx8m_soft_reset(vpu, RESET_H1);
> +}
> +
>  /*
>   * Supported codec ops.
>   */
> @@ -143,6 +242,21 @@ static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
>  	},
>  };
>  
> +static const struct hantro_codec_ops imx8mm_vpu_codec_ops[] = {
> +	[HANTRO_MODE_MPEG2_DEC] = {
> +		.run = hantro_g1_mpeg2_dec_run,
> +		.reset = imx8m_vpu_g1_reset,
> +		.init = hantro_mpeg2_dec_init,
> +		.exit = hantro_mpeg2_dec_exit,
> +	},
> +	[HANTRO_MODE_JPEG_ENC] = {
> +		.run = hantro_h1_jpeg_enc_run,
> +		.reset = imx8mm_vpu_h1_reset,
> +		.init = hantro_jpeg_enc_init,
> +		.exit = hantro_jpeg_enc_exit,
> +	},
> +};
> +
>  /*
>   * VPU variants.
>   */
> @@ -169,3 +283,26 @@ const struct hantro_variant imx8mq_vpu_variant = {
>  	.reg_names = imx8mq_reg_names,
>  	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>  };
> +
> +static const struct hantro_irq imx8mm_irqs[] = {
> +	{ "g1", imx8m_vpu_g1_irq },
> +	{ "g2", NULL /* TODO: imx8m_vpu_g2_irq */ },
> +	{ "h1", imx8mm_vpu_h1_irq },
> +};
> +
> +static const char * const imx8mm_reg_names[] = { "g1", "g2", "h1", "ctrl" };
> +
> +const struct hantro_variant imx8mm_vpu_variant = {
> +	.dec_fmts = imx8m_vpu_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
> +	.codec = HANTRO_MPEG2_DECODER,
> +	.codec_ops = imx8mm_vpu_codec_ops,
> +	.init = imx8mm_vpu_hw_init,
> +	.runtime_resume = imx8mm_runtime_resume,
> +	.irqs = imx8mm_irqs,
> +	.num_irqs = ARRAY_SIZE(imx8mm_irqs),
> +	.clk_names = { "g1", "g2", "h1", "bus" },
> +	.num_clocks = 4,
> +	.reg_names = imx8mm_reg_names,
> +	.num_regs = ARRAY_SIZE(imx8mm_reg_names)
> +};
> 

