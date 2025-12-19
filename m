Return-Path: <linux-media+bounces-49217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F0CD21A8
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 23:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3FC53062214
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 22:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE4E23ABA1;
	Fri, 19 Dec 2025 22:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYZUIC/m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DD1D6DA9;
	Fri, 19 Dec 2025 22:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766183357; cv=none; b=odifVLlP+EDzVuXDTx4KTNn67pXMRCELbe+Eum8ppV8j9C3yjRnzdO3mDzLh3IzSU9kd6LUvcjcFghuK3vvYMBlMcZ5lU6dR+5GeNlfmw9SEO7yyS+CsAVHYhaueevguV4NV6rcUHAaHBrgbbwG1RBXUlWNt0NDtFmKh6sqPmY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766183357; c=relaxed/simple;
	bh=f+nqoXvIzIr0IksimfjQp+KWIiqcmbnhUvA8cNE03Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5PCr4C9JHBzsNDkqFxCGGpKOQMLlY8TbKp8wzFm2ykm7F3Pmu/TJ+VVCX9S5PAmH/4pDWA6yt2OSqSqhBUnxdN4tsuoOZRy1IMiU/4A3z0I71cN28Xz5ue8jJcVg0jHMEntrn1efbTYhKwL1BBaJpV+k8DkGHtS5/k9fziRqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYZUIC/m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766183356; x=1797719356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+nqoXvIzIr0IksimfjQp+KWIiqcmbnhUvA8cNE03Y4=;
  b=HYZUIC/mX7KgYruuMns3zjTKbST/o8ofgwSR3sYJyegfBhnZhKOAuF8n
   RW5TmNZjO+CE//aMnKj50GD9SAku4WaU+f0bluK0Oxfe0yZycZVv+Tnbf
   sZ6gdnFWoL4pYmiHsqGq6Gmj6I2daX1rMcFJE1e37FfeOqj8SO/jZQpwF
   8jISBBPd5KxhODvBG9QNbbRwkDwSMhE1hd0BD70vX1pFWZJcaXvGRDCZB
   bv+ZZJ8zG2zweZgpfq5lVUPIWN6dM2Yose0w9QI9wWkXF03OFrunuJi+C
   TqObHnr7d7BvBn7R+GEEYooN/zQC1pEn9eapHvHL4p/kURl+f7Sxlgcfv
   g==;
X-CSE-ConnectionGUID: sk89m1lHQiqhFvy/h3Y49g==
X-CSE-MsgGUID: o+kZgRnuSk2tDnvH2haWIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67344103"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="67344103"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 14:29:15 -0800
X-CSE-ConnectionGUID: gpDUCmFlQeSPRtodcs1+YQ==
X-CSE-MsgGUID: pQwh7UTCTquiRin8JhrTzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198122494"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 14:29:08 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 457BA120D21;
	Sat, 20 Dec 2025 00:29:06 +0200 (EET)
Date: Sat, 20 Dec 2025 00:29:06 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v6 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <aUXRsv-r9-sQvpAm@kekkonen.localdomain>
References: <20251202-hm1246-v6-0-3e96ed6b3ffa@emfend.at>
 <20251202-hm1246-v6-2-3e96ed6b3ffa@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-hm1246-v6-2-3e96ed6b3ffa@emfend.at>

Hi Matthias,

Thanks for the update.

On Tue, Dec 02, 2025 at 04:26:06PM +0100, Matthias Fend wrote:

...

