Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2A72908F8
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 17:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410478AbgJPPzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 11:55:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42215 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408799AbgJPPzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 11:55:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id 65so2818872otu.9;
        Fri, 16 Oct 2020 08:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Ez8CC1zWtrfiNp8XEXa9lgUhVSM8GoPykiMmK2kDQo=;
        b=BiijRR4hIENCQmXMG2KCB5LYAcsT4kFMOvY8USlJfegWiNh7A+oZ+SB+3ITSUGIhH6
         E0FYHyyUI87z4zHYzj4WhaMo8Lp7HVXz8uIfZ0nZd/oXpJTSJI9Gj3+wXU4Ycro42+gw
         OOozTnnqy93q9XPnVqLESPBDky1PJrohppaGuFQNNomZjAjvXBRpb6VVmklfPFVItwLt
         0M+omGa1qpvs06f2rKWPvswb/nR2elLp4us8BV3Ur3/4LWeQqdUDUB8GIaabQqc5+QI4
         9hC2FUHvaIIbvFTJBW0Tq9fZYZAfCagAi9JzpMIdQIQ2ZmHqCdC2pdB+YFL9wWQ9FwRk
         Oo3Q==
X-Gm-Message-State: AOAM531snpa0UKicTD/ZH83PdRdCM5HG2AOcBknvyoAFWU+tWRuEuiU9
        PX2DKJkejtIjTynb2awQpw==
X-Google-Smtp-Source: ABdhPJz+IerI5d7lXT42c2ORwBHcv21/DYUgbbNNBcNWL6ME2VKukKGO7g/qHIz5BgdbQxG08G+m9A==
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr3258056otq.77.1602863747644;
        Fri, 16 Oct 2020 08:55:47 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h25sm1064530otj.41.2020.10.16.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 08:55:47 -0700 (PDT)
Received: (nullmailer pid 1483632 invoked by uid 1000);
        Fri, 16 Oct 2020 15:55:46 -0000
Date:   Fri, 16 Oct 2020 10:55:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Message-ID: <20201016155546.GB1474949@bogus>
References: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
 <20201014155719.15120-3-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014155719.15120-3-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14, 2020 at 04:57:16PM +0100, Fabrizio Castro wrote:
