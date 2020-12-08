Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DC82D33BD
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 21:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgLHUYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 15:24:34 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38397 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgLHUYd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 15:24:33 -0500
Received: by mail-ot1-f65.google.com with SMTP id b62so17027908otc.5;
        Tue, 08 Dec 2020 12:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QxevaX9hHJqThS0h+1tu93etIkBHDGFZ0rujAfMqWBU=;
        b=ucJyqrCt0YhLl1QZMa6nmqnJgXy9B1GymUqqOFR+5A18GU0oTCghNSCjHeE8BmlbRv
         7QjfwhrcHfKEn/15NironBRFIIO9/c9Lp51QXTn7XmAVFnfGkx3AuYC0OGCZ9rGMnEvG
         yeq/LWEA+kzUw/ntPdGP7MlFrgR+kFvJ4gvTd82gmP4/5Wwh3FqKZiiBrkW8H+CsaXHQ
         P543Oiwi3PM3DRTEhUWI8qJ+aJ+oWWZ5OxThJa01l6B9MFiUZ4NdR8aZjavsQ6s2i3VO
         oV2Za0L0Tn4hUkRqNJRPDfj0fGzsQcGmsBQTpuNhJBGZ1P3R61FhXMy1BIcdHzXGKEA4
         4H/g==
X-Gm-Message-State: AOAM532XCEWf6BI7f1L9nJU/O74+KcU6T4qGugWloyFSOEkF+ojR7KfQ
        D6jw3G9q4Jq4v2MN03pqpNIyRo0kFg==
X-Google-Smtp-Source: ABdhPJzCUquUPkk4QcEOY3Zw0x6ce2Fw4YZ0IvyhJ84rgBYmuVMaX6uzvrqVOqNJYEjlVUOHQDs46g==
X-Received: by 2002:a05:6830:1d8c:: with SMTP id y12mr17836523oti.34.1607457275947;
        Tue, 08 Dec 2020 11:54:35 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n3sm3887074oif.42.2020.12.08.11.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 11:54:34 -0800 (PST)
Received: (nullmailer pid 2975909 invoked by uid 1000);
        Tue, 08 Dec 2020 19:54:32 -0000
Date:   Tue, 8 Dec 2020 13:54:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v2 06/19] dt-bindings: media: sun6i-a31-csi: Add MIPI
 CSI-2 input port
Message-ID: <20201208195432.GA2973474@robh.at.kernel.org>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-7-paul.kocialkowski@bootlin.com>
 <20201201104321.rl3ujt5pjre6xlmm@gilmour>
 <X8ehzCjZJ3yC8YtJ@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8ehzCjZJ3yC8YtJ@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 02, 2020 at 03:16:44PM +0100, Paul Kocialkowski wrote:
> Hi,
> 
> On Tue 01 Dec 20, 11:43, Maxime Ripard wrote:
> > On Sat, Nov 28, 2020 at 03:28:26PM +0100, Paul Kocialkowski wrote:
> > > The A31 CSI controller supports two distinct input interfaces:
> > > parallel and an external MIPI CSI-2 bridge. The parallel interface
> > > is often connected to a set of hardware pins while the MIPI CSI-2
> > > bridge is an internal FIFO-ish link. As a result, these two inputs
> > > are distinguished as two different ports.
> > > 
> > > Note that only one of the two may be present on a controller instance.
> > > For example, the V3s has one controller dedicated to MIPI-CSI2 and one
> > > dedicated to parallel.
> > > 
> > > Update the binding with an explicit ports node that holds two distinct
> > > port nodes: one for parallel input and one for MIPI CSI-2.
> > > 
> > > This is backward-compatible with the single-port approach that was
> > > previously taken for representing the parallel interface port, which
> > > stays enumerated as fwnode port 0. However, it is now marked as
> > > deprecated and the multi-port approach should be preferred.
> > > 
> > > Note that additional ports may be added in the future, especially to
> > > support feeding the CSI controller's output to the ISP.
> > > 
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  .../media/allwinner,sun6i-a31-csi.yaml        | 86 ++++++++++++++++---
> > >  1 file changed, 73 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> > > index 1fd9b5532a21..3bcee2d44f3c 100644
> > > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
> > > @@ -43,6 +43,7 @@ properties:
> > >    # See ./video-interfaces.txt for details
> > >    port:
> > >      type: object
> > > +    deprecated: true
> > 
> > I'm not sure we want to deprecate it. There's some SoCs with the same
> > controller but without the MIPI-CSI block where this would be completely
> > valid
> 
> I think we'll need to deprecate it when adding support for the ISP anyway,
> so I figured we might as well do it now. But I'm okay to postpone this for now.
> 
> > >      properties:
> > >        endpoint:
> > > @@ -67,6 +68,59 @@ properties:
> > >  
> > >      additionalProperties: false
> > >  
> > > +  ports:
> > > +    type: object
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: Parallel input port, connect to a parallel sensor
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +              bus-width:
> > > +                enum: [ 8, 10, 12, 16 ]
> > > +
> > > +              pclk-sample: true
> > > +              hsync-active: true
> > > +              vsync-active: true
> > > +
> > > +            required:
> > > +              - bus-width
> > > +              - remote-endpoint
> > > +
> > > +        required:
> > > +          - endpoint
> > > +
> > > +        additionalProperties: false
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: MIPI CSI-2 bridge input port
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 1
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +
> > > +            properties:
> > > +              remote-endpoint: true
> > > +
> > > +            required:
> > > +              - remote-endpoint
> > > +
> > > +        additionalProperties: false
> > 
> > There's a schema for the OF-graph now, you'll want to use it.
> 
> I didn't know that, thanks for the tip! Will look into it.

There's about to be. Don't use what's in graph.yaml (in dt-schema) yet.

Rob
