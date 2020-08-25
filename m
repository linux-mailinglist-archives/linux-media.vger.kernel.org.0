Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0D7252243
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 22:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgHYUzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 16:55:37 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39555 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYUzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 16:55:35 -0400
Received: by mail-il1-f193.google.com with SMTP id f12so154560ils.6;
        Tue, 25 Aug 2020 13:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AMzJ5VrNV5zeoByACeDAyxwvLUNrlJ6VL0uW0npABTQ=;
        b=GeR8Tu447GEEOOwzrae+JgEEmz1n8lKMIhnC4XvisRjKsr5jjIgQ9AZjUPImjhfAJL
         PljwNJ23Ihm3N1zywAlGqPn2aN5CnNVkFjwXsv4jYR0GKV4fD0UyCbOPgORq0oZ2I5Rt
         U7aIfjsGqoNzy5FrBf9pFKeIyB/wx0aOK03KsRV28tFJRRaf1bqeComiiyaoICcprPBp
         YuaXUGs9A8T6G1lbPp4SXN4iXQbPdu6+Q+N7/focKLuWYnRl9A56H8g6XVL3QvGkFtCN
         fzGfsY0+djWvfuh1NbSgn0vaj37PGjFmFGvHMbRjtsk9MjTzASJ7xVkc0cl+mDCX73TJ
         vFeQ==
X-Gm-Message-State: AOAM531nkFrGEtDY2k/J7uP1LwX6TMctNSRwax3f3XebyMfoOLzJDEah
        XsDjgQnJfMQGBCnUtIyOJw==
X-Google-Smtp-Source: ABdhPJwt7/l7y4tm5z4Iu4rYPaYxo0LoHBI/nc2glvh9tpkd3kOV1tP/4JFN3nMKacKySEA9ujmyFQ==
X-Received: by 2002:a92:c8cd:: with SMTP id c13mr10570812ilq.162.1598388933655;
        Tue, 25 Aug 2020 13:55:33 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id e68sm9004249iof.36.2020.08.25.13.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 13:55:33 -0700 (PDT)
Received: (nullmailer pid 1312676 invoked by uid 1000);
        Tue, 25 Aug 2020 20:55:31 -0000
Date:   Tue, 25 Aug 2020 14:55:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: ov772x: Convert to json-schema
Message-ID: <20200825205531.GA1298396@bogus>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-2-jacopo+renesas@jmondi.org>
 <20200819135204.GJ6049@pendragon.ideasonboard.com>
 <20200824083211.u2zm4o6f4wrxlu6k@uno.localdomain>
 <20200824113440.GC6002@pendragon.ideasonboard.com>
 <20200824121513.gvsr5sdodgpyv4w5@uno.localdomain>
 <20200824121457.GD6002@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824121457.GD6002@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 03:14:57PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Mon, Aug 24, 2020 at 02:15:13PM +0200, Jacopo Mondi wrote:
