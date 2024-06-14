Return-Path: <linux-media+bounces-13262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8D908B3F
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 14:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8261F247BF
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 12:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C675195FEF;
	Fri, 14 Jun 2024 12:07:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD23811FE;
	Fri, 14 Jun 2024 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718366859; cv=none; b=bZ4Eh5Oslaj2tftOdNqV+FbFhP5bCN+Bvz1JWOgeQcNhcbSXkqVMeQV6No6zHsGMhyRMakDkqQgunCsGz4cXn12H0tmWt8NjeDsv+ZpvQRze12TpRf+Zmv1SyjJAwjcfWKGWHG0qeKKgNxqqR9TNlmvP12Ldjmr758w+wbJ5QUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718366859; c=relaxed/simple;
	bh=Vq6GkNjm49Si+NAnbQlMEolVQ3XwS1Z66jv5HfAMGuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcQJU4oqA8B/PivOwt7hp1N87BxsexC+yFO0LKBpspA+MrIzVqVqRLaZ7NL8xJ4kD6AxqKtY6oXH06CQv676nIqMYvXfCUwsLi89mPdN6XmOVEAibgMMD8vxsMvBEfYtz6zo4X4TGQvgNj1ClB+4aeYHEuqBxv64FUWzJvPUXa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E093AFEC;
	Fri, 14 Jun 2024 05:08:00 -0700 (PDT)
Received: from [10.57.71.136] (unknown [10.57.71.136])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DBB43F64C;
	Fri, 14 Jun 2024 05:07:32 -0700 (PDT)
Message-ID: <3516994c-7b06-4409-b9a9-975b9f7a60eb@arm.com>
Date: Fri, 14 Jun 2024 13:07:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
 <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
 <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
 <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-13 10:38 pm, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Jun 13, 2024 at 11:34:02AM GMT, Tomeu Vizoso wrote:
>> On Thu, Jun 13, 2024 at 11:24 AM Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
>>> On Thu, Jun 13, 2024 at 2:05 AM Sebastian Reichel
>>> <sebastian.reichel@collabora.com> wrote:
>>>> On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
>>>>> IOMMUs with multiple base addresses can also have multiple power
>>>>> domains.
>>>>>
>>>>> The base framework only takes care of a single power domain, as some
>>>>> devices will need for these power domains to be powered on in a specific
>>>>> order.
>>>>>
>>>>> Use a helper function to stablish links in the order in which they are
>>>>> in the DT.
>>>>>
>>>>> This is needed by the IOMMU used by the NPU in the RK3588.
>>>>>
>>>>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>>>>> ---
>>>>
>>>> To me it looks like this is multiple IOMMUs, which should each get
>>>> their own node. I don't see a good reason for merging these
>>>> together.
>>>
>>> I have made quite a few attempts at splitting the IOMMUs and also the
>>> cores, but I wasn't able to get things working stably. The TRM is
>>> really scant about how the 4 IOMMU instances relate to each other, and
>>> what the fourth one is for.
>>>
>>> Given that the vendor driver treats them as a single IOMMU with four
>>> instances and we don't have any information on them, I resigned myself
>>> to just have them as a single device.
>>>
>>> I would love to be proved wrong though and find a way fo getting
>>> things stably as different devices so they can be powered on and off
>>> as needed. We could save quite some code as well.
>>
>> FWIW, here a few ways how I tried to structure the DT nodes, none of
>> these worked reliably:
>>
>> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-devices-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=heads#L1163
>> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-subnodes//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=heads#L1162
>> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-devices//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=heads#L1163
>> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-iommus//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=heads#L2669
>>
>> I can very well imagine I missed some way of getting this to work, but
>> for every attempt, the domains, iommus and cores were resumed in
>> different orders that presumably caused problems during concurrent
>> execution fo workloads.
>>
>> So I fell back to what the vendor driver does, which works reliably
>> (but all cores have to be powered on at the same time).
> 
> Mh. The "6.10-rocket-multiple-iommus" branch seems wrong. There is
> only one iommu node in that. I would have expected a test with
> 
> rknn {
>      // combined device
> 
>      iommus = <&iommu1>, <&iommu2>, ...;
> };
> 
> Otherwise I think I would go with the schema-subnodes variant. The
> driver can initially walk through the sub-nodes and collect the
> resources into the main device, so on the driver side nothing would
> really change. But that has a couple of advantages:
> 
> 1. DT and DT binding are easier to read
> 2. It's similar to e.g. CPU cores each having their own node
> 3. Easy to extend to more cores in the future
> 4. The kernel can easily switch to proper per-core device model when
>     the problem has been identified

It also would seem to permit describing and associating the per-core 
IOMMUs individually - apart from core 0's apparent coupling to whatever 
shared "uncore" stuff exists for the whole thing, from the distinct 
clocks, interrupts, power domains etc. lining up with each core I'd 
guess those IOMMUs are not interrelated the same way the ISP's 
read/write IOMMUs are (which was the main justification for adopting the 
multiple-reg design originally vs. distinct DT nodes like Exynos does). 
However, practically that would require the driver to at least populate 
per-core child devices to make DMA API or IOMMU API mappings with, since 
we couldn't spread the "collect the resources" trick into those 
subsystems as well.

Thanks,
Robin.

