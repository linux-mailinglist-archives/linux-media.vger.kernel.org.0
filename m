Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2DF4BDEC2
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 18:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357033AbiBULy7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 06:54:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357025AbiBULyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 06:54:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AAE61EEE8
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 03:53:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA0EE482;
        Mon, 21 Feb 2022 12:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645444414;
        bh=3/2A6H7u7GO/zns6i4sXYD3bUek2QyozPzakSZA5SNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R1syUvwrsTXE8h/2UDSm5J6cCEj/Ku38NEIPhghtp5hbS6vnOmPvjwmm2rUOVw7/n
         Brlb00uO/HRBmAAnuo3klwgdZgQw997WMDo1jLgh+BA1BuJ4cVxa+eUONrbmu7mrUM
         Dedi2Y1VH/YwLn7KQK9254YR6VcTAX3ara0cBwLM=
Date:   Mon, 21 Feb 2022 13:53:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com, alexander.stein@ew.tq-group.com,
        dorota.czaplejewicz@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/7] media: imx: imx-mipi-csis: Add BGR888
Message-ID: <YhN9NVoXxUc9uzMJ@pendragon.ideasonboard.com>
References: <20220221110436.45419-1-jacopo@jmondi.org>
 <20220221110436.45419-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220221110436.45419-7-jacopo@jmondi.org>
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

On Mon, Feb 21, 2022 at 12:04:35PM +0100, Jacopo Mondi wrote:
> Add support for the BGR888_1X24 image formats.

s/formats/format/

> No existing media bus codes describe exactly the way data is transferred
> on the CSI-2 bus. This is not a new issue, the CSI-2 YUV422 8-bit format
> is described by MEDIA_BUS_FMT_UYVY8_1X16 which is an arbitrary
> convention and not an exact match. Use the MEDIA_BUS_FMT_BGR888_1X24 to
> follow the same convention, based on the order in which bits are
> transmitted over the CSI-2 bus.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 46055b5f8412..a05ab151bebc 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -365,6 +365,10 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.code = MEDIA_BUS_FMT_RGB565_1X16,
>  		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
>  		.width = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
> +		.width = 24,
>  	},
>  	/* RAW (Bayer and greyscale) formats. */
>  	{

-- 
Regards,

Laurent Pinchart
