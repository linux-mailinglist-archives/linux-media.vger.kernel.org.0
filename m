Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BAD5F794C
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 15:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiJGN4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 09:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJGN4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 09:56:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644D7C90D0
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 06:56:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30B34BBE;
        Fri,  7 Oct 2022 15:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665150966;
        bh=pHPYnr3kXsULHAuLtAFxSBZC4l9FHqn3Vchi/UJoj1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L+8k9Ui80G9GUa2OrArw3FAQ4v7VmuRe6Ns4nTIlp9ftZSQDsnBrRbyAeiJynWUie
         ZmOr2hLUMoaS9FdihvF3YJ6dF06bDegvh9DKmpLzpm2nSr+e2fR6Rly4rcLWOTYTsF
         OnzHO4DlyjbyrVT6AvVCwQwk7V5rCMfJKgSj9PFE=
Date:   Fri, 7 Oct 2022 16:56:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 04/10] media: ar0521: Rework PLL computation
Message-ID: <Y0Av8cjapldZhA96@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005190613.394277-5-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Oct 05, 2022 at 09:06:07PM +0200, Jacopo Mondi wrote:
> Rework the PLL computation procedure to take into account the currently
> configured format bpp and the number of data lanes.
> 
> Comment the PLL configuration procedure with information provided by the
> sensor chip manual and remove the hardcoded divider from the pixel clock
> calculation.
> 
> The PLL configuration procedure has been verified by forcing a pixel
> rate of 414 MHz and verify that the effective output pixel rate matches
> the expected 60 frames per second.

This is the kind of code that would benefit from testing with kunit.

> Do not modify the default pixel rate for the moment as it will be made
> configurable through V4L2_CID_LINK_FREQ in subsequent patches.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

I think we should extract the PLL calculation code from the CCS driver
into a library. Sakari ? :-)

Regarding the code below, given that the documentation of the sensor
seems to have quite a few mistakes in its PLL description, I would say
that whatever works works. More investigation is likely needed to figure
out how things work, fix the documentation, and improve the PLL
calculation. I won't spend time on that now.

