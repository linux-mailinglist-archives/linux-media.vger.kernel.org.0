Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4BF24E481
	for <lists+linux-media@lfdr.de>; Sat, 22 Aug 2020 03:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgHVBgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 21:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgHVBgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 21:36:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433D1C061573;
        Fri, 21 Aug 2020 18:36:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55ED629E;
        Sat, 22 Aug 2020 03:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598060176;
        bh=QDNGF3NmwLXJQKvrzC4omNcWs6Mrszdv+yYWd/Dv/Dw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p1PQJNuUaGl76WmEz4RoRcK5xhuL8c0rjIQ/kO9DBiEOfN69buNLPhtuDOrKtFbf3
         JcPaaZs0yVGO6pB5BEbxmcSgyGdY9PjsoQBgVZ/AdXOj6Vd2Q+TCMnDe8iDYRwVZAg
         ZWmq0sjFObr4sZ6wYQnrEMKBUjjTuWLDo0vj4LfI=
Date:   Sat, 22 Aug 2020 04:35:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: media: ov772x: Document endpoint props
Message-ID: <20200822013558.GN5967@pendragon.ideasonboard.com>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-4-jacopo+renesas@jmondi.org>
 <20200819135423.GL6049@pendragon.ideasonboard.com>
 <CA+V-a8sxDJXrGM-MYEwNS=D-eyA6oTRvDU3YT7Uu5Ph5kFh15w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8sxDJXrGM-MYEwNS=D-eyA6oTRvDU3YT7Uu5Ph5kFh15w@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Aug 21, 2020 at 12:37:35PM +0100, Lad, Prabhakar wrote:
> On Wed, Aug 19, 2020 at 2:54 PM Laurent Pinchart wrote:
> > On Tue, Aug 18, 2020 at 02:20:12PM +0200, Jacopo Mondi wrote:
> > > Document endpoint properties for the parallel bus type and
> > > add them to the example.
> > >
> > > Specify a few constraints:
> > > - If the bus type is BT.656 no hsync or vsycn polarities can be
> > >   specified.
> > > - If the bus width is 10 bits, not data-shift can be applied.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/ov772x.yaml | 43 +++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > index 75dad40f70cc..3fad5dffd19a 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > @@ -50,9 +50,47 @@ properties:
> > >            bus-type:
> > >              enum: [5, 6]
> > >
> > > +          bus-width:
> > > +            enum: [8, 10]
> > > +            default: 10
> > > +
> > > +          data-shift:
> > > +            enum: [0, 2]
> > > +            default: 0
> > > +
> > > +          hsync-active:
> > > +            enum: [0, 1]
> > > +            default: 1
> > > +
> > > +          vsync-active:
> > > +            enum: [0, 1]
> > > +            default: 1
> > > +
> > > +          pclk-sample:
> > > +            enum: [0, 1]
> > > +            default: 1
> > > +
> > >            remote-endpoint:
> > >              description: A phandle to the bus receiver's endpoint node.
> > >
> > > +        allOf:
> > > +          - if:
> > > +              properties:
> > > +                bus-type:
> > > +                  const: 6
> > > +            then:
> > > +                properties:
> > > +                  hsync-active: false
> > > +                  vsync-active: false
> > > +
> > > +          - if:
> > > +              properties:
> > > +                bus-width:
> > > +                  const: 10
> > > +            then:
> > > +                properties:
> > > +                  data-shift:
> > > +                    const: 0
> >
> > I'd add a blank line here.
> >
> > >          required:
> > >            - bus-type
> >
> > Should some of the properties be required ? Possibly conditioned on
> > bus-type ?
>
> Agreed, would be interesting to know how this can be handled (split
> out bus-type and add required properties for each) ?

We can add required: statements to the above if/then/else.

> > > @@ -82,6 +120,11 @@ examples:
> > >              port {
> > >                  ov772x_0: endpoint {
> > >                      bus-type = <5>;
> > > +                    vsync-active = <0>;
> > > +                    hsync-active = <0>;
> > > +                    pclk-sample = <0>;
> > > +                    bus-width = <8>;
> > > +                    data-shift = <0>;
> > >                      remote-endpoint = <&vcap1_in0>;
> > >                  };
> > >              };

-- 
Regards,

Laurent Pinchart
