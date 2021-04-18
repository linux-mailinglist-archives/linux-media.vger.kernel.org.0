Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1FBF363544
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 14:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhDRMkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 08:40:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59206 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbhDRMjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 08:39:08 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C02751E;
        Sun, 18 Apr 2021 14:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618749519;
        bh=26YijDrzRAp7T1GYCVIAVNI0kpORwvmmD1XlmH0N4Tk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pIZUWPIrWM+axgFZ+FbqX2mTpRzUi1P0rh2Q63VKxu/0lO1Mr6DT9DHhoeiNoFGTN
         20ihH+SW72QgOl8RmfMm+ME+rYC7gs/A2DL0I41ztZA96p/ALyeK9zEP5HSixzCbar
         RufuaCJkI9cjDNo14UkRA/lfEXNHmqji6aZ1feJ4=
Date:   Sun, 18 Apr 2021 15:38:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/28] media: ti-vpe: cal: catch VC errors
Message-ID: <YHwoTIhbLtKoD+6F@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-15-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-15-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:43PM +0300, Tomi Valkeinen wrote:
> CAL driver currently ignores VC related errors. To help catch error
> conditions, enable all the VC error interrupts and handle them in the
> interrupt handler by printing an error.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 23 ++++++++++++++++----
>  drivers/media/platform/ti-vpe/cal.c          |  9 ++++++++
>  2 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 974fcbb19547..0354f311c5d2 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -226,24 +226,39 @@ static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
>  		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
>  		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
>  		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
> -
> -	/* Enable CIO error IRQs. */
> +	const u32 vc_err_mask =
> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(0) |
> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(1) |
> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(2) |
> +		CAL_CSI2_VC_IRQ_CS_IRQ_MASK(3) |
> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(0) |
> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(1) |
> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(2) |
> +		CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(3);
> +
> +	/* Enable CIO & VC error IRQs. */
>  	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
> -		  CAL_HL_IRQ_CIO_MASK(phy->instance));
> +		  CAL_HL_IRQ_CIO_MASK(phy->instance) | CAL_HL_IRQ_VC_MASK(phy->instance));

Line wrap ? Same in multiple places below. I know there's no strict 80
columns limit anymore, but I don't think longer lines help with
readability in this patch (not to mention the coding style inconsistency
with the rest of the driver).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
>  		  cio_err_mask);
> +	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(phy->instance),
> +		  vc_err_mask);
>  }
>  
>  static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
>  {
>  	/* Disable CIO error irqs */
>  	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
> -		  CAL_HL_IRQ_CIO_MASK(phy->instance));
> +		  CAL_HL_IRQ_CIO_MASK(phy->instance) | CAL_HL_IRQ_VC_MASK(phy->instance));
>  	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance), 0);
> +	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(phy->instance), 0);
>  }
>  
>  static void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
>  {
> +	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
> +			1, CAL_CSI2_PPI_CTRL_ECC_EN_MASK);
> +
>  	cal_write_field(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
>  			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
>  }
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 0abcc83841c6..092041ddbcfb 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -577,6 +577,15 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>  				cal_write(cal, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
>  					  cio_stat);
>  			}
> +
> +			if (status & CAL_HL_IRQ_VC_MASK(i)) {
> +				u32 vc_stat = cal_read(cal, CAL_CSI2_VC_IRQSTATUS(i));
> +
> +				dev_err_ratelimited(cal->dev,
> +						    "CIO%u VC error: %#08x\n", i, vc_stat);
> +
> +				cal_write(cal, CAL_CSI2_VC_IRQSTATUS(i), vc_stat);
> +			}
>  		}
>  	}
>  

-- 
Regards,

Laurent Pinchart