> +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_freq,
> +			   u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)
> +{
> +	const u8 pclk_div_table[] = { 4, 5, 6, 7, 8, 12, 14, 16 };
> +	const u8 sysclk_div_table[] = { 1, 2, 3, 4 };
> +	const u8 post_div_table[] = { 1, 2, 4, 8 };
> +	const int sysclk_pclk_ratio = 3; /* Recommended value */
> +	u32 pclk, vco_out, best_vco_diff;
> +	int pclk_div_index, sysclk_div_index, post_div_index;
> +	u8 pre_div = 0, multiplier_h = 0, multiplier_l = 0;
> +	bool sysclk_pclk_ratio_found = false;
> +
> +	if (link_freq < HM1246_PCLK_MIN || link_freq > HM1246_PCLK_MAX)
> +		return -EINVAL;
> +
> +	/*
> +	 * In raw mode (1 pixel per clock) the pixel clock is internally
> +	 * divided by two.
> +	 */
> +	pclk = 2 * link_freq / clocks_per_pixel;
> +
> +	/* Find suitable PCLK and SYSCLK dividers. */
> +	for (pclk_div_index = 0; pclk_div_index < ARRAY_SIZE(pclk_div_table);
> +	     pclk_div_index++) {
> +		for (sysclk_div_index = 0;
> +		     sysclk_div_index < ARRAY_SIZE(sysclk_div_table);
> +		     sysclk_div_index++) {
> +			if (sysclk_div_table[sysclk_div_index] *
> +				    sysclk_pclk_ratio ==
> +			    pclk_div_table[pclk_div_index]) {
> +				sysclk_pclk_ratio_found = true;
> +				break;
> +			}
> +		}
> +		if (sysclk_pclk_ratio_found)
> +			break;
> +	}
> +
> +	if (!sysclk_pclk_ratio_found)
> +		return -EINVAL;
> +
> +	/* Determine an appropriate post divider. */
> +	for (post_div_index = 0; post_div_index < ARRAY_SIZE(post_div_table);
> +	     post_div_index++) {
> +		vco_out = pclk * pclk_div_table[pclk_div_index] *
> +			  post_div_table[post_div_index];
> +
> +		if (vco_out >= HM1246_PLL_VCO_MIN &&
> +		    vco_out <= HM1246_PLL_VCO_MAX)
> +			break;
> +	}
> +	if (post_div_index >= ARRAY_SIZE(post_div_table))
> +		return -EINVAL;
> +
> +	/* Find best pre-divider and multiplier values. */
> +	best_vco_diff = U32_MAX;
> +	for (u32 div = DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_MAX);
> +	     div <= xclk / HM1246_PLL_INCLK_MIN; div++) {
> +		u32 multi, multi_h, multi_l, vco, diff;
> +
> +		multi = DIV_ROUND_CLOSEST_ULL((u64)vco_out * div, xclk);
> +		if (multi < HM1246_PLL_MULTI_MIN ||
> +		    multi > HM1246_PLL_MULTI_MAX)
> +			continue;
> +
> +		multi_h = multi / (HM1246_PLL_MULTI_H_MIN *
> +				   HM1246_PLL_MULTI_L_MAX) +
> +			  2;
> +		multi_l = multi / multi_h;
> +		vco = div_u64((u64)xclk * multi_h * multi_l, div);
> +
> +		diff = abs_diff(vco_out, vco);
> +
> +		if (diff < best_vco_diff) {
> +			best_vco_diff = diff;
> +			pre_div = div;
> +			multiplier_h = multi_h;
> +			multiplier_l = multi_l;
> +		}
> +
> +		if (!diff)
> +			break;
> +	}
> +
> +	if (best_vco_diff == U32_MAX)
> +		return -EINVAL;

How much difference is acceptable? Isn't any difference a bug either in DT
or the code above? In other words, I'd return an error in that case.

> +
> +	*pll1 = HM1246_PLL1CFG_MULTIPLIER(multiplier_l - 1);
> +	*pll2 = HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |
> +		HM1246_PLL2CFG_MULTIPLIER(multiplier_h - 2);
> +	*pll3 = HM1246_PLL3CFG_POST_DIV(post_div_index) |
> +		HM1246_PLL3CFG_SYSCLK_DIV(sysclk_div_index) |
> +		HM1246_PLL3CFG_PCLK_DIV(pclk_div_index);
> +
> +	return 0;
> +}

-- 
Kind regards,

Sakari Ailus

