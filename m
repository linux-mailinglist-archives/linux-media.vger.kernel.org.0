Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDB32DABB4
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 12:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgLOLPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 06:15:05 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41885 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgLOLPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 06:15:05 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A9617E000D;
        Tue, 15 Dec 2020 11:14:09 +0000 (UTC)
Date:   Tue, 15 Dec 2020 12:14:20 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v5 2/8] dt-bindings: media: max9286: Document
 'maxim,initial-reverse-channel-mV'
Message-ID: <20201215111420.zpc67jkary3l5j4z@uno.localdomain>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <20201116135305.81319-3-jacopo+renesas@jmondi.org>
 <20201130220048.GA3104550@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130220048.GA3104550@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Nov 30, 2020 at 03:00:48PM -0700, Rob Herring wrote:
> On Mon, Nov 16, 2020 at 02:52:59PM +0100, Jacopo Mondi wrote:
> > Document the 'initial-reverse-channel-mV' vendor property in the
> > bindings document of the max9286 driver.
> >
> > The newly introduced property allows to specifying the initial
> > configuration of the GMSL reverse control channel to accommodate
> > remote serializers pre-programmed with the high threshold power
> > supply noise immunity enabled.
> >
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > index 9ea827092fdd..f61234d204fa 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > @@ -51,6 +51,26 @@ properties:
> >    '#gpio-cells':
> >      const: 2
> >
> > +  maxim,initial-reverse-channel-mV:
>
> Use standard unit suffix.
>

Which one ? :)
I see in v5.10 one 'mV', three 'mv', one 'millivolts', several
'microvolts'.

I'll go with the majority and make this
'maxim,initial-reverse-channel-mv'

Thanks
   j

> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    minimum: 30
> > +    maximum: 200
> > +    default: 170
> > +    description: |
> > +      Initial amplitude of the reverse control channel, in millivolts.
> > +
> > +      The initial amplitude shall be adjusted to a value compatible with the
> > +      configuration of the connected remote serializer.
> > +
> > +      Some camera modules (for example RDACM20) include an on-board MCU that
> > +      pre-programs the embedded serializer with power supply noise immunity
> > +      (high-threshold) enabled. A typical value of the deserializer's reverse
> > +      channel amplitude to communicate with pre-programmed serializers is 170mV.
> > +
> > +      A typical value for the reverse channel amplitude to communicate with
> > +      a remote serializer whose high-threshold noise immunity is not enabled
> > +      is 100mV.
> > +
> >    ports:
> >      type: object
> >      description: |
> > @@ -221,6 +241,7 @@ required:
> >    - ports
> >    - i2c-mux
> >    - gpio-controller
> > +  - maxim,initial-reverse-channel-mV
> >
> >  additionalProperties: false
> >
> > @@ -243,6 +264,8 @@ examples:
> >          gpio-controller;
> >          #gpio-cells = <2>;
> >
> > +        maxim,initial-reverse-channel-mV = <170>;
> > +
> >          ports {
> >            #address-cells = <1>;
> >            #size-cells = <0>;
> > --
> > 2.29.1
> >
