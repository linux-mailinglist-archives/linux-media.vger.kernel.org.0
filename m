Return-Path: <linux-media+bounces-55776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMJTMvBstGmWnwAAu9opvQ
	(envelope-from <linux-media+bounces-55776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:00:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A72289859
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC35E304A2C6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372263E3142;
	Fri, 13 Mar 2026 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Rk/7P1tc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B328852E;
	Fri, 13 Mar 2026 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773432041; cv=none; b=cOh49/JFemU8Fkg7hamgPKtJfq35DVMyyZaKuqcR3ByoXY8IwnEzVu0CMLapT9fd3/kLZ5Gn/AKe6lpmJa6lfDK1JdUQPLwr7nBbbhejLks249txxR3JzX5UCuNrRqbUn446lJTr4nt0yv/bVqULTN12G/KiYBTu/2d11owfd4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773432041; c=relaxed/simple;
	bh=7y5xiInZCWmmHEw1menCYPBGJisRe/lJxFo8cH20mis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4e1sU5Mys3lP+2lKpA5VngcKt1rMIIIWFW0DRm4mV/HuMnbpBH8FEHg+1mKlQWUnVLKQ2Ctfn2Bq5PuToyV3RAuZZOdCWotVra2kn8ELYEKAL3pRjGd5R+y9PS+KbloIJMt/p6yIJKG2kk4i4AgPVX4KfB4iWEbJ8DU+CRI0fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Rk/7P1tc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773432038;
	bh=7y5xiInZCWmmHEw1menCYPBGJisRe/lJxFo8cH20mis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rk/7P1tc2/5uFwKiov74BGEb8RCgKEmBskn1txNGp5nOdDabX6F9uBWC5DGKJaAbJ
	 qHM1Bq13agSKpEOLatcRPLD+TAsXO9Kwaqlebhhxpn64r1H2BMsms01h9GnECeKcgi
	 PUsZqq2KO2l4ecS+HEq8tzXYLkvJqA+enVSU/7USCarlTf2XNl2Syj7q2Dy8p4tshz
	 1z7wCXXpisV0YDT/dT3ca2HDvXIm9d3xXBLqxxTYCa+TYMMyyoiM1m5z2aShZc/VbO
	 lx0GwJE/HdtlOZy988O9SkW423YeSfKFl19AoImYAx6HrxbFYQs4q2iNKvwmX/gcrE
	 fKhRfRZfO90Vw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8D0417E0222;
	Fri, 13 Mar 2026 21:00:37 +0100 (CET)
Message-ID: <e064b4f2-a138-4ea9-aee4-93ac8af38f64@collabora.com>
Date: Fri, 13 Mar 2026 21:00:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] media: dt-bindings: add rockchip rk3588 vicap
To: Conor Dooley <conor@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?=
 <mai.kuznetsov.misha@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
 <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
 <20260313-quickly-imperial-47638c9f0d4f@spud>
 <20260313-coyness-jab-ff0c85654555@spud>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260313-coyness-jab-ff0c85654555@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55776-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 48A72289859
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor,

On 3/13/26 17:57, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 04:56:29PM +0000, Conor Dooley wrote:
>> On Fri, Mar 13, 2026 at 04:20:44PM +0100, Michael Riesch via B4 Relay wrote:
>>> From: Michael Riesch <michael.riesch@collabora.com>
>>>
>>> Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
>>>
>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>> ---
>>>  .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  2 files changed, 257 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
>>> new file mode 100644
>>> index 000000000000..7fd4214921cb
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
>>> @@ -0,0 +1,256 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/rockchip,rk3588-vicap.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Rockchip RK3588 Video Capture (VICAP)
>>> +
>>> +maintainers:
>>> +  - Michael Riesch <michael.riesch@collabora.com>
>>> +
>>> +description:
>>> +  The Rockchip RK3588 Video Capture (VICAP) block features a digital video
>>> +  port (DVP, a parallel video interface) and six MIPI CSI-2 ports. It receives
>>> +  the data from camera sensors, video decoders, or other companion ICs and
>>> +  transfers it into system main memory by AXI bus and/or passes it to the image
>>> +  signal processing (ISP) blocks.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - rockchip,rk3588-vicap
>>
>> Curious why this cannot share a binding with the existing 3568-vicap.
>> Looks pretty similar binding wise at least.
>> If it's an entirely different architecture or whatever, please mention
>> that in your commit message.
> 
> Looking further, it's using the same driver too...

It's not an entirely different architecture (indeed it uses the same
driver). There are some differences to the RK3568 and the PX30 (which
uses its own binding as well BTW): apart from different resets and
clocks that's mostly the notion of the connections to the ISP. But to be
fair, as it turns out this boils down to two additional ports.
Other recent SoCs (e.g., RK3576 or RK3562) will be a good match for the
RK3588 binding, but then again exactly resets, clocks and ports may vary
in that variants as well.

Personally I find this variant-specific DT binding magic hard to read,
and thus I went for a separate binding. That said, please let me know
what your preference is and I'll arrange it that way. Not a hill I'd
want to die on.

Best regards,
Michael


