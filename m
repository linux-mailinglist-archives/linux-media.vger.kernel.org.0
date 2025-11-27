Return-Path: <linux-media+bounces-47809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1A8C8D9D9
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 10:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C48F3A86EB
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 09:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0C5329E6B;
	Thu, 27 Nov 2025 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsh/ow1q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39694329E71
	for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236702; cv=none; b=k+2pil4iXZGQtRzMIfQK4x5ov2Y0daAQzVmi9ZWrhR1RevtlLqpEv5uAycfkiCPu/50rPEGJxUiBYvO5oSucwEN1J1H9IgcKn8EqvsoPZhQjqGcXXytHJB8mNUVGVFUeLgPnODVdv7+PJ2pTUUaPe6Xf3fx6mNPRjDmbd5HpqUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236702; c=relaxed/simple;
	bh=8XhADblrsw7crDzwA4YYBlsruSjUl3pdlJRhOO76TFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTYDYEHekzFrJMKXn9Z2I2Cu30/ih0xgw/Y1gBJCgUs8dvbXoyqhNCtu0BEnsYbPMlh8HX/ieiV6sSMppxnIuiFZSK/F4MK7+1zpctZ+LvWpYeZevAekBMBt/u2UTK4F7yNK94W9uUUOHj2/U+jwOzk+sW+oiUd4nx32lj5wBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsh/ow1q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso3071645e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Nov 2025 01:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764236698; x=1764841498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUyjSzf+6qkKbRlbXTsyYQMvsZwUMyzkw7vuF4dlBN8=;
        b=xsh/ow1qwYSJWHi5hQsmJv6QOKd4U/XBAmjrNyesJXCKV61PKmbYFnIbHxaczS57aA
         9Kw+sh593UWvqoHWOO79nNYB5m85I2p8p8JH93OzPfksMmY7tj3qDh2/F+HuuKYypR42
         PWmJpEw4PLCg/s9vJ9syguhGHbA8Uh34KH4fj73ANKfHKilsYel2b/xUTywfW6luzhOF
         E744STY4RsJjGUtypKkkEJRYTXHlYJoGdwEH9yOq5LcnYxgQWFy6hCSH9ra1jCUhZelr
         iwufsO5yogq9L4rDVLNrqt1vdOv43r31NnD8XD0ylz2//Klz8IeLsVR6UMIUGF+B/ArF
         5r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236699; x=1764841499;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUyjSzf+6qkKbRlbXTsyYQMvsZwUMyzkw7vuF4dlBN8=;
        b=FD8QXxnSDp2y8yH4Cj9Bjlmb32KItbueU6nCmucQqUIBoeCBXVjq9Ws/ua2hhH70Gd
         9mR+KtsN14k+jKzNj/OeW8Qrry5ZsT3Ur+pAmv4jxS5RgnvjDW6oGahTOhjiTFQPxhr8
         EPBy/t6hAxpiDv8mHzX5WrRitoVeaMor/mKWFFOVk8w3zKO+plZAPqwSztgPfnVnC6g9
         q6zKDR8FKZQI1jn1zxQmZmpGlqM3Txnv/T9oNEsrWLNkwOyZVeKdrzLWaerBaS5a10ZW
         6mCWlwyMXcFhGeEWE27poW/TEKph4lBbW97tLJDFLZLGbIvTcNBx89hyOnN+vfcLLs0S
         08iA==
X-Forwarded-Encrypted: i=1; AJvYcCVLguWebzzd1cNiwu4o1/gh0ExgWLPn73fEmMC9hmn3j3LDIqBh92VxdrykDBC0cEy9PkPbzSuDzaSJGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3PSsvYeKVCNktgXBgwfv40DyLlWCpUqoNGGkTC3wo49mU4cS
	MPGEP3FsbeiyZmeQI3eSLU4ZO+FdfGoc78HiRXkZ0XYffbgNGSvqAFx7/vsZCBmgHUaraSo+fbt
	J6Q/ESgM=
X-Gm-Gg: ASbGncukah2hAmY0rmSpHQ9CGz2cMhrQMWVWqdJCeJrILQzMRBrDB1Fmudo3xz771PK
	wk1Hm/Yrat4lF9oz4l3n4jTi+sGgWyL3Xr44qxJtBI+sEOW6/bQ2lISZOXwW2VM7GZDlmEthJUc
	tiKyEUOn9KtwZkXjaaJRa/y/ZD3fqmdCKhu+mZelmG4k8AMwH47RiwEhqFJSRjBoguwHNhBnys/
	f5rT8iYaTbVBTJkqC1w2zcVFBuh2XUuIUv4pSwWQVuWfKQiX71UPA2uJVXFgWh2I+7UwjvUNEAi
	mJXRhBokDul0YJtwaloXGKQxVc0hWrLuKjmYDGwsFjMcTTa+ZtoC+et8SpQq18OcD7nFyvtsG+8
	7bGiu/ErY7XwbmhKFQ8xq+tabyuBdZjqm01N6Z3+KpVyEalp/RLJ4gdSsJQDqV4fxoeyTcG8niq
	QbUuCGdJzzmZVc6qT6UW4SwRyj3Zm6g98FhyvY6P4wny5fY6PXU1zm
X-Google-Smtp-Source: AGHT+IEPdwKsbg3Zp0AsKlru/Ylx+PdP+Q8dS3H5IQzMopRv9eF2iSzXCwIE5M8ELtc1p21MvXd50w==
X-Received: by 2002:a05:600c:c490:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-477c10c8596mr213198165e9.1.1764236698497;
        Thu, 27 Nov 2025 01:44:58 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm3238104f8f.2.2025.11.27.01.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:44:57 -0800 (PST)
Message-ID: <c5b629b8-2bee-4027-9205-6e7f74cda133@linaro.org>
Date: Thu, 27 Nov 2025 09:44:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document SM8750
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 09:38, Hangxiang Ma wrote:
> Add SM8750 compatible consistent with CAMSS CCI interfaces.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 33852a5ffca8..a3fe1eea6aec 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -38,6 +38,7 @@ properties:
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
>                 - qcom,sm8650-cci
> +              - qcom,sm8750-cci
>                 - qcom,x1e80100-cci
>             - const: qcom,msm8996-cci # CCI v2
>   
> @@ -132,6 +133,7 @@ allOf:
>               enum:
>                 - qcom,kaanapali-cci
>                 - qcom,qcm2290-cci
> +              - qcom,sm8750-cci
>       then:
>         properties:
>           clocks:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

