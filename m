Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59FA54BCE85
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 13:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238283AbiBTM65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 07:58:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237087AbiBTM65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 07:58:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C854B844
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 04:58:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 790A425B;
        Sun, 20 Feb 2022 13:58:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645361914;
        bh=vZeTdPVuOTpZOYC324md/hHiphyIa84T4BsaVQCx8Xo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kYjRkUuS/LVKlwvwp4m5SDAco9hMWHAMjEGYGyqxX16P6GVTUVlpWCDhW2Gn/JxSa
         X60EGP31TeiPcFnvh3tp5BRbN253nKNg1dZlfV7xeQOC9frJnDLAPS0x0PcUxkdUYM
         nIvfoDYLegn/qR8qeE1U/YD7hAZCNAoJevoA4YWI=
Date:   Sun, 20 Feb 2022 14:58:22 +0200
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
Subject: Re: [PATCH v2 12/23] media: ov5640: Remove ov5640_mode_init_data
Message-ID: <YhI67uOANDb/gYY6@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210110458.152494-13-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210110458.152494-13-jacopo@jmondi.org>
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

On Thu, Feb 10, 2022 at 12:04:47PM +0100, Jacopo Mondi wrote:
> The ov5640_mode_init_data is a fictional sensor more which is used to
> program the initial sensor settings.
> 
> It is only used to initialize the sensor and can be replaced
> it with a throw-away mode which just wraps the register table.
> 
> Also rename the register table to drop the format from the name to make
> it clear an actual sensor mode has to be applied after the initial
> programming.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5640.c | 47 ++++++++------------------------------
>  1 file changed, 10 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 17835e71665a..2a922224ca9d 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -382,7 +382,7 @@ static inline bool ov5640_is_csi2(struct ov5640_dev *sensor)
>   * over i2c.
>   */
>  /* YUV422 UYVY VGA@30fps */
> -static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
> +static const struct reg_value ov5640_init_setting[] = {
>  	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>  	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
> @@ -620,30 +620,6 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0x83, 0, 70},
>  };
>  
> -/* power-on sensor init reg table */
> -static const struct ov5640_mode_info ov5640_mode_init_data = {
> -		.id		= 0,
> -		.dn_mode	= SUBSAMPLING,
> -		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> -		.analog_crop = {
> -			.left	= OV5640_PIXEL_ARRAY_LEFT,
> -			.top	= OV5640_PIXEL_ARRAY_TOP,
> -			.width	= OV5640_PIXEL_ARRAY_WIDTH,
> -			.height	= OV5640_PIXEL_ARRAY_HEIGHT,
> -		},
> -		.crop = {
> -			.left	= 2,
> -			.top	= 4,
> -			.width	= 640,
> -			.height	= 480,
> -		},
> -		.htot		= 1896,
> -		.vblank_def	= 504,
> -		.reg_data	= ov5640_init_setting_30fps_VGA,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
> -		.max_fps	= OV5640_30_FPS
> -};
> -
>  static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
>  	{
>  		/* 160x120 */
> @@ -1440,17 +1416,16 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
>  	return 0;
>  }
>  
> -static int ov5640_load_regs(struct ov5640_dev *sensor,
> -			    const struct ov5640_mode_info *mode)
> +static void ov5640_load_regs(struct ov5640_dev *sensor,
> +			     const struct reg_value *regs, unsigned int regnum)
>  {
> -	const struct reg_value *regs = mode->reg_data;
>  	unsigned int i;
>  	u32 delay_ms;
>  	u16 reg_addr;
>  	u8 mask, val;
>  	int ret = 0;
>  
> -	for (i = 0; i < mode->reg_data_size; ++i, ++regs) {
> +	for (i = 0; i < regnum; ++i, ++regs) {
>  		delay_ms = regs->delay_ms;
>  		reg_addr = regs->reg_addr;
>  		val = regs->val;
> @@ -1472,8 +1447,6 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
>  		if (delay_ms)
>  			usleep_range(1000 * delay_ms, 1000 * delay_ms + 100);
>  	}
> -
> -	return ov5640_set_timings(sensor, mode);
>  }
>  
>  static int ov5640_set_autoexposure(struct ov5640_dev *sensor, bool on)
> @@ -1926,7 +1899,8 @@ static int ov5640_set_mode_exposure_calc(struct ov5640_dev *sensor,
>  		return ret;
>  
>  	/* Write capture setting */
> -	ret = ov5640_load_regs(sensor, mode);
> +	ov5640_load_regs(sensor, mode->reg_data, mode->reg_data_size);
> +	ret = ov5640_set_timings(sensor, mode);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -2050,7 +2024,8 @@ static int ov5640_set_mode_direct(struct ov5640_dev *sensor,
>  		return -EINVAL;
>  
>  	/* Write capture setting */
> -	return ov5640_load_regs(sensor, mode);
> +	ov5640_load_regs(sensor, mode->reg_data, mode->reg_data_size);
> +	return ov5640_set_timings(sensor, mode);
>  }
>  
>  static int ov5640_set_mode(struct ov5640_dev *sensor)
> @@ -2148,10 +2123,8 @@ static int ov5640_restore_mode(struct ov5640_dev *sensor)
>  	int ret;
>  
>  	/* first load the initial register values */
> -	ret = ov5640_load_regs(sensor, &ov5640_mode_init_data);
> -	if (ret < 0)
> -		return ret;
> -	sensor->last_mode = &ov5640_mode_init_data;
> +	ov5640_load_regs(sensor, ov5640_init_setting,
> +			 ARRAY_SIZE(ov5640_init_setting));
>  
>  	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
>  			     (ilog2(OV5640_SCLK2X_ROOT_DIV) << 2) |

-- 
Regards,

Laurent Pinchart
