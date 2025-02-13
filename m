Return-Path: <linux-media+bounces-26113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31975A33A45
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6414167BDF
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6916120C46A;
	Thu, 13 Feb 2025 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ia57xZ3p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2FE2063DA;
	Thu, 13 Feb 2025 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739436593; cv=none; b=NWoMV1N+l4ptcp1vnp2DllPNXek4HFhJck2wxgJm4Koojo3+zBOxC8/7hxPy17rA5kghG5aoqvKoR21ABboRVuGHIBMIvePQ2Kd8t6nh4u8iXozxgYCWSDPZ4bwHHDtKn2B+ZV4lAQOrxGUpLONVDF5b32x0lUl6ntOMQ3Oei/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739436593; c=relaxed/simple;
	bh=cd7wC24agIPsKYoQD5ER+IECrpwNvYKfrWoOGu/d88k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GelW8V213Uk1eTkpOJmwedcPONavlL2y1Hc/vOpMiXqWo8oqj1auxN07yBjl+bEd2MtI8T0EW1eBVKC+hMdpa9xgeLcDrsKOFt0KWOw4Z+emZODhDDq56yq8tiy6eHuJDcyduuLj0l70clwdrPJfpcxSKQjEk3rPfcqA4ovkTaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ia57xZ3p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDC5C4CED1;
	Thu, 13 Feb 2025 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739436593;
	bh=cd7wC24agIPsKYoQD5ER+IECrpwNvYKfrWoOGu/d88k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ia57xZ3pwG5L7EjG/epzmI6HuQ4XdduMd+BUnr+fkc3YoXwsrw8IjUPXh7TGObBjt
	 NFPEaINJ6xDAOwBTZe4CtAbSZjjGd1+wVeeLWO7COhzs4qrjG3d8aRaVAhB6VYp509
	 9Du7pNsX38cYCsQegLRYnOMd0ImQ0iTisgR3O8o2xVB5MxbpavegGqNclkUGCN7ozB
	 txpl77HL1ca4AzcD1gH3lBrtvtOLOc9GuprU8KmdZhJdDHubuLNkp4gruMw5HyODcE
	 PczM6LdlRFf6JfQzfJU/qop+3EFMj0RZb/3xzZ8GZ2I9wmMU4AL8izKDMbwFIMUEjj
	 pIAwF+DFhsxfA==
Date: Thu, 13 Feb 2025 09:49:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, 
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jackson.lee" <jackson.lee@chipsnmedia.com>, 
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: Re: [PATCH 3/8] dt-bindings: media: nxp: Add Wave6 video codec device
Message-ID: <20250213-imaginary-shrimp-of-merriment-6ccb6f@krzk-bin>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-4-nas.chung@chipsnmedia.com>
 <cb7937f5-2045-4903-825c-71ed70097efb@kernel.org>
 <SL2P216MB12460EDF6265459D11E2A5A9FBFF2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SL2P216MB12460EDF6265459D11E2A5A9FBFF2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>

On Thu, Feb 13, 2025 at 07:50:53AM +0000, Nas Chung wrote:
> >> +    items:
> >> +      - enum:
> >> +          - nxp,imx95-wave633c-ctrl
> >> +          - nxp,imx95-wave633c
> >
> >I don't understand why you duplicated compatibles. You split this for
> >driver? That's a no. There are no two hardwares.
> 
> Yes, I want to introduce two different devices and drivers,
> even though there is only one hardware.

That's a no. Bindings are for hardware, not drivers.
Linux driver design is independent of bindings.

> 
> Wave6 IP has five independent register regions:
> 
> One register region is dedicated to the control device,
> which manages shared resources such as firmware loading and power domains.
> 
> The remaining four register regions are assigned to
> four independent VPU devices, each accessing its own dedicated region.
> (to support 4 vms)

This could be, but your binding said something completely opposite. Look
how other bindings do it, first.

> 
> Would it be reasonable to split the YAML into separate files
> for the VPU control device and the VPU device ?
> (like nxp,wave633c-ctrl.yaml)

No, it changes nothing.

> 
> >
> >These compatibles are anyway weird - why imx95 is in chipmedia product?
> >Is this part of a SoC?
> 
> I want to represent that the Wave633 is part of the i.MX95.
> Chips&Media's Wave633 can also be integrated into SoCs from other vendors.

OK


> By using the compatible name, the same Wave6 driver can distinguish
> different implementations.

So you tell DT maintainer how DT works, brilliant...

> 
> However, I agree that "imx95" is not strictly necessary in current status.
> So, using "nxp,wave633c" would be a better choice, right ?

