Return-Path: <linux-media+bounces-27983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F527A5A650
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 22:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2C723ABDE5
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 21:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426AF1E3DC9;
	Mon, 10 Mar 2025 21:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHXsfkyz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F031E1C22
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741642539; cv=none; b=GWL45xwP/z/zWkZz4qmsESjTN5miJfDyzuZnOIzZ9Y+Hr91EjpZ901+EMxPr5qwvx+Yg8xeD5lMvNyurVOEZ6CZTYYOGPhyxiiLS/Noy3HlWingSk3KrwuV6Y8R5Mqc/3jHXRUqdRgSpA781y1c1eksgTP4HfnxTlQqvUoEgH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741642539; c=relaxed/simple;
	bh=yOO+kcznc9jGj+Su8RqYwWEA8F6gmuzqRQmyUr/FcyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky2dOELK7NEcwnY4UOS00/V+dnjEOlNjuBYAzXWcX9RmBRc2zt9nP0N97pEU20uXgp0vqI83pBkNGmtttEFzB8SVTVNymaBxPinLbo3+zlkCbHQaYAqY5/IpI5yibjrVikYL3hu3MAk+5sNGctCJoqPNK6K5pCFkPj8Gao6FeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHXsfkyz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5494fe13a6eso700458e87.0
        for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741642536; x=1742247336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5nGNIjoZJal1by6jAmqJfEMBdj6g2CPD4ZYPpb59g0=;
        b=lHXsfkyzZMHhhFuKdlZ6wP9rupu1JIYKBC0xy+xgjfuoqoctUzu6KswF6VJMgJc80S
         Qkk4lPXZotV8DR7xv2Utsig4m14df16mbYh/v0oDIHYIOaC6i7wzGolY5VRFTjf3gGDU
         I7Rzgh3HGB0kFPvGR/YtMQvzyC3Y7YWODcvsFpiL9lbyBBLfy5ATQWTjz0FfxHmnM2Ph
         bHG1kxqy7OJNOhLRAdAUVF7b7yXNvZJBrxqI/ca3Oxmfx/xx1X5UZdWc6eHw6TAUcZE8
         +BtSvvYU6uR0KJD7qN+K8dj5mMrVHnGzsL1a8Oa7JLDNIY/fEfNW2CFuQIZ6xk3R3VSy
         7aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741642536; x=1742247336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5nGNIjoZJal1by6jAmqJfEMBdj6g2CPD4ZYPpb59g0=;
        b=V4lo0HcvOwlJrJmWCHxkxiYWXaOrqD11ClopNtQ6nqxcplS1EaGha9/jLL/jygUzok
         JLmoGlsyMyyfq8tru61O8+xAvXf56xxpji7FM6IkxN8p6ptl351Di/fskLbwTjt3i/hc
         PdpBL92XNk5PQ2sjkRmKhjRyARosJ6OdnASPqCI6Mis+IDgWQ5mKwJjwdI2Ej+aMpIP2
         lHumHHtp00lIZ9RZ5eFHSiWLt3SUEU2d62yoToFM1+dRNRmg9UmzGrRvaaGXtXNn9xGc
         uXag/FD1Yua3skiRnXrmuwmbbisZuH52YPKtLZLHivggJjnTL+wFHlWIqwas4dtqKH9M
         +nzA==
X-Forwarded-Encrypted: i=1; AJvYcCVZQVMIo0ratfE9h0uUDKR0OWgWGmLLQEJtvZMo1N1HIOrIuvDK7XEkq8SYww8G2jGpAokYpnKjaJGjZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynrV87OSXJtiFZtGlb36b+2Q2YHpIEhDu9QdFMPh6fHGhUQh+I
	XxnO2Y9bN3D0Lg5x8w1/c/0EESrYUOeETqGbshs2SZQUyNl6Q/tU4cCwodNhRsQ=
X-Gm-Gg: ASbGncvPxlC8zUtdtSQMgrxi+v43KGKHDHhVCohMntXY0hhWm7Vb8oXsjbkLdMBB9H9
	8msi5D19DjetOYXWAj5TGU3CM2qRiqQiOWg2zXO6M2tSJ1BBCeDOWav3zxqRacmsIsRgt5MilEs
	5crnSTda3nTukGl9v6vEuDNijsQ5kh9NEPqC/cZFls3k/sA/1kVP6OFIsJ4nmNy0Z/hE4kpmNFW
	g67G6PttSwFFeamC6ZK4MXDfPZBWTwNHiH0n1T5Y5lWQzxGpGEM4w6cgXjCkgv42bKaeh4jtj0S
	o0txn8ok6XuZNrLGTbONvf38y3OYIMS8mSkUwGTFCCEgfoAjYnFU8n6i6xCVCJVkyW8qac4xrME
	JhpuQzc6DrMziO6oBiPXmjFE=
X-Google-Smtp-Source: AGHT+IF3UbdFVNzHKttXVepOd/BWp8z+1ePpZ96mJNjgJzTuGPbY+EoLScTTvRSPkloK2EvbHVRnsQ==
X-Received: by 2002:a05:6512:3b9a:b0:545:8a1:536d with SMTP id 2adb3069b0e04-549abaadbfbmr140818e87.2.1741642535438;
        Mon, 10 Mar 2025 14:35:35 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bc679sm1569216e87.194.2025.03.10.14.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 14:35:34 -0700 (PDT)
Message-ID: <7928a52a-ff6f-4705-a55c-8b60fd7797bc@linaro.org>
Date: Mon, 10 Mar 2025 23:35:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
>   1 file changed, 367 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> new file mode 100644
> index 0000000000000..88eeac262f0e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -0,0 +1,367 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,x1e80100-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |

Please drop '|' here.

> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +

<snip>

> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_mnoc
> +      - const: cam_sf_mnoc
> +      - const: cam_sf_icp_mnoc

Once Krzysztof objected to the "cam_" prefix in the interconnect names,
and it's a pretty reasonable comment, and also it's been applied for
sc7280-camss and sm8550-camss:

https://lore.kernel.org/all/087e7f29-1fa8-4bc2-bb3d-acb941432381@kernel.org/

<snip>

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false

It's a smart enumeration, nice to see it.

After minor updates done,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

