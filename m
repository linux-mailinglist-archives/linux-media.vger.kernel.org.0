Return-Path: <linux-media+bounces-49364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E4CD69F6
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 16:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F1C9303E658
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6E332E73A;
	Mon, 22 Dec 2025 15:58:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F962F5A1A;
	Mon, 22 Dec 2025 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766419115; cv=none; b=aJzbekxv/pDx3fQKiwA4qT8utIOcMgza9hb0PlJq2/O6S0G7300AEMqUl3ZnPVqNUsrHinQTRsY9/v7A1hQp8y2m0uZ+EuArN6OSNhkQsjHcc5CVxKqPSnH2lqrPyfbJy9EQC/rWnOYCFg0I7kyr3PulpSgytOE+3geeDr0eTyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766419115; c=relaxed/simple;
	bh=4Eyi1XCJR2o5oHhhd0q+Room2L5HIYQbwQptxErVMsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7I75eyfgtsgJxEn54eh4S2kr2xlF1c4+bvtF5n2Bl0aSVUbwtccX/Vot922y9/2wUTnh7Kb04zgaFeSphDAeNtpFQzF56LOeYmCsxj1rWELF7aWYal8hptruGse7x/j/IsNgYJbYgB5YIJpx0QKChwd5OP2wY8QgVI8ylAeRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id 3E27210E2A85;
	Mon, 22 Dec 2025 16:58:28 +0100 (CET)
Message-ID: <19848593-4879-46fa-8969-d34c2fc511ed@emfend.at>
Date: Mon, 22 Dec 2025 16:58:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] media: i2c: add Himax HM1246 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
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
References: <20251202-hm1246-v6-0-3e96ed6b3ffa@emfend.at>
 <20251202-hm1246-v6-2-3e96ed6b3ffa@emfend.at>
 <aUXRsv-r9-sQvpAm@kekkonen.localdomain>
 <2c6c4b36-6b97-4260-8c01-6861b6f36cea@emfend.at>
 <20251222133018.GB5317@pendragon.ideasonboard.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20251222133018.GB5317@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

