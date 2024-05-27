Return-Path: <linux-media+bounces-12012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C88D0A32
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F592825F5
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76B315FA8F;
	Mon, 27 May 2024 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVQ2Y5pI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25A15EFC1
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716836190; cv=none; b=WJFNLiz+rCwqOoChviJQaoPb7FN8de/9mgAKdRqclizVYEyZWSyukCo6Rs3aTzbenDF2lQGSSyQ8zLMwGscsnNfpkX03yv/GE+cpZIGqbB9XsrEOt6HmHS6XbPwwXM0NQiqhJzD+dKkFAsp46sX6vJy1b1dHylpIkh7uawUJjrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716836190; c=relaxed/simple;
	bh=kUY9DEBp++Ctjs4I1JA25clvPec+NnCPaNPtjIsS9cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJ4wxkNXq9Fy2084qXXHYsCm2GMk1d4yelxVWc0B3JPJyIAeZfy2G/IMh2gNuTvOV6grgzCVlZvCD/aGgKuOxxoBcRWBrlN7wHdDo4/DL/SdXa8I5ykv9LXsndndlPJSEJoafjk1+V2Br6IaT1dF76/eJGbVVlSQch85jsc4Av4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVQ2Y5pI; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-578517cab9eso22399a12.2
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 11:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716836186; x=1717440986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d/cISQYa3WvwYduNy9SIKMSrIozzFXqbbJybM1s1MX0=;
        b=lVQ2Y5pI3xGcXBDnCM4jimPklHfXyaUN7VKDLBiOf/FH/PS7ECrSlvPOCpgYjAFUQa
         +eX9BNbjv9BOqEf1bASqBvesa6th5kV8DFgKnbPsT8zzja+xD/ffDJHXOi8UJ16GE6GI
         eQzeb2Ax6d0wkbm5/npoFd3gJJAiEtcgutNgVcoLqoUrVhwYe4ytpt9rH554XlR3Yc8B
         Qx5uFzDzEkz9eBou3Eck6ScCQtgYAObQT9Iz8b3ZIpYi51fl/GI7PEzl+p9L4wduI85i
         0KKbjt9u4t5OeEcV0BGoE8TS2/rXt5uDYObpfgC5b13+3a8ds0Y+SNnkrqIeaxUCkCrt
         EHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716836186; x=1717440986;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/cISQYa3WvwYduNy9SIKMSrIozzFXqbbJybM1s1MX0=;
        b=PL37UiGjl4bO/2P6ZnKqU7d2qDGytRwu5NDE0qKXcbrEMFoeRAycIwZL47H4GwP5ax
         yVvKA+QMq1173vTYvfrOD1MSiWI2F1NCRIKcJEMDAXcC224s4klKhIBagp0XgNb6r80g
         OtX7DnwirCGekmjKu/muSXCOFSMtqoagauYMvxLNF/FTWByE44tQqErsMz0rOQVpMUR/
         sxu1yvFS5KpY/oTENMgn1Jf+Nhs9wyYo9TGz/bbZv6lvTk8Q6CmAwdDtTvlI1Nu7Mmg+
         WKg7fmMlDPiXc2mMHd9hSp/126SiDp6E5PCUxA58FC8EA5QWy97zAeVsOuBqI1i5/VNz
         4Rtw==
X-Forwarded-Encrypted: i=1; AJvYcCVSBlBrIQh/Q1qxF6/HScoyCeGt9vG6E3FLkQuO2sfKvgq0qBJ4p5VH2LE2IgrsmJ9oP6tWaN4zwotnfEpFvZFrC+hsODY++CnpmOI=
X-Gm-Message-State: AOJu0Ywz8tSGO/fFyuwf3CFO2fw+POxqiIZbLcY2OB/lQkVjDDIgiNaL
	jqSe1SOmYHKcAJbWQJrQHcx2AeiHgwwMVw62V/BWTHZLJeOhzN11njDGimRWatc=
X-Google-Smtp-Source: AGHT+IG0zcPp7rQvO2C5IupR7AHoLnwUZIKWNZIv3Q0Kwa7dM2GoSS8iHFVDpXnT9bE70wqU+mA73A==
X-Received: by 2002:a17:906:8ca:b0:a59:9a28:f1bd with SMTP id a640c23a62f3a-a62651341bcmr643845366b.66.1716836186617;
        Mon, 27 May 2024 11:56:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a630f25943dsm85736466b.41.2024.05.27.11.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 11:56:25 -0700 (PDT)
Message-ID: <c5f5a471-1989-4d2e-a2cf-5d2d7cff2f2a@linaro.org>
Date: Mon, 27 May 2024 20:56:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: i2c: maxim,max96712: Add compatible for
 MAX96724
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240527132216.1681903-1-niklas.soderlund+renesas@ragnatech.se>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
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
In-Reply-To: <20240527132216.1681903-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 15:22, Niklas Söderlund wrote:
> The MAX96712 and MAX96724 are almost identical and can be supported by
> the same driver, add a compatible for MAX96724.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 6c72e77b927c..26f85151afbd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -25,7 +25,10 @@ description: |
>  
>  properties:
>    compatible:
> -    const: maxim,max96712
> +    items:

Why adding items?

Where is any user of this binding? Please stop posting some random
binding changes without users.

Best regards,
Krzysztof


