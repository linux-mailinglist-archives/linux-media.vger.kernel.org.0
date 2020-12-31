Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0522E8020
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 13:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgLaMzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 07:55:18 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35679 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbgLaMzQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 07:55:16 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 75D64E0003;
        Thu, 31 Dec 2020 12:54:28 +0000 (UTC)
Date:   Thu, 31 Dec 2020 13:54:28 +0100
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
Subject: Re: [PATCH v3 09/15] media: sunxi: Add support for the A31 MIPI
 CSI-2 controller
Message-ID: <X+3KBO6o5HVRh12e@aptenodytes>
References: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
 <20201211155708.154710-10-paul.kocialkowski@bootlin.com>
 <20201214113904.v6j7z3yrvjv74dcd@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UZSCC+lhIG3E1TOG"
Content-Disposition: inline
In-Reply-To: <20201214113904.v6j7z3yrvjv74dcd@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--UZSCC+lhIG3E1TOG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 14 Dec 20, 12:39, Maxime Ripard wrote:
> On Fri, Dec 11, 2020 at 04:57:02PM +0100, Paul Kocialkowski wrote:
> > +#define sun6i_mipi_csi2_subdev_video(subdev) \
> > +	container_of(subdev, struct sun6i_mipi_csi2_video, subdev)
> > +
> > +#define sun6i_mipi_csi2_video_dev(video) \
> > +	container_of(video, struct sun6i_mipi_csi2_dev, video)
>=20
> Isn't it a bit unsafe?
>=20
> The second subdev and video here is not the variable passed in the macro
> but the field in the structure, so any attempt at using those two macros
> with anything but a variable named subdev or video will result in a
> compilation issue?

Yep you're totally right. Will fix in the next revision!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--UZSCC+lhIG3E1TOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/tygMACgkQ3cLmz3+f
v9Gp0Qf9Hfjq6i2KFmaJ6VFCJGzJSNnxgEPWekzxZsKrMDphbOVlEpz/VH+lLz6I
UIDtiIhRqxp5j3WH0lU61Ysfd+Dl9SFinxRm4UXDzhGXrK8Bi1W3V30n//pWlA1t
fHgDXXWcjZ2iEB/lnwa8KmR06JbDW6F2TS7j9Bstxoaxya4uGrQHejHoj6hfO+pr
p8EvkYsBTVlhRi0meK8bFIfdvW6yT7ijmTFb/yK41Hm3TX3//AZiexLaEasvlFuH
qUp2sZjEziH3ah6cuVjUQaUgzjxGPdp54/sDK6VRGATnSDmkSOvcTq03JMgdAJtx
mwoTJPVY3a2Iid1xnqiJA6BzQCGFSA==
=ofsU
-----END PGP SIGNATURE-----

--UZSCC+lhIG3E1TOG--
