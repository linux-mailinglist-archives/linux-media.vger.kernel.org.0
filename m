Return-Path: <linux-media+bounces-3618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C382BC07
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 08:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79DDA2824CE
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 07:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199705D739;
	Fri, 12 Jan 2024 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ie3A3n5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2555D72F
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 07:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso3526788a12.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 23:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705045778; x=1705650578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ho7SlJoHvT+wKcAbJ0KHph2ARaFaURvHzXGzLEWuXYo=;
        b=ie3A3n5YUqqyyK0MT8CgyskoPeCk2RPPtl6sv9bhKYxBMNfbflBYuzwIfYtY7yhcmh
         NldONS9bAZonsw1jsLO4BNxkedYKFxZ+ClRgTXJcEWkI+Y7i+b1UEmkSINJIPIduuNH7
         fzTZc+Fylpnb4HQ9WS54bJvgr0hGr4/PSS5fQkr5cpQzhKUiTnF/0yLuqmpUB94f3r3o
         86edvgHyMf2Ng1Op15divioX9cwUWWN0G4Jf2qQpzLdK3GxshLn38bJ//EHkeQWepVdL
         WbIh8msDK2kvrEkTdL5XXYzVVfMZJoTMHisD0Xu12CorlP7rb3jtzcEaPuy2kj0BQxD0
         QmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705045778; x=1705650578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ho7SlJoHvT+wKcAbJ0KHph2ARaFaURvHzXGzLEWuXYo=;
        b=sBk8FeKKsOsbm3OxxcFC8rKR45Yq41HV273SolyHi34jovVUrm5veJcPIhEwYq3C8j
         aOSMYy3t9ctEt4iI93thvWAadKsWKseDehghBjNYYu4xXiOoLA+eIukI6TaUpukwalX1
         csGMYYbBf4n+mlRUmJxoz6co67/F+2+x9WrBXM/4KpWBcxEPK1HfOg5sKaCmubzDh7vb
         +rVGXbLScKVKdjESWvE5gYakj+ux/mn1G1PAfK5ddzP97haVslGDXfhV3fH8B78n0zJM
         z1hlEoL3FxHnA+dYXzEZAcpq60TlUyxp075sIjruXJ/TDCfZudK/kW/0AfKM7A82vZej
         LMoQ==
X-Gm-Message-State: AOJu0YwmlKPiBS2BxVPigqjzrO4P94aoxmXLm5cHddqdwKavhPPthQbQ
	UMy1J4CrnsEOpBNc3k+vmgtVVEDUykF9kw==
X-Google-Smtp-Source: AGHT+IFwbs5pWLsJXQ2+pUMSzfRVQ2ym1X2Fwi3bxKT6cANJLh811Aeu3ekpMMi253iblSahgxheYA==
X-Received: by 2002:a05:6a20:72a8:b0:19a:81ff:d24a with SMTP id o40-20020a056a2072a800b0019a81ffd24amr409703pzk.60.1705045778088;
        Thu, 11 Jan 2024 23:49:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id x1-20020a17090a388100b0028c95804922sm5882465pjb.51.2024.01.11.23.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 23:49:37 -0800 (PST)
Message-ID: <2792ce50-c95c-41b8-b564-7d1f98361e78@linaro.org>
Date: Fri, 12 Jan 2024 08:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Julien Stephan <jstephan@baylibre.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>, Andy Hsieh
 <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Elder <paul.elder@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-3-jstephan@baylibre.com>
 <feb4e04f-8282-4b52-b785-07bf15008e06@linaro.org>
 <20240112074141.GA21256@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240112074141.GA21256@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/01/2024 08:41, Laurent Pinchart wrote:
> On Fri, Jan 12, 2024 at 08:34:45AM +0100, Krzysztof Kozlowski wrote:
>> On 10/01/2024 15:14, Julien Stephan wrote:
>>> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>>>
>>> This adds the bindings, for the ISP3.0 camsv module embedded in
>>> some Mediatek SoC, such as the mt8365
>>>
>>> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
>>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>>> Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
>>> ---
>>>  .../bindings/media/mediatek,mt8365-camsv.yaml | 109 ++++++++++++++++++
>>>  MAINTAINERS                                   |   1 +
>>>  2 files changed, 110 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>>> new file mode 100644
>>> index 000000000000..097b1ab6bc72
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>>> @@ -0,0 +1,109 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (c) 2023 MediaTek, BayLibre
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek CAMSV 3.0
>>> +
>>> +maintainers:
>>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> +  - Julien Stephan <jstephan@baylibre.com>
>>> +  - Andy Hsieh <andy.hsieh@mediatek.com>
>>> +
>>> +description:
>>> +  The CAMSV is a set of DMA engines connected to the SENINF CSI-2
>>> +  receivers. The number of CAMSVs depend on the SoC model.
>>
>> DMA should not go to media, but to dma
> 
> They're not generic DMA engines. The CAMSV is a video capture device
> that includes a DMA engine, much like pretty much all the other video
> capture devices.

OK, some more explanation would be useful in description.

> 
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt8365-camsv
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: camsv base
>>> +      - description: img0 base
>>> +      - description: tg base
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: cam clock
>>> +      - description: camtg clock
>>> +      - description: camsv clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: cam
>>> +      - const: camtg
>>> +      - const: camsv
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: connection point for camsv0
>>
>> This explains me nothing. What type of connection point? How does it fit
>> the pipeline going to the display?
> 
> The description seems wrong, it should state
> 
>         description: Connection to the SENINF output
> 
> or something similar.

I am still not sure whether DMA engine should be connected via graphs.

Best regards,
Krzysztof


