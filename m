Return-Path: <linux-media+bounces-12016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC98D0B04
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 092931F22AF6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 19:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4331607A1;
	Mon, 27 May 2024 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WM5+at7f"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE215ECFF
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716836712; cv=none; b=jW1FM6cdVG0RhkedBxllVs5l1kIBzwByBsH254a0VKs6Ny7QnCT8ETfEjoJ4uiLZJC6jjQGjCsfljKYtYdXREGx2nN87Uhq6KZQy9PzEw5nMB7tF0WD/5m/50vu7dj432/jkxvNAOKvJ6pPRDdhRE/3XBW8dj/ZvuhKtDRdKv+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716836712; c=relaxed/simple;
	bh=/rnvwWn+eIPBI0YrWZQpmPB9aZMBK6dV8VBOnimWFjg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=S+5qOb4W33/kgyzRGClVYZmbUcHgPBfLs8uG/0FNI7wkm33cAeAZlCWaassfaz0ggGSga7CWWc+3pJWUF/2EjUeP4L4xkKFEDpTLakmRMMsYeOb5pyzRI14iLZs3pU8vPUpCY6MIGWprFwFPSvoT1hCyiAMP2/ioQ1PYUpkzz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WM5+at7f; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295d509178so90288e87.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 12:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716836709; x=1717441509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4kXS9nddib3XLf5CYGsW2IFBpVQNzR2KAdVGPMDeXnQ=;
        b=WM5+at7fCcAkyY/E9wiz6q2rls12OQAud/61WcUozux2uDilKwyon9SLyo4oGYAoyG
         Qa2C9IvHKCOPCwgPYMksBQ6LS3g8wIOHyxro3yNnCKHOHYyRjrkoutIfNdfRTbFr+lGu
         XAkf+WKj1nD7nqYezBfZflr2zwooBIjJiZ/LDV5XmEH9PxY6Zj3rUQ2hWpSPkK2KX3zi
         slg95C1BZhRwAJAQMWjhsIOY5gvkdd4d0tYgTJqfHotw8oIc4jMq5WaoTwphNj0CuQns
         nih5Mr7P/+G1KaN3V6Q6Vssy80kaBhlL+xVO3GBLBdzNobW4qAlQn+/lXtqqC4Ej/aEJ
         +ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716836709; x=1717441509;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kXS9nddib3XLf5CYGsW2IFBpVQNzR2KAdVGPMDeXnQ=;
        b=LOqiDp1XouX7Jhk1LCz1z5ZyZGW/GvtUMzkF5/56exZrZCDBpcLRnDpKHtw0DYD9Nw
         6EHuzm0o3f2xDU/cp2vzYX8FhjjBMmn0ppnwp/hfCp1Yi7Aj8Fbpb6LXJbcLiNIqVo6V
         WOEOocvvwpvo1Q1TBUe1Bhl5+AiRTecaaDHAXM2uqA+NxrSAm/EsQ5CuRKwj5T/IvbyQ
         iqFn2JUgbdRxHcrpQP9ib1InYMRZUA4ejavEjAeNrfXH4xQeNyeRf2mc7QXmYo8IxoyP
         Npt4wxnXLCEf65Ma+0l7bR01em84ek55pvp9j8hWIFKn/mPXd1q2uuacbobkBtgLJ2dJ
         5eqw==
X-Forwarded-Encrypted: i=1; AJvYcCXXLdhbX1qKa4d9rN4gtBc7edCfVEIn0roy/aU5Y5+wjY2JiP67jLUJzv8YqT/32nAZMH7b7OZR8XBvq0owe8v9f3twOYngI1ZTbGU=
X-Gm-Message-State: AOJu0YxQcswSEa2M+VebQvgRCAVVilHEt3uSvZdMMI3t6hsiCMqM2wmO
	roJ39GpNBrogLI3mhumppdQ3I5YuhJH3i1kea7NrOh77MuXbNICjarU2jJk9k4A=
X-Google-Smtp-Source: AGHT+IGuPXTldBY/idHnqHLU54Du9J/gwZ+dEmL4Y8kySgTCzJ0Kyt8fHAJw7L2mKqlLcvYcbA5idQ==
X-Received: by 2002:a05:6512:3ca0:b0:51d:1d42:3eef with SMTP id 2adb3069b0e04-52965b39a01mr11310662e87.29.1716836708817;
        Mon, 27 May 2024 12:05:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bb79esm6085907a12.92.2024.05.27.12.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 12:05:08 -0700 (PDT)
Message-ID: <959cb44e-064d-4127-95d1-a3b13cfd9a2a@linaro.org>
Date: Mon, 27 May 2024 21:05:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Rob Herring <robh@kernel.org>
Cc: benjamin.mugnier@foss.st.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240417133453.17406-1-sylvain.petinot@foss.st.com>
 <20240417133453.17406-2-sylvain.petinot@foss.st.com>
 <20240418130916.GA1016598-robh@kernel.org>
 <e38eeaab-f3dd-4129-86aa-9f6bb03bdc40@foss.st.com>
 <4a75aae4-9ed6-4e7e-883f-23ffdc1354ec@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4a75aae4-9ed6-4e7e-883f-23ffdc1354ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2024 18:06, Krzysztof Kozlowski wrote:
> On 03/05/2024 10:25, Sylvain Petinot wrote:
>>>> +...
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 7c121493f43d..991e65627e18 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -20868,6 +20868,15 @@ S:	Maintained
>>>>  F:	Documentation/hwmon/stpddc60.rst
>>>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>>>  
>>>> +ST VD56G3 DRIVER
>>>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>>>> +L:	linux-media@vger.kernel.org
>>>> +S:	Maintained
>>>> +T:	git git://linuxtv.org/media_tree.git
>>>
>>> This should be covered by the media maintainer entry.
>>
>> I'm really sorry but I don't see what you're referring to. Can you point
>> me to the correct direction please ?
>>
> 
> Find the media maintainer entry. Do you see Git tree there? Then it is
> done. Otherwise, do you have write commit access to above Git? Are you
> going to commit to that Git?

Please answer above: can you commit to above Git?

Best regards,
Krzysztof


