Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731223E33DE
	for <lists+linux-media@lfdr.de>; Sat,  7 Aug 2021 09:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhHGHGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Aug 2021 03:06:41 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53274 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhHGHGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Aug 2021 03:06:41 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0DAB81C0B7C; Sat,  7 Aug 2021 09:06:23 +0200 (CEST)
Date:   Sat, 7 Aug 2021 09:06:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, phone-devel@vger.kernel.org,
        robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v6 5/5] arm64: defconfig: enable VIDEO_HI846
Message-ID: <20210807070622.GA25211@amd>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
 <20210628101054.828579-6-martin.kepplinger@puri.sm>
 <20210708130003.GA3@valkosipuli.retiisi.eu>
 <YOcWCVSXfV+cKJ6H@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <YOcWCVSXfV+cKJ6H@qwark.sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Build the driver for the Hi-846 camera by default on arm64 where it's
> > > going to be used on at least the imx8mq-librem5 board.
> > >=20
> > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
=2E.
> > There appear to be a other sensor drivers though.
> >=20
> > Is there a defconfig for the librem5 board?
>=20
> arm64 has a single defconfig, there are no board specific ones (and
> afaik they're not wanted either) so I think enabling it as a module is
> the only way.

Given that other arm64 machines are basically devboards, and librem5
is a phone... where you expect tighter sw/hw configuration, maybe it
should have a separate defconfig.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEOMO0ACgkQMOfwapXb+vK77gCgpYzyL9RXKKjc2f7cfW+IWz+B
gWsAoKsV7p8tytKZYBFKu61kVHuaFkWs
=ngWb
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
