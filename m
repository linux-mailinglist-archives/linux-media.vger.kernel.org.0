Return-Path: <linux-media+bounces-66781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qvf7EZrPS2rbagEAu9opvQ
	(envelope-from <linux-media+bounces-66781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:54:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A9712DBD
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:54:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=BMgJFb73;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66781-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66781-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC1D335D00C9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 14:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD68039891D;
	Mon,  6 Jul 2026 14:35:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978773988FF
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 14:35:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348518; cv=none; b=rgvjbbVqMcHyrekn1Ya0snbOSFD+hTyqU6Em7EHx1h4jPPC49XVJway1OD1jOlNrcj/Ccmzo+ke5ajd9BN2UoZyarCt4QSL5vdcoImQBVSeRMt5dYHq1r6vdtgvGJxx8kx3fhrlOYtFYolCPaEWD2F69ZPjJdB4/KZZO6Wp1Oks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348518; c=relaxed/simple;
	bh=qbcykGapVHfJqKgmk81AzQE5m3FAmFj5hgBqq4G2K80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic5fnuTdzEWqjxfPnNM01vFhdEQxewGlEEejZ5h72Z7OkmNC7nL3uUPQGKavMU1T06esQDhSKMyH204b9XyZey0gKTvNMBufc9JiQSfy0te4M7lCwXrCF4RcRcy1g/23XODGjbpbvunIpq9JTKJiuCsJ8ltqT7Kh5mcM8RwDIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMgJFb73; arc=none smtp.client-ip=209.85.167.45
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebd7da975so368141e87.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783348515; x=1783953315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4NvKO6c1aWnO7A3eGSV7QhwSsdTS9m/BEA8j1DxA8pU=;
        b=BMgJFb73KuX+uJomEoYRx3iLRbw4WlxBxrRGOWglEJuA6fP45IHv5VjKFT455Grvky
         rRY3imrwdYW0UfR/Zpu/kTLx6VXsHZ654QgxFAoMoBQ1glWOFneQ1UgjtT/5r15b/PxT
         pfOiiGbVaTjs/wZZvZaxOP+/eobY9RZ2OMB/boyRJQ8zXMGaaprWZMJd2gUExA8BM9FK
         O8Xl/EKQbhTtiFkALC0q6ocLTpdwqREw+xYP3ufkASX1/OKFbFOjmWHJkxxHp3arXohS
         GcRAnq3k9HBYLpEb1viDb7v1uU3cc6y1vAhxJxIxUcM6xHsmTUxargiN8ogPSZ9HFbzp
         o90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348515; x=1783953315;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NvKO6c1aWnO7A3eGSV7QhwSsdTS9m/BEA8j1DxA8pU=;
        b=aOd2Ql9uOt4a0jtabLaxdZUhIIKWc6UjPVqj9VtUr899LxfWHaAO2yJu2qwxEihxXy
         rjcCeaQLVPZHmTp+tyCfVPGbVNipLnS1SB07Sn95bZcM+mZRmvCRXSi9cawQiYrl0cgO
         Hh7c26EUjrzqkW7SpdzIcOdadQBdRfG00UEZP83ESUVa82CTgTemihEd+diblo2lJOmN
         vutWkxsn7uzQY8MAUQtzjjoUnfk7HMMalr1efthd1GaJHtTxL3sf1zYkYZgYc4cnqHnY
         o9K6lu6dwyraLefZQZaMfkDEierd/G1mmfOsbc1J1ciJ2dfv1Yi7AxnwdB4s1jJrGlli
         9aXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4GDAW8vfxKev4/luLBRphTadD1IBp8BEubjVQBwhB72BCPrf/lHGwZ/lwopDpv8vZ3l9KJDMzqZLOGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Asso1CBqVpVfulttEFizeP0FhgtfjIqfF6VDCWcW2eJbn+Jc
	FywmjfgK6gipgtxtl65mosSfWET/3OZfPBqBbLxo7C6VDuN5ayhY+xCRq1R5i4qWE2eEU97Ew34
	PUmlee5U=
X-Gm-Gg: AfdE7cnNZw8m4ETpINGIDnLZ0ybs3u7+YlW/bi7MkTepHhosl0E6BpQbM4Xha+P5dpF
	1Tu/HQcyCxlNP+500lEekxshFgKauNTyXfSLZ1Rhz6eDIdFNY/lIbl3QntNy754xOOYJEtWR7mu
	/ZOV1dEQGtIKPYcG3v4fCMFwyD3tOKA0pXWLJN1VN0NbjD+uD83lhwn6NVe4vplwVmNlmCoMq17
	zT8ZpOT6eMP1JJxpCEjhcBn8hygcvl+/vTcVvNw/0CalDANV/VowWOEbg2xf/soPoGxK1iwmrQw
	92cSUSzm5pnchIFzJ3F/jptltprExZNVTY/yBb+fzWfRc8cGSicoQ0wkiHcjfDfnPyeTO05lqEX
	FT+RgW3yKKlrm3wkOTm6lKZMnRXOPRE2Qz7xUKvj3WNrTFguJ6ajyCNU34QQxi0OsbLzqWk731F
	0FIRfkXVD3byzePWYzt7n7qndUa0YNzjP46Zyfq43Jga+QPP4B+6zCbpZ4zbtfzcZt1AY=
X-Received: by 2002:a05:6512:8348:b0:5ae:ba8f:ad39 with SMTP id 2adb3069b0e04-5aed454f924mr837407e87.4.1783348514716;
        Mon, 06 Jul 2026 07:35:14 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bffcasm2971872e87.61.2026.07.06.07.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:35:14 -0700 (PDT)
Message-ID: <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
Date: Mon, 6 Jul 2026 17:35:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
 <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66781-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF1A9712DBD

On 7/6/26 17:12, Bryan O'Donoghue wrote:
> On 06/07/2026 14:57, Vladimir Zapolskiy wrote:
>>> This debate is going nowhere. Check the downstream you don't need the
>>> docs titan_top_gdsc is provided by CAMCC.
>>>
>>
>> There is no debate, since my arguments are not debated so far... Why?
> 
> An odd claim, since this is the fourth ? level of email reply.
> 
>> And at the same time you didn't provide any support to have N identical
>> spread hardware property descriptions instead of the single one.
>>
>> What is a good enough reason to prefer complexity over simplicity?
> 
> I'm not sure I parse your here. The core fact is there is no "thing" in
> the CAMSS block that can be modelled as a provider to JPEG in lieu of
> TITAN_TOP_GDSC.

That's fine, I have never said the opposite.

> That GDSC is provided by CAMCC not by any other silicon block. So

That's fine.

> omitting power-domains for individual nodes is incorrect. Best practice
> and in fact the _only_ practice that can work is to list power-domains,

Let's step back and discuss hardware description of CAMSS IPs, so far
there is no point to jump to the practice.

> interconnects in the individual nodes themselves as - I've pointed out
> multiple times now - those blocks have to ramp clocks and scale voltages
> dependent on their particular use cases.
> 

Right, you've pointed it a few times, no surprise a straw man fallacy
argument resembles as is, because it does not address or debate the
initial point of concern [1], when the absolutely excessive complexity
is proposed to be implemented for "CAMSS power island" and its IPs.

[1] https://lore.kernel.org/linux-media/e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org

-- 
Best wishes,
Vladimir

