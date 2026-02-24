Return-Path: <linux-media+bounces-53303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G8POSm4nWnERQQAu9opvQ
	(envelope-from <linux-media+bounces-53303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 15:39:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8EB1887E5
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 15:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 294F43078BF9
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584AC3A0B02;
	Tue, 24 Feb 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIay9dhO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0487246BC5;
	Tue, 24 Feb 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771943681; cv=none; b=VfblZHRaFuCU8YVcYYWfTkZUbWQ3nrm/oA05dWVGNHadKI9iIwF8ipd2k8yAEUlr9GgxRbcAqyuFfUqKXWxJYpE1qseTy5iRIBum4wQcLZFF1+LPR3RaPHSs9ZMxdKSWH9E3/EZhJjRsiDdJl16+zFtaGTYQ7WSbWCfk7wc+DDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771943681; c=relaxed/simple;
	bh=ONrZv/Iu6JWBztYdh+If2jwoZaKJW0Rj0z5BS5znOgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wxn3VDezn8ZJkO48kyFfXBniTsW0yVqjvGTkbm5iJP5imCVxzU3WG3Bq69cGl4ehupkwcIU1NHxq0tuprVEjf675O4hTmorQVl6T5m8QbApaQulSdP4rnEVdZEt18Spz67XmbwDqCmrD0JE3jIU9ICsCkMtpKjxNbPRWn5617jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIay9dhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE404C116D0;
	Tue, 24 Feb 2026 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771943681;
	bh=ONrZv/Iu6JWBztYdh+If2jwoZaKJW0Rj0z5BS5znOgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QIay9dhOkmQuG3tnDjLlIFjJjdqNNX28pHW5hV13zcYYTXRuNob0DmAFubY7ELLwM
	 JrlocQ3+VZ3H6U0FR+8CKOnu7nxLPILtXgsVZJQ4grj1xqj+MZjtQMLhuIPuA1LRzf
	 HskFXf5m6YCduHz3G1b+/ahmyp9BQi3eSKNZDsptcgWN1bRQuIrmA1GbnZ7+iD29Hs
	 n+4PUn8s+WrTDENwUajLTmSZ0z/pAJRWwYwe/b1bkvboFXXKZfqkL+CdPfsyoRqzUf
	 q+x9v/Xe6B8T5Uw9XMjnw7C95JKHE3mYkOZf7fkUZsCoroZMnxLq6QdzT+1sYPi9Cm
	 R9xYGX2hx0Z8Q==
Message-ID: <1cdc36f2-6e51-492a-9063-7d0a784f5118@kernel.org>
Date: Tue, 24 Feb 2026 15:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct
 reg-names order for RK35{76,88}
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
 <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
 <244b22d3be77047163b4e47c4ed33b5b1befb4b4.camel@collabora.com>
 <0874bb3d-b38d-4ea3-a5b0-2da2484cc3e5@kernel.org>
 <e73da0713587ad5380344afa686a13431d07e232.camel@collabora.com>
 <af6c6561-3d41-4967-a224-cf239335dc5b@kernel.org>
 <0c9a158a-f70e-461c-900b-6f6485064a02@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0c9a158a-f70e-461c-900b-6f6485064a02@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53303-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B8EB1887E5
X-Rspamd-Action: no action

On 24/02/2026 15:07, Cristian Ciocaltea wrote:
> On 2/24/26 3:54 PM, Krzysztof Kozlowski wrote:
>> On 24/02/2026 14:48, Nicolas Dufresne wrote:
>>> Le mardi 24 février 2026 à 14:18 +0100, Krzysztof Kozlowski a écrit :
>>>> On 24/02/2026 14:14, Nicolas Dufresne wrote:
>>>>>>>  
>>>>>>>    reg-names:
>>>>>>> -    items:
>>>>>>> +    oneOf:
>>>>>>>        - const: function
>>>>>>> -      - const: link
>>>>>>> -      - const: cache
>>>>>>> +      - items:
>>>>>>> +          - const: link
>>>>>>> +          - const: function
>>>>>>> +          - const: cache
>>>>>>
>>>>>> No, ABI break without point.
>>>>>
>>>>> Its not released yet, otherwise both order would need to be allowed.
>>>>>
>>>> Also, not true.
>>>>
>>>> git describe --contains  c6ffb7e1fb90
>>>> v6.17-rc1~90^2~3
>>>
>>> Ack, I thought this was part of 7.0, it would have been logical to be part of
>>> 7.0-rc1 I must say. Whatever happen, backward compat will unfortunatly be
>>> needed.
>>
>>
>> I was here checking the binding, so the ABI. DTS maybe was in v7.0-rc1
>> indeed. Anyway, the commit msg should describe the impact on users of
>> this ABI, at least known users.
> 
> My bad, I only checked the DTS changes which landed in v7.0-rc1, and wrongly
> assumed the binding also landed about the same time.  I think it's unlikely
> there are any (external) users of this binding, but obviously we cannot be 100%
> sure.
> 
> Would it be acceptable to extend the binding so that it allows both the current
> and the new proposed order to coexist?

Depends also on the drivers and that's your "users analysis" should
cover. If there are no known released users of relatively new ABI, it is
fine to propose the change with such explanation and reason - poor
hardware description because convention expects the main device's
address to be used as first "reg" entry.

You can have also oneOf with older list "deprecated: true", if want to
keep any users unaffected.


Best regards,
Krzysztof

