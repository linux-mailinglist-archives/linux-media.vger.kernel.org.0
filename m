Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAE433915E
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 16:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhCLPdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 10:33:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:54826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231216AbhCLPdY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 10:33:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 526286500C;
        Fri, 12 Mar 2021 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615563204;
        bh=+TAW0rBW2YFKaxo9tvJscUnMty2CeXSMOzySCYAzHbM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jrIrYwuEHy+ntTfrdbcsWgCVd7+yzRXYGH7qCATHMmGAh2f19/a1lzTYJlLBWqGqD
         soDQqvUbv6vjKwjKsvAnUXtyH+ertroafDKRiS2dx3jSusEw8Dm7ycodpOKymkeChC
         PdNF9eCBEEeZ6SSC03aJ4PB3oNZWt1R01O14axt00mpH5OiXPrMoJA+5LmJHNQCYXF
         EBTma9qGdnq5yw8cP4OWDdhlL3KiBnA1EZYpAHxKWN0KtHkYvnr8VlBmhyGc1t4MN1
         NwNy91lv4Nf36STrL1qyvLzcbPF2VLjikyvOFgTk5aTZtJPVmcH6y36o7S1ewmcfiP
         O9C2tNhW7f8Sg==
Received: by mail-ej1-f52.google.com with SMTP id ox4so38522122ejb.11;
        Fri, 12 Mar 2021 07:33:24 -0800 (PST)
X-Gm-Message-State: AOAM532Fha1iqWg+uOePu5J3s9assaOCiGiBIu//Dd9uaDjq6k72SXNS
        IYgWBDjvBTnjkE7ZzUkoonmul7oojdstwbtsaA==
X-Google-Smtp-Source: ABdhPJyyVfOi3INPzehSR81z7hevZGgRNuJQhdf5Z4ed48FqMZOeu+Fc1XawWSQBQE4/aI0vl6qCmRo8dVwlUX8NJlk=
X-Received: by 2002:a17:906:1d44:: with SMTP id o4mr8540950ejh.130.1615563202964;
 Fri, 12 Mar 2021 07:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20210311234042.1588310-1-robh@kernel.org> <YErC9/zxKKRXaj+m@pendragon.ideasonboard.com>
 <20210312072904.GA3@paasikivi.fi.intel.com> <YEs8+EOc/k7U2pGp@pendragon.ideasonboard.com>
