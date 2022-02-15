Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08FC54B644E
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 08:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbiBOH0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 02:26:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbiBOH0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 02:26:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860E575C13
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 23:26:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A843A315;
        Tue, 15 Feb 2022 08:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644909999;
        bh=cBS8RI6jXf5eaML8rA4dLzBTVtvRK+h5yCOf2W4SUws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QFzd6W6E0b5zWMj3xP2Q4Ef76F73eUYIcNNtXudlkbOOAGbU9W1eqap0ynglQ84Yc
         kTtBbkuoyVMq3EoTIGojd94ekTm7XpxHLjbriAvxXfUUoFHCeBBC/d1LLAPytUlNjW
         cxy1hIgG+V7FkutY3TYKfECEwIl7RMPckpRSKiM8=
Date:   Tue, 15 Feb 2022 09:26:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] media: imx: imx-mipi-csis: Add RGB565_1X16
Message-ID: <YgtVqdaQigGdAHXh@pendragon.ideasonboard.com>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-8-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214184318.409208-8-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 14, 2022 at 07:43:17PM +0100, Jacopo Mondi wrote:
> Add RGB565_1X16 to the enumeration of supported image formats.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 98a7538a6ce3..9e0a478dba75 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -360,6 +360,12 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
>  		.width = 16,
>  	},
> +	/* RGB formats. */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB565_1X16,
> +		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
> +		.width = 16,
> +	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,

-- 
Regards,

Laurent Pinchart
