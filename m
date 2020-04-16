Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B267D1AC16B
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 14:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635744AbgDPMis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 08:38:48 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48735 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632877AbgDPMil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 08:38:41 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DA089E0013;
        Thu, 16 Apr 2020 12:38:34 +0000 (UTC)
Date:   Thu, 16 Apr 2020 14:38:34 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/4] media: rockchip: rga: PX30 support and YUV2YUV fix
Message-ID: <20200416123834.GG125838@aptenodytes>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
 <d33aef355623a5abd6eec176d33a167c456ed915.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S5HS5MvDw4DmbRmb"
Content-Disposition: inline
In-Reply-To: <d33aef355623a5abd6eec176d33a167c456ed915.camel@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--S5HS5MvDw4DmbRmb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ezequiel,

On Thu 16 Apr 20, 09:22, Ezequiel Garcia wrote:
> Hi Paul,
>=20
> Thanks for the patch.
>=20
> On Thu, 2020-04-16 at 13:50 +0200, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > This series adds support for the Rockchip PX30 SoC in the V4L2 M2M RGA =
driver.
> > It also contains a fix for the YUV2YUV case that was not properly handl=
ed.
>=20
> How have you been testing this?

I tested it with a standalone utility setting V4L2_PIX_FMT_YUV420 on both
output and capture. The issue should be pretty easy to reproduce.

Cheers,

Paul

> Thanks,
> Ezequiel
>=20
> > Cheers,
> >=20
> > Paul
> >=20
> > Paul Kocialkowski (4):
> >   dt-bindings: rockchip-rga: Add PX30 compatible
> >   arm64: dts: rockchip: Add RGA support to the PX30
> >   media: rockchip: rga: Add support for the PX30 compatible
> >   media: rockchip: rga: Only set output CSC mode for RGB input
> >=20
> >  .../devicetree/bindings/media/rockchip-rga.txt |  1 +
> >  arch/arm64/boot/dts/rockchip/px30.dtsi         | 11 +++++++++++
> >  drivers/media/platform/rockchip/rga/rga-hw.c   | 18 +++++++++++-------
> >  drivers/media/platform/rockchip/rga/rga.c      |  4 +++-
> >  4 files changed, 26 insertions(+), 8 deletions(-)
> >=20
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--S5HS5MvDw4DmbRmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6YUcoACgkQ3cLmz3+f
v9EMAQf8C+o9NTz5s1Go3gR6vgIrpWCEJZ018/7aZT+9I8EdjoBxSH0wE9Nl/Ir6
99oB3jHnwpjXEisECpuYP29hhXJl8O7wsuJGu21Jq9Nil/wMJRO2sbkkVuNDHNGi
R6uiCiwoj71YvB5W3QR7wVf+2przwmkdGtg6+xjVa6mFVACIE91EAC3oJHrCAdjO
WS+3EXhZ6kisMEMOhSKGVqe2X5xLitPfHm5N7owGiCYy210dxmciQhe1mqbagcBO
QQCFM1DpzUdMz6JFE68azeMHq+InMno9rrlbNBqwJcm2oYIDZ8FlzTP/pitouaFs
pFewZcsp2SqyCM+TzUdiBighDMz3sg==
=6ymt
-----END PGP SIGNATURE-----

--S5HS5MvDw4DmbRmb--
