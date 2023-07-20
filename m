Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6773B75AA89
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 11:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjGTJW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 05:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjGTJWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 05:22:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F24B9022
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 02:03:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMPXw-0006Sa-OH; Thu, 20 Jul 2023 11:02:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMPXv-000nFK-SV; Thu, 20 Jul 2023 11:02:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMPXv-006JLF-0x; Thu, 20 Jul 2023 11:02:03 +0200
Date:   Thu, 20 Jul 2023 11:02:02 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] media: i2c: ov01a10: Switch back to use struct
 i2c_driver::probe
Message-ID: <20230720090202.aljhzxiac6pvmtag@pengutronix.de>
References: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="67hrxopyquksq6rx"
Content-Disposition: inline
In-Reply-To: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--67hrxopyquksq6rx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jun 26, 2023 at 11:05:33AM +0200, Uwe Kleine-K=F6nig wrote:
> struct i2c_driver::probe_new is about to go away. Switch the driver to
> use the probe callback with the same prototype.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/i2c/ov01a10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index de5bc19e715b..2b9e1b3a3bf4 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -992,7 +992,7 @@ static struct i2c_driver ov01a10_i2c_driver =3D {
>  		.pm =3D &ov01a10_pm_ops,
>  		.acpi_match_table =3D ACPI_PTR(ov01a10_acpi_ids),
>  	},
> -	.probe_new =3D ov01a10_probe,
> +	.probe =3D ov01a10_probe,
>  	.remove =3D ov01a10_remove,
>  };

I plan to ask Wolfram to merge a patch into i2c-next dropping .probe_new
for v6.7-rc1. I want to get this early into next after v6.6-rc1, so it
would be great to get this patch in before v6.6-rc1.

If this won't happen, the backup plan is to send this patch together
with the change of i2c_driver for Wolfram to merge via the i2c tree.

Is this patch still (or at all) on someone's radar for merging?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--67hrxopyquksq6rx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS4+AoACgkQj4D7WH0S
/k6M8AgAojyM6A7kyxRs4GDUt4Zt3TWcK6af46UjiTj6wJNmXNYPH64Gt15pFVBz
Ds+KmKUnWQsZIvCeZPSw5zPBrFpPzPynyjx/XwsbyKXENz1rMhFDQxaREQYgwGvv
9qcM95VPTB2DJl832zKCtsoeJ/RgLb355b6ExW0403mdEWQqxNfkfk5jH9L7yEAS
UugVJIYwkg+vPbZ2yWabFgkDT141JgyHeh7mhIEMd3++GALdkPM/x971tOA4fqk9
61qhv9G2McADk/bAKme3H+mErASdMm1V4NBzcdvNuuHGSSxBt8zNMr/2cjclSiGo
RwmCxqaijo4bdU8aJ4NdxHZTo5rsIw==
=WYYT
-----END PGP SIGNATURE-----

--67hrxopyquksq6rx--
