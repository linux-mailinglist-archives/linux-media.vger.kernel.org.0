Return-Path: <linux-media+bounces-37466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F41EB01764
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C753ADBCB
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0484B262FC0;
	Fri, 11 Jul 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0tlGUE4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D601265CA2
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752225262; cv=none; b=EZlsywaZbX9fvLYETiDI6hRRha+zmtRClJcXObe/IifeIKpx1JsDnHcq5e0GXeY90qeTn6sU2DZOnmQDLWnGQ1PkSC108vcrmVhGprMEZJhRwYDs3Y8m9hFNHexoTQVvnhsoi/eoCnO8E6ykxnOItEkYDUs0JHI8js0cWx1qtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752225262; c=relaxed/simple;
	bh=HEY3+a6Na11WJGgaFcXW+Lx7J/dYzicZ2lW2cEvHFm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4eqqdRRa45Rw816SFLFVtla8c6nLATU0AoUxdS1eSStZ6cLqSbwDXhvnvMU5BHzxG7YGRXiWjFJQP8vY3d9I2ZWjIg0Cr0HtHwRexBpMBE1S0XYzByHTAhy3s6s3VHWy9bTlWcLgwnFODyO4ALJ7Y+vaVTmDHbEFCJfzMSgTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0tlGUE4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1881022f8f.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752225258; x=1752830058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zveXDkGflW/W206j1WhNPQvT6C+QoRFQ6e1mLG+GAL4=;
        b=P0tlGUE4Kmy6/NiyV11IMWJObCyer4WFAe/jLq9LWujHcp0JirSXcnlXnJisjDbY9H
         3gDwwNEO2a8/FJLM898Pjjkj5Mh8TdiZicKF2nMVTPPBtHbWCueBZhKH3zg5k2l4L5tW
         LGFy/ZJarRMZYFRsXVs9TjL2Ck9eBi5ovD8ePeM7arb7OOxmjuLgCn3ngtcRKQh1Toel
         HFJn6fSPIDa5o6JoqfHOx5ciP5Uph+U0gc5NmouPvN4nkcSsz6X53I0bGIrkmN9OV4XY
         FxOLo3xhqJYiyZ0POorgV1V5thiYf+op5rQxowm8gdCwDU9mJabfl68bTl79aqX415gx
         aLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752225258; x=1752830058;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zveXDkGflW/W206j1WhNPQvT6C+QoRFQ6e1mLG+GAL4=;
        b=a2ZWBQWoIxbyXMGhDUp1oYNkPigHAGRW14+zH4KPui55HASCqQbeO1qkzBUfD9Bmgh
         tkHHjDduUX5n0mMCZVRb4EYSNV/WJxCs7IFaPwTKtz4vUVgupYsJ3L8qUaOOsHwQFAs/
         /ciS3/MrnH2Wwv3NprP89g5SX0lXLW9RTwHcuX6iJmUzQJAUTO2+hp8VUggbLwFxZGqA
         OoOb5/tMAi8qEG2OJ262wrhNCQkr7yxy6KwWMmnvFXdx4jDn9ePxr+HuOksIopx0s18t
         s4D02YAsynDArLALryQyG0ObDYtBbQVVgCpdNrLlJza4D1VbYnZiAWehbhkBnlTpD73Q
         Rcyg==
X-Forwarded-Encrypted: i=1; AJvYcCUuCs2mWpy2n9nT2mpvWLzjqCcGo0gRkE9+7beIfvMZsZ2LWlZn705VUqzlmmGDJCWC6WgPpOkOvbNAdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGrcrfjyboZ/QPZTuwJPcYneVr4C9bV/mi9fypl98t8olQBqI
	qtxdknLu4tyEaDx6rWPM0xbcy7ol/e81gzGXz54GZxFm5UTdYxpGR4wtEKx+UE5wNaY=
