Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806AD33832A
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 02:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhCLB0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 20:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhCLBZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 20:25:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DA3C061574;
        Thu, 11 Mar 2021 17:25:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D79088F;
        Fri, 12 Mar 2021 02:25:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615512345;
        bh=pdtjjF0z+aKcmLPh+QePKQ88Np0yeYHyI9O+KlZ9Qoc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OcrrHym+VimR55gAqtEUTDWGTJNW7h48b9ZF3zOeakSM5NgRe9J5fIVt4xnLaQzlc
         IHmC4n2w21SrtsyokEZgTaWPP584mZ/BSusi/uw842ppr6ZpHD41dtzcyGWAYytUx+
         /9svfCKYvkFDLHkLvch1Fy3tKO0DVbwBvTGAxeco=
Date:   Fri, 12 Mar 2021 03:25:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Convert video-mux to DT schema
Message-ID: <YErC9/zxKKRXaj+m@pendragon.ideasonboard.com>
References: <20210311234042.1588310-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311234042.1588310-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Thu, Mar 11, 2021 at 04:40:42PM -0700, Rob Herring wrote:
> Now that we have the graph schema, convert the video-mux binding to DT
> schema.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/video-mux.txt   | 60 ------------
>  .../devicetree/bindings/media/video-mux.yaml  | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/video-mux.txt
>  create mode 100644 Documentation/devicetree/bindings/media/video-mux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/video-mux.txt b/Documentation/devicetree/bindings/media/video-mux.txt
> deleted file mode 100644
> index 63b9dc913e45..000000000000
> --- a/Documentation/devicetree/bindings/media/video-mux.txt
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Video Multiplexer
> -=================
> -
> -Video multiplexers allow to select between multiple input ports. Video received
> -on the active input port is passed through to the output port. Muxes described
> -by this binding are controlled by a multiplexer controller that is described by
> -the bindings in Documentation/devicetree/bindings/mux/mux-controller.txt
> -
> -Required properties:
> -- compatible : should be "video-mux"
> -- mux-controls : mux controller node to use for operating the mux
> -- #address-cells: should be <1>
> -- #size-cells: should be <0>
> -- port@*: at least three port nodes containing endpoints connecting to the
> -  source and sink devices according to of_graph bindings. The last port is
> -  the output port, all others are inputs.
> -
> -Optionally, #address-cells, #size-cells, and port nodes can be grouped under a
> -ports node as described in Documentation/devicetree/bindings/graph.txt.
> -
> -Example:
> -
> -	mux: mux-controller {
> -		compatible = "gpio-mux";
> -		#mux-control-cells = <0>;
> -
> -		mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> -	};
> -
> -	video-mux {
> -		compatible = "video-mux";
> -		mux-controls = <&mux>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> -			mux_in0: endpoint {
> -				remote-endpoint = <&video_source0_out>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			mux_in1: endpoint {
> -				remote-endpoint = <&video_source1_out>;
> -			};
> -		};
> -
> -		port@2 {
> -			reg = <2>;
> -
> -			mux_out: endpoint {
> -				remote-endpoint = <&capture_interface_in>;
> -			};
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/media/video-mux.yaml b/Documentation/devicetree/bindings/media/video-mux.yaml
> new file mode 100644
> index 000000000000..780fbbd46a38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/video-mux.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/video-mux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Video Multiplexer
> +
> +maintainers:
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description:
> +  Video multiplexers allow to select between multiple input ports. Video
> +  received on the active input port is passed through to the output port. Muxes
> +  described by this binding are controlled by a multiplexer controller.
> +
> +properties:
> +  compatible:
> +    const: video-mux
> +
> +  mux-controls:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port@':
> +        $ref: /schemas/graph.yaml#/properties/port

Should we require at least port@0, port@1 and port@2 ?

> +
> +patternProperties:
> +  '^port@':
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      At least three port nodes containing endpoints connecting to the source
> +      and sink devices according to of_graph bindings. The last port is the
> +      output port, all others are inputs.
> +
> +required:
> +  - compatible
> +  - mux-controls

Should a constraint be added to ensure that either a ports node or
port@0, port@1 and port@2 nodes exists ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mux: mux-controller {
> +        compatible = "gpio-mux";
> +        #mux-control-cells = <0>;
> +
> +        mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    video-mux {
> +        compatible = "video-mux";
> +        mux-controls = <&mux>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +            reg = <0>;
> +
> +            mux_in0: endpoint {
> +                remote-endpoint = <&video_source0_out>;
> +            };
> +        };
> +
> +        port@1 {
> +            reg = <1>;
> +
> +            mux_in1: endpoint {
> +                remote-endpoint = <&video_source1_out>;
> +            };
> +        };
> +
> +        port@2 {
> +            reg = <2>;
> +
> +            mux_out: endpoint {
> +                remote-endpoint = <&capture_interface_in>;
> +            };
> +        };
> +    };
> +...

-- 
Regards,

Laurent Pinchart
