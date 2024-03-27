Return-Path: <linux-media+bounces-7909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EEA88D85F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 09:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 245D129CF8A
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 08:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2972C6AF;
	Wed, 27 Mar 2024 08:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P88wYt+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F39286BF
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 08:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711526833; cv=none; b=ApEhrn4SFMPIJgzlqXAjX5GUfb2avd+bWTlL64efpOPQOiVmM6CYKS3yKeLimWkePY3pD8f46fwgEWhM+VZaGrcS5dy0F4U/2KTzBjVu/adKh9Ki8JKHwPLFNBaJg89JDIAHPq3Z27zSBQomaZlGRepGKavrrT5u+Joni4d8C60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711526833; c=relaxed/simple;
	bh=6fNsx9RWsJnZG6mwCbPnM0sFiD4AswT44XnDFJC+h6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxfEoc02RvqD6c8jGXh0bkJNK9LMLYNsT0pA54VK55KNQpVYyQeRaDxmukzP4rECvWOYWJAubfMVmzebQc68Rb5POrCFBr5qYXl3ezSgz17svMFhG5tb5byckEsxYx5pKKKWhT0akOQq/lBBT3W42xDoOf4CREc1KCAhND/5b1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P88wYt+g; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso9041563a12.2
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 01:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711526830; x=1712131630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DHpRv5m9qBO3VP2pv79ZaaNTQqUyjGsvLAfHT51tqyg=;
        b=P88wYt+gPYpP4QmH6No5p4oMuYdT7TLbVWaE9gvQluxVD6VS8ay0KlRp10PuBWSlVj
         mCfAVfOSnxuhVoJXV8+gHlNP4EfF5kEF5p3BgZOXeilHM/zFECZKrWbDu2i5ZUJIz2/Y
         JcEmUyw/1CcGRnVVVN0r/oQNgA3mf98AatK29yHphaG8S8MyACFSW3eyftPGkmL6g/vj
         yBuxZu8+RrseCltxojXf+yqlufRDBXe35Bs413WDWyRgBfrh4jiY/HuElu/jf/MTCH/O
         ewMjKwTkagi3BhApwV1+Fj3cA+aEEbk9QHUah/tSaQOg1E6N/OctnyDC8qMq2NhpaW23
         Fwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526830; x=1712131630;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHpRv5m9qBO3VP2pv79ZaaNTQqUyjGsvLAfHT51tqyg=;
        b=X/T5T5AeCbjtUSKrn2Xb2V1iVMhexnMgEzAnW7GUJFNRB4hGfCIZ7jkc3RWUy/l1IR
         DhPhGG8ozjVtLSabjHAuqUP2hTfQzl6LjvLaMJmTb6IdEi0tKzLoHV2tJa+cKXpC8Wfr
         HAfgmA1tKwVmI/iKzTMBZ073jYYyt1qfzzuzl6yYoI0Hs4F7LIfwZZFLcQ5uDzhoWV/Q
         3tAbGJx920Vp9XrRgzVaWfbzxuHHkv2EwonsNQHeP9e9yi4WfzKbzaTzV+jcT61viP2u
         gud/F5zRor96Tne0DvdLYM8FxHi1ECqofGL2Og9N0hxWXC12I9Eq8inE/9xA4HSNq99q
         vVfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkVMecH/tfyLQYfIkJ/UB7cQQ/EBriF/vexLg56+PSVF1sQuhQ4hMeb2Y9eYoBSDskgsnaSeeCUCQQcm4niD28qFNTNPKY1njLbh4=
X-Gm-Message-State: AOJu0YwQyfEi2rLMGcbehdWUseYt8LeQKaqotx3kWianxmPbcntYgv9D
	F9yJd+20OgcWYjm9wSFlD4DZy79VwnSnchsXhy9jX146J8oiz/rTFiLYTQrNAc8=
X-Google-Smtp-Source: AGHT+IGpbeK605a48X0485mS6nBzFy41So4zt4WQqPT0L7Cg815/2MD9hNx49O3CQbOxZZvIHOcTYQ==
X-Received: by 2002:a50:9b07:0:b0:56b:f352:d379 with SMTP id o7-20020a509b07000000b0056bf352d379mr309918edi.2.1711526830426;
        Wed, 27 Mar 2024 01:07:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id q30-20020a056402249e00b0056bfb7004basm4574040eda.90.2024.03.27.01.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 01:07:09 -0700 (PDT)
Message-ID: <06a91d8f-fac7-47c1-9fb5-50c95a959906@linaro.org>
Date: Wed, 27 Mar 2024 09:07:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: ovti,ov2680: Document
 clock/data-lanes
To: Fabio Estevam <festevam@gmail.com>, sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
References: <20240326231033.2048193-1-festevam@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240326231033.2048193-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2024 00:10, Fabio Estevam wrote:
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          clock-lanes:
> +            const: 0
> +
> +          data-lanes:
> +            const: 1
>  
>  required:
>    - compatible
> @@ -65,7 +78,7 @@ required:
>    - reset-gpios
>    - port
>  
> -additionalProperties: false
> +unevaluatedProperties: false

This looks like unrelated change and it needs its own explanation.

Best regards,
Krzysztof


