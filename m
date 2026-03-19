Return-Path: <linux-media+bounces-56353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJk4GuYsvGnquAIAu9opvQ
	(envelope-from <linux-media+bounces-56353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:05:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0322CF6EA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F523314EDC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6280F3F786F;
	Thu, 19 Mar 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfxAbked"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152823F1659;
	Thu, 19 Mar 2026 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939374; cv=none; b=cidSuD50Epp0OPuBiRo5l8qSCqjy/2OeS95PfIvyLz+a07/BTuZP3Zo9hKyUUbTCC3YIGDENkKqhGpYF/Uh3UR6HjupdV2/3aUDCJ0VUvXKtS4l1xSWygC1GXs5KRm3G3AxWChxLQyrpNlkAunmRLERfSBuIE2KtncH3EGU1PuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939374; c=relaxed/simple;
	bh=buYrNumzH/okacfb8t8YTg6twr52GbLA8hyuw2Qrde0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6aPlqTbge9HpIPY0dX3edqpUzvYbrQGoWwitdyAlBH5cmWc6vd7NVjhOZpqkaFCeZv+8CnVII2Knbb2LbzUAXJjmrQC0h/jfbMUrJVGQl7ARsmQrfDOCK6FjMKka6sjLWmT+0ew1tKMce3rN4znmkPK6Z2bKDsz7b4V/au7tLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfxAbked; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1545C19424;
	Thu, 19 Mar 2026 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773939373;
	bh=buYrNumzH/okacfb8t8YTg6twr52GbLA8hyuw2Qrde0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VfxAbkedya6W5dDpsCCpwpmqzNrQQwq+Jsd47RPrQBhpDQg5YKcZg3o6RQS7d5chf
	 0pZhvP2Kf9atcFnbXgfmOfakWJr2AgcWSZXtII5w6wS1sn3OrlzhgvgqHFHAakwhUE
	 jLuGyXKwkdtQEuVFMCPzRKYB1pv8r9+IxZcmoraAeECHGHUEevPSs0l728rlx64hJ8
	 azh+bRjkRGst9R32RskjuPDo42tPB9fQJ0l6DgcUtHbL4wTgo7qLtQ/xvJ+epBOR2P
	 uG0spqZ8z3ngmo+1mYHLOh7ngaDTuOe1FGf+iHY68yf8o5L3tBi+VVch6pMJ0Pg07b
	 VmbqZRxYFqwLw==
Message-ID: <a42f837c-4b90-4e0f-a98f-793fbd20a140@kernel.org>
Date: Thu, 19 Mar 2026 16:56:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
 <26XTdUyQTB41Oc4D5HnMtSm_QpZRjlkljQRJVw-u1Zp3Ltn9s4LVU-LQkP6drdl3Z3GGssLCCbsVYPFEqssHcQ==@protonmail.internalid>
 <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
 <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
 <d6616fc0-75fb-47e2-96cd-ae81fa1a8e82@linaro.org>
 <f3c62284-ac78-42c6-a4f0-cd984b7124cd@linaro.org>
 <7eda931a-f30e-4e01-a130-996ec7f450d1@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <7eda931a-f30e-4e01-a130-996ec7f450d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56353-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD0322CF6EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 16:08, Neil Armstrong wrote:
> On 3/19/26 16:18, Bryan O'Donoghue wrote:
>> On 19/03/2026 14:56, Vladimir Zapolskiy wrote:
>>>> There's no reason to remove that from CAMSS - it would be an ABI break
>>>> in user-space anyway.
>>>
>>> If technically CAMSS CSIPHY could be excluded from the list of CAMSS 
>>> media
>>> subdevices, then for the sake of simplification it should be done for 
>>> all
>>> supported platforms in advance, such a change will be independent 
>>> from this
>>> particular phy series, and vice versa, this CAMSS only driver change 
>>> will
>>> prepare a ground for media-less CAMSS CSIPHY device drivers, hence it 
>>> shall
>>> precede this particular CAMSS CSIPHY series.
>>>
>>> For backward compatibility with userspace a noop stub will be good 
>>> enough,
>>> it's not an issue at all.
>>
>> The standalone PHY driver doesn't require removing the CSIPHY media
>> entity from CAMSS. They serve different purposes and coexist - its 
>> important to have a NOP from user-space perspective for legacy and 
>> indeed for new implementations.
>>
>> How the PHY gets represented in the kernel is of zero interest to 
>> user-sapce.
>>
>> That said, stubbing out the media entity is independent work that can 
>> happen in any order and IMO is a separate debate. Whether or not 
>> CSIPHY init sequences live inside of a monolithic CAMSS driver or live 
>> inside off a discrete csiphy driver is not related to the media graph.
>>
>> Happy to have that debate - and if indicated, carefully apply patches 
>> separately.
> 
> So what does this actually solves ?
> 
> Neil
Per-PHY voltage rails, per-PHY power domains and per-PHY OPP scaling.

Using the PHY API instead of rolling our own, as well as separate nodes 
in the DT.

We've been getting away with power-domains, opp scaling etc by sheer 
luck. The feedback from the list alone now addressed in this driver 
makes the conversion worthwhile.

---
bod

