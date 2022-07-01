Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099A1562FB4
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 11:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbiGAJTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 05:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbiGAJTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 05:19:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E643451B2B
        for <linux-media@vger.kernel.org>; Fri,  1 Jul 2022 02:19:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E91025C;
        Fri,  1 Jul 2022 11:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656667168;
        bh=PiwUbyUV4xv77mPNNleUvrhzAfhgzSm779hMBHQ+4Gg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RiEXrSsWz0vix7wNf+yys2R/x1h13eceuCys6fj5t5lAhhu5jNftyK0bC4LuhdCOe
         +Tu/z/P72YCiYjCsZwtygPEaRLAr41uxYTkDFXWKG3jtv4ymXqbH4uiXzst9oxO67r
         XzMNgrns7ZJkZx+hlqFiINQkl4r8WXb5DQqIK/ls=
Date:   Fri, 1 Jul 2022 12:19:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 43/55] dt-bindings: media: rkisp1: Add port for parallel
 interface
Message-ID: <Yr68C1T5Pai8m/O+@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-44-paul.elder@ideasonboard.com>
 <20220701052222.a7rtl5hivr4oy7bk@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220701052222.a7rtl5hivr4oy7bk@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, Jul 01, 2022 at 08:22:22AM +0300, Dafna Hirschfeld wrote:
> On 15.06.2022 04:11, Paul Elder wrote:
> > The rkisp1 can take an input on the parallel interface. Add a port for
> > it, and update the required field. At least one port is required, and
> > both may be specified.
> >
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  .../bindings/media/rockchip-isp1.yaml         | 23 +++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> > index d1489b177331..b3661d7d4357 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> > @@ -84,8 +84,27 @@ properties:
> >                  minItems: 1
> >                  maxItems: 4
> > 
> > -    required:
> > -      - port@0
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: connection point for input on the parallel interface
> > +
> > +        properties:
> > +          bus-type:
> > +            enum: [5, 6]
> > +
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +        required:
> > +          - bus-type
> > +
> > +    anyOf:
> > +      - required:
> > +          - port@0
> > +      - required:
> > +          - port@1
> > 
> >  required:
> >    - compatible
> 
> Could be nice to add an example

I don't have a real-life example of a parallel sensor connected to a
RK3399, but the i.MX8MP connects its CSI-2 receiver to the parallel
input of the ISP. I'll add an example to the other DT bindings patch
that adds the compatible string for the i.MX8MP, is that OK ?

-- 
Regards,

Laurent Pinchart
