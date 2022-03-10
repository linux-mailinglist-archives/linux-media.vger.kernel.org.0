Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6264D487A
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242610AbiCJN6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242659AbiCJN6n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:58:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8865812E772
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:57:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3E8F49C;
        Thu, 10 Mar 2022 14:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646920654;
        bh=Np2XDZ7J5HDElmhTM/FZXBC7DGzcCaYelCHCGzUK9Fc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nr4OVXFKsh93AeoU1VEMLItGCYdTaAu/dumZ2V2mkOoMBzPORB90S20smS3Op10c8
         8gk7SIiLRYWMi4ZykjHL7t/c53rda0oLqgEFfS4gcuZe1hUUi0iGfwChT5zr549Uph
         RsEczLI9jZvmxWvLFvctmhn6J12mYNjlnd7yhk5g=
Date:   Thu, 10 Mar 2022 15:57:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Add support for JPEG_1X8
Message-ID: <YioDvlWYgUw79DG7@pendragon.ideasonboard.com>
References: <20220309100448.9749-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220309100448.9749-1-jacopo@jmondi.org>
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

On Wed, Mar 09, 2022 at 11:04:48AM +0100, Jacopo Mondi wrote:
> Add support for MEDIA_BUS_FMT_JPEG_1X8 media bus code to the
> CSIS driver.
> 
> The MEDIA_BUS_FMT_JPEG_1X8 code is mapped tot the RAW8 CSI-2 Data Type,

s/tot/to/

> while the CSI-2 specification suggests to use User Defined Data Type 1.
> 
> As reported in the comment, the CSIS interface captures arbitrary Data
> Types by using a pixel sampling mode not supported by the IP core
> connected to it on i.MX SoCs.
> 
> As some sensors, such as OV5640, support sending JPEG data on the RAW8
> Data Type and capture operations work correcty with such configuration,
> map MEDIA_BUS_FMT_JPEG_1X8 to Data Type 0x2a.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
> 
> Based on Hans' br-v5.18s where the CSIS patches have been collected
> 
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 0a72734db55e..3731748de18b 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -470,6 +470,34 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
>  		.width = 14,
> +	},
> +	/* JPEG */
> +	{
> +		.code = MEDIA_BUS_FMT_JPEG_1X8,
> +		.output = MEDIA_BUS_FMT_JPEG_1X8,
> +		/*
> +		 * Map JPEG_1X8 on the RAW8 datatype.

s/on the/to the/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		 *
> +		 * The CSI-2 specification suggests in Annex A "JPEG8 Data
> +		 * Format (informative)" to transmit JPEG data using one of the
> +		 * Data Types aimed to represent arbitrary data, such as the
> +		 * "User Defined Data Type 1" (0x30).
> +		 *
> +		 * However, when configured with a User Defined Data Type, the
> +		 * CSIS outputs data in quad pixel mode regardless of the mode
> +		 * selected in the MIPI_CSIS_ISP_CONFIG_CH register. Neither of
> +		 * the IP cores connected to the CSIS in i.MX SoCs (CSI bridge
> +		 * or ISI) support quad pixel mode, so this will never work in
> +		 * practice.
> +		 *
> +		 * Some sensors (such as the OV5640) send JPEG data using the
> +		 * RAW8 data type. This is usable and works, so map the JPEG
> +		 * format to RAW8. If the CSIS ends up being integrated in an
> +		 * SoC that can support quad pixel mode, this will have to be
> +		 * revisited.
> +		 */
> +		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
> +		.width = 8,
>  	}
>  };
> 

-- 
Regards,

Laurent Pinchart
