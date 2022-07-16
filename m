Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0786F576FA4
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 17:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiGPPMl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 11:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiGPPMk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 11:12:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C4117594;
        Sat, 16 Jul 2022 08:12:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 363A06E0;
        Sat, 16 Jul 2022 17:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657984357;
        bh=SqADCWXFXONCpdgY4hl/8v2eC4vqPseH2e03h4BzIGc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kc1Z777CWxCl6R7vhj65BdU7ssL5ud6tNDIZ5QTwIvI/XPyaTvJKzKSq0M5OCEnef
         67METLL9IEJdIgQpHpeJvl6OYObQVF2gOi1VeS2Ef6g6X9WllHJgmmwoYffDnJ8ZTj
         z8NuPL4uxZQG//WHKN5PM28iWDIZ1Nkp6YDphcnA=
Date:   Sat, 16 Jul 2022 18:12:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <YtLVRclLA4Jkk5i2@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-3-laurent.pinchart@ideasonboard.com>
 <YtKEzS6j0/45E7tP@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YtKEzS6j0/45E7tP@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Jul 16, 2022 at 12:28:45PM +0300, Sakari Ailus wrote:
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
> 
> The definition doesn't seem to be used here. Is there a need to include
> this?

There was, but the change that added bus-type to this binding got
reverted in commit 979452fbc430 ("dt-bindings: drm/bridge: anx7625:
Revert DPI support") and I forgot to drop the header when rebasing.

> I could drop this chunk while applying. There's just one trivial change
> elsewhere in this patch to make.

Please do :-)

-- 
Regards,

Laurent Pinchart
