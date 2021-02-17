Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1993B31D6B3
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 09:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhBQIjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 03:39:31 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:55079 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhBQIjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 03:39:31 -0500
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6DF5924000F;
        Wed, 17 Feb 2021 08:38:44 +0000 (UTC)
Date:   Wed, 17 Feb 2021 09:38:43 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, ezequiel@collabora.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mripard@kernel.org,
        wens@csie.org, jernej.skrabec@siol.net, krzk@kernel.org,
        shengjiu.wang@nxp.com, adrian.ratiu@collabora.com,
        aisheng.dong@nxp.com, peng.fan@nxp.com, Anson.Huang@nxp.com,
        hverkuil-cisco@xs4all.nl, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 00/18] Add HANTRO G2/HEVC decoder support for IMX8MQ
Message-ID: <YCzWE9VNK9yd+Db+@aptenodytes>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <YCzO7SRmBKzGeMUS@kroah.com>
 <04dfae0b-92e5-e02d-c687-ba4d28b7aaf2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7ow2nU972vRHVC8/"
Content-Disposition: inline
In-Reply-To: <04dfae0b-92e5-e02d-c687-ba4d28b7aaf2@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7ow2nU972vRHVC8/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Wed 17 Feb 21, 09:28, Benjamin Gaignard wrote:
> Le 17/02/2021 =C3=A0 09:08, Greg KH a =C3=A9crit=C2=A0:
> > On Wed, Feb 17, 2021 at 09:02:48AM +0100, Benjamin Gaignard wrote:
> > > The IMX8MQ got two VPUs but until now only G1 has been enabled.
> > > This series aim to add the second VPU (aka G2) and provide basic
> > > HEVC decoding support.
> > Why are you adding this directly to drivers/staging/media/ and not
> > drivers/media/?  Why can't this just go to the main location and not
> > live in staging?
>=20
> G2/HEVC is added inside the already exiting Hantro driver, it is "just"
> an other codec from Hantro driver point of view.
> In addition of that v4l2-hevc uAPI is still unstable.
> One goal of this series is to have one more consumer of this v4l2-hevc
> uAPI so maybe we can claim it to be stable enough to move away from stagi=
ng
> and then do the same for Hantro driver. That would be a great achievement=
 !

Thanks for working on Hantro G2 support!

As the initial author of the HEVC API, it definitely does not feel ready to
be destaged. The API has lots of issues and limitation and I think signific=
ant
work is still needed.

This initial implementation was kind of a proof of concept for simple cases.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--7ow2nU972vRHVC8/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmAs1hMACgkQ3cLmz3+f
v9HIZQf/XT0QkO85qqIKOjBJc13qI9EuI0hqS/3DaKfoLDUlh/YYkNRNKq2LPJUO
Yn6zxwbKF7ztf8Xilpb+KN9Ab4Iiuo99wFFaPT+QicAiXnP4mPGTnsElI0vLXYtX
Cvj4oZa7Yt1d3tj6bdntUkickpI5N9jnTsfUGDgbY7UNiHPhkKrFXnm2k/YlSG0c
jThLGevtAfaArPhOdLRw2mbfxEXPWTIetrvFBsUBw82Zr1HUtB6ugUXKWwhZogly
3XU23bzYbrJQNXrwN93W2XIe6izSwknWrJeAB1UwaXkhVKnlCv/hjeLxKAf9/D/D
Q7TKg/z2kPWnZWqv5cir0FevaaaxwA==
=n/FC
-----END PGP SIGNATURE-----

--7ow2nU972vRHVC8/--
