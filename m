Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240394BCE50
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 12:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235820AbiBTLz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 06:55:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242031AbiBTLz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 06:55:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB364EA26
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 03:55:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D990425B;
        Sun, 20 Feb 2022 12:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645358136;
        bh=q7iQ/HF+N5+F/4LhjYi5OotlNGWgkmWfcXfHltQlCco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I4HN0gxiNTk25YMUPowQF5JFaXH2XdLEC1jbpwsLW63fkKtACiqZtkNjUld0pg02i
         Nu1VsaXp+7s+oxuzx1MlOJTobgBqqV/94Dr9wCQ19X8ufcD0eeFv468QYLgdFTrAvN
         qRHUyJAcDoQxlMIT2aDbyYrDEfS8CBckP9HcgaC0=
Date:   Sun, 20 Feb 2022 13:55:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 05/23] media: ov5640: Add LINK_FREQ control
Message-ID: <YhIsLn1SEguJc+Uj@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210110458.152494-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210110458.152494-6-jacopo@jmondi.org>
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

On Thu, Feb 10, 2022 at 12:04:40PM +0100, Jacopo Mondi wrote:
> Add the V4L2_CID_LINK_FREQ control to the ov5640 driver.
> Make the control read-only for the moment.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 71404d064045..4c3a1fd41095 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -141,6 +141,21 @@ static const u32 ov5640_pixel_rates[] = {
>  	[OV5640_PIXEL_RATE_48M] = 48000000,
>  };
>  
> +/*
> + * MIPI CSI-2 link frequencies.
> + *
> + * Derived from the above defined pixel rate for bpp = (8, 16, 24) and
> + * data_lanes = (1, 2)
> + *
> + * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
> + */
> +static const s64 ov5640_csi2_link_freqs[] = {
> +	992000000, 888000000, 768000000, 744000000, 672000000, 672000000,
> +	592000000, 592000000, 576000000, 576000000, 496000000, 496000000,
> +	384000000, 384000000, 384000000, 336000000, 296000000, 288000000,
> +	248000000, 192000000, 192000000, 192000000, 96000000,
> +};
> +
>  enum ov5640_format_mux {
>  	OV5640_FMT_MUX_YUV422 = 0,
>  	OV5640_FMT_MUX_RGB,
> @@ -270,6 +285,7 @@ struct ov5640_mode_info {
>  struct ov5640_ctrls {
>  	struct v4l2_ctrl_handler handler;
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *link_freq;
>  	struct {
>  		struct v4l2_ctrl *auto_exp;
>  		struct v4l2_ctrl *exposure;
> @@ -2867,6 +2883,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  				      ov5640_pixel_rates[0], 1,
>  				      ov5640_pixel_rates[mode->pixel_rate]);
>  
> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
> +					V4L2_CID_LINK_FREQ,
> +					ARRAY_SIZE(ov5640_csi2_link_freqs) - 1,
> +					4, ov5640_csi2_link_freqs);

You may want to explain somewhere why you've picked 4 as the default.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	/* Auto/manual white balance */
>  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>  					   V4L2_CID_AUTO_WHITE_BALANCE,
> @@ -2915,6 +2936,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	}
>  
>  	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  

-- 
Regards,

Laurent Pinchart
