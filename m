Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA66E763FDD
	for <lists+linux-media@lfdr.de>; Wed, 26 Jul 2023 21:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjGZTlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 15:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjGZTli (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 15:41:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B292122
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 12:41:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOkO2-00038K-1a; Wed, 26 Jul 2023 21:41:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOkO1-002JWW-0U; Wed, 26 Jul 2023 21:41:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qOkO0-0081Ok-8c; Wed, 26 Jul 2023 21:41:28 +0200
Date:   Wed, 26 Jul 2023 21:41:27 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Wolfram Sang <wsa@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov01a10: Switch back to use struct
 i2c_driver::probe
Message-ID: <20230726194127.ti4ufwlirrhhzxjk@pengutronix.de>
References: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
 <20230720090202.aljhzxiac6pvmtag@pengutronix.de>
 <62b03784-1f93-e370-3df6-f9ae4409ae5c@xs4all.nl>
 <20230720094631.brtkaijg3auwfbt7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="um5ekq4o7klipu6a"
Content-Disposition: inline
In-Reply-To: <20230720094631.brtkaijg3auwfbt7@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--um5ekq4o7klipu6a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 20, 2023 at 11:46:31AM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Jul 20, 2023 at 11:27:51AM +0200, Hans Verkuil wrote:
> > On 20/07/2023 11:02, Uwe Kleine-K=F6nig wrote:
> > > Is this patch still (or at all) on someone's radar for merging?
> >=20
> > I merged this yesterday in our staging tree for 6.6. Did you get an ema=
il
> > from patchwork?
> >=20
> > https://patchwork.linuxtv.org/project/linux-media/patch/20230626090533.=
556406-1-u.kleine-koenig@pengutronix.de/
> >=20
> > I also merged yesterday your patch converting three more drivers:
> >=20
> > https://patchwork.linuxtv.org/project/linux-media/patch/20230718204541.=
3955386-1-u.kleine-koenig@pengutronix.de/
>=20
> Indeed I got a mail about that, but missed that here. (Too many patches
> in float here, so I usually check the submission thread and next before
> asking about the status. For me it would be a useful improvement if the
> mail would be sent in reply to the respecitve mailing list thread.)

Today I stumbled again over this patch because it didn't appear in next
as of today. Is this intended?

Rechecking said mail, it only mentions "git:media_stage/master" in the
Subject and the body only has " This is an automatic generated email to
let you know that the following patch were queued:" plus the patch.

Additionally to what I wrote before it would also be great if the the
git repo's public URL were mentioned, ideally together with the branch
name as git request-pull generates it for easy cut'n'paste after
"git fetch".

Thanks for considering,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--um5ekq4o7klipu6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTBduYACgkQj4D7WH0S
/k5lcgf/X+zXBYqHecPq/fsSS9C5gEAQVECr5xx7YM8eJIdUCn6aCbm9xJ6fnbCT
ggAO7iLrAv/NpFmnVI+q4659GOGN5j6VBG0qmsN/JHtkjFcp7ih1s3XtNPPe7fTl
YVGwj4olp8wejLYoVxSiFGBUFCIY8TDeY/f/+9bGsRu6BhZMVOG9bjJCv+WwtL9i
mGyIZlQnAaqI3Xjb/8Lm3gD9PxPVXjO7oiZ2t1P6CIgmPtSrbh0JS70ZNea0XT2K
qvxupRxRoHyS34d2QsGPvLdw22Js2JmXHuJVkC4uODREHh1V6OzgipxPXes/RP5e
7BrhlnCxlypsjDbb1dzaIrlszkDk2Q==
=w2dS
-----END PGP SIGNATURE-----

--um5ekq4o7klipu6a--
