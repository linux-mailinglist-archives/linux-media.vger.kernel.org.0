Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D811BEDCE
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 03:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgD3BoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 21:44:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42707 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgD3BoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 21:44:06 -0400
Received: by mail-ot1-f65.google.com with SMTP id m18so3551503otq.9;
        Wed, 29 Apr 2020 18:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kFOY9LBT7oRxXs+9HBZXsCqB/74byVIkRhIK2w5gsqU=;
        b=Ta282Fq6bv40GNFwjNn/cooxiVObXeMXzIWkei5CSqUj56uJH1TGEaPAaqYj6HrAeM
         KLZJBH/SOQeXg67P2Z5AJK53g+G1eFW+feNGG2cXGhIPg7pZ7xy8D7b7kg5kLpw2NRg8
         LRuQ0Eq77NI3luLmylbh7bsav1whBV94HlOILyGsX9gF1YOoIro6srSevfV9Y8E4pSt6
         2R9uLmKeoDChbovbiLO3JB9+n/zdKnXWO9i5HecyJ4LdRfi9xsgqAyyRq7OQ7SkR8Aam
         QarQfaq7Ywx6TcHoIYHJ0fN9HpecMDgyRqrMZ6WYm59Y6+9zABfnv/4U8sC5RDSKjvzM
         fJEg==
X-Gm-Message-State: AGi0PuZqmH7oJrvJm7uQQeP2aUgW3cYzq1hzucTGsh5QxHJWo0H7oUL1
        WnQbb6kfo877OVbKjq7+SA==
X-Google-Smtp-Source: APiQypLeXWVNTM/kAh0IfxfyEeLbDd3n3glnfR2APAbNu1iLMd8dVDVz7bMK/hmFQ5E4taHp1lRB/g==
X-Received: by 2002:a9d:694e:: with SMTP id p14mr650572oto.237.1588211045159;
        Wed, 29 Apr 2020 18:44:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s10sm846379otd.69.2020.04.29.18.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 18:44:04 -0700 (PDT)
Received: (nullmailer pid 6061 invoked by uid 1000);
        Thu, 30 Apr 2020 01:44:03 -0000
Date:   Wed, 29 Apr 2020 20:44:03 -0500
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
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v8 3/4] dt-bindings: media: i2c: Add bindings for IMI
 RDACM2x
Message-ID: <20200430014403.GA18465@bogus>
References: <20200417103424.5875-1-kieran.bingham+renesas@ideasonboard.com>
 <20200417103424.5875-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200417103424.5875-4-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 17, 2020 at 11:34:23AM +0100, Kieran Bingham wrote:
