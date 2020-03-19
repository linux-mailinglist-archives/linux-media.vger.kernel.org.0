Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9F818C300
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgCSWcR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:32:17 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33180 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbgCSWcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:32:17 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMWDLt039385;
        Thu, 19 Mar 2020 17:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657133;
        bh=n+/IBqIGaKuiqjYUdiAE0Nc+juW/BJonCW1OqqjTYM0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xLI2VjAQuHfy8DXViMrCce6F6dqWKn6nV/woOq0mSqnHQANjYnWX0S+EZWssVbx9v
         AzwrkZDOOBVrDVpvJcYCzYk7mAIyjWMZAK9vVxaovenLqp6oY7qhLD7rv2hUhJNNl0
         zvJ1J4Eu17JEvfILpP+qP1sdXg8qKENgRRNUWda4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMWD63108045
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:32:13 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:32:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:32:13 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMWCFq037353;
        Thu, 19 Mar 2020 17:32:12 -0500
Subject: Re: [PATCH v2 06/19] media: ti-vpe: cal: catch error irqs and print
 errors
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-7-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <b27a2e98-3244-bbba-e2fe-65b62e3a6877@ti.com>
Date:   Thu, 19 Mar 2020 17:32:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-7-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> CAL reports various errors via IRQs, which are not handled at all by the
> current driver. Add code to enable and catch those IRQs and print
> errors. This will make it much easier to notice and debug issues with
> sensors.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c      | 46 +++++++++++++++++++++++-
>  drivers/media/platform/ti-vpe/cal_regs.h |  6 ++++
>  2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 4f9dee3474ba..838215a3f230 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -684,6 +684,21 @@ static void enable_irqs(struct cal_ctx *ctx)
>  {
>  	u32 val;
>  
> +	const u32 cio_err_mask =
> +		CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK |
> +		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
> +		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
> +		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
> +
> +	/* Enable CIO error irqs */
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1),
> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
> +		  cio_err_mask);
> +
> +	/* Always enable OCPO error */
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1), CAL_HL_IRQ_OCPO_ERR_MASK);
> +
>  	/* Enable IRQ_WDMA_END 0/1 */
>  	val = 0;
>  	set_field(&val, CAL_HL_IRQ_ENABLE, CAL_HL_IRQ_MASK(ctx->csi2_port));
> @@ -700,6 +715,12 @@ static void disable_irqs(struct cal_ctx *ctx)
>  {
>  	u32 val;
>  
> +	/* Disable CIO error irqs */
> +	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(1),
> +		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
> +	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
> +		  0);
> +
>  	/* Disable IRQ_WDMA_END 0/1 */
>  	val = 0;
>  	set_field(&val, CAL_HL_IRQ_CLEAR, CAL_HL_IRQ_MASK(ctx->csi2_port));
> @@ -1171,7 +1192,30 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
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
> +		if (irqst1 & CAL_HL_IRQ_OCPO_ERR_MASK)
> +			dev_err_ratelimited(&dev->pdev->dev, "OCPO ERROR\n");
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
> index 0b76d1186074..2d71f1e86e2a 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -158,6 +158,11 @@
>  #define CAL_HL_IRQ_ENABLED				0x1
>  #define CAL_HL_IRQ_PENDING				0x1
>  
> +#define CAL_HL_IRQ_OCPO_ERR_MASK		BIT(6)
> +
> +#define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + ((i)-1) * 8)
> +#define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + ((i)-1) * 8)
> +
>  #define CAL_PIX_PROC_EN_MASK			BIT(0)
>  #define CAL_PIX_PROC_EXTRACT_MASK		GENMASK(4, 1)
>  #define CAL_PIX_PROC_EXTRACT_B6				0x0
> @@ -414,6 +419,7 @@
>  #define CAL_CSI2_COMPLEXIO_IRQ_ERRCONTROL3_MASK		BIT(17)
>  #define CAL_CSI2_COMPLEXIO_IRQ_ERRCONTROL4_MASK		BIT(18)
>  #define CAL_CSI2_COMPLEXIO_IRQ_ERRCONTROL5_MASK		BIT(19)
> +#define CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK		GENMASK(19, 0)
>  #define CAL_CSI2_COMPLEXIO_IRQ_STATEULPM1_MASK		BIT(20)
>  #define CAL_CSI2_COMPLEXIO_IRQ_STATEULPM2_MASK		BIT(21)
>  #define CAL_CSI2_COMPLEXIO_IRQ_STATEULPM3_MASK		BIT(22)
> 

Reviewed-by: Benoit Parrot <bparrot@ti.com>
