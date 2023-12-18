Return-Path: <linux-media+bounces-2622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DAD817976
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 19:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2A0286CE7
	for <lists+linux-media@lfdr.de>; Mon, 18 Dec 2023 18:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2F15D75A;
	Mon, 18 Dec 2023 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y6qX55G3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9A5BF8A
	for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e270639d9so3020696e87.3
        for <linux-media@vger.kernel.org>; Mon, 18 Dec 2023 10:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702923429; x=1703528229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVcChtr4GmV1ghqK0C1H3Zam/dO8O1ORAV4aMaIixWE=;
        b=y6qX55G3I7DoJ6AAiWLKhTJIRldgHmvqJDygECJt4ems/IHjKwpBOu0qp7DZZicQfE
         yhK+0/dUFllN7gM1Q0b5WRyhi69BQiVZAW/7ePVJaimeBCwKQWQGq6gG8w2X3BRIjV0M
         nTEuQrMNspJI7h9U3PEXXksyLPxJ9dUG11nI6+bB1RpvzOyrDEajozwQ4etuFD+dr+EX
         e4iWIzmOYUxUBkOJNywZpTayhxLQk96jBpmOOh++KhfI+OFheqvRyxRTPZdlpOKLUHbQ
         oMmB30GCxjMpqg1vDI12elVemZcQdRLKl5W9rXrc8eqzn8U8aP6+5W9ddlHrOA+M5G/7
         I2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702923429; x=1703528229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVcChtr4GmV1ghqK0C1H3Zam/dO8O1ORAV4aMaIixWE=;
        b=CehTqAUg1Y1KalmZq4bkECjSHgEJNj5N4xoTg4wgR7Qz9+JpN6TZjRuQbIyeZYPEuT
         QjOTVcTqcWi6OchNmhN4muY6tXTV0aM/OF6ZCVl1Fw6wk6jEFjda0mRcypMJS2AYDIpn
         7GlesMw6ilmVLfkFOlY5rZMQ1k5BOZL9yWMnHD1irEMQBTNCbpA/mNxz3Qa6qs8sG+Qu
         Ms5mk3ROKoPBeMnyvGhBNpdt/B2w11ZDR98wjpI1d2o8N6dSfD41cuwaVT7TLlHCX1tG
         fKpOhcEzkShcAQdu/p3XA9G9Fki/GhYaqB/ETz6a2fbBvWKKQkWLL0o+3/U9kMGGhnnO
         mpHw==
X-Gm-Message-State: AOJu0Yx/60GUNCo9/I1qwCBq4Zs53Gv6HhEu1kys9kGAZbiZAR6UzXb/
	Sx6j0xeS7P3flV4f4xS1oLP8Eg==
X-Google-Smtp-Source: AGHT+IGFlr2UecUvB6IEKpUirzdTJ1xhFK/Z0+eVgcMsk4MFiqhCk5nIQ5Cgil1y4UOL2HgStlW7eA==
X-Received: by 2002:a19:5505:0:b0:50e:29c1:34 with SMTP id n5-20020a195505000000b0050e29c10034mr1593044lfe.36.1702923429133;
        Mon, 18 Dec 2023 10:17:09 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id b17-20020a056512305100b0050c001f2d79sm2976740lfb.153.2023.12.18.10.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 10:17:08 -0800 (PST)
Message-ID: <056fa2cf-777c-4278-a03d-5d818bbf1cb5@linaro.org>
Date: Mon, 18 Dec 2023 20:17:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/34] dt-bindings: media: Add sm8550 dt schema
Content-Language: en-GB
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
 bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com
References: <1702899149-21321-1-git-send-email-quic_dikshita@quicinc.com>
 <1702899149-21321-5-git-send-email-quic_dikshita@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1702899149-21321-5-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/2023 13:31, Dikshita Agarwal wrote:
> Add a schema description for the iris video encoder/decoder
> on sm8550.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   .../bindings/media/qcom,sm8550-iris.yaml           | 177 +++++++++++++++++++++
>   1 file changed, 177 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> new file mode 100644
> index 0000000..a3d9233
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -0,0 +1,177 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IRIS video encode and decode accelerators
> +
> +maintainers:
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +  - Dikshita Agarwal <quic_dikshita@quicinc.com>
> +
> +description:
> +  The Iris video processing unit is a video encode and decode accelerator
> +  present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - qcom,sm8550-iris
> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 4
> +
> +  power-domain-names:
> +    oneOf:
> +      - items: > +          - const: iris-ctl

"iris" or even "venus"

> +          - const: vcodec

"vcodec0"

> +          - const: mxc
> +          - const: mmcx
> +
> +  operating-points-v2: true
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: gcc_video_axi0

"iface"

> +      - const: core_clk

Drop the _clk

> +      - const: vcodec_core

"vcodec0_core' will be more Venus-compatible

> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: iris-cnoc

"cpu-cfg"

> +      - const: iris-ddr

"video-mem" to be closer to Venus

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: video_axi_reset

Just 'bus'

> +
> +  iommus:
> +    maxItems: 2
> +
> +  dma-coherent: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - power-domain-names
> +  - clocks
> +  - clock-names
> +  - interconnects
> +  - interconnect-names
> +  - memory-region
> +  - resets
> +  - reset-names
> +  - iommus
> +  - dma-coherent
> +  - opp-table
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    iris: video-codec@aa00000 {
> +        compatible = "qcom,sm8550-iris";
> +
> +        reg = <0 0x0aa00000 0 0xf0000>;
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0_GDSC>,
> +                        <&rpmhpd SM8550_MXC>,
> +                        <&rpmhpd SM8550_MMCX>;
> +        power-domain-names = "iris-ctl", "vcodec", "mxc", "mmcx";
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_CLK>;
> +        clock-names = "gcc_video_axi0", "core_clk", "vcodec_core";
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
> +                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "iris-cnoc", "iris-ddr";
> +
> +        /* FW load region */
> +        memory-region = <&video_mem>;
> +
> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +        reset-names = "video_axi_reset";
> +
> +        iommus = <&apps_smmu 0x1940 0x0000>,
> +                 <&apps_smmu 0x1947 0x0000>;
> +        dma-coherent;
> +
> +        status = "disabled";
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +           };
> +
> +           opp-338000000 {
> +               opp-hz = /bits/ 64 <338000000>;
> +               required-opps = <&rpmhpd_opp_svs>,
> +                               <&rpmhpd_opp_svs>;
> +           };
> +
> +           opp-366000000 {
> +               opp-hz = /bits/ 64 <366000000>;
> +               required-opps = <&rpmhpd_opp_svs_l1>,
> +                               <&rpmhpd_opp_svs_l1>;
> +           };
> +
> +           opp-444000000 {
> +               opp-hz = /bits/ 64 <444000000>;
> +               required-opps = <&rpmhpd_opp_turbo>,
> +                               <&rpmhpd_opp_turbo>;
> +           };
> +
> +           opp-533333334 {
> +               opp-hz = /bits/ 64 <533333334>;
> +               required-opps = <&rpmhpd_opp_turbo_l1>,
> +                               <&rpmhpd_opp_turbo_l1>;
> +           };
> +       };
> +    };
> +...

-- 
With best wishes
Dmitry


