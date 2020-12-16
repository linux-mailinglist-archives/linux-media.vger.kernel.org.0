Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C942DC528
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 18:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgLPRRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 12:17:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42868 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbgLPRRz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 12:17:55 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 683482CF;
        Wed, 16 Dec 2020 18:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608139032;
        bh=W9YanIGwZONXqwRTj+UtztRqLzatG/3UateoWE4Lj5M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RSrORiqo52IGgnPFTqEig21c+wCtHJnVXiTwtpYrt3OM/Uwwlatl15cz1tc7vbi6b
         EMyyhFEZrB5vhGGqForlJjKDekOqDHKTys2AfV+2f2MOAWd94LDU8aPuhkawxoF5Ou
         fwsDc4An9LjNQ202AyBAL4oxAeVmjcWlqbqkFduM=
Date:   Wed, 16 Dec 2020 19:17:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        robh@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v6 2/5] dt-bindings: media: max9286: Document
 'maxim,reverse-channel-microvolt'
Message-ID: <X9pBEe+da/8Y34Qv@pendragon.ideasonboard.com>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-3-jacopo+renesas@jmondi.org>
 <X9o+XT3z1sVlh73x@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X9o+XT3z1sVlh73x@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 16, 2020 at 07:05:34PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Tue, Dec 15, 2020 at 06:09:54PM +0100, Jacopo Mondi wrote:
> > Document the 'reverse-channel-microvolt' vendor property in the
> > bindings document of the max9286 driver.
> > 
> > The newly introduced property allows to specifying the initial
> > configuration of the GMSL reverse control channel to accommodate
> > remote serializers pre-programmed with the high threshold power
> > supply noise immunity enabled.
> > 
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> > v5->v6:
> > - Use standard unit suffix 'microvolt' for the custom property
> > - Drop '$ref' as according to 'example-schema.yaml':
> >   "Vendor specific properties having a standard unit suffix don't need a type."
> > ---
> >  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > index 9ea827092fdd..b22ba3e0db4a 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > @@ -51,6 +51,26 @@ properties:
> >    '#gpio-cells':
> >      const: 2
> > 
> > +  maxim,reverse-channel-microvolt:
> > +    minimum: 30000
> > +    maximum: 200000
> > +    default: 170000
> > +    description: |
> > +      Initial amplitude of the reverse control channel, in micro volts.
> > +
> > +      The initial amplitude shall be adjusted to a value compatible with the
> > +      configuration of the connected remote serializer.
> > +
> > +      Some camera modules (for example RDACM20) include an on-board MCU that
> > +      pre-programs the embedded serializer with power supply noise immunity
> > +      (high-threshold) enabled. A typical value of the deserializer's reverse
> > +      channel amplitude to communicate with pre-programmed serializers is
> > +      170000 micro volts.
> > +
> > +      A typical value for the reverse channel amplitude to communicate with
> > +      a remote serializer whose high-threshold noise immunity is not enabled
> > +      is 100000 micro volts
> > +
> >    ports:
> >      type: object
> >      description: |
> > @@ -221,6 +241,7 @@ required:
> >    - ports
> >    - i2c-mux
> >    - gpio-controller
> > +  - maxim,reverse-channel-microvolt

One comment though: You specify a default value above, which isn't very
useful when the property is required. Should we either drop the default
value, or make the property optional ?

> > 
> >  additionalProperties: false
> > 
> > @@ -243,6 +264,8 @@ examples:
> >          gpio-controller;
> >          #gpio-cells = <2>;
> > 
> > +        maxim,reverse-channel-microvolt = <170000>;
> > +
> >          ports {
> >            #address-cells = <1>;
> >            #size-cells = <0>;

-- 
Regards,

Laurent Pinchart
