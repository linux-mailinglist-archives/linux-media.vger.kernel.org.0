Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFFE63B289
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 11:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389187AbfFJJwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 05:52:49 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:46995 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388315AbfFJJws (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 05:52:48 -0400
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2FD22200018;
        Mon, 10 Jun 2019 09:52:44 +0000 (UTC)
Date:   Mon, 10 Jun 2019 11:52:43 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 04/13] media: rc: sunxi: Add RXSTA bits definition
Message-ID: <20190610095243.7xwp4xhauds22qzw@flea>
References: <20190607231100.5894-1-peron.clem@gmail.com>
 <20190607231100.5894-5-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ivt2koe4dst4bk6o"
Content-Disposition: inline
In-Reply-To: <20190607231100.5894-5-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ivt2koe4dst4bk6o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 08, 2019 at 01:10:51AM +0200, Cl=E9ment P=E9ron wrote:
> We are using RXINT bits definition when looking at RXSTA register.
>
> These bits are equal but it's not really proper.
>
> Introduce the RXSTA bits and use them to have coherency.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ivt2koe4dst4bk6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP4oawAKCRDj7w1vZxhR
xczjAP9NhvNXW8RraDQEXB1eNk6zeYRoUohLhNFarH0MsVC7hQEAx0/R3cfra11q
g8lAS+DDEk4kx5iSDIwC7EK1bfYB7Q0=
=c9cn
-----END PGP SIGNATURE-----

--ivt2koe4dst4bk6o--
