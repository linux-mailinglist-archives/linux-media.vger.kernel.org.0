Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18CFB2AFA4
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 10:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfE0IAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 04:00:08 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:59520 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfE0IAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 04:00:07 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9A6AC3A293C;
        Mon, 27 May 2019 07:47:56 +0000 (UTC)
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4DDFCC000B;
        Mon, 27 May 2019 07:47:46 +0000 (UTC)
Date:   Mon, 27 May 2019 09:47:45 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 03/10] ARM: dts: sunxi: prefer A31 instead of A13 for
 ir
Message-ID: <20190527074745.5oyt5tyuoc75ntiq@flea>
References: <20190526222536.10917-1-peron.clem@gmail.com>
 <20190526222536.10917-4-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pp6ncxjpttni4i4p"
Content-Disposition: inline
In-Reply-To: <20190526222536.10917-4-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--pp6ncxjpttni4i4p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 12:25:29AM +0200, Cl=E9ment P=E9ron wrote:
> Since A31, memory mapping of the IR driver has changed.
>
> Prefer the A31 bindings instead of A13.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi   | 2 +-
>  arch/arm/boot/dts/sun8i-a83t.dtsi  | 2 +-
>  arch/arm/boot/dts/sun9i-a80.dtsi   | 2 +-
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-

Can you split the H3 in a separate patch? this will go through a
separate branch.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--pp6ncxjpttni4i4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOuWIQAKCRDj7w1vZxhR
xUx7AQDWMM7bqbWyusgAqBceK1Mm3YxF86z+jSIPo7ooKR2vMgEApTPK5Q9rYvHu
XiaJRAAZYlSm12fyKBMhDUzo2be/fwE=
=ZMdg
-----END PGP SIGNATURE-----

--pp6ncxjpttni4i4p--
