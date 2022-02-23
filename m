Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C37D4C11FE
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 12:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240214AbiBWL4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 06:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbiBWL4D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 06:56:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CFB985A7
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 03:55:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AB26DD;
        Wed, 23 Feb 2022 12:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645617334;
        bh=P9QPOk6+GyOorRzj5cQRojYaJllOvDTxlfIxFQi8C1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UiGMa4BHS1ppfLQCPQUjlypa5s0u9TLicwH1fPGEWXMC74HLHsEShAVUuGhy/Nwcb
         vW3Ofrn5KurQstQQlTzSNiqultUcSNSIFiGmRYaqYw71d7Q3A1JFvGQ9caabMnfnwr
         /oWdVSY7B7nGfgwpbeiejoTxGysjgKFyykfQsqpA=
Date:   Wed, 23 Feb 2022 13:55:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 22/27] media: ov5640: Add RGB565_1X16 format
Message-ID: <YhYgrGZinCsvid7U@pendragon.ideasonboard.com>
References: <20220223104034.91550-1-jacopo@jmondi.org>
 <20220223104034.91550-23-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223104034.91550-23-jacopo@jmondi.org>
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

On Wed, Feb 23, 2022 at 11:40:29AM +0100, Jacopo Mondi wrote:
> The driver already supports the 2X8_[LE|BE] variants of RGB565
> formats.
> 
> As for CSI-2 the 2X8 variants do not apply, add RGB565_1X16 variant
> with little-endian ordering of components as required by the CSI-2
> specifications.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index c03976b22cbf..b9a488f63687 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -221,6 +221,10 @@ static const struct ov5640_pixfmt {
>  		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
>  		.colorspace = V4L2_COLORSPACE_SRGB,
>  		.bpp = 16,
> +	}, {

Let's add

		/* For CSI-2 only */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		.code = MEDIA_BUS_FMT_RGB565_1X16,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.bpp = 16,
>  	}, {
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.colorspace = V4L2_COLORSPACE_SRGB,
> @@ -2898,6 +2902,7 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
>  		mux = OV5640_FMT_MUX_YUV422;
>  		break;
>  	case MEDIA_BUS_FMT_RGB565_2X8_LE:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
>  		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
>  		fmt = 0x6F;
>  		mux = OV5640_FMT_MUX_RGB;

-- 
Regards,

Laurent Pinchart
