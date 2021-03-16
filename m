Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B7133E00F
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 22:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbhCPVJ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 17:09:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231556AbhCPVJX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 17:09:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 008A264F9B;
        Tue, 16 Mar 2021 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615928963;
        bh=avaMIHx72RP9ZNnKycFdBrUWXnWNBwiuLsA7WclFLSg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hL+0zZQLRvgB8BMzv22B6HWeX+culxWAXI4xr9HR9d3FGkDb3AEpNupbChEp+OVE/
         69lkZNLwMp2DMb5HuV9o/Q9yQf/E9RS2ItUXeLX4TzRB2dJyQMe5JgKbHbSvLu4waW
         YVh5S6KcPJwkAPwus3Rj5lNtLfykzR7Ojhgu2kg/GwOkcEkjLev85k2gxSXsAM0+8s
         1ffSYE55RvRVVFxvEWal+LNDsoWPukclUV0HlytrN35FVp4DphUZ7iilP38HQ2Wy07
         HanbgxkD5QLiXEdNL0orfFuaXgpkTCOSBghmqAN/1CgcpZTgLrTRclx70Vp1Rnv6Jm
         yxmoxh8+LqF+g==
Received: by mail-qk1-f181.google.com with SMTP id d20so36831767qkc.2;
        Tue, 16 Mar 2021 14:09:22 -0700 (PDT)
X-Gm-Message-State: AOAM530NZmlzK7KkE/tRegjB/7FGZWvnOTL36Um6hiYbXZjExpzQEUL5
        I1QoZE3DCWTLbCK5A/ldzPTQ2F65UOGdSJAwGg==
X-Google-Smtp-Source: ABdhPJzUwFE/2dpfcP0CH/2O0Bme3HuUw8EojNThTxud4XxdUKO+98Zh4I4xbOnS237W4cfRsPECFxMIQ6/CEDxo73c=
X-Received: by 2002:a37:6592:: with SMTP id z140mr1096374qkb.464.1615928962215;
 Tue, 16 Mar 2021 14:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210316195100.3531414-1-robh@kernel.org> <YFEZhyZO+ePjS+fr@pendragon.ideasonboard.com>
In-Reply-To: <YFEZhyZO+ePjS+fr@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 16 Mar 2021 15:09:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJdFf_yRLA-f8QmEC1g-Aq1k8Uh-AAOfiFDy8FhV_aOxg@mail.gmail.com>
Message-ID: <CAL_JsqJdFf_yRLA-f8QmEC1g-Aq1k8Uh-AAOfiFDy8FhV_aOxg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: video-interfaces: Use documented
 bindings in example
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 16, 2021 at 2:48 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Tue, Mar 16, 2021 at 01:51:00PM -0600, Rob Herring wrote:
> > The example in video-interfaces.yaml managed to use a bunch of undocumented
> > bindings. Update the example to use real bindings (and ones with a schema).
> >
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/media/video-interfaces.yaml      | 75 ++++++++-----------
> >  1 file changed, 33 insertions(+), 42 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > index 0a7a73fd59f2..f30b9b91717b 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > @@ -227,17 +227,12 @@ examples:
> >    # only one of the following data pipelines can be active:
> >    # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> >    - |
> > +    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a7796-sysc.h>
> > +
> >      ceu@fe910000 {
> > -        compatible = "renesas,sh-mobile-ceu";
> >          reg = <0xfe910000 0xa0>;
> > -        interrupts = <0x880>;
> > -
> > -        mclk: master_clock {
> > -            compatible = "renesas,ceu-clock";
> > -            #clock-cells = <1>;
> > -            clock-frequency = <50000000>;  /* Max clock frequency */
> > -            clock-output-names = "mclk";
> > -        };
> >
> >          port {
> >              #address-cells = <1>;
> > @@ -271,18 +266,14 @@ examples:
> >          #size-cells = <0>;
> >
> >          camera@21 {
> > -            compatible = "ovti,ov772x";
> > +            compatible = "ovti,ov7720";
> >              reg = <0x21>;
> > -            vddio-supply = <&regulator1>;
> > -            vddcore-supply = <&regulator2>;
> > -
> > -            clock-frequency = <20000000>;
> >              clocks = <&mclk 0>;
> > -            clock-names = "xclk";
> >
> >              port {
> >                  /* With 1 endpoint per port no need for addresses. */
> >                  ov772x_1_1: endpoint {
> > +                    bus-type = <5>;
> >                      bus-width = <8>;
> >                      remote-endpoint = <&ceu0_1>;
> >                      hsync-active = <1>;
> > @@ -295,48 +286,48 @@ examples:
> >          };
> >
> >          camera@1a {
> > -            compatible = "sony,imx074";
> > +            compatible = "sony,imx334";
> >              reg = <0x1a>;
> > -            vddio-supply = <&regulator1>;
> > -            vddcore-supply = <&regulator2>;
> >
> > -            clock-frequency = <30000000>;  /* Shared clock with ov772x_1 */
> >              clocks = <&mclk 0>;
> > -            clock-names = "sysclk";    /* Assuming this is the
> > -                       name in the datasheet */
> > +
> >              port {
> > -                imx074_1: endpoint {
> > +                imx334_1: endpoint {
> >                      clock-lanes = <0>;
> >                      data-lanes = <1 2>;
> > +                    link-frequencies = /bits/ 64 <891000000>;
> >                      remote-endpoint = <&csi2_1>;
> >                  };
> >              };
> >          };
> >      };
> >
> > -    csi2: csi2@ffc90000 {
> > -        compatible = "renesas,sh-mobile-csi2";
> > -        reg = <0xffc90000 0x1000>;
> > -        interrupts = <0x17a0>;
> > -        #address-cells = <1>;
> > -        #size-cells = <0>;
> > +    csi2@fea80000 {
> > +        compatible = "renesas,r8a7796-csi2";
>
> That's certainly better, but the r8a7796 doesn't have a CEU :-) It has a
> VIN. Maybe we could copy the last example from renesas,vin.yaml to
> replace the CEU ?

What about just removing the example here? It bothers me to have 2
copies (maybe 3 with sensor schemas) of an example and we should have
plenty of examples. On the flip side, it's nice to have this stand on
its own. Another option would be just remove compatibles and make the
example barebones with only what's defined in video-interfaces.yaml.
But then it's not validated at all.

Rob
