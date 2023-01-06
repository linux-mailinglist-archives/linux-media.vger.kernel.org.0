Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5ACB65FFE3
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 12:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjAFL7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 06:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjAFL7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 06:59:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384A9728A5;
        Fri,  6 Jan 2023 03:59:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 698D04AE;
        Fri,  6 Jan 2023 12:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673006357;
        bh=shoG7w+x8M1GwR2Lnup58s8nVA/zibc7HrmK9Bg1M6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S5UkQ179hLtb7c28hhlzGA4VZiFHh4/pFJU3aNVHHYwmCsIwEQDTIu8xFpEJbgOu9
         HcjdDv3I68ZHWKthn0v+DVGkZN3nWYuhoV75yRqJQDnVTF8dBbUDOY0/At9BssEz4Q
         BeL6BmSTMYDLMN6rEzqW40jdwvnR4K+GzVfJ78Yk=
Date:   Fri, 6 Jan 2023 13:59:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] media: imx-pxp: extract helper function to setup
 data path
Message-ID: <Y7gNDwAa11TxPEhR@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-4-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-4-m.tretter@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Jan 05, 2023 at 02:47:24PM +0100, Michael Tretter wrote:
> The driver must configure the data path through the Pixel Pipeline.
> 
> Currently, the driver is using a fixed setup, but once there are
> different pipeline configurations, it is helpful to have a dedicated
> function for determining the register value for the data path.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-pxp.c | 62 +++++++++++++++++++---------
>  1 file changed, 42 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 05abe40558b0..a957fee88829 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -726,6 +726,47 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
>  	}
>  }
>  
> +static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
> +{
> +	u32 ctrl0;
> +
> +	ctrl0 = 0;
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0);
> +
> +	return ctrl0;
> +}
> +
> +static void pxp_set_data_path(struct pxp_ctx *ctx)
> +{
> +	struct pxp_dev *dev = ctx->dev;
> +	u32 ctrl0;
> +	u32 ctrl1;
> +
> +	ctrl0 = pxp_data_path_ctrl0(ctx);
> +
> +	ctrl1 = 0;
> +	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1);
> +	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1);
> +
> +	writel(ctrl0, dev->mmio + HW_PXP_DATA_PATH_CTRL0);
> +	writel(ctrl1, dev->mmio + HW_PXP_DATA_PATH_CTRL1);
> +}
> +
>  static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  		     struct vb2_v4l2_buffer *out_vb)
>  {
> @@ -912,26 +953,7 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  	/* bypass LUT */
>  	writel(BM_PXP_LUT_CTRL_BYPASS, dev->mmio + HW_PXP_LUT_CTRL);
>  
> -	writel(BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(1)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(0)|
> -	       BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(0),
> -	       dev->mmio + HW_PXP_DATA_PATH_CTRL0);
> -	writel(BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(1) |
> -	       BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(1),
> -	       dev->mmio + HW_PXP_DATA_PATH_CTRL1);
> +	pxp_set_data_path(ctx);
>  
>  	writel(0xffff, dev->mmio + HW_PXP_IRQ_MASK);
>  

-- 
Regards,

Laurent Pinchart
