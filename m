Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC8CE9A1C
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 11:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfJ3KjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 06:39:00 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55709 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726046AbfJ3KjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 06:39:00 -0400
Received: from [172.20.50.122] ([91.217.168.176])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PlNMiZEaKsBskPlNPiLsG2; Wed, 30 Oct 2019 11:38:57 +0100
Subject: Re: [PATCH] dt-bindings: media: meson-ao-cec: convert to yaml
To:     Neil Armstrong <narmstrong@baylibre.com>, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191021121131.25017-1-narmstrong@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d8733cd1-fca8-3aa7-8a48-8e79d0249e82@xs4all.nl>
Date:   Wed, 30 Oct 2019 11:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021121131.25017-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIQ2VdeGwB3P6PAcICDG9mQkN2WKp13Tk7/oBtUpSOf67QH/VGP9pPxvt49Oopz6Qm4vSECPrgX7ZQVLgpKlLNgISmpxyQBwJFLd9BAdOQ/cv1vaA4TN
 YYzuB+p3f3BPchXc6x3xOmgODI6mEhcMDhNoAdVUYRc9jAHCeDEA+JzcJKFEAWzOm29SFD48uSQHaKuz6hfvRXx0SwwazEcFDflnaRUPOcdVaqV/pzoXtT3M
 8ypLdzK972vSyI1Zck283wFUvDjvGllc8x4oSDjx9TQQS2qWDHr0E0E9IcPaarP43bs2Pj6VfwAqBV9c5uXOAr6Zl+NY/ptrW7WMUnMHA/vAsRSHqwiIQPPV
 L/QHyEYjc91sYgyCK18FtGJGNStxGU91lJcWyI9T57H/nKhLqe9gtpTMPtnLdfEAskMCRHXz4fQyEMv7BtaL/9nbR4hPEg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Neil,

Can you post a new patch that updates the MAINTAINERS file?

Thanks!

	Hans

On 10/21/19 2:11 PM, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic AO-CEC controller over to a YAML schemas.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   .../media/amlogic,meson-gx-ao-cec.yaml        | 91 +++++++++++++++++++
>   .../bindings/media/meson-ao-cec.txt           | 37 --------
>   2 files changed, 91 insertions(+), 37 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/meson-ao-cec.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> new file mode 100644
> index 000000000000..41197578f19a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson AO-CEC Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
> +  to handle communication between HDMI connected devices over the CEC bus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gx-ao-cec # GXBB, GXL, GXM, G12A and SM1 AO_CEC_A module
> +      - amlogic,meson-g12a-ao-cec # G12A AO_CEC_B module
> +      - amlogic,meson-sm1-ao-cec # SM1 AO_CEC_B module
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  hdmi-phandle:
> +    description: phandle to the HDMI controller
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-gx-ao-cec
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: AO-CEC clock
> +
> +        clock-names:
> +          maxItems: 1
> +          items:
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-g12a-ao-cec
> +              - amlogic,meson-sm1-ao-cec
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: AO-CEC clock generator source
> +
> +        clock-names:
> +          maxItems: 1
> +          items:
> +            - const: oscin
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - hdmi-phandle
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    cec_AO: cec@100 {
> +        compatible = "amlogic,meson-gx-ao-cec";
> +        reg = <0x0 0x00100 0x0 0x14>;
> +        interrupts = <199>;
> +        clocks = <&clkc_cec>;
> +        clock-names = "core";
> +        hdmi-phandle = <&hdmi_tx>;
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
> deleted file mode 100644
> index ad92ee41c0dd..000000000000
> --- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -* Amlogic Meson AO-CEC driver
> -
> -The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
> -to handle communication between HDMI connected devices over the CEC bus.
> -
> -Required properties:
> -  - compatible : value should be following depending on the SoC :
> -	For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
> -	"amlogic,meson-gx-ao-cec"
> -	For G12A (AO_CEC_B module) :
> -	"amlogic,meson-g12a-ao-cec"
> -	For SM1 (AO_CEC_B module) :
> -	"amlogic,meson-sm1-ao-cec"
> -
> -  - reg : Physical base address of the IP registers and length of memory
> -	  mapped region.
> -
> -  - interrupts : AO-CEC interrupt number to the CPU.
> -  - clocks : from common clock binding: handle to AO-CEC clock.
> -  - clock-names : from common clock binding, must contain :
> -		For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
> -		- "core"
> -		For G12A, SM1 (AO_CEC_B module) :
> -		- "oscin"
> -		corresponding to entry in the clocks property.
> -  - hdmi-phandle: phandle to the HDMI controller
> -
> -Example:
> -
> -cec_AO: cec@100 {
> -	compatible = "amlogic,meson-gx-ao-cec";
> -	reg = <0x0 0x00100 0x0 0x14>;
> -	interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&clkc_AO CLKID_AO_CEC_32K>;
> -	clock-names = "core";
> -	hdmi-phandle = <&hdmi_tx>;
> -};
> 

