Return-Path: <linux-media+bounces-40827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C548B329B0
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 17:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3861B67E43
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 15:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6882E8DE0;
	Sat, 23 Aug 2025 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2lhz6dr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19AA12B93;
	Sat, 23 Aug 2025 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755963585; cv=none; b=glovFChtmT7xmumPwNNkHRjq/2wsM4KSpTgNtjSxeN++Tzt8SPo9//R7w9UPmLGx9BFW/E9KdsIl/TUYW7PHBKfo1JLrM/L0cnz87vglwSQGdt+ORFikFc9ei5JXXj532UoopPkPziBwIYPKB21iITWVHN2vWAdMy64nJzcfGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755963585; c=relaxed/simple;
	bh=eCWEVQ/IDr6HBl39bDbTJnSVhaF7UusUbAAetwjFyRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lca9sxHiDIUSKxzS+TidZejPSC0wP2cnRzdovGRJnu1PQry0RomTeBu4fk80N1MN+E/5CwyvFwYcI6QAYUJIiSEqYpQuPR6guqYz+cZyoi9StlDtHpiHzhRwZB8yiKCdj1WnOgJzXF9GEj2nwqDPqvt7wzVQSdQ/4EpYCJxdrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2lhz6dr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02549C4CEE7;
	Sat, 23 Aug 2025 15:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755963584;
	bh=eCWEVQ/IDr6HBl39bDbTJnSVhaF7UusUbAAetwjFyRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q2lhz6drHJ+EAZhnkvrZi1FMwLk+q78p3rpldJ6qe0h6jqFMYqCSqrUJkMkCDqwhs
	 ajHCtO96f77lUToL/LHN71Tnuv3qiGhh+c7qZlN+5tdXqte/C/gi9JmieS/DhbPfBw
	 YEPI7HAmtbOEoXk3Wrl8cHYdIJl5T5TRghNA36n2fEX8nc47h09JfUrLI2xmYU8EIO
	 cXs7ky52lZ7k2MrsZMmIa/00pmuAtMKHggo7yeSOvqER/Gd9lOK32YuPUnNnXNy9sx
	 ohKy5bLrvihQjfnYk4PoIzp+65mVKiArkJdE/XxhRyDnwdaCfUg9mzzODl5cl/1UH7
	 2h0I6Nv7BFIhQ==
Message-ID: <41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
Date: Sat, 23 Aug 2025 17:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
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
 <CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
 <20250814140943.22531-5-inbaraj.e@samsung.com>
 <1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
 <00d101dc136c$aa037020$fe0a5060$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <00d101dc136c$aa037020$fe0a5060$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2025 15:57, Inbaraj E wrote:
> 
> Hi Krzysztof,
> 
> Thanks for the review.
> 
>>
>> On 14/08/2025 16:09, Inbaraj E wrote:
>>> There is a csi dma and csis interface that bundles together to allow
>>
>> CSI DMA?
>> What is CSIS?
>>
>>> csi2 capture.
>>
>> CSI2?
> 
> CSIS stands for Camera Serial Interface Slave.

Googling for "MIPI CSIS" gives me 0 results, so I still claim this is
not a generic name.

> 
> Samsung v4.3 CSIS IP bundles both the CSIS link operation and the CSIS
> DMA operation. The DMA-related operation are referred to as CSIS DMA and
> are handled by the fsd-csis driver. The link related operations are
> referred to simply as CSIS and are integrated into imx-mipi-csis driver.
> 
> I'll update the commit message and commit description accordingly,
> and maintain consistency across the patches.
> 
>>
>>>
>>> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  96 +++++
>>> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
>>> @@ -493,6 +493,558 @@ clock_mfc: clock-controller@12810000 {
>>>  			clock-names = "fin_pll";
>>>  		};
>>>
>>> +		mipicsis0: mipi-csis@12640000 {
>>
>> Messed ordering. See DTS coding style.
> 
> I'll fix the ordering in next patchset.
> 
>>
>> Node names should be generic. See also an explanation and list of examples
>> (not exhaustive) in DT specification:
>> https://protect2.fireeye.com/v1/url?k=a30d23f8-c28636dd-a30ca8b7-
>> 74fe485cbff6-ee12f8a711c584c8&q=1&e=b96506d8-2d5d-4303-b9e8-
>> 0e1189db1585&u=https%3A%2F%2Fdevicetree-
>> specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-
>> basics.html%23generic-names-recommendation
>>
> 
> There is no generic name directly related to CSI apart from camera. That's
> why I used mipi-csis. If preferred, I can move the name to csis or simply csi.
> Please let me know which one is more appropriate.

I don't think you really tried to solve this. How this device is called
in all other vendors?

Best regards,
Krzysztof

