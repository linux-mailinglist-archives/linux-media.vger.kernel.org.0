Return-Path: <linux-media+bounces-34637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73434AD786E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 18:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D409188E391
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF232F4328;
	Thu, 12 Jun 2025 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wla5QSUL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C45298CB2
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749746649; cv=none; b=by4RR4LA7ImibezaOEXop1ONqSn6ER1ddUgo0ofy8V/jLKhmMXnXhjokSIjPRivwxI0HTIELhnWvobCQiD1F/DLrPoeZZsdhwp9GMjJVs4DbOwyT7zriJUyP9GtHe4AqqxTG9olHTH3fjzCNJWVXoXjU4U9hAj/4qxf0HiQS6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749746649; c=relaxed/simple;
	bh=XNRFCn2xq6ZvMxYEmFNVYqpK5j+n7FaHQGELdFrNTNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bdinzv+k3nn+K/tuqyFkWAidg6IrxVd19eS+y+BQNwnfq4E/k5r1z/nCKToErRvTJ6Nv/00pZy6Dfh5xeuuAtQ2ejUpqJKa4xtLMXy1P/7K9oVWSRYH0rGAOxcBFbYYuPIsmQFsEU2MhQ8zAD+hXaqzdfhAoYkH8IS8cG2r5hCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wla5QSUL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553aba2f99eso53741e87.3
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749746646; x=1750351446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXFzlDR3NN9zjV+kXINmEMgirHyF0OEuBzat3RN+F+Y=;
        b=wla5QSULow5uFJPZAP3UtIjEmlFoHsM00a7vJnB9HJ+K4F342A/WsB/zI/un2irIAp
         yYJELFQ62DQL+XPO4P6bk8lctPf2zTem7QfKMR+ctDbDfT4Rwy7+K+b0x8yGt4mWRBFx
         jdovMecSFKLgptyM2lBfW0p09ashdVsfZcow/HO7oNcE49f4UgmikFCgaRVQmJRUbN4N
         ayDWQQy/0mnm+QHUObSFKx2tlFv1XeLnnekv/JGuWba0qpeieHZsR2tIwyA55x5/aurz
         1hHweLnVXAe8lfDmEn9b+Sun5Njip668qBQ2pWoIsSUKZZ8pcO3jY8rhcZiI3ysbe4bz
         NQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749746646; x=1750351446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXFzlDR3NN9zjV+kXINmEMgirHyF0OEuBzat3RN+F+Y=;
        b=WPNs3SEc2Dopw8TXCwGGeMQsERB++FVkfCTaV9jAy0SraIa7SHyEiC3XMjUSktQour
         mVxVXs4cP9xJMSkSF3qOSM4ITffD3vwzEa5bE7S/MbQJNxUWK4J5iMn5IkQgyMZJMO7v
         f8zqS5/f1iNKxCDiw+fYDbEqq8ltf6Zy+YC31+zpUmLoWuEbrCIVBEwOWtR1Zrwnn7YR
         DJgJFbapxN5f4A617ETyzWZwHzuoyJOYRkBHdAL/Qw44HFHxXQ5SLy7qP9YoHGkTbd2N
         LiZDs6NY8wmccuXU9+9gMHOqMNhYPYtyllafg3bwx768pYFBlHBNd6schpoo1UlKXCzZ
         UIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUyWskvB+2Q+q3YIY38r9ZfojYlBI1ouWw54Hx1ZeBFg0c/WLaFHfM+h20Bolmi6nlPyDUNBSiUGsKfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/nCUmMWa+iJqnTGZZZ8LQ/gHFbEfW1qNogYZ8RpS3eyRxaga
	wfNqSJgbxrA/3q4Q2E5HnJzUAaTcgrWIFIScdqyJ6VKhkuHIBIkXT27CGTFPXIgKIcY=
