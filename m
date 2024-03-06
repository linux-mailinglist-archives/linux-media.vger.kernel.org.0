Return-Path: <linux-media+bounces-6539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A231872FCB
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 08:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E5ED1C22E93
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 07:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191235C907;
	Wed,  6 Mar 2024 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooteZS8J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F817745
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709710579; cv=none; b=n0yH7Hll+kQCvYeyDBZVPnyL8TZC2+ik7VCcgOnDog9icPZKWmUP9OwO/L951H0K/5PUfaZhuOMVCs31XTmpcgDD6+j1V2IcxqdDslLpGOSuhOj7xEcgzEAoKbIC44vRmU45MeW+gCv2f2zFhDzubvX0IZtcl93kuryVmUo1NB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709710579; c=relaxed/simple;
	bh=/4FjtLJG53wYg4p2abswLcRMve6HOEJlmDwdRGOjO+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnbV0qtdQM8ZfY9tKAqYG+qJVo5KuuMrL4lwQyiijuQ2+GJOY0aZuA9Mq3k7Po9z4xfDHzN7G4gOoApoaVL4R15sqSkTD+qzg1b/xS/GskZt68FwVzWdIELJQmBQ4SegftsG76aH+bJ4awDPaXyeHRJTk13vbiQBh7nVtPspPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooteZS8J; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a450615d1c4so93892566b.0
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 23:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709710576; x=1710315376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9Ayz5TaxZN5GTuq2TZZyUEucZQ7+vMm9uqaP73/QbE=;
        b=ooteZS8JS0axnnjnqoMtkNfgHg+xuqIyMsiCpoWqF/lBveLBRpY6AuLqsNz8NaT64S
         iTO10SSCDP3HahgMMkwBTqDufsWDwj2ZLYG1syHBlaqpvHf3NTzDCFgZM8mGxT8RryvA
         bcXHXnRHWcbX7TJ+4gBA3vUlnU+8XHn2BL4jt0R2ulZ891gYg0JVw/9JgKmt6jw9NNND
         ZtxWFqReL8vTa1azbuuoF8V3WIW7wJGSBGmo5di6fGM+Nifk11GVTfysXANe5SI74ukQ
         WZ6qve9iu/czCB3PxQtwSUDbbtQ0DG8gNofmXA2o1WkhJcpS1o0FhZRUvx/agtye/7Zt
         Ac3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709710576; x=1710315376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9Ayz5TaxZN5GTuq2TZZyUEucZQ7+vMm9uqaP73/QbE=;
        b=HDc9egDNpMnd3oITrMpWfziq0Y7w8JCv7tmdymdiH41IqcQ5FnUOQttWhDBXpYQ63U
         wP16Xw2cb1MHBODRc8uz9INCoeJhdKq/+cernZvvYAuGpZCORovorGEwH0eMSV8+fRmn
         a5KjxP9dnmzSyjaPD0iDPOZZoccw9NtplVXqfdCAiqjCPgGQOMh/G8b323eNYg4ntR7i
         wFl+tv0RCCmxZ+/cFSDvBcvNsgO6Ve5/WlwJ00iwtpZPHG1MGpj0zNQr81Ov4PExRpW2
         3j7F3URpcIJmvohziSQlngsU744KxmW53OzgFCuzJzkY+nGOH8E3SajB28zHW7yf/KpR
         idqg==
X-Forwarded-Encrypted: i=1; AJvYcCWYgoKoZ2DUolIxXgeB1KIZC7Vz7QIRGQkjqNDHz7+FeJy+16haBJG72A7E9MAPGUQoth0JZXY9lbD8obwS/ydK8sLsVhCL8jzjjDI=
X-Gm-Message-State: AOJu0YzF1Cn+LIU8fM/u/EdMFO0yUhCYvc+IysZ1Q/xyRE/P45Cb1gjU
	9udUbKUJSjA+/wGbWFkR+hQcf/2kECS9FYSn2zoSIvAoYSd9GmXgodD4A5E0gzQ=
X-Google-Smtp-Source: AGHT+IH1dyMdg/JbQ0AKLE/7ih53j4wQzhtHkBO/spEeYmXk191crqkru4CqbRHizARcyPS/pCcyyw==
X-Received: by 2002:a17:906:2b49:b0:a45:b616:29fc with SMTP id b9-20020a1709062b4900b00a45b61629fcmr1502412ejg.0.1709710576184;
        Tue, 05 Mar 2024 23:36:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm6793728ejj.84.2024.03.05.23.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 23:36:15 -0800 (PST)
Message-ID: <e9a7b038-dd5d-43a3-9042-6c956032ce2a@linaro.org>
Date: Wed, 6 Mar 2024 08:36:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Content-Language: en-US
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
 robh+dt@kernel.org, mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, jerome.forissier@linaro.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com
References: <20240305164832.2055437-1-dan.scally@ideasonboard.com>
 <20240305164832.2055437-3-dan.scally@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240305164832.2055437-3-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2024 17:48, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---

...

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input parallel video bus
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/properties/endpoint

How many ports do you have here? If only one, why this isn't just a
'port' instead of 'ports'?

Best regards,
Krzysztof