Am 22.12.2025 um 14:30 schrieb Laurent Pinchart:
> On Mon, Dec 22, 2025 at 12:17:56PM +0100, Matthias Fend wrote:
>> Am 19.12.2025 um 23:29 schrieb Sakari Ailus:
>>> Hi Matthias,
>>>
>>> Thanks for the update.
>>>
>>> On Tue, Dec 02, 2025 at 04:26:06PM +0100, Matthias Fend wrote:
>>>
>>> ...
>>>
>>>> +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_freq,
>>>> +			   u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)
>>>> +{
>>>> +	const u8 pclk_div_table[] = { 4, 5, 6, 7, 8, 12, 14, 16 };
>>>> +	const u8 sysclk_div_table[] = { 1, 2, 3, 4 };
>>>> +	const u8 post_div_table[] = { 1, 2, 4, 8 };
>>>> +	const int sysclk_pclk_ratio = 3; /* Recommended value */
>>>> +	u32 pclk, vco_out, best_vco_diff;
>>>> +	int pclk_div_index, sysclk_div_index, post_div_index;
>>>> +	u8 pre_div = 0, multiplier_h = 0, multiplier_l = 0;
>>>> +	bool sysclk_pclk_ratio_found = false;
>>>> +
>>>> +	if (link_freq < HM1246_PCLK_MIN || link_freq > HM1246_PCLK_MAX)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/*
>>>> +	 * In raw mode (1 pixel per clock) the pixel clock is internally
>>>> +	 * divided by two.
>>>> +	 */
>>>> +	pclk = 2 * link_freq / clocks_per_pixel;
>>>> +
>>>> +	/* Find suitable PCLK and SYSCLK dividers. */
>>>> +	for (pclk_div_index = 0; pclk_div_index < ARRAY_SIZE(pclk_div_table);
>>>> +	     pclk_div_index++) {
>>>> +		for (sysclk_div_index = 0;
>>>> +		     sysclk_div_index < ARRAY_SIZE(sysclk_div_table);
>>>> +		     sysclk_div_index++) {
>>>> +			if (sysclk_div_table[sysclk_div_index] *
>>>> +				    sysclk_pclk_ratio ==
>>>> +			    pclk_div_table[pclk_div_index]) {
>>>> +				sysclk_pclk_ratio_found = true;
>>>> +				break;
>>>> +			}
>>>> +		}
>>>> +		if (sysclk_pclk_ratio_found)
>>>> +			break;
>>>> +	}
>>>> +
>>>> +	if (!sysclk_pclk_ratio_found)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* Determine an appropriate post divider. */
>>>> +	for (post_div_index = 0; post_div_index < ARRAY_SIZE(post_div_table);
>>>> +	     post_div_index++) {
>>>> +		vco_out = pclk * pclk_div_table[pclk_div_index] *
>>>> +			  post_div_table[post_div_index];
>>>> +
>>>> +		if (vco_out >= HM1246_PLL_VCO_MIN &&
>>>> +		    vco_out <= HM1246_PLL_VCO_MAX)
>>>> +			break;
>>>> +	}
>>>> +	if (post_div_index >= ARRAY_SIZE(post_div_table))
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* Find best pre-divider and multiplier values. */
>>>> +	best_vco_diff = U32_MAX;
>>>> +	for (u32 div = DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_MAX);
>>>> +	     div <= xclk / HM1246_PLL_INCLK_MIN; div++) {
>>>> +		u32 multi, multi_h, multi_l, vco, diff;
>>>> +
>>>> +		multi = DIV_ROUND_CLOSEST_ULL((u64)vco_out * div, xclk);
>>>> +		if (multi < HM1246_PLL_MULTI_MIN ||
>>>> +		    multi > HM1246_PLL_MULTI_MAX)
>>>> +			continue;
>>>> +
>>>> +		multi_h = multi / (HM1246_PLL_MULTI_H_MIN *
>>>> +				   HM1246_PLL_MULTI_L_MAX) +
>>>> +			  2;
>>>> +		multi_l = multi / multi_h;
>>>> +		vco = div_u64((u64)xclk * multi_h * multi_l, div);
>>>> +
>>>> +		diff = abs_diff(vco_out, vco);
>>>> +
>>>> +		if (diff < best_vco_diff) {
>>>> +			best_vco_diff = diff;
>>>> +			pre_div = div;
>>>> +			multiplier_h = multi_h;
>>>> +			multiplier_l = multi_l;
>>>> +		}
>>>> +
>>>> +		if (!diff)
>>>> +			break;
>>>> +	}
>>>> +
>>>> +	if (best_vco_diff == U32_MAX)
>>>> +		return -EINVAL;
>>>
>>> How much difference is acceptable? Isn't any difference a bug either in DT
>>> or the code above? In other words, I'd return an error in that case.
>>
>> Hard to tell, but almost every input clock will result in a slight
>> difference. Even the recommended reference register configuration
>> doesn't create a perfect match. Therefore, I don't think it's a good
>> idea to treat every deviation as an error.
> 
> I understand that the PLL won't be able to produce the exact nominal
> expected frequency, but can't we require the link-frequencies property
> in DT to match the PLL output exactly ? That's what we do with other
> sensors.

You mean that any link frequency (within the allowed range) can be 
specified in the device tree, which the PLL can generate exactly? The 
values ​​for the v4l2 controls V4L2_CID_PIXEL_RATE and 
V4L2_CID_LINK_FREQ are then also based on the DT link freuqency.

The recently added IMX111 does something similar. For many other 
sensors, the link frequencies are rather fixed.

Thanks
  ~Matthias

> 
>> However, every supported input frequency (6-27MHz) will result in a
>> pixel clock deviation of less than 0.5%. Since the sensor uses a
>> parallel interface, these frequencies will all work without any
>> problems. The frame timings may, of course, be slightly different.
>>
>> To change this and prevent any deviation, one would probably have to
>> replace the PLL calculation with one or more dedicated frequency-setup
>> pairs (with adjusted pixelclocks). Which wouldn't be ideal, as the
>> solution isn't very flexible - and I've invested quite a bit of effort
>> in the PLL calculation ;)
>>
>>>> +
>>>> +	*pll1 = HM1246_PLL1CFG_MULTIPLIER(multiplier_l - 1);
>>>> +	*pll2 = HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |
>>>> +		HM1246_PLL2CFG_MULTIPLIER(multiplier_h - 2);
>>>> +	*pll3 = HM1246_PLL3CFG_POST_DIV(post_div_index) |
>>>> +		HM1246_PLL3CFG_SYSCLK_DIV(sysclk_div_index) |
>>>> +		HM1246_PLL3CFG_PCLK_DIV(pclk_div_index);
>>>> +
>>>> +	return 0;
>>>> +}
> 


