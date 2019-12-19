Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0073312612A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 12:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfLSLqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 06:46:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfLSLqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 06:46:39 -0500
Received: from [10.0.51.123] (freisa.pact.srf.ac.uk [193.37.225.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC5BAE3B;
        Thu, 19 Dec 2019 12:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576755994;
        bh=NWKpXW5WuiMZ4Pv+o+46Dp9oxBqgKSEn7q7K4h4XIH0=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=HC3WbIbuK/DzkEBMgMfLahCwFbUr+iq26wpS3PQwyJbxyCsGXCdf9k74wEyT8SZoM
         fpKII7TpVa1x5bANjXsKjMwgUngcIRNP8iiVvbicSjzXlIYAcxSQ02Mly+DlxDFGbe
         gH3SwUWpedVZQQ4bBjq627xflMPxvfbM62S1LU8g=
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add bindings for Maxim
 Integrated MAX9286
To:     Rob Herring <robh@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Mark Rutland <mark.rutland@arm.com>, sakari.ailus@iki.fi,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191211124459.20508-2-kieran.bingham+renesas@ideasonboard.com>
 <20191218181352.GA6385@bogus>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <86bbf27f-dc0c-0661-13b8-e96b28ec7529@ideasonboard.com>
Date:   Thu, 19 Dec 2019 11:46:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218181352.GA6385@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Rob,

On 18/12/2019 18:13, Rob Herring wrote:
> On Wed, Dec 11, 2019 at 12:44:58PM +0000, Kieran Bingham wrote:
>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> The MAX9286 deserializes video data received on up to 4 Gigabit
>> Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
>> to 4 data lanes.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> ---
>>  .../bindings/media/i2c/maxim,max9286.yaml     | 289 ++++++++++++++++++
>>  1 file changed, 289 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> 
> A couple of nits, with those fixed:

I'll fix them up :-D
Thank you very much.

Converting this to YAML picked up a few issues in our DTS - so it
certainly seems very worthwhile!

--
Kieran


> Reviewed-by: Rob Herring <robh@kernel.org>
> 
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>> new file mode 100644
>> index 000000000000..d37ea2c432f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>> @@ -0,0 +1,289 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)

That's two of those I've got to fix up for you :D. I'll make sure all
new ones I add have this correctly presented.


>> +# Copyright (C) 2019 Renesas Electronics Corp.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/maxim,max9286.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim Integrated Quad GMSL Deserializer
>> +
>> +maintainers:
>> +  - Jacopo Mondi <jacopo+renesas@jmondi.org>
>> +  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> +  - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> +
>> +description: -|
> 
> I usually see '|-', but I guess that works.

Oh, I'm happy to change to conform to whatever is the accepted norm...

> 
>> +  The MAX9286 deserializer receives video data on up to 4 Gigabit Multimedia
>> +  Serial Links (GMSL) and outputs them on a CSI-2 D-PHY port using up to 4 data
>> +  lanes.
>> +
>> +  In addition to video data, the GMSL links carry a bidirectional control
>> +  channel that encapsulates I2C messages. The MAX9286 forwards all I2C traffic
>> +  not addressed to itself to the other side of the links, where a GMSL
>> +  serializer will output it on a local I2C bus. In the other direction all I2C
>> +  traffic received over GMSL by the MAX9286 is output on the local I2C bus.
>> +
>> +properties:
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  compatible:
>> +    const: maxim,max9286
>> +
>> +  reg:
>> +    description: I2C device address
>> +    maxItems: 1
>> +
>> +  poc-supply:
>> +    description: Regulator providing Power over Coax to the cameras
>> +    maxItems: 1
>> +
>> +  enable-gpios:
>> +    description: GPIO connected to the \#PWDN pin with inverted polarity
>> +    maxItems: 1
>> +
>> +  ports:
>> +    type: object
>> +    description: -|
>> +      The connections to the MAX9286 GMSL and its endpoint nodes are modelled
>> +      using the OF graph bindings in accordance with the video interface
>> +      bindings defined in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +      The following table lists the port number corresponding to each device
>> +      port.
>> +
>> +        Port            Description
>> +        ----------------------------------------
>> +        Port 0          GMSL Input 0
>> +        Port 1          GMSL Input 1
>> +        Port 2          GMSL Input 2
>> +        Port 3          GMSL Input 3
>> +        Port 4          CSI-2 Output
>> +
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 0
>> +
>> +      port@[0-3]:
>> +        type: object
>> +        properties:
>> +          reg:
>> +            enum: [ 0, 1, 2, 3 ]
>> +
>> +          endpoint:
>> +            type: object
>> +
>> +            properties:
>> +              remote-endpoint:
>> +                description: -|
>> +                 phandle to the remote GMSL source endpoint subnode in the
>> +                 remote node port.
>> +                maxItems: 1
> 
> This is not an array. You can just drop and assume it has a type defined 
> elsewhere.
> 

Will fix and validate.

>> +
>> +            required:
>> +              - remote-endpoint
>> +
>> +        required:
>> +          - reg
>> +          - endpoint
>> +
>> +        additionalProperties: false
>> +
>> +      port@4:
>> +        type: object
>> +        properties:
>> +          reg:
>> +            const: 4
>> +
>> +          endpoint:
>> +            type: object
>> +
>> +            properties:
>> +              remote-endpoint:
>> +                description: phandle to the remote CSI-2 sink endpoint.
>> +                maxItems: 1
> 
> And here.

Likewise.

> 
>> +
>> +              data-lanes:
>> +                description: array of physical CSI-2 data lane indexes.
>> +
>> +            required:
>> +              - remote-endpoint
>> +              - data-lanes
>> +
>> +        required:
>> +          - reg
>> +          - endpoint
>> +
>> +        additionalProperties: false
>> +
>> +    required:
>> +      - port@4
>> +
>> +  i2c-mux:
>> +    type: object
>> +    description: -|
>> +      Each GMSL link is modelled as a child bus of an i2c bus
>> +      multiplexer/switch, in accordance with bindings described in
>> +      Documentation/devicetree/bindings/i2c/i2c-mux.txt. The serializer
>> +      device on the remote end of the GMSL link shall be modelled as a child
>> +      node of the corresponding I2C bus.
>> +
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 0
>> +
>> +  additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ports
>> +  - i2c-mux
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    i2c@e66d8000 {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      reg = <0 0xe66d8000 0 0x40>;
>> +
>> +      gmsl-deserializer@2c {
>> +        compatible = "maxim,max9286";
>> +        reg = <0x2c>;
>> +        poc-supply = <&camera_poc_12v>;
>> +        enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
>> +
>> +        ports {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          port@0 {
>> +            reg = <0>;
>> +
>> +            max9286_in0: endpoint {
>> +              remote-endpoint = <&rdacm20_out0>;
>> +            };
>> +          };
>> +
>> +          port@1 {
>> +            reg = <1>;
>> +
>> +            max9286_in1: endpoint {
>> +              remote-endpoint = <&rdacm20_out1>;
>> +            };
>> +          };
>> +
>> +          port@2 {
>> +            reg = <2>;
>> +
>> +            max9286_in2: endpoint {
>> +              remote-endpoint = <&rdacm20_out2>;
>> +            };
>> +          };
>> +
>> +          port@3 {
>> +            reg = <3>;
>> +
>> +            max9286_in3: endpoint {
>> +              remote-endpoint = <&rdacm20_out3>;
>> +            };
>> +          };
>> +
>> +          port@4 {
>> +            reg = <4>;
>> +
>> +            max9286_out: endpoint {
>> +              data-lanes = <1 2 3 4>;
>> +              remote-endpoint = <&csi40_in>;
>> +            };
>> +          };
>> +        };
>> +
>> +        i2c-mux {
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          i2c@0 {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            reg = <0>;
>> +
>> +            camera@51 {
>> +              reg = <0x51>;
>> +
>> +              port {
>> +                rdacm20_out0: endpoint {
>> +                  remote-endpoint = <&max9286_in0>;
>> +                };
>> +              };
>> +
>> +            };
>> +          };
>> +
>> +          i2c@1 {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            reg = <1>;
>> +
>> +            camera@52 {
>> +              reg = <0x52>;
>> +
>> +              port {
>> +                rdacm20_out1: endpoint {
>> +                  remote-endpoint = <&max9286_in1>;
>> +                };
>> +              };
>> +            };
>> +          };
>> +
>> +          i2c@2 {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            reg = <2>;
>> +
>> +            camera@53 {
>> +              reg = <0x53>;
>> +
>> +              port {
>> +                rdacm20_out2: endpoint {
>> +                  remote-endpoint = <&max9286_in2>;
>> +                };
>> +              };
>> +            };
>> +          };
>> +
>> +          i2c@3 {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            reg = <3>;
>> +
>> +            camera@54 {
>> +              reg = <0x54>;
>> +
>> +              port {
>> +                rdacm20_out3: endpoint {
>> +                  remote-endpoint = <&max9286_in3>;
>> +                };
>> +              };
>> +            };
>> +          };
>> +        };
>> +      };
>> +    };
>> -- 
>> 2.20.1
>>


-- 
Regards
--
Kieran
