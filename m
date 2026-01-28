Return-Path: <linux-media+bounces-51754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFyAKImDemnx7AEAu9opvQ
	(envelope-from <linux-media+bounces-51754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 22:45:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F5A9318
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 22:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C14FF3033508
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 21:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79BB2F5A22;
	Wed, 28 Jan 2026 21:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7lIJ5sa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FEE4A33;
	Wed, 28 Jan 2026 21:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769636736; cv=none; b=HXy+P5mR4DcnEPADzgF6H7H78CaEQFn1K9SELl5AYSvwBtfSGisB5xVH7P8CTAqk6cSxMPzGCBR3ze7FqU5SNebpgWWNh9JzKNwg72uPoc4SirAS3qjYnaIfEEhHmidbUhWqlZuRKaJtyi2BucUI9b75FQHFoBTveqL+oGc6rR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769636736; c=relaxed/simple;
	bh=vuFNYwMITtQZtPhVh75ICH5ResFTjDJ7mP/pdnIeeKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xl7gEAoyTjfXtvKRi3JGmKrib1MeBy4YNGlOnJMDU9dwvTJIQd5U8636hcZx67Ruy3Br32ZNhcfORAFTG7qWG2PVqrwF2Mm8eR3gRG1OJr3XbtBOT2xBCLV2bfaZuNd6WCw/GpbZ+dYJgzP1CZ7DGZmF+685FJV5jGeyWtGU708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7lIJ5sa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769636734; x=1801172734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vuFNYwMITtQZtPhVh75ICH5ResFTjDJ7mP/pdnIeeKc=;
  b=E7lIJ5sa5Kr0lw5RBv7F1Zs2JP2uMp/N3cHB9tDxFFyq8+aShd0ZzLhJ
   7BDuFPiqsEuoaIyJlW2jTIfykxnvXWSudZNkwIaJnFWPLDGf5RbEHcigL
   8wALf6MOYYXdUxowClV89g+Yc1l0gjwBNA4T2vs05SvGXDtlL9O+5IQ6S
   0uRGKE37VHrmeHMNZYvsQAdXJDL+bpO6e0jcLlQYwTp+8g3iTpTf6MviQ
   lYUAQQPq33CfItagcihzbbll6cRJubQUJgpRH1amGOWewX0p5ilTAKRB/
   J+g/6vFGMh6qcVgkgRG2Jzd9q4OHg2WgWijPT0bZ2QyNfzE4q5+kdOQkR
   A==;
X-CSE-ConnectionGUID: opYWcwkHRzmZp7KyiOhT8A==
X-CSE-MsgGUID: B9z9dy8BQqGdp/clRnt0+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74724712"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74724712"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:45:33 -0800
X-CSE-ConnectionGUID: NPsEVXleRK6jax+SzHr1qA==
X-CSE-MsgGUID: 0hkHzCDOQWOH54TjItZp8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="245984124"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:45:27 -0800
Date: Wed, 28 Jan 2026 23:45:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
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
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Subject: Re: [PATCH v9 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <aXqDdN2fHDlcYjhk@smile.fi.intel.com>
References: <20260128-hm1246-v9-0-f9c996486a95@emfend.at>
 <20260128-hm1246-v9-2-f9c996486a95@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-hm1246-v9-2-f9c996486a95@emfend.at>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,chromium.org,apitzsch.eu,siliconsignals.io,foss.st.com,intel.com,linaro.org,rowland.harvard.edu,gmail.com,ideasonboard.com,pengutronix.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51754-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 439F5A9318
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:08:02PM +0100, Matthias Fend wrote:
> Add a V4L2 sub-device driver for Himax HM1246 image sensor.
> 
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> array size of 1296 x 976. It is programmable through an I2C interface and
> connected via parallel bus.
> 
> The sensor has an internal ISP with a complete image processing pipeline
> including control loops. However, this driver uses the sensor in raw mode
> and the entire ISP is bypassed.

I found no serious issues here, just a few nit-picks. FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +/* Clock setup registers */
> +#define HM1246_PLL1CFG_REG		 CCI_REG8(0x0303)
> +#define HM1246_PLL1CFG_MULTIPLIER(x)	 (((x) & 0xff) << 0)
> +#define HM1246_PLL2CFG_REG		 CCI_REG8(0x0305)
> +#define HM1246_PLL2CFG_PRE_DIV(x)	 (((x) & 0x1f) << 1)
> +#define HM1246_PLL2CFG_MULTIPLIER(x)	 (((x) & 0x01) << 0)
> +#define HM1246_PLL3CFG_REG		 CCI_REG8(0x0307)
> +#define HM1246_PLL3CFG_POST_DIV(x)	 (((x) & 0x3) << 6)
> +#define HM1246_PLL3CFG_SYSCLK_DIV(x)	 (((x) & 0x3) << 4)
> +#define HM1246_PLL3CFG_PCLK_DIV(x)	 (((x) & 0x7) << 0)

Is not using BIT*() and GENMASK*() in the above on purpose?

...

> +/* Test pattern registers */
> +#define HM1246_TEST_PATTERN_MODE_REG	 CCI_REG8(0x0601)
> +#define HM1246_TEST_PATTERN_MODE_MODE(x) (((x) & 0xf) << 4)
> +#define HM1246_TEST_PATTERN_MODE_ENABLE	 BIT(0)

Ditto.

...

> +#define HM1246_ANALOG_GLOBAL_GAIN_STEP	 1

0x01 ? (Since the min and max are represented in hexadecimal form)

...

> +struct hm1246 {
> +	struct device *dev;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;

Wondering if putting the embedded structs first (either sd or pad) gives a
better (smaller) object size. Sometimes this kind of shuffling makes
container_of() to be a compile-time no-op.

> +	struct regulator_bulk_data supplies[ARRAY_SIZE(hm1246_supply_names)];
> +	struct clk *xclk;
> +	unsigned long xclk_freq;
> +	struct reset_control *reset;
> +	unsigned int mbus_flags;
> +	s64 link_frequency;
> +
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_ctrl *exposure_ctrl;
> +	struct v4l2_ctrl *hflip_ctrl;
> +	struct v4l2_ctrl *vflip_ctrl;
> +
> +	struct regmap *regmap;
> +
> +	bool identified;
> +};

...

> +static int hm1246_enum_frame_size(struct v4l2_subdev *subdev,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct hm1246 *hm1246 = to_hm1246(subdev);
> +	const struct hm1246_mode *mode;
> +
> +	if (fse->index > 0)
> +		return -EINVAL;
> +
> +	mode = hm1246_find_mode_by_mbus_code(hm1246, fse->code);
> +	if (!mode)
> +		return -EINVAL;

Hmm... Is it common practice to return -EINVAL in such cases?
From the context (not found) I would rather return -ENOENT.

> +	fse->min_width = mode->rect.width;
> +	fse->max_width = mode->rect.width;
> +	fse->min_height = mode->rect.height;
> +	fse->max_height = mode->rect.height;
> +
> +	return 0;
> +}

...

> +static int hm1246_calc_pll(u32 xclk, u32 link_freq, u32 clocks_per_pixel,
> +			   u8 *pll1, u8 *pll2, u8 *pll3)
> +{
> +	const u8 pclk_div_table[] = { 4, 5, 6, 7, 8, 12, 14, 16 };
> +	const u8 sysclk_div_table[] = { 1, 2, 3, 4 };
> +	const u8 post_div_table[] = { 1, 2, 4, 8 };
> +	const int sysclk_pclk_ratio = 3; /* Recommended value */

Why not marking them static? Note, in some cases compiler might decide to fill
up the values on the stack or put them as a direct constant in the register.
It might lead to suboptimal code.

> +	u32 pclk, vco_out;
> +	int pclk_div_index, sysclk_div_index, post_div_index;

> +	bool sysclk_pclk_ratio_found = false;

We don't need this. See below how.

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

Drop.

> +				break;
> +			}
> +		}

		if (sysclk_div_index < ARRAY_SIZE(sysclk_div_table))

> +		if (sysclk_pclk_ratio_found)
> +			break;
> +	}

	if (pclk_div_index < ARRAY_SIZE(pclk_div_table))

