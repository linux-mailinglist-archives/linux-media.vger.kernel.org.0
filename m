Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B02F50E945
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 21:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbiDYTRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 15:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiDYTRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 15:17:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E6A2E0BA
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 12:13:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nj49f-0002yP-70; Mon, 25 Apr 2022 21:13:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nj49f-005Cln-R4; Mon, 25 Apr 2022 21:13:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nj49d-005aSv-DR; Mon, 25 Apr 2022 21:13:49 +0200
Date:   Mon, 25 Apr 2022 21:13:45 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: dw9714: Return zero in remove callback
Message-ID: <20220425191345.utl5jz5ajbzeqost@pengutronix.de>
References: <20220331133132.296971-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6oq622dig2gttrlb"
Content-Disposition: inline
In-Reply-To: <20220331133132.296971-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6oq622dig2gttrlb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Mar 31, 2022 at 03:31:32PM +0200, Uwe Kleine-K=F6nig wrote:
> The only effect of returning an error code in an i2c remove callback is
> that the i2c core emits a generic warning and still removes the device.
>=20
> So even if disabling the regulator fails it's sensible to further cleanup
> and then return zero to only emit a single error message.
>=20
> This patch is a preparation for making i2c remove callbacks return void.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/i2c/dw9714.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> index cd7008ad8f2f..982ed8afebf5 100644
> --- a/drivers/media/i2c/dw9714.c
> +++ b/drivers/media/i2c/dw9714.c
> @@ -201,7 +201,6 @@ static int dw9714_remove(struct i2c_client *client)
>  		if (ret) {
>  			dev_err(&client->dev,
>  				"Failed to disable vcc: %d\n", ret);
> -			return ret;
>  		}
>  	}
>  	pm_runtime_set_suspended(&client->dev);

Who cares for this driver and so for this patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6oq622dig2gttrlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJm8uYACgkQwfwUeK3K
7Ak6cAf+PE56uN9IRu42OH5C61WkcS+KoUUawQgTsJ80pkpUHg6SyozH78sldU7H
xnPfPSk1XmLoO/g/XQ7oRynyMKvAjzmPIloZUr1CyIum2WoFh80M7z0pen4nBWne
YGbgawtI/VeSG4HiKMpbefVVnFWMJInTNM7Plt5riQNjTiwLHTZzrkK+LyZUFVMG
VxY9MgUt92mBlIFWQTL9nIZYlOxSRuVTTwI0ytp4lO0FfDYzbUFLroVxUnRHn3fg
OZPP0sfnQ/lthuQbfScNnfYEFUVpXRd8OmnAeI0YtvPv7lkYU8Ah4HNCugf8Y+uM
nGD6WEqYRX71QkPtkEB2wMDzGEnPDw==
=i1KF
-----END PGP SIGNATURE-----

--6oq622dig2gttrlb--
