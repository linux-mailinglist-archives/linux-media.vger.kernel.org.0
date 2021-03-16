Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B480733E039
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 22:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhCPVQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 17:16:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37558 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbhCPVQU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 17:16:20 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04270D8B;
        Tue, 16 Mar 2021 22:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615929378;
        bh=xm3Kv9nMX/YPl1bBvx3Pwh9fbYRq1xW4L9kBDammBsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g9w8R/9p1wjjTWuKC9tT7WZtyEah4e/KuGk+ocFiOhC6S+faX1wpb0RbrLiV9j8/h
         H2Ge9WGORhcVyLASVN8C89x13R5hxbHoOxRet1PM4F0hARWA0J/TeIFZHtAV0rtnGy
         kzG6ZqM3SvYSjnTWH6ogjeGDLXi79t434u5rruTQ=
Date:   Tue, 16 Mar 2021 23:15:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: media: video-interfaces: Use documented
 bindings in example
Message-ID: <YFEf/Xpqjxd994g9@pendragon.ideasonboard.com>
References: <20210316195100.3531414-1-robh@kernel.org>
 <YFEZhyZO+ePjS+fr@pendragon.ideasonboard.com>
 <CAL_JsqJdFf_yRLA-f8QmEC1g-Aq1k8Uh-AAOfiFDy8FhV_aOxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJdFf_yRLA-f8QmEC1g-Aq1k8Uh-AAOfiFDy8FhV_aOxg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Tue, Mar 16, 2021 at 03:09:10PM -0600, Rob Herring wrote:
> On Tue, Mar 16, 2021 at 2:48 PM Laurent Pinchart wrote:
> > On Tue, Mar 16, 2021 at 01:51:00PM -0600, Rob Herring wrote:
> > > The example in video-interfaces.yaml managed to use a bunch of undocumented
> > > bindings. Update the example to use real bindings (and ones with a schema).
> > >
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: linux-media@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  .../bindings/media/video-interfaces.yaml      | 75 ++++++++-----------
> > >  1 file changed, 33 insertions(+), 42 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > index 0a7a73fd59f2..f30b9b91717b 100644
> > > --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > > @@ -227,17 +227,12 @@ examples:
> > >    # only one of the following data pipelines can be active:
> > >    # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> > >    - |
> > > +    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/power/r8a7796-sysc.h>
> > > +
> > >      ceu@fe910000 {
> > > -        compatible = "renesas,sh-mobile-ceu";
> > >          reg = <0xfe910000 0xa0>;
> > > -        interrupts = <0x880>;
> > > -
> > > -        mclk: master_clock {
> > > -            compatible = "renesas,ceu-clock";
> > > -            #clock-cells = <1>;
> > > -            clock-frequency = <50000000>;  /* Max clock frequency */
> > > -            clock-output-names = "mclk";
> > > -        };
> > >
> > >          port {
> > >              #address-cells = <1>;
> > > @@ -271,18 +266,14 @@ examples:
> > >          #size-cells = <0>;
> > >
> > >          camera@21 {
> > > -            compatible = "ovti,ov772x";
> > > +            compatible = "ovti,ov7720";
> > >              reg = <0x21>;
> > > -            vddio-supply = <&regulator1>;
> > > -            vddcore-supply = <&regulator2>;
> > > -
> > > -            clock-frequency = <20000000>;
> > >              clocks = <&mclk 0>;
> > > -            clock-names = "xclk";
> > >
> > >              port {
> > >                  /* With 1 endpoint per port no need for addresses. */
> > >                  ov772x_1_1: endpoint {
> > > +                    bus-type = <5>;
> > >                      bus-width = <8>;
> > >                      remote-endpoint = <&ceu0_1>;
> > >                      hsync-active = <1>;
> > > @@ -295,48 +286,48 @@ examples:
> > >          };
> > >
> > >          camera@1a {
> > > -            compatible = "sony,imx074";
> > > +            compatible = "sony,imx334";
> > >              reg = <0x1a>;
> > > -            vddio-supply = <&regulator1>;
> > > -            vddcore-supply = <&regulator2>;
> > >
> > > -            clock-frequency = <30000000>;  /* Shared clock with ov772x_1 */
> > >              clocks = <&mclk 0>;
> > > -            clock-names = "sysclk";    /* Assuming this is the
> > > -                       name in the datasheet */
> > > +
> > >              port {
> > > -                imx074_1: endpoint {
> > > +                imx334_1: endpoint {
> > >                      clock-lanes = <0>;
> > >                      data-lanes = <1 2>;
> > > +                    link-frequencies = /bits/ 64 <891000000>;
> > >                      remote-endpoint = <&csi2_1>;
> > >                  };
> > >              };
> > >          };
> > >      };
> > >
> > > -    csi2: csi2@ffc90000 {
> > > -        compatible = "renesas,sh-mobile-csi2";
> > > -        reg = <0xffc90000 0x1000>;
> > > -        interrupts = <0x17a0>;
> > > -        #address-cells = <1>;
> > > -        #size-cells = <0>;
> > > +    csi2@fea80000 {
> > > +        compatible = "renesas,r8a7796-csi2";
> >
> > That's certainly better, but the r8a7796 doesn't have a CEU :-) It has a
> > VIN. Maybe we could copy the last example from renesas,vin.yaml to
> > replace the CEU ?
> 
> What about just removing the example here? It bothers me to have 2
> copies (maybe 3 with sensor schemas) of an example and we should have
> plenty of examples.

I'd be fine with that.

> On the flip side, it's nice to have this stand on its own. Another
> option would be just remove compatibles and make the example barebones
> with only what's defined in video-interfaces.yaml.

Abstract examples seem good in this context.

> But then it's not validated at all.

But this part isn't nice :-(

If we keep examples that use real bindings, they should match the real
hardware platforms. Other than that, I have no strong preference, it's
up to you.

-- 
Regards,

Laurent Pinchart