> +	if (!sysclk_pclk_ratio_found)
> +		return -EINVAL;

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
> +	/* Find pre-divider and multiplier values. */
> +	for (u32 div = DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_MAX);
> +	     div <= xclk / HM1246_PLL_INCLK_MIN; div++) {
> +		u32 multi, multi_h, multi_l, vco;

> +		multi = DIV_ROUND_CLOSEST_ULL((u64)vco_out * div, xclk);

Can we define vco_out as u64 and drop the casting?

> +		if (multi < HM1246_PLL_MULTI_MIN ||
> +		    multi > HM1246_PLL_MULTI_MAX)
> +			continue;
> +
> +		multi_h = multi / (HM1246_PLL_MULTI_H_MIN *
> +				   HM1246_PLL_MULTI_L_MAX) +
> +			  2;
> +		multi_l = multi / multi_h;
> +		vco = div_u64((u64)xclk * multi_h * multi_l, div);

Similar Q for multi_h and multi_l.

> +		if (vco != vco_out)
> +			continue;
> +
> +		if (pll1 && pll2 && pll3) {
> +			*pll1 = HM1246_PLL1CFG_MULTIPLIER(multi_l - 1);
> +			*pll2 = HM1246_PLL2CFG_PRE_DIV(div - 1) |
> +				HM1246_PLL2CFG_MULTIPLIER(multi_h - 2);
> +			*pll3 = HM1246_PLL3CFG_POST_DIV(post_div_index) |
> +				HM1246_PLL3CFG_SYSCLK_DIV(sysclk_div_index) |
> +				HM1246_PLL3CFG_PCLK_DIV(pclk_div_index);
> +		}
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}

