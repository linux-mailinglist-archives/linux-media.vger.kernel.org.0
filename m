Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65E84BCD3C
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 09:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbiBTIa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 03:30:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiBTIaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 03:30:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0226850B17
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 00:30:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF03425B;
        Sun, 20 Feb 2022 09:30:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645345802;
        bh=lZtw0Ai5I9RpBLtQIoRUoY736iPcQhObsm0HWhcuZCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ww9m5Jgxy3ZcSyQmyp5evBuSHXP5JK/a1PTgKz05RKgqJi5/7nbjGMG6IZGAtdhYa
         BQaDtIfu8iOKljFE9WKTzhiYN86aIE+YaDzS+NUkDCRR/DLkBoFrBesRz6KX2BSV/z
         qAHa+A5U8uM/njzrM/dhj15zYteE7aQ+sSiSFh8w=
Date:   Sun, 20 Feb 2022 10:29:52 +0200
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
Subject: Re: [PATCH v2 6/7] media: imx: imx-mipi-csis: Add BGR888
Message-ID: <YhH8ACutjvLW9hZo@pendragon.ideasonboard.com>
References: <20220218183421.583874-1-jacopo@jmondi.org>
 <20220218183421.583874-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220218183421.583874-7-jacopo@jmondi.org>
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

On Fri, Feb 18, 2022 at 07:34:20PM +0100, Jacopo Mondi wrote:
> Add support for the BGR888_1X24 image formats.
> 
> The BGR888 format definition matches how pixel components are sent on
> the wire according to the CSI-2 specification.

A bit more information that you may want to capture, for readers who are
not familiar with this:

No existing media bus codes describe exactly the way data is transferred
on the CSI-2 bus. This is not a new issue, the CSI-2 YUV422 8-bit format
is described by MEDIA_BUS_FMT_UYVY8_1X16 which is an arbitrary
convention and not an exact match. Use the MEDIA_BUS_FMT_BGR888_1X24 to
follow the same convention, based on the order in which bits are
transmitted over the CSI-2 bus.

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index c7a771e3fdf3..fdf133f81c5b 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -366,6 +366,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
>  		.width = 16,
>  	},
> +	{

	}, {

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
> +		.width = 24,
> +	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,

-- 
Regards,

Laurent Pinchart
