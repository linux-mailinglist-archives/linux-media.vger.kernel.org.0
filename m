Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB0525DCED
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 17:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730800AbgIDPMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 11:12:23 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54929 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730224AbgIDPMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 11:12:23 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 993411C0008;
        Fri,  4 Sep 2020 15:12:17 +0000 (UTC)
Date:   Fri, 4 Sep 2020 17:16:04 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: media: ov772x: Make bus-type
 mandatory
Message-ID: <20200904151604.bdnebdn4viz7c42y@uno.localdomain>
References: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
 <20200903131029.18334-3-jacopo+renesas@jmondi.org>
 <20200904080535.ppmaarnusrnjr4xt@uno.localdomain>
 <20200904150650.GD7518@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200904150650.GD7518@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Sep 04, 2020 at 06:06:50PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Fri, Sep 04, 2020 at 10:05:35AM +0200, Jacopo Mondi wrote:
> > On Thu, Sep 03, 2020 at 03:10:28PM +0200, Jacopo Mondi wrote:
> > > In order to establish required properties based on the selected
> > > bus type, make the 'bus-type' property mandatory. As this change
> > > documents an endpoint property, also document the 'remote-endpoint'
> > > one now that the 'endpoint' schema has been expanded.
> > >
> > > Binary compatibility with existing DTB is kept as the driver does not
> > > enforce the property to be present, and shall fall-back to default
> > > parallel bus configuration, which was the only supported bus type, if
> > > the property is not specified.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov772x.yaml       | 20 +++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > > index e7e2d31fcc23..406e9cd463a2 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > > @@ -41,6 +41,25 @@ properties:
> > >      description: |
> > >        Video output port. See ../video-interfaces.txt.
> > >
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +
> > > +        properties:
> > > +          remote-endpoint:
> > > +            description: See ../video-interfaces.txt
> >
> > So I guess the same as you suggested for imx214 applies here (drop
> > remote-endpoint)
>
> Correct. And you should then replace additionalProperties: false with
> unevaluatedProperties: false.
>

Ah thanks, I would have just dropped additionalProperties, I didn't
know about unevaluatedProperties.

Thanks
  j

> > > +
> > > +          bus-type:
> > > +            enum: [5, 6]
> > > +
> > > +        required:
> > > +          - remote-endpoint
> > > +          - bus-type
> > > +
> > > +        additionalProperties: false
> > > +
> > > +    additionalProperties: false
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -65,6 +84,7 @@ examples:
> > >
> > >              port {
> > >                  ov772x_0: endpoint {
> > > +                    bus-type = <5>;
> > >                      remote-endpoint = <&vcap1_in0>;
> > >                  };
> > >              };
>
> --
> Regards,
>
> Laurent Pinchart
