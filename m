Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBF42CC1C8
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 17:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730655AbgLBQKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 11:10:09 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58511 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727678AbgLBQKI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 11:10:08 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 23E8520002;
        Wed,  2 Dec 2020 16:09:20 +0000 (UTC)
Date:   Wed, 2 Dec 2020 17:09:20 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
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
Subject: Re: [PATCH v2 13/19] media: sunxi: Add support for the A31 MIPI
 CSI-2 controller
Message-ID: <X8e8MNc5WYnpKTyy@aptenodytes>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-14-paul.kocialkowski@bootlin.com>
 <20201201122038.bxk3vu2w3mg43ayq@gilmour>
 <X8eoX+M650sMXqpx@aptenodytes>
 <20201202154818.bf72m2firemyc5ve@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NYHUWLtOMJokL+dM"
Content-Disposition: inline
In-Reply-To: <20201202154818.bf72m2firemyc5ve@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--NYHUWLtOMJokL+dM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 02 Dec 20, 16:48, Maxime Ripard wrote:
> On Wed, Dec 02, 2020 at 03:44:47PM +0100, Paul Kocialkowski wrote:
> > > > +static int __maybe_unused sun6i_mipi_csi2_suspend(struct device *d=
ev)
> > > > +{
> > > > +	struct sun6i_mipi_csi2_dev *cdev =3D dev_get_drvdata(dev);
> > > > +
> > > > +	clk_disable_unprepare(cdev->clk_mod);
> > > > +	clk_disable_unprepare(cdev->clk_bus);
> > > > +	reset_control_assert(cdev->reset);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int __maybe_unused sun6i_mipi_csi2_resume(struct device *de=
v)
> > > > +{
> > > > +	struct sun6i_mipi_csi2_dev *cdev =3D dev_get_drvdata(dev);
> > > > +	int ret;
> > > > +
> > > > +	ret =3D reset_control_deassert(cdev->reset);
> > > > +	if (ret) {
> > > > +		dev_err(cdev->dev, "failed to deassert reset\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret =3D clk_prepare_enable(cdev->clk_bus);
> > > > +	if (ret) {
> > > > +		dev_err(cdev->dev, "failed to enable bus clock\n");
> > > > +		goto error_reset;
> > > > +	}
> > > > +
> > > > +	ret =3D clk_prepare_enable(cdev->clk_mod);
> > > > +	if (ret) {
> > > > +		dev_err(cdev->dev, "failed to enable module clock\n");
> > > > +		goto error_clk_bus;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +
> > > > +error_clk_bus:
> > > > +	clk_disable_unprepare(cdev->clk_bus);
> > > > +
> > > > +error_reset:
> > > > +	reset_control_assert(cdev->reset);
> > > > +
> > > > +	return ret;
> > > > +}
> > >=20
> > > I'm guessing you set the __maybe_unused attribute because you're using
> > > SET_RUNTIME_PM_OPS, but what would happen if runtime_pm isn't selecte=
d?
> > > It looks like you don't handle that case.
> >=20
> > Indeed, __maybe_unused is because of the conditional definition of
> > SET_RUNTIME_PM_OPS. If CONFIG_PM is not selected, then I guess the cont=
roller
> > wouldn't be powered and wouldn't work. So I should definitely add a Kco=
nfig
> > dependency on PM then, right?
>=20
> There's two ways we can do it. What you suggested is one, the other is
> to have something like our SPI driver to call directly the resume
> function if there's no runtime pm support.

Understood! I think I'll stick to depending on PM (unless you prefer not to)
but it's good to know.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--NYHUWLtOMJokL+dM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/HvDAACgkQ3cLmz3+f
v9Fm8AgAiWV6aebhuxeTBIhOQywJt0bWH442ibCI6O2W3BO1aBzn5le48//KHOBW
3KuGiKTjL4guqfc4fNKG+moEqOai8v11MAVAz8ii/74l0WyN4LYUFwrKRJzGwS0J
KQw/ldQxF5u8pYMGxaderBmACdscPzBoTvQZuVshEnRlQ9qKUHIsDa6CGieDQqIs
9GNj9KiG/mWBV/AAYRwvllA3QW/EQJo3zbNs7wAAMMtOebNwSfh6P9peh8/memFn
3MOHDAbEKAHKUWimARCMBhOQRGnQf3/wjBif0L7iebN4FUYqyl8cN5iOCwGVwfgs
iFi3TSt1u9r0cUsE5yzDwsR6UZBipA==
=TddM
-----END PGP SIGNATURE-----

--NYHUWLtOMJokL+dM--
