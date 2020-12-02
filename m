Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DFE2CC8D4
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 22:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgLBVWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 16:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgLBVWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 16:22:24 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3004C0613D6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 13:21:43 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AED80634C24;
        Wed,  2 Dec 2020 23:20:30 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kkZY7-00035P-52; Wed, 02 Dec 2020 23:20:31 +0200
Date:   Wed, 2 Dec 2020 23:20:31 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        nsaenzjulienne@suse.de, mchehab+huawei@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: media: Document BCM283x CSI2/CCP2
 receiver
Message-ID: <20201202212031.GY4351@valkosipuli.retiisi.org.uk>
References: <20201110174036.220883-1-jacopo@jmondi.org>
 <20201110174036.220883-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110174036.220883-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Nov 10, 2020 at 06:40:33PM +0100, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Document the DT bindings for the CSI2/CCP2 receiver peripheral (known as
> Unicam) on BCM283x SoCs.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../bindings/media/brcm,bcm2835-unicam.yaml   | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> new file mode 100644
> index 0000000000000..6ffc900e8ae8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2020 Raspberry Pi (Trading) Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/brcm,bcm2835-unicam.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM283x Camera Interface (Unicam)
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +  - Raspberry Pi kernel list <kernel-list@raspberrypi.com>
> +
> +description:
> +  The Unicam block on BCM283x SoCs is the receiver for either CSI-2 or CCP2
> +  data from image sensors or similar devices.
> +
> +  The main platform using this SoC is the Raspberry Pi family of boards. On the
> +  Pi the VideoCore firmware can also control this hardware block, and driving
> +  it from two different processors will cause issues. To avoid this, the
> +  firmware checks the device tree configuration during boot. If it finds device
> +  tree nodes whose name starts with "csi" then it will stop the firmware
> +  accessing the block, and it can then safely be used via the device tree
> +  binding.
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm2835-unicam

The compatible string doesn't quite match with the title. Which SoCs are
supported?

> +
> +  reg:
> +    items:
> +      - description: Main registers block
> +      - description: Clock registers block
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: lp
> +      - const: core
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  brcm,num-data-lanes:
> +    description:
> +      The number of data lanes supported by this Unicam instance. It may be
> +      larger than the number of data lanes routed on the board, as described by
> +      the data-lanes property of the endpoint.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum: [1, 2, 4]

Do you need this information besides how many lanes are connected?

Does the number of lanes change even within the same model of SoC? Could
you use the compatible string to differentiate between them?

> +
> +  port:
> +    type: object
> +    description:
> +      Input port node, as described in video-interfaces.txt.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          clock-lanes:
> +            items:
> +              - const: 0

Please drop. There's nothing to tell software here.

> +
> +          data-lanes:
> +            description:
> +              Lane reordering is not supported, items shall be in order,
> +              starting at 1.
> +            allOf:
> +              - $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +              - maxItems: 1
> +                items:
> +                  minItems: 1
> +                  maxItems: 4
> +                  items:
> +                    - const: 1
> +                    - const: 2
> +                    - const: 3
> +                    - const: 4

No need to specify items.

> +
> +          lane-polarities:
> +            description:
> +              Lane inversion is not supported. If the property is specified, it
> +              shall contain all 0's.

Ditto.

> +            allOf:
> +              - $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +              - maxItems: 1
> +                items:
> +                  minItems: 2
> +                  maxItems: 5
> +                  items:
> +                    - const: 0
> +                    - const: 0
> +                    - const: 0
> +                    - const: 0
> +                    - const: 0
> +
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    required:
> +      - endpoint
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - brcm,num-data-lanes
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/bcm2835.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/raspberrypi-power.h>
> +
> +    csi@7e801000 {
> +        compatible = "brcm,bcm2835-unicam";
> +        reg = <0x7e801000 0x800>,
> +              <0x7e802004 0x4>;
> +        interrupts = <2 7>;
> +        clocks = <&clocks BCM2835_CLOCK_CAM1>;
> +        clock-names = "lp";
> +        power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
> +        brcm,num-data-lanes = <4>;
> +
> +        port {
> +            csi1_ep: endpoint {
> +                remote-endpoint = <&imx219_0>;
> +                data-lanes = <1 2>;
> +            };
> +        };
> +    };
> +...

-- 
Sakari Ailus
