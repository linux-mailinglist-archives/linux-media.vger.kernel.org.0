Return-Path: <linux-media+bounces-48374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA59CAC69B
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 08:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B90A30443F2
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 07:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A442D2491;
	Mon,  8 Dec 2025 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ML/ED5yS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D302144C7;
	Mon,  8 Dec 2025 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765180088; cv=none; b=mytMrNxvNWB8kXqVh+H5oPDhdYtTDCLpdxVuFPbhskIJDqjfrOzcggEJV+LhNA5XUg1nsVhA3KRSuwdQoF2ObyyEnxZfcx6pOT69UrRMuAp3z6GUEIoPBFFsThbaUMv7qpCTVBeJ921V3AsXJqbfT3s4vH/JBZJn7mlJ/USWCGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765180088; c=relaxed/simple;
	bh=NYVFNOko20ZKjCy5hLRSJwzR4+elsskHhVYbA9BLX7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAbpwAzV22tZeYnF2/BZuvhEFOmuQ2uDQ+NZdr97ruRUOhSbjyA/0SnjfLEXCW/ONOf7e4XcTRJLwSW4Qm2B0cXuU497meXjhJasUOavHoTeMrCd3FEu7QCL5k2C8VjDLMGfc1sDJbB7sU0Dvh8ZLgaGGB0TFxCamN+Bc8WDsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ML/ED5yS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18EB42E0;
	Mon,  8 Dec 2025 08:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765179945;
	bh=NYVFNOko20ZKjCy5hLRSJwzR4+elsskHhVYbA9BLX7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ML/ED5ySNfMiotZFVu6GRFBIhrmJbXhIWMYXGwDPXL18yNtxnQlTL9DIS0CPLZo0e
	 d9oVtZcqEuRcH1O1RTqgMcfgGRGOqiwXEg8gKhfGeZ8cMuwpTTxEVW1tTdoW96c0DQ
	 l2SEdWBZm/lrVql2UWopQaCZ8R0VlaVax8gxZPYA=
Message-ID: <e73cba30-78e8-42a0-931b-ea2939d53c38@ideasonboard.com>
Date: Mon, 8 Dec 2025 07:48:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for
 DSM method
To: Hao Yao <hao.yao@intel.com>, platform-driver-x86@vger.kernel.org,
 johannes.goede@oss.qualcomm.com, sakari.ailus@linux.intel.com,
 ilpo.jarvinen@linux.intel.com
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251208035122.2147678-1-hao.yao@intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251208035122.2147678-1-hao.yao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Hao, thanks for the patch

On 08/12/2025 03:51, Hao Yao wrote:
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

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 9e052b164a1a..c834fd59ec0c 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
>   	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>   		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>   
> +/*
> + * The PCH clock frequency argument to the _DSM method:
> + * PCH_CLK_FREQ_19M2 = 19.2MHz (default)
> + * PCH_CLK_FREQ_24M = 24MHz
> + */
> +#define PCH_CLK_FREQ_19M2	1
> +#define PCH_CLK_FREQ_24M	3
> +
>   static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
>   {
>   	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
>   	union acpi_object args[3];
>   	union acpi_object argv4;
> +	u32 dsm_freq_arg;
>   
>   	if (clk->ena_gpio) {
>   		gpiod_set_value_cansleep(clk->ena_gpio, enable);
>   		return;
>   	}
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
>   	args[0].integer.type = ACPI_TYPE_INTEGER;
>   	args[0].integer.value = clk->imgclk_index;
>   	args[1].integer.type = ACPI_TYPE_INTEGER;
>   	args[1].integer.value = enable;
>   	args[2].integer.type = ACPI_TYPE_INTEGER;
> -	args[2].integer.value = 1;
> +	args[2].integer.value = dsm_freq_arg;
>   
>   	argv4.type = ACPI_TYPE_PACKAGE;
>   	argv4.package.count = 3;


