Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4926AC8BD1
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfJBOuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:50:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbfJBOuD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 10:50:03 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 472C921783;
        Wed,  2 Oct 2019 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570027801;
        bh=M7UkPJXq9H6M3nCO21dFOZssYBGb+N4Rj34f9TMo3R0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eY+F/uctqOLMsPma/j86mCVci1GwKGInB1KwOwb8m0JUR+g3HS22Kc+nPtR2Sl70d
         Swcsi+IPt0QsJj62CVu2ji3Oi6RxuMzT7m/echlOwCCvEN0sWhsImSf0xKEI8WA58k
         fUIu9xZEPs2HnJZ6RHz4kh6a6yQGBSgyjhoSviT4=
Date:   Wed, 2 Oct 2019 16:49:59 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Message-ID: <20191002144959.vg2rpbdauzbzvkcx@gilmour>
References: <cover.34bcd988943a26671681eaf849aacab51fab1cfe.1562847292.git-series.maxime.ripard@bootlin.com>
 <110dd9ff1784c29fa16304825a41d1603a33f166.1562847292.git-series.maxime.ripard@bootlin.com>
 <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
 <CAGb2v66Sin9HZ+QENegLQ3d7iiy278niwdr9rEZ0HwUfeQNFRQ@mail.gmail.com>
 <20191001085246.55srb62bpfc6jhtu@gilmour>
 <CAGb2v66-Nak6RgtXYwOE6_nqHsOkLMh1G7CWJMDND1YzrywmHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ci3xbatgbsxlfsb3"
Content-Disposition: inline
In-Reply-To: <CAGb2v66-Nak6RgtXYwOE6_nqHsOkLMh1G7CWJMDND1YzrywmHA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ci3xbatgbsxlfsb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Oct 01, 2019 at 05:04:40PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 1, 2019 at 4:52 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > Thanks for looking into this.
> >
> > On Sun, Sep 15, 2019 at 04:54:16PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Aug 15, 2019 at 4:34 PM Chen-Yu Tsai <wens@csie.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Sorry for chiming in so late.
> > > >
> > > > On Thu, Jul 11, 2019 at 8:15 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > >
> > > > > The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> > > > > used in later (A10s, A13, A20, R8 and GR8) SoCs.
> > > > >
> > > > > On some SoCs, like the A10, there's multiple instances of that controller,
> > > > > with one instance supporting more channels and having an ISP.
> > > > >
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> > > > >  1 file changed, 94 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..97c9fc3b5050
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > > @@ -0,0 +1,94 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Chen-Yu Tsai <wens@csie.org>
> > > > > +  - Maxime Ripard <maxime.ripard@bootlin.com>
> > > > > +
> > > > > +description: |-
> > > > > +  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
> > > > > +  frames from a parallel or BT656 sensor.
> > > > > +
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - enum:
> > > > > +              - allwinner,sun7i-a20-csi0
> > > > > +          - const: allwinner,sun4i-a10-csi0
> > > >
> > > > CSI0 on the A10 has an ISP. Do we know if the one in the A20 does
> > > > as well? It certainly doesn't say so in the user manual. If not,
> > > > then we can't claim that A20 CSI0 is compatible with A10 CSI0.
> > > >
> > > > > +
> > > > > +      - items:
> > > > > +          - const: allwinner,sun4i-a10-csi0
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    items:
> > > > > +      - description: The CSI interface clock
> > > > > +      - description: The CSI module clock
> > > > > +      - description: The CSI ISP clock
> > > > > +      - description: The CSI DRAM clock
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: bus
> > > > > +      - const: mod
> > > >
> > > > I doubt this actually is a module clock. Based on the usage in your
> > > > device tree patch, and the csi driver in the old linux-sunxi kernel,
> > > > the clock rate is set to 24 MHz, or whatever the sensor requires for
> > > > MCLK.
> > >
> > > I'm working on adding support for this on the R40, and it seems with
> > > this SoC the picture is much clearer. It has the same CSI interface
> > > block, but the CCU has the clocks correctly named. We have:
> > >
> > >   - CSI_MCLK0
> > >   - CSI_MCLK1
> > >   - CSI_SCLK
> > >
> > > in addition to the bus clocks.
> > >
> > > The CSI section also explains the clock signals:
> > >
> > >     6.1.3.2. Clock Sources
> > >     Two Clocks need to be configured for CSI controller. CSI0/1_MCLK
> > >     provides the master clock for sensor and other devices. CSI_SCLK
> > >     is the top clock for the whole CSI module.
> > >
> > > So it would seem the ISP clock we currently have in the DT is simply
> > > the module clock shared by all CSI-related hardware blocks, and the
> > > module clock is bogus.
> >
> > I don't think it is. It looks like there's no ISP in the R40 CSI
> > controllers, so that would mean that we don't have an ISP clock, and
> > the SCLK is the module clock.
> >
> > Does that make sense?
>
> Right. That's another way to put it. The point is I believe the
> CSI[01]_CLK clocks on the A10/A20 are simply the MCLK outputs.

Looking at the Allwinner BSP again, it looks like you're right. I'll
send some patches to remove that clock from the binding.

Thanks!
Maxime

--ci3xbatgbsxlfsb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZS5FwAKCRDj7w1vZxhR
xcsgAP9qc0COV67+Hl3wJfkscyqUVifCgbluweo1QS6EiFrDggD/factOgnJNhXe
mZ+HTQ7UXodlm8GoSOzwo9mNt9KC1AA=
=TTvP
-----END PGP SIGNATURE-----

--ci3xbatgbsxlfsb3--
