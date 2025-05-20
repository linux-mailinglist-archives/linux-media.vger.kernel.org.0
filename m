Return-Path: <linux-media+bounces-32858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E652BABCEF8
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A4A1B628DB
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 06:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F312571B9;
	Tue, 20 May 2025 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMfinU2X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605272571AE
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 06:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747721188; cv=none; b=ntGUcZM7sASoxIeRXZt4Ffo/5NMCVu0GlWrQNQFMgaJ7ALgYWMV1EIpZHBTxU+l38oFDqapya2LSRsxtF6TwetNBw+RID1vVX+LpEWq4eJwnMWIenoDwNenpnjmVkmEx1X5rKTo/hupjpJkpvxAlsHX62D7i+8odJrO8Sh5SuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747721188; c=relaxed/simple;
	bh=qe8n9yr/KVnjJYZeRg6hmqa/SikELRxG8dHd3eSVhZI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jcsi8k3tU66AgiTADhKIx20z0+dDB1+Eq/VMaz0pOGwsBJZb19vu+lW4NZp7qNMsC8bs13Q6VRh69t47pqP40fITXVU6/d59VkNY+ZzpyYVlewR5fylp5IR+Y8SPH7EdiM5SUe8A0e4kZHzisUGN8tm5MNfqitZ612IMcdPbYGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMfinU2X; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601d91f36feso366926a12.3
        for <linux-media@vger.kernel.org>; Mon, 19 May 2025 23:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747721184; x=1748325984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H03K4o3BUXm9W7hTlzbRFAT1v6NSvYBisQhPrDY8gOQ=;
        b=PMfinU2XOcRhTnsg1kTQyHyfpT0VAq2vtPeNV5eqqOo4XvWjS2YQDGRNvKVDkhxbDa
         /QtKTpuwQ/6fVVcqM8zl84hDsGTnpOkitMr7V05zGW60lYtMvXjP45ZzgdCSLfCFkx6Y
         TF62tH6RuFr2zG18c8sRfFaM+lqfhCk3O5zSQOS7aSRTya6ESRE5+47h9TGDeCzNxGKL
         IKIToR8MDttgCVgOIvONXTYarVq+w2vwZXLqQL6IjuAPATq7Nzaq2NoseDFzINU2/DzY
         7aZsglS9FU0G8zMmh39dz4OtYvfw46RR9YMIIIUwijEOYQcmVS9skZ0XzfE7/YOHp+OX
         Wtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747721185; x=1748325985;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H03K4o3BUXm9W7hTlzbRFAT1v6NSvYBisQhPrDY8gOQ=;
        b=bSeSw/6D/GtYP8jBWtOhDT+QhUdcYLreWOzbITmz0XgYDoFMd9r8VE/QAx2WmV9y92
         BEzYVYLR3cAYrAbxWXzUg2JaUqcphcbk5eBZPCUMMpCD0yIfeEA4sxVuJzvtKxepJZNb
         yy9P93BP2HyaU4fHsNxO26etz3MhZlQ+bQ+ZTgREXerswGLxxW+wMLfwlkylodgGQLAk
         pjl77KFSxNyOXbiAzxaBDzpM5GIpTbn8dfn/Nv5sD8QxpuAINJRvpp0oVbK9w1Z6S00Z
         fv4HcFlZZDXr0njPYSzignXkQ44Ri65t9EOPRBeZq1l6rvBoz5rAOeeFsLpleIE8tGrW
         UUzA==
X-Forwarded-Encrypted: i=1; AJvYcCXN7hvXBYFXEe57UOvaFh5/BKXTQzCg8RI28waAqeZ/JbWhAA/8AElbXhulXWSucCDbZlU5h+ltriVHzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxILIoE5/qiWQDfPcDlJ15NYorM6G6a5+lFatn31iP4oQJXoAFz
	CbmmA9CrvInC2BnhGFsTe6JVxtEFYco0BZ+xMJqAgfvCtLuqALzrXAiZx33dSG8M4eI=
X-Gm-Gg: ASbGncspMfUR67KNGaom88bjp6SMlSEdD38tZRF7wW3Lt7VusXcs9aJ+djRs72O0W6Y
	OabbDqrcwaF8FafSe3q67XfuYHEFj9bWJx59WIdrUoPUV2QLqpUgbXc1XHDlf9JIOSIm1DmJ0rW
	j/cBPDfju5A9WmCqGKSlTSagarV42TGFjj1udUUM/JMxx4pT4TWMEF/STOFsQI3me2LMoKrQnlw
	VGoH01sVjK6OOL8xFk3uoo8G/fAIeiPP2wst1uV8n+6C1wi2YDxWNvLQJJl+v1NG2FSJHgTtNqr
	aYJXaZwqBkhs2DezWdYBzzYSZIHUGvoj0NhWKnvuHwTklfv2tfRXCwzUU+MJExsJUJERBiZS553
	SUle+ow==
X-Google-Smtp-Source: AGHT+IErREImXkZaxZPD9c5bEjI6k02z9QlHLE+XJwiq21FXcDHZilxrUPaPqcafWlQVzP6Iz3U2jQ==
X-Received: by 2002:a05:6402:27c9:b0:602:14f8:9a29 with SMTP id 4fb4d7f45d1cf-60214f89df6mr176328a12.2.1747721184593;
        Mon, 19 May 2025 23:06:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3953esm6728582a12.73.2025.05.19.23.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 23:06:23 -0700 (PDT)
Message-ID: <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
Date: Tue, 20 May 2025 08:06:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
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
In-Reply-To: <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 10:33, Krzysztof Kozlowski wrote:
> On 30/04/2025 10:30, Bryan O'Donoghue wrote:
>> On 30/04/2025 09:19, Krzysztof Kozlowski wrote:
>>> If anyone wants to know it and cannot deduce from compatible, then add
>>> debugfs interface.
>>
>> dev_dbg(); isn't too offensive really IMO but if it really bothers you 
>> switching to debugfs would be fine.
> 
> Yes, please. Dmesg should be only contain issues or some useful
> debugging data. Probe success is not useful. It duplicates sysfs and
> tracing. Version of hardware - well, I am sure it duplicates the compatible.

To recall: kernel coding style is also clear here:
"When drivers are working properly they are quiet,"
and kernel debugging guide as well:
"In almost all cases the debug statements shouldn't be upstreamed, as a
working driver is supposed to be silent."

So I really do not get why this driver deserved exception. Nevertheless
I think we agreed that these logs can go away, thus I just sent a v2
with a bit extended commit msg.

Best regards,
Krzysztof

