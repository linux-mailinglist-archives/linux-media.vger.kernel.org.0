Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A98E1D026C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 00:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730687AbgELWgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 18:36:14 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41238 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELWgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 18:36:14 -0400
Received: by mail-ot1-f68.google.com with SMTP id 63so4517887oto.8;
        Tue, 12 May 2020 15:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=b+lYWFW7d5WuHA9/adUDah1iyDv+6a0yqEoD94UA+os=;
        b=bav882LWIZPCBxJEN0edNQ4QBxGf26knxP8b+dOzsRpyy2KnVuFb8k7eHEOteLslPX
         cA9EkgBVU+0XhprTFSrm+9SLsInWnlZaXHMgCDS2IFkyLZGfpWiQ18aDmI55aaCf1VrS
         oji7jmxlW6nplaXRO9EyIlCpqIQlkXFwBWwvAS/f31LtmETrM6kouIXeAjV2+Gdt4ztN
         eGJxx9pL96rFdhFWyYBV37bfGsx93Uxvf7Zsij6cIrP/RnflPGod+PBLLUhoZK4mEupY
         b+UBf5BIJ31+E/zKBDCbMi0K077gdd3YEDxeZMIwl8FKvt1X4sVrG7BFVAB4CIdWvobi
         1ABA==
X-Gm-Message-State: AGi0PuZvPEg12YjuQbk++lICb/VEtjuFyNTePLIY2PezJYYrS3oDRwF6
        ZQnR/AL3Nc4W4s7RDjVVlA==
X-Google-Smtp-Source: APiQypLc9ddCyK8NPHvzukAvl14tgon2sEbqevjzFF1RCC9uIibamXRy04Qgfg9BTVsFeh0I1SgWQA==
X-Received: by 2002:a9d:32e2:: with SMTP id u89mr19280261otb.285.1589322972573;
        Tue, 12 May 2020 15:36:12 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l6sm3789450otq.48.2020.05.12.15.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 15:36:11 -0700 (PDT)
Received: (nullmailer pid 29112 invoked by uid 1000);
        Tue, 12 May 2020 22:36:10 -0000
Date:   Tue, 12 May 2020 17:36:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, sakari.ailus@iki.fi,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v9 1/4] dt-bindings: media: i2c: Add bindings for Maxim
 Integrated MAX9286
Message-ID: <20200512223610.GB23701@bogus>
References: <20200512155105.1068064-1-kieran.bingham+renesas@ideasonboard.com>
 <20200512155105.1068064-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512155105.1068064-2-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 04:51:02PM +0100, Kieran Bingham wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The MAX9286 deserializes video data received on up to 4 Gigabit
> Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
> to 4 data lanes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> v7:
>  - Collect Rob's RB tag
>  - Remove redundant maxItems from remote-endpoints
>  - Fix SPDX licence tag
> 
>  .../bindings/media/i2c/maxim,max9286.yaml     | 287 ++++++++++++++++++
>  1 file changed, 287 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> new file mode 100644
> index 000000000000..f9d3e5712c59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -0,0 +1,287 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2019 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/maxim,max9286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated Quad GMSL Deserializer
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo+renesas@jmondi.org>
> +  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> +
> +description: |
> +  The MAX9286 deserializer receives video data on up to 4 Gigabit Multimedia
> +  Serial Links (GMSL) and outputs them on a CSI-2 D-PHY port using up to 4 data
> +  lanes.
> +
> +  In addition to video data, the GMSL links carry a bidirectional control
> +  channel that encapsulates I2C messages. The MAX9286 forwards all I2C traffic
> +  not addressed to itself to the other side of the links, where a GMSL
> +  serializer will output it on a local I2C bus. In the other direction all I2C
> +  traffic received over GMSL by the MAX9286 is output on the local I2C bus.
> +
> +properties:
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  compatible:
> +    const: maxim,max9286
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  poc-supply:
> +    description: Regulator providing Power over Coax to the cameras
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: GPIO connected to the \#PWDN pin with inverted polarity
> +    maxItems: 1
> +
> +  ports:
> +    type: object
> +    description: |
> +      The connections to the MAX9286 GMSL and its endpoint nodes are modelled
> +      using the OF graph bindings in accordance with the video interface
> +      bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +      The following table lists the port number corresponding to each device
> +      port.
> +
> +        Port            Description
> +        ----------------------------------------
> +        Port 0          GMSL Input 0
> +        Port 1          GMSL Input 1
> +        Port 2          GMSL Input 2
> +        Port 3          GMSL Input 3
> +        Port 4          CSI-2 Output
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@[0-3]:
> +        type: object
> +        properties:
> +          reg:
> +            enum: [ 0, 1, 2, 3 ]
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint:
> +                description: |
> +                 phandle to the remote GMSL source endpoint subnode in the
> +                 remote node port.
> +
> +            required:
> +              - remote-endpoint
> +
> +        required:
> +          - reg
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +      port@4:
> +        type: object
> +        properties:
> +          reg:
> +            const: 4
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +              remote-endpoint:
> +                description: phandle to the remote CSI-2 sink endpoint.
> +
> +              data-lanes:
> +                description: array of physical CSI-2 data lane indexes.
> +
> +            required:
> +              - remote-endpoint
> +              - data-lanes
> +
> +        required:
> +          - reg
> +          - endpoint
> +
> +        additionalProperties: false
> +
> +    required:
> +      - port@4
> +
> +  i2c-mux:
> +    type: object
> +    description: |
> +      Each GMSL link is modelled as a child bus of an i2c bus
> +      multiplexer/switch, in accordance with bindings described in
> +      Documentation/devicetree/bindings/i2c/i2c-mux.txt. The serializer
> +      device on the remote end of the GMSL link shall be modelled as a child
> +      node of the corresponding I2C bus.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +  additionalProperties: false

Wrong indentation. Should be 2 more or this is a DT property.

> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +  - i2c-mux
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c@e66d8000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      reg = <0 0xe66d8000 0 0x40>;
> +
> +      gmsl-deserializer@2c {
> +        compatible = "maxim,max9286";
> +        reg = <0x2c>;
> +        poc-supply = <&camera_poc_12v>;
> +        enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +
> +            max9286_in0: endpoint {
> +              remote-endpoint = <&rdacm20_out0>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +
> +            max9286_in1: endpoint {
> +              remote-endpoint = <&rdacm20_out1>;
> +            };
> +          };
> +
> +          port@2 {
> +            reg = <2>;
> +
> +            max9286_in2: endpoint {
> +              remote-endpoint = <&rdacm20_out2>;
> +            };
> +          };
> +
> +          port@3 {
> +            reg = <3>;
> +
> +            max9286_in3: endpoint {
> +              remote-endpoint = <&rdacm20_out3>;
> +            };
> +          };
> +
> +          port@4 {
> +            reg = <4>;
> +
> +            max9286_out: endpoint {
> +              data-lanes = <1 2 3 4>;
> +              remote-endpoint = <&csi40_in>;
> +            };
> +          };
> +        };
> +
> +        i2c-mux {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          i2c@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            reg = <0>;
> +
> +            camera@51 {
> +              reg = <0x51>;
> +
> +              port {
> +                rdacm20_out0: endpoint {
> +                  remote-endpoint = <&max9286_in0>;
> +                };
> +              };
> +
> +            };
> +          };
> +
> +          i2c@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +
> +            camera@52 {
> +              reg = <0x52>;
> +
> +              port {
> +                rdacm20_out1: endpoint {
> +                  remote-endpoint = <&max9286_in1>;
> +                };
> +              };
> +            };
> +          };
> +
> +          i2c@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +
> +            camera@53 {
> +              reg = <0x53>;
> +
> +              port {
> +                rdacm20_out2: endpoint {
> +                  remote-endpoint = <&max9286_in2>;
> +                };
> +              };
> +            };
> +          };
> +
> +          i2c@3 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <3>;
> +
> +            camera@54 {
> +              reg = <0x54>;
> +
> +              port {
> +                rdacm20_out3: endpoint {
> +                  remote-endpoint = <&max9286_in3>;
> +                };
> +              };
> +            };
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.25.1
> 
