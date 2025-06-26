Return-Path: <linux-media+bounces-35941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D18AE9B11
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 12:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEDAE17DBA5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 10:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCD7223DCF;
	Thu, 26 Jun 2025 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+Ty9IYA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA8821D018
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933150; cv=none; b=hhIa1siEweiu5NK6OGl6CWXaV81IqwyR0/ZTNIlUadMhj1MKSwfB3jmWIIavC7Y3A+TduVwgB+N5HgU3e+y/JVXLIxV4LZp9F6zIq81Dz3DqdH+DMVYBJAzw8HY1bYYyU+TSi9zmght0imruRmrzrVr9oYJBRfGmPc3dALTQfKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933150; c=relaxed/simple;
	bh=ORf1jAoipV+9qFhNmjCAhgnKjCxHxHChKLRLA7Th/yM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPZgVvTALWjFtGF2D3kaqoHoqKYZzLYz7o46lG3/wTZA2lZaUlAyB67JfybYgS7VzY5F77VXXf/sjZhNRdhXybXa6LLCNBvlAdkzzkVHCejWIAzz1MQdOsBRffzBFDhs8R/pt+/iRtj1Id9PbsEtFSYvAOw1y2Ks39dgyjapEOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+Ty9IYA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453749af004so4234485e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750933146; x=1751537946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOgwuucZNG7PSzZM8+FS4NfuM4P4osp+GB3jAEqWNYo=;
        b=q+Ty9IYA8iLeNXXN7XE3LQ+B1anf74IpWnaYs6zPYmuZgkc7bfA+aZ7foTH/wvFCDz
         h1FiwW6Ja5akBYE1UqS+YvPtIRPt1T3KNAEyKg6NhwCIBAS8qomGEzkV34t533HoVmos
         cCJFuNDNOfL3V3+w/xmVCrmnVMrhi9uHSmCzsXHoLzyQ+K7bgqUHFD0ibkfrIiDNnEz1
         s3WkbOQl3eyq4unWsGk5H7jbPLXSPB2uJykjYcb2/W7Zd8L7HUyiM0BqZxgckrppN4r5
         QYgNbys+JnM+lovVK+fKVDOSqo8V0PBRryQB/avtXvcgeSh93v7gnw3cDayd2nWmyv0X
         3t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750933146; x=1751537946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOgwuucZNG7PSzZM8+FS4NfuM4P4osp+GB3jAEqWNYo=;
        b=SoV4ErnJodbVqW5IEVT/+7PuGEjnEtZDkNBR0/uw2biw9WpWWTUMYCl4a2QeQgn/LV
         gcTkTmV89IAeB5zr0/Is3JBqGGTFIOylnq4ESKy8kSy871RydVpUndaXpsBNWrnDuhpP
         0gDfJTyo9mm9WnvsrgFBnAxfj6vX6tI9RuQLf9BGTqGdqVY0u/TowkpKbmSXf11UKN5m
         x+Kc12wZetr6ORMy57sDAks/dPHTNWNFENKujzxtLmfqjD/jMzxssktENTksOlBs2yNj
         EsEANA0oll7XhksNwSiYdSITw+aKfz7fmq14pgH55hXdvWNdZDzazzj4GwatS/F47eRf
         fSSw==
X-Forwarded-Encrypted: i=1; AJvYcCW7iLYcHG/SEmQZsIYa2jpyQ/kBMeNsDr9CtxVLAfp/cWg8yVUF/HAphLpSUIkb7tC7kCPHqFqnvq4cGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYUs8015dzaPb5kheVddheZbWd4NdU7Biz34VjepJlrL8/QF8
	4BgGh/FNDbarFuyPt7UVu9F82yJyezxmNeukvj7qvCXRujd3lSwKxT9j4TztLVoGQB0=
X-Gm-Gg: ASbGnctx4YeS9mZjs6fdi+nfrAdBjJSeE2iMbOV1pyrRWyPF+j08sSK/BvXtMnGzNiT
	SuCPFwruJMmK5BeFKBHg++92PtyPCmQCzxqAdetI4QaW+ogF2pLIZnO4PW7lS0b+tqjfA+bAj7g
	/Fzm7ADiaHMjaWWsYnl+iS4ZACa6nUWj2QrdKQUW2cME5SDdkL1hNsooBKLhRwqPsYmjhYdYxoe
	gEwDT/2sSU2zEuYi/dWvdBFeaZ24OY7ik2Oj5SNvJfRRvasXdtNF9yvnKfuIa5r44lRTbwvjDaJ
	MY82MYaGPdBXrE92/udwDUc82CMx4dwNCiGQsBJgnbAN2FVfGkkyox+SwlyIasYsIGxY9NpdZvV
	bNbr9lT7A0HClLN1VU1x6yccX+bM=
X-Google-Smtp-Source: AGHT+IHhY4kA1SbAViLB8X9Km2mENEE84lQY6AN+7FfCsVcgs/PjhB+h05Xzr97C7x/nhon5QU5BGw==
X-Received: by 2002:a05:600c:548f:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-45381b0f431mr60466415e9.21.1750933146492;
        Thu, 26 Jun 2025 03:19:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234bc1fsm45131555e9.14.2025.06.26.03.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:19:05 -0700 (PDT)
Message-ID: <e928a7c5-56d5-4f2b-b667-bdbefb506d1f@linaro.org>
Date: Thu, 26 Jun 2025 11:19:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: Krzysztof Kozlowski <krzk@kernel.org>, vincent.knecht@mailoo.org,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
 <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/06/2025 11:00, Krzysztof Kozlowski wrote:
>> +  reg-names:
>> +    items:
>> +      - const: csi_clk_mux
> No, I already provided arguments in two lengthy discussions - this is
> not sorted by name.
> 
> Keep the same order as in previous device, so msm8916 for example. Or
> any other, but listen to some requests to sort it by some arbitrary rule
> which was never communicated by DT maintainers.

I don't think if you look through the history that you can find a 
consistent rule that was used to arrange the registers.

So we are trying to have a consistent way of doing that. Thats why the 
last number of additions have been sort by name, because it seemed to be 
the most consistent.

commit c830aff08d51f8391e59fc6744757c58e320b41b
Author: Barnabás Czémán <barnabas.czeman@mainlining.org>
Date:   Sun Nov 3 10:45:35 2024 +0100

     media: dt-bindings: Add qcom,msm8953-camss

commit 2ab7f87a7f4bf392e3836a2600f115a1baa1415c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri Mar 14 13:14:00 2025 +0000

     dt-bindings: media: Add qcom,x1e80100-camss

commit c35ad8e3c59714e9cef96036edad1529e70d1a7a
Author: Depeng Shao <quic_depengs@quicinc.com>
Date:   Mon Jan 13 10:01:29 2025 +0530

     dt-bindings: media: camss: Add qcom,sm8550-camss binding

commit 0274ea59f83e4650c75b1a0370fbfa540bb88f9e
Author: Richard Acayan <mailingradian@gmail.com>
Date:   Tue Feb 4 22:50:15 2025 -0500

     dt-bindings: media: camss: Add qcom,sdm670-camss

commit 5593555343f3ec299ca28d46a478e718c1119f74
Author: Vikram Sharma <quic_vikramsa@quicinc.com>
Date:   Sat Dec 7 00:48:56 2024 +0530

     media: dt-bindings: Add qcom,sc7280-camss

---
bod

