Return-Path: <linux-media+bounces-66737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j6I/KwCxS2pgYgEAu9opvQ
	(envelope-from <linux-media+bounces-66737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:43:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33B711681
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:43:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Y7nnWQrA;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66737-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66737-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 413DA3477B63
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 12:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96BE423773;
	Mon,  6 Jul 2026 12:11:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C09424660
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:11:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339874; cv=none; b=lMBQJIfNrW3fqKVhjmEDfOamMUUyv72lF/z+cqoOrBAc1LmORlY30dv8wSABu80GZjV8EeGqAzqzMmIedWLZ/yEP8mWRYXalnq7x7lG4WhPzsr2BgBrVNNcKeEWf4aKsbTSxvy/rf226jDt/k0BVF61POa8lCphiIDEJyK/1dqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339874; c=relaxed/simple;
	bh=Q2U+Op+VJBwZYOYmZL+6AFPmXvDyszSs9SWc4mWsXTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pohfUyXctH0eRLgE78+RicX0MP3UXuTdbXQE3Rg5Ch8KwYybdy90NjJuB31lgdkhv7LmMbsNvdiI5FaSmYmNJ/3k1iix99MkExaOm9246Id8BMz6OU5R9P+03c3z65R3atx/9y6ZELuSWlr5YGdKKjfBjrYEvmQpZU81Le6ypN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7nnWQrA; arc=none smtp.client-ip=209.85.218.45
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c125bcfd9a1so408297366b.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783339871; x=1783944671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaIUyVR1PWkAm9FdD5PygQC8S63mBB2HotoKGs4tuv0=;
        b=Y7nnWQrAQH33hTrdMgl43FOkIkiPgwjlyVmPXc0AeLtOj95DJ/Bf3Qv9CLpmn6ekM4
         ThgMWcZ1Zsun/imq5Re0PE4p8/l+4x5m52h/PCM42DA1HpuEEl/4q1SbTMe6nOONX3+e
         qmZ1/JSFx5+eEiL8X5FTaBpSZY0CL5ND0Qztn63yEctP2IgJMn/FKB7EQC7JrRTiI8hM
         urq6scDiwaSJSWHsFxwNJCSZp5aWs/zlerN05cAtzVpVq8keecsMt/0VucnGlcY5Xn39
         cDgE6QBOunNPfTIYXbT+f/fawD3NszKM9bchaye7renITmT21R3d5DCvAuWO7LGE0OOg
         Z0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339871; x=1783944671;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaIUyVR1PWkAm9FdD5PygQC8S63mBB2HotoKGs4tuv0=;
        b=IxmxNN4Eo8aBo8kIIZZ69IPocll65dGxTwfrWfXc3MnmVVudGelAyq7Y678as2ZuNE
         52XJIUCL2l1xWf7hwg7vKGmc0Wx3HUsJoTjDtRHutjzmi+p/EMeSfL4TfDi8yLgnO2N6
         rkn5fGQd8YABgqBdJiHxH1oWRblit/qD5l4xGhoh23q0cwuMkHG8SgCzkzyBTObrR866
         0l2DkITSFejHBzauvAEWyTIx0dWzXAsMV7H2qTbL8ntoqxl9uwf7imMXCAl3h1YA1BiQ
         GHXwpugkRoFwi1yZagDJo+/HakoXHWlEIo5J0oVkOa09Ja0f5lYINvIcS0Za66ioSMMy
         +Mjw==
X-Forwarded-Encrypted: i=1; AHgh+RoNSpLxlimjrlc2lF4NrKcIblYyZE6I4jgXk/X4eHqOS/WflmhAWkWhmVEbDIRf/7ndzt6B2765z00EYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2A4mCPzxmOAolPpoyA7ii9rTCqCGQVxL1BqbIqGnw68Lgc9Fo
	bDH2BlgjsWn/RuKGkyLTwEAvi/O/HYZtegDdsk84j1V7kHiebQ/o3K+E1sbuwD3bpHc=
X-Gm-Gg: AfdE7cmNnSVKm7tAu+ZViSJxPlAJtWYq9TJ6OaKUAxOk5Y1NlXKf/j68jIT895iwD0A
	h8loeAZhobEyHNH5/NZ3vuSHJjFX0jWFUTVgDBVQ0NFCni1CPxBEeT3yN5ueufhEoOvAwqWF0RO
	hflnBOR7E30mmaSkexjSpXhx/Q3UNdTJ+TZXheqM/Xuek7y+osVBpk1O2mcvBKbitpJIcNUE9dR
	pE9+ELL3h15xGtdsnFXnQHRQT45Xh+r5NLzl9yJP8wsjMWxCQ1UXrVo5LmAM568+YbtTm3jI/SN
	iN7nGUUe/Js38UCYhDV+oSz7W1Dn9H1gw0ykyi+AQG81WO52yLBixLavKqFExTDT2tMXXv0SbD/
	JL8OkyB6hn30/fbf65ha5htBXgwPNhqBLQLZ+G2KngO6HIXcaRuPgb/qRvTJbpUTqyU/lcO1vcp
	l2QKmkQV3pxVhAXSnaTleQMhWVBg==
X-Received: by 2002:a17:906:d30b:b0:bd7:f75a:817c with SMTP id a640c23a62f3a-c15a67f809fmr14565066b.17.1783339871421;
        Mon, 06 Jul 2026 05:11:11 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6054fe7sm732082766b.10.2026.07.06.05.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:11:10 -0700 (PDT)
Message-ID: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
Date: Mon, 6 Jul 2026 13:11:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66737-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F33B711681

On 06/07/2026 13:00, Vladimir Zapolskiy wrote:
>> There is no "master" device in this block of devices - save perhaps for
>> the CSID mux / wrappers on some of these parts.
>>
>> We have shared resources like camera noc, system noc and external clocks.
>>
>> Please include power-domains and interconnects.
>>
> 
> Why? The common power domain and interconnects have already been
> described as resources of the parent CAMSS device, there is no need
> to duplicate descriptions in every child device tree node of CAMSS.

CSID, IFE etc are not parents of the JPEG encoder.

The idea is to make all of these peers, eventually. Not particular block 
owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.

---
bod

