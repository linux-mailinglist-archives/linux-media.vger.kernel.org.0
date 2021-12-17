Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428994790D2
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 16:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238713AbhLQP7g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 10:59:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56590 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbhLQP7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 10:59:36 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C477893;
        Fri, 17 Dec 2021 16:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639756775;
        bh=c3XHej1xlAjvDy8WjGONI7nF9JWDCekmb7lx1DYxTvA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e+NSjLczTCF0+fRINIgaMFMZxyHBoHM/LzGyF7mgU2YyDqP4m4fKL3JvWpEt8M56G
         wMPIcp/KY9StfS7ng1qHGWEYNktCxw2poyIBdRk1HVWhBbWvxLdfbhgZEJOBfhGA+g
         Shabo7NnIl/R6Mfeki8oaZJ/5CXt+IQJmjzuhulM=
Date:   Fri, 17 Dec 2021 17:59:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: max9286: Add support for
 per-port supplies
Message-ID: <Ybyz5ATkHSDrxvqe@pendragon.ideasonboard.com>
References: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211216220946.20771-2-laurent.pinchart+renesas@ideasonboard.com>
 <YbycHk2r+63PT+kP@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YbycHk2r+63PT+kP@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Fri, Dec 17, 2021 at 08:18:06AM -0600, Rob Herring wrote:
> On Fri, Dec 17, 2021 at 12:09:44AM +0200, Laurent Pinchart wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Power supplies for the ports can be controlled per port depending on the
> > hardware design. Support per-port supplies in the DT bindings, mutually
> > exclusive with the global supply.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../bindings/media/i2c/maxim,max9286.yaml     | 25 ++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > index 02f656e78700..33aa307e8ee5 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > @@ -39,7 +39,7 @@ properties:
> >      maxItems: 1
> >  
> >    poc-supply:
> > -    description: Regulator providing Power over Coax to the cameras
> > +    description: Regulator providing Power over Coax to all the ports
> >  
> >    enable-gpios:
> >      description: GPIO connected to the \#PWDN pin with inverted polarity
> > @@ -160,6 +160,10 @@ properties:
> >  
> >              additionalProperties: false
> >  
> > +patternProperties:
> > +  "^port[0-3]-poc-supply$":
> > +    description: Regulator providing Power over Coax for a particular port
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -167,6 +171,25 @@ required:
> >    - i2c-mux
> >    - gpio-controller
> >  
> > +allOf:
> > +  - if:
> > +      required:
> > +        - poc-supply
> > +    then:
> > +      allOf:
> > +        - not:
> > +            required:
> > +              - port0-poc-supply
> > +        - not:
> > +            required:
> > +              - port1-poc-supply
> > +        - not:
> > +            required:
> > +              - port2-poc-supply
> > +        - not:
> > +            required:
> > +              - port3-poc-supply
> 
> I think you can invert the if and move patternProperties to the 'then' 
> and...
> 
> > +
> >  additionalProperties: false
> 
> then use unevaluatedProperties here.

I ended up doing the following, which I would have sworn I had tried
before:

allOf:
  - if:
      required:
        - poc-supply
    then:
      patternProperties:
        '^port[0-3]-poc-supply$': false

additionalProperties: false

It seems to work, so I'll use it in v2.

-- 
Regards,

Laurent Pinchart
