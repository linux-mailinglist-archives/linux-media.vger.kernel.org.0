Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A4733868A
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 08:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhCLHas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 02:30:48 -0500
Received: from mga14.intel.com ([192.55.52.115]:37272 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230117AbhCLHaN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 02:30:13 -0500
IronPort-SDR: FBItP4Yp5a8FZob2yOA8t8c0dKyYu/9FA0vWZAfhxF58WfsmB2TOKDCIeGlq1fKyVPa0dn0zNE
 l2iGKEDAmxdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="188162241"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="188162241"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 23:29:08 -0800
IronPort-SDR: NmqGPToJuAE6n1ljyOgsMA7z8J6irwxwQWZAtoeBI+/li62H1O/i56aKObL4JVa3X70ILwrn6m
 h41umfnroX3A==
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; 
   d="scan'208";a="409771672"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 23:29:06 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id AED25203A9;
        Fri, 12 Mar 2021 09:29:04 +0200 (EET)
Date:   Fri, 12 Mar 2021 09:29:04 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Convert video-mux to DT schema
Message-ID: <20210312072904.GA3@paasikivi.fi.intel.com>
References: <20210311234042.1588310-1-robh@kernel.org>
 <YErC9/zxKKRXaj+m@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YErC9/zxKKRXaj+m@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 12, 2021 at 03:25:11AM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> Thank you for the patch.
> 
> On Thu, Mar 11, 2021 at 04:40:42PM -0700, Rob Herring wrote:
> > Now that we have the graph schema, convert the video-mux binding to DT
> > schema.
> > 
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/media/video-mux.txt   | 60 ------------
> >  .../devicetree/bindings/media/video-mux.yaml  | 93 +++++++++++++++++++
> >  2 files changed, 93 insertions(+), 60 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/video-mux.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/video-mux.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/video-mux.txt b/Documentation/devicetree/bindings/media/video-mux.txt
> > deleted file mode 100644
> > index 63b9dc913e45..000000000000
> > --- a/Documentation/devicetree/bindings/media/video-mux.txt
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -Video Multiplexer
> > -=================
> > -
> > -Video multiplexers allow to select between multiple input ports. Video received
> > -on the active input port is passed through to the output port. Muxes described
> > -by this binding are controlled by a multiplexer controller that is described by
> > -the bindings in Documentation/devicetree/bindings/mux/mux-controller.txt
> > -
> > -Required properties:
> > -- compatible : should be "video-mux"
> > -- mux-controls : mux controller node to use for operating the mux
> > -- #address-cells: should be <1>
> > -- #size-cells: should be <0>
> > -- port@*: at least three port nodes containing endpoints connecting to the
> > -  source and sink devices according to of_graph bindings. The last port is
> > -  the output port, all others are inputs.
> > -
> > -Optionally, #address-cells, #size-cells, and port nodes can be grouped under a
> > -ports node as described in Documentation/devicetree/bindings/graph.txt.
> > -
> > -Example:
> > -
> > -	mux: mux-controller {
> > -		compatible = "gpio-mux";
> > -		#mux-control-cells = <0>;
> > -
> > -		mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> > -	};
> > -
> > -	video-mux {
> > -		compatible = "video-mux";
> > -		mux-controls = <&mux>;
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		port@0 {
> > -			reg = <0>;
> > -
> > -			mux_in0: endpoint {
> > -				remote-endpoint = <&video_source0_out>;
> > -			};
> > -		};
> > -
> > -		port@1 {
> > -			reg = <1>;
> > -
> > -			mux_in1: endpoint {
> > -				remote-endpoint = <&video_source1_out>;
> > -			};
> > -		};
> > -
> > -		port@2 {
> > -			reg = <2>;
> > -
> > -			mux_out: endpoint {
> > -				remote-endpoint = <&capture_interface_in>;
> > -			};
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/media/video-mux.yaml b/Documentation/devicetree/bindings/media/video-mux.yaml
> > new file mode 100644
> > index 000000000000..780fbbd46a38
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/video-mux.yaml
> > @@ -0,0 +1,93 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/video-mux.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Video Multiplexer
> > +
> > +maintainers:
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +description:
> > +  Video multiplexers allow to select between multiple input ports. Video
> > +  received on the active input port is passed through to the output port. Muxes
> > +  described by this binding are controlled by a multiplexer controller.
> > +
> > +properties:
> > +  compatible:
> > +    const: video-mux
> > +
> > +  mux-controls:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    patternProperties:
> > +      '^port@':
> > +        $ref: /schemas/graph.yaml#/properties/port
> 
> Should we require at least port@0, port@1 and port@2 ?
> 
> > +
> > +patternProperties:
> > +  '^port@':
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      At least three port nodes containing endpoints connecting to the source
> > +      and sink devices according to of_graph bindings. The last port is the
> > +      output port, all others are inputs.
> > +
> > +required:
> > +  - compatible
> > +  - mux-controls
> 
> Should a constraint be added to ensure that either a ports node or
> port@0, port@1 and port@2 nodes exists ?

It's not meaningful to have this device without such nodes. But a mux with
more ports could be connected in a way that leaves one or both of ports 1
and 2 unconnected. It's still not a likely configuration but a possible
one.

Either way,

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    mux: mux-controller {
> > +        compatible = "gpio-mux";
> > +        #mux-control-cells = <0>;
> > +
> > +        mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> > +    };
> > +
> > +    video-mux {
> > +        compatible = "video-mux";
> > +        mux-controls = <&mux>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        port@0 {
> > +            reg = <0>;
> > +
> > +            mux_in0: endpoint {
> > +                remote-endpoint = <&video_source0_out>;
> > +            };
> > +        };
> > +
> > +        port@1 {
> > +            reg = <1>;
> > +
> > +            mux_in1: endpoint {
> > +                remote-endpoint = <&video_source1_out>;
> > +            };
> > +        };
> > +
> > +        port@2 {
> > +            reg = <2>;
> > +
> > +            mux_out: endpoint {
> > +                remote-endpoint = <&capture_interface_in>;
> > +            };
> > +        };
> > +    };
> > +...

-- 
Kind regards,

Sakari Ailus