> From: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> The IMI RDACM20 and IMI RDACM21 are Gigabit Multimedia Serial Link (GMSL) camera
> capable of transmitting video and I2C control messages on a coax cable
> physical link for automotive applications.
> 
> Document their device tree bindings.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> v2:
>  - Provide imi vendor prefix
>  - Fix minor spelling
> 
> v3:
>  - update binding descriptions
> 
> v4:
>  - No change
> 
> v5:
>  - Specify optional third reg address for the MCU
> 
> v7:
>  [Jacopo]
>  - Rename to imi,rdacm2x-gmsl.yaml
>  - Exand bindings to describe RDACM21
> ---
>  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 161 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> new file mode 100644
> index 000000000000..8476e99b46b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +# Copyright (C) 2019 Renesas Electronics Corp.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imi,rdacm2x-gmsl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:  IMI D&D RDACM20 and RDACM21 Automotive Camera Platforms
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo+renesas@jmondi.org>
> +  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> +
> +description: -|
> +  The IMI D&D RDACM20 and RDACM21 are GMSL-compatible camera designed for
> +  automotive applications.
> +
> +  The RDACM20 camera module encloses a Maxim Integrated MAX9271 GMSL serializer,
> +  coupled with an OV10635 image sensor and an embedded MCU. Both the MCU and
> +  the image sensor are connected to the serializer local I2C bus and are
> +  accessible by the host SoC by direct addressing.
> +
> +  The RDACM21 camera module encloses the same serializer, coupled with an
> +  OV10640 image sensor and an OV490 ISP. Only the OV490 ISP is interfaced to
> +  the serializer local I2C bus while the image sensor is not accessible from
> +  the host SoC.
> +
> +  They both connect to a remote GMSL endpoint through a coaxial cable.
> +
> +                                                   IMI RDACM20
> +  +---------------+                        +--------------------------------+
> +  |      GMSL     |   <- Video Stream      |       <- Video--------\        |
> +  |               |< === GMSL Link ====== >|MAX9271<- I2C bus-> <-->OV10635 |
> +  | de-serializer |   <- I2C messages ->   |                   \<-->MCU     |
> +  +---------------+                        +--------------------------------+
> +
> +                                                   IMI RDACM21
> +  +---------------+                        +--------------------------------+
> +  |      GMSL     |   <- Video Stream      |       <- Video--------\        |
> +  |               |< === GMSL Link ====== >|MAX9271<- I2C bus-> <-->OV490   |
> +  |               |   <- I2C messages ->   |                          |     |
> +  | de-serializer |                        |          OV10640 <-------|     |
> +  +---------------+                        +--------------------------------+
> +
> +  Both camera modules serialize video data generated by the embedded camera
> +  sensor on the GMSL serial channel to a remote GMSL de-serializer. They also
> +  receive and transmit I2C messages encapsulated and transmitted on the GMSL
> +  bidirectional control channel.
> +
> +  All I2C traffic received on the GMSL link not directed to the serializer is
> +  propagated on the local I2C bus to the remote device there connected. All the
> +  I2C traffic generated on the local I2C bus not directed to the serializer is
> +  propagated to the remote de-serializer encapsulated in the GMSL control
> +  channel.
> +
> +  The RDACM20 and RDACM21 DT node should be a direct child of the GMSL
> +  deserializer's I2C bus corresponding to the GMSL link that the camera is
> +  attached to.
> +
> +properties:
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:

You can drop oneOf and items.

> +          - imi,rdacm20
> +          - imi,rdacm21
> +
> +  reg:
> +    description: -|
> +      I2C device addresses, the first to be assigned to the serializer, the
> +      following ones to be assigned to the remote devices.
> +
> +      For RDACM20 the second entry of the property is assigned to the
> +      OV10635 image sensor and the optional third one to the embedded MCU.
> +
> +      For RDACM21 the second entry is assigned to the OV490 ISP and the optional
> +      third one ignored.
> +
> +    minItems: 2
> +    maxItems: 3
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    description: -|
> +      Connection to the remote GMSL endpoint are modelled using the OF graph
> +      bindings in accordance with the video interface bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +      The device node contains a single "port" child node with a single
> +      "endpoint" sub-device.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          remote-endpoint:
> +            description: -|
> +              phandle to the remote GMSL endpoint sub-node in the remote node
> +              port.
> +            maxItems: 1
> +
> +        required:
> +          - remote-endpoint
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +examples:
> +  - |
> +    i2c@e66d8000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      reg = <0 0xe66d8000 0 0x40>;
> +
> +      camera@31 {
> +        compatible = "imi,rdacm20";
> +        reg = <0x31>, <0x41>, <0x51>;
> +
> +        port {
> +          rdacm20_out0: endpoint {
> +            remote-endpoint = <&max9286_in0>;
> +          };
> +        };
> +      };
> +    };
> +
> +  - |
> +    i2c@e66d8000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      reg = <0 0xe66d8000 0 0x40>;
> +
> +      camera@31 {
> +        compatible = "imi,rdacm21";
> +        reg = <0x31>, <0x41>;
> +
> +        port {
> +          rdacm21_out0: endpoint {
> +            remote-endpoint = <&max9286_in0>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index d3891386d671..dcbecdc58731 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -453,6 +453,8 @@ patternProperties:
>      description: Ingenieurburo Fur Ic-Technologie (I/F/I)
>    "^ilitek,.*":
>      description: ILI Technology Corporation (ILITEK)
> +  "^imi,.*":
> +    description: Integrated Micro-Electronics Inc.
>    "^img,.*":

Alphabetical order...

With those fixes,

Reviewed-by: Rob Herring <robh@kernel.org>

