Return-Path: <linux-media+bounces-56507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF01LU0avWnG6QIAu9opvQ
	(envelope-from <linux-media+bounces-56507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:58:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 564812D8608
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CE80304139A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E4538B15E;
	Fri, 20 Mar 2026 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyHPrjR3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB9383C6B;
	Fri, 20 Mar 2026 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000606; cv=none; b=W7lanbxKW757+HF0tErp1G5yD6kD80vxYXuEgjQNJ+XqfjZnBuyQifYFlYIPh4fWKCv1HmmW803rg5DlUy/jWbd3zgM8Vu9mCphxBQAsZfbLgolNNcVYDxOE1by6XyuMPMn2smFuh8Sj9faQhWvZ8DPfkaMM1GcuoL3wNxU0wyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000606; c=relaxed/simple;
	bh=SzI5t4N0FZ4IAeW8BhjweNtPA/RkXoLwNTDxzHATD1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rb99M5QwMzFuHS158er7KteQjocqE9HMkAoTuN8xh5Lipez1xYBHo6ExL9hssvP/SJUU/5rhnpMZBg9CVb1jwFkHOgb6pZaRGQjqREZFQNYca3oKp8m2DmEi1u+CK2AQB4X2vY43IitI1NMN+i9f5cumkSAL3utJ2s074NZP6BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyHPrjR3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693F6C2BC9E;
	Fri, 20 Mar 2026 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000605;
	bh=SzI5t4N0FZ4IAeW8BhjweNtPA/RkXoLwNTDxzHATD1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uyHPrjR3+YS3hIv+Vg1KVooBJPWYvxp1ylXz+0wufQwK1BQVCzZIbAJICGq8c8aLU
	 ujGVye+HQSFndavhlxf5a+Wy4kZbDcYd6SKofNhSlbj7ZfR+jmncjmjcjVvntwSm+V
	 38V7PmAe03PHEmnctKKezxxClyuk3hzAbr0ueemSrb5dJIiyc5dogFS8tGvd9h/5A9
	 u99QwDSwRY3H0p2hn0dNwnoyTw7tU73QZxLgjADKjirEJ3B3Z3IvjEbx3OjHC54V3K
	 WWlfyOdfp2lyf3WxQuJgF7sArvhva/cDiq4NhlH0RR/2/J0LffmgfO0BEFIbVI9OcS
	 z0PkN5gGfKqNg==
Message-ID: <369229e0-06fd-4a22-b6d8-6dfebb5ca3b2@kernel.org>
Date: Fri, 20 Mar 2026 09:56:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
 <oULvLfFEPeTlWNrZF9lVwMEK-bN53nncdYFGaOgjvBQAtxaUS_SrfFhorc49TcxiPQK3CIOk46vbnkXZQ24Nfg==@protonmail.internalid>
 <5b23408d-c996-4785-8294-233d79168a1b@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <5b23408d-c996-4785-8294-233d79168a1b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56507-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 564812D8608
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/03/2026 00:37, Vladimir Zapolskiy wrote:
> On 3/19/26 17:18, Bryan O'Donoghue wrote:
>> On 19/03/2026 14:56, Vladimir Zapolskiy wrote:
>>>> There's no reason to remove that from CAMSS - it would be an ABI break
>>>> in user-space anyway.
>>> If technically CAMSS CSIPHY could be excluded from the list of CAMSS media
>>> subdevices, then for the sake of simplification it should be done for all
>>> supported platforms in advance, such a change will be independent from this
>>> particular phy series, and vice versa, this CAMSS only driver change will
>>> prepare a ground for media-less CAMSS CSIPHY device drivers, hence it shall
>>> precede this particular CAMSS CSIPHY series.
>>>
>>> For backward compatibility with userspace a noop stub will be good enough,
>>> it's not an issue at all.
>> The standalone PHY driver doesn't require removing the CSIPHY media
>> entity from CAMSS. They serve different purposes and coexist - its
>> important to have a NOP from user-space perspective for legacy and
>> indeed for new implementations.
>>
> There should be no two CAMSS CSIPHY device (or subdevice) drivers, where
> one chop of CAMSS CSIPHY device driver remains to sit under media, and
> another one is under phy subsystem, since it's a further degradation from
> the current already pretty awful state of the CAMSS driver, but at least
> CSIPHY is not scattered over different subsystems today.
> 
> It might be fine to move device driver parts related to CAMSS CSIPHY
> driver from media subsystem to phy subsystem, however if only a partial
> transition is planned, and CSIPHY device support is split into two device
> (sub-)drivers, then it merely exposes a quite severe design flaw.

It's not two drivers for the same device. It's two layers:

- The media entity in CAMSS is a pipeline routing abstraction.
   It validates formats and connects pads. It does not program
   CSIPHY hardware directly.

- The PHY driver programs the hardware — registers, clocks,
   regulators, power domains.

This is the same layering as rkisp1 (media pipeline) +
phy-rockchip-inno-csidphy (electrical config). The ISP's media
entities and the standalone PHY coexist in different subsystems
without conflict.

No CSIPHY functionality is duplicated across subsystems. This segmenting 
of concepts and functionality isn't even unique. We see this constantly 
with USB (where the MAC lives in drivers/usb/ and the electricals in 
drivers/phy/) and Display/DSI.


> It looks like it's still undecided, if CAMSS CSIPHY IP is a phy or media
> device, it can not be both at the same time.

We are maintaining the existing user-space setup which presents a 
msm_csiphyX v4l2-media device, whilst moving the PHY component out into 
drivers/phy where it belongs - completely transparently to user-space. 
So we already have a dependency in user-space which needs to be maintained.

The concrete hardware benefits, as I alluded to Neil, are:

- Per-PHY voltage rails
- Per-PHY power domains
- Per-PHY operating points (OPPs)

Those are real-world hardware fixes which "just work" as a result of 
dedicated device nodes and a driver specifically written to relieve the 
technical debt we've been accruing with the existing model, for years.

Having been educated - brought to the realisation on OPPS, Power-domains 
and yes voltage rails it is amazing to me this whole legacy system 
hasn't exploded before now but, its certainly way past time to fix it.

We should proceed with moving init sequences, voltages, PDs and OPPs to 
drivers/phy.

I'm happy to have a debate about the status of the PHY media device 
after, however I have to say I'm skeptical about removing the media 
device - something we could do whether the init sequences live in 
drivers/media/qcom/camss or in drivers/phy BTW - I'm skeptical about 
removing that v4l2 node specifically because we've had it in user-space 
for a long time and I do therefore think that constitutes an ABI.

As I've said already though `rm -rf /dev/v4l2-subdev::msm_csiphy*" is 
basically an entirely separate debate.

---
bod