In-Reply-To: <YEs8+EOc/k7U2pGp@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 12 Mar 2021 08:33:06 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+1dAMBEvONwJscAwvExCqJo9P6RMtoJ31EgybbjUnQ0A@mail.gmail.com>
Message-ID: <CAL_Jsq+1dAMBEvONwJscAwvExCqJo9P6RMtoJ31EgybbjUnQ0A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Convert video-mux to DT schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 12, 2021 at 3:06 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Sakari,
>
> On Fri, Mar 12, 2021 at 09:29:04AM +0200, Sakari Ailus wrote:
> > On Fri, Mar 12, 2021 at 03:25:11AM +0200, Laurent Pinchart wrote:
> > > On Thu, Mar 11, 2021 at 04:40:42PM -0700, Rob Herring wrote:
> > > > Now that we have the graph schema, convert the video-mux binding to DT
> > > > schema.
> > > >
> > > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > Cc: linux-media@vger.kernel.org
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/media/video-mux.txt   | 60 ------------
> > > >  .../devicetree/bindings/media/video-mux.yaml  | 93 +++++++++++++++++++
> > > >  2 files changed, 93 insertions(+), 60 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/media/video-mux.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/media/video-mux.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/video-mux.txt b/Documentation/devicetree/bindings/media/video-mux.txt
> > > > deleted file mode 100644
> > > > index 63b9dc913e45..000000000000
> > > > --- a/Documentation/devicetree/bindings/media/video-mux.txt
> > > > +++ /dev/null
> > > > @@ -1,60 +0,0 @@
> > > > -Video Multiplexer
> > > > -=================
> > > > -
> > > > -Video multiplexers allow to select between multiple input ports. Video received
> > > > -on the active input port is passed through to the output port. Muxes described
> > > > -by this binding are controlled by a multiplexer controller that is described by
> > > > -the bindings in Documentation/devicetree/bindings/mux/mux-controller.txt
> > > > -
> > > > -Required properties:
> > > > -- compatible : should be "video-mux"
> > > > -- mux-controls : mux controller node to use for operating the mux
> > > > -- #address-cells: should be <1>
> > > > -- #size-cells: should be <0>
> > > > -- port@*: at least three port nodes containing endpoints connecting to the
> > > > -  source and sink devices according to of_graph bindings. The last port is
> > > > -  the output port, all others are inputs.
> > > > -
> > > > -Optionally, #address-cells, #size-cells, and port nodes can be grouped under a
> > > > -ports node as described in Documentation/devicetree/bindings/graph.txt.
> > > > -
> > > > -Example:
> > > > -
> > > > - mux: mux-controller {
> > > > -         compatible = "gpio-mux";
> > > > -         #mux-control-cells = <0>;
> > > > -
> > > > -         mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> > > > - };
> > > > -
> > > > - video-mux {
> > > > -         compatible = "video-mux";
> > > > -         mux-controls = <&mux>;
> > > > -         #address-cells = <1>;
> > > > -         #size-cells = <0>;
> > > > -
> > > > -         port@0 {
> > > > -                 reg = <0>;
> > > > -
> > > > -                 mux_in0: endpoint {
> > > > -                         remote-endpoint = <&video_source0_out>;
> > > > -                 };
> > > > -         };
> > > > -
> > > > -         port@1 {
> > > > -                 reg = <1>;
> > > > -
> > > > -                 mux_in1: endpoint {
> > > > -                         remote-endpoint = <&video_source1_out>;
> > > > -                 };
> > > > -         };
> > > > -
> > > > -         port@2 {
> > > > -                 reg = <2>;
> > > > -
> > > > -                 mux_out: endpoint {
> > > > -                         remote-endpoint = <&capture_interface_in>;
> > > > -                 };
> > > > -         };
> > > > - };
> > > > -};
> > > > diff --git a/Documentation/devicetree/bindings/media/video-mux.yaml b/Documentation/devicetree/bindings/media/video-mux.yaml
> > > > new file mode 100644
> > > > index 000000000000..780fbbd46a38
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/video-mux.yaml
> > > > @@ -0,0 +1,93 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/video-mux.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Video Multiplexer
> > > > +
> > > > +maintainers:
> > > > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > +
> > > > +description:
> > > > +  Video multiplexers allow to select between multiple input ports. Video
> > > > +  received on the active input port is passed through to the output port. Muxes
> > > > +  described by this binding are controlled by a multiplexer controller.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: video-mux
> > > > +
> > > > +  mux-controls:
> > > > +    maxItems: 1
> > > > +
> > > > +  '#address-cells':
> > > > +    const: 1
> > > > +
> > > > +  '#size-cells':
> > > > +    const: 0
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    patternProperties:
> > > > +      '^port@':
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > >
> > > Should we require at least port@0, port@1 and port@2 ?
> > >
> > > > +
> > > > +patternProperties:
> > > > +  '^port@':
> > > > +    $ref: /schemas/graph.yaml#/properties/port
> > > > +    description:
> > > > +      At least three port nodes containing endpoints connecting to the source
> > > > +      and sink devices according to of_graph bindings. The last port is the
> > > > +      output port, all others are inputs.
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - mux-controls
> > >
> > > Should a constraint be added to ensure that either a ports node or
> > > port@0, port@1 and port@2 nodes exists ?
> >
> > It's not meaningful to have this device without such nodes. But a mux with
> > more ports could be connected in a way that leaves one or both of ports 1
> > and 2 unconnected. It's still not a likely configuration but a possible
> > one.
>
> Those ports wouldn't be connected, but they could still exist in DT.

Could or must? I think we could have both cases. If there's never a
connection on a board no point in having the node there. If there's a
possible connection (via a connector and overlay), then we may want
the node.

Rob
