Return-Path: <linux-media+bounces-49353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 865CCCD6297
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B70AC3035D0E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 13:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454C92F39B8;
	Mon, 22 Dec 2025 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HXoZtkov"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53B2F25EB;
	Mon, 22 Dec 2025 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766410246; cv=none; b=ur6lhpC0f3/aHx5k7K4sToXUtEeG0s9Mr0XQk1OynXbPtrRnoOQYNIr6OsnF1ij4JzOirXI7Kp+6/OBtlLWgSRBu/nHrnRQ6kLx1XGbd71RKDS6q1aV8apfalbSlT6Gcmbc+Rq840I/pVkEuvmU+PBcu3so4MO+OLFXnbRon+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766410246; c=relaxed/simple;
	bh=xywLRq/TVdW8R65dbpzTh0nzVMEX2c5JYTa8jXNBQso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9yIoyk0fUwi8swoQ241J6vfg5vcaZ3SbqI9MLuA8uWN95saeUYTvPUlr8a7mrwaUKyVWIXF9FOEO0MvArprBhxi/Kjyr45uTJk80TcwYWZscGL91DNQGcGs1zAKFNchki15fKA3QuUFNQ0M80Pa8ucH5IHC40XY9Op6/OUxUxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HXoZtkov; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4A2CFE1F;
	Mon, 22 Dec 2025 14:30:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766410227;
	bh=xywLRq/TVdW8R65dbpzTh0nzVMEX2c5JYTa8jXNBQso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXoZtkov8W9TN4rqMJp4hgb5i4vG37F3x2VLnfwOVZaeypAVHYEswNPYuo+hzfkH6
	 t2oeQ6Vi+epiVhWYZCjfJ5Qnq/bo5fPSfKDy24ej8/tE+/j14wxQcp+2s7IL1N5cLO
	 7X1SNrUlFjTdWPcO2t9aVi0ls4VuEPfUNrlgn3es=
Date: Mon, 22 Dec 2025 15:30:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v6 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <20251222133018.GB5317@pendragon.ideasonboard.com>
References: <20251202-hm1246-v6-0-3e96ed6b3ffa@emfend.at>
 <20251202-hm1246-v6-2-3e96ed6b3ffa@emfend.at>
 <aUXRsv-r9-sQvpAm@kekkonen.localdomain>
 <2c6c4b36-6b97-4260-8c01-6861b6f36cea@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c6c4b36-6b97-4260-8c01-6861b6f36cea@emfend.at>

