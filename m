Return-Path: <linux-media+bounces-20717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DAA9BA05B
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 14:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6955281010
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2024 13:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6065518A935;
	Sat,  2 Nov 2024 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ucEqhwB2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9C51E515;
	Sat,  2 Nov 2024 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730553364; cv=none; b=S59gvyPT1Omn+8zu19tPfwM7W8XRZC3yhjTCdyqBfhhy4QM/Gi3ufKgbnDsS3DQ17Me0TFF9OP3MSZWqNmigvq78IRJMt18wPIsAAthuIZmTB1fPraRCUNe+rh6HjelAg9T2UoIFkmytb+VWrwZ3IBg/Pcn5eQN7iWXTwGRa8bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730553364; c=relaxed/simple;
	bh=0niTr1BdvtRlVlzAmME0IL7ZEXv8usi9qtXbuvurDaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHxOxn4qDH5MjT2bzIjdmJ2oVT7dBJs1T9td/P7EEwTs4EZaye7oyyPohkhkua0KVWP4u1aNQVXroKq9MR2A5ihCA13a95Nu2bBoD2ECwB2Bt4SUt7Ngi3e/+6bXYWyUWUcwoI8b2ZAIyz6sZh26uFSMzg7nGAzIrbdBbAz1vLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ucEqhwB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D76C4CEC3;
	Sat,  2 Nov 2024 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730553364;
	bh=0niTr1BdvtRlVlzAmME0IL7ZEXv8usi9qtXbuvurDaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ucEqhwB28owJfvRpdZ7oXPZL8DtSTJ99P2f2bhlSCW0iJQ99oEhAnfQiVlQgHKG67
	 cylomX1f0bxpj44+X8KRpQs4Erxk0iWLQGOI9u8aajQxw+Y1B1BHX6+lD1gP02iL3/
	 BUFU1uq2oR2CfoHobJrlkIBnhSc+jlFwBo/UQ0kWPRUzL+7x7zKjUb2bmCLcuRabuM
	 3pDlIqflpLwIKt/VAlMstKxyvdb959TtltZ9uxhqFvbjjC6vj1dKrq2zVE0fJ7A//K
	 R5e5bc95ZWGKWvHjjTmn2gJjXSZvbx+leZbHRTxWJfAuzEW09GqwnVucvd5TRPqOlk
	 ruQGYVxX40JDw==
Date: Sat, 2 Nov 2024 14:16:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: camss: Add
 qcom,msm8953-camss binding
Message-ID: <5a5hwcql76oxryxlhekykm7gipptfmp27ovs5uzrjemmbw47sw@lqajkvn2pkdx>
References: <20241102-camss-msm8953-v2-0-837310e4541c@mainlining.org>
 <20241102-camss-msm8953-v2-2-837310e4541c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241102-camss-msm8953-v2-2-837310e4541c@mainlining.org>

On Sat, Nov 02, 2024 at 02:32:29AM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add bindings for qcom,msm8953-camss in order to support the camera
> subsystem for MSM8953/SDM450/SDM632.
>=20

subject: only one media prefix, the first one.

> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/media/qcom,msm8953-camss.yaml         | 323 +++++++++++++++=
++++++
>  1 file changed, 323 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8953-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1d2236bc8d94ba81d8b993a10=
5dc5d6a812c727e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> @@ -0,0 +1,323 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +

Drop blank line

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8953-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CAMSS ISP

All CAMSS? Or only MSM8953?

> +
> +maintainers:
> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

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
> +      - const: ahb
> +      - const: csi0
> +      - const: csi0_ahb
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1
> +      - const: csi1_ahb
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2
> +      - const: csi2_ahb
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: csi_vfe0
> +      - const: csi_vfe1
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: csiphy2_timer
> +      - const: ispif_ahb
> +      - const: micro_ahb
> +      - const: top_ahb
> +      - const: vfe0
> +      - const: vfe0_ahb
> +      - const: vfe0_axi
> +      - const: vfe1
> +      - const: vfe1_ahb
> +      - const: vfe1_axi
> +
> +  interrupts:
> +    minItems: 9
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE0 GDSC - Video Front End, Global Distributed Swi=
tch Controller.
> +      - description: VFE1 GDSC - Video Front End, Global Distributed Swi=
tch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: vfe0
> +      - const: vfe1
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
> +      - const: csi_clk_mux
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: csiphy2
> +      - const: csiphy2_clk_mux
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe1
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdda-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8953.h>
> +
> +    camss: camss@1b00000 {
> +        compatible =3D "qcom,msm8953-camss";
> +
> +        reg =3D <0x1b00020 0x10>,

Your DTS was not tested :/. Mismatched unit address.

See Soc maintainer profiles about W=3D1 checks. Do not use us for such
review, but tools.

Best regards,
Krzysztof


