Return-Path: <linux-media+bounces-14457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF591DB6C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574D21F22DC9
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCCF1E4AF;
	Mon,  1 Jul 2024 09:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLMEhE2Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BDE2C859
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826220; cv=none; b=RheSo9EBNDQza7bRaJmnseOxWxC0JCaBnQziT3/rG+eM25nf+pvGnfzLimyAWRJ/KeyWc3/cweV08o4PU+W7k4h4En+Z0vP6fhvxnv26SntY8vLjMBZahnSGQSbAopSSPN1IAHD6k2BafnvtOujUwYy9TzZ8bytwc8Q1jnAYSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826220; c=relaxed/simple;
	bh=cWzkLrdQR9ieS/E7mPMECsmquHqNaPXfYzjPxvCTsBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKWpls3KTSKFFAY38H8BRtaHocLbxBnsGRP38Con1ochUiMZx2WxqcLMhrtVwi1vCUolW7LgjTJThx2B5GfDUFwsL3AOceNDovbbL6L/OU1PQl4oattCa8GiV2gvdyPk3NlVb0jZyIkjHVoEfOLAWTVLLrt1Ow66hMhM95CsoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TLMEhE2Y; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52e829086f3so2180058e87.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719826217; x=1720431017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G6+JxT2KhwEMeTWlGdtqOChlYTjFucZInfUHD/Mw92o=;
        b=TLMEhE2YbRBqsEZqhvyROltjrz5zAmu2plp1mRq9+LoryJLXe2VEG9hcY60jx+f8Yk
         4W3Pwen7EvXhh6t1+cAi2V7aHiCe7Q9JFtQC+Pkg7AUUrrvVOyCtXGE2Gzp9HAbgr0Xm
         7xSHhbjNViAgD1+NEvnuM3boXYaOAdbp9yMup/jGm4tIMSXeA5F/bsvFS0fdnDP+3MTg
         uIN9IAbTV7R5dOeWUYqB87/gT9J1i593/ZOCCKl4u3xTaO9SLm/LV5emGOUN1KrC16ja
         9ZsOvB26KK1H5a5NetX4eabwlUTr6CJcr1vOSQK8yWDWcJY25zl4gQyXKxb6En95zUYu
         2akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719826217; x=1720431017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6+JxT2KhwEMeTWlGdtqOChlYTjFucZInfUHD/Mw92o=;
        b=K+ffc5PtYw3EJTAmgVDB0wpXgN1UAVLiYqfeEz85EJK+/pRIX6joAXzsmWwhrZvpsl
         AmCJu5LWQKILwYjOEmwVQoqgXdJ9fe7B7A/znRg3drIQfun02Lv44j+93jVoaTsP7AF2
         /mC1IgeJIOzNIZXbgGVncf0Fmul8poMq+TkH1t/E23ZlPY2t+7LsyhvyzvFAAocXTB//
         lPdfzieG2si4EchPUVynHmYMJTeXkj/n5rb2m3YNvYMrwDWNh2eyhsRkk4TwOSQAAYp+
         E+NaWEkroaRHHOXN5aJTZxXTfoiQShKszIKOw7aelLcwfJN2/3gJQy5r51dpmrDDJRCA
         qSNQ==
X-Gm-Message-State: AOJu0Yw68R9dPrQhyPv+0V4pjLinNPKHed7F85cNX6oi8/08dKOsv2kX
	7HIXS8l0Yy+chuhwEDp2DupFoaSraQabiwwMHdEfLUqj2U5Wqnd6f8E5HaFdzoY=
X-Google-Smtp-Source: AGHT+IE42c0seALeOh+2gs1b9+cDdqN3mXUMARJ3OS5BGs7AZ4P3CT42xbA969owZpOiLEZctIoZ1Q==
X-Received: by 2002:a05:6512:3da4:b0:52c:c5c4:43d2 with SMTP id 2adb3069b0e04-52e826fb074mr3682510e87.47.1719826216731;
        Mon, 01 Jul 2024 02:30:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4257c4e10d6sm71354895e9.30.2024.07.01.02.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 02:30:16 -0700 (PDT)
Message-ID: <d391c877-3e30-4a97-810e-241468901ff6@linaro.org>
Date: Mon, 1 Jul 2024 11:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] dt-bindings: media: ti,j721e-csi2rx-shim:
 Support 32 dma chans
To: Jai Luthra <j-luthra@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath
 <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-2-6ae96c54c1c3@ti.com>
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
In-Reply-To: <20240627-multistream-v2-2-6ae96c54c1c3@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 15:09, Jai Luthra wrote:
> The CSI2RX SHIM IP can support a maximum of 32x DMA channels.
> 
> These can be used to split incoming "streams" of data on the CSI-RX
> port, distinguished by MIPI Virtual Channel (or Data Type), into
> different locations in memory (/dev/videoX nodes).
> 
> Actual number of DMA channels reserved is different for each SoC
> integrating this IP, but a maximum of 32x channels are always available
> in this IP's register space, so set minimum as 1 and maximum as 32.
> 
> Link: https://www.ti.com/lit/pdf/spruiv7
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../bindings/media/ti,j721e-csi2rx-shim.yaml       | 39 ++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> index f762fdc05e4d..0e00533c7b68 100644
> --- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> +++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> @@ -20,11 +20,44 @@ properties:
>      const: ti,j721e-csi2rx-shim
>  
>    dmas:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 32
>  
>    dma-names:
> +    minItems: 1
>      items:
>        - const: rx0

So all variants now get total random number of DMAs? I don't understand
why this is not constrained.

Best regards,
Krzysztof


