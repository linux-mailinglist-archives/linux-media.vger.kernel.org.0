Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0C04BCE6B
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 13:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243707AbiBTMRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 07:17:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243691AbiBTMRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 07:17:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAC14D608
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 04:17:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D7BF25B;
        Sun, 20 Feb 2022 13:17:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645359442;
        bh=dZZUndK8wpQY2PnynRgyDsTRMI1YwmXBpx65hmYGgk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vJdL+u6NTdURc6EDUaoH0l7Vvw5pvYjFq0MmmwMp7M8q/4pFZlZoq4gi2MRI6eAB6
         ciC/TNxmCZix8RAfV38B5xcvuvOSLi62t540OXohliVvdJMJ/MEquKcRpwcdIvjADU
         BZt20hcmG+V0A8LUjvW1G0N0nqEvcdEH4POG8D5E=
Date:   Sun, 20 Feb 2022 14:17:12 +0200
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
Subject: Re: [PATCH v2 07/23] media: ov5640: Rework CSI-2 clock tree
Message-ID: <YhIxSHyMWYL7qHsc@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210110458.152494-8-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210110458.152494-8-jacopo@jmondi.org>
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

On Thu, Feb 10, 2022 at 12:04:42PM +0100, Jacopo Mondi wrote:
> Re-work the ov5640_set_mipi_pclk() function to calculate the
> PLL configuration using the pixel_rate and link_freq values set at
> s_fmt time.
> 
> Rework the DVP clock mode settings to calculate the pixel clock
> internally and remove the assumption on the 16bpp format.
> 
> Tested in MIPI CSI-2 mode with 1 and 2 data lanes with:
> - all the sensor supported resolutions in UYVY and RGB565 formats.
> - resolutions >= 1280x720 in RAW Bayer format.
> - resolutions < 1280x720 in RGB888 format.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 189 ++++++++++++++++++-------------------
>  1 file changed, 90 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 50b611697470..eb4789ae6abf 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -90,6 +90,7 @@
>  #define OV5640_REG_POLARITY_CTRL00	0x4740
>  #define OV5640_REG_MIPI_CTRL00		0x4800
>  #define OV5640_REG_DEBUG_MODE		0x4814
> +#define OV5640_REG_PCLK_PERIOD		0x4837
>  #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
>  #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
>  #define OV5640_REG_SDE_CTRL0		0x5580
> @@ -922,20 +923,10 @@ static int ov5640_mod_reg(struct ov5640_dev *sensor, u16 reg,
>   *                                +-----+-----+
>   *                                       +------------> PCLK
>   *
> - * This is deviating from the datasheet at least for the register
> - * 0x3108, since it's said here that the PCLK would be clocked from
> - * the PLL.
> - *
> - * There seems to be also (unverified) constraints:
> + * There seems to be also constraints:
>   *  - the PLL pre-divider output rate should be in the 4-27MHz range
>   *  - the PLL multiplier output rate should be in the 500-1000MHz range
>   *  - PCLK >= SCLK * 2 in YUV, >= SCLK in Raw or JPEG
> - *
> - * In the two latter cases, these constraints are met since our
> - * factors are hardcoded. If we were to change that, we would need to
> - * take this into account. The only varying parts are the PLL
> - * multiplier and the system clock divider, which are shared between
> - * all these clocks so won't cause any issue.
>   */
>  
>  /*
> @@ -954,13 +945,6 @@ static int ov5640_mod_reg(struct ov5640_dev *sensor, u16 reg,
>  #define OV5640_SYSDIV_MIN	1
>  #define OV5640_SYSDIV_MAX	16
>  
> -/*
> - * Hardcode these values for scaler and non-scaler modes.
> - * FIXME: to be re-calcualted for 1 data lanes setups
> - */
> -#define OV5640_MIPI_DIV_PCLK	2
> -#define OV5640_MIPI_DIV_SCLK	1
> -
>  /*
>   * This is supposed to be ranging from 1 to 2, but the value is always
>   * set to 2 in the vendor kernels.
> @@ -1071,69 +1055,77 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
>   * ov5640_set_mipi_pclk() - Calculate the clock tree configuration values
>   *			    for the MIPI CSI-2 output.
>   *
> - * @rate: The requested bandwidth per lane in bytes per second.
> - *	  'Bandwidth Per Lane' is calculated as:
> - *	  bpl = HTOT * VTOT * FPS * bpp / num_lanes;
> - *
> - * This function use the requested bandwidth to calculate:
> - * - sample_rate = bpl / (bpp / num_lanes);
> - *	         = bpl / (PLL_RDIV * BIT_DIV * PCLK_DIV * MIPI_DIV / num_lanes);
> - *
> - * - mipi_sclk   = bpl / MIPI_DIV / 2; ( / 2 is for CSI-2 DDR)
> - *
> - * with these fixed parameters:
> - *	PLL_RDIV	= 2;
> - *	BIT_DIVIDER	= 2; (MIPI_BIT_MODE == 8 ? 2 : 2,5);
> - *	PCLK_DIV	= 1;
> - *
> - * The MIPI clock generation differs for modes that use the scaler and modes
> - * that do not. In case the scaler is in use, the MIPI_SCLK generates the MIPI
> - * BIT CLk, and thus:
> - *
> - * - mipi_sclk = bpl / MIPI_DIV / 2;
> - *   MIPI_DIV = 1;
> - *
> - * For modes that do not go through the scaler, the MIPI BIT CLOCK is generated
> - * from the pixel clock, and thus:
> - *
> - * - sample_rate = bpl / (bpp / num_lanes);
> - *	         = bpl / (2 * 2 * 1 * MIPI_DIV / num_lanes);
> - *		 = bpl / (4 * MIPI_DIV / num_lanes);
> - * - MIPI_DIV	 = bpp / (4 * num_lanes);
> - *
> - * FIXME: this have been tested with 16bpp and 2 lanes setup only.
> - * MIPI_DIV is fixed to value 2, but it -might- be changed according to the
> - * above formula for setups with 1 lane or image formats with different bpp.
> - *
> - * FIXME: this deviates from the sensor manual documentation which is quite
> - * thin on the MIPI clock tree generation part.
> + * FIXME: tested with 2 lanes only.

Not true anymore, is it ?

>   */
> -static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
> -				unsigned long rate)
> +static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
>  {
> -	const struct ov5640_mode_info *mode = sensor->current_mode;
> +	u8 bit_div, mipi_div, p_div, sclk_div, sclk2x_div, root_div;
> +	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>  	u8 prediv, mult, sysdiv;
> -	u8 mipi_div;
> +	unsigned long sysclk;
> +	unsigned long sample_rate;
> +	u8 pclk_period;
> +	s64 link_freq;
>  	int ret;
>  
> +	/* Use the link frequency computed at ov5640_update_pixel_rate() time. */
> +	link_freq = ov5640_csi2_link_freqs[sensor->ctrls.link_freq->cur.val];
> +
>  	/*
> -	 * 1280x720 is reported to use 'SUBSAMPLING' only,
> -	 * but according to the sensor manual it goes through the
> -	 * scaler before subsampling.
> +	 * - mipi_div - Additional divider for the MIPI lane clock.
> +	 *
> +	 * Higher link frequencies would make sysclk > 1GHz.
> +	 * Keep the sysclk low and do not divide in the MIPI domain.
>  	 */
> -	if (mode->dn_mode == SCALING ||
> -	   (mode->id == OV5640_MODE_720P_1280_720))
> -		mipi_div = OV5640_MIPI_DIV_SCLK;
> +	if (link_freq > OV5640_LINK_RATE_MAX)
> +		mipi_div = 1;
>  	else
> -		mipi_div = OV5640_MIPI_DIV_PCLK;
> +		mipi_div = 2;
>  
> -	ov5640_calc_sys_clk(sensor, rate, &prediv, &mult, &sysdiv);
> +	sysclk = link_freq * mipi_div;
> +	ov5640_calc_sys_clk(sensor, sysclk, &prediv, &mult, &sysdiv);
>  
> -	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0,
> -			     0x0f, OV5640_PLL_CTRL0_MIPI_MODE_8BIT);
> +	/*
> +	 * Adjust PLL parameters to maintain the MIPI_SCLK-to-PCLK ratio;

s/;/:/ ?

> +	 *
> +	 * - root_div = 2 (fixed)
> +	 * - bit_div : MIPI 8-bit = 2
> +	 *	       MIPI 10-bit = 2.5
> +	 * - p_div = 1 (fixed)
> +	 * - pll_div  = (2 lanes ? mipi_div : 2 * mipi_div)

There's no pll_div variable in the code, nothing called "PLL div" in
comments, and nothing in the datasheet either as far as I can tell.
Based on your reply to the v1 review, I think you mean "p_div" instead
of "pll_div". Also, you mentioned there that P_DIV is equal to

- 1 data lane = MIPI_DIV (0x3035[3:0])
- 2 data lane = 2 * MIPI_DIV

while here you write the opposite. MIPI_DIV * number data lanes seems
more logical to me, as the CSI-2 clock frequency should be lower with
more data lanes. You could thus write

	 * - p_div is set by the sensor to mipi_div * number of data lanes

Let's add a blank line here, and

	 *
	 * This results in the following MIPI_SCLK depending on the number
	 * of lanes:
	 *

> +	 *   2 lanes: MIPI_SCLK = (4 or 5) * PCLK
> +	 *   1 lanes: MIPI_SCLK = (8 or 10) * PCLK
> +	 */
> +	root_div = OV5640_PLL_CTRL3_PLL_ROOT_DIV_2;
> +	bit_div =  OV5640_PLL_CTRL0_MIPI_MODE_8BIT;
> +	p_div = OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS;
>  
> -	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1,
> -			     0xff, sysdiv << 4 | mipi_div);
> +	/*
> +	 * Scaler clock:
> +	 * - YUV: PCLK >= 2 * SCLK
> +	 * - RAW or JPEG: PCLK >= SCLK
> +	 * - sclk2x_div = sclk_div / 2
> +	 *
> +	 * TODO: test with JPEG.
> +	 */
> +	sclk_div = ilog2(OV5640_SCLK_ROOT_DIV);
> +	sclk2x_div = ilog2(OV5640_SCLK2X_ROOT_DIV);
> +
> +	/*
> +	 * Set the sample period expressed in ns with 1-bit decimal
> +	 * (0x01=0.5ns).
> +	 */
> +	sample_rate = ov5640_pixel_rates[sensor->current_mode->pixel_rate]
> +		    * (ov5640_code_to_bpp(fmt->code) / 8);
> +	pclk_period = 2000000000U / sample_rate;
> +
> +	/* Program the clock tree registers. */
> +	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL0, 0x0f, bit_div);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL1, 0xff,
> +			     (sysdiv << 4) | mipi_div);
>  	if (ret)
>  		return ret;
>  
> @@ -1141,13 +1133,27 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor,
>  	if (ret)
>  		return ret;
>  
> -	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL3,
> -			     0x1f, OV5640_PLL_CTRL3_PLL_ROOT_DIV_2 | prediv);
> +	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL3, 0x1f,
> +			     root_div | prediv);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
> +			     (p_div << 4) | (sclk2x_div << 2) | sclk_div);

