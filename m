Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B184D3916CB
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 13:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbhEZL6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 07:58:31 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45759 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhEZL6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 07:58:30 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A297F1BF213;
        Wed, 26 May 2021 11:56:52 +0000 (UTC)
Date:   Wed, 26 May 2021 13:56:52 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
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
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v5 02/16] phy: Distinguish between Rx and Tx for MIPI
 D-PHY with submodes
Message-ID: <YK43hBmFkyCChvKw@aptenodytes>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
 <20210115200141.1397785-3-paul.kocialkowski@bootlin.com>
 <58d6651d-09c3-2b93-bd5b-1807744b2354@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UpT672IaWUX8kc9y"
Content-Disposition: inline
In-Reply-To: <58d6651d-09c3-2b93-bd5b-1807744b2354@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--UpT672IaWUX8kc9y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 26 May 21, 13:50, Hans Verkuil wrote:
> On 15/01/2021 21:01, Paul Kocialkowski wrote:
> > As some D-PHY controllers support both Rx and Tx mode, we need a way for
> > users to explicitly request one or the other. For instance, Rx mode can
> > be used along with MIPI CSI-2 while Tx mode can be used with MIPI DSI.
> >=20
> > Introduce new MIPI D-PHY PHY submodes to use with PHY_MODE_MIPI_DPHY.
> > The default (zero value) is kept to Tx so only the rkisp1 driver, which
> > uses D-PHY in Rx mode, needs to be adapted.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Acked-by: Helen Koike <helen.koike@collabora.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  3 ++-
> >  include/linux/phy/phy-mipi-dphy.h                   | 13 +++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driv=
ers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 2e5b57e3aedc..cab261644102 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -948,7 +948,8 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp=
 *isp,
> > =20
> >  	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_widt=
h,
> >  					 sensor->lanes, cfg);
> > -	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
> > +	phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
> > +			 PHY_MIPI_DPHY_SUBMODE_RX);
>=20
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c: In function =E2=80=
=98rkisp1_mipi_csi2_start=E2=80=99:
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:951:19: error: =E2=80=
=98cdev=E2=80=99 undeclared (first use in this function)
>   951 |  phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
>       |                   ^~~~
>=20
> Huh?

Oh wow that's quite shameful. Apologies here.

Note that I'll rebase/respin this series. I also remember that it wasn't ve=
ry
consensual (on IRC) to use a submode to indicate rx vs tx mode and that
specifying that in the deivce-tree would be a better fit.

Cheers,

Paul

> Regards,
>=20
> 	Hans
>=20
> >  	phy_configure(sensor->dphy, &opts);
> >  	phy_power_on(sensor->dphy);
> > =20
> > diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-=
mipi-dphy.h
> > index a877ffee845d..0f57ef46a8b5 100644
> > --- a/include/linux/phy/phy-mipi-dphy.h
> > +++ b/include/linux/phy/phy-mipi-dphy.h
> > @@ -6,6 +6,19 @@
> >  #ifndef __PHY_MIPI_DPHY_H_
> >  #define __PHY_MIPI_DPHY_H_
> > =20
> > +/**
> > + * enum phy_mipi_dphy_submode - MIPI D-PHY sub-mode
> > + *
> > + * A MIPI D-PHY can be used to transmit or receive data.
> > + * Since some controllers can support both, the direction to enable is=
 specified
> > + * with the PHY sub-mode. Transmit is assumed by default with phy_set_=
mode.
> > + */
> > +
> > +enum phy_mipi_dphy_submode {
> > +	PHY_MIPI_DPHY_SUBMODE_TX =3D 0,
> > +	PHY_MIPI_DPHY_SUBMODE_RX,
> > +};
> > +
> >  /**
> >   * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
> >   *
> >=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--UpT672IaWUX8kc9y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmCuN4QACgkQ3cLmz3+f
v9G56Qf/VeVonmPZ3GPceNXtCiCz4D3aCK6rystut/m1RJlgBSNwDeUtp1Pb0PK5
tNuJ63rQ+pUuI0iFSlITn6EEQoUe6ohyMwWHSwajXbNd0hPRo0Td6pxNUpjM0/+Y
S3g9L9rsAQ191UhXje7YOZnS7baMLQ4Kk6fv86zvzoSZkTFdOcbhgc4O4OhDoOee
K7vqfkdk1fZdnb2RKoiET9Z2AoIomE6PmrC13LZFImyVQY10zMjmNO55pu9mscU1
YxtJpIol8m7xmRR77/8W0TMQRx7IhEsNnTEdsI+fCGov8sINrkteVLFLSwl/Y8Kc
Ql608acppD8E4uziTLEqWfpEyzt5fg==
=juJ8
-----END PGP SIGNATURE-----

--UpT672IaWUX8kc9y--
