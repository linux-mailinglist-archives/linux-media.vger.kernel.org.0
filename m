Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B32F31ABD
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 11:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfFAJOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 05:14:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46304 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfFAJOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 05:14:06 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0BE3427FDAE;
        Sat,  1 Jun 2019 10:14:04 +0100 (BST)
Date:   Sat, 1 Jun 2019 11:14:01 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 05/10] media: hantro: add support for named register
 ranges
Message-ID: <20190601111401.540166d0@collabora.com>
In-Reply-To: <20190531085523.10892-6-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
        <20190531085523.10892-6-p.zabel@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 31 May 2019 10:55:18 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Add support for multiple register ranges with SoC specific names.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v2 [1]:
>  - Move array of reg_names out of struct hantro_variant
>  - Use ARRAY_SIZE to set num_regs
>  - Dynamically allocate base address array in struct hantro_dev and
>    rename it to bases
>  - More concise IORESOURCE_MEM setup in hantro_probe
> 
> [1] https://patchwork.linuxtv.org/patch/56424/
> ---
>  drivers/staging/media/hantro/hantro.h     |  8 ++++++--
>  drivers/staging/media/hantro/hantro_drv.c | 24 +++++++++++++++++------
>  2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index d041d36a0805..feaa439a17b3 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -72,6 +72,8 @@ struct hantro_irq {
>   * @num_irqs:			number of irqs in the array
>   * @clk_names:			array of clock names
>   * @num_clocks:			number of clocks in the array
> + * @reg_names:			array of register range names
> + * @num_regs:			number of register range names in the array
>   */
>  struct hantro_variant {
>  	unsigned int enc_offset;
> @@ -88,6 +90,8 @@ struct hantro_variant {
>  	int num_irqs;
>  	const char *clk_names[HANTRO_MAX_CLOCKS];
>  	int num_clocks;
> +	const char * const *reg_names;
> +	int num_regs;
>  };
>  
>  /**
> @@ -160,7 +164,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   * @dev:		Pointer to device for convenient logging using
>   *			dev_ macros.
>   * @clocks:		Array of clock handles.
> - * @base:		Mapped address of VPU registers.
> + * @bases:		Mapped addresses of VPU registers.

I find the name 'bases' a bit too generic, maybe 'reg_bases'.
The rest of the patch LGTM

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
>   * @vpu_mutex:		Mutex to synchronize V4L2 calls.
> @@ -178,7 +182,7 @@ struct hantro_dev {
>  	struct platform_device *pdev;
>  	struct device *dev;
>  	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
> -	void __iomem *base;
> +	void __iomem **bases;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
>  
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index e49bb03a988e..1f756e06dfc6 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -669,6 +669,7 @@ static int hantro_probe(struct platform_device *pdev)
>  	const struct of_device_id *match;
>  	struct hantro_dev *vpu;
>  	struct resource *res;
> +	int num_bases;
>  	int i, ret;
>  
>  	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
> @@ -692,12 +693,23 @@ static int hantro_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
> -	vpu->base = devm_ioremap_resource(vpu->dev, res);
> -	if (IS_ERR(vpu->base))
> -		return PTR_ERR(vpu->base);
> -	vpu->enc_base = vpu->base + vpu->variant->enc_offset;
> -	vpu->dec_base = vpu->base + vpu->variant->dec_offset;
> +	num_bases = vpu->variant->num_regs ?: 1;
> +	vpu->bases = devm_kcalloc(&pdev->dev, num_bases, sizeof(*vpu->bases),
> +				  GFP_KERNEL);
> +	if (!vpu->bases)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_bases; i++) {
> +		res = vpu->variant->reg_names ?
> +		      platform_get_resource_byname(vpu->pdev, IORESOURCE_MEM,
> +						   vpu->variant->reg_names[i]) :
> +		      platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
> +		vpu->bases[i] = devm_ioremap_resource(vpu->dev, res);
> +		if (IS_ERR(vpu->bases[i]))
> +			return PTR_ERR(vpu->bases[i]);
> +	}
> +	vpu->enc_base = vpu->bases[0] + vpu->variant->enc_offset;
> +	vpu->dec_base = vpu->bases[0] + vpu->variant->dec_offset;
>  
>  	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
>  	if (ret) {

