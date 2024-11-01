Return-Path: <linux-media+bounces-20703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B909B95FA
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 17:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA1AA1C211A2
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 16:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15E71C9ECC;
	Fri,  1 Nov 2024 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygvqZm65"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037E1CACC8
	for <linux-media@vger.kernel.org>; Fri,  1 Nov 2024 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480218; cv=none; b=jYvkyoNtKWp5F3W8B+Sq7d2ZbaMkG101xDV38qqPfjckoBLqFSL+0KP+D2kJz0WYOqF/mbTvhFqlYLMeJRVd3Tyn47zjMjlzx5H9RPdgBz3hK095TRhIYdrRBw94oCY+3MSypwbmSmxkW7jr9M4nBEa/tm8NRprw61hq3l/RrlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480218; c=relaxed/simple;
	bh=Hh3ePTY5eOcO+ABQ/OXH98joFD3cozVtNgiDQKTCotU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szzd+7Y70LVeBKsR0uMAZKQxbPHe3qKq2HOQEVj87/rNIxNfmDkemc0ROYQrDFMoezwvztzUj5fdrY3RRVUapT9GCPkEMgTgs4VdtA98q95m/hqYMUdxKBbyHI+MWfq1UrhV8Yy8rZJFDdeGksmOO1qK/uhsyGPxq1fmV9sUxf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygvqZm65; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so23212865e9.2
        for <linux-media@vger.kernel.org>; Fri, 01 Nov 2024 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730480214; x=1731085014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFhDCeB3natVan6jLDOhEB/ZUWcslmFFkqQfAi6PeEk=;
        b=ygvqZm65v0KtwPny7+Mpu2ue3htDY+ZHtttD5TqNMSxd7mXSMOwDmjMKvY1f+wPqAM
         QlxI+tDYY9cWehfATHzSNLoIWQSmNMABanjQZzflY/qsl9CHwu3XL56VBjbTWoowpJPC
         GDU5JVHNKyP5oZvbNCXfncxbZ0jdPh4LqazLM+k+xqjIcPC0qhXdI0fYf9Li14NVpocp
         KXqWDMSqASVDXSEZC9Eyn4IhFN6oHZV5/JJ9QjPH7p3uYz1oxPVb4tHpWVD5AG7Bi7x5
         Lv4ziyfj5VSO0pvqWRqT5TU6wY0wHIiHndLK6XFCS+xt1yFpuYv0mkKVi7l+1PYyf5oK
         ph4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730480214; x=1731085014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFhDCeB3natVan6jLDOhEB/ZUWcslmFFkqQfAi6PeEk=;
        b=rW9/MwQwdUGys94QeLaZt1t5rmWUFkaNYljx3Oy/ecVFLAQEfxWyJTQtVSYpc0f8b1
         azTZiud6Ui4dDGKfNC7eWlFaY2UM7pSNjxMjQ9AlBegkVu/K9yJnLC+qkA8BiLHk2mzk
         8yokCK4CPHcpHMJyLeSQTXbydhCJ/y272AHHDktCPfNypD8V4AcG6+Q+qafcXwhQQ2l2
         XaFKb00tu1kRAqMXiN+cEhS8GpV/gALljZFhvnoTXnLX2ZlIsea0g32iA/ig4TV1lmCf
         yQXnIgpHD86f+bNAGjXGIUaSkAruybrcpv34XjJWlTGxvo2L9KCAE/kZ36hUJvnzqYfL
         43cA==
X-Gm-Message-State: AOJu0Yxwk39rBi4Z+mKtYX/HskHVcEtzkCGpe5j6dtnBKegEtHSC9LSW
	xLbwyrP0Wvg3oyh3M451l++H+DbXg4D8OsBeXQMihOLtU5oVd17l5KTZnQomLrk=
X-Google-Smtp-Source: AGHT+IGodZAjfXp4tUmW6YwVSDdFFc+bf9aUskO6cp3Cw2yMrR8Copf5ovge8NjE8dTSGJzo/GiB7Q==
X-Received: by 2002:a05:600c:444d:b0:42f:75e0:780e with SMTP id 5b1f17b1804b1-4328324ad00mr38414295e9.10.1730480213676;
        Fri, 01 Nov 2024 09:56:53 -0700 (PDT)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca6f8sm97929315e9.39.2024.11.01.09.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 09:56:53 -0700 (PDT)
Message-ID: <9bd7753d-0f59-4ef9-ba58-93c6f6c23f5e@linaro.org>
Date: Fri, 1 Nov 2024 16:56:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: dt-bindings: media: camss: Add
 qcom,msm8953-camss binding
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241101-camss-msm8953-v1-0-4012559fcbc2@mainlining.org>
 <20241101-camss-msm8953-v1-2-4012559fcbc2@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241101-camss-msm8953-v1-2-4012559fcbc2@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/11/2024 13:47, Barnabás Czémán wrote:
> Add bindings for qcom,msm8953-camss in order to support the camera
> subsystem for MSM8953/SDM450/SDM632.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>   .../bindings/media/qcom,msm8953-camss.yaml         | 320 +++++++++++++++++++++
>   1 file changed, 320 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..39b9c58e2a2ea2e1ad434aa35bf6ee128d3a0649
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> @@ -0,0 +1,320 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8953-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CAMSS ISP
> +
> +maintainers:
> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8953-camss
> +
> +  clocks:
> +    minItems: 30
> +    maxItems: 30
> +
> +  clock-names:
> +    items:
> +      - const: top_ahb
> +      - const: ispif_ahb
> +      - const: micro_ahb
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: csiphy2_timer
> +      - const: csi0_ahb
> +      - const: csi0
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1_ahb
> +      - const: csi1
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2_ahb
> +      - const: csi2
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: ahb
> +      - const: vfe0
> +      - const: csi_vfe0
> +      - const: vfe0_ahb
> +      - const: vfe0_axi
> +      - const: vfe1
> +      - const: csi_vfe1
> +      - const: vfe1_ahb
> +      - const: vfe1_axi

These should be sorted alphanumerically, take sm8250-camss.yaml as the 
reference.

> +
> +  interrupts:
> +    minItems: 9
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE0 GDSC - Video Front End, Global Distributed Switch Controller.
> +      - description: VFE1 GDSC - Video Front End, Global Distributed Switch Controller.
> +

Please name your power-domains.

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description:
> +                  An array of physical data lanes indexes.
> +                  Position of an entry determines the logical
> +                  lane number, while the value of an entry
> +                  indicates physical lane index. Lane swapping
> +                  is supported. Physical lane indexes;
> +                  0, 2, 3, 4.
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +
> +  reg:
> +    minItems: 13
> +    maxItems: 13
> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: csiphy2
> +      - const: csiphy2_clk_mux
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: ispif
> +      - const: csi_clk_mux
> +      - const: vfe0
> +      - const: vfe1

Please sort these alphanumerically too.

> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interrupt-names
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - reg
> +  - reg-names
> +  - vdda-supply

These are out of order, please see:

Documentation/devicetree/bindings/dts-coding-style.rst

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8953.h>
> +
> +    camss: camss@1b00000 {
> +
> +      compatible = "qcom,msm8953-camss";
> +
> +      clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +        <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,

Your example indentation is broken, likely copy/paste from your dtsi 
without updating for characters instead of tabs.

---
bod

