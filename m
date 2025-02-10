Return-Path: <linux-media+bounces-25941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFCA2F550
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464DB1883A7F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A856255E2D;
	Mon, 10 Feb 2025 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSSv4Bu9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AB256C99;
	Mon, 10 Feb 2025 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208654; cv=none; b=ky5p0AdOiQlAcmoF7qIv7K7USu4e+mlg6Ft4G6unWZE5vSAvUyNOpb/W5yuXe5mbGngyvWAWbhm1hTGyGmPDXhPryjyC8ENWya/m6bczOijsvcUreub4psT34oKPfhFzy8ewC+wRTurWJ0QMhPlQff8LJ3pK1AKywIumWH8N7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208654; c=relaxed/simple;
	bh=cuhpdyhkkWVMn0TdJKFTzm8ueRhCszb9PftEfM9AL+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxyJLydkLJtJwqcTJNVxoqaGBz8dN63aAXwqOGGEWII/B5hAvnTHV6rNI/T6fUhD9MkAgQVm2guHlDr9ZioHZj/rhlU7azG3gW9360X5JPzi0x6W7XuXQwezBh4Kr4KRs1XRCoVpEsGjI6U7up2iqJwO65qAd1/AGaM3UzVOByY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSSv4Bu9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BE5C4CEEA;
	Mon, 10 Feb 2025 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208654;
	bh=cuhpdyhkkWVMn0TdJKFTzm8ueRhCszb9PftEfM9AL+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KSSv4Bu9EESCqtNJkzLgnsE/b8nZ1V/E++ghduKr9A12nTGS9JC3E5ilCNbvNRYgx
	 00tdswa8ojn/eL36nUTG3wOv3xYgReyqZ+uOs3j4pOXtvgdQlyCr1CO8pUGq0RtZ4+
	 AYnChKjgQ0AAu+Ba2F/rfZAwcBKRkpEe+TcmlCbsBwDP6jo5WiTS3U5ew9LedWhaxO
	 xeZOkJpo65uxVyIfIyOT56U25dE3EvAdwarfH5l8WeeUtp/6CC0IDVuAEpI6dFHIOt
	 iyArW99WbbHKP0Lu7jFh4ZbI0bBagwVBAO9gycmPlU/PS1nybTEpLr8r+vFrq5XW64
	 itWEaSxPpidrg==
Message-ID: <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
Date: Mon, 10 Feb 2025 18:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
 lafley.kim@chipsnmedia.com
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-4-nas.chung@chipsnmedia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250210090725.4580-4-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2025 10:07, Nas Chung wrote:
> Add documents for the Wave6 video codec on NXP i.MX SoCs.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../bindings/media/nxp,wave633c.yaml          | 202 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 210 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,wave633c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,wave633c.yaml b/Documentation/devicetree/bindings/media/nxp,wave633c.yaml
> new file mode 100644
> index 000000000000..99c3008314c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,wave633c.yaml

Filename matching compatible.

> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,wave633c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs.
> +
> +maintainers:
> +  - Nas Chung <nas.chung@chipsnmedia.com>
> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
> +
> +description:
> +  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
> +  On NXP i.MX SoCs, Wave6 codec IP functionality is split between the VPU control device
> +  (vpu-ctrl) and the VPU device (vpu). The VPU control device manages shared resources
> +  such as firmware access and power domains, while the VPU device provides encoding
> +  and decoding capabilities. The VPU devie cannot operate independently

Typo

> +  without the VPU control device.
> +

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  Bindings use strict rule here.



> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nxp,imx95-wave633c-ctrl
> +          - nxp,imx95-wave633c

I don't understand why you duplicated compatibles. You split this for
driver? That's a no. There are no two hardwares.

These compatibles are anyway weird - why imx95 is in chipmedia product?
Is this part of a SoC?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: VPU clock
> +      - description: VPU associated block clock
> +
> +  clock-names:
> +    items:
> +      - const: vpu
> +      - const: vpublk_wave
> +
> +  power-domains:
> +    minItems: 1
> +    items:
> +      - description: Main VPU power domain
> +      - description: Performance power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: vpumix
> +      - const: vpuperf
> +
> +  cnm,ctrl:

What is this prefix about? Is this nxp or something else?

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the VPU control device node. Required for VPU operation.

Explain - required for what. Operation is too generic.

If this is phandle to second device, then it's proof your split is
really wrong.

