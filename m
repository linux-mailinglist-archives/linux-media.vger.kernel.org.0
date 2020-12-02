Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F4F2CC4E7
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 19:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgLBSTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 13:19:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59036 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbgLBSTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 13:19:08 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0ACD52A4;
        Wed,  2 Dec 2020 19:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606933103;
        bh=9JFnoRvcnSTrMyIcgp+1+4iNDKreV0sQWZQ0+6talqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nxGfb36dzaD+BbS7SUd7+YpdtElAmxgSNjp4Zcc8e46Fz2PtTo7LZiCtu+OQgx/t4
         Q7X0B+pTWsUeBMdSAUDKi9GfVRkzrDNoT0VhBl62KGYqIPfOVwNFb/yDIUK/6c2Why
         +8hjnbWzh5DHoUzOEV91VLkpOhra87GUoastIMgs=
Date:   Wed, 2 Dec 2020 20:18:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/1] Revert "media: dt-bindings: media: Use OF graph
 schema"
Message-ID: <20201202181809.GF13750@pendragon.ideasonboard.com>
References: <20201202181432.17759-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201202181432.17759-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Dec 02, 2020 at 08:14:32PM +0200, Sakari Ailus wrote:
> This reverts commit f61eb7bc9256aeb173d2d730f59cdd569d261c52.
> 
> While aligning with the OF graph schema will be done for the media DT
> bindings, this patch got merged a little too hastily. Revert it for now.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/allwinner,sun4i-a10-csi.yaml        |  1 -
>  .../media/allwinner,sun6i-a31-csi.yaml        |  1 -
>  .../bindings/media/i2c/adv7180.yaml           | 31 ++++++--
>  .../bindings/media/i2c/adv7604.yaml           | 32 ++++++--
>  .../bindings/media/i2c/aptina,mt9v111.yaml    |  2 +-
>  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 25 +++++-
>  .../devicetree/bindings/media/i2c/imx219.yaml |  4 -
>  .../bindings/media/i2c/maxim,max9286.yaml     | 76 +++++++++++++++----
>  .../devicetree/bindings/media/i2c/ov5647.yaml |  5 +-
>  .../devicetree/bindings/media/i2c/ov8856.yaml |  5 +-
>  .../bindings/media/i2c/ovti,ov772x.yaml       |  1 -
>  .../bindings/media/i2c/sony,imx214.yaml       |  1 -
>  .../bindings/media/i2c/sony,imx274.yaml       |  3 +-
>  .../bindings/media/marvell,mmp2-ccic.yaml     |  1 -
>  .../bindings/media/renesas,ceu.yaml           |  1 -
>  .../bindings/media/renesas,csi2.yaml          | 36 +++++++--
>  .../bindings/media/renesas,vin.yaml           |  7 +-
>  .../bindings/media/st,stm32-dcmi.yaml         |  7 +-
>  .../devicetree/bindings/media/ti,cal.yaml     | 15 +++-
>  .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 21 ++++-
>  20 files changed, 214 insertions(+), 61 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> index 0205f7dd7fdb..09318830db47 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> @@ -70,7 +70,6 @@ properties:
>    # See ./video-interfaces.txt for details
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>      additionalProperties: false
>  
>      properties:
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> index 48d8f73ce7ab..1fd9b5532a21 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> @@ -43,7 +43,6 @@ properties:
>    # See ./video-interfaces.txt for details
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>  
>      properties:
>        endpoint:
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> index 7f28954a4508..d8c54f9d9506 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> @@ -36,9 +36,17 @@ properties:
>      maxItems: 1
>  
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -
> -  ports: true
> +    type: object
> +    description:
> +      A node containing a single endpoint as doucmented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>  
>  additionalProperties: false
>  
> @@ -72,19 +80,24 @@ allOf:
>      then:
>        properties:
>          ports:
> -          $ref: /schemas/graph.yaml#/properties/ports
>            properties:
> +            '#address-cells':
> +              const: 1
> +            '#size-cells':
> +              const: 0
>              port@3:
> +              type: object
>                description: Output port
>  
>            patternProperties:
>              "^port@[0-2]$":
> +              type: object
>                description: Input port
>  
>            required:
>              - port@3
>  
> -          unevaluatedProperties: false
> +          additionalProperties: false
>  
>        required:
>          - ports
> @@ -97,20 +110,24 @@ allOf:
>      then:
>        properties:
>          ports:
> -          $ref: /schemas/graph.yaml#/properties/ports
>            properties:
> +            '#address-cells':
> +              const: 1
> +            '#size-cells':
> +              const: 0
>              port@6:
>                type: object
>                description: Output port
>  
>            patternProperties:
>              "^port@[0-5]$":
> +              type: object
>                description: Input port
>  
>            required:
>              - port@6
>  
> -          unevaluatedProperties: false
> +          additionalProperties: false
>  
>        required:
>          - ports
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> index 81f17e719d87..3897af540ddd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> @@ -64,12 +64,16 @@ properties:
>      description:
>        Select which input is selected after reset.
>  
> -  ports: true
> +  ports:
> +    type: object
> +    description:
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>  
>  required:
>    - compatible
>    - reg
> -  - ports
>  
>  additionalProperties: false
>  
> @@ -82,17 +86,25 @@ allOf:
>      then:
>        properties:
>          ports:
> -          $ref: /schemas/graph.yaml#/properties/ports
>            properties:
> +            '#address-cells':
> +              const: 1
> +            '#size-cells':
> +              const: 0
>              port@0:
> +              type: object
>                description: Input port
>              port@1:
> +              type: object
>                description: Output port
>  
>            required:
>              - port@1
>  
> -          unevaluatedProperties: false
> +          additionalProperties: false
> +
> +      required:
> +        - ports
>  
>    - if:
>        properties:
> @@ -102,19 +114,27 @@ allOf:
>      then:
>        properties:
>          ports:
> -          $ref: /schemas/graph.yaml#/properties/ports
>            properties:
> +            '#address-cells':
> +              const: 1
> +            '#size-cells':
> +              const: 0
>              port@2:
> +              type: object
>                description: Output port
>  
>            patternProperties:
>              "^port@[0-1]$":
> +              type: object
>                description: Input port
>  
>            required:
>              - port@2
>  
> -          unevaluatedProperties: false
> +          additionalProperties: false
> +
> +      required:
> +        - ports
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> index 17ec4ab1dbd0..ff9546e95d05 100644
> --- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
> @@ -41,7 +41,7 @@ properties:
>      maxItems: 1
>  
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    type: object
>      description: |
>        Output video port. See ../video-interfaces.txt.
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> index e0ea3acca89a..3dc06c628e64 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
> @@ -86,12 +86,33 @@ properties:
>      maxItems: 3
>  
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description:
> +    type: object
> +    additionalProperties: false
> +    description: -|
>        Connection to the remote GMSL endpoint are modelled using the OF graph
>        bindings in accordance with the video interface bindings defined in
>        Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
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
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> index bba42e015c98..dfc4d29a4f04 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -47,8 +47,6 @@ properties:
>    # See ../video-interfaces.txt for more details
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
> -
>      properties:
>        endpoint:
>          type: object
> @@ -76,8 +74,6 @@ properties:
>          required:
>            - link-frequencies
>  
> -    additionalProperties: false
> -
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 2e89a5458afe..9ea827092fdd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -53,25 +53,56 @@ properties:
>  
>    ports:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/ports
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
>  
>      properties:
> -      port@0:
> -        description: GMSL Input 0
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
>  
> -      port@1:
> -        description: GMSL Input 1
> +      port@[0-3]:
> +        type: object
> +        properties:
> +          reg:
> +            enum: [ 0, 1, 2, 3 ]
>  
> -      port@2:
> -        description: GMSL Input 2
> +          endpoint:
> +            type: object
>  
> -      port@3:
> -        description: GMSL Input 3
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
>  
>        port@4:
>          type: object
> -        description: CSI-2 Output
> -
>          properties:
>            reg:
>              const: 4
> @@ -99,8 +130,6 @@ properties:
>      required:
>        - port@4
>  
> -    unevaluatedProperties: false
> -
>    i2c-mux:
>      type: object
>      description: |
> @@ -155,8 +184,25 @@ properties:
>                    requirements of the currently connected remote device.
>  
>                port:
> -                $ref: /schemas/graph.yaml#/properties/port
> -                description: Connection to the MAX9286 sink.
> +                type: object
> +
> +                properties:
> +                  endpoint:
> +                    type: object
> +
> +                    properties:
> +                      remote-endpoint:
> +                        description: phandle to the MAX9286 sink endpoint.
> +
> +                    required:
> +                      - remote-endpoint
> +
> +                    additionalProperties: false
> +
> +                required:
> +                  - endpoint
> +
> +                additionalProperties: false
>  
>              required:
>                - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> index cd5291602a70..280c62afae13 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> @@ -32,7 +32,10 @@ properties:
>  
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
> +    description: |-
> +      Should contain one endpoint sub-node used to model connection to the
> +      video receiver according to the specification defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
>      properties:
>        endpoint:
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> index 2611eb69b3b2..cde85553fd01 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -58,8 +58,11 @@ properties:
>  
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>      additionalProperties: false
> +    description:
> +      A node containing an output port node with an endpoint definition
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>  
>      properties:
>        endpoint:
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> index 450e5bd64312..63b3779d7289 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> @@ -38,7 +38,6 @@ properties:
>  
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>      description: |
>        Video output port. See ../video-interfaces.txt.
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> index 884bd3527e0a..0f5e25fa4e9d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
> @@ -55,7 +55,6 @@ properties:
>  
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>      description: |
>        Video output port. See ../video-interfaces.txt.
>  
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> index 90828020e42a..f697e1a20beb 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> @@ -44,7 +44,8 @@ properties:
>      maxItems: 1
>  
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    type: object
> +    description: Output video port. See ../video-interfaces.txt.
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> index 4832f55654cc..49bff738aca5 100644
> --- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> +++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> @@ -25,7 +25,6 @@ properties:
>  
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>      additionalProperties: false
>  
>      properties:
> diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> index 2d493d503d07..c7e1e4fe67e6 100644
> --- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> @@ -35,7 +35,6 @@ properties:
>  
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>      additionalProperties: false
>  
>      properties:
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> index e34dfbef25a2..533c2f181db7 100644
> --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> @@ -47,7 +47,10 @@ properties:
>  
>    ports:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      A node containing input and output port nodes with endpoint definitions
> +      as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>  
>      properties:
>        port@0:
> @@ -81,15 +84,38 @@ properties:
>          additionalProperties: false
>  
>        port@1:
> +        type: object
>          description:
>            Output port node, multiple endpoints describing all the R-Car VIN
>            modules connected the CSI-2 receiver.
>  
> -    required:
> -      - port@0
> -      - port@1
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +          reg:
> +            const: 1
> +
> +        patternProperties:
> +          "^endpoint@[0-9a-f]$":
> +            type: object
>  
> -    unevaluatedProperties: false
> +            properties:
> +              reg:
> +                maxItems: 1
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - reg
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> index 25a70dc89a4c..ad2fe660364b 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> @@ -70,7 +70,6 @@ properties:
>    #The per-board settings for Gen2 and RZ/G1 platforms:
>    port:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/port
>      description:
>        A node containing a parallel input with a single endpoint definitions as
>        documented in
> @@ -125,7 +124,9 @@ properties:
>  
>    ports:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      A node containing input nodes with endpoint definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>  
>      properties:
>        port@0:
> @@ -271,8 +272,6 @@ properties:
>  
>          additionalProperties: false
>  
> -    unevaluatedProperties: false
> -
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index e3152c8fdfea..c18574bb3e81 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -37,9 +37,12 @@ properties:
>      maxItems: 1
>  
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    type: object
>      description:
> -      DCMI supports a single port node with parallel bus.
> +      DCMI supports a single port node with parallel bus. It should contain
> +      one 'port' child node with child 'endpoint' node. Please refer to the
> +      bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
>      properties:
>        endpoint:
> diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
> index dc2c6be4fa4d..5e066629287d 100644
> --- a/Documentation/devicetree/bindings/media/ti,cal.yaml
> +++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
> @@ -70,18 +70,23 @@ properties:
>    # See ./video-interfaces.txt for details
>    ports:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/ports
> -    unevaluatedProperties: false
> +    additionalProperties: false
>  
>      properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
>        port@0:
>          type: object
> -        description: CSI2 Port #0
>          additionalProperties: false
>  
>          properties:
>            reg:
>              const: 0
> +            description: CSI2 Port #0
>  
>          patternProperties:
>            endpoint:
> @@ -103,12 +108,12 @@ properties:
>  
>        port@1:
>          type: object
> -        description: CSI2 Port #1
>          additionalProperties: false
>  
>          properties:
>            reg:
>              const: 1
> +            description: CSI2 Port #1
>  
>          patternProperties:
>            endpoint:
> @@ -129,6 +134,8 @@ properties:
>            - reg
>  
>      required:
> +      - "#address-cells"
> +      - "#size-cells"
>        - port@0
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> index 0868718c3691..2961a5b6872f 100644
> --- a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
> @@ -98,7 +98,6 @@ properties:
>  
>    ports:
>      type: object
> -    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
>        port@0:
> @@ -142,11 +141,29 @@ properties:
>          additionalProperties: false
>  
>        port@1:
> +        type: object
>          description: |
>            Output / source port node, endpoint describing modules
>            connected the CSI-2 receiver.
>  
> -    unevaluatedProperties: false
> +        properties:
> +
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +
> +            properties:
> +
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
> +            additionalProperties: false
> +
> +        additionalProperties: false
>  
>  required:
>    - compatible

-- 
Regards,

Laurent Pinchart
