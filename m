Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8427E2A47
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 08:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437692AbfJXGN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 02:13:58 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60414 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404173AbfJXGN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 02:13:58 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 36D56634C87;
        Thu, 24 Oct 2019 09:13:35 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iNWNK-0000pH-4K; Thu, 24 Oct 2019 09:13:34 +0300
Date:   Thu, 24 Oct 2019 09:13:34 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 19/19] dt-bindings: media: cal: convert binding to yaml
Message-ID: <20191024061334.GA2867@valkosipuli.retiisi.org.uk>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-20-bparrot@ti.com>
 <20191022074623.GE864@valkosipuli.retiisi.org.uk>
 <20191023161844.hgrxeo244krq26lz@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023161844.hgrxeo244krq26lz@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Wed, Oct 23, 2019 at 11:18:45AM -0500, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@iki.fi> wrote on Tue [2019-Oct-22 10:46:23 +0300]:
> > Hi Benoit,
> > 
> > Thanks for the patch.
> > 
> > On Fri, Oct 18, 2019 at 10:34:37AM -0500, Benoit Parrot wrote:
> > > Convert ti-cal.txt to ti,cal.yaml.
> > > 
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  .../devicetree/bindings/media/ti,cal.yaml     | 186 ++++++++++++++++++
> > >  .../devicetree/bindings/media/ti-cal.txt      |  82 --------
> > >  2 files changed, 186 insertions(+), 82 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
> > > new file mode 100644
> > > index 000000000000..c3fbb22b4571
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
> > > @@ -0,0 +1,186 @@
> > > +# SPDX-License-Identifier: (GPL-2.0)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/ti,cal.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Texas Instruments DRA72x CAMERA ADAPTATION LAYER (CAL) Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Benoit Parrot <bparrot@ti.com>
> > > +
> > > +description: |-
> > > +  The Camera Adaptation Layer (CAL) is a key component for image capture
> > > +  applications. The capture module provides the system interface and the
> > > +  processing capability to connect CSI2 image-sensor modules to the
> > > +  DRA72x device.
> > > +
> > > +  CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
> > > +  should contain a 'port' child node with child 'endpoint' node. Please
> > > +  refer to the bindings defined in
> > > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +
> > > +  compatible should be
> > > +     "ti,dra72-cal", for DRA72 controllers
> > > +     "ti,dra72-pre-es2-cal", for DRA72 controllers pre ES2.0
> > > +     "ti,dra76-cal", for DRA76 controllers
> > > +     "ti,am654-cal", for AM654 controllers
> > > +
> > > +properties:
> > > +  compatible:
> > > +      items:
> > > +        - enum:
> > > +            - ti,dra72-cal
> > > +            - ti,dra72-pre-es2-cal
> > > +            - ti,dra76-cal
> > > +            - ti,am654-cal
> > > +
> > > +  reg:
> > > +    minItems: 2
> > > +    items:
> > > +      - description: The CAL main register region
> > > +      - description: The RX Core0 (DPHY0) register region
> > > +      - description: The RX Core1 (DPHY1) register region
> > > +
> > > +  reg-names:
> > > +    minItems: 2
> > > +    items:
> > > +      - const: cal_top
> > > +      - const: cal_rx_core0
> > > +      - const: cal_rx_core1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  syscon-camerrx:
> > > +    maxItems: 1
> > > +    items:
> > > +      - description:
> > > +           phandle to the device control module and offset to the
> > > +           control_camerarx_core register
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +    description: functional clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: fck
> > > +
> > > +  power-domains:
> > > +    description:
> > > +      List of phandle and PM domain specifier as documented in
> > > +      Documentation/devicetree/bindings/power/power_domain.txt
> > > +    maxItems: 1
> > > +
> > > +  # See ./video-interfaces.txt for details
> > > +  ports:
> > > +    maxItems: 1
> > > +    type: object
> > > +    additionalProperties: false
> > > +
> > > +    properties:
> > > +      "#address-cells":
> > > +        const: 1
> > > +
> > > +      "#size-cells":
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      '^port@[0-9a-fA-F]+$':
> > > +        minItems: 1
> > > +        maxItems: 2
> > 
> > Obviously you need a port node to connect a sensor. But can the device do
> > something useful without one? I guess it may be a matter of taste whether
> > you require one.
> 
> In an ideal world all of these would be covered by a video-interfaces.yaml
> file I would just need to include... :)
> 
> But I'll try and add some more "required" and see how much trouble it gets
> me.
> > 
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        properties:
> > > +          reg:
> > > +            minItems: 1
> > > +            items:
> > > +              - description: The port id
> > > +
> > > +        patternProperties:
> > > +          '^endpoint@[0-9a-fA-F]+$':
> > > +            minItems: 1
> > 
> > The graph bindings allows for no endpoints.
> 
> Maybe but then it is not much use.

I guess you can require the endpoint in device bindings still. But the
question is: do you need to?

> > 
> > > +            type: object
> > > +            additionalProperties: false
> > > +
> > > +            properties:
> > > +              clock-lanes:
> > > +                maxItems: 1
> > 
> > Does the device support lane reordering? If not, you could omit the
> > clock-lanes property. It wasn't documented earlier either albeit the
> > example had it for some reason.
> 
> Not sure what you mean by lane re-ordering here, but this IP needs to know
> which lanes are used for data and which lane is the clock lane.
> 
> I cannot just assume that clock lane is always lane 0, I have a sensor
> where the clock lane is #2 for instance and the data lanes are 0, 1, 3, 4.
> 
> But at any rate before it was not specifically documented because I thought
> it was covered by the "see
> Documentation/devicetree/bindings/media/video-interfaces.txt" or de we need
> to duplicate that in every binding?

Then you should indeed have clock-lanes here as you need to know the
position of the clock lane. Most devices either just can make use of the
number of lanes or the order of the lanes is freely configurable (e.g. OMAP
3 ISP). The former group just needs data-lanes.

-- 
Regards,

Sakari Ailus
