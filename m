Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD3A2FCCB7
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 09:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730765AbhATI3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 03:29:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37940 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728912AbhATI1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 03:27:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E626813;
        Wed, 20 Jan 2021 09:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611131222;
        bh=MFpwxBGZZkpYW9OMdSnivNE8zlmsJYnQPlJ6iKfTI0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BYtR1/74XqndrP7bsOXI7chdzz77hSxvr1Wx2U6eWWCD09S2a3myOn7XSGN9n9YRr
         TEpoCfQ7x/+layy5qp4EU+TujsCHRMwO3zjYeh195U52F74Qt1IoM6xcUQbChZPiqr
         OQ+qOR0042fE8DpJQFHeI19dHp0uT6m6a0QgKuKw=
Date:   Wed, 20 Jan 2021 10:26:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <YAfpRI2PNjIlUY2V@pendragon.ideasonboard.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
 <515e6893-7f49-ee4a-1f22-96f5aa38d938@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <515e6893-7f49-ee4a-1f22-96f5aa38d938@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Jan 18, 2021 at 04:04:47PM +0200, Tomi Valkeinen wrote:
> On 04/01/2021 07:39, Laurent Pinchart wrote:
> 
> > +static int ov1063x_pll_setup(unsigned int clk_rate,
> > +			     unsigned int *htsmin, unsigned int vts,
> > +			     unsigned int fps_numerator,
> > +			     unsigned int fps_denominator,
> > +			     struct ov1063x_pll_config *cfg)
> > +{
> > +	static const unsigned int pre_divs[] = { 2, 3, 4, 6, 8, 10, 12, 14 };
> > +
> > +	unsigned int best_pclk = UINT_MAX;
> > +	unsigned int best_pre_div;
> > +	unsigned int best_mult;
> > +	unsigned int best_div;
> > +	unsigned int best_hts;
> > +	unsigned int max_pre_div;
> > +	unsigned int pre_div;
> > +	unsigned int hts;
> > +
> > +	/*
> > +	 *  XVCLK --> pre-div -------> mult ----------> div --> output
> > +	 * 6-27 MHz           3-27 MHz      200-500 MHz       Max 96 MHz
> > +	 *
> > +	 * Valid pre-divider values are 1, 1.5, 2, 3, 4, 5, 6 and 7. The
> > +	 * pre_divs array stores the pre-dividers multiplied by two, indexed by
> > +	 * register values.
> > +	 *
> > +	 * Valid multiplier values are [1, 63], stored as-is in registers.
> > +	 *
> > +	 * Valid divider values are 2 to 16 with a step of 2, stored in
> > +	 * registers as (div / 2) - 1.
> > +	 */
> > +
> > +	if (clk_rate < 6 * 1000 * 1000 || clk_rate > 27 * 1000 * 1000)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * We try all valid combinations of settings for the 3 blocks to get
> > +	 * the pixel clock, and from that calculate the actual hts/vts to use.
> > +	 * The vts is extended so as to achieve the required frame rate.
> > +	 */
> > +
> > +	max_pre_div = max(clk_rate / (3 * 1000 * 1000),
> > +			  ARRAY_SIZE(pre_divs) - 1);
> > +
> > +	for (pre_div = 0; pre_div <= max_pre_div; pre_div++) {
> > +		unsigned int clk1 = clk_rate * 2 / pre_divs[pre_div];
> > +		unsigned int min_mult;
> > +		unsigned int max_mult;
> > +		unsigned int mult;
> 
> This PLL setup is a bit confusing to understand, because:
> 
> - "pre_div" is not the divider value, but an index to the pre_divs array
> and a value to be written into the register, and pre_div is also stored
> into the pll_cfg.

Correct.

> - "div" _is_ the divider value but it's not stored into the pll_cfg,
> instead (div / 2) - 1 is stored there.

Correct too. cfg->div stores the register value.

> And calculating max_pre_div is probably not right above, I think it
> should be min(),

Indeed. Good catch, I'll fix that.

> and additionally "clk_rate / (3 * 1000 * 1000)" is
> calculating the divider value, not the index, but it's then used as a
> max to the index loop... And even if it were the index, it should be -1,
> as the loop check uses <=.

Those are real issues too, I'll address them.

> Suggestions:
> 
> - Redefine the PLL formula. Instead of having fractional pre_divider (I
> wonder if it's actually fractional in the HW... Aren't dividers usually
> integer dividers?), redefine the formula as pclk = xvclk * 2 / pre_div *
> mul / div, and say that the possible pre_dividers are what's currently
> in pre_divs array. Or pclk = xvclk / pre_div * 2 * mul / div, which
> gives a different result with integer divisions. I don't know which one
> is the correct one (or is it either of those... If the HW handles
> fractionals, both are wrong).
> 
> - Clearly separate divider value and index/regvalue variables. The
> iteration loop should use the plain divider values, and I think it would
> be best to store the values as such to pll_config. And map the divider
> values to register values only when writing to the register.

I'd agree if it wasn't for the pre-div value. Storing the pre-div value
in pll_config would make it more complicated to calculate the register
value in the caller. And mixing register values and multiplier/divider
values in the structure isn't nice :-S That's why I've stored register
values only in pll_config.

How about this ?

commit b2356f1b87576a540ca99fbcd2ad2f0b81c494b7
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Wed Jan 20 10:25:43 2021 +0200

    media: i2c: ov1063x: Fix PLL calculation

    Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

diff --git a/drivers/media/i2c/ov1063x.c b/drivers/media/i2c/ov1063x.c
index cfd852b3eb2f..cd8d6bba3d70 100644
--- a/drivers/media/i2c/ov1063x.c
+++ b/drivers/media/i2c/ov1063x.c
@@ -642,24 +642,21 @@ static int ov1063x_pll_setup(unsigned int clk_rate,
 			     unsigned int fps_denominator,
 			     struct ov1063x_pll_config *cfg)
 {
-	static const unsigned int pre_divs[] = { 2, 3, 4, 6, 8, 10, 12, 14 };
-
 	unsigned int best_pclk = UINT_MAX;
-	unsigned int best_pre_div;
+	unsigned int best_pre_div_x2;
 	unsigned int best_mult;
 	unsigned int best_div;
 	unsigned int best_hts;
-	unsigned int max_pre_div;
-	unsigned int pre_div;
+	unsigned int max_pre_div_x2;
+	unsigned int pre_div_x2;
 	unsigned int hts;
 
 	/*
 	 *  XVCLK --> pre-div -------> mult ----------> div --> output
 	 * 6-27 MHz           3-27 MHz      200-500 MHz       Max 96 MHz
 	 *
-	 * Valid pre-divider values are 1, 1.5, 2, 3, 4, 5, 6 and 7. The
-	 * pre_divs array stores the pre-dividers multiplied by two, indexed by
-	 * register values.
+	 * Valid pre-divider values are 1, 1.5, 2, 3, 4, 5, 6 and 7, stored in
+	 * registers as the index in this list of values.
 	 *
 	 * Valid multiplier values are [1, 63], stored as-is in registers.
 	 *
@@ -676,11 +673,15 @@ static int ov1063x_pll_setup(unsigned int clk_rate,
 	 * The vts is extended so as to achieve the required frame rate.
 	 */
 
-	max_pre_div = max(clk_rate / (3 * 1000 * 1000),
-			  ARRAY_SIZE(pre_divs) - 1);
+	/*
+	 * The pre_div_x2 variable stores the pre-div value multiplied by 2, to
+	 * support the fractional divider 1.5.
+	 */
+	max_pre_div_x2 = min(clk_rate * 2 / (3 * 1000 * 1000), 14U);
 
-	for (pre_div = 0; pre_div <= max_pre_div; pre_div++) {
-		unsigned int clk1 = clk_rate * 2 / pre_divs[pre_div];
+	for (pre_div_x2 = 2; pre_div_x2 <= max_pre_div_x2;
+	     pre_div_x2 += (pre_div_x2 < 4 ? 1 : 2)) {
+		unsigned int clk1 = clk_rate * 2 / pre_div_x2;
 		unsigned int min_mult;
 		unsigned int max_mult;
 		unsigned int mult;
@@ -720,7 +721,7 @@ static int ov1063x_pll_setup(unsigned int clk_rate,
 				if (pclk < best_pclk) {
 					best_pclk = pclk;
 					best_hts = hts;
-					best_pre_div = pre_div;
+					best_pre_div_x2 = pre_div_x2;
 					best_mult = mult;
 					best_div = div;
 				}
@@ -731,8 +732,10 @@ static int ov1063x_pll_setup(unsigned int clk_rate,
 	if (best_pclk == UINT_MAX)
 		return -EINVAL;
 
+	/* Store the mult, pre_div and div as register values. */
 	cfg->mult = best_mult;
-	cfg->pre_div = best_pre_div;
+	cfg->pre_div = best_pre_div_x2 < 4 ? best_pre_div_x2 - 2
+		     : best_pre_div_x2 / 2;
 	cfg->div = (best_div / 2) - 1;
 	cfg->clk_out = best_pclk;
 

-- 
Regards,

Laurent Pinchart
