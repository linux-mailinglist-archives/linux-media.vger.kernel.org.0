Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328104B6446
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 08:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbiBOHZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 02:25:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiBOHZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 02:25:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5696F1EBD
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 23:25:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F109315;
        Tue, 15 Feb 2022 08:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644909925;
        bh=rX+ey5WeSDvMjiqbc0P60X6rJc5QWO0fTH8724NAYBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cqEwBOeG0HKqloF68eUqggVi92BEwhbjayMLUrxNKM/VSuGIA8OS9FRTHrYnL4/pm
         /0OclVlcLfGYcCBC+qe2AlIR7u8eOtdjexJoTaGgH6p/EHJa3/2JQbZzgVjTT2J4TW
         7svnwypIo8JLGU/tJDXjUXzpaBeepkjHiw1HBPEA=
Date:   Tue, 15 Feb 2022 09:25:18 +0200
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
Subject: Re: [PATCH 6/8] media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
Message-ID: <YgtVXkc8lcBSTLHy@pendragon.ideasonboard.com>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214184318.409208-7-jacopo@jmondi.org>
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

On Mon, Feb 14, 2022 at 07:43:16PM +0100, Jacopo Mondi wrote:
> Bits 13 and 12 of the ISP_CONFIGn register configure the PIXEL_MODE
> which specifies the sampling size, in pixel component units, on the
> CSI-2 output data interface when data are transferred to memory.
> 
> The register description in the chip manual specifies that DUAL mode
> should be used for YUV422 data but does not clarify the reason.
> 
> Verify if other YUV formats require the same setting and what is the
> appropriate setting for RAW and sRGB formats.

If it's an action item, shouldn't it be in a TODO comment in the code
instead ?

While it shouldn't be difficult to test this in RAW8 mode, I'd leave it
for later, as I don't want to get into the rabbit hole of adding
S[RGB]{4}8_0_5X16 or S[RGB]{4}10_0_5X20 formats now :-)

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index f433758c8935..98a7538a6ce3 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -173,6 +173,7 @@
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
>  #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
> +#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
>  #define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
>  #define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
>  #define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
> @@ -506,7 +507,12 @@ static void __mipi_csis_set_format(struct csi_state *state)
> 
>  	/* Color format */
>  	val = mipi_csis_read(state, MIPI_CSIS_ISP_CONFIG_CH(0));
> -	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK);
> +	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
> +		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
> +
> +	if (state->csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
> +		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> +
>  	val |= MIPI_CSIS_ISPCFG_FMT(state->csis_fmt->data_type);
>  	mipi_csis_write(state, MIPI_CSIS_ISP_CONFIG_CH(0), val);
> 

-- 
Regards,

Laurent Pinchart
