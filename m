Return-Path: <linux-media+bounces-11708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2298CB2FF
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 19:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1537528289B
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 17:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEF11487C4;
	Tue, 21 May 2024 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KKwXM+oy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45522482D0
	for <linux-media@vger.kernel.org>; Tue, 21 May 2024 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716313073; cv=none; b=gHPNn+ft0HoxQc8ucY5veuYbr74JROUIFrqVM/EH8uKf5jmQONywFvFF+aOjcmaSb1B6CdoYspfFeR4QgDL6WWhvcB6gYHgu0EmPu2QHZfqo+N/Q2oEv0wnYlSUZgTP3GMNsLvm8s0+sVRPd3msDmXOqRRpcOmjBIJcPLtojj08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716313073; c=relaxed/simple;
	bh=9Z2IJRB5BE9yg+NKoqUCptIUQCXUW0WqDTrVapCxPAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adLxSdvEl8yEbpincDjNzq2mQNCdHAsdphm6vrc5ucVs36Fnhr0YSjqPage386mhOlMBk5E7EMqzmF5ukxwupx0N2Oc9+RPGQXKwnmqd0rVy3RjdffLR2r3rRO2KH19+G5zyKQ3KnHOpWoNtgUwjFiYdzwNucUWj9HzTRUbWhkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KKwXM+oy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41fd5dc0439so35121865e9.0
        for <linux-media@vger.kernel.org>; Tue, 21 May 2024 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716313070; x=1716917870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oTBotdZlBu0CAtWz80+2Z0RURHjFMppRN4GP/Il7qqE=;
        b=KKwXM+oyfD9W8oxPOEhzqUkpUmsJOYqLPHuWjKCGGnAYZnWrsZdLToWoJQ8TWS7yQ6
         pnZiKJlISEulGZGBYBUVfuQkSIE7Ey0o33HcGEmOo/VSifAxyOXpDDaHB7w0rZznkz82
         sln37ODKpoBILieGETfeee6gvlk/yEAoxZTbNnBHCjBpt77xaX4hAURMVin2vq/yYL1i
         h2D65yStdX3PjZ9vevITvBDA8QxMDby6LDqEsOofTfuIGL0k4O3vP083czVrBbZQIkc2
         tA/kLyYj4V/wwTgbfwhN9eO9xVw5/zJm4WUWFZhSwIkQGppsox/2fAY6JksJZHB1crxH
         WKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716313070; x=1716917870;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTBotdZlBu0CAtWz80+2Z0RURHjFMppRN4GP/Il7qqE=;
        b=D2U+N4Chqd831pS+xJFaEj6ctGWKmmRTqUBgGhIOnrKBn4E9zf6qsSmTNBQtkN4RGZ
         NKHqNwtbC4F9BtCi1FT7LHU+PthN/7F47s/QiQFyXY7ecQoqY1IwFI2jhfhJscDUn/QP
         JgJkNA0PJrpvnKFTIfZwCm39yDWSCtW4XYpN0UHgWW5ND4CCTDVUPX9w8Ur1AA2voYz8
         ngqcdQso5pqNfyH2eGvq+UdVEtW7/mqommqrIT1jFYcFB6hnkv6nl4JDyHSyfstkrKTh
         VoOTt9A5amjIavS1NNte+LWbhjgSK7oKVf2iex4AOSieeb8qHBlKH2rCzLemcTHWmRHn
         KWVg==
X-Gm-Message-State: AOJu0YwZIDCORasCphYL0VTU9sm/hChnLUpDL5Yh/RQZ27BqNfhHhXeV
	i0w60JzQr3PSuoIkZ3eBvW912J7UQbVUDnfsyy1PUJeVDg0Qc1tGreS2Nw1v6PI=
X-Google-Smtp-Source: AGHT+IG7UaUVX/Ba2cvMeEsXYCybkc9fslKVMiS+qAEQq115fhmptSfr5lzygGAnpVcBJPjvfezZ7A==
X-Received: by 2002:a05:600c:1913:b0:420:141d:994f with SMTP id 5b1f17b1804b1-420141d9a56mr223114665e9.18.1716313069722;
        Tue, 21 May 2024 10:37:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8f8asm471704455e9.10.2024.05.21.10.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 10:37:49 -0700 (PDT)
Message-ID: <2110ba34-658e-4d60-b524-2f5ead6c8d3e@linaro.org>
Date: Tue, 21 May 2024 19:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
To: Sylvain Petinot <sylvain.petinot@foss.st.com>,
 benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240521162950.6987-2-sylvain.petinot@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2024 18:29, Sylvain Petinot wrote:
> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
> sensors. Update MAINTAINERS file.
> 

A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
> ---
>  .../bindings/media/i2c/st,st-vd56g3.yaml      | 132 ++++++++++++++++++
>  MAINTAINERS                                   |   9 ++
>  2 files changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
> new file mode 100644
> index 000000000000..22cb2557e311
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml

Why duplicated 'st'?

> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2024 STMicroelectronics SA.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/st,st-vd56g3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics VD56G3 Global Shutter Image Sensor
> +
> +maintainers:
> +  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +  - Sylvain Petinot <sylvain.petinot@foss.st.com>
> +
> +description: |-
> +  The STMicroelectronics VD56G3 is a 1.5 M pixel global shutter image sensor

This claims device is VD56G3, not ST-VD56G3.

> +  with an active array size of 1124 x 1364 (portrait orientation). It is
> +  programmable through I2C, the address is fixed to 0x10. The sensor output is
> +  available via CSI-2, which is configured as either 1 or 2 data lanes. The
> +  sensor provides 8 GPIOS that can be used for external LED signal
> +  (synchronized with sensor integration periods)
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,st-vd56g3
> +      - st,st-vd66gy
> +    description:
> +      Two variants are availables; VD56G3 is a monochrome sensor while VD66GY
> +      is a colour variant.
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  vcore-supply:
> +    description: Digital core power supply (1.15V)
> +
> +  vddio-supply:
> +    description: Digital IO power supply (1.8V)
> +
> +  vana-supply:
> +    description: Analog power supply (2.8V)
> +
> +  reset-gpios:
> +    description: Sensor reset active low GPIO (XSHUTDOWN)
> +    maxItems: 1
> +
> +  st,leds:
> +    description:
> +      Sensor's GPIOs used for external LED control. Signal being the enveloppe
> +      of the integration time.

More information is needed. GPIOs coming from LED or SoC? What's the
meaning of values?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      minimum: 0
> +      maximum: 7
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base

missing additionalProperties: false

> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 2
> +            items:
> +              enum: [1, 2]


> +
> +          link-frequencies:
> +            minItems: 1

maxItems is enough

> +            maxItems: 1
> +            items:
> +              enum: [402000000, 750000000]
> +
> +          lane-polarities:
> +            minItems: 1
> +            maxItems: 3
> +            description: Any lane can be inverted or not.
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vcore-supply
> +  - vddio-supply
> +  - vana-supply
> +  - reset-gpios
> +  - port
> +


Not a video-interface-device.yaml type of device?

Best regards,
Krzysztof


