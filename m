Return-Path: <linux-media+bounces-49637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A48CE6A23
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4406300725C
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 12:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0CD30F7ED;
	Mon, 29 Dec 2025 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyQ5L257"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140E03093C1;
	Mon, 29 Dec 2025 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010024; cv=none; b=H6L7TbktDj1NKeqeLxLV5K65s89M1ZO+CfsnlwYmGiJHUT6F3wQ9u/BWXHpPJQk97T3aHIbCy2YNs6b7jIeV1WRhnD+AdzhVX+8gvdezFIHQIXNFrEndytfr9X+Ue9HwaC9ElQEiUIdf2pk6NysxrbDEBvF/ksdhWmMVt8s+f5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010024; c=relaxed/simple;
	bh=djGAZCGPkMtMBCZL0Y9WLhNkfKxHa5hTXeAeT8+cIus=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E+4tcnIWXpLpfE2jWuIJD3hiOt3BNptXpGCNTfTFky5pz8c69To8FBShP5Mjo9oc/E+psGogAOqRMe/cnsf9sOS9eUwVCG0lLJvBZ5bbdzLLtlcnhpcCz+h9C6AQOXm+2LWMcH62kYn2RynAfUzhKBLOn02IP+MIJzYvxMchHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyQ5L257; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767010023; x=1798546023;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=djGAZCGPkMtMBCZL0Y9WLhNkfKxHa5hTXeAeT8+cIus=;
  b=LyQ5L257KDFmKv2LFlEUVO0RJnR41/eJDrk5jYSo2Cx0ozPwesEoXzrZ
   5d6cFbVDdP8Ov8q4zFf8U+Y54MLAt+lU/y8c9kxBxjd3Sp1eUvpgCaE9d
   3ydU43HKCFxnDHe6BuQUNvCa2t0/Ct7+E/a3lphWndopiJxAdH7wB0iDO
   fPOJ/btxy8t74XP3LHMQOjfOGORDdzfsg0qksfazi7XY28W0Aqjiip98a
   beK+bLQfn2jNX7bHc/cY2zzTNKTDHFIyLtsincsp8SpaFQdMG+gXp0Nsj
   ve/OMfu9lMMjSwqzmkUC14lgvXLBJzAlXQl7Re9C3c1qK3r87Jq5s2C9A
   w==;
X-CSE-ConnectionGUID: g7lfaFM6QSeT2GzZEQHkTg==
X-CSE-MsgGUID: zCn0ZuepR66Mm9b190VMMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79346442"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="79346442"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:07:02 -0800
X-CSE-ConnectionGUID: q9Ss8luHQ6+v0fsObBOszw==
X-CSE-MsgGUID: /ue0yfYuT9e+MRx0/+68jg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:06:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 14:06:55 +0200 (EET)
To: Hao Yao <hao.yao@intel.com>
cc: platform-driver-x86@vger.kernel.org, johannes.goede@oss.qualcomm.com, 
    dan.scally@ideasonboard.com, sakari.ailus@linux.intel.com, 
    bingbu.cao@intel.com, linux-media@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency
 for DSM method
In-Reply-To: <20251208035122.2147678-1-hao.yao@intel.com>
Message-ID: <e66e29a3-f534-64a8-67cb-79f93e9d1f10@linux.intel.com>
References: <20251208035122.2147678-1-hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Dec 2025, Hao Yao wrote:

> The third argument (args[2]) to the _DSM method was hardcoded to 1,
> which corresponds to 19.2MHz. However, this argument should reflect
> the actual clock frequency from the sensor's ACPI data.
> 
> According to the DSM specification:
> - 1 = 19.2MHz
> - 3 = 24MHz
> 
> Read the frequency from clk->frequency and set the DSM argument
> accordingly, with 19.2MHz as the default for unsupported frequencies.
> 
> This ensures the sensor receives the correct clock frequency as
> specified in its ACPI configuration.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>

Should this have a Fixes tag?

Could you please also mention what you discovered about values 0 and 2 in 
the changelog as it seems useful information (I requested this in v1).

> ---
>  .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 9e052b164a1a..c834fd59ec0c 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
>  	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>  		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>  
> +/*
> + * The PCH clock frequency argument to the _DSM method:
> + * PCH_CLK_FREQ_19M2 = 19.2MHz (default)
> + * PCH_CLK_FREQ_24M = 24MHz
> + */
> +#define PCH_CLK_FREQ_19M2	1
> +#define PCH_CLK_FREQ_24M	3
> +
>  static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
>  {
>  	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
>  	union acpi_object args[3];
>  	union acpi_object argv4;
> +	u32 dsm_freq_arg;
>  
>  	if (clk->ena_gpio) {
>  		gpiod_set_value_cansleep(clk->ena_gpio, enable);
>  		return;
>  	}
>  
> +	switch (clk->frequency) {
> +	case 24000000:
> +		dsm_freq_arg = PCH_CLK_FREQ_24M;
> +		break;
> +	case 19200000:
> +	default:
> +		dsm_freq_arg = PCH_CLK_FREQ_19M2;
> +		break;
> +	}
> +
>  	args[0].integer.type = ACPI_TYPE_INTEGER;
>  	args[0].integer.value = clk->imgclk_index;
>  	args[1].integer.type = ACPI_TYPE_INTEGER;
>  	args[1].integer.value = enable;
>  	args[2].integer.type = ACPI_TYPE_INTEGER;
> -	args[2].integer.value = 1;
> +	args[2].integer.value = dsm_freq_arg;
>  
>  	argv4.type = ACPI_TYPE_PACKAGE;
>  	argv4.package.count = 3;
> 


-- 
 i.



