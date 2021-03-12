Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE913339146
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 16:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhCLPaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 10:30:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:53192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232109AbhCLP3p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 10:29:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD05565005;
        Fri, 12 Mar 2021 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615562985;
        bh=rKgdQYESel3XklV9o+UMlPn+Zcemc7VrYjrJgoVlgfc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a8gDGN7iu91HdPfgLtYk+3i4nyaVlDKQKpJMzQX+bEKoS31Z3OWOJvOtGn/5YNdYT
         exwgdpig6T9WBdlFQ5OQ/H7knKN6AHmgZsUBJD/u5dy1CfloHtzkndfGbD/avViJao
         FGFtjpTr86XTL6Mpu2WRNQDDLBMTWQlbYzkgiyNaeTMv/7UgTRgJTAQuZLQpx6H2Ce
         77aCMmaHl6bxmmuifG9lbFdJLrcKOG5NbEVpTrIqExv1rqyMYJgTh/+deeuByoE9rS
         1EdkmyhBHutrR+kmOxdK1R89y+8mb3LC9WLla0WpkszPr/ifNAgMvzRLMH0I1PdPZA
         f9JOYPGD1Om0A==
Received: by mail-ed1-f49.google.com with SMTP id h10so8502136edt.13;
        Fri, 12 Mar 2021 07:29:44 -0800 (PST)
X-Gm-Message-State: AOAM531K5lzESyT5vX3fxwB7l579KbI4Pr7TG2/3D9eSQgRcV7kI7GPU
        LYRznwJ1BD4mKjyy1ad2jR8TZ9xGOh9qDq1ysQ==
X-Google-Smtp-Source: ABdhPJyclz/73OOg6sTfoXE8LGotbn7gLdaHa7SA11t9mp1PeD9dyWTsowBtpTGNe+EQQDxCwpjFRYIWTkrVv4Omavo=
X-Received: by 2002:a05:6402:c88:: with SMTP id cm8mr14759440edb.62.1615562983294;
 Fri, 12 Mar 2021 07:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20210311234042.1588310-1-robh@kernel.org> <YErC9/zxKKRXaj+m@pendragon.ideasonboard.com>
In-Reply-To: <YErC9/zxKKRXaj+m@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 12 Mar 2021 08:29:30 -0700
X-Gmail-Original-Message-ID: <CAL_JsqK7cnwjdBSvgy+j_2_5gNCwL0C9j+VYBYEtjSKZm=Ar-w@mail.gmail.com>
Message-ID: <CAL_JsqK7cnwjdBSvgy+j_2_5gNCwL0C9j+VYBYEtjSKZm=Ar-w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Convert video-mux to DT schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 11, 2021 at 6:25 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
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
> > -     mux: mux-controller {
> > -             compatible = "gpio-mux";
> > -             #mux-control-cells = <0>;
> > -
> > -             mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
> > -     };
> > -
> > -     video-mux {
> > -             compatible = "video-mux";
> > -             mux-controls = <&mux>;
> > -             #address-cells = <1>;
> > -             #size-cells = <0>;
> > -
> > -             port@0 {
> > -                     reg = <0>;
> > -
> > -                     mux_in0: endpoint {
> > -                             remote-endpoint = <&video_source0_out>;
> > -                     };
> > -             };
> > -
> > -             port@1 {
> > -                     reg = <1>;
> > -
> > -                     mux_in1: endpoint {
> > -                             remote-endpoint = <&video_source1_out>;
> > -                     };
> > -             };
> > -
> > -             port@2 {
> > -                     reg = <2>;
> > -
> > -                     mux_out: endpoint {
> > -                             remote-endpoint = <&capture_interface_in>;
> > -                     };
> > -             };
> > -     };
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

Is the numbering defined to be 0-N or it's defined by the mux values?
Even if the former case, a port could be missing if the input is not
hooked up.

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

I kind of figured missing mux entries in a mux node was obvious
enough. Though given the above, I don't think we can.

Also, we don't have any users with 'ports', so I debated doing away
with that. Supporting either way is kind of pointless.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,
Rob
