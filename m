Return-Path: <linux-media+bounces-35851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0359AE7B71
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CB516846F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC4F285CB8;
	Wed, 25 Jun 2025 09:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUIvl8+3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D6272E42
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842316; cv=none; b=sLuodyvmcA75KIUTy67jRCaya5HrK+mMkKyhh01sVUb4ABTzhrlrZ2NIX4f9ukLSTWhvOINH9BMY4E06tGARR89XfJRdUz2viAEY3aHjZOyRsQwUQeuLEUU7OXssqXCVdVAh6LdL5khFiGJm1FGXyDloPhucyYC3MDQkmKxTzZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842316; c=relaxed/simple;
	bh=ofGLBeV8YvNpQlj6p7A7WvoAdljAiZc3L23Hg6zDPrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccwSpYis3dCL5VSSbJGve56Yi0FosABMxpfB+F3K6EKSAVso3l6LvSXCHWRTgnbAKv2BB72b6pOzznfTpwoIOjqgkjNdDEQTIYr6d2rXOrs2BLi5pR+zFdGRYWtKwnXpzFqFywmFjv+xJfwEmT+u59Ko8NzLZOnphkFzX8zZ0hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUIvl8+3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530e6f4db4so2645575e9.2
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750842313; x=1751447113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=etDFN6wtvcavr2f8yVWmXNqZFsdQ0B/RvviXTfGgdHI=;
        b=xUIvl8+3pHYSY5ZYZpHwj+sCBIjZDurs/qPx2tlLrJ5PJrli+fpYpbIPWk1mIXdOHH
         cxEySAgt3UdwBysbSm6phA8s7V2F+rMd4qZF+Au8HGEabceTF/2FVmTkUgaI/THQx3fW
         EbnWmxgjB+astNEyDO0cyQxkSuq4ta62/es58dLM4RSxvOYfIOoYy55fDhsbpIj208cs
         cIZOU3bCOqShiddcAElg1765G209SgNOOtix5GFaZJQ5dtBGzu+K69v7Nvs+5wJFdGkb
         yzjY+SlLal+l8EM3dH0rr0ToIvwAQKgm7nNBpP5OSTpFIgrEfO7NdB9a3D+QPXDC7boG
         MbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842313; x=1751447113;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etDFN6wtvcavr2f8yVWmXNqZFsdQ0B/RvviXTfGgdHI=;
        b=aYMzPJ8tT7Tc8rqbv1JQRcDsQAozZsOwCiqghti4upKXdaqzWBavaODccStYx/NU90
         cSc0SREaT8IPGKrUJgG0jzBhSq2qq32hG6+zvCKNzH3YwmHBLf+ksrfftQNc5bSutRR9
         sj7aXJrPKpr8k+iLC3VyTjj8X7LCvlLnANH2Dy8DzSKfvXxHm98zSW3B+AyfKRp7ALo5
         ytyL7suniJ+ekRGhPBYvzMuC3Csps6eulT30Q4K3iFSv/kPadcNY5K44AFwTcGg5caMZ
         346SfNs3ddiK3D93J7WCdmIy10/ry2gNaU2yuL6wpygzCgi1gmkfaSwxj2flv6vS6XPN
         PQwg==
X-Forwarded-Encrypted: i=1; AJvYcCVGzPpThrrqhz8NIK56zVwU39K6dn/Yc6hSJYdPZ7gLZmrYSsFH4mjWxHJNYkziR9vGK2J9QH0hduakuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDB/XVuFG0/hyGuyDQUMSYRCZMWljhScFh1M2ZSfSoKgJu2AXI
	9I/9yGRyg+iWOQg0QS2/gP8HNv+k9iHJTLR2UlfWj3KWZRzlpstrqchSAbp3KbhBKN4=
X-Gm-Gg: ASbGncu7W7kBm4l73vRdNBcghnc46WCL89lOS3k/INmVEKo/W/DcbKTelgImBjsxvcE
	3eFu8JIX+Vxne+xDpGghgoBlpL8sbs8Ni0PHiOYS24e9jO3r1WNJqSls1bIlP9nBNkslV0+njaW
	huAK/rbOfkq+tSOASR1MWoWghaZ0QDDljszZvukdZAlChOS92QUnfOvjwKZIpNljvktTRC2XKtR
	ivJk1/a2ZFRq/uIVsC+nwqnDXYEZ+ubqYsYnOmghnoXspHDIpTgDLYjFGKEtddzKUJ7lkkGJztx
	WFM/SAanduJnfTPg133PCMGQc4K4XeCHDfZvo/lVn1Xsh/XUQEwVglYiOn5FiqASOlaIW56kS50
	LPxOTIg==
X-Google-Smtp-Source: AGHT+IF8op0IxbzSI3ROl+ecmGm2SzX7vVGkRXnPCuboGaPdO95czrLIN3iOd0fglW0Ut9sjEj5wgg==
X-Received: by 2002:a05:600c:8b85:b0:453:7011:fce3 with SMTP id 5b1f17b1804b1-45381af8609mr7565455e9.5.1750842312540;
        Wed, 25 Jun 2025 02:05:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80fed75sm4116645f8f.66.2025.06.25.02.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:05:11 -0700 (PDT)
Message-ID: <2b32b8ed-c841-4862-afab-c583da644217@linaro.org>
Date: Wed, 25 Jun 2025 11:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2025 12:21, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You changed the binding significantly - adding new properties (which do
not even follow DTS coding style).

This invalidates the review. You cannot just keep growing it after you
received a review.

Best regards,
Krzysztof

