Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BCC2FA284
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 15:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392634AbhAROFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 09:05:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34094 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392630AbhAROFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 09:05:32 -0500
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 128882BB;
        Mon, 18 Jan 2021 15:04:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610978688;
        bh=TaKMjhKNWN1dFnA8mccxbk43purXcXj+Up4ik/ANAaA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=d4lG0eTt6c/bIK7FFW0il0s5pR1Q5+aeeC7Iwp+ime285oGtric3kT5kUiuRGvNQv
         C+4lJFKW2Rz7TBtOc4jBO0KvXy9n/Quo1SoWh++NvolNdEL07tZgTh1aye7wdKRtp3
         ql5xvqZRyCYQrjaWmolq0iHhgmsbdkoW813NvbWU=
Subject: Re: [PATCH 2/2] media: i2c: Add OV1063x sensor driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
Message-ID: <515e6893-7f49-ee4a-1f22-96f5aa38d938@ideasonboard.com>
Date:   Mon, 18 Jan 2021 16:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 04/01/2021 07:39, Laurent Pinchart wrote:

> +static int ov1063x_pll_setup(unsigned int clk_rate,
> +			     unsigned int *htsmin, unsigned int vts,
> +			     unsigned int fps_numerator,
> +			     unsigned int fps_denominator,
> +			     struct ov1063x_pll_config *cfg)
> +{
> +	static const unsigned int pre_divs[] = { 2, 3, 4, 6, 8, 10, 12, 14 };
> +
> +	unsigned int best_pclk = UINT_MAX;
> +	unsigned int best_pre_div;
> +	unsigned int best_mult;
> +	unsigned int best_div;
> +	unsigned int best_hts;
> +	unsigned int max_pre_div;
> +	unsigned int pre_div;
> +	unsigned int hts;
> +
> +	/*
> +	 *  XVCLK --> pre-div -------> mult ----------> div --> output
> +	 * 6-27 MHz           3-27 MHz      200-500 MHz       Max 96 MHz
> +	 *
> +	 * Valid pre-divider values are 1, 1.5, 2, 3, 4, 5, 6 and 7. The
> +	 * pre_divs array stores the pre-dividers multiplied by two, indexed by
> +	 * register values.
> +	 *
> +	 * Valid multiplier values are [1, 63], stored as-is in registers.
> +	 *
> +	 * Valid divider values are 2 to 16 with a step of 2, stored in
> +	 * registers as (div / 2) - 1.
> +	 */
> +
> +	if (clk_rate < 6 * 1000 * 1000 || clk_rate > 27 * 1000 * 1000)
> +		return -EINVAL;
> +
> +	/*
> +	 * We try all valid combinations of settings for the 3 blocks to get
> +	 * the pixel clock, and from that calculate the actual hts/vts to use.
> +	 * The vts is extended so as to achieve the required frame rate.
> +	 */
> +
> +	max_pre_div = max(clk_rate / (3 * 1000 * 1000),
> +			  ARRAY_SIZE(pre_divs) - 1);
> +
> +	for (pre_div = 0; pre_div <= max_pre_div; pre_div++) {
> +		unsigned int clk1 = clk_rate * 2 / pre_divs[pre_div];
> +		unsigned int min_mult;
> +		unsigned int max_mult;
> +		unsigned int mult;

This PLL setup is a bit confusing to understand, because:

- "pre_div" is not the divider value, but an index to the pre_divs array
and a value to be written into the register, and pre_div is also stored
into the pll_cfg.

- "div" _is_ the divider value but it's not stored into the pll_cfg,
instead (div / 2) - 1 is stored there.

And calculating max_pre_div is probably not right above, I think it
should be min(), and additionally "clk_rate / (3 * 1000 * 1000)" is
calculating the divider value, not the index, but it's then used as a
max to the index loop... And even if it were the index, it should be -1,
as the loop check uses <=.

Suggestions:

- Redefine the PLL formula. Instead of having fractional pre_divider (I
wonder if it's actually fractional in the HW... Aren't dividers usually
integer dividers?), redefine the formula as pclk = xvclk * 2 / pre_div *
mul / div, and say that the possible pre_dividers are what's currently
in pre_divs array. Or pclk = xvclk / pre_div * 2 * mul / div, which
gives a different result with integer divisions. I don't know which one
is the correct one (or is it either of those... If the HW handles
fractionals, both are wrong).

- Clearly separate divider value and index/regvalue variables. The
iteration loop should use the plain divider values, and I think it would
be best to store the values as such to pll_config. And map the divider
values to register values only when writing to the register.

 Tomi
