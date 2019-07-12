Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4208C6694A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 10:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfGLIny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 04:43:54 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:42478 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfGLIny (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 04:43:54 -0400
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 999A471D4A0; Fri, 12 Jul 2019 10:43:51 +0200 (CEST)
Date:   Fri, 12 Jul 2019 10:43:46 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
Message-ID: <20190712084343.GA28962@taurus.defre.kleine-koenig.org>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 04, 2019 at 12:33:22PM +0200, Marc Gonzalez wrote:
> Refactor the command setup code, and let the compiler determine
> the size of each command.
>=20
> Reviewed-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Changes from v1:
> - Use a real function to populate struct si2168_cmd *cmd, and a trivial
> macro wrapping it (macro because sizeof).
> Changes from v2:
> - Fix header mess
> - Add Jonathan's tag
> ---
>  drivers/media/dvb-frontends/si2168.c | 146 +++++++++------------------
>  1 file changed, 45 insertions(+), 101 deletions(-)
>=20
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-fro=
ntends/si2168.c
> index c64b360ce6b5..5e81e076369c 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -12,6 +12,16 @@
> =20
>  static const struct dvb_frontend_ops si2168_ops;
> =20
> +static void cmd_setup(struct si2168_cmd *cmd, char *args, int wlen, int =
rlen)

I'd add an "inline" here. And you could add a const for *args.

> +{
> +	memcpy(cmd->args, args, wlen);
> +	cmd->wlen =3D wlen;
> +	cmd->rlen =3D rlen;
> +}
> +
> +#define CMD_SETUP(cmd, args, rlen) \
> +	cmd_setup(cmd, args, sizeof(args) - 1, rlen)

Here is the chance to add some static checking. Also it is a good habit
to put parens around macro arguments.

Something like:

#define CMD_SETUP(cmd, args, rlen) ({ \
	BUILD_BUG_ON(sizeof((args)) - 1 > SI2168_ARGLEN);
	cmd_setup((cmd), (args), __must_be_array((args)) + sizeof((args)) - 1, (rl=
en));

Maybe let this macro live in drivers/media/dvb-frontends/si2168_priv.h
where struct si2168_cmd is defined?

I looked over the transformations in the rest of the patch and this
looks good.

Best regards
Uwe

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl0oSDwACgkQwfwUeK3K
7AkeBAf+I6QEDR298PCHto1ijeLdlLRFE7Ietsd+QeVUPOfW8FqfEowGHGd9gmPd
kzR3NzgupP4MFxxw00BVwxf9iOeBMo94Q6ggPzBDI4X5BE71jFhwo3+QkJM7XuyX
TAHq3pZ5aMInl27Kw54PxqCYRHPozZ4JxnsVys6kJvh/JkaiRMQApxm69ry10J23
u/gBDTnC80FsAjJ0QRSGBzjPytcx0UeAf/RXPodE5mtz0PAiyVefyK6+NRXrxEcW
mZqfi8T4azYGcijVK4qU+bSAkRjwwk8Xdthkby1C7IhjR0yOSh2g0ZyH0hG3w4Xi
M+2jYIacxtSrd3sDzOvT3k6eB7DS9w==
=yXyE
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
