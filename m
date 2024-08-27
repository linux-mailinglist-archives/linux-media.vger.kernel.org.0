Return-Path: <linux-media+bounces-16915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D69607AE
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52C0EB20FB5
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9B819E7F7;
	Tue, 27 Aug 2024 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtC6TKEF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8A149E0E;
	Tue, 27 Aug 2024 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724755345; cv=none; b=qu/TGuhDc2QtocSTO9bXUO4vvcqvudxVgWfHx6kIP9ycLi2jkkfBYDtaV7OYLvJho3V+Bkj3KFONIxGE+LSqAJv5cr2FHi6xgt6LH2a0v1EG2c/kc2GEs50XA6NDjz8Pz3JcZbI2Chf4YAZuzwSa7H9KJaiyrIgmyt5WOLiH2sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724755345; c=relaxed/simple;
	bh=optni2zqwG4oY11mtDJO9MyF1qkPwJAC3GJE4Ba9Ri0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHn2Jk2nkLp8/Hk3E4buj17IsEhpdY+DqKT950e/is9vaa/VtOy62GshOPu0HsBNTEukLmjJnx73KBEEuwZKlvLb3CFpNrMa4mB+xeXzZB0V5PbVQCnPsYAxsE8BgFmZspJ8ysbIdfac3hKXLEobSsosDC6RYswfkZfNu7z+JCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtC6TKEF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2D0C4DE1F;
	Tue, 27 Aug 2024 10:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724755344;
	bh=optni2zqwG4oY11mtDJO9MyF1qkPwJAC3GJE4Ba9Ri0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XtC6TKEF+GnLoobLhH0HBYgfOh9IEmQxMlCGk+UuxLtwxKKK0hPX5zpEnB3D2mlLy
	 vUo/+Ke+7/wCe6V0CwhdRQk1NU0P3/Ux3wSQOu+y3qrtjTosVhqJCJKTODvEEQoNd+
	 WjbuHtINBA+WvFGIiX/nCysP/9s2gI9OpVwFc6BvITGTbLQL6PlhYwfaBhHk3X1vzQ
	 4NSzwjimkU/REyDawRUIywPlR5zzR0FHN1qtC73ZBYo3FS6/LYKU0SbryBD1nqwXad
	 C+xm0l2nts9IOB3ezVYO+6m6McZXq7rC2W4q+ywQCfKGVgCu7Lq3n+ziJojpMiWt4A
	 D+bBkcf4KgFsQ==
Message-ID: <618f4890-bdb5-48f0-b487-5123f167c322@kernel.org>
Date: Tue, 27 Aug 2024 12:42:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/29] dt-bindings: media: Add sm8550 dt schema
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-1-c5fdbbe65e70@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240827-iris_v3-v3-1-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Add a schema description for the iris video encoder/decoder
> on sm8550.

A nit, subject: drop second/last, redundant "dt sche,a". The
"dt-bindings" prefix is already stating that these are bindings/dt schema.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

And subject is neither correct nor complete. You did not add here SM8550
SoC, but SM8550 Iris. Plus what is SM8550? TI SM8550? Samsung SM8550?

You have entire commit subject to say briefly such details without
repeating obvious "dt schema".

> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  .../bindings/media/qcom,sm8550-iris.yaml           | 162 +++++++++++++++++++++
>  1 file changed, 162 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> new file mode 100644
> index 000000000000..a7aa6a6190cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IRIS video encode and decode accelerators

IRIS or Iris? Why it is every time written differently?

If IRIS then explain the acronym in description.

> +
> +maintainers:
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +  - Dikshita Agarwal <quic_dikshita@quicinc.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The Iris video processing unit is a video encode and decode accelerator
> +  present on Qualcomm platforms.
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:

Drop oneOf

> +      - enum:
> +          - qcom,sm8550-iris
> +
> +  power-domains:
> +    maxItems: 4
> +
> +  power-domain-names:
> +    oneOf:

Drop oneOf

> +      - items:
> +          - const: venus
> +          - const: vcodec0
> +          - const: mxc
> +          - const: mmcx
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +      - const: vcodec0_core
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: bus
> +
> +  iommus:
> +    maxItems: 2
> +
> +  dma-coherent: true
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - interconnects
> +  - interconnect-names
> +  - resets
> +  - reset-names
> +  - iommus
> +  - dma-coherent
> +
> +unevaluatedProperties: false
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
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    iris: video-codec@aa00000 {

Drop unused label

> +        compatible = "qcom,sm8550-iris";
> +

No blank line here

> +        reg = <0x0aa00000 0xf0000>;
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +                        <&videocc VIDEO_CC_MVS0_GDSC>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
> +
> +        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
> +                 <&videocc VIDEO_CC_MVS0_CLK>;
> +        clock-names = "iface", "core", "vcodec0_core";
> +
> +        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
> +                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
> +                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +        interconnect-names = "cpu-cfg", "video-mem";
> +
> +        memory-region = <&video_mem>;
> +
> +        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> +        reset-names = "bus";
> +
> +        iommus = <&apps_smmu 0x1940 0x0000>,
> +                 <&apps_smmu 0x1947 0x0000>;
> +        dma-coherent;
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-366000000 {
> +                opp-hz = /bits/ 64 <366000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000>;
> +                required-opps = <&rpmhpd_opp_turbo>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-533333334 {
> +                opp-hz = /bits/ 64 <533333334>;
> +                required-opps = <&rpmhpd_opp_turbo_l1>,
> +                                <&rpmhpd_opp_turbo_l1>;
> +           };

Fix the indentation above.

> +        };
> +    };
> +...
> 

Best regards,
Krzysztof


