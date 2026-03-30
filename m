Return-Path: <linux-media+bounces-57578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNXDFpRCymky7AUAu9opvQ
	(envelope-from <linux-media+bounces-57578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:29:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C74CA35834D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B85430269E2
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DF620B22;
	Mon, 30 Mar 2026 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+5ZjBvM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5531A3AEF2E;
	Mon, 30 Mar 2026 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862727; cv=none; b=QZyBbHJxw1GRT6sxDxAt4itR84g+DixKfdkM4rPhe+vX2lBHBoqTeuke7VIlRNpGCNaeVtXlu+soDRHaworKsO8V2Cv6d+2uAxRubq4zjPJv2KWNOuXW87HPqRTjZCjxUgXSTCkZVXuhzskC8YRTKEssGxjcbqccclQCURR30S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862727; c=relaxed/simple;
	bh=9bQ/OYfV+keQ5xo2EhGFiUEry34Hic8CujRdJP9iYiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTAcMnnbWUchFwEGsLPmgPaN1Zi/oyoKouJZbc+oeeEf37JcgIU3tnEvv/1K5iA5jOPljZ9eaih2GEIYPp3JGiZg9qysI0Nc+OPAoOKM2FBNr4H6QXerVP9nppDsuLp0MeT27zToKdtDAjcsk3he3Te8uigZvnc9rvaG+zihKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+5ZjBvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3630EC4CEF7;
	Mon, 30 Mar 2026 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774862727;
	bh=9bQ/OYfV+keQ5xo2EhGFiUEry34Hic8CujRdJP9iYiM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+5ZjBvMd74lpS/usvh16Cm14l1ZC/XvVznSnDamBKq87Kz+frVYkLCeeIgT8Ao1F
	 0UH814n7osomW+K9KR+fL82rfnmrPm2ihy80OUI5NnwfmryCArj8PB8sfEoDl8DvcP
	 JOb2tND7bEzGh+7c28HzhooZX/EkA62Je17T9Vp6ldqMAXZuEdjEvuY/XI2nxfD1O+
	 nlXVybgjDJBgqfeUZcawpxhvS5HsjLMjzNPLfcua+5LcuMxzc9lcmcAxUHO/M76P9v
	 /Ni/qaAGXdqEszH0ywM1aJF6ETqXcHIPSbix/uqx0Br7mejmcnDez5kvqWaJAGsQA9
	 XxeP/Idob3nmg==
Message-ID: <0101d8bc-1ae8-475e-bb9e-cc1e16db87ec@kernel.org>
Date: Mon, 30 Mar 2026 10:25:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
 <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
 <RAPaPhpxA39W0ykm-Cr1KaDiJKpRqdQTXUeEmt5mQn4lJBHEGaIS010ejjmhUYEBsHjzrTX41Ek9zLU2bae_YA==@protonmail.internalid>
 <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <76ea03d0-d41b-4880-a48c-06570eb089ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57578-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C74CA35834D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 10:17, Neil Armstrong wrote:
> On 3/30/26 11:02, Bryan O'Donoghue wrote:
>> On 30/03/2026 08:49, Neil Armstrong wrote:
>>> On 3/27/26 18:42, Bryan O'Donoghue wrote:
>>>> On 27/03/2026 15:28, Neil Armstrong wrote:
>>>>>> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?
>>>>>
>>>>> This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.
>>>>
>>>> I'm not sure what point it is you are trying to make here. Are you trying to say drivers/phy is OK with you but you want an endpoint ? If so, please just say so.
>>>
>>> I'm against using the "phys = <>" property in the CAMSS to reference the PHYs, a "PHY" in the classic terminology is tied to a single consumer, and if it can be shared to multiple consumer you must model a mux or whatever in the middle.
>>
>> The CSIPHY-to-CSID routing is runtime-configurable and is already managed by the media controller framework.
> 
> This is not compatible with the PHY bindings if you don't have a defined MUX device in the middle, it's wrong. You're hiding the muxing details in the CAMSS blob node.
> 
>>
>> DT describes static hardware connections. The dynamic mux is a software concern, not a hardware description concern.
> 
> DT must describe the possible interconnections between the nodes, if a PHY can be used by multiple hardware components, it must be described.

But right now the CAMSS block is described as a single block. There is 
no CSID device in the kernel _yet_.

When we break CSID into its own block then fine, lets have a debate 
about a mux then but right now the "nodes" are CAMSS[MONOLITH] <=> 
CSIPHY there is no DT CSID device to model this to.

> 
>>
>>
>>> The PHY API as an internal software implementation is probably fine, even if it makes implementation of split mode much much harder and doesn't really solve anything, you can just call init()/poweron()/ poweroff()/exit() directly from the CSIPHY media callbacks.
>>
>> Great.
>>
>>>> I can see an argument for that hence my response to Konrad, I just don't see why its a Qualcomm specific argument and of course understood stuff bubbles up in review, we have a public debate and come to a consensus - that's a good thing.
>>>>
>>>> However, I'd want wider buy-in and understanding that endpoints in the PHYs is a more accurate description of the data-flow.
>>>
>>> It is, and it was designed for that, and extensively used in the media DT representation, so I wonder here you would not use it...
>>> In an ideal world, you would add nodes for each CAMSS hw elements and adds port/endpoints links between all nodes to describe the data graph, this would be used to construct the media controller graph, and make it much easier supporting new hardware.
>>
>> Yes but be pragmatic Neil. The first step in making the monolith into sub-nodes is the CSIPHY.
> 
> I am, and I agree it's fine to do it step by step.

Cool.

So let's talk about muxing to CSID devices, when we have CSID devices in 
the DT.

>>
>> Once the CSIPHY is in, we can follow on with adding new nodes that way IPE, BPS, ICP, JPEG whatever and also work on implementing the old stuff in that new way.
> 
> I agree on the approach, I never said otherwise, but you need to have the big picture in mind.
> 
> When you'll have the CSID subnodes, where will you add the phys properties ? you'll keep them in the CAMSS top node ? add all CSIPHY to all CSID nodes ? this is wrong and this needs to be fixed now.
> 
>>
>>
>>>
>>>>
>>>> We've been applying DT bindings aplenty without that so far. So we would establish new CSI2 PHY bindings should represent the sensor endpoints.
>>>
>>> We've been using a dummy representation of CAMM in a single node with only endpoints connecting to the sensors and hiding all the hardware layout in code, it doesn't scale and makes supporting new HW hard.
>>> I mean this is common sense, why would we continue to stick to the current CAMSS bindings ???
>>
>> We _won't_ I just don't support a big bang integration. Progressive changes over a longer timeline make the transition manageable, without accepting endless sub-standard stuff in the meantime or holding up all new SoC submission unless/until.
>>
>> I mean there is a CAMSS meeting which I've been running for nearly a year now that both you and Vlad are invited to where we have been discussing this for months...
>>
>> Anyway one conclusion of that is we want to transition to individual nodes for everything.
>>
>> PHY is the first step which I'm taking because its easier for me as CAMSS maintainer to convince the CAMSS maintainer to take the relevant patches.
>>
>> drivers/phy notwithstanding.
> 
> As I said I agree on the progressive approach, not the PHY DT bindins approach.
> 
>>
>>>>
>>>> Is that what you want ?
>>>>
>>>>> The CSIPHYs are not tied to a single "consumer" block, they can be connected to different consumers at runtime, which is not something classic PHY devices are designed for. So they are de facto a media element in the dynamic camera pipeline.
>>>>
>>>> The existing CAMSS binding and media graph are not changed by this series.
>>>
>>> This is not my point, I don't care about the software implementation at all, I care about accurate hardware representation. Using the "phys = <>" property does not describe hardware accurately.
>>>
>>> In other words: The CSIPHY are not connected to CAMSS. This is _not_ true, tying the CSIPHYs to the CAMSS block hides the real data muxing in software.
>>>
>>> Please remind DT is used by multiple operating systems, and properly describing hardware in DT will help have good software support over all OSes, not just Linux.
>>>
>>>>
>>>>> And actually Rob Herring asked use to define the complete data flow, it was a strong requirement. I don't see why we wouldn't here.
>>>>
>>>> I'm implementing feedback from Rob.
>>>>
>>>> https://lore.kernel.org/linux-media/20250710230846.GA44483- robh@kernel.org/
>>>
>>> Where did he ask using the PHY DT bindings ? Is he aware those CSIPHYs are muxed to multiple consumers which are burried in the CAMSS code ?
>>
>> I freely admit to taking the initiative of phys = <> but Neil there is _no_change_ to the media graph and the "mux" is a runtime configuration that is one register in the CSID.
> 
> Honestly I don't care about the userspace media graph, this is a software problem and we can totally make the transition seamless if we want.
> 
> Don't limit the DT hardware description because of a software userspace ABI breakage, this approach is not the right one.
> 
>>
>> You seriously want a mux device in the kernel to model one bit in a register ?
> 
> Why not ? We have drivers that even toggles even single bit to solve those kind of situations.
> 
> Physically they're a mux to route the CSIPHY to the consumers, it's a fact... even if it's a register or a single bit.

That's fine. I can understanding making that case if/when CSID becomes 
its own node but, I don't think it makes sense when connecting the PHY 
back to the monolith.

---
bod

