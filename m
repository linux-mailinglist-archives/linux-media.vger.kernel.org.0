Return-Path: <linux-media+bounces-63271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHkKOk6XHWoXcgkAu9opvQ
	(envelope-from <linux-media+bounces-63271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:29:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DE620DF7
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD20E3026A63
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 14:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA603BAD9D;
	Mon,  1 Jun 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AP4zH6pc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EEC3B9617
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323555; cv=none; b=AO9w58Zx6J2tcf1OhsaaV80zmLRudputEI+XMgJTUuNFvcZ785uV87G1T/K6PBPkqORRk2+M4fk9g/1/BTQmyrcd33XVxbgonKdQDWSU2ALHmIIJBVTdYazokxnrMpxuvNf5a65iPMp8NHDGqf2f5vXAId0zwmsVq2h+V6yM09I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323555; c=relaxed/simple;
	bh=0WoyP4VFmcWSwZARoRzXvbXDRI6qgb1cEPd97r9v4hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9zlPY9EIWJlbbqsgpI2gZZW3K9scby0Z4qKkZvA8EYSoDn9/UMPD76zEk9gkwMKaMgYGY+ISRnsp1IKqjKFHYNMI5UlpuYSVDbn0bxLccQct/a2zAEAAJwSY5bBouPWR58jlvhocv+Jh+IEVWilQZPe8GURMd21AzY9uLJdouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AP4zH6pc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec4639953dso225898166b.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780323552; x=1780928352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tazzfhio5FFxMaSKRgxVkzsE+cGWlB5d7jYkUiZcut0=;
        b=AP4zH6pcGb98VM9/emOtzGe6S7TMT5vM2EVBpKKWhYEXFHhJchxSPWop3m42bgPAi8
         PAQOwLfPPhF9TcFWruaL5NFWTBwncU5Fby1UvnnRf1ZIB4GC9J/1GOmmrv6ubKUrg0px
         YPgLIDIWBgytx52EHQYbc79PpTXLrc4oQvf5Dm6WqizRKZCb/Xin9jSwQ+u8m1UStib8
         3FsV0gS6Uj+XT1eAyNAFc+EY2LbHroPgF7weivXfGZT0bYqAOGhMcH1dfsfalUHL/Upj
         Z5oeJ39Q7PWwoQR0mLdm3hC9MfBj0vYV6baZV404Oy4br8aQALr+E6rgH8yIo5McVtc1
         8TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323553; x=1780928353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tazzfhio5FFxMaSKRgxVkzsE+cGWlB5d7jYkUiZcut0=;
        b=ImnI0yLr0fvjolJ8M79BTCb+6r0t4J2VVzQJsi6p/cTdY9TOtMZk/9ifidnYmKgkJu
         YAVlWenq5XEOULLiQv1wS9zTJghjBS+ZVDP2ACU7vvXSf+kcqLxycwSuCdiq3NkWbVyG
         +UxwQE8lxJooulm4pFGiIWn5KoO/q0TRKjE+iRx/bNrATrVHGPJvlq255myrl9gwEYUE
         jtUj56QizIyb3STkq06Tq95E3xS3JWUgnXLxam1VwD5D4IXKV09jloZCakJlbF/eRRyP
         aNKaOGRUa/8S6L4DOr6IZ86RVj/cwKWUPhlOsiwzPCtlrIj/qosB5fAb5hzPt1ycNshM
         mZXw==
X-Forwarded-Encrypted: i=1; AFNElJ+DQQkov6hcMmJ35z6mOL37EtztnuvOqsdlIjd0amPSc0BLLaTM7UruCHyV9cymupDq0dUjLkaVNLGiIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXp2lYobCZOvCeOPmtBtsiThBL3xrk9L5KrhIewD1qIxwZeFg
	Iy7xgzqpUpvkQm+KFbosS+VreIRYZw8RiV8nCwoKXCM9SJwtMWqBY6uTdShbKl8kcz8=
X-Gm-Gg: Acq92OFPneBr2E5JoEPP4rWbSAya0UFe5DAymR9OAAfr6Na5LAIa5XbXrVtqUxdEW9U
	NFGM3Zga29iJnuSJu4ZCyVLirXG5vBL+6HWzydPJW1Ok1f75ZJz64f8gTfUmnj1v6jhUN1cxFgz
	uBcop2i6uFI8aynIz8jXVWF28vvwLixnfVl6TvBOzSGpXnyQVPsDCH72MCj3bD7ZoCbj47o6oA4
	nJkqIE8KoPPcq6nK5fKogJBSHrLVCFeR/nnx4Yz/d5hy/z1DxXnYnuTvhfIbJxCQtS9h0Jq53xr
	PoxpJNN3DzKqC274nNNvqUM73aRRUSfHtPW0sQkZ2gKESr4TG0u8kNhnQSNxpsQtUW0ADq8DMj7
	yjK9voqpTyJpEqztLY6RyKAjrGrdjJ8dGne1wE8BwvuJyQ3QPoSBgQue0HXrwCuqEBbxRnLHGx3
	ZwStxQaGKWy8oll6FYUGtq7kOYYeHscH1yITRRGWcsTHxoZg==
X-Received: by 2002:a17:907:1c0e:b0:bee:215e:5480 with SMTP id a640c23a62f3a-bee215eabf1mr180015266b.9.1780323552444;
        Mon, 01 Jun 2026 07:19:12 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb7a7dc1sm2092485a12.9.2026.06.01.07.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:19:11 -0700 (PDT)
Message-ID: <624b64b4-c524-4436-a338-52551ad9c6e8@linaro.org>
Date: Mon, 1 Jun 2026 15:19:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
 <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
 <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
 <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63271-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DD0DE620DF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 14:55, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 06:31:08PM +0530, Nihal Kumar Gupta wrote:
>>
>>
>> On 01-06-2026 17:01, Dmitry Baryshkov wrote:
>>> Is it completely compatible? If so, we can drop the driver parts and
>>> make Glymur fallback to Hamoa.
>>
>> Not fully — Glymur lacks CSIPHY2. So, A direct fallback to x1e80100 would
>> probe a non-existent CSIPHY2 register region.
>>
>> All other resources (VFE, CSID, TPG, ICC) and version-switch paths are identical
>> to x1e80100, so only the csiphy_res table needs to remain Glymur-specific.
> 
> We have all the resources in DT. Can we not use DT to determine whether
> the host has CSIPHY2 or not?
> 

With the CSI PHY driver the answer is yes.

With legacy bindings - you depend on driver churn so no.

---
bod