...

> +static int hm1246_cci_write_pll(struct hm1246 *hm1246, u8 pll1, u8 pll2,
> +				u8 pll3)

I believe we can leave a prototype to be on a single line.

> +{
> +	const struct cci_reg_sequence pll_regs[] = {
> +		{ HM1246_PLL1CFG_REG, pll1 },
> +		{ HM1246_PLL2CFG_REG, pll2 },
> +		{ HM1246_PLL3CFG_REG, pll3 },
> +		{ HM1246_SBC_CTRL_REG, HM1246_SBC_CTRL_PLL_EN },
> +	};
> +
> +	return cci_multi_reg_write(hm1246->regmap, pll_regs,
> +				   ARRAY_SIZE(pll_regs), NULL);
> +}

...

> +static int hm1246_cci_write_test_pattern(struct hm1246 *hm1246, u8 mode, u16 r,
> +					 u16 g, u16 b)

More logical is to have them as

static int hm1246_cci_write_test_pattern(struct hm1246 *hm1246, u8 mode,
					 u16 r, u16 g, u16 b)

> +{
> +	const struct cci_reg_sequence tpg_enable_regs[] = {
> +		{ HM1246_TEST_DATA_RED_REG, r },
> +		{ HM1246_TEST_DATA_GR_REG, g },
> +		{ HM1246_TEST_DATA_GB_REG, g },
> +		{ HM1246_TEST_DATA_BLUE_REG, b },
> +		{ HM1246_TEST_PATTERN_MODE_REG, mode },
> +	};
> +
> +	return cci_multi_reg_write(hm1246->regmap, tpg_enable_regs,
> +				   ARRAY_SIZE(tpg_enable_regs), NULL);
> +}

...

