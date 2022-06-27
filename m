Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4BC455C588
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241930AbiF0Xkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 19:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240648AbiF0Xka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 19:40:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2172E0C4;
        Mon, 27 Jun 2022 16:40:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5863780A;
        Tue, 28 Jun 2022 01:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656373226;
        bh=ky/viucxiskD+bFylsi9jU8955XtaL3vp60t3N60WNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GIY5sshJ5aUx4NOssHVCOZVk4xwftdzL5vkzsA+Jam0T6cQ9Hr5UhAHLTO/exMVLG
         6OUgDQ42M0ukqfRJFUehjafYqErwhpSACElM88AiAeC1PAfJzO5DTu5OiIPAevykSg
         G+te5Jm4VHURzBbyIjin3766YsTBEsmhT0wc2o2s=
Date:   Tue, 28 Jun 2022 02:40:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: Use new video interface bus type
 macros in examples
Message-ID: <Yro/1z/8He/8oC84@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-3-laurent.pinchart@ideasonboard.com>
 <20220627221608.GA3060504-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627221608.GA3060504-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Mon, Jun 27, 2022 at 04:16:08PM -0600, Rob Herring wrote:
> On Thu, Jun 16, 2022 at 01:14:06AM +0300, Laurent Pinchart wrote:
> > Now that a header exists with macros for the media interface bus-type
> > values, replace hardcoding numerical constants with the corresponding
> > macros in the DT binding examples.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Go back to PARALLEL
> > 
> > Changes since v1:
> > 
> > - Rename PARALLEL to BT601
> > ---
> >  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 1 +
> >  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ++-
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml  | 3 ++-
> >  .../devicetree/bindings/media/marvell,mmp2-ccic.yaml          | 3 ++-
> >  Documentation/devicetree/bindings/media/microchip,xisc.yaml   | 3 ++-
> >  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 +++-
> >  6 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 35a48515836e..b0e5585f93e2 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -118,6 +118,7 @@ additionalProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >  
> >      i2c0 {
> >          #address-cells = <1>;
> > diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > index 39395ea8c318..edde4201116f 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > @@ -104,6 +104,7 @@ additionalProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >  
> >      i2c2 {
> >          #address-cells = <1>;
> > @@ -124,7 +125,7 @@ examples:
> >                      remote-endpoint = <&csi2a_ep>;
> >                      link-frequencies = /bits/ 64 <199200000 210000000
> >                                                    499200000>;
> > -                    bus-type = <4>;
> > +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> >                  };
> >              };
> >          };
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > index 44529425ce3a..161e6d598e1c 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > @@ -105,6 +105,7 @@ additionalProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >  
> >      i2c0 {
> >          #address-cells = <1>;
> > @@ -118,7 +119,7 @@ examples:
> >  
> >              port {
> >                  ov772x_0: endpoint {
> > -                    bus-type = <5>;
> > +                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> >                      vsync-active = <0>;
> >                      hsync-active = <0>;
> >                      pclk-sample = <0>;
> > diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > index b39b84c5f012..0e3478551e13 100644
> > --- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > +++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > @@ -68,6 +68,7 @@ additionalProperties: false
> >  examples:
> >    - |
> >      #include <dt-bindings/clock/marvell,mmp2.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >      #include <dt-bindings/power/marvell,mmp2.h>
> >  
> >      camera@d420a000 {
> > @@ -83,7 +84,7 @@ examples:
> >        port {
> >          camera0_0: endpoint {
> >            remote-endpoint = <&ov7670_0>;
> > -          bus-type = <5>;      /* Parallel */
> > +          bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> >            hsync-active = <1>;  /* Active high */
> >            vsync-active = <1>;  /* Active high */
> >            pclk-sample = <0>;   /* Falling */
> > diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
> > index 8b37fccab5e2..25f5f79d40ce 100644
> > --- a/Documentation/devicetree/bindings/media/microchip,xisc.yaml
> > +++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
> > @@ -106,6 +106,7 @@ examples:
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> >      #include <dt-bindings/clock/at91.h>
> >      #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >  
> >      xisc: xisc@e1408000 {
> >          compatible = "microchip,sama7g5-isc";
> > @@ -118,7 +119,7 @@ examples:
> >  
> >          port {
> >                  xisc_in: endpoint {
> > -                       bus-type = <5>; /* Parallel */
> > +                       bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> >                         remote-endpoint = <&csi2dc_out>;
> >                         hsync-active = <1>;
> >                         vsync-active = <1>;
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > index 9c1262a276b5..285c6075950a 100644
> > --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> > @@ -90,7 +90,9 @@ examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/arm-gic.h>
> >      #include <dt-bindings/clock/stm32mp1-clks.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> >      #include <dt-bindings/reset/stm32mp1-resets.h>
> > +    #
> 
> ?

Oops. I'll blame vim :-) I wonder why I didn't catch that when running
validation. I'll fix it in any case.

> In any case,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> >      dcmi: dcmi@4c006000 {
> >          compatible = "st,stm32-dcmi";
> >          reg = <0x4c006000 0x400>;
> > @@ -104,7 +106,7 @@ examples:
> >          port {
> >               dcmi_0: endpoint {
> >                     remote-endpoint = <&ov5640_0>;
> > -                   bus-type = <5>;
> > +                   bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
> >                     bus-width = <8>;
> >                     hsync-active = <0>;
> >                     vsync-active = <0>;

-- 
Regards,

Laurent Pinchart
