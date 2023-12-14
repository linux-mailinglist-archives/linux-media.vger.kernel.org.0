Return-Path: <linux-media+bounces-2394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757A812994
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 08:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9A06B2112F
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 07:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F6E12E79;
	Thu, 14 Dec 2023 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvMP9wP9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D1FA3
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 23:42:10 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5522ba3f94aso1570953a12.1
        for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 23:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702539729; x=1703144529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMElSWC9iwqGvBmo8uWjNFZojYiZXvN/GQzRbqzsr2g=;
        b=QvMP9wP9q4xuj3E/AJ+wqlySet6YjzMdjlhf23iNCF1H3bWhrsXllevrt4T2391f1l
         rhbZA5j/1/NA4xLWrXDD1O6VD4IWtJkB1FlB9cipqgdQVpv6kD5MBsN1NkypSnV8TYgq
         yTN4SX56jEDcyigr1CxYbKFVuRehWEX0mZPhKSZJvU83G4HXlNgSwX5l0jfua6bO2FZm
         lOi9rkdfpaIw2SLDleSj2My6UEUppQixJCVTHuysVC4IB0qGIxaayXawo7A76YvBtjgp
         hgD4d0QlTaOH7V+gjlenLyi31yVQ6iEk6gWubWUw31gQtvP4/oD22Y6GlAGGAuYMITWP
         HLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702539729; x=1703144529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMElSWC9iwqGvBmo8uWjNFZojYiZXvN/GQzRbqzsr2g=;
        b=eiCeR0Il+fZGWGTgQkhIw9B3XAM7YkfN+NXMcoYVbvwwzYnX01UK68SW7c/aETH5r/
         fKhG/D5uEVXmN40jduuoN4NI0MM+9IJk7QE3HyO9IyvYQY1BC1ZziHEljy1/s/3Otbyp
         C2qnviGYx8KstntxvRh9qJM6yUOostI9Ysr81ykddveNjRB3TE8zFuGTtZxQl5dMVmkW
         zbus7byUm6hOl51CsHV2UtbtnwNS1L0G03cLUSaCG2EZFRops2MKMN9d5WTTPtE6QSjM
         koHLvmQLkVV2kxocqD7WYM8mJ4xA34DLctGnOuZYfesoQYwady5ab44cExPVAhd3BN3S
         WnfA==
X-Gm-Message-State: AOJu0YzvFyOysX+DAZWJG1BXzflTQWf/1iFjtPdFqNM9JSi/KBKb8eSY
	la4M3rG95IivExHi6APl01xmng==
X-Google-Smtp-Source: AGHT+IHB62sUmG4NZm7gqH7rBQdPOt++ROP30/V+3OFwfrVoKGceiRJailrXbaDFjD2RBDlmS/axZA==
X-Received: by 2002:aa7:cf83:0:b0:54c:4fec:f9 with SMTP id z3-20020aa7cf83000000b0054c4fec00f9mr2533739edx.136.1702539729402;
        Wed, 13 Dec 2023 23:42:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id ew12-20020a056402538c00b00552691fc7f9sm458868edb.66.2023.12.13.23.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 23:42:09 -0800 (PST)
Message-ID: <d6cbc405-6113-4d6c-a9b9-8f5a32159963@linaro.org>
Date: Thu, 14 Dec 2023 08:42:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: samsung,s5p-mfc: Fix iommu properties
 schemas
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Aakarsh Jain <aakarsh.jain@samsung.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231213224227.2191897-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231213224227.2191897-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2023 23:42, Rob Herring wrote:
> The iommus and iommu-names property schemas have several issues. First,
> 'iommus-names' in the if/then schemas is the wrong name. As all the names
> are the same, they can be defined at the top level instead. Then the
> if/then schemas just need to define how many entries. The iommus if/then
> schemas are also redundant. Best I can tell, the desire was to require 2
> entries for "samsung,exynos5433-mfc", "samsung,mfc-v5", "samsung,mfc-v6",
> and "samsung,mfc-v8".
> 

...

> -        iommus-names: false
> +        iommu-names: false
>  
>    - if:
>        properties:
> @@ -102,11 +104,9 @@ allOf:
>              - const: aclk
>              - const: aclk_xiu
>          iommus:
> -          maxItems: 2
> -        iommus-names:
> -          items:
> -            - const: left
> -            - const: right
> +          minItems: 2
> +        iommu-names:
> +          minItems: 2
>  
>    - if:
>        properties:
> @@ -123,11 +123,9 @@ allOf:
>              - const: mfc
>              - const: sclk_mfc
>          iommus:
> -          maxItems: 2
> +          minItems: 2
>          iommus-names:

Also here -> iommu-names

> -          items:
> -            - const: left
> -            - const: right
> +          minItems: 2
>  
>    - if:
>        properties:
> @@ -144,11 +142,9 @@ allOf:
>            items:
>              - const: mfc
>          iommus:
> -          maxItems: 2
> +          minItems: 2
>          iommus-names:

Also here

> -          items:
> -            - const: left
> -            - const: right
> +          minItems: 2
>  
Best regards,
Krzysztof


