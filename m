Return-Path: <linux-media+bounces-30928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3DA9A9DB
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8A21886FBD
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C6D22129E;
	Thu, 24 Apr 2025 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPLs56kN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E91EEA5D
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489839; cv=none; b=biaONKYlZPLtIJoaZvIP+Y7wlBgNx1VICtICzdN/kAW5a7do0oVeMrCwHH1uZ4mBCHBm6Hw8x+J8Nkd91q4LUbA2gC3DWno8ocReOY8KWUaSEo+iZQdBcCLjuWw/Lg6sAnmY4iamTBuQwhCWY4d69jtKkWhYGNY/AHPwNvBYxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489839; c=relaxed/simple;
	bh=JgxDASSoJfH/+WDmK4aXcaHmUCS+QeddplH3cTE41pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxDXuCfQE73sVJUVqJTwC6aMQ3JtgTZNhpkhHN1HP3iiXhFUm3L6OxzMbHtIYWrPioKdasdD20aVj6ocz1ugZyP0IFMXd9nctrgcexKWdhetc3CenefWeEMliJSnXLqQUdXypr3b6+Yiqbw9O/Oq8E6E2XrHlUN+qJaQDAnoB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPLs56kN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39149bccb69so753123f8f.2
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745489835; x=1746094635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+Imx+wQAU0QKY64/Iw1K/RWq1pYJ8SS5BPHHrm4NL8=;
        b=dPLs56kNFzFtqwTzhQ5o+f6TXMXFNBEloI4mq5ZKZI0I5To4D2sdhXUfcbeeRgIClv
         fpJC4b0qYMvsabyA0xoVLE4s24eOCjfsCnvYUMjNUvABFPfKkizXg8WnzTzRzFyz08yQ
         s8NG4lmNdLWxUmrwYlFUVoB3P40gX+7NNO90al6zGyluLuyD0fzhf9QL9rItHyapQ2Lw
         AT97Iux7cKO7YfLK2Ncmqk5qOqsZiFJvc1r3/KG2BImRiEBO91KO6llASFCRNJtqKZWO
         4fkLjmDwiMDn8DfZzRdasODuFH1S7AiW4ja3SxMGOLLSwKpOnKxl3ilbzBZe/1zS+1jo
         Fw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489835; x=1746094635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Imx+wQAU0QKY64/Iw1K/RWq1pYJ8SS5BPHHrm4NL8=;
        b=je6dHJjyS0nXsak6xB0xR/O5zRjkcNHt03VZJ4NreW/d2etjEAdzakDm76Kw7LCYLZ
         IK203ycrOvpRTTHjUDepIA58pKQsbE68DgNH62gT8WF97wWTi/m9muTamd6ayAYcrXZO
         GQKxtxlH7sKxbSdAaPN4IHBdp2ALHdXn8ODlvj7TOjHp9VJKcBsp0WHEtVMKVYdSxj2I
         qU/MwdbzDIfkXDJT5/lSQNyrBW0lp4+hxg1o9HlyOdQFwqcDAOFokZ6ak+gUp/zIxyYw
         kZU9eE9nOyuXL/MZF8JJ/CDsfQKAANtWvttyzmef1ylrAR02icuZE1gFLapswKCF881n
         n1eA==
X-Forwarded-Encrypted: i=1; AJvYcCUxiXlje9Nq82mTf0SUXHUxv7ObY1BaCYI97CGnziafQKy0KthajspLou/tCZLNcZHOCAfBkVjuJNX7BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWsYNpSIUQXFA6PWdbLR0kEerJ+Jh/QkoTIgvc63nbr4ASKgEU
	YaCb94xTrYyv3Sk0eILRIdqH3lLpM7W+9AVLMWW+4VZM66RVqYxaEulpb6Rt4BI=
X-Gm-Gg: ASbGncsLlQDQNFRER50lxr1QX33TW7IKQA78+9/KTrZXMZJI4pYkjxJkL/OJ7/V9NF0
	re8RsrOYmbizqgwPm9A3swXBBqWvTRqVRqrhj9K7bBmLcK2jcsPrQognFclZ+pIidDqde4/p/W+
	jg8U1zWhlqjsiUaBhiwT1LB4jqPK/dEO+8qMEBMgndE8A4W3p17oi/pmlU3OyZWl0fdNhCIVRB+
	fRHBSP52iPqf5ExnFa7gcSLXeNiOQHefMbnbmVoxbcvT6dlo0YHC7q5ws9qHmYA69WoriqdauKV
	2Pp4ZsGqS6g43evD5VZ3k7TNol+C669/E9o02DRaRDFo+m9ysFH0KiBDBn+B5/YLPdEycvvEc1H
	0WJH4fg==
X-Google-Smtp-Source: AGHT+IEC5Ceql13E4xaaL3vBXjhyhbINkr5oD2t6MLRnBCK5ExF8s71Axb37L5Qr5Iw6ung4pwT7lg==
X-Received: by 2002:a05:6000:400f:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-3a06cf5996amr1872460f8f.20.1745489834980;
        Thu, 24 Apr 2025 03:17:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c246sm1571967f8f.86.2025.04.24.03.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:17:14 -0700 (PDT)
Message-ID: <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
Date: Thu, 24 Apr 2025 11:17:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:07, Krzysztof Kozlowski wrote:
> On 24/04/2025 11:34, Bryan O'Donoghue wrote:
>> On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>>>> +  vdd-csiphy-0p8-supply:
>>> Same comment as other series on the lists - this is wrong name. There
>>> are no pins named like this and all existing bindings use different name.
>>
>> The existing bindings are unfortunately not granular enough.
>>
>> I'll post s series to capture pin-names per the SoC pinout shortly.
> How are the pins/supplies actually called?
> 
> Best regards,
> Krzysztof

I don't think strictly algning to pin-names is what we want.

Here are the input pins

VDD_A_CSI_0_1_1P2
VDD_A_CSI_2_4_1P2
VDD_A_CSI_0_1_0P9
VDD_A_CSI_2_4_0P9

I think the right way to represent this

yaml:
csiphy0-1p2-supply
csiphy1-1p2-supply
csiphy2-1p2-supply
csiphy3-1p2-supply

dts:

vdd-csiphy0-0p9-supply = <&vreg_l2c_0p8>;
vdd-csiphy1-0p9-supply = <&vreg_l2c_0p8>;

etc

vdda-csiphy0-1p2-supply = <&vreg_l1c_1p2>;

because that captures the fact we could have separate lines for each 
phy, names it generically and then leaves it up to the dts 
implementation to represent what actually happened on the PCB.

That would also work for qcm2290 and sm8650.

https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/

So for sm8650 instead of

+  vdda-csi01-0p9-supply:
+
+  vdda-csi24-0p9-supply:
+
+  vdda-csi35-0p9-supply:
+
+  vdda-csi01-1p2-supply:
+
+  vdda-csi24-1p2-supply:
+
+  vdda-csi35-1p2-supply:

you would have

+  vdda-csiphy0-0p9-supply:
+
+  vdda-csiphy1-0p9-supply:

+  vdda-csiphy0-1p2-supply:
+
+  vdda-csiphy1-1p2-supply:

Which would then be consistent across SoCs for as long as 0p9 and 1p2 
are the power-domains used by these PHYs.

---
bod

