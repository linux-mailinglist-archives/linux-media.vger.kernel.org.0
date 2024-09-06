Return-Path: <linux-media+bounces-17771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA296F423
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 14:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F6351C231DB
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317CD1CC89C;
	Fri,  6 Sep 2024 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vs9z3/VQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60351CC14A
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625149; cv=none; b=e54xwSLXZEO7/RHH9dcQd+gbJZCV0icZWN7aJSbKRpUpdqLj/k2jK5zxoz/stejYEvVbpwZ+043A2ghUQQUcM0cfSEELvXUnfkaa5fq6mP1POxSbceacfxoLuYx+p1Tf8SCTC0RgsKNu09pzeGu8HSeG+O+uWyzJBMgj+ibY448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625149; c=relaxed/simple;
	bh=HqOSDRzaUnhGRLIxiVCdBa6LDvnvu4v5GyRQUYJsm/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoXtVoyfYZGvfXphqFEVHWQqVWiNtWAdHu18IkDuG9OdFg7MxpJrMTVBR/Dsm1AtIdPVVQjDf7xdW/hpj1QO2bJaxu48KwamPzI7l6FrZiJznyZP+UyQHbXCdeZ7NodvjgQCmpoz+mJ0tjEz5+hNgQ43daSQO1xJj4IVR8lwnT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vs9z3/VQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5365aa568ceso500540e87.0
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725625146; x=1726229946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZnagyoqEY/AkJWYldk9pxOfEXujNgZibP5iAapvYX0=;
        b=vs9z3/VQWSG+WBTY9jfLRmKAy1vxB3i/pq/dugye5DTrHoHdP8afzUbnF/7nVdGPtG
         4FQT6T4TQ+U7cXqUalUxnk0K5u63OWwvIH9eTjxteO9O059pGtfCae0iG3P9M6KCb2EH
         LBdhxyPkxRmcK3aak/g3Sxu9yGuSiJQN9Kgo1EwMuD+Lu+FoZDBp58q4u/p2fqgRGTCK
         vBTyUaiWP6X804KARU8LiOpw4GFnb61ikgVK1FDT7w/JHviwDktHCiLjOVpv2TrIo0aa
         PfgUWc99xTIo/ffMZbdCpu6Ry49ouGD9hinnG9Xj2Ia4DoBLtQuo366Tkg1tFxwIM1ma
         22sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725625146; x=1726229946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZnagyoqEY/AkJWYldk9pxOfEXujNgZibP5iAapvYX0=;
        b=DKge/LEYno7k8TTZIqgwLbWJdldZ5Pc8Q3IAqahTp0JsEKLVdt2n75JCN44bbMeu5F
         D760wlBf1Io3TJGTAESZucexE1ogTIIZQB8ECRFuclTs7J031z3rfENlVRD9/BK+Z0T8
         I131psjrARoan0Awb8jjk5hpBq8QquDnJ3IfXD53RQjAJ2o4qQSf6NanEXcFd/8bUGkD
         GYesG4MfpeWzaezweb0de4BduVVAEsXaJkVWYY5ZA1XACjXi9ZqfzxkGfF+bY6/VO31E
         jAY6YACx5J3LLK5+OIaGZiJff2ktyZwkb5S+7FNSo/mGBaY3Mz+M/FkN0vTDPBqLN8Mj
         PDTw==
X-Forwarded-Encrypted: i=1; AJvYcCUiKtq0iRPSUERiXzH3zIAy7/sdEl51cOWVSuKKZq3kxVcRl86CWYcecOVHSLb9ATGSd7gEBON2IUoKmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyneaDaLeqBHrj9Hs5RRnkN6MF9TUnZbgmL/TL2tlOhQ0h5X6Cm
	2njLQynV58+MIFfcZAkVriAr7pRCNnsU2ptKpzq5FqiHRddho+BadV16rIh1s9U=
X-Google-Smtp-Source: AGHT+IG74zIVOWX6bQluN94U4nrkIyRLMi3pWfBQY/TtSYoHYIc0SP1Bhu1/uDRSooGa/P5qsj690Q==
X-Received: by 2002:a05:6512:3e02:b0:52e:9921:6dff with SMTP id 2adb3069b0e04-536587b54efmr2266960e87.26.1725625145620;
        Fri, 06 Sep 2024 05:19:05 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a83ed05c9sm117085866b.114.2024.09.06.05.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 05:19:05 -0700 (PDT)
Message-ID: <5c58b41a-7fc7-456d-979c-edb8dbe4305d@linaro.org>
Date: Fri, 6 Sep 2024 13:19:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
To: Richard Acayan <mailingradian@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
 <ZtpqrANbJurWNOzV@radian>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZtpqrANbJurWNOzV@radian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2024 03:36, Richard Acayan wrote:
> On Thu, Sep 05, 2024 at 10:09:34PM +0200, Andi Shyti wrote:
>> Hi Richard,
>>
>> On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
>>> This adds support for the camera subsystem on the Snapdragon 670.
>>>
>>> As of next-20240902, camss seems to be a bit broken, but the same series
>>> works on stable (although it is much less reliable now that the CCI clock
>>> frequency is not being assigned).
>>
>> I am not understanding this bit: is this series making it better
>> or not? Can you please clarify what is broken, what is less
>> reliable and what works?
> 
> When applying this camss series and some camera sensor patches on
> linux-next, the Pixel 3a seems to hang when camera capture starts.
> 
> When applying the same patches on stable, the camera does not cause the
> Pixel 3a to hang.

Right so -next isn't stable that's not exactly a revelation.


> When these device tree properties from the previous series were removed:
> 
> 			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
> 			assigned-clock-rates = <37500000>;
> 
> the CCI would sometimes fail to probe with the error:

Right, we don't have clk_set_rate in the cci driver.

Maybe just leave the assigned clock for this submission and we can do a 
sweep of fixes to CCI at a later stage including setting the clock 
instead of having it be assigned.

> 
> 	[   51.572732] i2c-qcom-cci ac4a000.cci: deferred probe timeout, ignoring dependency
> 	[   51.572769] i2c-qcom-cci ac4a000.cci: probe with driver i2c-qcom-cci failed with error -110
> 
> On further testing, the rate can be set to 19.2 MHz, and there would be
> no failure (or rather, it wouldn't happen often enough for me to witness
> it).

That's expected 19.2 and 37.5 MHz are supported by CAMCC for your part.

---
bod

