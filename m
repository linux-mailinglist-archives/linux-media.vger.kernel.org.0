Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5944740A8A5
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhINHwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:52:09 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:34523 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhINHwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:52:03 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 07B6E4000C;
        Tue, 14 Sep 2021 07:50:41 +0000 (UTC)
Date:   Tue, 14 Sep 2021 09:50:41 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 20/22] staging: media: Add support for the Allwinner A31
 ISP
Message-ID: <YUBUUQxBaGUkjzMP@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-21-paul.kocialkowski@bootlin.com>
 <20210913083135.v7q7joux2xckat62@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="N+QqgaOnVGg+nb5A"
Content-Disposition: inline
In-Reply-To: <20210913083135.v7q7joux2xckat62@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--N+QqgaOnVGg+nb5A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 13 Sep 21, 10:31, Maxime Ripard wrote:
> On Fri, Sep 10, 2021 at 08:41:45PM +0200, Paul Kocialkowski wrote:
> > Some Allwinner platforms come with an Image Signal Processor, which
> > supports various features in order to enhance and transform data
> > received by image sensors into good-looking pictures. In most cases,
> > the data is raw bayer, which gets internally converted to RGB and
> > finally YUV, which is what the hardware produces.
> >=20
> > This driver supports ISPs that are similar to the A31 ISP, which was
> > the first standalone ISP found in Allwinner platforms. Simpler ISP
> > blocks were found in the A10 and A20, where they are tied to a CSI
> > controller. Newer generations of Allwinner SoCs (starting with the
> > H6, H616, etc) come with a new camera subsystem and revised ISP.
> > Even though these previous and next-generation ISPs are somewhat
> > similar to the A31 ISP, they have enough significant differences to
> > be out of the scope of this driver.
> >=20
> > While the ISP supports many features, including 3A and many
> > enhancement blocks, this implementation is limited to the following:
> > - V3s (V3/S3) platform support;
> > - Bayer media bus formats as input;
> > - Semi-planar YUV (NV12/NV21) as output;
> > - Debayering with per-component gain and offset configuration;
> > - 2D noise filtering with configurable coefficients.
> >=20
> > Since many features are missing from the associated uAPI, the driver
> > is aimed to integrate staging until all features are properly
> > described.
>=20
> We can add new features/interfaces to a !staging driver. Why do you
> think staging is required?

This is true for the driver but not so much for the uAPI, so it seems that
the uAPI must be added to staging in some way. Then I'm not sure it makes s=
ense
to have a !staging driver that depends on a staging uAPI.

Besides that, I added it to staging because that's the process that was
followed by rkisp1, which is a very similar case.

> > On the technical side, it uses the v4l2 and media controller APIs,
> > with a video node for capture, a processor subdev and a video node
> > for parameters submission. A specific uAPI structure and associated
> > v4l2 meta format are used to configure parameters of the supported
> > modules.
>=20
> This meta format needs to be documented

You're right, there should probably be a pixfmt-meta-sun6i-isp.rst
documentation file. I guess it should live along in the staging driver
directory for now and be destaged later.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--N+QqgaOnVGg+nb5A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmFAVFEACgkQ3cLmz3+f
v9FMhAf/bAGGMJm3PCVKPQFBMmTnl7dcHX2eA24BUWY8e+zsCMmd7A74imEjZUXg
xURaGLaWc3WVje8tq2idWiyGMIZOLPwlJBI2mhTnZaJiMhTxBN4NvURssuHyu+e6
lnvOUXXALN2oJPBoBVaTYuqMyECYxsWCjUjZG5XgASjlSIHZDH0jDkGAqfuOeRlB
r8dVEMjS/sWtBlLOp6Mw1Z1Rc8w3fEj5++D5bXd/aOGYavZeo2/2yn6cOoVsRsf3
abhdRCEy7tVL5hyb6HGD4CPkIcZtMcvVvxomiX5f7fVCba5iuexjdgzaugg/fsYi
0IMX9Lr/PmNJ9/5VNbHg7nfhhZcF/g==
=3ZW0
-----END PGP SIGNATURE-----

--N+QqgaOnVGg+nb5A--