No, NXP did not create wave633c. SoC components must have SoC prefix,
assuming this is a Soc component.

> 
> >
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: VPU clock
> >> +      - description: VPU associated block clock
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: vpu
> >> +      - const: vpublk_wave
> >> +
> >> +  power-domains:
> >> +    minItems: 1
> >> +    items:
> >> +      - description: Main VPU power domain
> >> +      - description: Performance power domain
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: vpumix
> >> +      - const: vpuperf
> >> +
> >> +  cnm,ctrl:
> >
> >What is this prefix about? Is this nxp or something else?
> 
> Yes, using "nxp" as the prefix seems more appropriate.
> 
> >
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description: phandle of the VPU control device node. Required for VPU
> >operation.
> >
> >Explain - required for what. Operation is too generic.
> 
> phandle of the VPU control device node, which manages shared resources
> such as firmware access and power domains.

Then NAK.

Use proper bindings for this, e.g. power-domains.


> 
> >
> >If this is phandle to second device, then it's proof your split is
> >really wrong.
> 
> Are you suggesting that I should separate them into two YAML files,

No. Splitting into separate files would change nothing - you still would
have here a phandle, right?

> or that I should structure them in a parent-child hierarchy
> within the same YAML file ?

You did not try hard enough to find similar devices, which there is a
ton of.

> 
> I appreciate any guidance on the best approach to structure this in line
> with existing bindings.

Then look for them.

You have one device. If you have sub-blocks with their own
distinguishable address space, then they can be children. But you did
not write it that way. Just look at your example DTS - no children at
all!

> 
> >
> >> +
> >> +  boot:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description: phandle of the boot memory region node for the VPU
> >control device.
> >
> >No clue what is this... if memory region then use existing bindings.
> 
> Boot is a memory region used for firmware upload.
> Only the control device can access this region.
> By "existing bindings," do you mean I should use "memory-region" instead ?

Look how other bindings do this and what property they use. Yes,
memory-region.

