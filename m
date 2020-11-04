Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900082A6201
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbgKDKhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:37:40 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36253 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729473AbgKDKhi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:37:38 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 42D764000A;
        Wed,  4 Nov 2020 10:37:32 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:37:31 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 12/14] media: sunxi: Add support for the A83T MIPI CSI-2
 controller
Message-ID: <20201104103731.GC285779@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-13-paul.kocialkowski@bootlin.com>
 <20201026170041.qsjzxlurufuuhcsq@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline
In-Reply-To: <20201026170041.qsjzxlurufuuhcsq@gilmour.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 26 Oct 20, 18:00, Maxime Ripard wrote:
> On Fri, Oct 23, 2020 at 07:45:44PM +0200, Paul Kocialkowski wrote:
> > The A83T supports MIPI CSI-2 with a composite controller, covering both=
 the
> > protocol logic and the D-PHY implementation. This controller seems to b=
e found
> > on the A83T only and probably was abandonned since.
> >=20
> > This implementation splits the protocol and D-PHY registers and uses th=
e PHY
> > framework internally. The D-PHY is not registered as a standalone PHY d=
river
> > since it cannot be used with any other controller.
> >=20
> > There are a few notable points about the controller:
> > - The initialisation sequence involes writing specific magic init value=
s that
> >   do not seem to make any particular sense given the concerned register=
 fields.
> > - Interrupts appear to be hitting regardless of the interrupt mask regi=
sters,
> >   which can cause a serious flood when transmission errors occur.
>=20
> Ah, so it's a separate driver too.
>=20
> > This work is based on the first version of the driver submitted by
> > K=C3=A9vin L'h=C3=B4pital, which was adapted to mainline from the Allwi=
nner BSP.
> > This version integrates MIPI CSI-2 support as a standalone V4L2 subdev
> > instead of merging it in the sun6i-csi driver.
> >=20
> > It was tested on a Banana Pi M3 board with an OV8865 sensor in a 4-lane
> > configuration.
>=20
> Co-developped-by and SoB from Kevin?

Not really. I wrote this driver from scratch and even significantly reworked
the register descriptions to the point that I don't think it makes sense to
consider that he's an author. For parts that can be considered a derivative
work, copyright attribution was given in the header.

Cheers,

Paul

> Looking at the driver, the same comments from the v3s apply there
>=20
> Maxime

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+ihGcACgkQ3cLmz3+f
v9HKqAf+OuoO0165XskKVuTp2nDVtSSL8D+0v2Fji8v+foCHk2qq8v2otrqY5Ey+
ptEefRqzPa/VFRm5ZShzliEzeFK1vE+0/NE/n9QU4KdkhNUNnMGUIYGtEIvQr+Qo
QOqecdSX0SR0qy/CMHbuNQJRRSzZ1AkYjq6g/023m3VMUOvGajq+2cwWYpYE0SC/
Ngjd/deVC3yvosBdjwUfzyB2zj6pNOM8PQrUnIpiO2pBsZcXqqQ4QgLmi1UgtSrz
RsTW9bMwsz7IRyogs4dCrb6s3ooCuK+Ox3v7bqng99Eqe/n6oIveLzRNS5QnlKMa
rDjvmpkshuvTgPMU/kQlaGL1k20Lxw==
=i052
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
