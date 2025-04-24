Return-Path: <linux-media+bounces-30937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C60A9ABC9
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9857C4A4E44
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 11:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BAC226D12;
	Thu, 24 Apr 2025 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hECWH0BD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36A3223DF9
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745494184; cv=none; b=Gv9preYL/gTwIwJedPyD5v0HeBtWHPbZZTQLsGjVztDzl/Giofq7UlL4RZ6CjgUCs+nS7QOkJHCOgaSSz1pB/mZA/psdhWWKdYJ02wiCKDbefz5FMu7tzIz6PImOP+xROyd8qsOV3xm4zUTbzzqWBhKDF+87LDEalZyylgaB1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745494184; c=relaxed/simple;
	bh=73VMJJMB6i8oFzFknLVb9MdE7m/1cEhj6Q3/0RdUoh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjDJwkbgt/101pIxOUwDzAD/YSxRkKrNsKoOWPXdvsasAZcedF/LSxN3SOM0HcNcFmXrO4Zuy8idXE1lPD/mpJ8X5C1s/xpmV8H1hHobUKD5usxlvyVS+q84/Nz22AwXIVFgIxe2BsNphC9ahYFyrPCgVKUNiV5BhzHVJFmiE60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hECWH0BD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfba946so629185f8f.3
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745494181; x=1746098981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrtsDrUlmX7+CYrZdAD+RGxT3LfUayvvHtZlEV2ANSk=;
        b=hECWH0BDWb4pdIyjOWaRXgN3nkc8Mp4FQbkC1YLz0caL4nZ5NSHEzAEiLyHW3sqCTL
         6f6QbltY/qjl4mXjgABi9ziDAdFivNy4IoWKHIDwtSn2HxK7MJ9LS/6CLJSq3QAQRSKK
         f1VomrxdR/ukSg9CK8DEc9t4oZlJAD1qSadjggH40pJeNS8i8Qd8FDqdmK8wfSaRoBYy
         m0cF2mEck3x6ZxTDCiNBRZOL5UtOYezQg6O3iBufZ/UgqNqqKP0gThP3YMzTaYwDl1Iy
         OyHMa2JgMhBYTpnLmyH9KWyckXGiqUc5YMBEon7XrNn8bJptzVMMDyGOul0wqKh6g5zF
         AW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745494181; x=1746098981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrtsDrUlmX7+CYrZdAD+RGxT3LfUayvvHtZlEV2ANSk=;
        b=XqqaYMaEBzerfQ9QeAOnazwhi9aS6RVdgZVD95UJ+RudB9rr8p0bp7lXWVMF6ACJpB
         v6RG4QB7roHl+4fL2EE4HwSaB54nAWW/79JgxG0S3hwQqVxl5sJfQxaCv/Q0DZUdK+uX
         fxVrB2+nbKHPuoHIab0j6XwS/pcmKhLaAPQwSXH0TAC+DKAefl2HOdP1YFZ4QkYrYaSO
         mkeNdnBDmOTDIR3F72TA2MI7gvoexRdp8UiiX3rdZ0Rw23UNSOgxtfcy/kjKqfGkWH1r
         E3gcSUSM2U3UOzM55Mu8f7kpaic2DLJJiAJJcBv2+tmOwing12Umxws8JJEOeR9Rp9BA
         whHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9dfxg4u4RJgrgNwOManrN5e734E9Mb6iwpH/e16N9gSFQfOoOiZuupNA/dOiJM7ttF7PoTVz4cOeeyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjQ76WgUsnVwdMCoHLF7EyVmMcYtq2rGu/jYbbiSQS5tewIoW
	JSlxaGQz3mNo2ioP1vfzGJ7yl3tLQN3pbZ64/GdFeezwtUKLHbvlKDaY4VZxCZU=
X-Gm-Gg: ASbGnctk5kpALkmvGcsniYc3O/okjojb9K1r5xd6MnxGUoOpfaEgyNOPgCQeA9R+p6i
	mootb9HYPtmyh5K9ogNw0pJsOOFpZ2M/CcH7thyLVj3uizp+xFo3sWxmAx7BJZL3Y1KXg46XXwf
	mSrzCMiTV5J6er+eYYR/ud1Wb+KRu2bpik+NcoHhEiyR7uDzkVgckSYQ7Z5Sbt9IHWkh8v0tbTn
	jObiuJRgCVDnjiu6wzxLsEFRn+Oyf5k6w81xEMzgVh8oVLRRQXFB7keLMDeHGMNR4j63aYoSyuV
	SruIRnh++kswQx6MD4D9i0Df8T6LW0hawXxODJDcbsZVTH4pDbOC5Ts/MtmNE/8M3xfm3q09BAE
	+wp0KtQ==
X-Google-Smtp-Source: AGHT+IG8y1FTZe1dgMPfnhNIz1U2o0nx+jVk2Oo5YgUgntxJOGG4Efw53H1Ek38xA6mQECpCwY9DVA==
X-Received: by 2002:a5d:47aa:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-3a06cf62a35mr1844165f8f.34.1745494181044;
        Thu, 24 Apr 2025 04:29:41 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8003sm1778095f8f.1.2025.04.24.04.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:29:40 -0700 (PDT)
Message-ID: <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
Date: Thu, 24 Apr 2025 12:29:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <krofzevprczeuptn6yfj4n656qsw52s52c7cgiwotidxmi2xo6@d3q5bb5zbccc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:45, Dmitry Baryshkov wrote:
>> Which would then be consistent across SoCs for as long as 0p9 and 1p2 are
>> the power-domains used by these PHYs.
> This won't be consistent with other cases where we have a shared power
> pin. For example, for PMICs we provide supply names which match pin
> names rather than one-supply-per-LDO.

Yes but taking a random example from a PMIC vdd-l2-l13-l14-supply is 
specific to a given PMIC, so you need to name it specifically wrt its 
PMIC pin-name whereas csiphyX-1p2 is there for every CSIPHY we have.

For example on qcom2290 there's a shared power-pin for 
VDD_A_CAMSS_PLL_1P8 but then individual power-pins for VDD_A_CSI_0_1P2 
and VDD_A_CSI_1_1P2.

If we follow the general proposal of

vdd-csiphyX-1p2-supply
vdd-csiphyX-0p9-supply

in the yaml, then whether SoCs like qcm2290 share 1p8 or SoCs like 
sm8650, sm8450, x1e have individual 1p8 pins is up to the dtsi to decide.

---
bod

