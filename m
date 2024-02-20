Return-Path: <linux-media+bounces-5485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09085B885
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 11:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAC911F21D34
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 10:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5591C612C3;
	Tue, 20 Feb 2024 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbGT405i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130E3612C2
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708423502; cv=none; b=KohdcOSR0vUxO5tMll2V3sAZYO1W8eaGRnupntHXEL4drs38d6Z8jkJzEZ2gdx6spv2PmdXmnGUTL6GQ2CI6G3HJluEqEzmpnFtT26uq/RnmJ32hY+nu7JtXdYoLmQD3nLrcVAYY8CRqwVhwjBPeAfVaC/9QKHxpZXQ+McHeC3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708423502; c=relaxed/simple;
	bh=gsK8vgFelfWvH/U1cQWGZkQASE4C01azb+x3KRMQ1Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6M8bHsba0Gw2XjF9PXsUuUiCI0crXZLR807gnY9nmPwH8qXcPIowaJBb3BPMYKPLu19Q5paVQAunblB0pERahdIPzLrUQFTNQ05a4At9dLVrrrT4q8knEDsj2P3cWQ683MWZ/Uy/Nya6xQw2TePToglnn1y2A3wJuHxJBrvtz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbGT405i; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4125e435b38so23864975e9.0
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708423499; x=1709028299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0Sxw1ohgrgB/cmpWq+TrB7sg9DZHiS+1mpFiVBUnXA=;
        b=nbGT405iA5yR8W4ATZ6qSdFuevNGWH6qv4exroeQ8po/PBt4osEz43mGpyleIYPzGS
         Y2/u2ztiNafOepXft3lqWfx0d1fFRIFQzYBKq60GCTioumuVEgXJCwjABfAZOVrpcu2+
         RGpqiJ1T5VoRQoVN1fRF5DwMF3K1sd24FxM9JW1K7u/7w/GLozqj1TEYL4Lr6+bg8oZq
         EhhYe1oHyYHJ/PMVvgbQWIMcq0gz5rj6CTESCXx8q/91p4AF0gPu1N71dMz+7wYhHAIy
         jX5mosUTyRGyHwM+/PJb7+uYZXlniUVAcqQ1CeqYn0IxwE5XxawCmD44Vs4ZVI7iNNN1
         aFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708423499; x=1709028299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0Sxw1ohgrgB/cmpWq+TrB7sg9DZHiS+1mpFiVBUnXA=;
        b=mC+bHODXN/WesExbg101uqsLBjuwy2aWlai0UTrYsrCQbLm+qaj/F1g3plcO+uuLCJ
         wpvFTYWZwnny81j3kIItGLazv2nVJsYy5BAWpqeRbYp6i0AiSqA7wXzQzDd+49M9rjPM
         32c/YYp7RKeGLVlkzSQ2oJt8WEfN92rguPVWZIwCUp8EZIccLzQzdJq6Jb9h4sXLXgSV
         t/2KCuIj3k1CGVdK2VomkZc2G0zFP0pEnFHYlaFTghrmydTgG1FpWEJoMzMNUwvGTwzh
         FCRMSsbizRbfvanprTWS1E3XY2gqL72Ui0qZhEOlfi/+Y+4YtdgzfN4onW6I6odKz96/
         XePw==
X-Forwarded-Encrypted: i=1; AJvYcCVIFShbu+f7e2u82wG3oTkWNrxnKoIc3yD1BcTr4cHeS7Y/SUPF6466fL/I0onztLZ7YtqyeTwNxwcLiBwqsLCfIk85J+x2fq6dEP4=
X-Gm-Message-State: AOJu0YyOYXWOpS3BmdW06ZJGcWU/vLLbwljGwP1NMzy0chgE4ipRu4Vq
	oueLycRN5aWgBTfFRywPg9Hqw/NsgAxxp7RreOsbadRjzNRWKdQfuehM0T7Uc5g=
X-Google-Smtp-Source: AGHT+IFbsjf+brRhIB/D79zZm8o5okEkG2X/0cpSQ9+80cS8wsRiE/QEjPXpjshCvyclMf9vRTMENA==
X-Received: by 2002:adf:f743:0:b0:33d:161c:40ea with SMTP id z3-20020adff743000000b0033d161c40eamr8609640wrp.49.1708423499006;
        Tue, 20 Feb 2024 02:04:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id az19-20020adfe193000000b0033d6ff7f9edsm839756wrb.95.2024.02.20.02.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:04:58 -0800 (PST)
Message-ID: <9dec3232-070d-4a83-8c99-ca87ffddc1c4@linaro.org>
Date: Tue, 20 Feb 2024 11:04:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: add galaxycore,gc2145 DVP
 bus support
Content-Language: en-US
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, Pavel Machek
 <pavel@ucw.cz>, Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20240217220308.594883-1-andrej.skvortzov@gmail.com>
 <20240217220308.594883-2-andrej.skvortzov@gmail.com>
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
In-Reply-To: <20240217220308.594883-2-andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2024 23:03, Andrey Skvortsov wrote:
> Don't require link-frequencies like it's done for ov5640, that
> supports both CSI-2 and DVP. And v4l2_fwnode_endpoint_alloc_parse
> ignores link-frequencies property for DVP endpoint. It's used only for
> CSI-2 endpoints
> 
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


