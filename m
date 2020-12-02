Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F6C2CBF71
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbgLBOUA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:20:00 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:53775 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730343AbgLBOT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 09:19:59 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4856DC0007;
        Wed,  2 Dec 2020 14:19:12 +0000 (UTC)
Date:   Wed, 2 Dec 2020 15:19:11 +0100
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
Subject: Re: [PATCH v2 07/19] media: sun6i-csi: Add support for MIPI CSI-2
 bridge input
Message-ID: <X8eiXxYw1iHKbdDV@aptenodytes>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-8-paul.kocialkowski@bootlin.com>
 <20201201121241.cyafjhot45puusfc@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tDn8NpJ7qnoGqYpK"
Content-Disposition: inline
In-Reply-To: <20201201121241.cyafjhot45puusfc@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tDn8NpJ7qnoGqYpK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 01 Dec 20, 13:12, Maxime Ripard wrote:
> Hi,
>=20
> On Sat, Nov 28, 2020 at 03:28:27PM +0100, Paul Kocialkowski wrote:
> > The A31 CSI controller supports a MIPI CSI-2 bridge input, which has
> > its own dedicated port in the fwnode graph.
> >=20
> > Support for this input is added with this change:
> > - two pads are defined for the media entity instead of one
> >   and only one needs to be connected at a time;
> > - the pads currently match the fwnode graph representation;
> > - links are created between our pads and the subdevs for each
> >   interface and are no longer immutable so that userspace can select
> >   which interface to use in case both are bound to a subdev;
> > - fwnode endpoints are parsed and stored for each interface;
> > - the active subdev (and fwnode endpoint) is retrieved when validating
> >   the media link at stream on time and cleared at stream off;
> > - an error is raised if both links are active at the same time;
> > - the MIPI interface bit is set if the MIPI CSI-2 bridge endpoint is
> >   active.
> >=20
> > In the future, the media entity representation might evolve to:
> > - distinguish the internal parallel bridge and data formatter;
> > - represent each of the 4 internal channels that can exist between
> >   the parallel bridge (for BT656 time-multiplex) and MIPI CSI-2
> >   (internal channels can be mapped to virtual channels);
> > - connect the controller's output to the ISP instead of its
> >   DMA engine.
> >=20
> > Finally note that the MIPI CSI-2 bridges should not be linked in
> > the fwnode graph unless they have a sensor subdev attached.
>=20
> I'll leave most of the review to Laurent and Sakari, but I'm not quite
> sure what you meant in the last paragraph. Did you mean that the
> MIPI-CSI controller in the Allwinner SoC should only be linked if it has
> a sensor attached, or did you mean that any MIPI-CSI2 bridge cannot be
> attached to the controller?

So the use of plural was a mistake and your first understanding is the corr=
ect
one: if the bridge is linked to the CSI controller in the OF graph but the
bridge doesn't have a sensor attached, the CSI controller driver will fail
to probe, as far as I could see.

I haven't investigated much but it looks like this is expected behavior.

> Also, having somewhere (like your cover letter) the media-ctl setup you
> tested with would be great.

Understood!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--tDn8NpJ7qnoGqYpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/Hol8ACgkQ3cLmz3+f
v9EqPAf/X3YxsNi+JcqhfeAseKXD/cboW7DdagCpjzxZ/RZN8sjOJGOKhxrKkxw5
wkAPyF/nPPaqeSUF20XtgSx/rwQqMrOb1efwgUY22v7rq1u4Kw4kcVl9iLfS3xpo
B2fcBhgLvne3l6tpGUiKoQS7cNTiVMAYw6scpEPCpZ/mA6pV02upCEFcrZkGUw7i
scOA6986c3kONoWQQ6Zu5x7J7DMklN/+kc+zkZt/Vb6ZwSOO+/DMopUMsbhv0Op3
FBYySRjzikhFTMYjtLWvIqihnpaCr3OXroEMgS1sGIpsUepFeMvVbL1ihmgNo7vh
T9iQ6dPLnWvDl4gg4XMefkTAB4BRUg==
=iVuy
-----END PGP SIGNATURE-----

--tDn8NpJ7qnoGqYpK--