X-Gm-Gg: ASbGncuISJcngombzZH5bda07QNr9feC9A+hjDMX+h0eupyFyuX4uNgDjtSaXEi9x4k
	v6m71IpNFznieCi4VmZL+2PwunOlcVh8EY5ZDYXMBv3uX9/oVToW/wxBGEiqdLLm4lSB+ZjdJ1C
	7ll9Uz7xThrXF/PuhcvI/dRoR7qj07b8bTGOqzoVFvBlCYd11G/Kqmw4zCg8N9SpnNYCQ9Iw5QZ
	WUwMIy/Gke1z33X4Loer9lbe36hAZtMyMAhYq6IrOovwxHdkqXVvXxJTEsYKbXgUC/l4hAaEK/r
	XCLNXI8hWMJI+ZsrhOMKx68MBAtuJUxJZLUr2Z7HSVLjCuIzuQ5ZWMSkME+Ad20Aymk9SWbAenk
	cA2a7pRWt4f4p+uWXvInpfzB7+n2hbuBoOI8ygCvw
X-Google-Smtp-Source: AGHT+IE8FzVDQPCKuB1NwCD9tDUD32maNeFB/5bboQRVfOquwmRZ2GcL3C5ERe17LRZKxcyKs7voUA==
X-Received: by 2002:ac2:532c:0:b0:553:a88c:2ae2 with SMTP id 2adb3069b0e04-553a88c2d03mr311456e87.0.1749746645884;
        Thu, 12 Jun 2025 09:44:05 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11678csm163378e87.9.2025.06.12.09.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:44:05 -0700 (PDT)
Message-ID: <9bd4ff5d-7c51-4e21-91e8-17c6bcab7f67@linaro.org>
Date: Thu, 12 Jun 2025 19:44:04 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
 <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
 <4848f13b-3b2c-4210-933c-b4f28d7c6ae7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4848f13b-3b2c-4210-933c-b4f28d7c6ae7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 19:17, Konrad Dybcio wrote:
> On 6/12/25 9:57 AM, Vladimir Zapolskiy wrote:
>> On 6/12/25 10:39, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 09:38, Krzysztof Kozlowski wrote:
>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>
>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>> ---
>>>>> RFC verion of the change:
>>>>> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
>>>>>
>>>>> Changes from RFC to v1:
>>>>> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
>>>>> * added 'clock-names' property,
>>>>> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
>>>
>>>
>>> Now I noticed this... weird change and clearly a no-go.
>>>
>>> Device binding cannot be generic, so it is not good enough for now.
>>> Please write specific bindings for specific hardware.
>>>
>>
>> Can I add platform specific changes on top of the displayed generic one
>> like in Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> etc?
>>
>> The generic compatible is sufficienlty good for adding the enhanced
>> CSIPHY support to any currently present in the upstream platform CAMSS.
>>
>> Obviously I can rename it to something SoC-specific, but then a question
>> arises, if a selected platform has to be a totally new one in the upstream,
>> or it could be among any of platforms with a ready CAMSS, and a backward
>> compatibility is preserved by these series and the new CSIPHY dt bindings.
> 
> A YAML file hosting common properties will probably be very welcome, but
> the compatibles must be specific to avoid having to redo this dance in
> a couple years..

Right, that's a good way for sure, and I keep this option in my mind.

My concern is that it might be not a perfect fit particularly for CAMSS
CSIPHY IPs, because likely at least all currently supported in the upstream
CAMSS IPs will get one in one equal hardware descriptions, despite CSIPHY
IPs are obviously different. In other words I anticipate that there will
be just one platform prefixed YAML file with a long list of various platform
specific CSIPHYs, and therefore it's just one potential $ref user of this
hypothetical YAML file containing common device tree properties of CSIPHYs.

> Then, the camera ip is well-versioned, so you can use that as the 'specific'
> part. It'll also make it easier to resolve the unlikely case of a SoC using
> a mix of different PHY versions.
> 

Many thanks for input and reviews, regression test results of the given
CAMSS driver changes will be also very much appreciated, it may be helpful
for Bryan.

--
Best wishes,
Vladimir

