Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767BD3551FC
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 13:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbhDFL0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 07:26:47 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52137 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229612AbhDFL0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 07:26:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Tjqsl4crX43ycTjqvlNhyj; Tue, 06 Apr 2021 13:26:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617708397; bh=FBLx8rvHENqpxru0ljPGYejFDk8eQlj/hgD27G6aQM0=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QoVeKbifUCG0EcZfc0Z6at/tt1hnGjsUvDR0YAaLGGRdbg4SVvDeDx9muc1+AQNlj
         wHOK3W8l7x8UX76Upbo0WTn7QO7xZhio/TTbyt+2M7rB/5tY/FWmOM5yDtaE9kH8yG
         na+5R1MNUjR4tbT1ziilDy2x5R1tlk7qzXQQPnJDdpvc4q0ZrArJHfdr6W1AFxzwy8
         yDans6WMDcyBhG3+IE+shcOYrplc+udBWdOXh4f0NRNoWKtBYC2jYKRjtovRwvcigu
         2QjhDrmoKLa2zeEMSX+Q9NP1u+zjnwbOXFuwq8+iT7b5IdiINh0p2GQPvBd7FvOOXd
         7YfcnLbQRziHg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v8 03/13] media: hantro: Use syscon instead of 'ctrl'
 register
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com
Cc:     linux-media@vger.kernel.org, kernel@collabora.com
References: <20210401160003.88803-1-benjamin.gaignard@collabora.com>
 <20210401160003.88803-4-benjamin.gaignard@collabora.com>
Message-ID: <61752593-c44e-7e27-4e8d-ca5e98034e77@xs4all.nl>
Date:   Tue, 6 Apr 2021 13:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401160003.88803-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD/5VNZnNpiSF0XWyM0B0LIcfBZmXF664aQZrAXGvN5cdRH5iERE2cgorKbfi+j41cQ88xKvyq6Vsljpa+9YkhrQ7kNq9phB7PeezPTmP1Rg2SNBVhG/
 VldvJZHjgCa8v7WhmVt6/eH4mmSPelrKnJoeju6YBAkI7Y3A5HauyFVY3x2aCxHGvs4KHP0/x6+fg16UmNSHBVTgM8K2efflegZCWpVyxAB9LtNd8W1vBjWu
 1EOdw3Q1yleAsOdBk2loMgzL/ty6Z0JlJF2R06XFILl9rJJbBnWCqJQ8MRJuFXcZ1rwGMFM+jCG2CuxytJAnog==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 17:59, Benjamin Gaignard wrote:
> In order to be able to share the control hardware block between
> VPUs use a syscon instead a ioremap it in the driver.

instead a ioremap -> instead of ioremapping

> To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
> phandle is not found look at 'ctrl' reg-name.
> With the method it becomes useless to provide a list of register

the -> this

Regards,

	Hans

> names so remove it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> version 7:
>  - Add Philipp reviewed-by tag.
>  - Change syscon phandle name.
>  
> version 5:
>  - use syscon instead of VPU reset driver.
>  - if DT doesn't provide syscon keep backward compatibilty by using
>    'ctrl' reg-name.
> 
>  drivers/staging/media/hantro/hantro.h       |  5 +-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 52 ++++++++++++---------
>  2 files changed, 34 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 6c1b888abe75..37b9ce04bd4e 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -13,6 +13,7 @@
>  #define HANTRO_H_
>  
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/videodev2.h>
>  #include <linux/wait.h>
>  #include <linux/clk.h>
> @@ -167,7 +168,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   * @reg_bases:		Mapped addresses of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
> - * @ctrl_base:		Mapped address of VPU control block.
> + * @ctrl_base:		Regmap of VPU control block.
>   * @vpu_mutex:		Mutex to synchronize V4L2 calls.
>   * @irqlock:		Spinlock to synchronize access to data structures
>   *			shared with interrupt handlers.
> @@ -186,7 +187,7 @@ struct hantro_dev {
>  	void __iomem **reg_bases;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> -	void __iomem *ctrl_base;
> +	struct regmap *ctrl_base;
>  
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index c222de075ef4..8d0c3425234b 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
>  
>  #include "hantro.h"
>  #include "hantro_jpeg.h"
> @@ -24,30 +25,28 @@
>  #define CTRL_G1_PP_FUSE		0x0c
>  #define CTRL_G2_DEC_FUSE	0x10
>  
> +static const struct regmap_config ctrl_regmap_ctrl = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 0x14,
> +};
> +
>  static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
>  {
> -	u32 val;
> -
>  	/* Assert */
> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val &= ~reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> +	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET, reset_bits, 0);
>  
>  	udelay(2);
>  
>  	/* Release */
> -	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
> -	val |= reset_bits;
> -	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
> +	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET,
> +			   reset_bits, reset_bits);
>  }
>  
>  static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
>  {
> -	u32 val;
> -
> -	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> -	val |= clock_bits;
> -	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
> +	regmap_update_bits(vpu->ctrl_base, CTRL_CLOCK_ENABLE,
> +			   clock_bits, clock_bits);
>  }
>  
>  static int imx8mq_runtime_resume(struct hantro_dev *vpu)
> @@ -64,9 +63,9 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
>  	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
>  
>  	/* Set values of the fuse registers */
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
> -	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
> +	regmap_write(vpu->ctrl_base, CTRL_G1_DEC_FUSE, 0xffffffff);
> +	regmap_write(vpu->ctrl_base, CTRL_G1_PP_FUSE, 0xffffffff);
> +	regmap_write(vpu->ctrl_base, CTRL_G2_DEC_FUSE, 0xffffffff);
>  
>  	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
>  
> @@ -150,8 +149,22 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
>  
>  static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
>  {
> -	vpu->dec_base = vpu->reg_bases[0];
> -	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
> +	struct device_node *np = vpu->dev->of_node;
> +
> +	vpu->ctrl_base = syscon_regmap_lookup_by_phandle(np, "nxp,imx8m-vpu-ctrl");
> +	if (IS_ERR(vpu->ctrl_base)) {
> +		struct resource *res;
> +		void __iomem *ctrl;
> +
> +		res = platform_get_resource_byname(vpu->pdev, IORESOURCE_MEM, "ctrl");
> +		ctrl = devm_ioremap_resource(vpu->dev, res);
> +		if (IS_ERR(ctrl))
> +			return PTR_ERR(ctrl);
> +
> +		vpu->ctrl_base = devm_regmap_init_mmio(vpu->dev, ctrl, &ctrl_regmap_ctrl);
> +		if (IS_ERR(vpu->ctrl_base))
> +			return PTR_ERR(vpu->ctrl_base);
> +	}
>  
>  	return 0;
>  }
> @@ -198,7 +211,6 @@ static const struct hantro_irq imx8mq_irqs[] = {
>  };
>  
>  static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
> -static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
>  
>  const struct hantro_variant imx8mq_vpu_variant = {
>  	.dec_fmts = imx8m_vpu_dec_fmts,
> @@ -215,6 +227,4 @@ const struct hantro_variant imx8mq_vpu_variant = {
>  	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
>  	.clk_names = imx8mq_clk_names,
>  	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
> -	.reg_names = imx8mq_reg_names,
> -	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>  };
> 

