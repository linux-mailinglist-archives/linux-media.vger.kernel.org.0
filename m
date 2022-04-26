Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D933950F95C
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 11:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345975AbiDZJrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 05:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346322AbiDZJrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 05:47:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED711AA
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 02:03:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1njH64-0002Uk-EN; Tue, 26 Apr 2022 11:03:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1njH64-005JjF-RD; Tue, 26 Apr 2022 11:02:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1njH62-005hd8-FD; Tue, 26 Apr 2022 11:02:58 +0200
Date:   Tue, 26 Apr 2022 11:02:55 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: dw9714: Return zero in remove callback
Message-ID: <20220426090255.nhguw7nd4asxrhab@pengutronix.de>
References: <20220331133132.296971-1-u.kleine-koenig@pengutronix.de>
 <20220425191345.utl5jz5ajbzeqost@pengutronix.de>
 <Ymeq5Q4kVu1yoKFq@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ktv55misoucduzvp"
Content-Disposition: inline
In-Reply-To: <Ymeq5Q4kVu1yoKFq@paasikivi.fi.intel.com>
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


--ktv55misoucduzvp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 11:18:45AM +0300, Sakari Ailus wrote:
> Hi Uwe,
>=20
> On Mon, Apr 25, 2022 at 09:13:45PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Thu, Mar 31, 2022 at 03:31:32PM +0200, Uwe Kleine-K=F6nig wrote:
> > > The only effect of returning an error code in an i2c remove callback =
is
> > > that the i2c core emits a generic warning and still removes the devic=
e.
> > >=20
> > > So even if disabling the regulator fails it's sensible to further cle=
anup
> > > and then return zero to only emit a single error message.
> > >=20
> > > This patch is a preparation for making i2c remove callbacks return vo=
id.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  drivers/media/i2c/dw9714.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> > > index cd7008ad8f2f..982ed8afebf5 100644
> > > --- a/drivers/media/i2c/dw9714.c
> > > +++ b/drivers/media/i2c/dw9714.c
> > > @@ -201,7 +201,6 @@ static int dw9714_remove(struct i2c_client *clien=
t)
> > >  		if (ret) {
> > >  			dev_err(&client->dev,
> > >  				"Failed to disable vcc: %d\n", ret);
> > > -			return ret;
> > >  		}
> > >  	}
> > >  	pm_runtime_set_suspended(&client->dev);
> >=20
> > Who cares for this driver and so for this patch?
>=20
> I do.
>=20
> The patch is in the media stage tree now (you should have received an
> e-mail about it) from where it eventually gets to the media tree.

Ah I did. I wasn't aware of it, because the mail doesn't have the
in-reply-to header set such that my MUA doesn't sort it to the patch
mail.

I saw this mail now. Let me note that it's intransparent for me how your
Sob line was added to the patch. The mail says the patch was queued,
does that mean it's about to be applied and will appear in next soon? Or
is it only queued to be looked at? (I assume the former.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ktv55misoucduzvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJntTwACgkQwfwUeK3K
7AmceQgAjVdItd7NlVnwHkZzZ+XX1TUUijFSUtM3AecS8y4SJaLCIVKa7GMzpx0N
XLbkFilMq37/G4GNlG96WazYBrbx2EWOrgS4djD4sWrafchGk/47qpFX+nZmsqMO
D8itb0fJ2Um9SQbilMAjMXE5mRcoIzwsrPkOSgpp+h61vYxZY8eFzih+oZPyvlQE
HoKb2f/a8yA0rvDakr3V1BiCjV3iLlAiznPwJQAOnQY7asOuMj1u1tR+NPMVwtrR
rBuwX33sh2ZyM2qmqIBv+4VYY73uriA1z6Y4cDajGI4HKIU+bl9ds4NkVe/+RfM/
H+1GBRGAGm8XFRMGarRCjg9G5fHp2w==
=LSM6
-----END PGP SIGNATURE-----

--ktv55misoucduzvp--
