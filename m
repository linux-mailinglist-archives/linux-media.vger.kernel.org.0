Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF7C2ABBC
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 21:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfEZTC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 15:02:29 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57321 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfEZTC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 15:02:29 -0400
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 00D03E0004;
        Sun, 26 May 2019 19:02:17 +0000 (UTC)
Date:   Sun, 26 May 2019 21:02:17 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: media: A31 compatible
Message-ID: <20190526190217.257pxcc5s7ykhfor@flea>
References: <20190525180923.6105-1-peron.clem@gmail.com>
 <20190525180923.6105-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fixx4walej3237eu"
Content-Disposition: inline
In-Reply-To: <20190525180923.6105-2-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fixx4walej3237eu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2019 at 08:09:14PM +0200, Cl=E9ment P=E9ron wrote:
> Since Allwiner A31 all the SoC have a differente memory mapping.
>
> Introduce this bindings to make a difference since this generation.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Mentionning what those differences are would be great

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--fixx4walej3237eu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOriuQAKCRDj7w1vZxhR
xTASAQD6Wi2ICXvIPJ05HniVnXyZB8cnILj79M1CnvRyCopIcgEA8GaT4uirtpjm
hqkVRx+GM4IfajVP24uTAnHe4TJuxgs=
=yeHd
-----END PGP SIGNATURE-----

--fixx4walej3237eu--
