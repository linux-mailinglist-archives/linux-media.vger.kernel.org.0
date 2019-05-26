Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271662ABBF
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 21:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfEZTEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 15:04:16 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48587 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfEZTEQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 15:04:16 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BA316240002;
        Sun, 26 May 2019 19:04:11 +0000 (UTC)
Date:   Sun, 26 May 2019 21:04:10 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: media: sunxi-ir: Add A64 compatible
Message-ID: <20190526190410.ngrvrclp5ge5rdqy@flea>
References: <20190525180923.6105-1-peron.clem@gmail.com>
 <20190525180923.6105-5-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w6dqjdni2ih5gdsl"
Content-Disposition: inline
In-Reply-To: <20190525180923.6105-5-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--w6dqjdni2ih5gdsl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2019 at 08:09:17PM +0200, Cl=E9ment P=E9ron wrote:
> There is some minor differences between A31 and A64 driver.
>
> But A31 IR driver is compatible with A64.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/sunxi-ir.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Docum=
entation/devicetree/bindings/media/sunxi-ir.txt
> index 53e88ebb53fe..da5aeba843de 100644
> --- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> +++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> @@ -5,6 +5,7 @@ Required properties:
>  	"allwinner,sun4i-a10-ir"
>  	"allwinner,sun5i-a13-ir"
>  	"allwinner,sun6i-a31-ir"
> +	"allwinner,sun50i-a64-ir", "allwinner,sun6i-a31-ir"

I guess resets is mandatory for the A31 onwards too, right?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--w6dqjdni2ih5gdsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOrjKgAKCRDj7w1vZxhR
xQ69AP9KzirH0gAauBKyHVeF6rXLXOLssPNHmqkbjf6FMstJIAEAvZfH+Pmy/Uxe
k16aY3T57rVDb23zD0ZgAvrdiP9uXwU=
=dC11
-----END PGP SIGNATURE-----

--w6dqjdni2ih5gdsl--
