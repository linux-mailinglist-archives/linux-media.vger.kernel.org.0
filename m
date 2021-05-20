Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACDD38B7D8
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237748AbhETTwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:52:09 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41665 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhETTwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:52:08 -0400
Received: by mail-oi1-f181.google.com with SMTP id c3so17496764oic.8;
        Thu, 20 May 2021 12:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bI90attyR4XDGuq610Fb7e9UOs4W8QNfKGL8ddS8VyQ=;
        b=CsOvr/fhvpIH2DzohnWAzBl0W2Su1/UAQM2eubMs6ePtYxXvZx4gE7yyBlBXmUZezs
         1JZOOqhUpW88CXeJzR7AHFXzAM6cW83h2pRTFYW17GxaZJrhrv7tNNNiWTC4wKw47CaU
         xu1sPNxjeQRDaG8B3zkZd5Z/GSsK2SWk9tjb21D69NT5JHgju6fw7M5nOnVKmG9/2Td8
         eqrWhxyM6EssAHR4p0Z9ttCQm+5dOlQdahCN/7YJLTR37bdYCT+Gx7LWz+NryYPoGr6R
         SpESb7feEDfZ9wvcboLqgAuwXr2fOLr49xyL4oh4oCm+uvKBZEo9bWq2fDKYx70BDJiZ
         s8gw==
X-Gm-Message-State: AOAM530fWZh8xGYm/pzF2mG17j9PL9XU3vY0bp4159fEfwczxGJd8pUx
        xEvBqVAeBMCpyJ80Zj5sIUCwlfqOeQ==
X-Google-Smtp-Source: ABdhPJwp5EIhCBczbGUJ39aTWNc7kz4k2CLZAnY8enMR8TI84+4BQWga6+zW1PUsk3RWNjnkeOsbfQ==
X-Received: by 2002:aca:fd0b:: with SMTP id b11mr4460710oii.161.1621540246767;
        Thu, 20 May 2021 12:50:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t14sm763169ooh.39.2021.05.20.12.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:50:45 -0700 (PDT)
Received: (nullmailer pid 1830955 invoked by uid 1000);
        Thu, 20 May 2021 19:50:45 -0000
Date:   Thu, 20 May 2021 14:50:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,imr: Convert to json-schema
Message-ID: <20210520195045.GA1828652@robh.at.kernel.org>
References: <353c2d181ceb6a5dfc553f88a201c6b18ee6914d.1621429265.git.geert+renesas@glider.be>
 <YKUic3pypkSOwvTy@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKUic3pypkSOwvTy@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 19, 2021 at 05:36:35PM +0300, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Wed, May 19, 2021 at 03:01:43PM +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas R-Car Image Renderer Tree binding documentation to
> > json-schema.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > I have listed Sergei as the maintainer, as he wrote the original
> > bindings.  Sergei: Please scream if this is inappropriate ;-)
> > ---
> >  .../devicetree/bindings/media/renesas,imr.txt | 31 ---------
> >  .../bindings/media/renesas,imr.yaml           | 66 +++++++++++++++++++
> >  2 files changed, 66 insertions(+), 31 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/renesas,imr.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/renesas,imr.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,imr.txt b/Documentation/devicetree/bindings/media/renesas,imr.txt
> > deleted file mode 100644
> > index b0614153ed3682eb..0000000000000000
> > --- a/Documentation/devicetree/bindings/media/renesas,imr.txt
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -Renesas R-Car Image Renderer (Distortion Correction Engine)
> > ------------------------------------------------------------
> > -
> > -The image renderer, or the distortion correction engine, is a drawing processor
> > -with a simple instruction system capable of referencing video capture data or
> > -data in an external memory as 2D texture data and performing texture mapping
> > -and drawing with respect to any shape that is split into triangular objects.
> > -
> > -Required properties:
> > -
> > -- compatible: "renesas,<soctype>-imr-lx4", "renesas,imr-lx4" as a fallback for
> > -  the image renderer light extended 4 (IMR-LX4) found in the R-Car gen3 SoCs,
> > -  where the examples with <soctype> are:
> > -  - "renesas,r8a7795-imr-lx4" for R-Car H3,
> > -  - "renesas,r8a7796-imr-lx4" for R-Car M3-W.
> > -- reg: offset and length of the register block;
> > -- interrupts: single interrupt specifier;
> > -- clocks: single clock phandle/specifier pair;
> > -- power-domains: power domain phandle/specifier pair;
> > -- resets: reset phandle/specifier pair.
> > -
> > -Example:
> > -
> > -	imr-lx4@fe860000 {
> > -		compatible = "renesas,r8a7795-imr-lx4", "renesas,imr-lx4";
> > -		reg = <0 0xfe860000 0 0x2000>;
> > -		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks = <&cpg CPG_MOD 823>;
> > -		power-domains = <&sysc R8A7795_PD_A3VC>;
> > -		resets = <&cpg 823>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/renesas,imr.yaml b/Documentation/devicetree/bindings/media/renesas,imr.yaml
> > new file mode 100644
> > index 0000000000000000..ea4579209e81660f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/renesas,imr.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/renesas,imr.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car Image Renderer (Distortion Correction Engine)
> > +
> > +maintainers:
> > +  - Sergei Shtylyov <sergei.shtylyov@gmail.com>
> > +
> > +description:
> > +  The image renderer, or the distortion correction engine, is a drawing
> > +  processor with a simple instruction system capable of referencing video
> > +  capture data or data in an external memory as 2D texture data and performing
> > +  texture mapping and drawing with respect to any shape that is split into
> > +  triangular objects.
> 
> I'd add a blank line between paragraphs.

Either way, it needs a '|' if you want to preserve formatting.
