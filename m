Return-Path: <linux-media+bounces-61464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yONzHN+PBGoVLgIAu9opvQ
	(envelope-from <linux-media+bounces-61464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:51:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2586535757
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EF403014517
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC293812C2;
	Wed, 13 May 2026 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="OiMQMTZx"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C847A20010A;
	Wed, 13 May 2026 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683694; cv=pass; b=ZfcIH04NtbrGzDieh+72lai+H4h91MqvDxr0CnlEFVz3Ddr9oJCVXdJVDuinUrsqoQtxN6NwOQokY1Irvq6dApeMQopPYuIBtUi9BK4Zhh9kHYr/KTrZngdFGSPezdN5/OHxN0A+jrVzAC4q9RBg4zizkFP5uEnsOr9R3aHhuV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683694; c=relaxed/simple;
	bh=7Q5KgUM+tw7xqd1TaDwTpSv7r9RU13BFwt3gRw7RFSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3yKhH7m55h+/vHNVkGsP70XXZTxvpGtRHSkm/14/oiexKuLnMLxzYQNU7g2wyTZ5OKFxLPTjBcJ9S+WUC4shN20eemQgnfux8IbnkCkMScSKhlB2OkPlxdQmHWVen3tvXsMUlOsJ3KwKzrlmdfgOrtlkFHpolKbxe74h58n+U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=OiMQMTZx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778683653; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z34X34TAKvlMFPBzLMiQeMxOY5tJcYfk5GXWV5byHgi+sixNHICT8IWftedkRe3lV2y7SXAmMlkhKaFJPqitasAx4iNYbtpUQwWGcOMj1mOvUo6PBeBPD1k5dJoXm95NYCY0xiV6U8geuK4r+mlvEPyIDNPXK3sWP/W97dxsA+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778683653; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Bq9WGORoYPZBXmUGqu1w+1NLwysPb53TwFNAairTvjw=; 
	b=ax02RYhsjy8DejWtvvKv6ZrQXBnP8G55UsSI2RCP5xiBfyC1a9tdz+zAAFUp/obKyDNAJyjSdmLwMOYfi4iAp54c9+J9I6FgIWeWv9rZjldlJfasZbe42nQjI5ZDq/KDlW4nFumKTRmPScMMjToWL6iKfzNRBFbLTBEC2AEDCf0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778683653;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Bq9WGORoYPZBXmUGqu1w+1NLwysPb53TwFNAairTvjw=;
	b=OiMQMTZxXNdQs0FIeDwRBJMbKqL5MmN/NkGiOTorI9PhSffIctLaUKLziP49bNL/
	658SrtBw1oHTQZ7GSIR349dnJU+Ly9GtCMVslND4aOZELg8+4LliZit9LHYf3B6DkUc
	xslDa0OBlqy2+r+t2W6ZFYcKTh/nl8wcg2XnWrko=
Received: by mx.zohomail.com with SMTPS id 1778683651997490.307654217934;
	Wed, 13 May 2026 07:47:31 -0700 (PDT)
Message-ID: <f59370e6-7921-4227-a8bf-ccbb9f03da23@collabora.com>
Date: Wed, 13 May 2026 16:47:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] media: dt-bindings: add rockchip rk3588 vicap
To: Rob Herring <robh@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?=
 <mai.kuznetsov.misha@gmail.com>,
 Charalampos Mitrodimas <charmitro@posteo.net>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
 <20260508-rk3588-vicap-v4-2-6a6cd6f7c90b@collabora.com>
 <20260513124858.GA585254-robh@kernel.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260513124858.GA585254-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Queue-Id: E2586535757
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61464-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com,vger.kernel.org,lists.infradead.org,microchip.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Action: no action

Hi Rob,

On 5/13/26 14:48, Rob Herring wrote:
> On Fri, May 08, 2026 at 09:31:45PM +0200, Michael Riesch wrote:
>>[...]
>>  properties:
>>    compatible:
>> -    const: rockchip,rk3568-vicap
>> +    enum:
>> +      - rockchip,rk3568-vicap
>> +      - rockchip,rk3588-vicap
>>  
>>    reg:
>>      maxItems: 1
>> @@ -26,37 +32,23 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> -    items:
>> -      - description: ACLK
>> -      - description: HCLK
>> -      - description: DCLK
>> -      - description: ICLK
>> +    minItems: 4
>> +    maxItems: 5
>>  
>>    clock-names:
>> -    items:
>> -      - const: aclk
>> -      - const: hclk
>> -      - const: dclk
>> -      - const: iclk
> 
> Just keep this here and add iclk1 on the end along with 'minItems: 4'.

Just to make sure I get it right: The names on the RK3588 would then be
aclk, hclk, dclk, iclk, iclk1
?

I liked that zero. But OK.

Looking into the future, the RK3576 downstream has aclk, hclk, dclk,
iclk{0-4} [0]. Again, if we rename "iclk0" -> "iclk", we can do the same
trick.

However, the RK3562 downstream has aclk, hclk, dclk, csirx{0-3} [1]. We
could rename those to iclk, as those iclks seem to refer to the CSI
hosts/receivers.

Yeah, should work I think. Will update in v5.

Best regards,
Michael

> 
>> +    minItems: 4
>> +    maxItems: 5
> 


[0]
https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk3576.dtsi#L3342
[1]
https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk3562.dtsi#L2073

