Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47DF5E8AB0
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 15:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389292AbfJ2OW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 10:22:59 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38990 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389221AbfJ2OW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 10:22:59 -0400
Received: by mail-ot1-f67.google.com with SMTP id t8so3773574otl.6;
        Tue, 29 Oct 2019 07:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wOvUmxaKvya7RciyrImZgOUHP7nhtqsdJJNqD2oUue8=;
        b=ERhlw34/FocgjHb1Nv/HajfzaAUrqBC6Z51yC/7V1rQL4QRvZ4+kfEKlKLuWu8LIFd
         Y84nbMxM9MRUXK0KFfeK8tKbWqU+KJqftDVRRvkIO0bz9YxagfayVxIEySAwu6tmNhls
         mRGfw/Suk0C4GPviDBoMpsNLWimpqDQGBFM+xU1newKj/f2Pqc9DSUGezSp8Tipg9q/3
         Ax0FKuKVrTZTvxqd0xLmaZwatRry4Ct8baLuMQ4NhXm0/zYp+QqI+jtX8cYNVHW8nk86
         mZDmq4r0k4W479OIBU2cRxXKoH4RhdQOZqCD66AluBLUCSDsHVQKSj8ULyWNoSMAsWnA
         xRtw==
X-Gm-Message-State: APjAAAVel5ICJZFHn5FH4esXwyRg2DoHzURbAQ6uKH0OhVPCbF5LLx93
        XzA9BpbL5pPT58JsbgMDow==
X-Google-Smtp-Source: APXvYqzDCEcMgpQ6CPgRpHiHvSWzt3COcNrpd0Jy+QHeuHgwYDwU4yeRMhf2fepKpJY/ElaurALcKw==
X-Received: by 2002:a9d:2dc1:: with SMTP id g59mr17448521otb.59.1572358976496;
        Tue, 29 Oct 2019 07:22:56 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m205sm883891oif.10.2019.10.29.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 07:22:54 -0700 (PDT)
Date:   Tue, 29 Oct 2019 09:22:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 19/19] dt-bindings: media: cal: convert binding to yaml
Message-ID: <20191029142253.GA7612@bogus>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-20-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153437.20614-20-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 18, 2019 at 10:34:37AM -0500, Benoit Parrot wrote:
> Convert ti-cal.txt to ti,cal.yaml.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../devicetree/bindings/media/ti,cal.yaml     | 186 ++++++++++++++++++
>  .../devicetree/bindings/media/ti-cal.txt      |  82 --------
>  2 files changed, 186 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
> new file mode 100644
> index 000000000000..c3fbb22b4571
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/ti,cal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DRA72x CAMERA ADAPTATION LAYER (CAL) Device Tree Bindings
> +
> +maintainers:
> +  - Benoit Parrot <bparrot@ti.com>
> +
> +description: |-
> +  The Camera Adaptation Layer (CAL) is a key component for image capture
> +  applications. The capture module provides the system interface and the
> +  processing capability to connect CSI2 image-sensor modules to the
> +  DRA72x device.
> +
> +  CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
> +  should contain a 'port' child node with child 'endpoint' node. Please
> +  refer to the bindings defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +  compatible should be
> +     "ti,dra72-cal", for DRA72 controllers
> +     "ti,dra72-pre-es2-cal", for DRA72 controllers pre ES2.0
> +     "ti,dra76-cal", for DRA76 controllers
> +     "ti,am654-cal", for AM654 controllers

Drop these or add as comments to the schema below.

> +
> +properties:
> +  compatible:
> +      items:

You can drop 'items' here since there is only 1.

> +        - enum:
> +            - ti,dra72-cal
> +            - ti,dra72-pre-es2-cal
> +            - ti,dra76-cal
> +            - ti,am654-cal
> +
> +  reg:
> +    minItems: 2
> +    items:
> +      - description: The CAL main register region
> +      - description: The RX Core0 (DPHY0) register region
> +      - description: The RX Core1 (DPHY1) register region
> +
> +  reg-names:
> +    minItems: 2
> +    items:
> +      - const: cal_top
> +      - const: cal_rx_core0
> +      - const: cal_rx_core1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  syscon-camerrx:

Needs a type definition.

> +    maxItems: 1
> +    items:
> +      - description:
> +           phandle to the device control module and offset to the
> +           control_camerarx_core register
> +
> +  clocks:
> +    maxItems: 1
> +    description: functional clock

You can drop the description.

> +
> +  clock-names:
> +    items:

Drop items.

> +      - const: fck
> +
> +  power-domains:
> +    description:
> +      List of phandle and PM domain specifier as documented in
> +      Documentation/devicetree/bindings/power/power_domain.txt
> +    maxItems: 1
> +
> +  # See ./video-interfaces.txt for details
> +  ports:
> +    maxItems: 1

But ports is not an array...

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      '^port@[0-9a-fA-F]+$':

In a device binding, you need to specify 'port@0' and 'port@1' (assuming 
0 and 1) and say what they are.

> +        minItems: 1
> +        maxItems: 2

Not valid for an object (aka node).

> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          reg:
> +            minItems: 1
> +            items:
> +              - description: The port id
> +
> +        patternProperties:
> +          '^endpoint@[0-9a-fA-F]+$':

Just 'endpoint' is valid too.

> +            minItems: 1
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
> +        required:
> +          - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - syscon-camerrx
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    cal: cal@4845b000 {
> +        compatible = "ti,dra72-cal";
> +        reg = <0x4845B000 0x400>,
> +              <0x4845B800 0x40>,
> +              <0x4845B900 0x40>;
> +        reg-names = "cal_top",
> +                    "cal_rx_core0",
> +                    "cal_rx_core1";
> +        interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +        syscon-camerrx = <&scm_conf 0xE94>;
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              csi2_0: port@0 {
> +                    reg = <0>;
> +                    csi2_phy0: endpoint@0 {
> +                           remote-endpoint = <&csi2_cam0>;
> +                           clock-lanes = <0>;
> +                           data-lanes = <1 2>;
> +                    };
> +              };
> +        };
> +    };
> +
> +    i2c5: i2c@4807c000 {
> +        status = "okay";
> +        clock-frequency = <400000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov5640@3c {
> +               compatible = "ovti,ov5640";
> +               reg = <0x3c>;
> +
> +               clocks = <&clk_ov5640_fixed>;
> +               clock-names = "xclk";
> +
> +               port {
> +                    csi2_cam0: endpoint@0 {
> +                            remote-endpoint = <&csi2_phy0>;
> +                            clock-lanes = <0>;
> +                            data-lanes = <1 2>;
> +                    };
> +               };
> +        };
> +    };
> +
> +...
