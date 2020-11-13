Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BC92B2244
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgKMR1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:27:52 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:45769 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726749AbgKMR1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:27:42 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 34E66580252;
        Fri, 13 Nov 2020 12:27:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 13 Nov 2020 12:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=hvWSJFEUzav27aFiPUPZCSHaqWI
        CGpr51/5knVKV5v4=; b=bCbKKCG9wqX97v/ILsdgQN8RWr+fQYyLrKufe5hlGiN
        5BKTA2XEboxCrW0uBaWetRPdfzlCvp/hNiP7M2qg2Tmsax0FbJ7Jsoa3pBW3UimK
        wk7mDOL6Qr12wi+PXwq3gug/fO/eTDw85ZEMaJ9BqSMPygM+rArbX/3Gjmv+Wbx2
        jjiKTJz2imI3h7q3hDVwakxQ0XDI0I+2cbbSD9mJG7Y/hauR0AXAPSQjFY9rkauv
        nTgWJkl9brRxISk8rgBdFOqlZEzVRbaLFoR/SkWd5mLv5ApTGr+yJUSgHE5oTDXO
        RbzN9Ai/NMO77By3CwLDpsqlavVtAryE7oEsI+Se2Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hvWSJF
        EUzav27aFiPUPZCSHaqWICGpr51/5knVKV5v4=; b=eV4TBzLV8IW9zZvEPEgMhB
        ll1yQi2nAv0wKJKVo1DgtK15MpNiIDUztzZ1jEv6uQ8DxIbXB94v3JVrxnU2WXLY
        rIkBra6G/NNqtfiMDWJhvUMXU322tAMRh0+mkenv+PCpLzPGPP2KW6UvqAvM+X4N
        jHfiTr7ZyOeupclZ8Hn/eGrMtT7XkQrzCaG116y9qF7mVr1WPR54iZykLC3LwWgo
        vzL1GtaJFMWGykt/S34yfY4vcsbR4J/5xCFbfKvyYJbb0E4OQUgOX1kYH5j+N5xJ
        iBfuqe6ip7sMplClY68awO25YElQPels0xjRrndTYQ9Mg+OHaEM3IKpBKFBFCwAA
        ==
X-ME-Sender: <xms:CcKuXzH6cU74JQfthjgIlw2riADoUADWPI3f_oEAolXeLqehDOzXBw>
    <xme:CcKuXwWpcTg-e-K-B3fmzR0VNGKw7BByXgP-jzOfvCe_p9wZDCwXbIzmaYvyHwHtA
    LMotI7EtE6hGkt2DI0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeevgfehleejhfdtgfdtieffheeivefhleeufeelhfdtleekvdduudetkeeg
    gfdtgeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdhkvghrnhgvlhdroh
    hrghdprhhsthdrihhtnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhord
    htvggthh
X-ME-Proxy: <xmx:CcKuX1LNO0ShBtB7Ci75h9jxJZbL1-0P7Q602qAOMHAqrGevRKYoIA>
    <xmx:CcKuXxGEaXA_eFTaAiq8ygRZfPoH7KtW6N1bfUE8YAFDAMsKShYytw>
    <xmx:CcKuX5VFhGP9lyEXxQXXq7P7T7GDj0kBv7NByudiVxh9Ic6VUdYNLg>
    <xmx:CsKuXyNnC0WHs1gADzhmSIUkciny-0_X1erKMIznyGgLNpAAHjGiaA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1212C3280064;
        Fri, 13 Nov 2020 12:27:36 -0500 (EST)
Date:   Fri, 13 Nov 2020 18:27:35 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com,
        =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OV8865 bindings
 documentation
Message-ID: <20201113172735.mkgyrrobgxa33uo3@gilmour.lan>
References: <20201023175406.504527-1-paul.kocialkowski@bootlin.com>
 <20201023175406.504527-2-paul.kocialkowski@bootlin.com>
 <20201102232411.GD26150@paasikivi.fi.intel.com>
 <20201104102643.GH2123@aptenodytes>
 <20201105081954.GX26150@paasikivi.fi.intel.com>
 <20201105153534.GD615923@aptenodytes>
 <20201111131857.GC26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jvxvzt57fv4qmouk"