> ---
>  drivers/media/i2c/ar0521.c | 113 +++++++++++++++++++++++++++----------
>  1 file changed, 84 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 2b19ba898ce8..21649aecf442 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -23,7 +23,7 @@
>  #define AR0521_PLL_MIN		 (320 * 1000 * 1000)
>  #define AR0521_PLL_MAX		(1280 * 1000 * 1000)
>  
> -/* Effective pixel clocks, the registers may be DDR */
> +/* Effective pixel sample rate on the pixel array. */
>  #define AR0521_PIXEL_CLOCK_RATE	 (184 * 1000 * 1000)
>  #define AR0521_PIXEL_CLOCK_MIN	 (168 * 1000 * 1000)
>  #define AR0521_PIXEL_CLOCK_MAX	 (414 * 1000 * 1000)
> @@ -125,10 +125,14 @@ struct ar0521_dev {
>  	unsigned int lane_count;
>  	u16 total_width;
>  	u16 total_height;
> -	u16 pll_pre;
> -	u16 pll_mult;
> -	u16 pll_pre2;
> -	u16 pll_mult2;
> +	struct {
> +		u16 pre;
> +		u16 mult;
> +		u16 pre2;
> +		u16 mult2;
> +		u16 vt_pix;
> +	} pll;
> +
>  	bool streaming;
>  };
>  
> @@ -153,6 +157,16 @@ static u32 div64_round_up(u64 v, u32 d)
>  	return div_u64(v + d - 1, d);
>  }
>  
> +static int ar0521_code_to_bpp(struct ar0521_dev *sensor)
> +{
> +	switch (sensor->fmt.code) {
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +		return 8;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  /* Data must be BE16, the first value is the register address */
>  static int ar0521_write_regs(struct ar0521_dev *sensor, const __be16 *data,
>  			     unsigned int count)
> @@ -273,8 +287,7 @@ static int ar0521_set_gains(struct ar0521_dev *sensor)
>  	return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
>  }
>  
> -static u32 calc_pll(struct ar0521_dev *sensor, int num, u32 freq, u16 *pre_ptr,
> -		    u16 *mult_ptr)
> +static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult_ptr)
>  {
>  	u16 pre = 1, mult = 1, new_pre;
>  	u32 pll = AR0521_PLL_MAX + 1;
> @@ -309,37 +322,79 @@ static u32 calc_pll(struct ar0521_dev *sensor, int num, u32 freq, u16 *pre_ptr,
>  	return pll;
>  }
>  
> -#define DIV 4
>  static void ar0521_calc_mode(struct ar0521_dev *sensor)
>  {
> -	unsigned int speed_mod = 4 / sensor->lane_count; /* 1 with 4 DDR lanes */
> -	u16 total_width = max(sensor->fmt.width + AR0521_WIDTH_BLANKING_MIN,
> -			      AR0521_TOTAL_WIDTH_MIN);
> -	u16 total_height = sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN;
> -
> -	/* Calculate approximate pixel clock first */
> -	u64 pix_clk = AR0521_PIXEL_CLOCK_RATE;
> -
> -	/* PLL1 drives pixel clock - dual rate */
> -	pix_clk = calc_pll(sensor, 1, pix_clk * (DIV / 2), &sensor->pll_pre,
> -			   &sensor->pll_mult);
> -	pix_clk = div64_round(pix_clk, (DIV / 2));
> -	calc_pll(sensor, 2, pix_clk * (DIV / 2) * speed_mod, &sensor->pll_pre2,
> -		 &sensor->pll_mult2);
> -
> -	sensor->total_width = total_width;
> -	sensor->total_height = total_height;
> +	unsigned int pixel_clock;
> +	u16 pre, mult;
> +	u32 vco;
> +	int bpp;
> +
> +	/*
> +	 * PLL1 and PLL2 are computed equally even if the application note
> +	 * suggests a slower PLL1 clock. Maintain pll1 and pll2 divider and
> +	 * multipler separated to later specialize the calculation procedure.
> +	 *
> +	 * PLL1:
> +	 * - mclk -> / pre_div1 * pre_mul1 = VCO1 = COUNTER_CLOCK
> +	 *
> +	 * PLL2:
> +	 * - mclk -> / pre_div * pre_mul = VCO
> +	 *
> +	 *   VCO -> / vt_pix = PIXEL_CLOCK
> +	 *   VCO -> / vt_pix / 2 = WORD_CLOCK
> +	 *   VCO -> / op_sys = SERIAL_CLOCK
> +	 *
> +	 * With:
> +	 * - vt_pix = bpp / 2
> +	 * - WORD_CLOCK = PIXEL_CLOCK / 2
> +	 * - SERIAL_CLOCK = MIPI data rate (Mbps / lane) = WORD_CLOCK * bpp
> +	 *   NOTE: this implies the MIPI clock is divided internally by 2
> +	 *         to account for DDR.
> +	 *
> +	 * As op_sys_div is fixed to 1:
> +	 *
> +	 * SERIAL_CLOCK = VCO
> +	 * VCO = 2 * MIPI_CLK
> +	 * VCO = PIXEL_CLOCK * bpp / 2
> +	 *
> +	 * In the clock tree:
> +	 * MIPI_CLK = PIXEL_CLOCK * bpp / 2 / 2
> +	 *
> +	 * Generic pixel_rate to bus clock frequencey equation:
> +	 * MIPI_CLK = V4L2_CID_PIXEL_RATE * bpp / lanes / 2
> +	 *
> +	 * From which we derive the PIXEL_CLOCK to use in the clock tree:
> +	 * PIXEL_CLOCK = V4L2_CID_PIXEL_RATE * 2 / lanes
> +	 *
> +	 * Documented clock ranges:
> +	 *   WORD_CLOCK = (35MHz - 120 MHz)
> +	 *   PIXEL_CLOCK = (84MHz - 207MHz)
> +	 *   VCO = (320MHz - 1280MHz)
> +	 *
> +	 * TODO: in case we have less data lanes we have to reduce the desired
> +	 * VCO not to exceed the limits specified by the datasheet and
> +	 * consequentially reduce the obtained pixel clock.
> +	 */
> +	pixel_clock = AR0521_PIXEL_CLOCK_RATE * 2 / sensor->lane_count;
> +	bpp = ar0521_code_to_bpp(sensor);
> +	sensor->pll.vt_pix = bpp / 2;
> +	vco = pixel_clock * sensor->pll.vt_pix;
> +
> +	calc_pll(sensor, vco, &pre, &mult);
> +
> +	sensor->pll.pre = sensor->pll.pre2 = pre;
> +	sensor->pll.mult = sensor->pll.mult2 = mult;
>  }
>  
>  static int ar0521_write_mode(struct ar0521_dev *sensor)
>  {
>  	__be16 pll_regs[] = {
>  		be(AR0521_REG_VT_PIX_CLK_DIV),
> -		/* 0x300 */ be(4), /* vt_pix_clk_div = number of bits / 2 */
> +		/* 0x300 */ be(sensor->pll.vt_pix), /* vt_pix_clk_div = bpp / 2 */
>  		/* 0x302 */ be(1), /* vt_sys_clk_div */
> -		/* 0x304 */ be((sensor->pll_pre2 << 8) | sensor->pll_pre),
> -		/* 0x306 */ be((sensor->pll_mult2 << 8) | sensor->pll_mult),
> -		/* 0x308 */ be(8), /* op_pix_clk_div = 2 * vt_pix_clk_div */
> +		/* 0x304 */ be((sensor->pll.pre2 << 8) | sensor->pll.pre),
> +		/* 0x306 */ be((sensor->pll.mult2 << 8) | sensor->pll.mult),
> +		/* 0x308 */ be(sensor->pll.vt_pix * 2), /* op_pix_clk_div = 2 * vt_pix_clk_div */
>  		/* 0x30A */ be(1)  /* op_sys_clk_div */
>  	};
>  	int ret;

-- 
Regards,

Laurent Pinchart
