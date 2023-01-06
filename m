Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE6B66004D
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 13:33:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjAFMd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 07:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbjAFMdG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 07:33:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C80A2BCF;
        Fri,  6 Jan 2023 04:33:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83D714AE;
        Fri,  6 Jan 2023 13:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673008384;
        bh=7CrFzLgUwfpJfO3oXkxlIOOxeT9YjWt1gpsJO7MXn4g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hR/QchcvSCOLcxfSa7kwkzkU96NE55yqrG2+3z7MkB7tkOcfUNNQx2LfM/byKGGDN
         Ac/zMxCKJ2ZIWziETvlawbYgjq/X28G3GSmHTQR8tAsxQ8H4zbPkETsmWw6sgWr+/X
         ebGhX0S7+ljj9GOz6KON49pWz7f3SWy5+Vb9bONk=
Date:   Fri, 6 Jan 2023 14:32:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] media: imx-pxp: add support for i.MX7D
Message-ID: <Y7gU+jEGOqHJQpQ5@pendragon.ideasonboard.com>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-8-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105134729.59542-8-m.tretter@pengutronix.de>
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

On Thu, Jan 05, 2023 at 02:47:28PM +0100, Michael Tretter wrote:
> The i.MX7D needs a different data path configuration than the i.MX6ULL.
> Configure the data path as close as possible to the data path on the
> i.MX6ULL.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-pxp.c | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 4e182f80a36b..04cc8df2a498 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -763,6 +763,37 @@ static u32 pxp_imx6ull_data_path_ctrl0(struct pxp_ctx *ctx)
>  	return ctrl0;
>  }
>  
> +static u32 pxp_imx7d_data_path_ctrl0(struct pxp_ctx *ctx)
> +{
> +	u32 ctrl0;
> +
> +	ctrl0 = 0;
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX15_SEL(3);
> +	/* Select Rotation 0 */
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX14_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX13_SEL(3);
> +	/* Select MUX11 for Rotation 0 */
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX12_SEL(1);
> +	/* Bypass LUT */
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX11_SEL(1);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX10_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX9_SEL(3);
> +	/* Select CSC 2 */
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX8_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX7_SEL(3);
> +	/* Select Composite Alpha Blending/Color Key 0 for CSC 2 */
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX6_SEL(1);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX5_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX4_SEL(3);
> +	/* Bypass Rotation 1 */
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX3_SEL(0);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX2_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX1_SEL(3);
> +	ctrl0 |= BF_PXP_DATA_PATH_CTRL0_MUX0_SEL(3);
> +
> +	return ctrl0;
> +}
> +
>  static u32 pxp_data_path_ctrl0(struct pxp_ctx *ctx)
>  {
>  	struct pxp_dev *dev = ctx->dev;
> @@ -1834,8 +1865,13 @@ static const struct pxp_pdata pxp_imx6ull_pdata = {
>  	.data_path_ctrl0 = pxp_imx6ull_data_path_ctrl0,
>  };
>  
> +static const struct pxp_pdata pxp_imx7d_pdata = {
> +	.data_path_ctrl0 = pxp_imx7d_data_path_ctrl0,
> +};
> +
>  static const struct of_device_id pxp_dt_ids[] = {
>  	{ .compatible = "fsl,imx6ull-pxp", .data = &pxp_imx6ull_pdata },
> +	{ .compatible = "fsl,imx7d-pxp", .data = &pxp_imx7d_pdata },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pxp_dt_ids);

-- 
Regards,

Laurent Pinchart
