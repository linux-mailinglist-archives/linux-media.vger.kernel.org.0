Return-Path: <linux-media+bounces-30934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E2A9AB12
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2450918994F2
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6DA215771;
	Thu, 24 Apr 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPxOfT8K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BADD1F8670
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492030; cv=none; b=CiW2l3RObhqXQs3DujFRTyeHzlYE8NZQPqGDVfHfUjR6S5fEVVYxzj9uh92gvyqJmraae/yWwD94dm8UujdSHBnuJHAdU8jX8GgqrI7LaHWBiYFq0mQaytAnvRmSIUeOXIaIRzWbHhyk0rWsjG1tqtIK8DEY5J+J90P7SPgnMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492030; c=relaxed/simple;
	bh=qpsqlRT1eEQ11KTAaoQ7QXAvDoDv7WRzvWDBcBdElFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/UeJd6EJ1tgVgiLuBZhC8gS1NE6muWVJawT/izuaGtNWfdTRF0kdjf/btJoaP9W9AT4V3WOAZQQW+IJGMkR9VhlRR1WPUnojLFDPsRpukFTlLBiyHeR3DOu9m0j0SirEmgqgR36Og2HaTA5BJv9q8oODK8anfKY4NESnzNZUy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPxOfT8K; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b0da81302so87412e87.3
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 03:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745492027; x=1746096827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iz6NUcWj6EAWyg+m0t+9RfeeZ2BF2rAdUY/5Xy4ikpc=;
        b=DPxOfT8KO/Z4YmOqX97LpkiN4Q1KbAsu/MHmWpbIibaFbdUOCdTdvth6ofJU2Hn70E
         OKhDcQLMjg+1vd1Ab9DJXWzHQ+WYF9qqmFBe182YQ2CK3P2pB/hzEjARxQ309g0LPmXZ
         jfwPOiQjr/qMA6IFf4Xm+a62jN/dEI7S/lhIOXfIdHPPzcbfCbrzGdUwljXvmURkdYQb
         QTfBvGSrWiWhu0YM8vj6P6bXy8OSGC1zJgbUT/rRTs5wSck9J/bGwAHjiZtO/0FN6QbA
         H+eBVBeMPihPtU6h97vuq6fjrzbfYBEPe9Zs+Eal+HHwclKKd0iNkEHEw4TjMZ88b5d0
         bjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492027; x=1746096827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz6NUcWj6EAWyg+m0t+9RfeeZ2BF2rAdUY/5Xy4ikpc=;
        b=iAj7URtObOdnBkdOUj9rtIYcMlA5feRyf0cRZfFJYgaiEpAia4FB9PbDRCjAmQJfVl
         lS+GR0ZmSan3z05/swJ55EdKD5VGW0c7CiEzZAEfJyCyyrotcPm+K+n1sLAYsJUSbDGT
         zzeERg4FmIb1XiFCxhBDz4SiM1x5DAvZ3il8p/zIdksJVp7N0Cx58T4mbTO9cznBO8JM
         Nb56GJCXGcIE9QWOFdYGjFvV+Wbv6z2iw0V8zdOrgMOIjj4CuRYM9fVsHfTjOxJNthGw
         f7QZGOB1p9oGU1GULPkjP0iEXLJPd2/AxpAlIXSrW+NvtMbgiuOasUz4jFxskArXKekq
         WiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUNjhKd3PHFpcqQ+g5BxONEmAFmE8jaAzWhyS2k7FieQesmOl3vUoGNUe7GdcW4bYiJAnmlAJr4TJY9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkDJAWQAWySTEbPhNdHhIiv3qMXdS4GgT+rRqVbUKp904Du9ph
	9FciTuGJzknoMz5dkPWy/BP9DxuiCfDxIntNWt0IBGNDOyQ2X1OGGVfhOS2GcjM=
X-Gm-Gg: ASbGncsUXmRlRwZeHhpSReKEWMXLDmNaYuSKsREOYlNBr4h8SApueFanCD8EpSsQH9w
	ApHJA4Sv988PqdDHVNpMn1Ts3cJAJhvFeilTCYkcvCVMqo+xEsgIn34uoKZUoju+aLwzGrlYUNG
	fB+HQCD85fI0Jb79yhHPZ89S9Mxu1FMy16uWG4HAHpRBVcwm584Krl1FgbINNvpUHz0s+XkFqGv
	JKzDmnjUBXc8hitfRu2xMwC9v9+o1tSpumY/BHBXy5MW1liYSOoJ8YPQ71hGBNAfYsUVqOeEO7Y
	kc7RlG7aP6LBwtg85JLTCCtkpE77kmIf5LLi6MDTEwjCWZ6LEg4pGetzDPAm0dXR5K6PFAvpsoz
	uptSBzae/sWVRC4NdRlI=
X-Google-Smtp-Source: AGHT+IH/ebr6nf6wKlBpxfTE0DB1zuhY2mIh+1ErCgqLo4TAwLNWBhh6mziY2fi9srQ6OhxLjVcGBw==
X-Received: by 2002:a05:6512:696:b0:545:2774:4cb0 with SMTP id 2adb3069b0e04-54e7c3ae5e0mr268067e87.0.1745492027115;
        Thu, 24 Apr 2025 03:53:47 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca848csm189333e87.167.2025.04.24.03.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:53:46 -0700 (PDT)
Message-ID: <a0ff4fcb-2b9d-4b9f-b5e1-586ff3900719@linaro.org>
Date: Thu, 24 Apr 2025 13:53:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Krzysztof,

On 4/24/25 13:07, Krzysztof Kozlowski wrote:
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

concerning it I would appreciate if you can review/comment the v2 of SM8650
CAMSS dt bindings I've just sent recently [1], the equivalent property names on
that platform were named "vdda-csiXY-0p9-supply" for VDD_A_CSI_X_Y_0P9 pin.

I believe both these platforms and likely the following ones should provide
similar properties, thus it makes sense to discuss it at the same time.

[1] https://lore.kernel.org/linux-arm-msm/20250423221954.1926453-2-vladimir.zapolskiy@linaro.org/

--
Best wishes,
Vladimir

