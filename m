Return-Path: <linux-media+bounces-44032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 523A6BC700D
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 02:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2EBA4E3093
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 00:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BEB18DB0D;
	Thu,  9 Oct 2025 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goMbxqXr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F661096F;
	Thu,  9 Oct 2025 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759969615; cv=none; b=nxYl0Wuf+mxSh8nbKREYg3T+u+dUKaWlmaySyl/Hq8+9JJIEhOcvNK2453K/oGnHD6Nb2ynvFZXdlbZl5LzLWJCvYuMGDvIIy9nNc4PqC4Kn0nOW1hhdytjYRzVezS4GAWO2TVf7cKznluqbW3TZtcErag2h3oh8V4H3jiP/GrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759969615; c=relaxed/simple;
	bh=NTZOj9046h7xAft3krHWfXm/mCYPdn9MS2UGaxNZUto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kF2lQYh0cuZyhX5N7Ac66d7ehFOCUnmDLi12yap26E/tFDSyjJGyxsijLfwkkEXPw+/83vjW2n+NRZylvBIkWaoQq5vYL1Wev4y6gETf7varWuhOdTEktuPqvqueeRbu1vZbTs5kfSTgj9F5MLWZSBVt4yJ3oh7YOMOgGMRw+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goMbxqXr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9B4C4CEE7;
	Thu,  9 Oct 2025 00:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759969614;
	bh=NTZOj9046h7xAft3krHWfXm/mCYPdn9MS2UGaxNZUto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=goMbxqXr4MWFYmCePEx7Xg7V26wqq/gs4vIWNe6wIVggKbHkW6+DqbcHi7tDvtRIF
	 9DaPYBpQo6B3Ifc3a0UHmNX8ALV68uPzznohRAJYjG73s0PYWsp8uTbxd5qut1l1X9
	 4EPPtzxg/sclnOPdqMi5WlsEdvvlNEbhveL9e136Krg9LogQwbojJzLVmDTkHiVyMv
	 jx8mWIP7Lru8RL+IniPW8vMu+ggm12zs1QPjkmvxP9dDZ2Mp6Plc1VnSA/rdWgx/cW
	 7D661dH39RjFrztPPG3688LFI69WRL2DzeEXISx5/08OjrmeUe8mhFfVGH1Q/LtlUg
	 uuT9qTCKUfCZA==
Message-ID: <1d36569c-55b9-4390-87d1-fd0c2f837014@kernel.org>
Date: Thu, 9 Oct 2025 09:26:43 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Rob Herring <robh@kernel.org>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 saravanak@google.com, conor+dt@kernel.org, mchehab@kernel.org,
 bod@kernel.org, krzk+dt@kernel.org, abhinav.kumar@linux.dev,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <CAL_JsqK9waZK=i+ov0jV-PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAL_JsqK9waZK=i+ov0jV-PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2025 05:23, Rob Herring wrote:
> On Sun, Sep 28, 2025 at 12:17 PM Charan Teja Kalla
> <charan.kalla@oss.qualcomm.com> wrote:
>>
>> This series introduces a new iommu property called iommu-map-masked(may
>> be there is a better name), which is used to represent the IOMMU
>> specifier pairs for each function of a __multi-functional platform
>> device__, where each function can emit unique master id(s) that can be
>> associated with individual translation context.
>>
>> Currently, the iommu configuration - at least for arm architecture-
>> requires all the functions of a platform device will be represented
>> under single dt node thus endup in using only a single translation
>> context.
>>
>> A simple solution to associate individual translation context for each
>> function of a device can be through creating per function child nodes in
>> the device tree, but dt is only to just represent the soc layout to
>> linux kernel.
>>
>> Supporting such cases requires a new iommu property called,
>> iommu-map-masked(taking cue from iommu-map for pci devices) and syntax
>> is:
>>    iommu-map-masked = <FUNCTION_ID1 &iommu ID1 MASK1>,
>>                       <FUNCTION_ID2 &iommu ID2 MASK2>;
>> NOTE: As an RFC, it is considered that this property always expects 4
>> cells.
>>
>> During the probe phase of the driver for a multi-functional device
>> behind an IOMMU, a child device is instantiated for each FUNCTION_ID.
>> The call to of_dma_configure_id() on each child sets up the IOMMU
>> configuration, ensuring that each function of the device is associated
>> with a distinct translation context.
>>
>> This property can also be used in association with 'iommus=' when dt
>> bindings requires the presence of 'iommus=', example[2]. For these
>> cases, representation will be(on arm64):
>>    iommus = <&iommu sid mask>; //for default function.
>>    iommu-map-masked = <FUNCTION_ID &iommu sid mask>;//additional
>> function.
> 
> Where does the FUNCTION_ID value come from?
> 
> Why can't you just have multiple "iommus" entries where the index
> defines the default and any FUNCTION_ID entries? What's in each index
> is specific to the device.


We discussed the problem earlier and that is what I asked them to do.
Apparently I was just ignored so now two maintainers say the same. We
can get ignored still and the third maintainer will have to tell this.


Best regards,
Krzysztof

