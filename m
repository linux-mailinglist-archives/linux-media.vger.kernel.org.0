Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5432C25DCD4
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 17:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbgIDPH1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 11:07:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729942AbgIDPH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 11:07:26 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91A36540;
        Fri,  4 Sep 2020 17:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599232037;
        bh=X0YQbw4OTDSt/IN0wXScJwAz8YgomfEBzwBnEmStsQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DHdCJbhZlJ9pm/HqUcOPK1EYkDm2wqnp+lFtXvPuQGFpdvhPCWx8/tnO1lYyIxhdR
         b12j6xEtj5QssGe+etVyz+H7YepMM1IB7gejyDuh3/RieNTX3EtRxs09YD8DRQmKB7
         kiui5HzUa2dsCxckJH8TcGRvUFfjJ3BjxnbYG1uw=
Date:   Fri, 4 Sep 2020 18:06:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: media: ov772x: Make bus-type
 mandatory
Message-ID: <20200904150650.GD7518@pendragon.ideasonboard.com>
References: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
 <20200903131029.18334-3-jacopo+renesas@jmondi.org>
 <20200904080535.ppmaarnusrnjr4xt@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200904080535.ppmaarnusrnjr4xt@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Sep 04, 2020 at 10:05:35AM +0200, Jacopo Mondi wrote:
> On Thu, Sep 03, 2020 at 03:10:28PM +0200, Jacopo Mondi wrote:
> > In order to establish required properties based on the selected
> > bus type, make the 'bus-type' property mandatory. As this change
> > documents an endpoint property, also document the 'remote-endpoint'
> > one now that the 'endpoint' schema has been expanded.
> >
> > Binary compatibility with existing DTB is kept as the driver does not
> > enforce the property to be present, and shall fall-back to default
> > parallel bus configuration, which was the only supported bus type, if
> > the property is not specified.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/media/i2c/ovti,ov772x.yaml       | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > index e7e2d31fcc23..406e9cd463a2 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > @@ -41,6 +41,25 @@ properties:
> >      description: |
> >        Video output port. See ../video-interfaces.txt.
> >
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +
> > +        properties:
> > +          remote-endpoint:
> > +            description: See ../video-interfaces.txt
> 
> So I guess the same as you suggested for imx214 applies here (drop
> remote-endpoint)

Correct. And you should then replace additionalProperties: false with
unevaluatedProperties: false.

> > +
> > +          bus-type:
> > +            enum: [5, 6]
> > +
> > +        required:
> > +          - remote-endpoint
> > +          - bus-type
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -65,6 +84,7 @@ examples:
> >
> >              port {
> >                  ov772x_0: endpoint {
> > +                    bus-type = <5>;
> >                      remote-endpoint = <&vcap1_in0>;
> >                  };
> >              };

-- 
Regards,

Laurent Pinchart
