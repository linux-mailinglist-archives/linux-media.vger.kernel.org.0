Return-Path: <linux-media+bounces-36017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1612CAEA11F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4E4618880B3
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AC32EB5D8;
	Thu, 26 Jun 2025 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g2hDXUb4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AF2EB5D4
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948857; cv=none; b=Il8nE9ITGycvuiN1EXMSX1XsPUbbCxVfJvC4ARY3nZ4fvrWZRJaJP6T/AoY0sK4Rlxd8kNxTKteKBokKCT9pf2OhW9s0Ux9Aqpe4Z+NjcoJfECWsAcnzrEanKcYjkmohRPl3RdTAnN79uTgzyZEYKu/OOdJsKlSzy9qaW3W4NpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948857; c=relaxed/simple;
	bh=8O3gt7jx+aGh1tZT01SJ9L2g6Jsx6u6+UXl+1sLn5b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPCuWQzJWkxYTKlz0cUwDycSj5EqZrkY2LZeyvDfzTU5m30egWQlmqfcgG7UdNgiPxg8NmTic0HZaa2XYnLm5FGCSzc3UkIJY+XmSzHCrKR80VH252MOxcvB7seJqFgRtTjJ/ff0ebYRNcK4QLMkzQo11M7DvjM77Mz3wNuZ550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g2hDXUb4; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-45310223677so6596535e9.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750948854; x=1751553654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wy/zTlmBvKUKunUHtc1dVVfJLd3o8GbdKsSB+SxoJFU=;
        b=g2hDXUb4QacfOpPn+MT5V3QfAjYn04J5eDTmhK3HRBPEex51PLUAqS0PDpyqvAsBpk
         54ljAhx3ScqUk5DqY06V1XsHqv3rtMhdft7wQltxMB6rcB/zoqBKB+R6LCayhqI7KJsf
         t1efI39GDUbHCswPdRfQV/nh08eo3mbEdFRzmTu6+ysQ0reZwxs6Ne5nUvnUIu2zpynF
         TM0X+WTy6ZfUs6o/99FwLIMA/v9ilXJoYULUFCznm9+5U8t2Un6IkPH2tjVjcC1GsjfV
         WZYvV/nZnPIQLEoGiLozOEydTHMOV8eRETF9BqoyvWMTfUGQNKVvebncqP4ERuxh7GsW
         V7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948854; x=1751553654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wy/zTlmBvKUKunUHtc1dVVfJLd3o8GbdKsSB+SxoJFU=;
        b=w4TY7Bod0Feh4aV8gPmuBFAwMEULiklmFp9wFxYKlV6xs+RBjFy7cGSAywMx+tPQaF
         jYKz2XnZV9zxJ4uD1gU+kqX4kiIsEXXduomKFc7iajwkvCE0OpwH5SPbyMQ/FCkYm8U1
         FmdLT0j4BdAKUxJJLkzgMwmLOOp/Xmuw4F3EWarUMY7hEwyycC6lFIcLSrG3O4ycwBwn
         4CaD8sNRC0Je4Uyd9z2MCvWWJWqbkDLWc/kDds7BVDrO0x6jUY85040vnvmknCNO+xsa
         zT5kumnUY2vRm25Pvm4xBPlL1HT5oGEjRSG+70OsW51dRihjsVJwqXCVEggqgtlRAvJA
         YA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMLIZuaQA9dssU9+svOmgBq9bLrhJAgaa+vPaJ20nfkSgCaIXfWu2DUNLTV/1zF8tEcIOFUDkwdWiFCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrdq2fKeejNN6QYvjTyc9f9tCrpBMgQ5cnKza8aAzw0NhnnPGL
	eh1K/RahnaQeKA06xl6bGNmkXCLMHB4sxVESLQTvcFv3CWcO6yIKo47cfc9GC6agpUg=
X-Gm-Gg: ASbGncvT5uOZerb6VfXs9pjpbvHuOmmWXqeLGngH5de3xQe9RBPpeCNkJWnmBgUPMVs
	9O3myMG1IPYLSt0eN9JY8FHb4nuki5bnUfhd0HYID0wj1sbnThlsBMdzTH8Mr+qn5p9TxJ49xvV
	xajjfwZ8YUtU4nD5ms2FH4TqVhrrTj9hlVqz4CXvj2yhEP4Z+UMbZ/9PzuRViXyZWADqBUkMXhp
	rxJ3UNnmLi2zxDJaGdo0eGo7s7Lm1drUD16p+URn+CUXgcUQ8i+UVSZzveQwbw2hgPCevzapdpl
	1So0N+OK2WjKqgAsmoziD/kDv7qlPD9D5X8JK8oB+LYMvBV9GTbiWAw0rtDTn+0n8ONVZulpfJ7
	xNvnzKVvl1adY8bfonwBhgFQIPEU=
X-Google-Smtp-Source: AGHT+IFJsf8jt4eAr1bTr8MT4go/FTU7WrRQVFp9b4j12cJ2ErH5LEoba2mg/H/VfQkHwRZCUZYOLw==
X-Received: by 2002:a05:600c:5014:b0:442:ccfa:fa with SMTP id 5b1f17b1804b1-45381aeb284mr63726245e9.27.1750948853943;
        Thu, 26 Jun 2025 07:40:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453883d81besm32042595e9.38.2025.06.26.07.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:40:53 -0700 (PDT)
Message-ID: <fd6914ca-5431-4c82-925b-7dab3f0d026a@linaro.org>
Date: Thu, 26 Jun 2025 15:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 14:59, Jorge Ramirez-Ortiz wrote:
> Add a schema for the venus video encoder/decoder on the qcm2290.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>   1 file changed, 127 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> new file mode 100644
> index 000000000000..a9f89b545334
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +
> +description:
> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-venus
> +
> +  power-domains:
> +    maxItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: cx
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: throttle
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 5
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: video-mem
> +      - const: cpu-cfg
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - iommus
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    venus: video-codec@5a00000 {
> +        compatible = "qcom,qcm2290-venus";
> +        reg = <0x5a00000 0xf0000>;
> +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        power-domains = <&gcc GCC_VENUS_GDSC>,
> +                        <&gcc GCC_VCODEC0_GDSC>,
> +                        <&rpmpd QCM2290_VDDCX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "cx";
> +        operating-points-v2 = <&venus_opp_table>;
> +
> +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +                 <&gcc GCC_VIDEO_AHB_CLK>,
> +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> +        clock-names = "core",
> +                       "iface",
> +                       "bus",
> +                       "throttle",
> +                       "vcodec0_core",
> +                       "vcodec0_bus";
> +
> +        memory-region = <&pil_video_mem>;
> +        iommus = <&apps_smmu 0x860 0x0>,
> +                 <&apps_smmu 0x880 0x0>,
> +                 <&apps_smmu 0x861 0x04>,
> +                 <&apps_smmu 0x863 0x0>,
> +                 <&apps_smmu 0x804 0xE0>;
> +
> +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> +        interconnect-names = "video-mem",
> +                             "cpu-cfg";
> +
> +        venus_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-133000000 {
> +                opp-hz = /bits/ 64 <133000000>;
> +                required-opps = <&rpmpd_opp_low_svs>;
> +            };
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmpd_opp_svs>;
> +            };
> +        };
> +    };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