> +
> +  boot:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the boot memory region node for the VPU control device.

No clue what is this... if memory region then use existing bindings.

Anyway, wrap your code correctly.

> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the SRAM memory region node for the VPU control device.
> +
> +  '#cooling-cells':
> +    const: 2
> +
> +  support-follower:
> +    type: boolean
> +    description: Indicates whether the VPU domain power always on.

You cannot add new common properties in random way. Missing vendor
prefix but more important: does not look at all as hardware property but
OS policy.

> +
> +patternProperties:
> +  "^vpu-ctrl@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - nxp,imx95-wave633c-ctrl

Really, what? How nxp,imx95-wave633c-ctrl node can have a child with
nxp,imx95-wave633c-ctrl compatible?

NAK.


> +      reg: true
> +      clocks: true
> +      clock-names: true
> +      power-domains:
> +        items:
> +          - description: Main VPU power domain
> +          - description: Performance power domain
> +      power-domain-names:
> +        items:
> +          - const: vpumix
> +          - const: vpuperf
> +      sram: true
> +      boot: true
> +      '#cooling-cells': true
> +      support-follower: true
> +    required:
> +      - compatible
> +      - reg
> +      - clocks
> +      - clock-names
> +      - power-domains
> +      - power-domain-names
> +      - sram
> +      - boot
> +
> +    additionalProperties: false
> +
> +  "^vpu@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - nxp,imx95-wave633c
> +      reg: true
> +      interrupts: true
> +      clocks: true
> +      clock-names: true
> +      power-domains:
> +        maxItems: 1
> +        description: Main VPU power domain
> +      cnm,ctrl: true
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - clocks
> +      - clock-names
> +      - power-domains
> +      - cnm,ctrl

All this is just incorrect.

> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      vpuctrl: vpu-ctrl@4c4c0000 {
> +        compatible = "nxp,imx95-wave633c-ctrl";
> +        reg = <0x0 0x4c4c0000 0x0 0x10000>;
> +        clocks = <&scmi_clk 115>,
> +            <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        clock-names = "vpu", "vpublk_wave";
> +        power-domains = <&scmi_devpd 21>, <&scmi_perf 10>;
> +        power-domain-names = "vpumix", "vpuperf";
> +        #cooling-cells = <2>;
> +        boot = <&vpu_boot>;
> +        sram = <&sram1>;
> +      };
> +
> +      vpu0: vpu@4c480000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        compatible = "nxp,imx95-wave633c";
> +        reg = <0x0 0x4c480000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&scmi_clk 115>,
> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        clock-names = "vpu", "vpublk_wave";
> +        power-domains = <&scmi_devpd 21>;
> +        cnm,ctrl = <&vpuctrl>;
> +      };
> +
> +      vpu1: vpu@4c490000 {
> +        compatible = "nxp,imx95-wave633c";

Drop all duplicated examples.


> +        reg = <0x0 0x4c490000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&scmi_clk 115>,
> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        clock-names = "vpu", "vpublk_wave";
> +        power-domains = <&scmi_devpd 21>;
> +        cnm,ctrl = <&vpuctrl>;
> +      };
> +
> +      vpu2: vpu@4c4a0000 {
> +        compatible = "nxp,imx95-wave633c";
> +        reg = <0x0 0x4c4a0000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&scmi_clk 115>,
> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        clock-names = "vpu", "vpublk_wave";
> +        power-domains = <&scmi_devpd 21>;
> +        cnm,ctrl = <&vpuctrl>;
> +      };
> +
> +      vpu3: vpu@4c4b0000 {
> +        compatible = "nxp,imx95-wave633c";
> +        reg = <0x0 0x4c4b0000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&scmi_clk 115>,
> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> +        clock-names = "vpu", "vpublk_wave";
> +        power-domains = <&scmi_devpd 21>;
> +        cnm,ctrl = <&vpuctrl>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..5ff5b1f1ced2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25462,6 +25462,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
>  F:	drivers/media/platform/chips-media/wave5/
>  
> +WAVE6 VPU CODEC DRIVER
> +M:	Nas Chung <nas.chung@chipsnmedia.com>
> +M:	Jackson Lee <jackson.lee@chipsnmedia.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/nxp,wave633c.yaml
> +F:	drivers/media/platform/chips-media/wave6/

There is no such file/directory.

Best regards,
Krzysztof

