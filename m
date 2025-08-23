Return-Path: <linux-media+bounces-40825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0BAB3299F
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 17:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC09B7B5C02
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 15:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A442E7F39;
	Sat, 23 Aug 2025 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H68xi/cK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE445AD4B;
	Sat, 23 Aug 2025 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755963283; cv=none; b=gViyC0Nqmq6wGxEPAH19A35TwAKXVA0zEmAVv9cnv/40hSW8IxoU12CxvAfbVq9MGOKMMUKpq9oO1D19x/1oKvA5UWP+6XQnt/zQKAI5XtVsO7I04MuEdjVVL/j0D/jGCFbzmMaGRsh84z3H4ZIZApg7axmg4IvFEKcOGR8uMdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755963283; c=relaxed/simple;
	bh=smODDh1I/z4J2Rz0rLaPqbEcVncrApWFPaGQeDaybjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7dcCfm9bWsCkkeIfhKveMBZW6hn6/txU3DKPx2Ja2Dll46LXbEj9j5RTWzSt/+w7Te5D9aNxHgeqXwq9bkpcSbaEjgZLUtgKV7AcW/euLv2BMWfatqtb0gw08r5GDc18DQjuRnxWAAmVPj2rtwuWsuUpW0BxbtfvsBAndGPgb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H68xi/cK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD388C4CEE7;
	Sat, 23 Aug 2025 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755963281;
	bh=smODDh1I/z4J2Rz0rLaPqbEcVncrApWFPaGQeDaybjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H68xi/cKhBaNbSn/ZOW6Wo/FFNehEUDv98PfTVU5mUiq3GasDvK9gQkc/zhhBjaQF
	 A8QhYjzztd/r4jKdTFaCZ3rzrMVhQkQ0SzcXzouQVQS/3rETl9+UPejA4TwEccOSBI
	 uOl2pypBhSjXPB25TqVKpMbPZ6WQYMj2G4NqWDkbzVfTLlSqwsvrnh9fFtYrEtdwMb
	 CDDmwCy5bVTQQDecmzm7QvinpKPBiaIQd15O3gM3uxGdMHbySOIr8SJAZLPHFqZe0X
	 damgraVk4TVTCUU6i2Ar4RaphxfVwFUoNxHw8KnOusSyX4UGvqnfAR9YIgh5v57Drd
	 RkfORTa2xtaZA==
Message-ID: <4af38093-007e-4bfc-8439-0c3dc84012d8@kernel.org>
Date: Sat, 23 Aug 2025 17:34:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] media: fsd-csis: Add support for FSD CSIS DMA
To: Inbaraj E <inbaraj.e@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
 ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1@epcas5p1.samsung.com>
 <20250814140943.22531-13-inbaraj.e@samsung.com>
 <b1f59033-12d0-4395-85f1-e296a5dbca5f@kernel.org>
 <00e301dc1424$033ed5a0$09bc80e0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <00e301dc1424$033ed5a0$09bc80e0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/08/2025 13:49, Inbaraj E wrote:
>>
>>> +
>>> +	ret = fsd_csis_clk_get(csis);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	pm_runtime_enable(dev);
>>> +	if (!pm_runtime_enabled(dev)) {
>>
>> That's odd code. Why?
>>
>>> +		ret = fsd_csis_runtime_resume(dev);
>>
>> Even more questions why?
> 
> If CONFIG_PM is enabled, the clocks are enabled manually in the
> driver through fsd_csis_runtime_resume API.
> 
> If CONFIG_PM is enabled, the clocks are managed through the PM
> runtime framework.
> 
> Can you please help me understand what wrong here?

I think I see such code for the first time, so wrong is doing something
common in completely unusual way.

> 
>>
>>> +		if (ret < 0)
>>> +			return ret;
>>> +	}
>>> +
>>> +	platform_set_drvdata(pdev, csis);
>>> +
>>> +	ret = fsd_csis_enable_pll(csis);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = fsd_csis_media_init(csis);
>>> +	if (ret)
>>> +		return ret;
>>
>> I think you miss clean up of csis->pll completely. Just use
>> devm_clk_get_enabled and convert everything here to devm.
>>
>>
> 
> I'll fix in next patchset.
> 
>>> +
>>> +	ret = fsd_csis_async_register(csis);
>>> +	if (ret)
>>> +		goto err_media_cleanup;
>>> +
>>> +	return 0;
>>> +
>>> +err_media_cleanup:
>>> +	fsd_csis_media_cleanup(csis);
>>
>> Also this...
>>
> 
> if fsd_csis_media_init fails, the cleanup is handled internally.

What does it mean internally?

> Here, cleanup is used only for fsd_csis_async_register failure.
> 
> can you please help me understand what is wrong here?

Yeah, you leak clock resources.



Best regards,
Krzysztof

