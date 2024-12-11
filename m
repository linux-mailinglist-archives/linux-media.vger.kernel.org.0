Return-Path: <linux-media+bounces-23219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 055AB9ED0B8
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 17:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F74228FD33
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 16:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D701DA11B;
	Wed, 11 Dec 2024 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kon1QaTR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011C1D7982
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733933012; cv=none; b=up5zIj+o4ELVb6NIVwSZeMoSHo6CW3UxR/FuI3yhgLg24n2Iw0BaKpLOkZsm7BZOyzNCg2wgVylT50ru0H7XvyEQa/d2J8fYYp1pRV9NDue26Bf6wgLKqLulV0RR1nMqK9mhjJPmv4cVmBKJKYfS1tfTbGuuiOsueBXfty9/l+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733933012; c=relaxed/simple;
	bh=o9NBCAJibBE7Cg/Mwi3++Bxz6puXmkfI8Fuw1rijxM0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PxA9u3IVT8UL5uWkT+ZkD79MLoBZCk49bkf2ouAX1sbrOgshi9y9wSdFQjwfMaLbwt4YGsspXHsCOv1Z/owK7og9LMzSz86Ky2DEEzFiFS/1qOP5ByXoZPcAimvHDzUCb1vmE1jbbwtkw03V6sGZ0X9dAsiBuyUqXuaFdV74CKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kon1QaTR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa69107179cso643937566b.0
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 08:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733933009; x=1734537809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i5RH8KE9lwCw2dJZrNysrG24xTalE49KqC5ZdyyDDKk=;
        b=Kon1QaTR8FkOLe3+OHyisYBVCt0EH4Pz7D1+l321yNMl3xNtYW7+x5CwJr0b+ODpTo
         h4F8dxub+IUHhjV6hA2AUsCbPRthA/+E+TgTrgBidw771bMWc3/qCfsHIorPsL+iZed/
         1hCsX8HP6xPk92XC69mdd99mNN1LUqxE5IRb9RT9/8kbZqZq970SYs3lV4Q3DsOXWiu3
         pysiGBEHjXoBwy9/rz4bLW1wN6ROhrUUGE2kGZXgn6IgVzU+ed0LKC74zij05gGz4q8w
         7wNqUPc/bfbgeR7NXSrAOR6CS/qa3+XPRyPC6LFG5vz6OfGAlvbnRq6gcki1umR1aOcP
         7wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733933009; x=1734537809;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5RH8KE9lwCw2dJZrNysrG24xTalE49KqC5ZdyyDDKk=;
        b=S17cl3SAUSyQULeenlrMyunVsxznSQe3eMqc/vOhR2GWSAhmGo2Y4GSz8QymXIlKjU
         QMwYAsH4tOJkNpGQB6OwNSOXFzVco8rFWSa5b5YSD7Ua0WWOXapSf5mlU/g6qsSkrVBy
         ILlA3E7SwHTAsZ9gYuGLPgiqvHP98c0DscddJQsjWi5PheEMqbWfGI2g8j+ZW19ZcD/B
         beuFO8tTLonxzLX8Fjx4MfJcC5LKKTfe5iD8Ng0fDKQaxHQGmE282REqxGmVNOPCuexk
         ND7iiRxHISLFMWzoISz2Z9/G6EfkAX1Mh28IMsbzXP6ttQ1hFF4aFD31XKuh6Bu3C5R+
         LJvw==
X-Forwarded-Encrypted: i=1; AJvYcCVdWrL4QWJxB5HB9Z16tWp9Yanl+Nt23425zvjF2fejI/u253gaT0QlipvdKi5P85RnwojQ036W3yqIoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbeKhCuKLesb5MKnzMX7uErmyVzr3i8BaA6NwVCNU+HvD0dWKC
	YImij/PPeWV1w00CHRtiLRo2nFuOgq/Oj3VroyhdU4iT12BXZoBny2gHNVj1m+s=
X-Gm-Gg: ASbGncumbwtTz5yrU2gwKsWHsnHeaDv72zNIeXeNE24sW+vTSVZoKPkeltKvGrRVjqX
	WlrpJyVr+BHSVZEKvI14Sda0HcyCb9PkcwB/FvLp32ovyU2l5d/UWavjV+U70wX+b6zPJCaLVM0
	X+bkpw8dXu2TYo76tIpPI/dnIxytkjhxC3AJGZX4cRuVZfbl4Qp5+JSfaWvvE1PYG2MFnUL+bAR
	uZ/Jrne3p/DUqBIJNarlZojYaBakqfaQgIQ8whvGtaYqFWWxdsKgjGY0fCxC3ELf4E=
X-Google-Smtp-Source: AGHT+IG2FdkJPT94HQEtRGwYWaBTAxIlJjHQeKSD0iBM++VhPK90sU5ykr6gyv375oO439qmFde18Q==
X-Received: by 2002:a17:907:7712:b0:aa6:87e8:1cff with SMTP id a640c23a62f3a-aa6b11b33d2mr276373966b.24.1733933007333;
        Wed, 11 Dec 2024 08:03:27 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6b473e496sm107680366b.99.2024.12.11.08.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 08:03:26 -0800 (PST)
Message-ID: <63828150-ef52-49c4-bc60-72c1f6bff202@linaro.org>
Date: Wed, 11 Dec 2024 16:03:25 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] media: qcom: camss: Add sm8550 support
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <12704563-f2d5-4e2b-a6ad-53b8ab5c5df8@linaro.org>
Content-Language: en-US
In-Reply-To: <12704563-f2d5-4e2b-a6ad-53b8ab5c5df8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 15:36, Bryan O'Donoghue wrote:
> @Depeng.
> 
> Some of the patches at the top of the stack here - won't apply once 
> Vikram's 7280 patches are applied.
> 
> Could you please rebase your series with Vikram's patches applied and in 
> v7 send a link in your cover-letter to highlight the dependency.
> 
> You can get fixed up shared patches from my x1e tree here:
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/ 
> x1e80100-6.13-rc1+camss?ref_type=heads
> 
> ---
> bod
> 

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc2+camss?ref_type=heads

Same patches on rc2.

---
bod

