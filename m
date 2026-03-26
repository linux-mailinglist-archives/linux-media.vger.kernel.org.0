Return-Path: <linux-media+bounces-57183-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL8NCRG4xWnxAwUAu9opvQ
	(envelope-from <linux-media+bounces-57183-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 23:49:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92F33CCC2
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 23:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C88F830151F7
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039253451D9;
	Thu, 26 Mar 2026 22:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KDf/+QEl"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB521A457;
	Thu, 26 Mar 2026 22:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565386; cv=none; b=uFBHsaC5E8Si1TrmMJOiJdUeJ0lQsll36U10lCl2JvLKQo/rd5nhWFH1TlI2aiDdkCB0zkabRKnHytV6vG46gvAk0xlEj3y2WIVV/Qtg01abugxf2+eijHlihYTSskI41NixvZiQaHMDLd8SzkJw8jiSXHlCqTtdLC8cr6wCZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565386; c=relaxed/simple;
	bh=72AnQfC7Y2zJajeESpEpdCNxcAMsKHMg0UXOwH4hjjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6idnLykWrqnj0wGSIPHvL2NdZuYvKOhVGFXuRw7ySB/Q2NYnkBeNgQ7h++d848U5U9DTbtpuURHGXKg0E183c7U1IvQ/h67tNZERs+YtCI5Btl969uAtQR70/BPj9RoXCGEO49aCLZuT5xXNoha2EzNBNeXomQHW78m0MNFi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KDf/+QEl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774565383;
	bh=72AnQfC7Y2zJajeESpEpdCNxcAMsKHMg0UXOwH4hjjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KDf/+QElodAdciXe4nenVpGbeDnLtNoWUP/RyrXaW25je4P1sP6n7TWv0wLf1FmdV
	 H/jXbj/VroQO09XAWWp/5Eo8jhuLgdoaPD65v1bGvgrISeU+1a2gO3JgEC+ngS2o23
	 uOVBq/QprGE9MVVkUEMKYuyqZ3wAMbeKTfqd4wFLZOp9km2EAEuY8iwAotAlr6t1Ed
	 UDE94iE2b9BV8DGEN1MQ1vA7TqGtnb9NONQrPWmDrycbV+ZPoyWhkKJxAK4q6VjRDq
	 9/5sno361FDIgs8D+CHFWtTK2DPOJ1O8Ow3tImEYc449ZLQxsbSctYGOCye8VS9KpR
	 5xj2lP4/hjdTg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C01417E6002;
	Thu, 26 Mar 2026 23:49:42 +0100 (CET)
Message-ID: <1af216b1-c78b-41fb-80eb-992e487e63e6@collabora.com>
Date: Thu, 26 Mar 2026 23:49:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
 <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
 <20260325210634.GA3963190-robh@kernel.org>
 <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
 <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57183-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: AB92F33CCC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rob,

On 3/26/26 20:42, Rob Herring wrote:
> On Wed, Mar 25, 2026 at 4:34 PM Michael Riesch
> <michael.riesch@collabora.com> wrote:
>>
>> Hi Rob,
>>
>> On 3/25/26 22:06, Rob Herring wrote:
>>> On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
>>>> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
>>>> the RK3568.
>>>> Introduce a list of compatible variants and add the RK3588 variant to
>>>> it.
>>>>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>
>> First of all, apologies for applying your Acked-by tag. I figured
>> resolving the merged conflict was trivial and impossible to screw up, but...
> 
> No worries. I would have kept it too.
> 
>>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>>> ---
>>>>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +++++++---
>>>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>>>> index 4ac4a3b6f406..3d3b3cd78884 100644
>>>> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>>>> @@ -16,9 +16,13 @@ description:
>>>>
>>>>  properties:
>>>>    compatible:
>>>> -    enum:
>>>> -      - fsl,imx93-mipi-csi2
>>>> -      - rockchip,rk3568-mipi-csi2
>>>> +    oneOf:
>>>> +      - const: fsl,imx93-mipi-csi2
>>>> +      - const: rockchip,rk3568-mipi-csi2
>>>
>>> These 2 should be a single enum as they were before.
>>
>> ... hm. Well.
>>
>> First, do you mean
>>
>> properties:
>>   compatible:
>>     oneOf:
>>       - enum:
>>          - fsl,imx93-mipi-csi2
>>          - rockchip,rk3568-mipi-csi2
>>       - items:
>>          - enum:
>>             - rockchip,rk3588-mipi-csi2
>>          - const: rockchip,rk3568-mipi-csi2
>> ?
> 
> Yes.

Thanks for the clarification. v4 coming up.

> 
>> If so, what is the practical difference?
> 
> First, then you aren't changing what's already there. For validation,
> there is no difference other than failures with 'oneOf' give poor
> error messages. It wouldn't be much better, just one less oneOf entry.

I'll try to keep that one in mind!

Best regards,
Michael


