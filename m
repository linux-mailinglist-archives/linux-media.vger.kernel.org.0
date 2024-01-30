Return-Path: <linux-media+bounces-4427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0318426DB
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 15:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55C8DB23E42
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9AB6DD08;
	Tue, 30 Jan 2024 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jxMiadYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA7C6DD03
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706624745; cv=none; b=ac9WkenhIk26W+jswdpaspQhS4wbDNljnI+qFCcyJPWKbqqrYkLy1aviNO0TEtflgtww/r3bYbo1LZeyxZ9+RXiQwEM0KPIl+nf9a0UYH9v9vN5mYVnQeauG3KPB01iSSQEbIpFutRwOrcDyZRaecPUovHBlkUcI4UDdEx6fAz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706624745; c=relaxed/simple;
	bh=aTzIAFW7kPGSQkJMII81+rHbzN0d8rG7hIuRrTeE+Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kK06e+YyK2GxiZGsykKZZFKY3rQfAh4XrMunz33jfdWW8gK6UDUoe6pww+PfLzc12dQrAYgsd3SbPi/xSlmLI0K/GlJm5I3A4Oz2aeyJWlNQ+I0irfYuaWUMvU3RlhsUjp1Ge05h1q7zK7+pyGot4mLU1hM6dMdqPrKPDGpd9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jxMiadYZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a26f73732c5so482532666b.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 06:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706624742; x=1707229542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XdXWb0cKpDxPZwCGPesaTZXovEKgCL0aOQvcZzmgP7s=;
        b=jxMiadYZRRxiLajC6MO8FnAIjnPrCSTBr+nkywK0RTFgfA0mzUGSRmMw7zGO7QY/Dr
         ui9ICtuBgxAm7aKOzkVB+30LGtHAftBipbi/TMRjW2QBQMXVgtSgFYxpgwkfStN9yomf
         lsW9Ur9rk94VAWROFMkWDcF2nTfMNk+1D98Nny+Dr6JPLjhJyGeyPkBVPtud2DQK1ta7
         zggMJvVIsFBj0psbdQRiXRAe2U0/HySmmj90SnexlwHlW59eZWepd/ivBJ26CgrHfzgF
         7Sp2PWq9uoLBDBKRWmQa/+UrDXOAA0Dj+uOjR29pp+1DMNHw1M+juTlrgoz7GtYoj3I0
         31Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706624742; x=1707229542;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdXWb0cKpDxPZwCGPesaTZXovEKgCL0aOQvcZzmgP7s=;
        b=Ncy7yS5mYoqLCrvLn4xmUeKHXySqJnQAoFCanlW16glmeMfbh27JGtPPFFXbMyUHp/
         HZgoMXG79AV+E0FOx0wdljyEFHvT+LYe1ShR9dJ7bZxq9u1La1yRtwxymxtmBijq7IrA
         2fUOrYZr9lD3k8WxdXgzZ29GEqkw6KM/O5J/jZzfkymdmcaiEgwGt/AD6Vs1pCqVul9L
         MfxUD/t2ayZLapFLIaOf+o1kzAmY+nL2FrZ/hFu9NAcxELmazM8z0KHuXeB4UIQSFQy6
         jjohlBWDe+OZM52n0XN9emNNZ6XBxjGAcNap483USjIhrUDsAqMG9UFVk6uNVzZ/j7uh
         v23Q==
X-Gm-Message-State: AOJu0YxlrObRyRUL+DUPYLgSn2mGycgfUIv3tRiTZ/GchrIKNN8fLK9n
	R/mlD3hgNd6+mXbt59xfpYGTC5TJiV+H39tN7z1d2lv59eOWTXuEQgvcqvaIV8w=
X-Google-Smtp-Source: AGHT+IG3vt+YWWk1ODXk2VLID9ewW1P++jgw69DfhjJpyr4FhxrGY3hcboG/XwB6vDzRCJiZqyYEjg==
X-Received: by 2002:a17:907:110b:b0:a34:a9e3:5529 with SMTP id qu11-20020a170907110b00b00a34a9e35529mr6466344ejb.42.1706624741834;
        Tue, 30 Jan 2024 06:25:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWmF37qUUnaQYrdMzXdOnQm6FdWQ5DBmqFnN0XnR2KCxZ6h/ICVfE8YZuKbJQgrOup010D31qU9ym9pcERkxVF4F8aX4qU5zwA8QZJRFZHHZ8XWg7OWMNjS16M1Nr2pdKxcXENujiTwRxZ/wbNpzluPYdiee1UfHUDiqBFX4RmJUCUyfv1zxrDJu/B8hKzSdniLlu68+Imtv3gFGf9mrltkjFPORBhpD14kzkTi5oDn/YS8TpuLYRCWlurPk0vZCWnAGk91PuwMMgAO5bWFjXLffgGfHWgtc2ts0Z7a3Dmntpc/uXdsIsFcQAuYElEwV9PKYZefsaoPR8o0kHN4O3fvkETHypZdZWXX1Is6R5DM6bpedNsShNoVsShPVkbIZHk9rgMNDIWwpymnuxf4sLcVbSVvSA24ueEAYOqFMc15czW+asNOTWA+UXlPA/TXAGoqSGbe9/y2RilQLkNC2/xrn63dQ4XVuhEbO+qkqGE32HiRMQKD+sudahbx0f8jKZ4T4EyS6Vdv8M9BLimFl+6L3OTPPPHGfHOxT2DRC0eiqpjSO9IoJUNcVSzvXvtNspe7WSSKwYh84FegODw=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id k4-20020a1709061c0400b00a349e943828sm5148913ejg.75.2024.01.30.06.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 06:25:41 -0800 (PST)
Message-ID: <9a8cb901-8021-42a3-a13b-bae10a645011@linaro.org>
Date: Tue, 30 Jan 2024 15:25:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: s5p-mfc: Remove s5p-mfc.txt binding
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
 andi@etezian.org, gost.dev@samsung.com, alim.akhtar@samsung.com,
 pankaj.dubey@samsung.com
References: <CGME20240130125754epcas5p2edd5cc52dc58add09299d3aa5985a9fd@epcas5p2.samsung.com>
 <20240130125748.54194-1-aakarsh.jain@samsung.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130125748.54194-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 13:57, Aakarsh Jain wrote:
> Commit "538af6e5856b" which convert s5p-mfc bindings to

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> json-schema is already merged. Remove "s5p-mfc.txt" file.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  Documentation/devicetree/bindings/media/s5p-mfc.txt | 0

Why you did not remove it in the first place? Your diff from
538af6e5856b is so confusing.


Best regards,
Krzysztof