> Convert the Renesas DRIF bindings to DT schema and update
> MAINTAINERS accordingly.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
> * Replace "if" statement with "else" statement for the branch
>   rejecting pinctrl-0 and pinctrl-names properties, as suggested
>   by Geert
> v2->v3:
> * Removed the definition of pinctrl-0 and pinctrl-names, as
>   suggested by Geert
> * Added "power-domains" to the list of required properties,
>   as suggested by Geert
> v1->v2:
> * s/controller/Controller/ in the title of renesas,drif.yaml
>   as suggested by Laurent.
> 
>  .../bindings/media/renesas,drif.txt           | 177 -----------
>  .../bindings/media/renesas,drif.yaml          | 277 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 278 insertions(+), 178 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt b/Documentation/devicetree/bindings/media/renesas,drif.txt
> deleted file mode 100644
> index 0d8974aa8b38..000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,drif.txt
> +++ /dev/null
> @@ -1,177 +0,0 @@
> -Renesas R-Car Gen3 Digital Radio Interface controller (DRIF)
> -------------------------------------------------------------
> -
> -R-Car Gen3 DRIF is a SPI like receive only slave device. A general
> -representation of DRIF interfacing with a master device is shown below.
> -
> -+---------------------+                +---------------------+
> -|                     |-----SCK------->|CLK                  |
> -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> -|                     |-----SD0------->|D0                   |
> -|                     |-----SD1------->|D1                   |
> -+---------------------+                +---------------------+
> -
> -As per datasheet, each DRIF channel (drifn) is made up of two internal
> -channels (drifn0 & drifn1). These two internal channels share the common
> -CLK & SYNC. Each internal channel has its own dedicated resources like
> -irq, dma channels, address space & clock. This internal split is not
> -visible to the external master device.
> -
> -The device tree model represents each internal channel as a separate node.
> -The internal channels sharing the CLK & SYNC are tied together by their
> -phandles using a property called "renesas,bonding". For the rest of
> -the documentation, unless explicitly stated, the word channel implies an
> -internal channel.
> -
> -When both internal channels are enabled they need to be managed together
> -as one (i.e.) they cannot operate alone as independent devices. Out of the
> -two, one of them needs to act as a primary device that accepts common
> -properties of both the internal channels. This channel is identified by a
> -property called "renesas,primary-bond".
> -
> -To summarize,
> -   - When both the internal channels that are bonded together are enabled,
> -     the zeroth channel is selected as primary-bond. This channels accepts
> -     properties common to all the members of the bond.
> -   - When only one of the bonded channels need to be enabled, the property
> -     "renesas,bonding" or "renesas,primary-bond" will have no effect. That
> -     enabled channel can act alone as any other independent device.
> -
> -Required properties of an internal channel:
> --------------------------------------------
> -- compatible:	"renesas,r8a7795-drif" if DRIF controller is a part of R8A7795 SoC.
> -		"renesas,r8a7796-drif" if DRIF controller is a part of R8A7796 SoC.
> -		"renesas,rcar-gen3-drif" for a generic R-Car Gen3 compatible device.
> -
> -		When compatible with the generic version, nodes must list the
> -		SoC-specific version corresponding to the platform first
> -		followed by the generic version.
> -
> -- reg: offset and length of that channel.
> -- interrupts: associated with that channel.
> -- clocks: phandle and clock specifier of that channel.
> -- clock-names: clock input name string: "fck".
> -- dmas: phandles to the DMA channels.
> -- dma-names: names of the DMA channel: "rx".
> -- renesas,bonding: phandle to the other channel.
> -
> -Optional properties of an internal channel:
> --------------------------------------------
> -- power-domains: phandle to the respective power domain.
> -
> -Required properties of an internal channel when:
> -	- It is the only enabled channel of the bond (or)
> -	- If it acts as primary among enabled bonds
> ---------------------------------------------------------
> -- pinctrl-0: pin control group to be used for this channel.
> -- pinctrl-names: must be "default".
> -- renesas,primary-bond: empty property indicating the channel acts as primary
> -			among the bonded channels.
> -- port: child port node corresponding to the data input, in accordance with
> -	the video interface bindings defined in
> -	Documentation/devicetree/bindings/media/video-interfaces.txt. The port
> -	node must contain at least one endpoint.
> -
> -Optional endpoint property:
> ----------------------------
> -- sync-active: Indicates sync signal polarity, 0/1 for low/high respectively.
> -	       This property maps to SYNCAC bit in the hardware manual. The
> -	       default is 1 (active high).
> -
> -Example:
> ---------
> -
> -(1) Both internal channels enabled:
> ------------------------------------
> -
> -When interfacing with a third party tuner device with two data pins as shown
> -below.
> -
> -+---------------------+                +---------------------+
> -|                     |-----SCK------->|CLK                  |
> -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> -|                     |-----SD0------->|D0                   |
> -|                     |-----SD1------->|D1                   |
> -+---------------------+                +---------------------+
> -
> -	drif00: rif@e6f40000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f40000 0 0x64>;
> -		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 515>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x20>, <&dmac2 0x20>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif01>;
> -		renesas,primary-bond;
> -		pinctrl-0 = <&drif0_pins>;
> -		pinctrl-names = "default";
> -		port {
> -			drif0_ep: endpoint {
> -			     remote-endpoint = <&tuner_ep>;
> -			};
> -		};
> -	};
> -
> -	drif01: rif@e6f50000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f50000 0 0x64>;
> -		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 514>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x22>, <&dmac2 0x22>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif00>;
> -	};
> -
> -
> -(2) Internal channel 1 alone is enabled:
> -----------------------------------------
> -
> -When interfacing with a third party tuner device with one data pin as shown
> -below.
> -
> -+---------------------+                +---------------------+
> -|                     |-----SCK------->|CLK                  |
> -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> -|                     |                |D0 (unused)          |
> -|                     |-----SD-------->|D1                   |
> -+---------------------+                +---------------------+
> -
> -	drif00: rif@e6f40000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f40000 0 0x64>;
> -		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 515>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x20>, <&dmac2 0x20>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif01>;
> -	};
> -
> -	drif01: rif@e6f50000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f50000 0 0x64>;
> -		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 514>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x22>, <&dmac2 0x22>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif00>;
> -		pinctrl-0 = <&drif0_pins>;
> -		pinctrl-names = "default";
> -		port {
> -			drif0_ep: endpoint {
> -			     remote-endpoint = <&tuner_ep>;
> -			     sync-active = <0>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> new file mode 100644
> index 000000000000..3832ce837553
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -0,0 +1,277 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,drif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Gen3 Digital Radio Interface Controller (DRIF)
> +
> +maintainers:
> +  - Ramesh Shanmugasundaram <rashanmu@gmail.com>
> +  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> +
> +description: |
> +  R-Car Gen3 DRIF is a SPI like receive only slave device. A general
> +  representation of DRIF interfacing with a master device is shown below.
> +
> +  +---------------------+                +---------------------+
> +  |                     |-----SCK------->|CLK                  |
> +  |       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> +  |                     |-----SD0------->|D0                   |
> +  |                     |-----SD1------->|D1                   |
> +  +---------------------+                +---------------------+
> +
> +  As per datasheet, each DRIF channel (drifn) is made up of two internal
> +  channels (drifn0 & drifn1). These two internal channels share the common
> +  CLK & SYNC. Each internal channel has its own dedicated resources like
> +  irq, dma channels, address space & clock. This internal split is not
> +  visible to the external master device.
> +
> +  The device tree model represents each internal channel as a separate node.
> +  The internal channels sharing the CLK & SYNC are tied together by their
> +  phandles using a property called "renesas,bonding". For the rest of
> +  the documentation, unless explicitly stated, the word channel implies an
> +  internal channel.
> +
> +  When both internal channels are enabled they need to be managed together
> +  as one (i.e.) they cannot operate alone as independent devices. Out of the
> +  two, one of them needs to act as a primary device that accepts common
> +  properties of both the internal channels. This channel is identified by a
> +  property called "renesas,primary-bond".
> +
> +  To summarize,
> +     * When both the internal channels that are bonded together are enabled,
> +       the zeroth channel is selected as primary-bond. This channels accepts
> +       properties common to all the members of the bond.
> +     * When only one of the bonded channels need to be enabled, the property
> +       "renesas,bonding" or "renesas,primary-bond" will have no effect. That
> +       enabled channel can act alone as any other independent device.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a7795-drif        # R-Car H3
> +        - renesas,r8a7796-drif        # R-Car M3-W

Note the bot error is from yamllint which just got added to the checks. 
Need 2 more spaces indent here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
