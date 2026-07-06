Return-Path: <linux-media+bounces-66750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e9ycOqmiS2rDXQEAu9opvQ
	(envelope-from <linux-media+bounces-66750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 14:42:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE77C710A65
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 14:42:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="JmQ/2JrD";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66750-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66750-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED94730447FC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 12:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCF942CAE1;
	Mon,  6 Jul 2026 12:27:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693042A164
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340835; cv=none; b=dc03qOrhoOlGiFWqdeYhNJH7v8903fRO1h20ZZIRnbFhixtC7yxsVrBAZ4ohM1GMgiOpPSS8rT25qUsfx+zKRBl5Sdfnsee2CpY7lYt2BzBKaR+tpG/UoIuxqpi7jrw/kLXpV1LdCDmtmU5orrc/HWS8qikXdBhtcIbAFO8SKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340835; c=relaxed/simple;
	bh=i3On1m+1xOP7BaqxdPfl0e+BIrUqtmSgKy1W2+LpuX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otyz01kzfdSYsTmrv6zfS4JymsJAQGkbn0GtXKeH2AofvSWEv/HLkIV/cj3TGPr5A6PHgu54duzoHYLMmxS+RTp8Ht2JCLwkeVd+e0udbQc47GSg58qNY1VTP2UhgcAlaCdEGN0nJAdmcf0LxAmIRm9NG+szRElcdBD/BTMU7GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JmQ/2JrD; arc=none smtp.client-ip=209.85.208.48
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso4957503a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783340827; x=1783945627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqZgOHmUP2WhlukFUJpUWMWTr9sro7DNP6QMMUzHrZc=;
        b=JmQ/2JrD+d2kvtqkaU22bC2mWFrRlJ4H2FnVSktcJN0erOtu29cej990y36xBDfl6g
         /5dlt3o4eb7siCqhl5dNTGgoUcrgr4O2VB43aUlpVik2gYDjiaotg7bh/M2n65kKV2Bz
         ugswnz83dkP2pLwsQsUK75XSMU8njWzBpUwYjTaGzDJ3vGtc7taG0QNSy9OI1QvxhPRT
         NYnNI5nu4eXrFC5s0qwVoy2eNsXrJWjeQ2FQE1vqg5nZIVJJ2x6KyaM8HoZSBiJAwrv1
         8t3bPIsKcPyMAcKEe9I1R4SDYOleMzEYa6J/P+3ouANVbyKF1rm6x85ihf0gl63zpi18
         mgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340827; x=1783945627;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqZgOHmUP2WhlukFUJpUWMWTr9sro7DNP6QMMUzHrZc=;
        b=rgYQwyVzy9GxL4y+JVOymnKqKybWURcsaSewz9YQy3caCiVwyFRJaXlyI+6oYovKE9
         xHQqYs7c1fpG/hlkOIOZutryERFjc0y8RWgBLjcf4cxKECdZsNJtbOns9agzHCdNmvMQ
         MkO34OPUFTl7658Oe76r/fcLASVYfYw5Fnt+xl5ds0dB6p0NA+0balPN1vXH3r0DaG0s
         2jYVL0n5YvMx45WHKheB5x3SYqxSaujcuxS1stKCybgA4MdRMkhXTWZtHKBGhg1Wwo5S
         vzLwJFNdoiY5UiDjN3EtBeps5S/cpoUH70bvaC43jdxIc0vvBWPnhC2uioKB6yQM2Pwa
         iFmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpcb2FuUhZYZnXOQWm4KWnpjUzx5zKMZ+eeCP02Puhhyh4XUf8qkem3lp0Jp4mW4z3+Xjctnm2JvP39eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2XXNOc66rwgX0TF9Sw+HiWmmDID2X1V2YcTnXMpFg279Y/qn
	GifvXbCl+BAoIWmtekc3EtNHW+HmxS15UTbXFBshyNAJvOqahiBYxU6ObXfSVW8u7N8=
X-Gm-Gg: AfdE7cmWQgVvy4yPG0mEaoQfU0xOC2yIK5M0clMWW7vvlmoUuhJq3wnGRqgWYdJHGds
	Fw9vUXD1eAoIsENyR+HqwFruCyVcFjDAgOSrDSz2eko1NqyrgeJ0MgcZUUaxDLaZdS64FcP3kjr
	ICUeRhy7v2ElhK0Lqh3/oLbZ0UWfdHlwL04VDq5LvsdiXkkbtNTarOyq736wyKU60HGL6cmkTzL
	Mr7BmI17JcBgs4vTRaW/Amg9+LaePnyAbJ0Nj9zaerMZFBekKQl/NFVVgU+hQ+GgaKCcijkBDOB
	yoHgLaCXh856U+aTs2f3verDTOHAq2mLit6mGBQx/FCIxo5G83w2vllveXAaUmnvWZv7wbCtRH/
	FLcD3ecze+6e4ShMht+IwTA6czuS17RkKsRkthbFNqXdzUaBPQpKfJ1DEBTQ5JD4zoYmEoa8WCv
	nSdMkTY9+09E8n+2SgvTflhb3nyA==
X-Received: by 2002:a05:6402:2115:b0:697:8d48:7fa7 with SMTP id 4fb4d7f45d1cf-69a85ba021bmr238124a12.22.1783340827234;
        Mon, 06 Jul 2026 05:27:07 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4a60sm3946787a12.8.2026.07.06.05.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:27:06 -0700 (PDT)
Message-ID: <8871f6d6-6102-49bd-9758-faebbd9fa19c@linaro.org>
Date: Mon, 6 Jul 2026 13:27:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66750-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE77C710A65

On 06/07/2026 13:09, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> I do not understand this rationale. How is this required now? Are
> existing DTS broken and do not work? Then this needs to be explained.

Required is wrong, true. Existing DT is not broken no.

Should read something like:

"Use devm_of_platform_populate() so that child nodes declared under the 
CAMSS device tree node (e.g. OPE) are automatically instantiated as 
platform devices."

Why this patch ? We also discussed simple-mfd but then settled on this 
way instead.

https://lore.kernel.org/all/0f898ad3-156d-496c-b2c1-88646edc7ab6@kernel.org/

> Best regards,
> Krzysztof

Not withstanding this series, I'll fixup my version of this patch ;)

---
bod