> +static int hm1246_test_pattern(struct hm1246 *hm1246, u32 index)
> +{
> +	const u16 RGBMIN = 0, RGBMAX = 0x3ff;
> +	const struct tp {
> +		int pattern;
> +		u16 r, g, b;

static const ... ?

> +	} tps[] = {
> +		/* Disabled */
> +		[0] = { .pattern = 0, .r = RGBMIN, .g = RGBMIN, .b = RGBMIN },
> +		/* Checkboard pattern */
> +		[1] = { .pattern = 0, .r = RGBMIN, .g = RGBMIN, .b = RGBMIN },
> +		/* Ramp */
> +		[2] = { .pattern = 1, .r = RGBMIN, .g = RGBMIN, .b = RGBMIN },
> +		/* Moving ones */
> +		[3] = { .pattern = 2, .r = RGBMIN, .g = RGBMIN, .b = RGBMIN },
> +		/* Blending color bars */
> +		[4] = { .pattern = 3, .r = RGBMIN, .g = RGBMIN, .b = RGBMIN },
> +		/* Color bars */
> +		[5] = { .pattern = 4, .r = RGBMIN, .g = RGBMIN, .b = RGBMIN },
> +		/* Solid white */
> +		[6] = { .pattern = 15, .r = RGBMAX, .g = RGBMAX, .b = RGBMAX },
> +		/* Solid black */
> +		[7] = { .pattern = 15, .r = RGBMIN, .g = RGBMIN, .b = RGBMIN },
> +		/* Solid red */
> +		[8] = { .pattern = 15, .r = RGBMAX, .g = RGBMIN, .b = RGBMIN },
> +		/* Solid green */
> +		[9] = { .pattern = 15, .r = RGBMIN, .g = RGBMAX, .b = RGBMIN },
> +		/* Solid blue */
> +		[10] = { .pattern = 15, .r = RGBMIN, .g = RGBMIN, .b = RGBMAX },
> +	};
> +	u8 mode;
> +
> +	if (index >= ARRAY_SIZE(tps))
> +		return -EINVAL;
> +
> +	mode = HM1246_TEST_PATTERN_MODE_MODE(tps[index].pattern);
> +	if (index)
> +		mode |= HM1246_TEST_PATTERN_MODE_ENABLE;
> +
> +	return hm1246_cci_write_test_pattern(hm1246, mode, tps[index].r,
> +					     tps[index].g, tps[index].b);
> +}

...

> +static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct hm1246 *hm1246 =
> +		container_of_const(ctrl->handler, struct hm1246, ctrls);
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *format;
> +	u32 val;
> +	bool needs_cmu_update = true;

> +	int ret = 0;

The assignments like this is fragile. Better to decouple and put it near to the first user.

> +	state = v4l2_subdev_get_locked_active_state(&hm1246->sd);
> +	format = v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		s64 exposure_max;
> +
> +		exposure_max =
> +			format->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;
> +		ret = __v4l2_ctrl_modify_range(hm1246->exposure_ctrl,
> +					       hm1246->exposure_ctrl->minimum,
> +					       exposure_max,
> +					       hm1246->exposure_ctrl->step,
> +					       exposure_max);
> +
> +		if (ret) {

What if this is changed to return something positive? Or what if we will ignore
one of the error code in the future for some reason?

These questions are to justify the idea of decoupling the above assignment.

> +			dev_err(hm1246->dev, "exposure ctrl range update failed\n");
> +			return ret;
> +		}
> +	}

> +	if (!pm_runtime_get_if_active(hm1246->dev))
> +		return 0;

Wondering if we can use one of PM_ACQUIRE() macros here.

	ret = 0;

> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(hm1246->regmap, HM1246_COARSE_INTG_REG, ctrl->val,
> +			  &ret);
> +		break;
> +
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(hm1246->regmap, HM1246_ANALOG_GLOBAL_GAIN_REG,
> +			  ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_VBLANK:
> +		val = format->height + ctrl->val;
> +		cci_write(hm1246->regmap, HM1246_FRAME_LENGTH_LINES_REG, val,
> +			  &ret);
> +		break;
> +
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		val = 0;
> +		if (hm1246->hflip_ctrl->val)
> +			val |= HM1246_IMAGE_ORIENTATION_HFLIP;
> +		if (hm1246->vflip_ctrl->val)
> +			val |= HM1246_IMAGE_ORIENTATION_VFLIP;
> +
> +		cci_write(hm1246->regmap, HM1246_IMAGE_ORIENTATION_REG, val,
> +			  &ret);
> +		break;
> +
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = hm1246_test_pattern(hm1246, ctrl->val);
> +		needs_cmu_update = false;
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		needs_cmu_update = false;
> +		break;
> +	}
> +
> +	if (needs_cmu_update)
> +		cci_write(hm1246->regmap, HM1246_CMU_UPDATE_REG, 0, &ret);
> +
> +	pm_runtime_put(hm1246->dev);
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko



