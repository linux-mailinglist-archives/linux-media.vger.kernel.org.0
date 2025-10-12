Return-Path: <linux-media+bounces-44216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF99BD0CE6
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 23:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86AF94E38AF
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 21:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161B0247299;
	Sun, 12 Oct 2025 21:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4HoqRS6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ACA1F4C9F;
	Sun, 12 Oct 2025 21:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760306237; cv=none; b=hbbfycNIa/IaJw5D1Ul0ifhNn2cJvWxXvR1TYk5QZIDX9dIslKUPS7xuSSJ1uT3/JzHPBp3NuqML+1Uz4fNqHj8nTOutc2oqS7JLCUU+FINvYV7ChmtKyxqCv4I3oqZp3v0RHA0BdSFnhAzBhOV/ncepO+xH22Gs0SSNcPi3y5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760306237; c=relaxed/simple;
	bh=uzV5vowCQeEOgjTPvkvfljcgwJJ5ZIZy7v5txVIJAzc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hs6FnX4MULCjZMUHbYdLvYN7YblaSdckSDIotsMGPBdhP+bnmzTo2zSd5GHpvhdSzTxrlp+lo0wsXTtn6PhzPCRgjqPE0Ey4MvtR1e0mXw8eUqctuQA50e4Wm2+KZzsd5jC51jF9ALEYhRKA+K2Gzr6wsa1+GMVsQykePCKhmZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4HoqRS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE86C4CEE7;
	Sun, 12 Oct 2025 21:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760306236;
	bh=uzV5vowCQeEOgjTPvkvfljcgwJJ5ZIZy7v5txVIJAzc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=L4HoqRS63ozDSEZzo2i1g/A5gwW+zu16JQ8rYoGMUePKS2UzjkcUGSLKLJr4Y7E2p
	 7sxFDsncKUj2Zh1xqK4yU9aqFiGqRf5Ut5beC56jU8BHjrOKRgwAuqFifxZIVm5LKR
	 oxZN0MONxSHjfSgB8X0KYeqKTdAy0unCKv0G+Ma2eLU4fGNwYur9kxEV6L1wigpwSo
	 MYJiQl/qzqXnknz2f+0ASanZ7zHzTNFtOOMryjQyldzdPYoXVzNctdceynm9gr7X4W
	 LMY86fHO8MXwL7GejIp1SOH2I7W8JmoOiUJAaMNJ7jKW0W467tFZxbtu9sGCP0a+Pu
	 20OB6T7Y5S/qw==
Message-ID: <3cbf1d5d-e0a5-4c9f-88c3-eaacc6cb47d3@kernel.org>
Date: Sun, 12 Oct 2025 22:57:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
From: Bryan O'Donoghue <bod@kernel.org>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, saravanak@google.com,
 conor+dt@kernel.org, robh@kernel.org, mchehab@kernel.org,
 krzk+dt@kernel.org, abhinav.kumar@linux.dev,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
 <0zcQcB2YYWH_ufElq3ptqtLsGDsxvMEAkHCt_jYaSpwV597VFc22pFWzyMz0rSY-DKqWCQgOCiKpsIRNA0Fisw==@protonmail.internalid>
 <c863f6a7-b117-4444-ae6d-1d525b572be2@oss.qualcomm.com>
 <3c1eb276-abde-4af4-ab39-c934c30aa447@kernel.org>
Content-Language: en-US
In-Reply-To: <3c1eb276-abde-4af4-ab39-c934c30aa447@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> 6. We should on introduction of a new SoC
> 
>     - Fix the iommus = <> for "qcom,newsoc-iris" to contain
>       only what is pertinent to S1_VIDEO_HLOS
> 
>     - Make new devices in the DT for each FUNCTION_ID
> 
>     - Then look at how - if - that fix can be brought back to Lemans
[sic] Lanai/sm8550

---
bod

