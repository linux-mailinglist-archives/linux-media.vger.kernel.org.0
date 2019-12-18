Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D03BD125066
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 19:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfLRSN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 13:13:56 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35731 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbfLRSNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 13:13:55 -0500
Received: by mail-ot1-f65.google.com with SMTP id f71so3568882otf.2;
        Wed, 18 Dec 2019 10:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=h2pZYIcAqs9xZ5LwHMEVxZYd02wSFL1rJ96iaI7KIas=;
        b=Arr8WZ02uuAaklK3+E1h4DQwZA7Zq1x+usYOfPuvJourPukLiLHguQdgJmip+eLC+t
         srTxwZFMw+3Bxu9RCdJSsiTJ0cIPjbAxc9n7qS1Qt1Sdv/swE9JNWHCgHae1DNkrETXR
         17G6fPKFr8bgHDqTsb9YHDkGtuiLv4chQylhzra3PAHltvPJDDApCM7ccdqEU1FrtU1w
         1AUrXXZEHvChC/CnzAejwv/RRFC77IkarP5sfp/kyyb8KrpYNIyEkSogqhmsAxy3LiIN
         jo9Y4K8rmSwU0+rqqna4tlplGxwx4jqCxB50uyGb/ZvrryUHB7jv2QXZQczT4zBRJ/e8
         s4Nw==
X-Gm-Message-State: APjAAAVedgX0svjwo3ovpr9vUwjdtUBAaO82pxWo2rdnFGc9HKKCH1bJ
        Qnd2q4UVE/+eC9NL2vFDXA==
X-Google-Smtp-Source: APXvYqxwVETPSBhZ42+sdVbwi5BfZaeYsvdwCtUZAJVIfM2ERgRe0gZYxUI6EqLxhwXVahjjqdW8Gg==
X-Received: by 2002:a9d:32a2:: with SMTP id u31mr3764874otb.249.1576692833898;
        Wed, 18 Dec 2019 10:13:53 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e9sm1054788oia.10.2019.12.18.10.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:13:53 -0800 (PST)
Date:   Wed, 18 Dec 2019 12:13:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Mark Rutland <mark.rutland@arm.com>, sakari.ailus@iki.fi,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add bindings for Maxim
 Integrated MAX9286
Message-ID: <20191218181352.GA6385@bogus>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191211124459.20508-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211124459.20508-2-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 11, 2019 at 12:44:58PM +0000, Kieran Bingham wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The MAX9286 deserializes video data received on up to 4 Gigabit
> Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
> to 4 data lanes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 289 ++++++++++++++++++
>  1 file changed, 289 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml

A couple of nits, with those fixed:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> new file mode 100644
> index 000000000000..d37ea2c432f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -0,0 +1,289 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

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
> +  - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> +
> +description: -|

I usually see '|-', but I guess that works.

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
> +    description: -|
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
> +                description: -|
> +                 phandle to the remote GMSL source endpoint subnode in the
> +                 remote node port.
> +                maxItems: 1

This is not an array. You can just drop and assume it has a type defined 
elsewhere.

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
> +                maxItems: 1

And here.

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
> +    description: -|
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
> 2.20.1
> 
