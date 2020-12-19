Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7292DF0A3
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 18:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgLSRLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 12:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgLSRLD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 12:11:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B90C0613CF;
        Sat, 19 Dec 2020 09:10:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C32A4BA4;
        Sat, 19 Dec 2020 18:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608397820;
        bh=gMGb1SCIOqp/rKnAr3uYegHClNMIRY4rKzu/dB7nyUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z2Ef/hxPn0+/mEO/Jz52v9Yl91yTjdWg1eDZHI74601g4xYbn+RGrkCfF1N9B2ZaA
         Tcoi1fUr9gDJhPVy6Sfgo7EjmNHpU2yeMuFAkZiEQerWGJ3zCZqeXVwMomGhUPpFYA
         FYZ15f5THKkhxP+QIg/Hi5FFhBTxqHsN33WBPI2s=
Date:   Sat, 19 Dec 2020 19:10:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <X94z9PcpCRyIwDgr@pendragon.ideasonboard.com>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-5-robh@kernel.org>
 <X9ofJMIivzPzi8x7@pendragon.ideasonboard.com>
 <20201218181955.GA2378317@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201218181955.GA2378317@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Fri, Dec 18, 2020 at 12:19:55PM -0600, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 04:52:20PM +0200, Laurent Pinchart wrote:
> > On Thu, Dec 10, 2020 at 03:16:24PM -0600, Rob Herring wrote:
> > > Convert video-interfaces.txt to DT schema. As it contains a mixture of
> > > device level and endpoint properties, split it up into 2 schemas.
> > > 
> > > Binding schemas will need to reference both the graph.yaml and
> > > video-interfaces.yaml schemas. The exact schema depends on how many
> > > ports and endpoints for the binding. A single port with a single
> > > endpoint looks similar to this:
> > > 
> > >   port:
> > >     $ref: /schemas/graph.yaml#/$defs/port-base
> > > 
> > >     properties:
> > >       endpoint:
> > >         $ref: video-interfaces.yaml#
> > >         unevaluatedProperties: false
> > > 
> > >         properties:
> > >           bus-width:
> > >             enum: [ 8, 10, 12, 16 ]
> > > 
> > >           pclk-sample: true
> > >           hsync-active: true
> > >           vsync-active: true
> > > 
> > >         required:
> > >           - bus-width
> > > 
> > >     additionalProperties: false
> > > 
> > > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > I need acks for dual licensing from the listed maintainers.
> > > 
> > > v3:
> > > - Support up to 9 physical lanes
> > > - Set lane-polarities array bounds
> > > ---
> > >  .../media/video-interface-devices.yaml        | 406 +++++++++++
> > >  .../bindings/media/video-interfaces.txt       | 640 +-----------------
> > >  .../bindings/media/video-interfaces.yaml      | 346 ++++++++++
> > >  3 files changed, 753 insertions(+), 639 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.yaml
> 
> 
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > new file mode 100644
> > > index 000000000000..fefca7d98718
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > @@ -0,0 +1,346 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Common bindings for video receiver and transmitter interface endpoints
> > > +
> > > +maintainers:
> > > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > +
> > > +description: |
> > > +  Video data pipelines usually consist of external devices, e.g. camera sensors,
> > > +  controlled over an I2C, SPI or UART bus, and SoC internal IP blocks, including
> > > +  video DMA engines and video data processors.
> > > +
> > > +  SoC internal blocks are described by DT nodes, placed similarly to other SoC
> > > +  blocks.  External devices are represented as child nodes of their respective
> > > +  bus controller nodes, e.g. I2C.
> > > +
> > > +  Data interfaces on all video devices are described by their child 'port' nodes.
> > > +  Configuration of a port depends on other devices participating in the data
> > > +  transfer and is described by 'endpoint' subnodes.
> > > +
> > > +  device {
> > > +      ...
> > > +      ports {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          port@0 {
> > > +              ...
> > > +              endpoint@0 { ... };
> > > +              endpoint@1 { ... };
> > > +          };
> > > +          port@1 { ... };
> > > +      };
> > > +  };
> > > +
> > > +  If a port can be configured to work with more than one remote device on the same
> > > +  bus, an 'endpoint' child node must be provided for each of them.  If more than
> > > +  one port is present in a device node or there is more than one endpoint at a
> > > +  port, or port node needs to be associated with a selected hardware interface,
> > > +  a common scheme using '#address-cells', '#size-cells' and 'reg' properties is
> > > +  used.
> > > +
> > > +  All 'port' nodes can be grouped under optional 'ports' node, which allows to
> > > +  specify #address-cells, #size-cells properties independently for the 'port'
> > > +  and 'endpoint' nodes and any child device nodes a device might have.
> > > +
> > > +  Two 'endpoint' nodes are linked with each other through their 'remote-endpoint'
> > > +  phandles.  An endpoint subnode of a device contains all properties needed for
> > > +  configuration of this device for data exchange with other device.  In most
> > > +  cases properties at the peer 'endpoint' nodes will be identical, however they
> > > +  might need to be different when there is any signal modifications on the bus
> > > +  between two devices, e.g. there are logic signal inverters on the lines.
> > > +
> > > +  It is allowed for multiple endpoints at a port to be active simultaneously,
> > > +  where supported by a device.  For example, in case where a data interface of
> > > +  a device is partitioned into multiple data busses, e.g. 16-bit input port
> > > +  divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-width
> > > +  and data-shift properties can be used to assign physical data lines to each
> > > +  endpoint node (logical bus).
> > > +
> > > +  Documenting bindings for devices
> > > +  --------------------------------
> > > +
> > > +  All required and optional bindings the device supports shall be explicitly
> > > +  documented in device DT binding documentation. This also includes port and
> > > +  endpoint nodes for the device, including unit-addresses and reg properties
> > > +  where relevant.
> > > +
> > > +  Please also see Documentation/devicetree/bindings/graph.txt .
> > 
> > Should this be dropped, or modified to reference the YAML schema for OF
> > graph ?
> 
> Yeah. A lot of the above I feel is just duplicate of how graphs work, 
> but I left it as-is.

I meant only the "Please also see ..." sentence.

> > > +  clock-lanes:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    # Assume up to 9 physical lane indices
> > > +    maximum: 8
> > > +    description:
> > > +      Physical clock lane index. Position of an entry determines
> > 
> > s/index/indexes/ (or indices) as there are potentially multiple entries
> > (even if in practice, for all bus types we currently support, only one
> > clock lane is supported) ?
> 
> The original text did say 'array', but there aren't any cases, I can't 
> really see why or how you'd have more than 1, and it seemed silly to 
> make it an array type with 'maxItems: 1'. Wouldn't a 2 clock case be 
> dual interface like we do for DSI?

For CSI-2, I don't see any use case for multiple clocks in a single
port. C-PHY technically has one clock per data lane, but the clock is
embedded in the data lane, so there's no separate clock lane. Maybe
there will be other bus types in the future that require this, but we
can then care about them when they appear.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks.

-- 
Regards,

Laurent Pinchart