X-Gm-Gg: ASbGnctQEiH+SQ1goP4rMXHwemqzWXu0LT4+Nz/VlaCqyA+EUnTU4RApytRXcOqzn+y
	SX8RVvdDnzvZHTY4TPshvC59/CT0osgc4Kj81KIRBdscreR3as7HcAGPfroVvaxAxjD0di4fwZl
	G+WMt4bGHuJnd6BsQs1LhjozOaj+zuR/In+7lGAFAizx0/dpTgO/rUYNUMGeYJYsUFB5RvEuxjy
	b4Pr8QshySO20V4nvhwppFnRmg49LBi16RcJe8eRNC/hM0ChT+VRp0YZrHpWv6imijWZS+0m++0
	qFFiOGkUn3ti8SndIOubzU56CxJA6WDDdhQgVewzWAZIjIC5734wlZRtbDUfS9pRwh8vpe06baf
	HEdovIngzawL4LueGmM6mma8Kic/8UEvjytqyDfGcBeEw2bGNrVUY6K5X9aoEhw+l5DMJSCgyYA
	==
X-Google-Smtp-Source: AGHT+IE4wNMehan56/tf9ftQcw6oC1Kgo7xNHw/kaLYkC6XYBhBtLBBp0KJg69qX2zGHPIAKWIbRWw==
X-Received: by 2002:a5d:5f51:0:b0:3b5:e6bf:f86b with SMTP id ffacd0b85a97d-3b5e7f11908mr6482501f8f.11.1752225258413;
        Fri, 11 Jul 2025 02:14:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd55b068sm41340715e9.38.2025.07.11.02.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 02:14:17 -0700 (PDT)
Message-ID: <8377b6bf-8823-4bcc-aee1-af17db0fbfdf@linaro.org>
Date: Fri, 11 Jul 2025 10:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <895b931d-15a4-4922-b52f-6c6cf7fc6243@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <895b931d-15a4-4922-b52f-6c6cf7fc6243@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/07/2025 18:08, Konrad Dybcio wrote:
> On 7/10/25 6:16 PM, Bryan O'Donoghue wrote:
>> Add a new MIPI CSI2 driver in D-PHY mode initially. The entire set of
>> existing CAMSS CSI PHY init sequences are imported in order to save time
>> and effort in later patches.
>>
>> In-line with other PHY drivers the process node name is omitted from the
>> compat string while the soc name is included.
>>
>> At the moment we follow the assignment of lane positions - the bitmap of
>> physical input lanes to logical lane numbers as a linear list per the
>> existing DPHY @lanes data-member.
>>
>> This is fine for us in upstream since we also map the lanes contiguously
>> but, our hardware can support different lane mappings so we should in the
>> future extend out the DPHY structure to capture the mapping.
>>
>> The Qualcomm 3PH class of PHYs can do both D-PHY and C-PHY mode. For now only
>> D-PHY is supported.
>>
>> In porting some of the logic over from camss-csiphy*.c to here its also
>> possible to rationalise some of the code.
>>
>> In particular use of regulator_bulk and clk_bulk as well as dropping the
>> seemingly useless and unused interrupt handler.
>>
>> The PHY sequences and a lot of the logic that goes with them are well proven
>> in CAMSS and mature so the main thing to watch out for here is how to get
>> the right sequencing of regulators, clocks and register-writes.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
> 
> This is a good opporunity to refresh the code a bit

