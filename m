Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E40931AB8
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 11:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfFAJH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 05:07:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46270 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfFAJH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 05:07:28 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C762C2613D9;
        Sat,  1 Jun 2019 10:07:26 +0100 (BST)
Date:   Sat, 1 Jun 2019 11:07:23 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 04/10] media: hantro: make irq names configurable
Message-ID: <20190601110723.52d8e4be@collabora.com>
In-Reply-To: <20190531085523.10892-5-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
        <20190531085523.10892-5-p.zabel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 31 May 2019 10:55:17 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> The i.MX8MQ bindings will use different IRQ names ("g1" instead of
> "vdpu", and "g2"), so make them configurable. This also allows to
> register more than two IRQs, which will be required for i.MX8MM support
> later (it will add "h1" instead of "vepu").
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> Changes since v2 [1]:
>  - Introduce struct hantro_irq, containing irq name and handler
>  - Replace separate integrated arrays in struct hantro_variant with
>    single external array of struct hantro_irq.
>  - Use ARRAY_SIZE to set num_irqs.
> 
> [1] https://patchwork.linuxtv.org/patch/56421/
> ---
>  drivers/staging/media/hantro/hantro.h        | 19 ++++++++---
>  drivers/staging/media/hantro/hantro_drv.c    | 33 +++++++-------------
>  drivers/staging/media/hantro/rk3288_vpu_hw.c |  9 ++++--
>  drivers/staging/media/hantro/rk3399_vpu_hw.c | 16 ++++++++--
>  4 files changed, 46 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 296b9ffad547..d041d36a0805 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -44,6 +44,17 @@ struct hantro_codec_ops;
>  #define HANTRO_MPEG2_DECODER	BIT(16)
>  #define HANTRO_DECODERS		0xffff0000
>  
> +/**
> + * struct hantro_irq - irq handler and name
> + *
> + * @name:			irq name for device tree lookup
> + * @handler:			interrupt handler
> + */
> +struct hantro_irq {
> +	const char *name;
> +	irqreturn_t (*handler)(int irq, void *priv);
> +};
> +
>  /**
>   * struct hantro_variant - information about VPU hardware variant
>   *
> @@ -57,8 +68,8 @@ struct hantro_codec_ops;
>   * @codec_ops:			Codec ops.
>   * @init:			Initialize hardware.
>   * @runtime_resume:		reenable hardware after power gating
> - * @vepu_irq:			encoder interrupt handler
> - * @vdpu_irq:			decoder interrupt handler
> + * @irqs:			array of irq names and interrupt handlers
> + * @num_irqs:			number of irqs in the array
>   * @clk_names:			array of clock names
>   * @num_clocks:			number of clocks in the array
>   */
> @@ -73,8 +84,8 @@ struct hantro_variant {
>  	const struct hantro_codec_ops *codec_ops;
>  	int (*init)(struct hantro_dev *vpu);
>  	int (*runtime_resume)(struct hantro_dev *vpu);
> -	irqreturn_t (*vepu_irq)(int irq, void *priv);
> -	irqreturn_t (*vdpu_irq)(int irq, void *priv);
> +	const struct hantro_irq *irqs;
> +	int num_irqs;
>  	const char *clk_names[HANTRO_MAX_CLOCKS];
>  	int num_clocks;
>  };
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index fb5f140dbaae..e49bb03a988e 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -705,36 +705,25 @@ static int hantro_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (vpu->variant->vdpu_irq) {
> +	for (i = 0; i < vpu->variant->num_irqs; i++) {
> +		const char *irq_name = vpu->variant->irqs[i].name;
>  		int irq;
>  
> -		irq = platform_get_irq_byname(vpu->pdev, "vdpu");
> -		if (irq <= 0) {
> -			dev_err(vpu->dev, "Could not get vdpu IRQ.\n");
> -			return -ENXIO;
> -		}
> -
> -		ret = devm_request_irq(vpu->dev, irq, vpu->variant->vdpu_irq,
> -				       0, dev_name(vpu->dev), vpu);
> -		if (ret) {
> -			dev_err(vpu->dev, "Could not request vdpu IRQ.\n");
> -			return ret;
> -		}
> -	}
> -
> -	if (vpu->variant->vepu_irq) {
> -		int irq;
> +		if (!vpu->variant->irqs[i].handler)
> +			continue;
>  
> -		irq = platform_get_irq_byname(vpu->pdev, "vepu");
> +		irq = platform_get_irq_byname(vpu->pdev, irq_name);
>  		if (irq <= 0) {
> -			dev_err(vpu->dev, "Could not get vepu IRQ.\n");
> +			dev_err(vpu->dev, "Could not get %s IRQ.\n", irq_name);
>  			return -ENXIO;
>  		}
>  
> -		ret = devm_request_irq(vpu->dev, irq, vpu->variant->vepu_irq,
> -				       0, dev_name(vpu->dev), vpu);
> +		ret = devm_request_irq(vpu->dev, irq,
> +				       vpu->variant->irqs[i].handler, 0,
> +				       dev_name(vpu->dev), vpu);
>  		if (ret) {
> -			dev_err(vpu->dev, "Could not request vepu IRQ.\n");
> +			dev_err(vpu->dev, "Could not request %s IRQ.\n",
> +				irq_name);
>  			return ret;
>  		}
>  	}
> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index 38adf74037fc..b4d5e24167db 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -160,6 +160,11 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>   * VPU variant.
>   */
>  
> +static const struct hantro_irq rk3288_irqs[] = {
> +	{ "vepu", rk3288_vepu_irq },
> +	{ "vdpu", rk3288_vdpu_irq },
> +};
> +
>  const struct hantro_variant rk3288_vpu_variant = {
>  	.enc_offset = 0x0,
>  	.enc_fmts = rk3288_vpu_enc_fmts,
> @@ -169,8 +174,8 @@ const struct hantro_variant rk3288_vpu_variant = {
>  	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
>  	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
>  	.codec_ops = rk3288_vpu_codec_ops,
> -	.vepu_irq = rk3288_vepu_irq,
> -	.vdpu_irq = rk3288_vdpu_irq,
> +	.irqs = rk3288_irqs,
> +	.num_irqs = ARRAY_SIZE(rk3288_irqs),
>  	.init = rk3288_vpu_hw_init,
>  	.clk_names = {"aclk", "hclk"},
>  	.num_clocks = 2
> diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> index 5e51def41f57..fc52bedf3665 100644
> --- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> @@ -160,6 +160,11 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
>   * VPU variant.
>   */
>  
> +static const struct hantro_irq rk3399_irqs[] = {
> +	{ "vepu", rk3399_vepu_irq },
> +	{ "vdpu", rk3399_vdpu_irq },
> +};
> +
>  const struct hantro_variant rk3399_vpu_variant = {
>  	.enc_offset = 0x0,
>  	.enc_fmts = rk3399_vpu_enc_fmts,
> @@ -169,20 +174,25 @@ const struct hantro_variant rk3399_vpu_variant = {
>  	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
>  	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
>  	.codec_ops = rk3399_vpu_codec_ops,
> -	.vepu_irq = rk3399_vepu_irq,
> -	.vdpu_irq = rk3399_vdpu_irq,
> +	.irqs = rk3399_irqs,
> +	.num_irqs = ARRAY_SIZE(rk3399_irqs),
>  	.init = rk3399_vpu_hw_init,
>  	.clk_names = {"aclk", "hclk"},
>  	.num_clocks = 2
>  };
>  
> +static const struct hantro_irq rk3328_irqs[] = {
> +	{ "vdpu", rk3399_vdpu_irq },
> +};
> +
>  const struct hantro_variant rk3328_vpu_variant = {
>  	.dec_offset = 0x400,
>  	.dec_fmts = rk3399_vpu_dec_fmts,
>  	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
>  	.codec = HANTRO_MPEG2_DECODER,
>  	.codec_ops = rk3399_vpu_codec_ops,
> -	.vdpu_irq = rk3399_vdpu_irq,
> +	.irqs = rk3328_irqs,
> +	.num_irqs = ARRAY_SIZE(rk3328_irqs),
>  	.init = rk3399_vpu_hw_init,
>  	.clk_names = {"aclk", "hclk"},
>  	.num_clocks = 2

