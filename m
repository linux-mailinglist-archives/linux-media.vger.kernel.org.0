Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17B367472A
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 00:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjASXY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Jan 2023 18:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjASXY4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Jan 2023 18:24:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88263392B6;
        Thu, 19 Jan 2023 15:24:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9749514;
        Fri, 20 Jan 2023 00:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674170675;
        bh=D/CJsDjy/R+NMpXdK/50LjkKzRk6WC0ZdiaCrgXo/N8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaPrWL7ih4F4w+K7+tRVbd9g60r7JVDLNnW3nNAmYLXauOB4QgZwGCc0zPX/bIMSg
         rmkEX7/GV/qrL2Q85lnplb/kX1bXJ2yT4gB0ZvO6cud5s+J/bb0dRm09ERmURVL9YV
         vuWPElWJb0Q0KLAsy2m4QprPUtvJEFgSaMXapNDc=
Date:   Fri, 20 Jan 2023 01:24:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 4/7] dt-bindings: media: add TI DS90UB960 FPD-Link III
 Deserializer
Message-ID: <Y8nRMK8GJ+vLCS+H@pendragon.ideasonboard.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-5-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230118124031.788940-5-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Wed, Jan 18, 2023 at 02:40:28PM +0200, Tomi Valkeinen wrote:
> Add DT bindings for TI DS90UB960 FPD-Link III Deserializer.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 425 ++++++++++++++++++
>  1 file changed, 425 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> new file mode 100644
> index 000000000000..1ba22450cdba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -0,0 +1,425 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +
> +description:
> +  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
> +  forwarding.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ds90ub960-q1
> +      - ti,ds90ub9702-q1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Reference clock connected to the REFCLK pin.
> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for the GPIO connected to the PDB pin.
> +
> +  i2c-alias-pool:
> +    $ref: /schemas/types.yaml#/definitions/uint16-array
> +    description:
> +      I2C alias pool is a pool of I2C addresses on the main I2C bus that can be
> +      used to access the remote peripherals on the serializer's I2C bus. The
> +      addresses must be available, not used by any other peripheral. Each
> +      remote peripheral is assigned an alias from the pool, and transactions to
> +      that address will be forwarded to the remote peripheral, with the address
> +      translated to the remote peripheral's real address. This property is not
> +      needed if there are no I2C addressable remote peripherals.
> +
> +  links:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      ti,manual-strobe:
> +        type: boolean
> +        description:
> +          Enable manual strobe position and EQ level
> +
> +    patternProperties:
> +      '^link@[0-3]$':
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          reg:
> +            description: The link number
> +            maxItems: 1
> +
> +          i2c-alias:
> +            description:
> +              The I2C address used for the serializer. Transactions to this
> +              address on the I2C bus where the deserializer resides are
> +              forwarded to the serializer.
> +
> +          ti,rx-mode:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum:
> +              - 0 # RAW10
> +              - 1 # RAW12 HF
> +              - 2 # RAW12 LF
> +              - 3 # CSI2 SYNC
> +              - 4 # CSI2 NON-SYNC
> +            description:
> +              FPD-Link Input Mode. This should reflect the hardware and the
> +              default mode of the connected device.
> +
> +          ti,cdr-mode:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum:
> +              - 0 # FPD-Link III
> +              - 1 # FPD-Link IV
> +            description:
> +              FPD-Link CDR Mode. This should reflect the hardware and the
> +              default mode of the connected device.
> +
> +          ti,strobe-pos:
> +            $ref: /schemas/types.yaml#/definitions/int32
> +            minimum: -13
> +            maximum: 13
> +            description: Manual strobe position
> +
> +          ti,eq-level:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 14
> +            description: Manual EQ level
> +
> +          serializer:
> +            type: object
> +            description: FPD-Link Serializer node
> +
> +        required:
> +          - reg
> +          - i2c-alias
> +          - ti,rx-mode
> +          - serializer
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: FPD-Link input 0
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            description:
> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> +              hsync-active and vsync-active must be defined.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: FPD-Link input 1
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            description:
> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> +              hsync-active and vsync-active must be defined.
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: FPD-Link input 2
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            description:
> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> +              hsync-active and vsync-active must be defined.
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: FPD-Link input 3
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            description:
> +              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
> +              hsync-active and vsync-active must be defined.
> +
> +      port@4:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output 0
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
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
> +      port@5:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 Output 1
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
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
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +      - port@3
> +      - port@4
> +      - port@5
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      clock-frequency = <400000>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      deser@3d {
> +        compatible = "ti,ds90ub960-q1";
> +        reg = <0x3d>;
> +
> +        clock-names = "refclk";
> +        clocks = <&fixed_clock>;
> +
> +        powerdown-gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
> +
> +        i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          /* Port 0, Camera 0 */
> +          port@0 {
> +            reg = <0>;
> +
> +            ub960_fpd3_1_in: endpoint {
> +              remote-endpoint = <&ub953_1_out>;
> +            };
> +          };
> +
> +          /* Port 1, Camera 1 */
> +          port@1 {
> +            reg = <1>;
> +
> +            ub960_fpd3_2_in: endpoint {
> +              remote-endpoint = <&ub913_2_out>;
> +              hsync-active = <0>;
> +              vsync-active = <1>;
> +            };
> +          };
> +
> +          /* Port 2, unused */

Minor comment. I'd write "unconnected" instead of "unused" (same below).
Either way,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +          port@2 {
> +            reg = <2>;
> +          };
> +
> +          /* Port 3, unused */
> +          port@3 {
> +            reg = <3>;
> +          };
> +
> +          /* Port 4, CSI-2 TX */
> +          port@4 {
> +            reg = <4>;
> +            ds90ub960_0_csi_out: endpoint {
> +              data-lanes = <1 2 3 4>;
> +              link-frequencies = /bits/ 64 <800000000>;
> +              remote-endpoint = <&csi2_phy0>;
> +            };
> +          };
> +
> +          /* Port 5, unused */
> +          port@5 {
> +            reg = <5>;
> +          };
> +        };
> +
> +        links {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          /* Link 0 has DS90UB953 serializer and IMX274 sensor */
> +
> +          link@0 {
> +            reg = <0>;
> +            i2c-alias = <0x44>;
> +
> +            ti,rx-mode = <3>;
> +
> +            serializer1: serializer {
> +              compatible = "ti,ds90ub953-q1";
> +
> +              gpio-controller;
> +              #gpio-cells = <2>;
> +
> +              #clock-cells = <0>;
> +
> +              ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                  reg = <0>;
> +                  ub953_1_in: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&sensor_1_out>;
> +                  };
> +                };
> +
> +                port@1 {
> +                  reg = <1>;
> +
> +                  ub953_1_out: endpoint {
> +                    remote-endpoint = <&ub960_fpd3_1_in>;
> +                  };
> +                };
> +              };
> +
> +              i2c {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                sensor@1a {
> +                  compatible = "sony,imx274";
> +                  reg = <0x1a>;
> +
> +                  reset-gpios = <&serializer1 0 GPIO_ACTIVE_LOW>;
> +
> +                  port {
> +                    sensor_1_out: endpoint {
> +                      remote-endpoint = <&ub953_1_in>;
> +                    };
> +                  };
> +                };
> +              };
> +            };
> +          };  /* End of link@0 */
> +
> +          /* Link 1 has DS90UB913 serializer and MT9V111 sensor */
> +
> +          link@1 {
> +            reg = <1>;
> +            i2c-alias = <0x45>;
> +
> +            ti,rx-mode = <0>;
> +
> +            serializer2: serializer {
> +              compatible = "ti,ds90ub913a-q1";
> +
> +              gpio-controller;
> +              #gpio-cells = <2>;
> +
> +              clocks = <&clk_cam_48M>;
> +              clock-names = "clkin";
> +
> +              #clock-cells = <0>;
> +
> +              ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                  reg = <0>;
> +                  ub913_2_in: endpoint {
> +                    remote-endpoint = <&sensor_2_out>;
> +                    pclk-sample = <1>;
> +                  };
> +                };
> +
> +                port@1 {
> +                  reg = <1>;
> +
> +                  ub913_2_out: endpoint {
> +                    remote-endpoint = <&ub960_fpd3_2_in>;
> +                  };
> +                };
> +              };
> +
> +              i2c {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                sensor@48 {
> +                  compatible = "aptina,mt9v111";
> +                  reg = <0x48>;
> +
> +                  clocks = <&serializer2>;
> +
> +                  port {
> +                    sensor_2_out: endpoint {
> +                      remote-endpoint = <&ub913_2_in>;
> +                    };
> +                  };
> +                };
> +              };
> +            };
> +          }; /* End of link@1 */
> +        };
> +      };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
