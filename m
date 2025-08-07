Return-Path: <linux-media+bounces-39029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBADB1D639
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F4AD7A274D
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194E2277CA1;
	Thu,  7 Aug 2025 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vW1v+HzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480C27056D
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564379; cv=none; b=eCJkGV1pODjuaJd8yVCyUc8gUUO8I11tcpsCNMbUcWj3GcC80TWwzUsKqvWRjbglf9TVyxxHTiGsCHcmb3tFOD22iSII1TRjzIvQr6SGjr8Diq3oXkXMc+g4LhP/r1l/MvtUrMj/XGxnTsfkx9Fpg5b70BKOyVmu4T3WjSSDnHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564379; c=relaxed/simple;
	bh=jLynvhAoC3nMY9EsoCJigpriu26a00wtOvd+f8xTNeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oB49/CSWUOBkKz0p5gObPOqIAENYcx9UfIChBHSynd6kO4xF435Ky0+g4ZADRtp7Qv7WaumnyIVf1r5MP74r9ox0TflsntBfYVP/YeRmXHGPaegTB3r1tzyFWYfRZWqblHTVK8fUybVnwiyvfYOcS7mK5KQZrha5VJBcm9022BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vW1v+HzZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61524e22159so90461a12.3
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754564376; x=1755169176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IvMfOW0K5+CfylFuc8dQRU5yL7iRaqNXhwYAoS6QuGs=;
        b=vW1v+HzZfkwvBSOdaGeGKJneq06W8Dg1fwVxM9sBQS0iD1kz0iJ1yr76p7x6fJWcde
         znb6wKCQp3qRZI2Xy32e3JmPePZL5IjKPtkzBPcmJk/tULZlN32DzcasZ6qQ2a1qCy0+
         Lqwh0CEMwAIBqnxo6uDdPh5REPGySexNmPjQ2edtBcoRJFqGsbproJxxQ53r9oIhG9kp
         STe31kkkQE/djrfvvvhUvR7DDYz1VL/YaM18ZUmoCYgToWiAR9WDX59IFofGtUVcL6ag
         Uqw+QNHljRs8n7dcxGcAZ1KDRSAthaFPdyCiNetoYk65u63hLPHhb5P5VUFuCd8sjSWB
         Advw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754564376; x=1755169176;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvMfOW0K5+CfylFuc8dQRU5yL7iRaqNXhwYAoS6QuGs=;
        b=jV4E7oTUkfBw4tgH9wnnRktHSXbBqGLxBWZ5x1spPol8DR+RsnGTDwq5ZckSDgxjz8
         AxDklIkGeIc0rdvCtRiVUCX5gwPeQx8HsWjGukRCIg9Vc4mfSLSFfMOxb5zcG6y3BV13
         kEish3QGjUqT/qAVw9vbnn4KpJzuo+CYf5J0Up9hIPw1sVRnbJ25rbvLFk+3fmHkPKM7
         gMw0hMnnyQQthpYkV5Qy5uBA/bVyOdPJfeLw4rrhzHRESKTA03NObO3YjgstKLhwEyF5
         lXPikabD+K8ti6L/AbItmXzwmnSoANwms4GcdBNZiXJQ/5enLqhdrSnKji/Ji2WjGvRk
         F+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLtvR/OP8bj4DFL1E8z7CHp7dg6wqiwwgFjCbDCW1bRrNZBLa7dUqPIBpxCqVqs2whFjyAn86aM0Eg+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5PP29kmxz5Au3KENyOb7LKqHDcuzaL83Axjv92oJMIdFMxvv
	YMXK34bamB92nQQEyWy/PpsIBTuoUxzo/d+/QCDpqKq8fY5RGmzmTV09HbmAPBVohUQ=
X-Gm-Gg: ASbGncsizOpeQ/Whmae9ljkWmM2VGrVrXLo+Et1Rvlb3djmjkG5OycHVKFJmjoFyJDK
	vbtYLPx4gJAjA4fv2RDP1d1GapSO5v0GkhiKHtfCxmL/tdoHc6rzhqMGAJ3Yr3Sg1ieE9Clq0aa
	xCk71Ypw5ihP68oeJercoLW+DBJVg36gEwW034nRFZ1K99i5u6qnxswWkrhgl9bTSuXzyZPCfEr
	j1qR4A62Zk5r3zS9ZpGlquFrym9pmRlxLG6DHwEvr221/FWuuiKnHIltI18RWt+QLov3G3GbzLx
	0fjx/fumUDv83B8xavqsZoDF1EiWG/M5rlWplSJfKtJVbEF4OLhnqFAKtrOTAVDtY9K62lqD6eN
	/DCn3fIOWRHJUvtBvo6jYpovf35VpwzcysWFQz9T9Nfg=
X-Google-Smtp-Source: AGHT+IEvJ6td6iNd7e94Kkjtwe3tYixKx3u6KXJTp/O1bo37Zy/totEk9IAx2HyLhWP8NfTXAJGFxA==
X-Received: by 2002:a05:6402:40cf:b0:612:b3fd:4b35 with SMTP id 4fb4d7f45d1cf-6179619204amr2008731a12.6.1754564375986;
        Thu, 07 Aug 2025 03:59:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe79a0sm11627165a12.39.2025.08.07.03.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 03:59:34 -0700 (PDT)
Message-ID: <419c8b19-da07-4972-892c-9f8a55a546c5@linaro.org>
Date: Thu, 7 Aug 2025 12:59:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] ARM: dts: samsung: exynos4: Use SoC-specific
 compatible string for MFC
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
 andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
 anindya.sg@samsung.com
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
 <CGME20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80@epcas5p4.samsung.com>
 <20250807032449.92770-3-aakarsh.jain@samsung.com>
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
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
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
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250807032449.92770-3-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2025 05:24, Aakarsh Jain wrote:
> Modify the MFC device tree node to use a SoC-specific
> compatible string instead of a generic one.

Why?

> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  arch/arm/boot/dts/samsung/exynos4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
> index ed47d0ce04e1..a2f15fbe98cb 100644
> --- a/arch/arm/boot/dts/samsung/exynos4.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
> @@ -435,7 +435,7 @@ i2s2: i2s@13970000 {
>  		};
>  
>  		mfc: codec@13400000 {
> -			compatible = "samsung,mfc-v5";
> +			compatible = "samsung,exynos4-mfc";

There are so many things wrong here...

1. This breaks all users
2. Not a correct compatible - there is no exynos4 (see writing bindings)
3. Commit msg does not explain why breaking users is reasonable


Best regards,
Krzysztof

