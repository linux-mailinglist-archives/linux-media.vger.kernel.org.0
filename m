Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D363D61E8A7
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 03:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbiKGCmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Nov 2022 21:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiKGCmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Nov 2022 21:42:19 -0500
Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com [115.124.28.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0181CE1E;
        Sun,  6 Nov 2022 18:42:16 -0800 (PST)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0747996|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0154244-0.00114708-0.983428;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=lee@arducam.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---.Q10hEk9_1667788923;
Received: from localhost(mailfrom:lee@arducam.com fp:SMTPD_---.Q10hEk9_1667788923)
          by smtp.aliyun-inc.com;
          Mon, 07 Nov 2022 10:42:04 +0800
Date:   Mon, 7 Nov 2022 10:42:02 +0800
From:   lee <lee@arducam.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor
 binding
Message-ID: <20221107104202.00002f0f@arducam.com>
In-Reply-To: <4556aebd-1296-bb08-2cd7-3d92571ed71b@linaro.org>
References: <20221103110424.00007a48@arducam.com>
        <4556aebd-1296-bb08-2cd7-3d92571ed71b@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 3 Nov 2022 09:05:05 -0400
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,
Thanks a lot for detailed comments and suggestions for revisions,there is one place where I have some doubts.
> On 02/11/2022 23:04, lee wrote:
> > Add YAML device tree binding for IMX519 CMOS image sensor, and
> > the relevant MAINTAINERS entries.
> > 
> > Signed-off-by: Lee Jackson <lee@arducam.com>  
> 
> Your From does not match fully SoB.
> 
> > ---
> >  .../bindings/media/i2c/sony,imx519.yaml       | 107
> > ++++++++++++++++++ MAINTAINERS                                   |
> >  9 ++ 2 files changed, 116 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> > b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml new
> > file mode 100644 index 000000000000..9b6cda96f613 --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx519.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/2.5-Inch 16Mpixel CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Lee Jackson <lee@arducam.com>
> > +
> > +description: |-
> > +  The Sony IMX519 is a 1/2.5-inch CMOS active pixel digital image
> > sensor
> > +  with an active array size of 4656H x 3496V. It is programmable
> > through
> > +  I2C interface. The I2C address is fixed to 0x1A as per sensor
> > data sheet.
> > +  Image data is sent through MIPI CSI-2, which is configured as
> > either 2 or
> > +  4 data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx519
> > +
> > +  reg:
> > +    description: I2C device address  
> 
> Skip description.
> 
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  VDIG-supply:  
> 
> Use lower case names.

Here we refer to other drivers (imx219), they are all uppercase, is lowercase mandatory?
> 
> > +    description:
> > +      Digital I/O voltage supply, 1.05 volts
> > +
> > +  VANA-supply:
> > +    description:
> > +      Analog voltage supply, 2.8 volts
> > +
> > +  VDDL-supply:
> > +    description:
> > +      Digital core voltage supply, 1.8 volts
> > +
> > +  reset-gpios:
> > +    description: |-
> > +      Reference to the GPIO connected to the xclr pin, if any.
> > +      Must be released (set high) after all supplies and INCK are
> > applied. +
> > +port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            description: |-
> > +              The driver only supports two-lane operation.  
> 
> Please describe the hardware, not driver.
> 
> > +            items:
> > +              - const: 1
> > +              - const: 2
> > +
> > +          clock-noncontinuous: true
> > +          link-frequencies: true  
> 
> I think these are coming from video-interfaces, so no need for them.
> 
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - VANA-supply
> > +  - VDIG-supply
> > +  - VDDL-supply
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {  
> 
> i2c
> 
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +  
> 
> > +        imx519: sensor@1a {
> > +            compatible = "sony,imx519";
> > +            reg = <0x1a>;
> > +            clocks = <&imx519_clk>;
> > +            VANA-supply = <&imx519_vana>;   /* 2.8v */
> > +            VDIG-supply = <&imx519_vdig>;   /* 1.05v */
> > +            VDDL-supply = <&imx519_vddl>;   /* 1.8v */
> > +
> > +            port {
> > +                imx519_0: endpoint {
> > +                    remote-endpoint = <&csi1_ep>;
> > +                    data-lanes = <1 2>;
> > +                    clock-noncontinuous;
> > +                    link-frequencies = /bits/ 64 <493500000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e04d944005ba..5a617ab8c9b2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19236,6 +19236,15 @@ T:	git
> > git://linuxtv.org/media_tree.git F:
> > Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> > F:	drivers/media/i2c/imx412.c 
> > +SONY IMX519 SENSOR DRIVER
> > +M:	Arducam Kernel Maintenance <info@arducam.com>
> > +M:	Lee Jackson <lee@arducam.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Maintained
> > +T:	git git://linuxtv.org/media_tree.git
> > +F:
> > Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> > +F:	drivers/media/i2c/imx519.c  
> 
> The file does not exist, so path is not correct (yet). Add it in 2/2.
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
lee
