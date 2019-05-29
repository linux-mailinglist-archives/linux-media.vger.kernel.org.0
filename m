Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E7C2DC1A
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfE2Lqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:46:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52300 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbfE2Lqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:46:51 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BE57E2605E9;
        Wed, 29 May 2019 12:46:48 +0100 (BST)
Date:   Wed, 29 May 2019 13:46:45 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 5/9] media: hantro: add support for named register
 ranges
Message-ID: <20190529134645.65f8feb4@collabora.com>
In-Reply-To: <20190529095424.23614-6-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
        <20190529095424.23614-6-p.zabel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 May 2019 11:54:20 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Add support for multiple register ranges with SoC specific names.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/staging/media/hantro/hantro.h     |  7 ++++++-
>  drivers/staging/media/hantro/hantro_drv.c | 25 +++++++++++++++++------
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 6b90fe48bcdf..b796867808d5 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -27,6 +27,7 @@
>  
>  #define HANTRO_MAX_CLOCKS		4
>  #define HANTRO_MAX_IRQS			3
> +#define HANTRO_MAX_REG_RANGES		4
>  
>  #define MPEG2_MB_DIM			16
>  #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
> @@ -63,6 +64,8 @@ struct hantro_codec_ops;
>   * @num_irqs:			number of irqs in the arrays
>   * @clk_names:			array of clock names
>   * @num_clocks:			number of clocks in the array
> + * @reg_names:			array of register range names
> + * @num_regs:			number of register range names in the array
>   */
>  struct hantro_variant {
>  	unsigned int enc_offset;
> @@ -80,6 +83,8 @@ struct hantro_variant {
>  	int num_irqs;
>  	const char *clk_names[HANTRO_MAX_CLOCKS];
>  	int num_clocks;
> +	const char *reg_names[HANTRO_MAX_REG_RANGES];
> +	int num_regs;
>  };
>  
>  /**
> @@ -170,7 +175,7 @@ struct hantro_dev {
>  	struct platform_device *pdev;
>  	struct device *dev;
>  	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
> -	void __iomem *base;
> +	void __iomem *base[HANTRO_MAX_REG_RANGES];

Same comment as for the irq stuff.

>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
>  
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index f677b40bcd2d..bd02b27258e3 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -692,12 +692,25 @@ static int hantro_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
> -	vpu->base = devm_ioremap_resource(vpu->dev, res);
> -	if (IS_ERR(vpu->base))
> -		return PTR_ERR(vpu->base);
> -	vpu->enc_base = vpu->base + vpu->variant->enc_offset;
> -	vpu->dec_base = vpu->base + vpu->variant->dec_offset;
> +	if (vpu->variant->num_regs) {
> +		for (i = 0; i < vpu->variant->num_regs; i++) {
> +			const char *reg_name = vpu->variant->reg_names[i];
> +
> +			res = platform_get_resource_byname(vpu->pdev,
> +							   IORESOURCE_MEM,
> +							   reg_name);
> +			vpu->base[i] = devm_ioremap_resource(vpu->dev, res);
> +			if (IS_ERR(vpu->base[i]))
> +				return PTR_ERR(vpu->base[i]);
> +		}
> +	} else {
> +		res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
> +		vpu->base[0] = devm_ioremap_resource(vpu->dev, res);
> +		if (IS_ERR(vpu->base[0]))
> +			return PTR_ERR(vpu->base[0]);
> +		vpu->enc_base = vpu->base[0] + vpu->variant->enc_offset;
> +		vpu->dec_base = vpu->base[0] + vpu->variant->dec_offset;

I see ->dec_based is assigned in ->hw_init() in patch 8, so maybe it's
better to have the same workflow for rk variants: assign
vpu->{dec,enc}_base in ->hw_init() and set ->num_regs to 1 (plus a
fallback to platform_get_resource() instead of
platform_get_resource_byname() when ->reg_names[0] == NULL).

> +	}
>  
>  	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
>  	if (ret) {