>> +}
>> +
>> +static irqreturn_t phy_qcom_mipi_csi2_isr(int irq, void *dev)
>> +{
>> +	const struct mipi_csi2phy_device *csi2phy = dev;
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	int i;
>> +
>> +	for (i = 0; i < 11; i++) {
>> +		int c = i + 22;
> 
> Please add some comments regarding these number choices
> 
>> +		u8 val = readl_relaxed(csi2phy->base +
>> +				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
>> +
>> +		writel_relaxed(val, csi2phy->base +
>> +			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
>> +	}
>> +
>> +	writel_relaxed(0x1, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
>> +	writel_relaxed(0x0, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 10));
> 
> No need for any delays?
> 
>> +
>> +	for (i = 22; i < 33; i++) {
> 
> Please provide some context here too
> 
>> +		writel_relaxed(0x0, csi2phy->base +
>> +			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, i));
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}

TBH I think I will just drop this function in v2.

If someone comes up with a good reason for this ISR on this generation 
of hardware they are free to submit a patch to eludicate why.

During bringup/debug of this - including when I was getting RX CRC 
errors on the CSIPHY due to lacking one of two clocks, I never saw this 
ISR fire once.

I didn't enumerate the callback and you're entirely right these fixed "i 
= 22; i < 33" is to put it politely "questionable".

Just in case this code is useful on some SoC I haven't tested in the 
CAMSS source, I've left well enough alone.

Happy to drop this in the PHY driver version though.

>> +
>> +/*
>> + * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
>> + *
>> + * Helper function to calculate settle count value. This is
>> + * based on the CSI2 T_hs_settle parameter which in turn
>> + * is calculated based on the CSI2 transmitter link frequency.
>> + *
>> + * Return settle count value or 0 if the CSI2 link frequency
>> + * is not available
>> + */
>> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>> +{
>> +	u32 ui; /* ps */
>> +	u32 timer_period; /* ps */
>> +	u32 t_hs_prepare_max; /* ps */
>> +	u32 t_hs_settle; /* ps */
> 
> picoseconds? you can suffix the variables with _ps
> 
> Also, a reverse-Christmas-tree sorting would be neat
> 
>> +	u8 settle_cnt;
>> +
>> +	if (link_freq <= 0)
>> +		return 0;
>> +
>> +	ui = div_u64(1000000000000LL, link_freq);
> 
> PSEC_PER_SEC
> 
>> +	ui /= 2;
>> +	t_hs_prepare_max = 85000 + 6 * ui;
>> +	t_hs_settle = t_hs_prepare_max;
>> +
>> +	timer_period = div_u64(1000000000000LL, timer_clk_rate);
> 
> ditto
> 
> [...]
> 
>> +	for (i = 0; i < array_size; i++, r++) {
>> +		switch (r->mipi_csi2phy_param_type) {
>> +		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
>> +			val = settle_cnt & 0xff;
>> +			break;
> 
> what about CSIPHY_SETTLE_CNT_HIGHER_BYTE?
> 
>> +		case CSIPHY_SKEW_CAL:
>> +			/* TODO: support application of skew from dt flag */
> 
> Why? What are these?

> +			continue;
>> +		case CSIPHY_DNP_PARAMS:
>> +			continue;
> 
> "do not program"? why are they in the tables then?

We try to import downstream init sequences, which themselves are 
sometimes 1:1 from the original Si testbenches unmodified, DNP_PARAMS 
come from those sequences.

I think the testbench/downstream idea here is to allow a series of 
delays and/or readback post write.

I'm certainly willing to drop anything not in the _current_ init 
sequence list.

>> +		default:
>> +			val = r->reg_data;
>> +			break;
>> +		}
>> +		writel_relaxed(val, csi2phy->base + r->reg_addr);
>> +		if (r->delay_us)
>> +			udelay(r->delay_us);
>> +	}
>> +}
>> +
>> +static bool phy_qcom_mipi_csi2_is_gen2(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +
>> +	return regs->generation == GEN2;
>> +}
> 
> You only used this once, I don't think it's very useful
> 
> [...]
> 
>> +
>> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>> +					   struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
>> +	u8 settle_cnt;
>> +	u8 val;
>> +	int i;
>> +
>> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
>> +
>> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>> +	for (i = 0; i < cfg->num_data_lanes; i++)
>> +		val |= BIT(lane_cfg->data[i].pos * 2);
>> +
>> +	writel_relaxed(val, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>> +
>> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>> +	writel_relaxed(val, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>> +
>> +	val = 0x02;
>> +	writel_relaxed(val, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 7));
>> +
>> +	val = 0x00;
> 
> Can we get some names for the magic (un)set bits?
> 
> [...]
> 
>> +static void
>> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
>> +				 struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +
>> +	writel_relaxed(0, csi2phy->base +
>> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>> +
>> +	writel_relaxed(0, csi2phy->base +
>> +			  CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
> 
> Does the former write need to complete before the latter?

One assumes so. All of this _relaxed() stuff is way too flaithiúlach for 
me. We tolerate it as legacy code in CAMSS but, you're right, I don't 
think its logical at all.

Dropped.

> 
>> +}
>> +
>> +static int phy_qcom_mipi_csi2_init(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +	return 0;
>> +}
>> +
>> +const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 = {
>> +	.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
>> +	.reset = phy_qcom_mipi_csi2_reset,
>> +	.lanes_enable = phy_qcom_mipi_csi2_lanes_enable,
>> +	.lanes_disable = phy_qcom_mipi_csi2_lanes_disable,
>> +	.isr = phy_qcom_mipi_csi2_isr,
>> +	.init = phy_qcom_mipi_csi2_init,
> 
> You're never calling init(), remove it. If you need it in the future,
> make it non-obligatory so that you don't need the above stub
> 

y

>> +};
>> +
>> +const struct mipi_csi2phy_clk_freq zero = { 0 };
> 
> 'zero' is a terrible global variable name

ah, I forgot to make these static.

> 
>> +
>> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy = {
>> +	.freq = {
>> +		300000000, 400000000, 480000000
>> +	},
>> +	.num_freq = 3,
>> +};
>> +
>> +const struct mipi_csi2phy_clk_freq dphy_4nm_x1e_csiphy_timer = {
>> +	.freq = {
>> +		266666667, 400000000
>> +	},
>> +	.num_freq = 2,
>> +};
> 
> These operating points *require* different RPMh levels, let's
> grab them from an OPP table and do the ratesetting through the
> related APIs

You're right.

I'll also add regulator_set_load() in v2.

> 
>> +
>> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>> +	.reg_info = {
>> +		.init_seq = lane_regs_x1e80100,
>> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>> +		.offset = 0x1000,
> 
> common_regs_offset
> 
>> +		.generation = GEN2,
>> +	},
>> +	.supply_names = (const char *[]){
>> +		"vdda-0p8",
>> +		"vdda-1p2"
>> +	},
>> +	.num_supplies = 2,
>> +	.clk_names = (const char *[]) {
>> +		"camnoc_axi",
>> +		"cpas_ahb",
>> +		"csiphy",
>> +		"csiphy_timer"
>> +	},
>> +	.num_clk = 4,
>> +	.clk_freq = {
>> +		zero,
>> +		zero,
>> +		dphy_4nm_x1e_csiphy,
>> +		dphy_4nm_x1e_csiphy_timer,
> 
> Throw the ratesetting clocks into opp_config and grab the rest
> through clk_bulk_get_all()
> 
>> +	},
>> +};
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..1def2d1258d9dd3835c09c6804e08dfffc184248
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -0,0 +1,281 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025, Linaro Ltd.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/phy/phy-mipi-dphy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>> +#include <linux/slab.h>
>> +
>> +#include "phy-qcom-mipi-csi2.h"
>> +
>> +#define CAMSS_CLOCK_MARGIN_NUMERATOR 105
>> +#define CAMSS_CLOCK_MARGIN_DENOMINATOR 100
>> +
>> +static inline void phy_qcom_mipi_csi2_add_clock_margin(u64 *rate)
>> +{
>> +	*rate *= CAMSS_CLOCK_MARGIN_NUMERATOR;
>> +	*rate = div_u64(*rate, CAMSS_CLOCK_MARGIN_DENOMINATOR);
>> +}
> 
> I can't find downstream doing that

Inherited from CAMSS where it really does something useful.

I'm relucant to change this... I'll try it though.

> 
> [...]
> 
>> +	/*
>> +	 * phy_configure_opts_mipi_dphy.lanes starts from zero to
>> +	 * the maximum number of enabled lanes.
>> +	 *
>> +	 * TODO: add support for bitmask of enabled lanes and polarities
>> +	 * of those lanes to the phy_configure_opts_mipi_dphy struct.
>> +	 * For now take the polarities as zero and the position as fixed
>> +	 * this is fine as no current upstream implementation maps otherwise.
>> +	 */
> 
> Can we at least grab the data and make sure it matches the
> default hw configuration now, so that we won't break bad
> DTs in the future?

Hmm. I'll have a think about that.

---
bod

