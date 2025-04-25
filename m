Return-Path: <linux-media+bounces-30999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089BDA9C114
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628794A7418
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9A0235348;
	Fri, 25 Apr 2025 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OeRCwsOf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DC01F4CBE
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570110; cv=none; b=s6wrdRxIeE4wbxvVPiUmQaE2bhj4ldLtAYmdqlRi+GRy2nRkhHPloHOWdWovFtrAAaLGJQGHiiMXGr8ZDyJylZebWApnXttPQFh+Wx7dRnY72dvRkv6Qd7L6WYwKzUHGtj9rYMdC2byGcE+azPRCUJR08b4/WLpQ44Hv62OcPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570110; c=relaxed/simple;
	bh=kTafQVInfgZE1CFO5s37dA0o4B8Xyn3K4GQ63U9KYqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqcEU4DRiIYzhqk1x4/MRAxLXSgib2YN+5hPR5ly1Zf9mlY3lfksqgIA4mKsdsXV/7K36/Ci1+eKhFgCeODPGILaavx4Eq1/B49MdmyVlpHRRXXMO5go7vIdxObm88DOWIV/9Ttcz8sNhEitU+dFi2GUfurgywAkYY1vqe207cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OeRCwsOf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe574976so13645625e9.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745570107; x=1746174907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+u8einId9BLaGDvz8um8Sc4lADMO7vEkfqq6FWkbjfA=;
        b=OeRCwsOfDSlQTRL1GpyBFom8xW1oRHEF9dsYVOaXhCKZS6I0P+T2fhnlS0vjmhBBcl
         /rEHOMJG1gvKFK9sP9BrVSXylOBI1HGlVDqmciGn4GCAP7BCLGV+4j//dc+djxePJc4H
         ZB9f80C7wrb8onPlprPDZ2xZQl1e9pwmkvEJk30R0eicfCsWwIS1CpaondI5ELgY9Kln
         GLC29osV4H66NyvXMRUD7avwXMf/bWk3dlinYwPtGBir2NK5SKPypgq03R52LigQS1N+
         t3Ttgg1MicoODUGSaRRECt4XuMuC8eX3TXidox6aqOAiCrYf7KtDSo5AXvrtck+1g8h6
         p1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570107; x=1746174907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u8einId9BLaGDvz8um8Sc4lADMO7vEkfqq6FWkbjfA=;
        b=sWQzidzS8oAzu8PRKcApgUe+xJZv1hwUyATKXYckZCu+uuicGGk96q/bPp49OD9mWy
         VBdowt1PELCPpiHJ/NGdazu+BrHG9iLgfcUMkvcFLs90E6FyLMEhjXbTDCuGBZfKkhka
         d0dxj14iT0j2ggTg/D+nmEXTSQxWiGlBrl3m9c672nlJYpPwDbEfAsMvV8XQuERTI+D6
         tGCY23soSLozThDAalo0QO3FrkHazbOm3CRICSrUxxa0noayxfHMDs2CTVG9hn0Jd00U
         o6RUA7oTlQSZaU66Xt4cbVzberAFvEdBMs27wK+oznYn6HG519tXhamI/IlkOpgSeAZo
         pyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiDTCUxmXGW3XqRY85oYvA06CBLrmlQAOawgg8Y6x637OleGb4xu/NJRtbBMdcXUC60aMzOjw0HVGneQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXA5d+I0f9BrVdWrLTcBtnazIQz8beYNc6ajXsFs0MsWcrk3MV
	9+0tt2faj0dfAfa7wsAPkxNjshwfakzZlKMRQKN4jmiBV18Qtch+jhCXdUrK5Zg=
X-Gm-Gg: ASbGnct9aLleZhgGHoKWdAxv1T5YZGJmBqGx5flk73wvXvYdpZipFTeHtW92gHNmKbN
	8xXnePhQLblDQqiRqW5nzMXcjF03V9OmtBZWepYIQm/EeET86fn4WA92nKh3epJa14UJZMiwXbf
	JtN5viXK96naatEItSbn7VBhJiHCfzPJrWJl2wUYV1mIXVT19QfefNP1MzMaxY05ta8NtOUfvlu
	Fz66sHVs9sRLluAtz4BDT+k6yd+FVvafW3rvNI9oZ3RimMkdgHvvLQyH5lNvF9WRjIHUbikKIGJ
	+u6Kg8D4JZKcLzw7GQat/b96Zf+8dgWbkxl3ClxJ5Ej3b98Q1uHmWoSpPB0ZWAz6RxPiJmlGf9M
	r3OuIBw==
X-Google-Smtp-Source: AGHT+IHbMaG/UpKmNGf2vUTKm7E0YA1Q3uH84FrSyUdv5AM2rW1f4hc1ymcUcyPYeZk5iuLyxezoog==
X-Received: by 2002:a05:600c:510e:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-440a66b034amr9285185e9.27.1745570106663;
        Fri, 25 Apr 2025 01:35:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e0241sm49396355e9.37.2025.04.25.01.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:35:06 -0700 (PDT)
Message-ID: <2dd28ebe-f69c-49c3-90c2-aedc0484a00e@linaro.org>
Date: Fri, 25 Apr 2025 09:35:05 +0100
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
 <f05cba73-6d8b-4b7b-9ebe-366fcd92a079@linaro.org>
 <lwv5pk3dtyyxgtrwxss43dyecesv7pvrzvgwacwrnztkiowfkp@jqosvhrs3jk5>
 <42b56d7d-26cc-4c10-aca2-a0a5a16b09f6@linaro.org>
 <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3kprgpvzffupnjbh2aodsowwklliywpemzwpsftd2cng562yuw@37tpwmpemr2c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 09:26, Dmitry Baryshkov wrote:
> What should driver do if:
> 
> vdd-csiphy0-1p2-supply = <&vreg_1p2_ex0>; <- individual supply in PCB
> vdd-csiphy1-1p2-supply = <&vreg_1p2_ex1>; <- individual supply in PCB
> 
> vdd-csiphy0-0p8-supply = <&vreg_0p9_ex0>; <- shared pin in the SoC
> vdd-csiphy1-0p8-supply = <&vreg_0p9_ex1>; <- should be shared pin
> 
> I don't want to allow DT authors to make this kind of mistake.

I require anybody submitting patches to show how they tested this.

So you'd have to lie about testing it for a mistake like that to get 
through.

---
bod

