Return-Path: <linux-media+bounces-56303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJXmJ/+tu2k8mgIAu9opvQ
	(envelope-from <linux-media+bounces-56303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:04:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D962C79FC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94D713016AD4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 08:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005683A6F09;
	Thu, 19 Mar 2026 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a8OcSNGB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B344358362;
	Thu, 19 Mar 2026 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907451; cv=none; b=UGZTOSIEdhlVx/+OWfiR4NsN0cpJrMNlR3zscaZ8HwlE5cXT3wcVF3QaM7+iHkda+B0ST+D7qac6WLQPygY9YXq5sNTPEncFy2/IxYWzh+feDLIQDENb0EjkMXPYq063EzYWI1T9+n/v9O79xZxyd54FM7vXXLUspkmAc+eeNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907451; c=relaxed/simple;
	bh=oddScRKYzaeDQ9pGWNCQ6oWoxk9xdprHLqYG2eBVmlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYDOshDJt3CCTY2OBLQeEOuF/7QnRMXMXEmg/PaXe3BXiL3fh40n4dlzwbSUGni6ya5lHVnA1TSmexDwwCMti7LIZz7RjH2P/auaBhJ9RPkdkeYgUchJm9j8gp4wL+5p0gAFypVMXbyrHy9YaWAXs3hwAeXlUDw15Lr/1kedjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a8OcSNGB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773907448;
	bh=oddScRKYzaeDQ9pGWNCQ6oWoxk9xdprHLqYG2eBVmlQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a8OcSNGBcqdOsgpeikZ6TXswpBrTS9I3QHnKk4mNa0ibBWD068edwm47HjayT4h9W
	 kxWXUEBdKKC3YD7ccz827IEJHKzS+rNgyqGqeYACcKdFDPNLbot5QEmfSaYqxiNZef
	 Z7Me4f46esE/NOqrpk5CnbXQb6wR7RTn8E0qZq7mq9DoIfsAk01VzTJo2FSBq8ZZGc
	 LsHtwOI8bBu5RjlzRVl7IoJAvLTZ2O4HTJyXlwwqo8OT6fexWio6egKG2laLdeJ0RM
	 cfmnbWJPA03dE3djLFFy3BHb+pBsujxk8g5X/ZGCXG90x3S3PipBHzGxjnmySWmJEG
	 PGL7qpyblQgng==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79FE417E0EB4;
	Thu, 19 Mar 2026 09:04:07 +0100 (CET)
Message-ID: <d9a9be92-7439-4899-8be2-adf7f0490790@collabora.com>
Date: Thu, 19 Mar 2026 09:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] media: dt-bindings: add rockchip rk3588 vicap
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
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-2-77de5ee9048e@collabora.com>
 <20260318-mumbo-lumber-b550932a5423@spud>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260318-mumbo-lumber-b550932a5423@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56303-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 40D962C79FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor,

On 3/18/26 18:52, Conor Dooley wrote:
> [...]
>>  
>>    resets:
>> -    items:
>> -      - description: ARST
>> -      - description: HRST
>> -      - description: DRST
>> -      - description: PRST
>> -      - description: IRST
>> +    minItems: 5
>> +    maxItems: 9
>>  
>>    reset-names:
>> -    items:
>> -      - const: arst
>> -      - const: hrst
>> -      - const: drst
>> -      - const: prst
>> -      - const: irst
>> +    minItems: 5
>> +    maxItems: 9
> 
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3568-vicap
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
>> +          maxItems: 4
> 
> Anything here that repeats the outermost constraint should be dropped,
> so no minItems here..

I already took a look at similar VICAPs (e.g., R3576) that will have
more clocks. This is way I left this one in here.

But I guess I will remove it and add it again when e.g. RK3576 VICAP
support is added.

>> [...]
> 
>> +
>> +        reset-names:
>> +          items:
>> +            - const: arst
>> +            - const: hrst
>> +            - const: drst
>> +            - const: irst0
> 
> Were you willing to reuse "irst" for the 0th irst, all the repetition
> wouldn't be needed. I assume it represents the reset for the port at
> address 0, so it wouldn't even be a different meaning on each device.

Not quite I think. "{a,h,d}rst" are the same on all variants, then there
is "prst" and "irst" on RK3568 and "irst{0-5}" on RK3588. So I thought
that writing it out explicitly for each variant is more readable (even
though it may need a few characters more).

OK?

I'll try to send out a new version later today.

Best regards,
Michael

> 
>> +            - const: irst1
>> +            - const: irst2
>> +            - const: irst3
>> +            - const: irst4
>> +            - const: irst5
>> +
>>  additionalProperties: false
>>  
>>  examples:
>>
>> -- 
>> 2.39.5
>>
>>


