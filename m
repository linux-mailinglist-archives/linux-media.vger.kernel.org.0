Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA99E66003F
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 13:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjAFM1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 07:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjAFM11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 07:27:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D533035937;
        Fri,  6 Jan 2023 04:27:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 473944AE;
        Fri,  6 Jan 2023 13:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673008045;
        bh=1ZxzED4nciIar20t4Xd9ZwLDt1bW0Vxw8Yw6awN5DQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fOX3sn4v6RVHQ+qQtOQcbcdOghHaUQQUGOcbsBkMba+ArnH1xiG0pEtgGyEmExzmR
         Q3+7TsaYE3uNv7heXKMipQItFiXkv97gb97OZrtDAo7bv/hiROztci7c68S8a2o5RM
         OZIOCNhG9a7Wwc4p8HV8YHzJbcvXDbkTpSxL4Z3o=
Date:   Fri, 6 Jan 2023 14:27:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] media: imx-pxp: disable LUT block
Message-ID: <Y7gTqJ4xjlAGR4Rd@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-6-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-6-m.tretter@pengutronix.de>
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

On Thu, Jan 05, 2023 at 02:47:26PM +0100, Michael Tretter wrote:
> The LUT block is always configured in bypass mode.
> 
> Take it entirely out of the pipeline by disabling it and routing the
> data path around the LUT.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-pxp.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 6ffd07cda965..1d649b9cadad 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -737,11 +737,10 @@ static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3);
>  	/* Select Rotation */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(0);
> -	/* Select LUT */
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(0);
> +	/* Bypass LUT */
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(1);
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3);
> -	/* Select MUX8 for LUT */
> -	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(1);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(3);
>  	/* Select CSC 2 */
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
>  	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3);
> @@ -966,7 +965,7 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  	/* ungate, enable PS/AS/OUT and PXP operation */
>  	writel(BM_PXP_CTRL_IRQ_ENABLE, dev->mmio + HW_PXP_CTRL_SET);
>  	writel(BM_PXP_CTRL_ENABLE | BM_PXP_CTRL_ENABLE_CSC2 |
> -	       BM_PXP_CTRL_ENABLE_LUT | BM_PXP_CTRL_ENABLE_ROTATE0 |
> +	       BM_PXP_CTRL_ENABLE_ROTATE0 |
>  	       BM_PXP_CTRL_ENABLE_PS_AS_OUT, dev->mmio + HW_PXP_CTRL_SET);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