On Mon, Dec 22, 2025 at 12:17:56PM +0100, Matthias Fend wrote:
> Am 19.12.2025 um 23:29 schrieb Sakari Ailus:
> > Hi Matthias,
> > 
> > Thanks for the update.
> > 
> > On Tue, Dec 02, 2025 at 04:26:06PM +0100, Matthias Fend wrote:
> > 
> > ...
> > 
> >> +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_freq,
> >> +			   u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)
> >> +{
> >> +	const u8 pclk_div_table[] = { 4, 5, 6, 7, 8, 12, 14, 16 };
> >> +	const u8 sysclk_div_table[] = { 1, 2, 3, 4 };
> >> +	const u8 post_div_table[] = { 1, 2, 4, 8 };
> >> +	const int sysclk_pclk_ratio = 3; /* Recommended value */
> >> +	u32 pclk, vco_out, best_vco_diff;
> >> +	int pclk_div_index, sysclk_div_index, post_div_index;
> >> +	u8 pre_div = 0, multiplier_h = 0, multiplier_l = 0;
> >> +	bool sysclk_pclk_ratio_found = false;
> >> +
> >> +	if (link_freq < HM1246_PCLK_MIN || link_freq > HM1246_PCLK_MAX)
> >> +		return -EINVAL;
> >> +
> >> +	/*
> >> +	 * In raw mode (1 pixel per clock) the pixel clock is internally
> >> +	 * divided by two.
> >> +	 */
> >> +	pclk = 2 * link_freq / clocks_per_pixel;
> >> +
> >> +	/* Find suitable PCLK and SYSCLK dividers. */
> >> +	for (pclk_div_index = 0; pclk_div_index < ARRAY_SIZE(pclk_div_table);
> >> +	     pclk_div_index++) {
> >> +		for (sysclk_div_index = 0;
> >> +		     sysclk_div_index < ARRAY_SIZE(sysclk_div_table);
> >> +		     sysclk_div_index++) {
> >> +			if (sysclk_div_table[sysclk_div_index] *
> >> +				    sysclk_pclk_ratio ==
> >> +			    pclk_div_table[pclk_div_index]) {
> >> +				sysclk_pclk_ratio_found = true;
> >> +				break;
> >> +			}
> >> +		}
> >> +		if (sysclk_pclk_ratio_found)
> >> +			break;
> >> +	}
> >> +
> >> +	if (!sysclk_pclk_ratio_found)
> >> +		return -EINVAL;
> >> +
> >> +	/* Determine an appropriate post divider. */
> >> +	for (post_div_index = 0; post_div_index < ARRAY_SIZE(post_div_table);
> >> +	     post_div_index++) {
> >> +		vco_out = pclk * pclk_div_table[pclk_div_index] *
> >> +			  post_div_table[post_div_index];
> >> +
> >> +		if (vco_out >= HM1246_PLL_VCO_MIN &&
> >> +		    vco_out <= HM1246_PLL_VCO_MAX)
> >> +			break;
> >> +	}
> >> +	if (post_div_index >= ARRAY_SIZE(post_div_table))
> >> +		return -EINVAL;
> >> +
> >> +	/* Find best pre-divider and multiplier values. */
> >> +	best_vco_diff = U32_MAX;
> >> +	for (u32 div = DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_MAX);
> >> +	     div <= xclk / HM1246_PLL_INCLK_MIN; div++) {
> >> +		u32 multi, multi_h, multi_l, vco, diff;
> >> +
> >> +		multi = DIV_ROUND_CLOSEST_ULL((u64)vco_out * div, xclk);
> >> +		if (multi < HM1246_PLL_MULTI_MIN ||
> >> +		    multi > HM1246_PLL_MULTI_MAX)
> >> +			continue;
> >> +
> >> +		multi_h = multi / (HM1246_PLL_MULTI_H_MIN *
> >> +				   HM1246_PLL_MULTI_L_MAX) +
> >> +			  2;
> >> +		multi_l = multi / multi_h;
> >> +		vco = div_u64((u64)xclk * multi_h * multi_l, div);
> >> +
> >> +		diff = abs_diff(vco_out, vco);
> >> +
> >> +		if (diff < best_vco_diff) {
> >> +			best_vco_diff = diff;
> >> +			pre_div = div;
> >> +			multiplier_h = multi_h;
> >> +			multiplier_l = multi_l;
> >> +		}
> >> +
> >> +		if (!diff)
> >> +			break;
> >> +	}
> >> +
> >> +	if (best_vco_diff == U32_MAX)
> >> +		return -EINVAL;
> > 
> > How much difference is acceptable? Isn't any difference a bug either in DT
> > or the code above? In other words, I'd return an error in that case.
> 
> Hard to tell, but almost every input clock will result in a slight 
> difference. Even the recommended reference register configuration 
> doesn't create a perfect match. Therefore, I don't think it's a good 
> idea to treat every deviation as an error.

I understand that the PLL won't be able to produce the exact nominal
expected frequency, but can't we require the link-frequencies property
in DT to match the PLL output exactly ? That's what we do with other
sensors.

> However, every supported input frequency (6-27MHz) will result in a 
> pixel clock deviation of less than 0.5%. Since the sensor uses a 
> parallel interface, these frequencies will all work without any 
> problems. The frame timings may, of course, be slightly different.
> 
> To change this and prevent any deviation, one would probably have to 
> replace the PLL calculation with one or more dedicated frequency-setup 
> pairs (with adjusted pixelclocks). Which wouldn't be ideal, as the 
> solution isn't very flexible - and I've invested quite a bit of effort 
> in the PLL calculation ;)
> 
> >> +
> >> +	*pll1 = HM1246_PLL1CFG_MULTIPLIER(multiplier_l - 1);
> >> +	*pll2 = HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |
> >> +		HM1246_PLL2CFG_MULTIPLIER(multiplier_h - 2);
> >> +	*pll3 = HM1246_PLL3CFG_POST_DIV(post_div_index) |
> >> +		HM1246_PLL3CFG_SYSCLK_DIV(sysclk_div_index) |
> >> +		HM1246_PLL3CFG_PCLK_DIV(pclk_div_index);
> >> +
> >> +	return 0;
> >> +}

-- 
Regards,

Laurent Pinchart

