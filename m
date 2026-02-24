Return-Path: <linux-media+bounces-53302-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL1rGKCwnWmgQwQAu9opvQ
	(envelope-from <linux-media+bounces-53302-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 15:07:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D66171882FF
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 15:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70CE43033BF5
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 14:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B6239E6F7;
	Tue, 24 Feb 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I3hbAez5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2450D241690;
	Tue, 24 Feb 2026 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942037; cv=none; b=AgJxwkfwogUFM/uygF+qQnnBKKJUiP8nsWPmJg9OTl+nL9NN/sDHdSWZMVz9vEV8BYn1ZB4RIzsQu+jecVC+JlRLA/rL9KFskelhU3Yz/0G2zl9KMM4m2+5IFd1J082HGseQK/6hI1gnsTTZw0J94GL0uOGqsfUZkUZ+vnSTigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942037; c=relaxed/simple;
	bh=GHqOMsVIhnM/qwB2gCQ7BjybcTTTqIh1JgBMM216iN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw70B2M/QZO00t9SRIOJ+aMlzYnzRkJgNLELiPgMRVGok7SqQL8HhRUYdZRv5gJUuvw3imUDOp0fykDSgAXTrZyM3PgBmfjzgsmUm4cH1wNzvtRa2Fz20isJpmTAKLJ7BC/Q1wCib1Wm3h7TsxoyEyJJNgJFFj81n7uP/juAnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I3hbAez5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771942034;
	bh=GHqOMsVIhnM/qwB2gCQ7BjybcTTTqIh1JgBMM216iN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I3hbAez5JGJzQLHds0zTJby2v3l21CQAIDqMmf6UFT4QbKY2ap3g0TAqDhIvfNV3m
	 pNC4dibgW3KNhsy0MBxbK059ec/YZdJ+DkbTuMQ2SBpiS34Lsu/yKB0xEYEV/x8bdA
	 6zP0a7X+PifMQiZdNzdvgDwpyhMXZkvnCsXGFvSv3iVqlDxparBUYIzDNJGkm6F3KO
	 CWeA6rTOvRCiHKOzNzWs/zCnBet43s8f2sGGltNIlYkYuKxotkU7CoQVPM5xKrSAI+
	 m2M8szYFONBEae6oGZ1xH7WWo2trFqVNKDsHRo0bvBOgB3K0GHlXYiz6ItbCZZQhX2
	 Ouz8qDzYvZB5A==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7967017E01E7;
	Tue, 24 Feb 2026 15:07:13 +0100 (CET)
Message-ID: <0c9a158a-f70e-461c-900b-6f6485064a02@collabora.com>
Date: Tue, 24 Feb 2026 16:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct
 reg-names order for RK35{76,88}
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <af6c6561-3d41-4967-a224-cf239335dc5b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53302-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D66171882FF
X-Rspamd-Action: no action

On 2/24/26 3:54 PM, Krzysztof Kozlowski wrote:
> On 24/02/2026 14:48, Nicolas Dufresne wrote:
>> Le mardi 24 février 2026 à 14:18 +0100, Krzysztof Kozlowski a écrit :
>>> On 24/02/2026 14:14, Nicolas Dufresne wrote:
>>>>>>  
>>>>>>    reg-names:
>>>>>> -    items:
>>>>>> +    oneOf:
>>>>>>        - const: function
>>>>>> -      - const: link
>>>>>> -      - const: cache
>>>>>> +      - items:
>>>>>> +          - const: link
>>>>>> +          - const: function
>>>>>> +          - const: cache
>>>>>
>>>>> No, ABI break without point.
>>>>
>>>> Its not released yet, otherwise both order would need to be allowed.
>>>>
>>> Also, not true.
>>>
>>> git describe --contains  c6ffb7e1fb90
>>> v6.17-rc1~90^2~3
>>
>> Ack, I thought this was part of 7.0, it would have been logical to be part of
>> 7.0-rc1 I must say. Whatever happen, backward compat will unfortunatly be
>> needed.
> 
> 
> I was here checking the binding, so the ABI. DTS maybe was in v7.0-rc1
> indeed. Anyway, the commit msg should describe the impact on users of
> this ABI, at least known users.

My bad, I only checked the DTS changes which landed in v7.0-rc1, and wrongly
assumed the binding also landed about the same time.  I think it's unlikely
there are any (external) users of this binding, but obviously we cannot be 100%
sure.

Would it be acceptable to extend the binding so that it allows both the current
and the new proposed order to coexist?

Thanks,
Cristian


