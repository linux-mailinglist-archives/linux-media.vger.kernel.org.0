Return-Path: <linux-media+bounces-51725-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GQ0Oe3neWkF1AEAu9opvQ
	(envelope-from <linux-media+bounces-51725-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 11:41:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB2D9F9E8
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 11:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC2ED300D947
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 10:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD3B301701;
	Wed, 28 Jan 2026 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXzD/Yt2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9802DEA86
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596882; cv=none; b=K4FRECYm5aEq4YK27HRa8v22uhoqTMaKyGpGVORat4G70r2G/C4gzE6Nbo5MSn7iQlcKlCKMTqXNpOZ8SM7Yn/FGShkdYIVyLCTnjOydf7aNjtYewS7aCLsUCRDSuA7hcXrDk9K2dcLN19OO5Q0ADHxjhf2E26zMkbROVBIlprA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596882; c=relaxed/simple;
	bh=BF1Tk583OYnavcumB+Q/6k0kWYo9Y1pbJOM2dT6gFmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XaVMV4+qHE9XvwbXWiVjE+1vI9f2Q+4QSiDcKHWPrbvZ7gu+PW9FgTGj/F5V1CjuqPxUtfRrmf0cLxPZgW48XW1P20Kkb9om2BZhhQZwDhLcNVj9LnPX75GkSVoWAYfbHG9unNVovhKwS4ehFisNdeeJJFqRcvzTgt4VtrX8+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXzD/Yt2; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b884a84e655so937108166b.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 02:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769596880; x=1770201680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64aHssFZr7VaxSK0D6/XN0631oo5malDp14UZIFT07M=;
        b=PXzD/Yt2mujEUP7VSMH52NsnrPF+3j7r2Avs04TpL1QLOvgf6IrwIocmTD4cfG+tHq
         gHukyNJ2bo2IHKru5VxsN8HXPjlNMnJE5X4Mf51838dk6NBm6fCGND/ZjJPQNqwgxJyk
         ZLxCIjnL4xP2c9Ki1debrg1+PxGKhd5tiddC1X432clsA0xENf6AF8uGYd3fuhGlDL36
         CE3q/JrjNhSrqFPMfkgp7BLCR9eV5jc75fekhEhSrA467QPXQn5rUCtLlTqwkJJ7NROL
         6RYX4twG4VpUAzQIOiIu1LqREfzxJ5Hvy3ybBQaM7NtvaPsabc4TUQ1Byyhk6sB6I9Mp
         SPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596880; x=1770201680;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64aHssFZr7VaxSK0D6/XN0631oo5malDp14UZIFT07M=;
        b=e0EzYiHWQtyBoz4UaWpy2OXmxdpEeDdpXjH57W9ZA962ybTmdYHDZtMeFmjJ+8PxxK
         3sfEJRzkI0M90BLS9KOoh3AphyeHrpqhoJzllTQkSH/aOFPxnUYklvxvL5iyiASrvIUs
         fF73fBDUQ5yKoVtPAuNSSPIZ97d/zmsIWdhzT6HVV1Yind8ZPJJ5kfFrIdn4HpXJ5P3w
         EGqx6AJTSGbBJdJw1vnlyylRODW7M6BdDFjJZ5XpX7/VnFlL1TQr53G7I0pyqmt/gBXz
         rvqKs/ui2VfTgPWY3nXRlBw+E2mBliIMUXrlJARsHBCPw7JK2eEqugeeafBvVmVB8LTK
         wXjw==
X-Forwarded-Encrypted: i=1; AJvYcCVXsHORZcxs73ZN9SonIvz0cDhgkp+FJUBJa5aYxV6MtaKGbsR+fE9z6G7Qdn7YGi97/Y5M5TKsbk4Onw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmTGVQ+G1YMqgPYFQl2EswpiWb2hYRSXzzdO4YfCIJYSX8MW8
	bqz76oQXiI+7rdc1VLP9dxIR7JLVbrxdSoTfOx/7nmovh5ZQbOcUxPM3H+jJrCKsQcrORuoFIaE
	NoYdj
X-Gm-Gg: AZuq6aJV0U4BCDYpTdro578IEcA+fKHTfAybKlDyDnbf3DARIllK444YxJzMezJaIg3
	YAU5+i0JoZq3GaB9ktQPKPqvXc46aD2yMas7xOcntJZqPXoGdEwQ5xYtSfzLB89XaempvcohrgH
	eyKMQTXNTZceD55hQ5FzD1I4F6u5preOvZP5ObcUv+xRhO1zyLtuPHJmaSJxWDb/SDDQGbzbgqk
	qvAQA8/mJ8K6s0Q0drjrgK5W9otMCiC/5U3A1lrp3j/iiYF1gmkPsV2UfBHFiWWsWz87zwk1k1X
	5/zEVL8t0Cj8HMOAd38Qlnk5ZY3wEaGDew7qtExTOCSnXhaGmD5ZIKu9qJHtgtEreZMLJrTyZey
	3wqjNslMmEmkUeU81BjrfUiCyV2aAjlPQQakqIqeIZBqbqDWa0C2xAyvrMNvnJFAmOmR4mwMyrz
	rRVuClOau0otvjTzv6rzAvHPTtWuKRr7mqPo0PQOQJHStdiITBtkxa
X-Received: by 2002:a17:907:8689:b0:b83:95ca:23e7 with SMTP id a640c23a62f3a-b8dab2c00fdmr351448566b.4.1769596879528;
        Wed, 28 Jan 2026 02:41:19 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c0102sm108582866b.51.2026.01.28.02.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:41:19 -0800 (PST)
Message-ID: <6692ca5f-216f-428c-96b2-511fdd769f04@linaro.org>
Date: Wed, 28 Jan 2026 10:41:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and
 timing
To: Saikiran B <bjsaikiran@gmail.com>, Bryan O'Donoghue <bod@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 vladimir.zapolskiy@linaro.org, Hans de Goede <hansg@kernel.org>,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260127165024.46156-1-bjsaikiran@gmail.com>
 <20260127165024.46156-3-bjsaikiran@gmail.com>
 <aXjwtBey0MRP0c7f@kekkonen.localdomain>
 <hAXW76sxpszN3JpApVO_ntI28dSyCTiDXIE-S1AJDCa7Mbp8-pHbGqhFhTh2FGPdj3TxO9AowyRRan2u8TTO6Q==@protonmail.internalid>
 <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com>
 <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org>
 <MZajBkG4hU2kIZFDZbpq0WZOF_tJmASpmGr-7IH_qheO0We0Z45KNZPrQY4UmoqsWKOX3lSx1W_hnLtfKocXPw==@protonmail.internalid>
 <CAAFDt1vmXg9L6axsDN6kpCQKZifOCRxtQeDpmRpHyejS1ORR+Q@mail.gmail.com>
 <92131a67-471e-41e8-83d6-4f802103db7b@kernel.org>
 <CAAFDt1sqh=O-CpxbdcWueyqbiq4qyCrJHVH-_SS+KjEC9CyRhg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1sqh=O-CpxbdcWueyqbiq4qyCrJHVH-_SS+KjEC9CyRhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51725-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 6CB2D9F9E8
X-Rspamd-Action: no action

On 28/01/2026 10:19, Saikiran B wrote:
>  > Just to be difficult - I'm specifically asking to test never switching
>  > the regulator off - not having a long delay.
> 
> To be absolutely clear:
> 
> ***I have tested exactly this.***
> 
> In my local v2 testing, I modified the driver to keep the regulators
> permanently ENABLED and only toggled the software standby/reset lines.
> 
> Result: The camera was 100% stable over hundreds of cycles.
> 
> This isolates the issue:
> 1. CCI Leaking? No. If CCI were leaking, the "Always On" test would 
> eventually
>     fail or show instability. It did not.

I have to say, I'm not an electrical engineer by profession but, I don't 
believe you can make this blanket statement.

What is the problem with testing the hypothesis ?

> 2. XSHUTDOWN Floating? No. The "Always On" test relies on XSHUTDOWN working
>     correctly to wake the sensor. It worked perfectly.

Yes I agree there, if always-on shows no failure then XSHUTDOWN isnt' 
floating.

In which case this patch can be dropped, its not helping.

> The instability ***only*** appears when we physically toggle the PMIC rail.
> 
>  > Do not believe we have root caused a regulator brown out
>  > Believe we should interrogate the LDO settings
> 
> I cannot easily dump raw SPMI registers on my personal machine, but
> we can derive the LDO state physically from the discharge curve (RC Time 
> Constant).

?

I gave you code to do just that. If you can iterate sensor and DTS 
changes - you can use that code to dump out the requested LDO states.

> We know the physics of the PM8550 PMIC:
> - Active Discharge Resistor (R_active): ~1 kΩ (Typical)
> - Bulk Capacitance (C_bulk): ~10 µF (Estimated for this rail)
> 
> Scenario A: If Active Discharge IS set:
>     Time Constant (T) = R * C = 1000 * 10e-6 = 0.01s (10ms)
>     Complete discharge (5T) would happen in ~50ms.
> 
> Scenario B: If Active Discharge is NOT set (Passive Leakage):
>     The rail discharges through the high-impedance sensor (~200kΩ+).
>     Time Constant (T) = 200,000 * 10e-6 = 2.0s.
> 
> My measurements show the rail takes ~2.0s to reach the Brownout Threshold
> (failure point) and ~2.3s to reach a clean 0V (success point).
> 
> This 2.3s duration is physically impossible if the Active Discharge bit 
> was set.
> It mathematically proves the LDO is in High-Z mode (Passive Discharge).
> 
> Here are the specific logs capturing the failure at exactly the 2.0s mark.
That's great. We should be able to interrogate the PMIC regs and see the 
state of the LDO configuration - code I've shared with you.

If they show active-state isn't set on one or more of our LDOs then we 
can write some platform quirk code to set them.

A 2.3 second delay on every start/stop stream is not an acceptable 
upstream fix.

And please stop top posting !

---
bod

