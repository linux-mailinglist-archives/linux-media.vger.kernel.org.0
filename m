Return-Path: <linux-media+bounces-48315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04800CA7E74
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 15:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48EF8318D17E
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 10:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FEA278E63;
	Fri,  5 Dec 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAPuSSs3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961CB301464;
	Fri,  5 Dec 2025 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929956; cv=none; b=UHRzxE6zCfFDGO+NzV6eghBemKrER/8/env0npUi9JVRhmEbZcs51X9RK7Ul8PpNh2ptVLUFCISxPEHMLXD+7sTZ7sWEmaB22wqMrKFRj7RRyHOLlkugtknzPrnHMTdmnB//NXTSzvP7TvHZNTjD+zJDcMWu5pIuRe+19JPQnEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929956; c=relaxed/simple;
	bh=D/Doo3abSR1DIEzTfe4U7Cnrr7n0KQebGwLKQh5/+24=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YuuEl0gHlaXOnbti3h1cifHoIyc0eCh6+gAFaK6X8geaWzrGdXn0Iw4i4z0G7rj3owkSdpyos6BVV2BpngwQqo3IjIAlpmDhNfMdXFRuHi4OduGPF9VpaqlFEI5hbzJBtTnzaYiVZ2MJN6MXqCWkIZ8fFf4g6ZW+w7eFgKSvjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAPuSSs3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764929950; x=1796465950;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=D/Doo3abSR1DIEzTfe4U7Cnrr7n0KQebGwLKQh5/+24=;
  b=WAPuSSs31qikcsJdocUY313AXXnKnSp4rOR9pUpnQRtDGPhw2s5z470N
   jjypc7cJ+3PIe9uR2knTSyfPPHz+HMwpVycqK/Qrbsi2crizIN9L68Rc1
   14kHZUjt/Uk/wAOJycgO+sscquKKFBrjZKoEBqB65d8T5bNi4H06abJ5U
   Wyh+o79tdLhMNq1WlQSbkt8PAyu8DuVdt8ynWTwkxiL0M8UPlWZNRcjYG
   YkIG7y8tAT/E6MMbpHSdFe0MP2JXA55Gl2ge/wvN9qCtBM91EAcPRACmQ
   kDxU/8tZ/W+mhsR/QN1GVtRrft03zwRRAhz54O3GpyMoT8dgKUFwfCyis
   A==;
X-CSE-ConnectionGUID: BJm6glBHT+ubILt7t1C6Aw==
X-CSE-MsgGUID: DCBhQInHSeaAa6Z2zhmz3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78427484"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="78427484"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 02:19:03 -0800
X-CSE-ConnectionGUID: L7q2jMhuS+O7IOo27Ng83w==
X-CSE-MsgGUID: 0w6DkOz3TBaIEE5COFTxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="200386249"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 02:19:01 -0800
Subject: Re: [PATCH] platform/x86: int3472: Use actual clock frequency for DSM
 method
To: Hao Yao <hao.yao@intel.com>, platform-driver-x86@vger.kernel.org,
 hdegoede@redhat.com, dan.scally@ideasonboard.com,
 sakari.ailus@linux.intel.com, ilpo.jarvinen@linux.intel.com
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251205095525.1264971-1-hao.yao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>
Date: Fri, 5 Dec 2025 18:10:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251205095525.1264971-1-hao.yao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hao,

Thanks for the patch.

On 12/5/25 5:51 PM, Hao Yao wrote:
> The third argument (args[2]) to the _DSM method was hardcoded to 1,
> which corresponds to 19.2MHz. However, this argument should reflect
> the actual clock frequency from the sensor's ACPI data.
> 
> According to the DSM specification:
> - 1 = 19.2MHz
> - 3 = 24MHz
>

What are the value 0 and 2? I think there are other frequencies.

> Read the frequency from clk->frequency and set the DSM argument
> accordingly, with 19.2MHz as the default for unsupported frequencies.
> 
> This ensures the sensor receives the correct clock frequency as
> specified in its ACPI configuration.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> ---
>  .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 9e052b164a1a..0502876284ee 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
>  	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>  		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>  
> +/*
> + * The PCH clock frequency argument to the _DSM method:
> + * PCH_CLK_FREQ_19M = 19.2MHz (default)
> + * PCH_CLK_FREQ_24M = 24MHz
> + */
> +#define PCH_CLK_FREQ_19M	1

I like 19P2MHZ.

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
> +		dsm_freq_arg = PCH_CLK_FREQ_19M;
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
Best regards,
Bingbu Cao

