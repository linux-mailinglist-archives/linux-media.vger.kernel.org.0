Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBE2210392
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 08:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgGAGDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 02:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGAGDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 02:03:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EC7C061755;
        Tue, 30 Jun 2020 23:03:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B120556;
        Wed,  1 Jul 2020 08:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593583432;
        bh=naXE3zIg5k6kDhcCHdIpnplNruV+dU9WPA06Q/zqCr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IppIhBkjuQQKoYOHNSl47fqCkVvM/QNktmdaKvAWwxQynYZpgo4YKhTEsa/pO6gRG
         lASyzidgcC9BTOI6QtBdr/ZoDA6H6zmk+pT+6ljqZRTGgKPXklKT8AFc6p9AQp/BHX
         oy4X8EQcGYBMU+gnHdC1PwZ5d6cm+Dc78u/iiIQk=
Date:   Wed, 1 Jul 2020 09:03:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: media: renesas,fcp: Convert binding
 to YAML
Message-ID: <20200701060349.GE5963@pendragon.ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-2-laurent.pinchart+renesas@ideasonboard.com>
 <20200630204918.GA2365286@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200630204918.GA2365286@oden.dyn.berto.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Jun 30, 2020 at 10:49:18PM +0200, Niklas Söderlund wrote:
> On 2020-06-21 03:47:27 +0300, Laurent Pinchart wrote:
> > Convert the Renesas R-Car FCP text binding to YAML.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Changes since v1:
> > 
> > - Simplify comments on compatible strings
> > - Update MAINTAINERS
> > ---
> >  .../devicetree/bindings/media/renesas,fcp.txt | 34 -----------
> >  .../bindings/media/renesas,fcp.yaml           | 56 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 57 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> > deleted file mode 100644
> > index 79c37395b396..000000000000
> > --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -Renesas R-Car Frame Compression Processor (FCP)
> > ------------------------------------------------
> > -
> > -The FCP is a companion module of video processing modules in the Renesas R-Car
> > -Gen3 and RZ/G2 SoCs. It provides data compression and decompression, data
> > -caching, and conversion of AXI transactions in order to reduce the memory
> > -bandwidth.
> > -
> > -There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and FCP
> > -for FDP (FCPF). Their configuration and behaviour depend on the module they
> > -are paired with. These DT bindings currently support the FCPV and FCPF.
> > -
> > - - compatible: Must be one or more of the following
> > -
> > -   - "renesas,fcpv" for generic compatible 'FCP for VSP'
> > -   - "renesas,fcpf" for generic compatible 'FCP for FDP'
> > -
> > - - reg: the register base and size for the device registers
> > - - clocks: Reference to the functional clock
> > -
> > -Optional properties:
> > - - power-domains : power-domain property defined with a power domain specifier
> > -		   to respective power domain.
> > -
> > -
> > -Device node example
> > --------------------
> > -
> > -	fcpvd1: fcp@fea2f000 {
> > -		compatible = "renesas,fcpv";
> > -		reg = <0 0xfea2f000 0 0x200>;
> > -		clocks = <&cpg CPG_MOD 602>;
> > -		power-domains = <&sysc R8A7795_PD_A3VP>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > new file mode 100644
> > index 000000000000..9241bf3c5efc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car Frame Compression Processor (FCP)
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +
> > +description: |
> > +  The FCP is a companion module of video processing modules in the Renesas
> > +  R-Car Gen3 and RZ/G2 SoCs. It provides data compression and decompression,
> > +  data caching, and conversion of AXI transactions in order to reduce the
> > +  memory bandwidth.
> > +
> > +  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and
> > +  FCP for FDP (FCPF). Their configuration and behaviour depend on the module
> > +  they are paired with. These DT bindings currently support the FCPV and FCPF.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,fcpv # FCP for VSP
> > +      - renesas,fcpf # FCP for FDP
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  # R8A7790 (R-Car H2) VSP1-S
> 
> Hum, R8A7790 is H2 but the example below is from H3 R8A7795[01] is it 
> not? With this fixed,

Absolutely. I don't know how it ended there. I'll fix this.

> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > +  - |
> > +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a7795-sysc.h>
> > +
> > +    fcp@fea2f000 {
> > +        compatible = "renesas,fcpv";
> > +        reg = <0xfea2f000 0x200>;
> > +        clocks = <&cpg CPG_MOD 602>;
> > +        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 68f21d46614c..660ed6606de2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10700,7 +10700,7 @@ L:	linux-media@vger.kernel.org
> >  L:	linux-renesas-soc@vger.kernel.org
> >  S:	Supported
> >  T:	git git://linuxtv.org/media_tree.git
> > -F:	Documentation/devicetree/bindings/media/renesas,fcp.txt
> > +F:	Documentation/devicetree/bindings/media/renesas,fcp.yaml
> >  F:	drivers/media/platform/rcar-fcp.c
> >  F:	include/media/rcar-fcp.h
> >  

-- 
Regards,

Laurent Pinchart