> 
> >
> >Anyway, wrap your code correctly.
> 
> Okay.
> 
> >
> >> +
> >> +  sram:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description: phandle of the SRAM memory region node for the VPU
> >control device.
> >> +
> >> +  '#cooling-cells':
> >> +    const: 2
> >> +
> >> +  support-follower:
> >> +    type: boolean
> >> +    description: Indicates whether the VPU domain power always on.
> >
> >You cannot add new common properties in random way. Missing vendor
> >prefix but more important: does not look at all as hardware property but
> >OS policy.
> 
> I agree with you.
> I'll remove it in v2.
> 
> >
> >> +
> >> +patternProperties:
> >> +  "^vpu-ctrl@[0-9a-f]+$":
> >> +    type: object
> >> +    properties:
> >> +      compatible:
> >> +        items:
> >> +          - enum:
> >> +              - nxp,imx95-wave633c-ctrl
> >
> >Really, what? How nxp,imx95-wave633c-ctrl node can have a child with
> >nxp,imx95-wave633c-ctrl compatible?
> >
> >NAK.
> 
> Apologies, I misunderstood the meaning of 'patternProperties'.
> I'll remove it in v2.
> 
> >
> >
> >> +      reg: true
> >> +      clocks: true
> >> +      clock-names: true
> >> +      power-domains:
> >> +        items:
> >> +          - description: Main VPU power domain
> >> +          - description: Performance power domain
> >> +      power-domain-names:
> >> +        items:
> >> +          - const: vpumix
> >> +          - const: vpuperf
> >> +      sram: true
> >> +      boot: true
> >> +      '#cooling-cells': true
> >> +      support-follower: true
> >> +    required:
> >> +      - compatible
> >> +      - reg
> >> +      - clocks
> >> +      - clock-names
> >> +      - power-domains
> >> +      - power-domain-names
> >> +      - sram
> >> +      - boot
> >> +
> >> +    additionalProperties: false
> >> +
> >> +  "^vpu@[0-9a-f]+$":
> >> +    type: object
> >> +    properties:
> >> +      compatible:
> >> +        items:
> >> +          - enum:
> >> +              - nxp,imx95-wave633c
> >> +      reg: true
> >> +      interrupts: true
> >> +      clocks: true
> >> +      clock-names: true
> >> +      power-domains:
> >> +        maxItems: 1
> >> +        description: Main VPU power domain
> >> +      cnm,ctrl: true
> >> +    required:
> >> +      - compatible
> >> +      - reg
> >> +      - interrupts
> >> +      - clocks
> >> +      - clock-names
> >> +      - power-domains
> >> +      - cnm,ctrl
> >
> >All this is just incorrect.
> 
> I'll remove it in v2.
> 
> >
> >> +
> >> +    additionalProperties: false
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> >> +
> >> +    soc {
> >> +      #address-cells = <2>;
> >> +      #size-cells = <2>;
> >> +
> >> +      vpuctrl: vpu-ctrl@4c4c0000 {

So this is the parent device...

> >> +        compatible = "nxp,imx95-wave633c-ctrl";
> >> +        reg = <0x0 0x4c4c0000 0x0 0x10000>;
> >> +        clocks = <&scmi_clk 115>,
> >> +            <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> >> +        clock-names = "vpu", "vpublk_wave";
> >> +        power-domains = <&scmi_devpd 21>, <&scmi_perf 10>;
> >> +        power-domain-names = "vpumix", "vpuperf";
> >> +        #cooling-cells = <2>;
> >> +        boot = <&vpu_boot>;
> >> +        sram = <&sram1>;
> >> +      };
> >> +
> >> +      vpu0: vpu@4c480000 {


And here you have child which is not a child? Your binding and DTS
neither match nor make any sense.

> >
> >Node names should be generic. See also an explanation and list of
> >examples (not exhaustive) in DT specification:
> >https://devicetree-specification.readthedocs.io/en/latest/chapter2-
> >devicetree-basics.html#generic-names-recommendation
> 
> Thanks for sharing the link.
> I'll use "video-codec" as the node name in v2.
> 
> >
> >
> >> +        compatible = "nxp,imx95-wave633c";
> >> +        reg = <0x0 0x4c480000 0x0 0x10000>;
> >> +        interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> >> +        clocks = <&scmi_clk 115>,
> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> >> +        clock-names = "vpu", "vpublk_wave";
> >> +        power-domains = <&scmi_devpd 21>;
> >> +        cnm,ctrl = <&vpuctrl>;
> >> +      };
> >> +
> >> +      vpu1: vpu@4c490000 {
> >> +        compatible = "nxp,imx95-wave633c";
> >
> >Drop all duplicated examples.
> 
> Wave6 HW is designed for simultaneous access,
> as each VPU device has its own separate register space.
> Therefore, I defined the 4 VPU devices as independent nodes in the example
> to reflect this.

They are redundant in this example. Unless you wanted to express
something else, but you did not.


> 
> >
> >
> >> +        reg = <0x0 0x4c490000 0x0 0x10000>;
> >> +        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> >> +        clocks = <&scmi_clk 115>,
> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> >> +        clock-names = "vpu", "vpublk_wave";
> >> +        power-domains = <&scmi_devpd 21>;
> >> +        cnm,ctrl = <&vpuctrl>;
> >> +      };
> >> +
> >> +      vpu2: vpu@4c4a0000 {
> >> +        compatible = "nxp,imx95-wave633c";
> >> +        reg = <0x0 0x4c4a0000 0x0 0x10000>;
> >> +        interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
> >> +        clocks = <&scmi_clk 115>,
> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> >> +        clock-names = "vpu", "vpublk_wave";
> >> +        power-domains = <&scmi_devpd 21>;
> >> +        cnm,ctrl = <&vpuctrl>;
> >> +      };
> >> +
> >> +      vpu3: vpu@4c4b0000 {
> >> +        compatible = "nxp,imx95-wave633c";
> >> +        reg = <0x0 0x4c4b0000 0x0 0x10000>;
> >> +        interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
> >> +        clocks = <&scmi_clk 115>,
> >> +                <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
> >> +        clock-names = "vpu", "vpublk_wave";
> >> +        power-domains = <&scmi_devpd 21>;
> >> +        cnm,ctrl = <&vpuctrl>;
> >> +      };
> >> +    };
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 896a307fa065..5ff5b1f1ced2 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -25462,6 +25462,14 @@ S:	Maintained
> >>  F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
> >>  F:	drivers/media/platform/chips-media/wave5/
> >>
> >> +WAVE6 VPU CODEC DRIVER
> >> +M:	Nas Chung <nas.chung@chipsnmedia.com>
> >> +M:	Jackson Lee <jackson.lee@chipsnmedia.com>
> >> +L:	linux-media@vger.kernel.org
> >> +S:	Maintained
> >> +F:	Documentation/devicetree/bindings/media/nxp,wave633c.yaml
> >> +F:	drivers/media/platform/chips-media/wave6/
> >
> >There is no such file/directory.
> 
> Understood. I'll move the MAINTAINERS update to the last patch in v2.

No, just add entry per entry.

Best regards,
Krzysztof


