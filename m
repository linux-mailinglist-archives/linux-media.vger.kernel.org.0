Return-Path: <linux-media+bounces-48358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C41CAAF27
	for <lists+linux-media@lfdr.de>; Sun, 07 Dec 2025 00:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6A613092428
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 23:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EB92E0922;
	Sat,  6 Dec 2025 23:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXuMvaw6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410AA2DF709;
	Sat,  6 Dec 2025 23:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062274; cv=none; b=qx6U4B7mBEfhXk8qqciz8QvZzsszKr/eJwsBa8R5arXK5qQp74o2Uqlc5ltSiq5/G0Uavhi2zHlnUbx3IE5J5Dk3/9EpmpkUK4c9/CNpU6iGYf75JkQvHES62inDSUF09oqHJe227HTwnwPPU0lHOnRfbG2P0pXTQ1qBgIO7jK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062274; c=relaxed/simple;
	bh=fyXSAHKpcwiMdlom9yTidcPI9JJI0PH70+EKzFSiJz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HF7RrIS+G20Y+oXEIC2BKwq6Uz5123NqnLrKaLEjwdCZQ7qI+sLBcpSZi1arkKKQKo9WXhO0+IXbR92OO8mkD1OeQ3EWNHBN6EAwa5jh5DNx0o856OWU9z1gcFKYsyEN8sjyx7T92Pd2JSLnSbroNOh2sxkkn7bMhOMD11v9M2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXuMvaw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C647FC113D0;
	Sat,  6 Dec 2025 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062273;
	bh=fyXSAHKpcwiMdlom9yTidcPI9JJI0PH70+EKzFSiJz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZXuMvaw6nESvRWxVAfxhsDCysQfS2D4pjW+7e3lZzfeT78G6zY7OMMzgVHvu9VCif
	 m1UkYyFwQ6L7sIDxMED8IUAX03rD7OQeui7/WpE4Xeat+5XE+hSt+rbGy5W7h+h2UX
	 WMXxSs1rVpMMsjzfrWsGId01/Li8x10fqjMa6a0sZhNm97S2PXroYBBnEjQmGfgCZ/
	 A91+q46Al5tAdCEMBqhxFVEaEZfF8J9jNjhP0DcWSAjYvJjnRVQ2GLR3GXAJY1J9GH
	 r9ggd5cvp3mtqd/TJ19EwcnB+IjZnw5+z4iVHhUA1rsGvx3fiEJ55rGL7gYnCnHPOB
	 HdgUYPDT08YJg==
Message-ID: <5a5908db-aa96-4cfa-a908-d393dd2d79c0@kernel.org>
Date: Sat, 6 Dec 2025 23:04:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
 <X5BA5y9fXZEHaAaGjdczRxdqFLVPrIv37Drl75z21uc4100UvnYAoEHzwGGyLGVGIv5NBDnu_Mn8rM8gSxCyNw==@protonmail.internalid>
 <20251107-knp_video-v3-6-50c86cbb0eb8@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251107-knp_video-v3-6-50c86cbb0eb8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2025 09:49, Vikash Garodia wrote:
> Add power sequence for vpu4 by reusing from previous generation wherever
> possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
> earlier generation wherever feasible, like clock calculation in this
> case.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---

> +static void iris_vpu4x_power_off_hardware(struct iris_core *core)
> +{
> +	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
> +	bool handshake_done, handshake_busy;
> +	u32 value, count = 0;
> +
> +	iris_vpu4x_genpd_set_hwmode(core, false, efuse_value);
> +
> +	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
> +		iris_vpu4x_power_off_apv(core);
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
> +
> +	if (!(value & CORE_PWR_ON))
> +		goto disable_clocks_and_power;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	if (value & CORE_CLK_HALT)
> +		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN, value,
> +			   value & VPU_IDLE_BITS, 2000, 20000);
> +
> +	do {
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		usleep_range(10, 20);
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done = value & NOC_LPI_STATUS_DONE;
> +		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		usleep_range(10, 20);
> +
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		dev_err(core->dev, "LPI handshake timeout\n");
> +
> +	writel(MVP_NOC_RESET_REQ_MASK, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
> +	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> +			   value, value == MVP_NOC_RESET_REQ_MASK, 200, 2000);

I realise it replicates what we already have upstream but...

if (!handshake_done && etc) is true then how does it make sense to 
continue on with the routine at all ?

We would expect the poll_timeout to timeout .. ?

If the documentation states loop 1000 times trying this then does it 
also say continue to try to power things off if that 1000 retries fails ?

I realise its a nit-pick but the logic seems a bit fluffy here. Could 
you tidy it up ?

Also now that I look at it - vpu2 and vpu3 both trap the timeout and 
jump to some kind of cleanup routine.

goto disable_power;

Why is that logic not being followed here ?

> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
> +	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
> +			   value, value == 0x0, 200, 2000);

Feels like there is little point in having a poll timeout if we throw 
away a timeout result code..

Not sure why you're changing up the logic from previous versions ?

---
bod

