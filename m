Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A97A2B64D5
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 14:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732281AbgKQNcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 08:32:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:42434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732260AbgKQNcj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 08:32:39 -0500
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 084A321734;
        Tue, 17 Nov 2020 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605619959;
        bh=UhPbUt0ifa0Pxy/jnyzj9ZPKxGcEb087S7SG2WpZaGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HnRmDlJ6kQxcZv0dRT+LMnGfjK66xE47O4TWTnxKT8CuZEaBalhPPWRmB2RBgz6bG
         MNwjyLkpB8NwFUyma26xGn9Ayuvq3OItmI18VSjEbsaxX2IJMhYBdUevMX0b8EAiZb
         VrKj+Nfc1LvO/Q5jlib5vBsyGmznSR0Wzvp5T/q0=
Received: by mail-ot1-f41.google.com with SMTP id o3so8829550ota.8;
        Tue, 17 Nov 2020 05:32:39 -0800 (PST)
X-Gm-Message-State: AOAM531ZBcHzgday0pSwSaUwBTspXgdFIJL/cy6s30XsAcaSSl1H1BZf
        IvXPDITh0T6D3eOciIup2gy0vUtCoqGjaijMHw==
X-Google-Smtp-Source: ABdhPJzBrMqEp0ysXvtnc6eIolVq5PogUkN+PRIXAd0fio0+PJbIZS1ttpJ8osArtRMtoWVBgz3WHQ8G7Y+csVIn/Ho=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2812131oti.107.1605619958249;
 Tue, 17 Nov 2020 05:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20201117013947.2479625-1-robh@kernel.org> <20201117095218.GB3940@pendragon.ideasonboard.com>
In-Reply-To: <20201117095218.GB3940@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 17 Nov 2020 07:32:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+F2AP+Rm84+bjCuXJFqvvn-bhUc5N6o_7pNNFCVKnuZA@mail.gmail.com>
Message-ID: <CAL_Jsq+F2AP+Rm84+bjCuXJFqvvn-bhUc5N6o_7pNNFCVKnuZA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Use OF graph schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 17, 2020 at 3:52 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Mon, Nov 16, 2020 at 07:39:47PM -0600, Rob Herring wrote:
> > Now that we have a graph schema, rework the media related schemas to
> > use it. Mostly this is adding a reference to graph.yaml and dropping
> > duplicate parts from schemas.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > This can go via the media tree. Ideally anything else subsequently added
> > will be fixed up too.
> >
> >  .../media/allwinner,sun4i-a10-csi.yaml        |  1 +
> >  .../media/allwinner,sun6i-a31-csi.yaml        |  1 +
> >  .../bindings/media/i2c/adv7180.yaml           | 31 ++------
> >  .../bindings/media/i2c/adv7604.yaml           | 32 ++------
> >  .../bindings/media/i2c/aptina,mt9v111.yaml    |  2 +-
> >  .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 25 +-----
> >  .../devicetree/bindings/media/i2c/imx219.yaml |  4 +
> >  .../bindings/media/i2c/maxim,max9286.yaml     | 76 ++++---------------
> >  .../devicetree/bindings/media/i2c/ov5647.yaml |  5 +-
> >  .../devicetree/bindings/media/i2c/ov8856.yaml |  5 +-
> >  .../bindings/media/i2c/ovti,ov772x.yaml       |  1 +
> >  .../bindings/media/i2c/sony,imx214.yaml       |  1 +
> >  .../bindings/media/i2c/sony,imx274.yaml       |  3 +-
> >  .../bindings/media/marvell,mmp2-ccic.yaml     |  1 +
> >  .../bindings/media/renesas,ceu.yaml           |  1 +
> >  .../bindings/media/renesas,csi2.yaml          | 36 ++-------
> >  .../bindings/media/renesas,vin.yaml           |  7 +-
> >  .../bindings/media/st,stm32-dcmi.yaml         |  7 +-
> >  .../devicetree/bindings/media/ti,cal.yaml     | 15 +---
> >  .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 21 +----
> >  20 files changed, 61 insertions(+), 214 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > index 09318830db47..0205f7dd7fdb 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > @@ -70,6 +70,7 @@ properties:
> >    # See ./video-interfaces.txt for details
> >    port:
> >      type: object
>
> Could the type be dropped (here and below, I haven't mentioned it in all
> locations) as it's specified in /schemas/graph.yaml#/properties/port ?

See my reply on the display patch for this.

> > +    $ref: /schemas/graph.yaml#/properties/port
> >      additionalProperties: false
>
> Don't we need to switch to unevaluatedProperties ?

We could, but additionalProperties works here because 'endpoint' is
the only one.


> > @@ -74,6 +76,8 @@ properties:
> >          required:
> >            - link-frequencies
> >
> > +    additionalProperties: false
>
> I supppose additionalProperties works here as the endpoint property is
> specified in this schema, but conceptually speaking, wouldn't
> unevaluatedProperties be a better match ?

Yes, except unevaluatedProperties is currently a nop, so I went the
stricter route.

Rob
