Return-Path: <linux-media+bounces-25795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A00A2C17A
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF05C188950B
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4831DEFF9;
	Fri,  7 Feb 2025 11:28:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A61DED6B;
	Fri,  7 Feb 2025 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927722; cv=none; b=KJKmCEhxnBk8TljPdcveaUnrPUgkgI5mpD0Jgwok2zD29nzpoRgaRXs8uX4W8ItcbKrGjqeHHAqA/ugRA/uSQcKCslOy1oi+ccVzOp5XJqi82WJHiZKlSCx3jHiwfkz83f6TxcNB/fzfrgDx8fNpB2uq52ks6QTf2Ptt7OOFTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927722; c=relaxed/simple;
	bh=rE6lHm65mg1GEw5D+xuDHshi7zGvNb59fTyiTc+SPsE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=RVTq9dpHcXvEJeBzYxVIFzE31rODai/+7UgbGYbykRb0kpuyQxBn0YwXQpbSIBGCNu8KB3rGXgcoDAKfiTzIjK2rVgMaA7vMR7ultPDdwnSdHMj64bf9bGqbY27Rzi6zK1WuQundR7VbnJlmIPrs0Cw95XIvxxgGOOLMAlUSXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YqBST5ps2z11Pm5;
	Fri,  7 Feb 2025 19:24:09 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id A6F821400D5;
	Fri,  7 Feb 2025 19:28:30 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Feb 2025 19:28:28 +0800
Message-ID: <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
Date: Fri, 7 Feb 2025 19:28:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
To: Oleksij Rempel <o.rempel@pengutronix.de>
CC: <robh@kernel.org>, <saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<kory.maincent@bootlin.com>, <jacopo+renesas@jmondi.org>,
	<kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
	<arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
In-Reply-To: <Z6XDKi_V0BZSdCeL@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500003.china.huawei.com (7.202.181.241)



在 2025/2/7 16:24, Oleksij Rempel 写道:
> On Fri, Feb 07, 2025 at 09:31:09AM +0800, Zhang Zekun wrote:
>> There are many drivers use of_find_node_by_name() with a not-NULL
>> device_node pointer, and a number of callers would require a call to
>> of_node_get() before using it. There are also some drivers who forget
>> to call of_node_get() which would cause a ref count leak[1]. So, Add a
>> wraper function for of_find_node_by_name(), drivers may use this function
>> to call of_find_node_by_name() with the refcount already balanced.
>>
>> [1] https://lore.kernel.org/all/20241024015909.58654-1-zhangzekun11@huawei.com/
> 
> Hi Zhang Zekun,
> 
> thank you for working on this issue!
> 
> First of all, let's take a step back and analyze the initial problem.
> Everything following is only my opinion...
> 
> The main issue I see is that the current API - of_find_node_by_name -
> modifies the refcount of its input by calling of_node_put(from) as part
> of its search. Typically, a "find" function is expected to treat its
> input as read-only. That is, when you pass an object into such a
> function, you expect its reference count to remain unchanged unless
> ownership is explicitly transferred. In this case, lowering the refcount
> on the input node is counterintuitive and already lead to unexpected
> behavior and subtle bugs.
> 
> To address this, the workaround introduces a wrapper function,
> of_find_node_by_name_balanced, which first increments the input’s
> refcount (via of_node_get()) before calling the original function. While
> this "balances" the refcount change, the naming remains problematic from
> my perspective. The "_balanced" suffix isn’t part of our common naming
> conventions (traditions? :)). Most drivers expect that a function
> starting with "find" will not alter the reference count of its input.
> The term "balanced" doesn’t clearly convey that the input's refcount is
> being explicitly managed - it instead obscures the underlying behavior,
> leaving many developers confused about what guarantees the API provides.
> 
> In my view, a more natural solution would be to redesign the API so that
> it doesn’t modify the input object’s refcount at all. Instead, it should
> solely increase the refcount of the returned node (if found) for safe
> asynchronous usage. This approach would align with established
> conventions where "find" implies no side effects on inputs or output,
> and a "get" indicates that the output comes with an extra reference. For
> example, a function named of_get_node_by_name would clearly signal that
> only the returned node is subject to a refcount increase while leaving
> the input intact.
> 
> Thus, while the current workaround "balances" the reference count, it
> doesn't address the underlying design flaw. The naming still suggests a
> "find" function that should leave the input untouched, which isn’t the
> case here. A redesign of the API - with both the behavior and naming
> aligned to common expectations - would be a clearer and more robust
> solution.
> 
> Nevertheless, it is only my POV, and the final decision rests with the
> OpenFirmware framework maintainers.
> 
> Best Regards,
> Oleksij

Hi, Oleksij,

Thanks for your review. I think redesign the API would be a fundamental 
way to fix this issue, but it would cause impact for current users who 
knows the exact functionality of of_find_node_by_name(), which need to 
put the "from" before calling it (I can't make the assumption that all 
of drivers calling of_find_node_by_name() with a not-NULL "from" 
pointer, but not calling of_node_get() before is misuse). The basic idea 
for adding a new function is try not to impact current users. For users 
who are confused about the "_balanced" suffix,the comments of 
of_find_node_by_name() explains why this interface exists.

Thanks,
Zekun

