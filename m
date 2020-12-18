Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC142DE8DF
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 19:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgLRSUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 13:20:40 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:33012 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgLRSUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 13:20:39 -0500
Received: by mail-oi1-f178.google.com with SMTP id d203so3805242oia.0;
        Fri, 18 Dec 2020 10:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Urw9L+aRtTu9Tg6yjD8zWit3QLaRrQsb41ZKzqZv1oA=;
        b=kPg9XlDw7Bw1CC55pFxOuOiPPKRelZoq/uoZLoMm26RQvlfQkd06X++ana/EHoKDmF
         uogojCRPJsGARYTbmwhsA/I4cml6vbKep24r61cARVNhJ8ytcStwaTj9mMUPW8yBLY58
         /0Qt5BYz1iXEOQswSwBvDML3nliFGLZ1UhaAx2Wghj1YX9v6vu+yU8OT7WJOFJHm4c82
         YtDoPf+3riS8cpTe8KJRV4uf+getCFkpObEpOoNrOQBz/LPiUtFwQe4Wu0jtzFK2NuMT
         G4MSfdm8Gxq/t/ObVSPetINlLUxzI9pJLGddCxgne27O5y97+aNw1M3ijjpLpSOnEjPb
         dKkA==
X-Gm-Message-State: AOAM53039gX02/XtOQsGlmCQYPoFjZ/hPeWGLYcUOqfuk6UC1IJ/9DwD
        VULmE1f35JOtKMK2ix1r3Q==
X-Google-Smtp-Source: ABdhPJz0tkJLL4tbXbtHcEuEtTKdirgS0v+Mhs2uHN7i4AIiN1nvp1/I5Kyo6O07YRrG3IxQ/ecItw==
X-Received: by 2002:aca:5594:: with SMTP id j142mr3787799oib.164.1608315597917;
        Fri, 18 Dec 2020 10:19:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p28sm2045103ota.14.2020.12.18.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 10:19:57 -0800 (PST)
Received: (nullmailer pid 1904375 invoked by uid 1000);
        Fri, 18 Dec 2020 18:19:55 -0000
Date:   Fri, 18 Dec 2020 12:19:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20201218181955.GA2378317@robh.at.kernel.org>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-5-robh@kernel.org>
 <X9ofJMIivzPzi8x7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9ofJMIivzPzi8x7@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 16, 2020 at 04:52:20PM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> Thank you for the patch.
> 
> On Thu, Dec 10, 2020 at 03:16:24PM -0600, Rob Herring wrote:
> > Convert video-interfaces.txt to DT schema. As it contains a mixture of
> > device level and endpoint properties, split it up into 2 schemas.
> > 
> > Binding schemas will need to reference both the graph.yaml and
> > video-interfaces.yaml schemas. The exact schema depends on how many
> > ports and endpoints for the binding. A single port with a single
> > endpoint looks similar to this:
> > 
> >   port:
> >     $ref: /schemas/graph.yaml#/$defs/port-base
> > 
> >     properties:
> >       endpoint:
> >         $ref: video-interfaces.yaml#
> >         unevaluatedProperties: false
> > 
> >         properties:
> >           bus-width:
> >             enum: [ 8, 10, 12, 16 ]
> > 
> >           pclk-sample: true
> >           hsync-active: true
> >           vsync-active: true
> > 
> >         required:
> >           - bus-width
> > 
> >     additionalProperties: false
> > 
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > I need acks for dual licensing from the listed maintainers.
> > 
> > v3:
> > - Support up to 9 physical lanes
> > - Set lane-polarities array bounds
> > ---
> >  .../media/video-interface-devices.yaml        | 406 +++++++++++
> >  .../bindings/media/video-interfaces.txt       | 640 +-----------------
> >  .../bindings/media/video-interfaces.yaml      | 346 ++++++++++
> >  3 files changed, 753 insertions(+), 639 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >  create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.yaml


> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > new file mode 100644
> > index 000000000000..fefca7d98718
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > @@ -0,0 +1,346 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common bindings for video receiver and transmitter interface endpoints
> > +
> > +maintainers:
> > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +
> > +description: |
> > +  Video data pipelines usually consist of external devices, e.g. camera sensors,
> > +  controlled over an I2C, SPI or UART bus, and SoC internal IP blocks, including
> > +  video DMA engines and video data processors.
> > +
> > +  SoC internal blocks are described by DT nodes, placed similarly to other SoC
> > +  blocks.  External devices are represented as child nodes of their respective
> > +  bus controller nodes, e.g. I2C.
> > +
> > +  Data interfaces on all video devices are described by their child 'port' nodes.
> > +  Configuration of a port depends on other devices participating in the data
> > +  transfer and is described by 'endpoint' subnodes.
> > +
> > +  device {
> > +      ...
> > +      ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +              ...
> > +              endpoint@0 { ... };
> > +              endpoint@1 { ... };
> > +          };
> > +          port@1 { ... };
> > +      };
> > +  };
> > +
> > +  If a port can be configured to work with more than one remote device on the same
> > +  bus, an 'endpoint' child node must be provided for each of them.  If more than
> > +  one port is present in a device node or there is more than one endpoint at a
> > +  port, or port node needs to be associated with a selected hardware interface,
> > +  a common scheme using '#address-cells', '#size-cells' and 'reg' properties is
> > +  used.
> > +
> > +  All 'port' nodes can be grouped under optional 'ports' node, which allows to
> > +  specify #address-cells, #size-cells properties independently for the 'port'
> > +  and 'endpoint' nodes and any child device nodes a device might have.
> > +
> > +  Two 'endpoint' nodes are linked with each other through their 'remote-endpoint'
> > +  phandles.  An endpoint subnode of a device contains all properties needed for
> > +  configuration of this device for data exchange with other device.  In most
> > +  cases properties at the peer 'endpoint' nodes will be identical, however they
> > +  might need to be different when there is any signal modifications on the bus
> > +  between two devices, e.g. there are logic signal inverters on the lines.
> > +
> > +  It is allowed for multiple endpoints at a port to be active simultaneously,
> > +  where supported by a device.  For example, in case where a data interface of
> > +  a device is partitioned into multiple data busses, e.g. 16-bit input port
> > +  divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-width
> > +  and data-shift properties can be used to assign physical data lines to each
> > +  endpoint node (logical bus).
> > +
> > +  Documenting bindings for devices
> > +  --------------------------------
> > +
> > +  All required and optional bindings the device supports shall be explicitly
> > +  documented in device DT binding documentation. This also includes port and
> > +  endpoint nodes for the device, including unit-addresses and reg properties
> > +  where relevant.
> > +
> > +  Please also see Documentation/devicetree/bindings/graph.txt .
> 
> Should this be dropped, or modified to reference the YAML schema for OF
> graph ?

Yeah. A lot of the above I feel is just duplicate of how graphs work, 
but I left it as-is.


> > +  clock-lanes:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    # Assume up to 9 physical lane indices
> > +    maximum: 8
> > +    description:
> > +      Physical clock lane index. Position of an entry determines
> 
> s/index/indexes/ (or indices) as there are potentially multiple entries
> (even if in practice, for all bus types we currently support, only one
> clock lane is supported) ?

The original text did say 'array', but there aren't any cases, I can't 
really see why or how you'd have more than 1, and it seemed silly to 
make it an array type with 'maxItems: 1'. Wouldn't a 2 clock case be 
dual interface like we do for DSI?

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks.

Rob