Bits 5:4 of this register are named "PCLK root divider" in the
datasheet. Can you rename the variable to pclk_div to match the clock
tree diagram in the driver that names it "PCLK Div" ? Another option
would be to name ie pclk_root_div and update the clock tree diagram
accordingly. The p_div mention in the comment above should be renamed
too.

>  	if (ret)
>  		return ret;
>  
> -	return ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER,
> -			      0x30, OV5640_PLL_SYS_ROOT_DIVIDER_BYPASS);
> +	return ov5640_write_reg(sensor, OV5640_REG_PCLK_PERIOD, pclk_period);
> +}
> +
> +static u32 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
> +{
> +	u32 rate;
> +
> +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> +	rate *= ov5640_framerates[sensor->current_fr];
> +
> +	return rate;
>  }
>  
>  static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
> @@ -1167,11 +1173,16 @@ static unsigned long ov5640_calc_pclk(struct ov5640_dev *sensor,
>  	return _rate / *pll_rdiv / *bit_div / *pclk_div;
>  }
>  
> -static int ov5640_set_dvp_pclk(struct ov5640_dev *sensor, unsigned long rate)
> +static int ov5640_set_dvp_pclk(struct ov5640_dev *sensor)
>  {
>  	u8 prediv, mult, sysdiv, pll_rdiv, bit_div, pclk_div;
> +	u32 rate;
>  	int ret;
>  
> +	rate = ov5640_calc_pixel_rate(sensor);
> +	rate *= ov5640_code_to_bpp(sensor->fmt.code);
> +	rate /= sensor->ep.bus.parallel.bus_width;
> +
>  	ov5640_calc_pclk(sensor, rate, &prediv, &mult, &sysdiv, &pll_rdiv,
>  			 &bit_div, &pclk_div);
>  
> @@ -1696,16 +1707,6 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
>  	return mode;
>  }
>  
> -static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
> -{
> -	u64 rate;
> -
> -	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> -	rate *= ov5640_framerates[sensor->current_fr];
> -
> -	return rate;
> -}
> -
>  /*
>   * sensor changes between scaling and subsampling, go through
>   * exposure calculation
> @@ -1887,7 +1888,6 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>  	enum ov5640_downsize_mode dn_mode, orig_dn_mode;
>  	bool auto_gain = sensor->ctrls.auto_gain->val == 1;
>  	bool auto_exp =  sensor->ctrls.auto_exp->val == V4L2_EXPOSURE_AUTO;
> -	unsigned long rate;
>  	int ret;
>  
>  	dn_mode = mode->dn_mode;
> @@ -1906,19 +1906,10 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>  			goto restore_auto_gain;
>  	}
>  
> -	/*
> -	 * All the formats we support have 16 bits per pixel, seems to require
> -	 * the same rate than YUV, so we can just use 16 bpp all the time.
> -	 */
> -	rate = ov5640_calc_pixel_rate(sensor) * 16;
> -	if (ov5640_is_csi2(sensor)) {
> -		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
> -		ret = ov5640_set_mipi_pclk(sensor, rate);
> -	} else {
> -		rate = rate / sensor->ep.bus.parallel.bus_width;
> -		ret = ov5640_set_dvp_pclk(sensor, rate);
> -	}
> -
> +	if (ov5640_is_csi2(sensor))
> +		ret = ov5640_set_mipi_pclk(sensor);
> +	else
> +		ret = ov5640_set_dvp_pclk(sensor);
>  	if (ret < 0)
>  		return 0;
>  

-- 
Regards,

Laurent Pinchart
