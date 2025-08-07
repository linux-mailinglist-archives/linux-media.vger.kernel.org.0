Return-Path: <linux-media+bounces-39033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B30B1D650
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10F771887DB2
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 11:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AED26B2CE;
	Thu,  7 Aug 2025 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvkJJYre"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542BC21FF48
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 11:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564737; cv=none; b=AMpLgsKSnZlZhpHpZ1/VI/kBLJ6Cy+09Ps683/knfT+7qPouT6UDQjnGG0rAIu/IgmgPQqyWxEVTij3wO9w017E5qYW3PgGR8SNzt8X14ZKAZJQimcJyqU7gMwgsMPfcTQ7g5POzVrWdFFSSjHMDgP+88907TdhGZ8BNmKe315w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564737; c=relaxed/simple;
	bh=LFyGmIQMR58Rs4TZaKfP31Tc+fGtMZOG3Ql12fY9lU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFA8dO7sbdwsZDLcqXnvPYbda4Pb3DHbaHU8uGeu3fwDvx5aq4SeKLJWlDTZzDDfxMKe6BdJ+I3NRyIpTkQ/Ol06dChs6SFon+03dDx/g/8y66Hxsks1lqtQIeRlpgmGe1SsIIyiNT1WYObbeKDQbHvIYoNrrL7hxcImRZ0a6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KvkJJYre; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso13391766b.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564734; x=1755169534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LFyGmIQMR58Rs4TZaKfP31Tc+fGtMZOG3Ql12fY9lU8=;
        b=KvkJJYreQi1u/SFeE9Y+N4jPqPUvpXdB6tKavDpAXKFOH99zX2r0iae2f0N03mj6Vt
         UFYy0D4PaxuS49NyzAskKa8Gtvmg9saDs3fFsviuE9p8XVQDjFRIr25lchHQGkpb3uhy
         kS8F4ZWaJEbGAbnDsp9JrnbMpo4DJJqHWn7XPXdtukiiPc+ttfLV7S6QGG779pyxbGjX
         uZtNpumIcB7eZv+m9KYaJoUbBkDVDWvqefQj1iaV/LEB+Tznoi1h3WZW/j4Epkuj0hhL
         4L1/kirrzMjtrHnF2c8VSrmo2vYcSm731a2w7nDzQj8WcBzwLS4UtoPhG2/6M6jcWpZF
         R8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564734; x=1755169534;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFyGmIQMR58Rs4TZaKfP31Tc+fGtMZOG3Ql12fY9lU8=;
        b=b7s5FICvaqoMecOFExBOnluJuU+6SkMZeDeJeklH9PzXQfY3H8i6xE9NOBqlpGSH5J
         xf0Y6xX5PP+CshLxYFFQTnQwwslT/KTXAFGm3OYysr7oIqQLDF5PCG6Xj7q1aRHywonu
         PLaZldBDFCtYzVH8JqKvUuOqwwyHH2AU8S4t3J3HcI0x0ACeuOuOSHS13Ygu67TBvKYn
         6d46bliT+XuVyGiGX2iJ1B/aQ93TqziBjLzjxLp8d24C9FNgQdMoFJx0Ned8g3CYZT42
         Njs5QeqVZnK3IQWGgQUsnKPcqAZx2RBnsm8qS66A2zBkNbBM0j0oQVtMQBPTP70HTgK8
         ++bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR1rIJTd5jONz0x3tMaXo0h3zXEKBQFjTSYS8TDS9UsPFV4nCPrKh4+o5+izTqYD1vrC2cbPANr4o7Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl7Heri8H9qgrGUOoGfI/Q3xu6XI4o3bgETOwgHxS0bjbrCHSi
	0GjWQ88MbcpTdpu8zEJcHBlPjdl6EdScxTTc4yWjBfjwLukv6uwNvskmLnjAKptk6KI=
X-Gm-Gg: ASbGncsDNcpn0NBGO5mkJkfWJ1umiNuP5Y25yXPDEl8LL9urMt5mrWDd+rhd1A/A8YV
	sERM75atCOF+Z9dBhR+0+QIDtrkbXpilnhYmPG2c31AMluahHNkgPTWEUoyffvg6kG9+O3I4FjF
	b5kYvCOK5NR8XGx94hp4xhmlZpaxCDTSIyKl7mFike9lMtB/Thk5tPEBYbUULHk2wq4aXmrjZxD
	V+LnziziQ+tSgrHmi4DpRQyedn0rG0e4ma30wm/Nbrv+Ix4ceHBgPNswcPXYJe0tWtiDfIp+Vy9
	FHs879k0JN1szTCH2gYZ6kpurKrMx7RfWQqEz+XabqB5hvDiN8xTzzRI3T2JFIRsSMvxfk332ZH
	4BGOlGGjdEEzgxDC+e+iuURuzOqidU6lAOaXZSMqv/bU=
X-Google-Smtp-Source: AGHT+IG0MGxUcNNzxqOIwu8lt3gGqI/Kl3a4dy5p1ccfcQ+CYryVnARUENcRNCNP8MHLSG+XfQEzYw==
X-Received: by 2002:a17:907:1c89:b0:af9:3397:ee9d with SMTP id a640c23a62f3a-af9902f5784mr239225166b.3.1754564733615;
        Thu, 07 Aug 2025 04:05:33 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af986a477c4sm439667766b.56.2025.08.07.04.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:05:32 -0700 (PDT)
Message-ID: <37294484-a0d9-4b88-bdc2-0bf950cb1608@linaro.org>
Date: Thu, 7 Aug 2025 13:05:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Use SoC-specific compatible string for Samsung MFC
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <CGME20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22@epcas5p1.samsung.com>
 <20250807032449.92770-1-aakarsh.jain@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 05:24, Aakarsh Jain wrote:
> This patch series modifies the samsung MFC version compatible to
> SoC-specific compatible.

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.

This also might explain why you could not read current kernel
practices/docs?

Best regards,
Krzysztof

