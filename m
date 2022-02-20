Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E53CE4BCD33
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 09:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbiBTIQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 03:16:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiBTIQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 03:16:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B82F38189
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 00:16:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEDFC25B;
        Sun, 20 Feb 2022 09:16:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645344985;
        bh=+sYNh6IEuCR6IDXl8cBYmJumDM60Ar+bUZjTr2mZeEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d2OlxxFtK4j4o9hO6G3OgwCjWFB/VKAC2o2LmlsohXJS6LR5ktgRVDUL5Tb0wTd9S
         1RVIgO8nKERtZQF/vksJXX539MxH8H11l+Q51HI7QcxYdjhXuV5bgQitWsRIe76TqG
         jkGe/h/l4YdN6HEOlGy1XC+GVGrYWUhhXbhURGvE=
Date:   Sun, 20 Feb 2022 10:16:15 +0200
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
Subject: Re: [PATCH v2 3/7] media: imx: imx7-media-csi: Use dual sampling for
 YUV 1X16
Message-ID: <YhH4z/CAltKGt6HF@pendragon.ideasonboard.com>
References: <20220218183421.583874-1-jacopo@jmondi.org>
 <20220218183421.583874-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220218183421.583874-4-jacopo@jmondi.org>
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

On Fri, Feb 18, 2022 at 07:34:17PM +0100, Jacopo Mondi wrote:
> The CSI bridge should operate in dual pixel sampling mode when it is

s/dual pixel sampling mode/dual component mode/

> connected to a pixel transmitter that transfers two pixel samples (16
> bits) at the time in YUYV formats.

It's actually one pixel per clock. Without BIT_TWO_8BIT_SENSOR and
BIT_MIPI_DOUBLE_CMPNT, the CSI bridge expects 8-bit data, which requires
two clock cycles to transfer one pixel. When setting those bits, it
expects 16-bit data, with one clock cycle per pixel. The
MIPI_DOUBLE_CMPNT documentation states this clearly:

20 MIPI_DOUBLE_CMPNT
Double component per clock cycle in YUV422 formats.
0 Single component per clock cycle
(half pixel per clock cycle)
1 Double component per clock cycle
(a pixel per clock cycle)

> Use the image format variants to determine if single or dual pixel mode

"dual pixel" is a concept of the CSIS, not the CSI bridge. This should
mention single or double component mode.

> should be used.
> 
> Add a note to the TODO file to record that the list of supported formats
> should be restricted to the SoC model the CSI bridge is integrated on
> to avoid potential pipeline mis-configurations.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/staging/media/imx/TODO             | 26 ++++++++++++++++++++++
>  drivers/staging/media/imx/imx7-media-csi.c |  8 +++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
> index 06c94f20ecf8..e15eba32cc94 100644
> --- a/drivers/staging/media/imx/TODO
> +++ b/drivers/staging/media/imx/TODO
> @@ -27,3 +27,29 @@
>  - i.MX7: all of the above, since it uses the imx media core
> 
>  - i.MX7: use Frame Interval Monitor
> +
> +- imx7-media-csi: Restrict the supported formats list to the SoC version.
> +
> +  The imx7 CSI bridge can be configured to sample pixel components from the Rx
> +  queue in single  (8bpp) or double (16bpp) modes. Image format variations with
> +  different sample sizes (ie YUYV_2X8 vs YUYV_1X16) determine the sampling size
> +  (see imx7_csi_configure()).
> +
> +  As the imx7 CSI bridge can be interfaced with different IP blocks depending on
> +  the SoC model it is integrated on, the Rx queue sampling size should match
> +  the size of samples transferred by the transmitting IP block.
> +
> +  To avoid mis-configurations of the capture pipeline, the enumeration of the
> +  supported formats should be restricted to match the pixel source
> +  transmitting mode.
> +
> +  Examples: i.MX8MM SoC integrates the CSI bridge with the Samsung CSIS CSI-2
> +  receiver which operates in dual pixel sampling mode. The CSI bridge should
> +  only expose the 1X16 formats variant which instructs it to operate in dual
> +  pixel sampling mode. When the CSI bridge is instead integrated on an i.MX8MQ
> +  SoC, which features a CSI-2 receiver that operates in single sampling mode, it
> +  should only expose the 2X8 formats variant which instruct it to operate in
> +  single sampling mode.
> +
> +  This currently only applies to YUYV formats, but other formats might need
> +  to be treated in the same way.
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 32311fc0e2a4..108360ae3710 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -503,11 +503,15 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		 * all of them comply. Support both variants.
>  		 */

You can drop this comment, as the two variants are not related to the
CSI-2 bus format (which should always be UYVY8_1X16) but to the format
output by the CSI-2 RX.

I would add another comment to explain this clearly:

		/*
		 * The CSI bridge has a 16-bit input bus. Depending on
		 * the connected source, data may be transmitted with 8
		 * or 10 bits per clock sample (in bits [9:2] or [9:0]
		 * respectively) or with 16 bits per clock sample (in
		 * bits [15:0]). The data is then packed into a 32-bit
		 * FIFO (as shown in figure 13-11 of the i.MX8MM
		 * reference manual rev. 3).
		 *
		 * The data packing in a 32-bit FIFO input workd is
		 * controlled by the CR3 TWO_8BIT_SENSOR field (also
		 * known as SENSOR_16BITS in the i.MX8MM reference
		 * manual). When set to 0, data packing groups four
		 * 8-bit input samples (bits [9:2]). When set to 1, data
		 * packing groups two 16-bit input samples (bits
		 * [15:0]).
		 *
		 * The register field CR18 MIPI_DOUBLE_CMPNT also needs
		 * to be configured according to the input format for
		 * YUV 4:2:2 data. The field controls the gasket between
		 * the CSI-2 receiver and the CSI bridge. On i.MX7 and
		 * i.MX8MM, the field must be set to 1 when the CSIS
		 * outputs 16-bit samples. On i.MX8MQ, the gasket
		 * ignores the MIPI_DOUBLE_CMPNT bit and YUV 4:2:2
		 * always uses 16-bit samples. Setting MIPI_DOUBLE_CMPNT
		 * in that case has no effect, but doesn't cause any
		 * issue.
		 */

With this, someone trying to figure out what those bits do will
hopefully be able to get it right :-)

With these changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		case MEDIA_BUS_FMT_UYVY8_2X8:
> -		case MEDIA_BUS_FMT_UYVY8_1X16:
>  		case MEDIA_BUS_FMT_YUYV8_2X8:
> -		case MEDIA_BUS_FMT_YUYV8_1X16:
>  			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
>  			break;
> +		case MEDIA_BUS_FMT_UYVY8_1X16:
> +		case MEDIA_BUS_FMT_YUYV8_1X16:
> +			cr3 |= BIT_TWO_8BIT_SENSOR;
> +			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B |
> +				BIT_MIPI_DOUBLE_CMPNT;
> +			break;
>  		}
>  	}
> 

-- 
Regards,

Laurent Pinchart
