Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66F131AC8
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 11:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfFAJX6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 05:23:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46368 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfFAJX6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 05:23:58 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4CCF02682E1;
        Sat,  1 Jun 2019 10:23:56 +0100 (BST)
Date:   Sat, 1 Jun 2019 11:23:53 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 10/10] media: hantro: allow arbitrary number of
 clocks
Message-ID: <20190601112353.132c7f23@collabora.com>
In-Reply-To: <20190531085523.10892-11-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
        <20190531085523.10892-11-p.zabel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 31 May 2019 10:55:23 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Dynamically allocate clocks and move clock names out of struct
> hantro_variant. This lifts the four clock limit and allows to use
> ARRAY_SIZE() to fill .num_clocks to reduce the risk of mismatches.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> New in v3.
> ---
>  drivers/staging/media/hantro/hantro.h        |  6 ++----
>  drivers/staging/media/hantro/hantro_drv.c    |  5 +++++
>  drivers/staging/media/hantro/imx8m_vpu_hw.c  | 10 ++++++----
>  drivers/staging/media/hantro/rk3288_vpu_hw.c |  8 ++++++--
>  drivers/staging/media/hantro/rk3399_vpu_hw.c | 12 ++++++++----
>  5 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 295a00d59a5f..0a3b2a8b3e67 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -25,8 +25,6 @@
>  
>  #include "hantro_hw.h"
>  
> -#define HANTRO_MAX_CLOCKS		4
> -
>  #define MPEG2_MB_DIM			16
>  #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
>  #define MPEG2_MB_HEIGHT(h)		DIV_ROUND_UP(h, MPEG2_MB_DIM)
> @@ -88,7 +86,7 @@ struct hantro_variant {
>  	int (*runtime_resume)(struct hantro_dev *vpu);
>  	const struct hantro_irq *irqs;
>  	int num_irqs;
> -	const char *clk_names[HANTRO_MAX_CLOCKS];
> +	const char * const *clk_names;
>  	int num_clocks;
>  	const char * const *reg_names;
>  	int num_regs;
> @@ -182,7 +180,7 @@ struct hantro_dev {
>  	struct hantro_func *decoder;
>  	struct platform_device *pdev;
>  	struct device *dev;
> -	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
> +	struct clk_bulk_data *clocks;
>  	void __iomem **bases;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index ef2b29d50100..d9624ee9fdc3 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -688,6 +688,11 @@ static int hantro_probe(struct platform_device *pdev)
>  
>  	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
>  
> +	vpu->clocks = devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
> +				   sizeof(*vpu->clocks), GFP_KERNEL);
> +	if (!vpu->clocks)
> +		return -ENOMEM;
> +
>  	for (i = 0; i < vpu->variant->num_clocks; i++)
>  		vpu->clocks[i].id = vpu->variant->clk_names[i];
>  	ret = devm_clk_bulk_get(&pdev->dev, vpu->variant->num_clocks,
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index fbe84c5f5619..811899e8416a 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -266,6 +266,7 @@ static const struct hantro_irq imx8mq_irqs[] = {
>  	{ "g2", NULL /* TODO: imx8m_vpu_g2_irq */ },
>  };
>  
> +static const char * const imx8mq_clk_names[] = { "g1", "g2", "bus" };
>  static const char * const imx8mq_reg_names[] = { "g1", "g2", "ctrl" };
>  
>  const struct hantro_variant imx8mq_vpu_variant = {
> @@ -278,8 +279,8 @@ const struct hantro_variant imx8mq_vpu_variant = {
>  	.irqs = imx8mq_irqs,
>  	.num_irqs = ARRAY_SIZE(imx8mq_irqs),
>  	.num_irqs = 2,
> -	.clk_names = { "g1", "g2", "bus" },
> -	.num_clocks = 3,
> +	.clk_names = imx8mq_clk_names,
> +	.num_clocks = ARRAY_SIZE(imx8mq_clk_names),
>  	.reg_names = imx8mq_reg_names,
>  	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
>  };
> @@ -290,6 +291,7 @@ static const struct hantro_irq imx8mm_irqs[] = {
>  	{ "h1", imx8mm_vpu_h1_irq },
>  };
>  
> +static const char * const imx8mm_clk_names[] = { "g1", "g2", "h1", "bus" };
>  static const char * const imx8mm_reg_names[] = { "g1", "g2", "h1", "ctrl" };
>  
>  const struct hantro_variant imx8mm_vpu_variant = {
> @@ -301,8 +303,8 @@ const struct hantro_variant imx8mm_vpu_variant = {
>  	.runtime_resume = imx8mm_runtime_resume,
>  	.irqs = imx8mm_irqs,
>  	.num_irqs = ARRAY_SIZE(imx8mm_irqs),
> -	.clk_names = { "g1", "g2", "h1", "bus" },
> -	.num_clocks = 4,
> +	.clk_names = imx8mm_clk_names,
> +	.num_clocks = ARRAY_SIZE(imx8mm_clk_names),
>  	.reg_names = imx8mm_reg_names,
>  	.num_regs = ARRAY_SIZE(imx8mm_reg_names)
>  };
> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index b4d5e24167db..fe721e0b948d 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -165,6 +165,10 @@ static const struct hantro_irq rk3288_irqs[] = {
>  	{ "vdpu", rk3288_vdpu_irq },
>  };
>  
> +static const char * const rk3288_clk_names[] = {
> +	"aclk", "hclk"
> +};
> +
>  const struct hantro_variant rk3288_vpu_variant = {
>  	.enc_offset = 0x0,
>  	.enc_fmts = rk3288_vpu_enc_fmts,
> @@ -177,6 +181,6 @@ const struct hantro_variant rk3288_vpu_variant = {
>  	.irqs = rk3288_irqs,
>  	.num_irqs = ARRAY_SIZE(rk3288_irqs),
>  	.init = rk3288_vpu_hw_init,
> -	.clk_names = {"aclk", "hclk"},
> -	.num_clocks = 2
> +	.clk_names = rk3288_clk_names,
> +	.num_clocks = ARRAY_SIZE(rk3288_clk_names)
>  };
> diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> index fc52bedf3665..f8400e49bc50 100644
> --- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
> @@ -165,6 +165,10 @@ static const struct hantro_irq rk3399_irqs[] = {
>  	{ "vdpu", rk3399_vdpu_irq },
>  };
>  
> +static const char * const rk3399_clk_names[] = {
> +	"aclk", "hclk"
> +};
> +
>  const struct hantro_variant rk3399_vpu_variant = {
>  	.enc_offset = 0x0,
>  	.enc_fmts = rk3399_vpu_enc_fmts,
> @@ -177,8 +181,8 @@ const struct hantro_variant rk3399_vpu_variant = {
>  	.irqs = rk3399_irqs,
>  	.num_irqs = ARRAY_SIZE(rk3399_irqs),
>  	.init = rk3399_vpu_hw_init,
> -	.clk_names = {"aclk", "hclk"},
> -	.num_clocks = 2
> +	.clk_names = rk3399_clk_names,
> +	.num_clocks = ARRAY_SIZE(rk3399_clk_names)
>  };
>  
>  static const struct hantro_irq rk3328_irqs[] = {
> @@ -194,6 +198,6 @@ const struct hantro_variant rk3328_vpu_variant = {
>  	.irqs = rk3328_irqs,
>  	.num_irqs = ARRAY_SIZE(rk3328_irqs),
>  	.init = rk3399_vpu_hw_init,
> -	.clk_names = {"aclk", "hclk"},
> -	.num_clocks = 2
> +	.clk_names = rk3399_clk_names,
> +	.num_clocks = ARRAY_SIZE(rk3399_clk_names),
>  };