Content-Disposition: inline
In-Reply-To: <20201111131857.GC26150@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jvxvzt57fv4qmouk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed, Nov 11, 2020 at 03:18:57PM +0200, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Thu, Nov 05, 2020 at 04:35:34PM +0100, Paul Kocialkowski wrote:
> > Hi Sakari,
> >=20
> > On Thu 05 Nov 20, 10:19, Sakari Ailus wrote:
> > > Hi Paul,
> > >=20
> > > On Wed, Nov 04, 2020 at 11:26:43AM +0100, Paul Kocialkowski wrote:
> > > > Hi Sakari and thanks for the review!
> > > >=20
> > > > On Tue 03 Nov 20, 01:24, Sakari Ailus wrote:
> > > > > On Fri, Oct 23, 2020 at 07:54:04PM +0200, Paul Kocialkowski wrote:
> > > > > > This introduces YAML bindings documentation for the OV8865
> > > > > > image sensor.
> > > > > >=20
> > > > > > Co-developed-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.co=
m>
> > > > > > Signed-off-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>
> > > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > > ---
> > > > > >  .../bindings/media/i2c/ovti,ov8865.yaml       | 124 ++++++++++=
++++++++
> > > > > >  1 file changed, 124 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c=
/ovti,ov8865.yaml
> > > > > >=20
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,o=
v8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..807f1a94afae
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.y=
aml
> > > > > > @@ -0,0 +1,124 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov8865.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: OmniVision OV8865 Image Sensor Device Tree Bindings
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: ovti,ov8865
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    items:
> > > > > > +      - description: EXTCLK Clock
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    items:
> > > > > > +      - const: extclk
> > > > >=20
> > > > > Is this needed with a single clock?
> > > >=20
> > > > Yes I think so: we grab the clock with devm_clk_get which takes a n=
ame string
> > > > that matches the clock-names property.
> > >=20
> > > That argument may be NULL.
> >=20
> > Understood, let's get rid of clock-names then. I see this is done in a =
few
> > drivers already, but many also give it a name with a single clock.
> >=20
> > It would be nice if that was consistent across all drivers just so that=
 the
> > expectation is clear (that the best way for that to happen is probably =
to
> > fix up a patch myself though).
>=20
> I guess somewhat different practices exist depending on the tree albeit
> it's all DT bindings. It's also not wrong to have the name of the clock
> there, no, but virtually all camera sensors consume a single clock, so you
> may as well omit the information.
>=20
> >=20
> > > > > And... shouldn't this also come with assigned-clock-rates etc., t=
o set the
> > > > > clock frequency?
> > > >=20
> > > > I'm a bit confused why we would need to do that in the device-tree =
rather than
> > > > setting the clock rate with clk_set_rate in the driver, like any ot=
her driver
> > > > does. I think this was discussed before (on the initial ov8865 seri=
es) and the
> > > > conclusion was that there is no particular reason for media i2c dri=
vers to
> > > > behave differently. So I believe this is the correct approach.
> > >=20
> > > I'm not exactly sure about that conclusion.
> >=20
> > I may have jumped too far here. It's not exactly clear to me what was t=
he
> > conclusion from...
> > https://lore.kernel.org/linux-arm-kernel/20200401080705.j4goeqcqhoswhx4=
u@gilmour.lan/
>=20
> Yes, there has been more discussion on the topic, most recently in this
> thread:
>=20
> <URL:https://lore.kernel.org/linux-arm-kernel/20201102150547.GY26150@paas=
ikivi.fi.intel.com/>
>=20
> I think this deserves to be added to camera-sensor.rst .

It's not really a discussion though :)

We had back in that thread some issues with assigned-clock-rates that
don't get addressed at all.

> > > You can use clk_set_rate() if you get the frequency from DT, but we
> > > recently did conclude that camera sensor drivers can expect to get the
> > > frequency indicated by assigned-clock-rate property.
> >=20
> > ...but it looks like clock-frequency was preferred over assigned-clock-=
rates
> > and this is what the binding that was merged suggests. Is that correct?
>=20
> assigned-clock-rates is fine. The assumption is that the clock frequency
> does not change from the value set through DT, and the driver gets that
> exact frequency.

That's two fairly big assumptions though. A clock driver is free to
round the clock to whatever rate it wants, and assigned-clock-rates
doesn't provide any guarantee on this, nor does it let the potential
user know about it.

It might work for one-off cases, but there's no guarantee that it will
in the future since this is very much dependent on the clock setup,
driver and the other devices in the system (and to some extent the
configuration as well).

And since we only rely on it, we can't fix it properly either if it ever
occurs.

And then, semantically, this assigned-clock-rates isn't about what the
devices support but what the driver supports. The clock tree of
omnivision sensors (at least, I can't comment on the imx218 linked
above) allows for a very flexible input clock, it's only the driver that
requires it because most of its configuration relies on it.

It's definitely fine for the driver to do so, but it really doesn't
belong in the DT.

I thought we had an agreement on this last time we discussed it, but I'm
not really sure what made you change your mind.

Maxime

--jvxvzt57fv4qmouk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX67CBwAKCRDj7w1vZxhR
xRWPAP47g2s/EE2rvjK7GwH2pNEPq0EE+jFbu3OCDCZxC7DwIQD+MVMMKDj78TBu
FK5YAZU6z1agqGH8+Ca8B7TEYMFPIQc=
=kn0I
-----END PGP SIGNATURE-----

--jvxvzt57fv4qmouk--
