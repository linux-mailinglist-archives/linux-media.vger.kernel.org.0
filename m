Return-Path: <linux-media+bounces-32997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4BDABF0D7
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804674A8AC2
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4288925C6E1;
	Wed, 21 May 2025 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nG2P98iy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8325725A359;
	Wed, 21 May 2025 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821938; cv=none; b=K0evr6MBYkZ90a6XhijCUiixuIWADnjRi9MoCw/QyjJOtMA4GnTa/9ro62J98ZNJkC4GmBPPd5SgX7LGRS8ttWa545nAuM7Pk9Kb5DPf1Hg6554KEEsg+d8OQyoSeHDPzQdwdlkw/J7fsx2vOEWMV3ETAjTvscM51DT+S68iQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821938; c=relaxed/simple;
	bh=qF0sf5/kYu9pbScNuapYhsVL4yTaC3+FjQYRqrPusGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6ZP/x0kdMLDyveixAo8QcdsgmAeKOlSfFSwdA2kNW5J6JI30C35A+xrCC82fTtyMQrlWcP3xFRoJa0Wc7TIUNGlhoZZYwaENf5WccBiGK5NEQjgcDTMx60htuROOjZ/asc5039x+5Czh2VSdH5qlmrurpNqCbgYrUCbaa4YRHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nG2P98iy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC05C4CEE4;
	Wed, 21 May 2025 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747821938;
	bh=qF0sf5/kYu9pbScNuapYhsVL4yTaC3+FjQYRqrPusGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nG2P98iy6mzm1RGqRoKNSrIcJ6NUHosfIAAMZguURxwk4ihFikJ9pRmolg77CeLo9
	 1jlJ5tyoRWCx9wtLcnl/QMX1tif71pFpbSnaGcv9DawvPB1rwReJQetx37AD7x6QsG
	 U73RsqMqXX59Q/fIhsvqxfncnXf1NsU0CVK8dyI027QReAXg784/oWM4VLkzZMzA4r
	 K20iNB74v3CZY7KOtHsdD7kaWGvNyVpwW+QeNnEAEM916BtkeVqGk+6WKa89aYk+gY
	 uXQGL3pRtiF98xqxfIaTulxxGgC2+tPKY+JW19xajIs3m3DKq/haJqG5QtRRrx9vob
	 UrY9YNNsaxbOA==
Date: Wed, 21 May 2025 12:05:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] media: dt-bindings: Add qcom,msm8939-camss
Message-ID: <20250521-fast-almond-chihuahua-3e0a62@kuoka>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-3-a12cd6006af9@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520-camss-8x39-vbif-v1-3-a12cd6006af9@mailoo.org>

On Tue, May 20, 2025 at 08:39:08PM GMT, Vincent Knecht wrote:
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  .../bindings/media/qcom,msm8939-camss.yaml         | 269 +++++++++++++++++++++
>  1 file changed, 269 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e300b2c84971a45cca43366817a5ed70f9bae630
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> @@ -0,0 +1,269 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8939-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8939 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vincent Knecht <vincent.knecht@mailoo.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8939-camss
> +

No reg? No reg-names?

> +  clocks:
> +    minItems: 24
> +    maxItems: 24
> +
> +  clock-names:
> +    items:
> +      - const: top_ahb
> +      - const: ispif_ahb
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
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
> +      - const: vfe_ahb
> +      - const: vfe_axi
> +
> +  interrupts:
> +    minItems: 7
> +    maxItems: 7
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: ispif
> +      - const: vfe0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE GDSC - Video Front End, Global Distributed Switch Controller.
> +
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
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
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
> +              bus-type:
> +                enum:
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +
> +  reg:
> +    minItems: 11
> +    maxItems: 11

OK, here they are. reg should follow compatible.

> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: ispif
> +      - const: csi_clk_mux
> +      - const: vfe0
> +      - const: vfe0_vbif
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible

Totally messed order. Keep the same order as in properties. See also DTS
coding style.

> +  - interrupt-names
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - reg
> +  - reg-names
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +
> +    camss: camss@1b0ac00 {

Drop unused label

> +      compatible = "qcom,msm8939-camss";
> +

Follow DTS coding style.

...

> +      vdda-supply = <&reg_2v8>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;

Incomplete example.

> +      };
> +

Drop redundant blank line.

Best regards,
Krzysztof


