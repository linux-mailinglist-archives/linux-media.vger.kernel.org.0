Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74534220114
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 01:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgGNXod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 19:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgGNXod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 19:44:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E47C061755;
        Tue, 14 Jul 2020 16:44:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E01A771D;
        Wed, 15 Jul 2020 01:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594770270;
        bh=BlgHswt5o7rZqUfB4W5bNSHos/OcygyFLCNV4tKAzw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fHAkLGfMZfQQf2tY4NQZfUcyIAGVPkU7FroBy4x+xhA5O8b7t1JKue/5CSHvFNeX+
         O/zfcx2z69J2n3lnLPHnbMbx6CDyL2Dbqf+6Dfx1L5sDow85+EE3OROXT0efYmQ3/H
         XDA2DB7lMAhQTx88WLSXV+Zo9le6EN5j4oC/LoCk=
Date:   Wed, 15 Jul 2020 02:44:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: ov5647: Convert to json-schema
Message-ID: <20200714234423.GM5854@pendragon.ideasonboard.com>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200714142856.58365-2-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Jul 14, 2020 at 04:28:54PM +0200, Jacopo Mondi wrote:
> Convert the ov5647 image sensor bindings to DT schema and add
> the file entry to MAINTAINERS.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
>  .../devicetree/bindings/media/i2c/ov5647.yaml | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 83 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> deleted file mode 100644
> index 22e44945b661..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Omnivision OV5647 raw image sensor
> ----------------------------------
> -
> -OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
> -and CCI (I2C compatible) control bus.
> -
> -Required properties:
> -
> -- compatible		: "ovti,ov5647".
> -- reg			: I2C slave address of the sensor.
> -- clocks		: Reference to the xclk clock.
> -
> -The common video interfaces bindings (see video-interfaces.txt) should be
> -used to specify link to the image data receiver. The OV5647 device
> -node should contain one 'port' child node with an 'endpoint' subnode.
> -
> -Endpoint node mandatory properties:
> -
> -- remote-endpoint: A phandle to the bus receiver's endpoint node.
> -
> -Example:
> -
> -	i2c@2000 {
> -		...
> -		ov: camera@36 {
> -			compatible = "ovti,ov5647";
> -			reg = <0x36>;
> -			clocks = <&camera_clk>;
> -			port {
> -				camera_1: endpoint {
> -					remote-endpoint = <&csi1_ep1>;
> -				};
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> new file mode 100644
> index 000000000000..067e222e0c7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov5647.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV5647 raw image sensor
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +
> +description: |-
> +  OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
> +  and CCI (I2C compatible) control bus.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5647
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference to the xclk clock
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description: |-
> +      Should contain one endpoint sub-node used to model connection to the
> +      video receiver according to the specification defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint:
> +            description: |-
> +              phandle to the video receiver input port
> +
> +        required:
> +          - remote-endpoint
> +
> +        additionalProperties: false
> +
> +    required:
> +      - endpoint

We usually make it valid for a port to contain no endpoint. This can be
used, for instance, to create a base DT that doesn't describe the
connections, where an overlay will then wire the components together.
I'd thus drop the required property here. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ov5647: camera@36 {
> +            compatible = "ovti,ov5647";
> +            reg = <0x36>;
> +            clocks = <&camera_clk>;
> +
> +            port {
> +                camera_out: endpoint {
> +                    remote-endpoint = <&csi1_ep1>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2730af1265ea..1742fa1a88cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12612,6 +12612,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/ov5647.c
> +F:	Documentation/devicetree/bindings/media/i2c/ov5647.yaml
>  
>  OMNIVISION OV5670 SENSOR DRIVER
>  M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>

-- 
Regards,

Laurent Pinchart