> > On Mon, Aug 24, 2020 at 02:34:40PM +0300, Laurent Pinchart wrote:
> > > On Mon, Aug 24, 2020 at 10:32:11AM +0200, Jacopo Mondi wrote:
> > > > On Wed, Aug 19, 2020 at 04:52:04PM +0300, Laurent Pinchart wrote:
> > > > > On Tue, Aug 18, 2020 at 02:20:10PM +0200, Jacopo Mondi wrote:
> > > > > > Convert the ov772x binding document to json-schema and update
> > > > > > the MAINTAINERS file accordingly.
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > > ---
> > > > > >  .../devicetree/bindings/media/i2c/ov772x.txt  | 40 ---------
> > > > > >  .../devicetree/bindings/media/i2c/ov772x.yaml | 84 +++++++++++++++++++
> > > > >
> > > > > Could yuo rename this to ovti,ov772x.yaml ?
> > > > >
> > > > > >  MAINTAINERS                                   |  2 +-
> > > > > >  3 files changed, 85 insertions(+), 41 deletions(-)
> > > > > >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > > > > > deleted file mode 100644
> > > > > > index 0b3ede5b8e6a..000000000000
> > > > > > --- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > > > > > +++ /dev/null
> > > > > > @@ -1,40 +0,0 @@
> > > > > > -* Omnivision OV7720/OV7725 CMOS sensor
> > > > > > -
> > > > > > -The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
> > > > > > -such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
> > > > > > -support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
> > > > > > -
> > > > > > -Required Properties:
> > > > > > -- compatible: shall be one of
> > > > > > -	"ovti,ov7720"
> > > > > > -	"ovti,ov7725"
> > > > > > -- clocks: reference to the xclk input clock.
> > > > > > -
> > > > > > -Optional Properties:
> > > > > > -- reset-gpios: reference to the GPIO connected to the RSTB pin which is
> > > > > > -  active low, if any.
> > > > > > -- powerdown-gpios: reference to the GPIO connected to the PWDN pin which is
> > > > > > -  active high, if any.
> > > > > > -
> > > > > > -The device node shall contain one 'port' child node with one child 'endpoint'
> > > > > > -subnode for its digital output video port, in accordance with the video
> > > > > > -interface bindings defined in Documentation/devicetree/bindings/media/
> > > > > > -video-interfaces.txt.
> > > > > > -
> > > > > > -Example:
> > > > > > -
> > > > > > -&i2c0 {
> > > > > > -	ov772x: camera@21 {
> > > > > > -		compatible = "ovti,ov7725";
> > > > > > -		reg = <0x21>;
> > > > > > -		reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
> > > > > > -		powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
> > > > > > -		clocks = <&xclk>;
> > > > > > -
> > > > > > -		port {
> > > > > > -			ov772x_0: endpoint {
> > > > > > -				remote-endpoint = <&vcap1_in0>;
> > > > > > -			};
> > > > > > -		};
> > > > > > -	};
> > > > > > -};
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..2b84fefeb4aa
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > > > > @@ -0,0 +1,84 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/media/i2c/ov772x.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title:  Omnivision OV7720/OV7725 CMOS sensor
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Jacopo Mondi <jacopo@jmondi.org>
> > > > > > +
> > > > > > +description: -|
> > > > > > +  The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
> > > > > > +  such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
> > > > > > +  support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - ovti,ov7720
> > > > > > +      - ovti,ov7725
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  reset-gpios:
> > > > > > +    description: -|
> > > > > > +      Reference to the GPIO connected to the RSTB pin which is active low.
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  powerdown-gpios:
> > > > > > +    description: -|
> > > > > > +      Reference to the GPIO connected to the PWDN pin which is active high.
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  port:
> > > > > > +    type: object
> > > > > > +    description: |
> > > > > > +      The device node must contain one 'port' child node for its digital output
> > > > > > +      video port, in accordance with the video interface bindings defined in
> > > > > > +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > >
> > > > > You can simply write
> > > > >
> > > > >       Digital input video port. See ../video-interfaces.txt.
> > > > >
> > > > > > +
> > > > > > +    properties:
> > > > > > +      endpoint:
> > > > > > +        type: object
> > > > > > +        properties:
> > > > > > +          remote-endpoint:
> > > > > > +            description: A phandle to the bus receiver's endpoint node.
> > > > >
> > > > >            required:
> > > > > 	     - remote-endpoint
> > > > >
> > > > >            additionalProperties: false
> > > >
> > > > I receveied a reply to you on previous json-schema conversion attempt
> > > > where you suggested to not set remote-endpoint as required, as we
> > > > allow empty ones to be later filled in in, maybe with an overlay.
> > > >
> > > > Which Laurent should I listen to ? I tend to agree with the one that
> > > > said to drop remote-endpoint from the required properties list.
> > >
> > > Maybe I recall incorrectly, didn't I say that endpoint shouldn't be
> > > mandatory ? Ports should be mandatory as they describe the hardware,
> > > endpoints describe a connection, and within a connection, I'm not sure
> > > to see a use-case for not setting remote-endpoint. Maybe I need to look
> > > better ? :-)
> > >
> > 
> > I might be confused as well, but to me port and endpoint should be
> > there as they represent the available endpoints of the devices connections.
> > Connections to external devices that can be established (or overwritten)
> > by applying an overlay, and such are not mandatory.
> > 
> > As I see it:
> > - port/endpoints: establish the available device connection endpoitns
> >   and shall be mandatory (also to give a known place where to 'plug'
> >   the connections)
> > 
> > - remote-endpoints: data connections to external devices, which might
> >   depend on the board assembly or installed 'capes' and expansions. As
> >   such, they can be modeled as an overlay fragment to be applied on the
> >   (known layout of the) device.
> 
> Only the port represents a connection point. The endpoint node is part
> of the representation of the link, it doesn't map to a particular
> hardware resource on the port side.

I think all of 'endpoint' should be dropped if you only have 
'remote-endpoint' (and no other properties) and you don't have multiple 
endpoints (typically only if the h/w has some sort of built-in mux or 
connection selector). 

Once we have a generic graph schema, it can enforce that 'port' has 
'endpoint' and 'endpoint' has 'remote-endpoint'. Doing this hasn't been 
too high on my list simply because dtc already does all or most of that.

Rob
