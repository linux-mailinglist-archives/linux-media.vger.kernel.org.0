Return-Path: <linux-media+bounces-21388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD049C7904
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 17:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D514E1F23014
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 16:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6C01FDF92;
	Wed, 13 Nov 2024 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQkXfvdE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEBC2309AF;
	Wed, 13 Nov 2024 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731515939; cv=none; b=MJaUb1ZtnF8PfTqtebxLTUJD9n1WIK3Q7eKJvzpo0DeVB7zlbPn8hQPv+A7Vy05KPZGLuoNaMyr0yzn45tAYe8l6CkHHLe4GorPt3NQNiUDTCKUJ/KVDADnEeQ8KBzpAIbyY2nhx1yQWp5EljCmtZKCwzYTzGMh/h+qiFVD1oEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731515939; c=relaxed/simple;
	bh=Dqhw30gdYg6j/QtQTCn1XbVKdQg8lT+8WdEVEVO/mt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCiHMlwbOs6h1oyGDiekPSNc5VtJf8cisa5FMV7YrnWcGmgDqSOTiTkF36tz59d0is9vBTB04zcUMTDpDE4pGDYMNC8dnHOJ4TABXUkiD3A5Xf7Be2MibKuiSrxJ9dfXHt0dAMDaQ+kQVbk5joLFAvyrl/ccCsV4c8BKbovFyOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQkXfvdE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09141C4CEC3;
	Wed, 13 Nov 2024 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731515939;
	bh=Dqhw30gdYg6j/QtQTCn1XbVKdQg8lT+8WdEVEVO/mt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQkXfvdEefVwhopSRdHUcuGTAJ+Lmn0Beob+9od03YDiDCyk4skuwabNJO4LbQGdt
	 4Z82OkCQz/izVgRYIsTpBjMdci0gQQB2CypL/W6a0KUmE+nm5sW7d6eHNH81w/tYwz
	 7WpyBByLLBSpGBV+AQRpENT3vAJ5aCltnjg3ylkgkahFNPaeOYaZrAf+Ba4Omz8qq9
	 JucZXgFlMZqjHwDGoCYhv6QX/WTe6iwcFRNj4grf1tMvU1r0SiDd0zjjjKmrc8ZLSC
	 F0vBD5RAONx8vbNoTQ5tov82s2ENuweTOeTYFR7ePdcQaFwvMU8EtWyyA8QVl/X5j3
	 mpfRnPgZqKxaw==
Date: Wed, 13 Nov 2024 10:38:57 -0600
From: Rob Herring <robh@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: qcom,qcs615-venus: document QCS615
 venus
Message-ID: <20241113163857.GA436180-robh@kernel.org>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com>

On Tue, Nov 12, 2024 at 05:17:57PM +0530, Renjiang Han wrote:
> Add support for Qualcomm video acceleration hardware used for video
> stream decoding and encoding on QCOM QCS615.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  .../bindings/media/qcom,qcs615-venus.yaml          | 181 +++++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a807f4c7e94c635ef1662971b687db9bdce1b74a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs615-venus.yaml
> @@ -0,0 +1,181 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,qcs615-venus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS615 Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> +
> +description: |

Don't need '|' if no formatting.

> +  The Venus IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qcs615-venus
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: cx
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
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

blank line

> +  opp-table:
> +    type: object
> +
> +  video-decoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-decoder
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false

Put this before 'properties' for indented cases.

> +
> +  video-encoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-encoder
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-domain-names
> +  - iommus
> +  - video-decoder
> +  - video-encoder
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,qcs615-videocc.h>
> +    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    venus: video-codec@aa00000 {
> +        compatible = "qcom,qcs615-venus";
> +        reg = <0xaa00000 0x100000>;
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +                 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +                 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +                 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +                 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +        clock-names = "core",
> +                      "iface",
> +                      "bus",
> +                      "vcodec0_core",
> +                      "vcodec0_bus";
> +
> +        power-domains = <&videocc VENUS_GDSC>,
> +                        <&videocc VCODEC0_GDSC>,
> +                        <&rpmhpd RPMHPD_CX>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "cx";
> +
> +        operating-points-v2 = <&venus_opp_table>;
> +
> +        interconnects = <&mmss_noc MASTER_VIDEO_P0 0
> +                         &mc_virt SLAVE_EBI1 0>,
> +                        <&gem_noc MASTER_APPSS_PROC 0
> +                         &config_noc SLAVE_VENUS_CFG 0>;
> +        interconnect-names = "video-mem",
> +                             "cpu-cfg";
> +
> +        iommus = <&apps_smmu 0xe40 0x20>;
> +
> +        memory-region = <&pil_video_mem>;
> +
> +        video-decoder {
> +            compatible = "venus-decoder";
> +        };
> +
> +        video-encoder {
> +            compatible = "venus-encoder";
> +        };
> +
> +        venus_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-133330000 {
> +                opp-hz = /bits/ 64 <133330000>;
> +                required-opps = <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000>;
> +                required-opps = <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-300000000 {
> +                opp-hz = /bits/ 64 <300000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-380000000 {
> +                opp-hz = /bits/ 64 <380000000>;
> +                required-opps = <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-410000000 {
> +                opp-hz = /bits/ 64 <410000000>;
> +                required-opps = <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-460000000 {
> +                opp-hz = /bits/ 64 <460000000>;
> +                required-opps = <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 

