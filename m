Return-Path: <linux-media+bounces-50462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB2D12790
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 13:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E5C30A8BA4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E03C357720;
	Mon, 12 Jan 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tk67MVYV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA4B357703;
	Mon, 12 Jan 2026 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219761; cv=none; b=cED+Hdl7A9yNxdw7R/touGDyR8BFZLzUNdcMMp+/qdsZJcMNmXI4W/uKyfW/NobF7TYXaNXGvNqQjFW4FFVDgR41zQJkYpZmlqDONlJIjjgdzkqw8a5cR82Sxo36i8jkggM2m+11afpR5YRier+lBNIZqxHO6Sui2D0SUxxNFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219761; c=relaxed/simple;
	bh=hfc/Ob5dZ76luUNNZHvRKZDuyU0hH1rZPgN2p81Dnjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyMxn1pSNs/20oSuQ6+xAv3nLvj72APt+0tcoilm6L9cUzrkqHe42mmQjBtKq33IxdvijiXfe/8gHSV1n/O1qKRLI5FdNtugkVrmPRu3iubtdK9wXouS1yAVKKdbcEnexI1hjwFi74t2AWtpZEwHygi8z9k6OeAN4tlVtz+fIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tk67MVYV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768219760; x=1799755760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hfc/Ob5dZ76luUNNZHvRKZDuyU0hH1rZPgN2p81Dnjs=;
  b=Tk67MVYVnCyj2wSQpXYTH6l1MPZaUbEEnEuokr5rDI9FDYkCaqGK3Az7
   Ec0AkkL99ulYMelLy4uttyqUySknouwJ14hyBqPOf8paB3u2vcNSsppXh
   sR5kj0SkMGex7uEusIwmZmtQEF+0vWo9sG21we0ILzZwln1v7U+fiMBdt
   E4cfMKqq5yfhyKbfkEt1zEOC5iatuOLJ5IZkY7P7QFnn6eB9sPIQhEdoT
   yIVoBOf7XWMtVkafFFa4wB9O+IMdhywoPU3hQrSpy/U4Q0gzfHenD7Ocr
   aLgXBSLPyd9wf3iV+HJUq7IreJeyryg973FSWSxwTBtcwYGVft5EvXXFC
   Q==;
X-CSE-ConnectionGUID: roj5b3zpSbSSe70djoBxYA==
X-CSE-MsgGUID: MM83cIK1RoCibSsmdiKk5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68697703"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68697703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:09:19 -0800
X-CSE-ConnectionGUID: vBTU07+aRai9rWTvtaOsuw==
X-CSE-MsgGUID: qvvqzlEnR+egReGJB+4aZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="209149781"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:09:14 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 36F5B1229EA;
	Mon, 12 Jan 2026 14:09:10 +0200 (EET)
Date: Mon, 12 Jan 2026 14:09:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v6 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <aWTkZpcc8GDbKTEZ@kekkonen.localdomain>
References: <20251202-hm1246-v6-0-3e96ed6b3ffa@emfend.at>
 <20251202-hm1246-v6-2-3e96ed6b3ffa@emfend.at>
 <aUXRsv-r9-sQvpAm@kekkonen.localdomain>
 <2c6c4b36-6b97-4260-8c01-6861b6f36cea@emfend.at>
 <20251222133018.GB5317@pendragon.ideasonboard.com>
 <19848593-4879-46fa-8969-d34c2fc511ed@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19848593-4879-46fa-8969-d34c2fc511ed@emfend.at>

Hi Matthias,

