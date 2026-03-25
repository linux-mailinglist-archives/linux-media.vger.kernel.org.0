Return-Path: <linux-media+bounces-57095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NisKx1WxGljyAQAu9opvQ
	(envelope-from <linux-media+bounces-57095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 22:39:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F232C8D0
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 22:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20289311590D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 21:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CDF396B76;
	Wed, 25 Mar 2026 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e+rDolsH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5531A072;
	Wed, 25 Mar 2026 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474489; cv=none; b=T70XjjQnetiW4bRXLu2pPlbQXMO/1a6FoW12gETtq54FVFQnvheaz4fWxqlP1Tdgwyk5PwXWeqSBXr0tPJ4nOUmFHR2PLY1Oy1oqc9z+k73p1t95dEXMN8ltthL3KzLD+jK4bOnWIjMBP2/nYNYmxpaL8oVAE/Jzey08VxOa6X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474489; c=relaxed/simple;
	bh=E1WXPXz+/NlfRML46gDMJ4qfQn90FVfE9nYP5/MLyMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkV/d6xfX9EL+guNkhAxeg3YVC7PTKtad4ixvuZPyUfmbiQ3wCDIh5D/71O1sidTt+Vmb4KQM1gt9CITtubFe+iygSNhAkONWf3rcLcLsjlg1gmMldLvC3+lVtRK3wh2jA1C74teaRxFd4nwtpAP4WkoI+WFeueo1o+CE3SufVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e+rDolsH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774474486;
	bh=E1WXPXz+/NlfRML46gDMJ4qfQn90FVfE9nYP5/MLyMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e+rDolsHY8954s81Mp/fexI2cypjxrLKc6/hIUuDpERQFz1AgsSs/k6BYU7Sz3rrK
	 SKImsKhlljGJuH+3OZEcXhJm8xoMTeiGsUijKm3BS/mgp70vScwP8BV9+qVzxuvmEZ
	 DuPp1sLsSP5GFzOb1vQ5olRjkHik0XMRcwT0HYkhplYrTTbuR8Nxo1v/pkKOgam9JW
	 ri0RroBwrfAP0fO00F15ZhuveO6PSW7Xrw113u8hOFw5ed3Tp3BjNUVj/4tQPDm/Ai
	 DRHPVnmKm5oX5xuT2zWvxywDxOlEpkJxPzMXwaZDwAApkA2FgZvIH8T8iNAKH8VUza
	 xjVE2rrtnyEGw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3FF117E5B52;
	Wed, 25 Mar 2026 22:34:45 +0100 (CET)
Message-ID: <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
Date: Wed, 25 Mar 2026 22:34:45 +0100
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
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260325210634.GA3963190-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57095-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 529F232C8D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rob,

On 3/25/26 22:06, Rob Herring wrote:
> On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
>> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
>> the RK3568.
>> Introduce a list of compatible variants and add the RK3588 variant to
>> it.
>>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>

First of all, apologies for applying your Acked-by tag. I figured
resolving the merged conflict was trivial and impossible to screw up, but...

>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> index 4ac4a3b6f406..3d3b3cd78884 100644
>> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> @@ -16,9 +16,13 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - fsl,imx93-mipi-csi2
>> -      - rockchip,rk3568-mipi-csi2
>> +    oneOf:
>> +      - const: fsl,imx93-mipi-csi2
>> +      - const: rockchip,rk3568-mipi-csi2
> 
> These 2 should be a single enum as they were before.

... hm. Well.

First, do you mean

properties:
  compatible:
    oneOf:
      - enum:
         - fsl,imx93-mipi-csi2
         - rockchip,rk3568-mipi-csi2
      - items:
         - enum:
            - rockchip,rk3588-mipi-csi2
         - const: rockchip,rk3568-mipi-csi2
?

If so, what is the practical difference?

Thanks and best regards,
Michael


> 
>> +      - items:
>> +          - enum:
>> +              - rockchip,rk3588-mipi-csi2
>> +          - const: rockchip,rk3568-mipi-csi2
>>  
>>    reg:
>>      maxItems: 1
>>
>> -- 
>> 2.39.5
>>


