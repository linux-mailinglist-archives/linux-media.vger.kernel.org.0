Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F2075AB58
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 11:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjGTJsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 05:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjGTJsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 05:48:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B872D2110
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 02:46:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMQF0-0004Z7-Hv; Thu, 20 Jul 2023 11:46:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMQEy-000nnU-Hv; Thu, 20 Jul 2023 11:46:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMQEx-006KOg-Us; Thu, 20 Jul 2023 11:46:31 +0200
Date:   Thu, 20 Jul 2023 11:46:31 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov01a10: Switch back to use struct
 i2c_driver::probe
Message-ID: <20230720094631.brtkaijg3auwfbt7@pengutronix.de>
References: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
 <20230720090202.aljhzxiac6pvmtag@pengutronix.de>
 <62b03784-1f93-e370-3df6-f9ae4409ae5c@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bx2qt5fccoyar3cg"
Content-Disposition: inline
In-Reply-To: <62b03784-1f93-e370-3df6-f9ae4409ae5c@xs4all.nl>
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


--bx2qt5fccoyar3cg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 11:27:51AM +0200, Hans Verkuil wrote:
> On 20/07/2023 11:02, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Mon, Jun 26, 2023 at 11:05:33AM +0200, Uwe Kleine-K=F6nig wrote:
> >> struct i2c_driver::probe_new is about to go away. Switch the driver to
> >> use the probe callback with the same prototype.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >> ---
> >>  drivers/media/i2c/ov01a10.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> >> index de5bc19e715b..2b9e1b3a3bf4 100644
> >> --- a/drivers/media/i2c/ov01a10.c
> >> +++ b/drivers/media/i2c/ov01a10.c
> >> @@ -992,7 +992,7 @@ static struct i2c_driver ov01a10_i2c_driver =3D {
> >>  		.pm =3D &ov01a10_pm_ops,
> >>  		.acpi_match_table =3D ACPI_PTR(ov01a10_acpi_ids),
> >>  	},
> >> -	.probe_new =3D ov01a10_probe,
> >> +	.probe =3D ov01a10_probe,
> >>  	.remove =3D ov01a10_remove,
> >>  };
> >=20
> > I plan to ask Wolfram to merge a patch into i2c-next dropping .probe_new
> > for v6.7-rc1. I want to get this early into next after v6.6-rc1, so it
> > would be great to get this patch in before v6.6-rc1.
> >=20
> > If this won't happen, the backup plan is to send this patch together
> > with the change of i2c_driver for Wolfram to merge via the i2c tree.
> >=20
> > Is this patch still (or at all) on someone's radar for merging?
>=20
> I merged this yesterday in our staging tree for 6.6. Did you get an email
> from patchwork?
>=20
> https://patchwork.linuxtv.org/project/linux-media/patch/20230626090533.55=
6406-1-u.kleine-koenig@pengutronix.de/
>=20
> I also merged yesterday your patch converting three more drivers:
>=20
> https://patchwork.linuxtv.org/project/linux-media/patch/20230718204541.39=
55386-1-u.kleine-koenig@pengutronix.de/

Indeed I got a mail about that, but missed that here. (Too many patches
in float here, so I usually check the submission thread and next before
asking about the status. For me it would be a useful improvement if the
mail would be sent in reply to the respecitve mailing list thread.)
=20
Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bx2qt5fccoyar3cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmS5AncACgkQj4D7WH0S
/k5KgggAmU54reEwYLbV1YRmMhVGM81uPMKzkBNjPy/DMaLbKjUrgt6n7C47rzVZ
NGasVVx+A7sprftCX+1wGcOb0jA2fIOOGpO0KkjmsQ85tu8bIHolid6t597ln9ZB
8Ljv3sQvcrKlGqsBScQjIGnQujgDVoXFzVCC6w6aCCpFqwD0nrKDqZbxDXXjGCqR
VX3XaxYeizFlrvxQbt0Sc/ZIYNFCfzHp6wYRRB8qyK7lcef1Xpz1AxKcWaDK3JlJ
xo02oWB6f2mjnBmMMDUAWwXAvNHuBf5qIeGAduo4K8MdrbDyqoGRUZwQNgt0FsPv
+7c5pbOpR9RXaAmKmBp36wI5s8Jyzw==
=tQni
-----END PGP SIGNATURE-----

--bx2qt5fccoyar3cg--