On Mon, Dec 22, 2025 at 04:58:28PM +0100, Matthias Fend wrote:
> Hi Laurent,
> 
> Am 22.12.2025 um 14:30 schrieb Laurent Pinchart:
> > On Mon, Dec 22, 2025 at 12:17:56PM +0100, Matthias Fend wrote:
> > > Am 19.12.2025 um 23:29 schrieb Sakari Ailus:
> > > > Hi Matthias,
> > > > 
> > > > Thanks for the update.
> > > > 
> > > > On Tue, Dec 02, 2025 at 04:26:06PM +0100, Matthias Fend wrote:
> > > > 
> > > > ...
> > > > 
> > > > > +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_freq,
> > > > > +			   u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)
> > > > > +{
> > > > > +	const u8 pclk_div_table[] = { 4, 5, 6, 7, 8, 12, 14, 16 };
> > > > > +	const u8 sysclk_div_table[] = { 1, 2, 3, 4 };
> > > > > +	const u8 post_div_table[] = { 1, 2, 4, 8 };
> > > > > +	const int sysclk_pclk_ratio = 3; /* Recommended value */
> > > > > +	u32 pclk, vco_out, best_vco_diff;
> > > > > +	int pclk_div_index, sysclk_div_index, post_div_index;
> > > > > +	u8 pre_div = 0, multiplier_h = 0, multiplier_l = 0;
> > > > > +	bool sysclk_pclk_ratio_found = false;
> > > > > +
> > > > > +	if (link_freq < HM1246_PCLK_MIN || link_freq > HM1246_PCLK_MAX)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/*
> > > > > +	 * In raw mode (1 pixel per clock) the pixel clock is internally
> > > > > +	 * divided by two.
> > > > > +	 */
> > > > > +	pclk = 2 * link_freq / clocks_per_pixel;
> > > > > +
> > > > > +	/* Find suitable PCLK and SYSCLK dividers. */
> > > > > +	for (pclk_div_index = 0; pclk_div_index < ARRAY_SIZE(pclk_div_table);
> > > > > +	     pclk_div_index++) {
> > > > > +		for (sysclk_div_index = 0;
> > > > > +		     sysclk_div_index < ARRAY_SIZE(sysclk_div_table);
> > > > > +		     sysclk_div_index++) {
> > > > > +			if (sysclk_div_table[sysclk_div_index] *
> > > > > +				    sysclk_pclk_ratio ==
> > > > > +			    pclk_div_table[pclk_div_index]) {
> > > > > +				sysclk_pclk_ratio_found = true;
> > > > > +				break;
> > > > > +			}
> > > > > +		}
> > > > > +		if (sysclk_pclk_ratio_found)
> > > > > +			break;
> > > > > +	}
> > > > > +
> > > > > +	if (!sysclk_pclk_ratio_found)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* Determine an appropriate post divider. */
> > > > > +	for (post_div_index = 0; post_div_index < ARRAY_SIZE(post_div_table);
> > > > > +	     post_div_index++) {
> > > > > +		vco_out = pclk * pclk_div_table[pclk_div_index] *
> > > > > +			  post_div_table[post_div_index];
> > > > > +
> > > > > +		if (vco_out >= HM1246_PLL_VCO_MIN &&
> > > > > +		    vco_out <= HM1246_PLL_VCO_MAX)
> > > > > +			break;
> > > > > +	}
> > > > > +	if (post_div_index >= ARRAY_SIZE(post_div_table))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* Find best pre-divider and multiplier values. */
> > > > > +	best_vco_diff = U32_MAX;
> > > > > +	for (u32 div = DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_MAX);
> > > > > +	     div <= xclk / HM1246_PLL_INCLK_MIN; div++) {
> > > > > +		u32 multi, multi_h, multi_l, vco, diff;
> > > > > +
> > > > > +		multi = DIV_ROUND_CLOSEST_ULL((u64)vco_out * div, xclk);
> > > > > +		if (multi < HM1246_PLL_MULTI_MIN ||
> > > > > +		    multi > HM1246_PLL_MULTI_MAX)
> > > > > +			continue;
> > > > > +
> > > > > +		multi_h = multi / (HM1246_PLL_MULTI_H_MIN *
> > > > > +				   HM1246_PLL_MULTI_L_MAX) +
> > > > > +			  2;
> > > > > +		multi_l = multi / multi_h;
> > > > > +		vco = div_u64((u64)xclk * multi_h * multi_l, div);
> > > > > +
> > > > > +		diff = abs_diff(vco_out, vco);
> > > > > +
> > > > > +		if (diff < best_vco_diff) {
> > > > > +			best_vco_diff = diff;
> > > > > +			pre_div = div;
> > > > > +			multiplier_h = multi_h;
> > > > > +			multiplier_l = multi_l;
> > > > > +		}
> > > > > +
> > > > > +		if (!diff)
> > > > > +			break;
> > > > > +	}
> > > > > +
> > > > > +	if (best_vco_diff == U32_MAX)
> > > > > +		return -EINVAL;
> > > > 
> > > > How much difference is acceptable? Isn't any difference a bug either in DT
> > > > or the code above? In other words, I'd return an error in that case.
> > > 
> > > Hard to tell, but almost every input clock will result in a slight
> > > difference. Even the recommended reference register configuration
> > > doesn't create a perfect match. Therefore, I don't think it's a good
> > > idea to treat every deviation as an error.
> > 
> > I understand that the PLL won't be able to produce the exact nominal
> > expected frequency, but can't we require the link-frequencies property
> > in DT to match the PLL output exactly ? That's what we do with other
> > sensors.
> 
> You mean that any link frequency (within the allowed range) can be specified
> in the device tree, which the PLL can generate exactly? The values ​​for the

Correct.

> v4l2 controls V4L2_CID_PIXEL_RATE and V4L2_CID_LINK_FREQ are then also based
> on the DT link freuqency.

Yes, they should be.

> 
> The recently added IMX111 does something similar. For many other sensors,
> the link frequencies are rather fixed.

Those drivers have no PLL calculators. As you can use an exact frequencies,
please do so. Any error would be visible in frame rates, for instance.

-- 
Kind regards,

Sakari Ailus

