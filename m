Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5884978AC
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 13:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfHUL5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 07:57:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:52192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbfHUL5m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 07:57:42 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B17C206BB;
        Wed, 21 Aug 2019 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566388661;
        bh=vzV50aK7lDvwz6lMyupuXqdrTQf9pceOREc9MLPjXDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ErsoLiwFvVa4rb4uLVibjPKKg37prkawlSogG246Bql64GbTFVcbjAdJEsqfxdtpg
         t/T9fuApibipBMV5XIlwzJERndrgD1LMe2CEi1NiuSyrE3AAwO3y0t9vgPxVknuhr2
         XIHNqq7kTNCvuIxF5g/OL1vLp3iqYReP6SqQdaso=
Date:   Wed, 21 Aug 2019 13:57:38 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Message-ID: <20190821115738.3amrk5td544mhpwd@flea>
References: <cover.b695c63cf668192aff5574a3005d483c601e77f6.1566300265.git-series.maxime.ripard@bootlin.com>
 <f490b35e62c5fd15174b5241ce1653e991c8fc9e.1566300265.git-series.maxime.ripard@bootlin.com>
 <20190820114849.GD5123@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6ow4c2sufu6lsmjk"
Content-Disposition: inline
In-Reply-To: <20190820114849.GD5123@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6ow4c2sufu6lsmjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sakari,

On Tue, Aug 20, 2019 at 02:48:49PM +0300, Sakari Ailus wrote:
> Hi Maxime,
>
> On Tue, Aug 20, 2019 at 01:24:32PM +0200, Maxime Ripard wrote:
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> > used in later (A10s, A13, A20, R8 and GR8) SoCs.
> >
> > On some SoCs, like the A10, there's multiple instances of that controller,
> > with one instance supporting more channels and having an ISP.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 107 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > new file mode 100644
> > index 000000000000..9000bca344f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <maxime.ripard@bootlin.com>
> > +
> > +description: |-
> > +  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
> > +  frames from a parallel or BT656 sensor.
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun7i-a20-csi0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: The CSI interface clock
> > +      - description: The CSI module clock
> > +      - description: The CSI ISP clock
> > +      - description: The CSI DRAM clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
> > +      - const: isp
> > +      - const: ram
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        properties:
> > +          bus-width:
> > +            const: 8
> > +            description: Number of data lines actively used.
>
> Are other values supported? If not, you could omit this.

It can also support 16 bits data input, but this description is
redundant anyway, I'll remove it.

> > +
> > +          data-active: true
> > +          hsync-active: true
> > +          pclk-sample: true
> > +          remote-endpoint: true
> > +          vsync-active: true
> > +
> > +        required:
> > +          - bus-width
> > +          - data-active
> > +          - hsync-active
> > +          - pclk-sample
> > +          - remote-endpoint
> > +          - vsync-active
>
> Some of these are not allowed in the Bt.656 mode (vsync-active and
> hsync-active) while they're required in Bt.601 mode. Is there a way to tell
> that in YAML-based bindings?

You could, but that would be more suited in another schemas. The way
schemas works is that you can have several layers of them, and each
being validated in isolation from the others.

Here, we're just listing the values usable by that binding, and it
will be used only to validate that binding.

Eventually, we'll want to have a video-interfaces schemas that will
apply to all the OF graph users, with those constraints defined.

This way, we can avoid a lot of duplication and just have the binding
description.

I guess I could just have the remote endpoint being required, and the
rest will be in the generic part.

> Similarly, video-interfaces.txt should be referenced from here, shouldn't
> it?

Sure.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6ow4c2sufu6lsmjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV0xsgAKCRDj7w1vZxhR
xZRVAQCiMCXGC+Jhj5UArGqGUPo8RfUmzov8i8LF6Y+puf29bQD9FukZcvSbUwWP
7Nb97AhXzuzAohNb4SnGTSQI6zT4lQQ=
=wBTw
-----END PGP SIGNATURE-----

--6ow4c2sufu6lsmjk--
