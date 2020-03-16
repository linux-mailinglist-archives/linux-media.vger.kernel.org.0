Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAF2186AC9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgCPMW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:22:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35644 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbgCPMW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:22:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAA53A3B;
        Mon, 16 Mar 2020 13:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584361343;
        bh=aRfkf5pakK3gSQ9QBQDexefh95Wf863cbxGvsanKxTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TmH8+urgiuk/xs412/PSdYDeHXF/mTqsti7TT1YLMTGm6bC2i0p0QeLWcvIHRSo75
         D0y9oX4yGau4hcZCaySFncYUG5GNGnj2V+z0k/fYtvvMwvy1/jbPVfH5SXw7iEN7xA
         LrNkN73nA9R+JWapSzaeayAbny3uBRCzrcSvK5H4=
Date:   Mon, 16 Mar 2020 14:22:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 03/16] media: ti-vpe: cal: catch error irqs and print
 errors
Message-ID: <20200316122218.GV4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-3-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:08PM +0200, Tomi Valkeinen wrote:
> CAL reports various errors via IRQs, which are not handled at all by the
> current driver. Add code to enable and catch those IRQs and print
> errors. This will make it much easier to notice and debug issues with
> sensors.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c      | 46 +++++++++++++++++++++++-
>  drivers/media/platform/ti-vpe/cal_regs.h |  3 ++
>  2 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index b4a9f4d16ce4..f6ce0558752a 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -692,6 +692,21 @@ static void cal_quickdump_regs(struct cal_dev *dev)
>   */
>  static void enable_irqs(struct cal_ctx *ctx)
>  {
> +	const u32 cio_err_mask =
> +		((1 << 20) - 1) |	/* lane errors */
> +		BIT(27) |		/* FIFO_OVR */
> +		BIT(28) |		/* SHORT_PACKET */
> +		BIT(30);		/* ECC_NO_CORRECTION */

Could you create macros for those bits ?

> +
> +	/* Enable CIO error irqs */
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1),
> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
> +		  cio_err_mask);
> +
> +	/* Always enable OCP error */
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1), BIT(6));

And for this bit too.

> +
>  	/* Enable IRQ_WDMA_END 0/1 */
>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), 1 << (ctx->csi2_port - 1));
>  	/* Enable IRQ_WDMA_START 0/1 */
> @@ -702,6 +717,12 @@ static void enable_irqs(struct cal_ctx *ctx)
>  
>  static void disable_irqs(struct cal_ctx *ctx)
>  {
> +	/* Disable CIO error irqs */
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(1),
> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
> +		  0);
> +
>  	/* Disable IRQ_WDMA_END 0/1 */
>  	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(2), 1 << (ctx->csi2_port - 1));
>  	/* Disable IRQ_WDMA_START 0/1 */
> @@ -1169,7 +1190,30 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>  	struct cal_dev *dev = (struct cal_dev *)data;
>  	struct cal_ctx *ctx;
>  	struct cal_dmaqueue *dma_q;
> -	u32 irqst2, irqst3;
> +	u32 irqst1, irqst2, irqst3;
> +
> +	irqst1 = reg_read(dev, CAL_HL_IRQSTATUS(1));
> +	if (irqst1) {
> +		int i;
> +
> +		reg_write(dev, CAL_HL_IRQSTATUS(1), irqst1);
> +
> +		if (irqst1 & BIT(6))
> +			dev_err_ratelimited(&dev->pdev->dev, "OCP ERROR\n");
> +
> +		for (i = 1; i <= 2; ++i) {
> +			if (irqst1 & CAL_HL_IRQ_CIO_MASK(i)) {
> +				u32 cio_stat = reg_read(dev,
> +							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
> +
> +				dev_err_ratelimited(&dev->pdev->dev,
> +						    "CIO%d error: %#08x\n", i, cio_stat);
> +
> +				reg_write(dev, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
> +					  cio_stat);
> +			}
> +		}
> +	}
>  
>  	/* Check which DMA just finished */
>  	irqst2 = reg_read(dev, CAL_HL_IRQSTATUS(2));
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index 0b76d1186074..a29198cc3efe 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -158,6 +158,9 @@
>  #define CAL_HL_IRQ_ENABLED				0x1
>  #define CAL_HL_IRQ_PENDING				0x1
>  
> +#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + (i-1) * 8)

This should be

	BIT(16 + ((i)-1) * 8)

> +#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + (i-1) * 8)

Same here.

> +
>  #define CAL_PIX_PROC_EN_MASK			BIT(0)
>  #define CAL_PIX_PROC_EXTRACT_MASK		GENMASK(4, 1)
>  #define CAL_PIX_PROC_EXTRACT_B6				0x0

-- 
Regards,

Laurent Pinchart
