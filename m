Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5A92E0095
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgLUS7O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:59:14 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:39077 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgLUS7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:59:13 -0500
Received: by mail-ot1-f49.google.com with SMTP id d8so9740639otq.6;
        Mon, 21 Dec 2020 10:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qIeLBUGIHIVA57iaE4/h+UuAVW+FB7xmHcMIvg2bi8k=;
        b=DkHDi1AIPXS/+2opwCxwKfI5g5bAGXp3KnaxhHgA9l+2UK3R0OUmaDaP81G1XLVof0
         iBSgj6iE/Frv8OXCea2GE6HZlJyDfxrnPYZS6gXkDuzcGQDffXUJYTRIndhLJwfl6ZS7
         XMOdixzUx9lDGU+lIalX1WI1KrcKwtBtXmHkyP2Jh7zDYWz+F+2oQ07gMwRhP2cejxLD
         15WoAs9/tD39Xy/9Mh4ImReqYGXw6BNUy7Y7+cVYs6mLT/w8aETfLSqbt+ZOKkyTy2o4
         uRGD1fzA2lnbiJSVg4ouOgrPhN3HQdUUfQC2uoxnJ7zXbb1hqfhbltVfgOnS5RcU/Xus
         bJKA==
X-Gm-Message-State: AOAM532A7iKbPrL+UycOzBwD0tKB8f9NXS5MrQt28hqFBqg7YM2dwmX0
        CwA41rOGNXUo95czh421gQ==
X-Google-Smtp-Source: ABdhPJwD6AgUBfnRrtkPZhJwXnbbQX7IFHvj0ACy/iIxKTkOzDprZfz0x+WImXb0Pb9UOM6ek74Aog==
X-Received: by 2002:a9d:2287:: with SMTP id y7mr12675380ota.137.1608577112654;
        Mon, 21 Dec 2020 10:58:32 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v4sm3966365otk.50.2020.12.21.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 10:58:31 -0800 (PST)
Received: (nullmailer pid 362405 invoked by uid 1000);
        Mon, 21 Dec 2020 18:58:27 -0000
Date:   Mon, 21 Dec 2020 11:58:27 -0700
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v6 2/5] dt-bindings: media: max9286: Document
 'maxim,reverse-channel-microvolt'
Message-ID: <20201221185827.GA359098@robh.at.kernel.org>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-3-jacopo+renesas@jmondi.org>
 <X9o+XT3z1sVlh73x@pendragon.ideasonboard.com>
 <X9pBEe+da/8Y34Qv@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9pBEe+da/8Y34Qv@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 16, 2020 at 07:17:05PM +0200, Laurent Pinchart wrote:
> On Wed, Dec 16, 2020 at 07:05:34PM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Dec 15, 2020 at 06:09:54PM +0100, Jacopo Mondi wrote:
> > > Document the 'reverse-channel-microvolt' vendor property in the
> > > bindings document of the max9286 driver.
> > > 
> > > The newly introduced property allows to specifying the initial
> > > configuration of the GMSL reverse control channel to accommodate
> > > remote serializers pre-programmed with the high threshold power
> > > supply noise immunity enabled.
> > > 
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > ---
> > > v5->v6:
> > > - Use standard unit suffix 'microvolt' for the custom property
> > > - Drop '$ref' as according to 'example-schema.yaml':
> > >   "Vendor specific properties having a standard unit suffix don't need a type."
> > > ---
> > >  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > index 9ea827092fdd..b22ba3e0db4a 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> > > @@ -51,6 +51,26 @@ properties:
> > >    '#gpio-cells':
> > >      const: 2
> > > 
> > > +  maxim,reverse-channel-microvolt:
> > > +    minimum: 30000
> > > +    maximum: 200000
> > > +    default: 170000
> > > +    description: |
> > > +      Initial amplitude of the reverse control channel, in micro volts.
> > > +
> > > +      The initial amplitude shall be adjusted to a value compatible with the
> > > +      configuration of the connected remote serializer.
> > > +
> > > +      Some camera modules (for example RDACM20) include an on-board MCU that
> > > +      pre-programs the embedded serializer with power supply noise immunity
> > > +      (high-threshold) enabled. A typical value of the deserializer's reverse
> > > +      channel amplitude to communicate with pre-programmed serializers is
> > > +      170000 micro volts.
> > > +
> > > +      A typical value for the reverse channel amplitude to communicate with
> > > +      a remote serializer whose high-threshold noise immunity is not enabled
> > > +      is 100000 micro volts
> > > +
> > >    ports:
> > >      type: object
> > >      description: |
> > > @@ -221,6 +241,7 @@ required:
> > >    - ports
> > >    - i2c-mux
> > >    - gpio-controller
> > > +  - maxim,reverse-channel-microvolt
> 
> One comment though: You specify a default value above, which isn't very
> useful when the property is required. Should we either drop the default
> value, or make the property optional ?

And generally added properties can't be required unless for some reason 
DT's without the property are broken.

With required dropped,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
