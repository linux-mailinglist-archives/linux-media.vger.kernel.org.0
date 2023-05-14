Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A373E701D30
	for <lists+linux-media@lfdr.de>; Sun, 14 May 2023 14:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbjENMEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 May 2023 08:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbjENMEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 May 2023 08:04:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA931FD3
        for <linux-media@vger.kernel.org>; Sun, 14 May 2023 05:04:14 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pyASS-0006Tt-Bj; Sun, 14 May 2023 14:04:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pyASR-0007Qp-JL; Sun, 14 May 2023 14:04:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pyASQ-004K5X-H1; Sun, 14 May 2023 14:04:10 +0200
Date:   Sun, 14 May 2023 14:04:07 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: [PATCH v2] media: Switch i2c drivers back to use .probe()
Message-ID: <20230514120407.34j4r5u5laasldrg@pengutronix.de>
References: <20230513175931.159764-1-u.kleine-koenig@pengutronix.de>
 <20230513193626.48ed9a28@sal.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vimswkwzqfivy4xz"
Content-Disposition: inline
In-Reply-To: <20230513193626.48ed9a28@sal.lan>
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


--vimswkwzqfivy4xz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
---
Hello Mauro,

On Sat, May 13, 2023 at 07:36:26PM +0100, Mauro Carvalho Chehab wrote:
> Em Sat, 13 May 2023 19:59:31 +0200
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> escreveu:
> > this patch was generated using coccinelle, but I aligned the result to
> > the per-file indention.
> >=20
> > If you don't like the cleanups that are orthogonal to this patch, just
> > tell me, then I can drop this change from the patch. Also if you want it
> > split per driver or directory for improved patch count numbers, please
> > tell me.
> >=20
> > Also I didn't Cc: all the individual maintainers to not exceed the
> > allowed length of To: and Cc:. If this patch will be split I can extend
> > the audience accordingly.
>=20
> Sounds good to me.=20
>=20
> > diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> > index 17465fcf28e3..7b26ba72ff2a 100644
> > --- a/drivers/media/i2c/ov5648.c
> > +++ b/drivers/media/i2c/ov5648.c
> > @@ -2616,7 +2616,7 @@ static struct i2c_driver ov5648_driver =3D {
> >  		.of_match_table =3D ov5648_of_match,
> >  		.pm =3D &ov5648_pm_ops,
> >  	},
> > -	.probe_new =3D ov5648_probe,
> > +	.probe =3D ov5648_probe,
> >  	.remove	 =3D ov5648_remove,
> >  };
>=20
> Nit: you should probably remove the extra spaces from .remove
> or align .probe here.

Fixed here. This is the only change in v2.

(There are a few more instances I'd call a bit strange, but I didn't fix
these. E.g. drivers/media/dvb-frontends/au8522_decoder.c where the =3D for
all members of au8522_driver are aligned but the .driver one. Then
however .driver.name's =3D is aligned again. *shrug*)


> Are you planning to merge this via I2C tree?
> If so:
>=20
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

No, please take it via your tree. There are still a few more subsystems
that must be converted before struct i2c_driver can be changed. There is
no urge and I prefer to make it slow over coordinating all drivers
changing via the i2c tree.

Best regards
Uwe

 drivers/media/cec/i2c/ch7322.c                 | 2 +-
 drivers/media/dvb-frontends/a8293.c            | 2 +-
 drivers/media/dvb-frontends/af9013.c           | 2 +-
 drivers/media/dvb-frontends/af9033.c           | 2 +-
 drivers/media/dvb-frontends/au8522_decoder.c   | 2 +-
 drivers/media/dvb-frontends/cxd2099.c          | 2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c    | 2 +-
 drivers/media/dvb-frontends/dvb-pll.c          | 2 +-
 drivers/media/dvb-frontends/helene.c           | 2 +-
 drivers/media/dvb-frontends/lgdt3306a.c        | 2 +-
 drivers/media/dvb-frontends/lgdt330x.c         | 2 +-
 drivers/media/dvb-frontends/m88ds3103.c        | 2 +-
 drivers/media/dvb-frontends/mn88443x.c         | 2 +-
 drivers/media/dvb-frontends/mn88472.c          | 2 +-
 drivers/media/dvb-frontends/mn88473.c          | 2 +-
 drivers/media/dvb-frontends/mxl692.c           | 2 +-
 drivers/media/dvb-frontends/rtl2830.c          | 2 +-
 drivers/media/dvb-frontends/rtl2832.c          | 2 +-
 drivers/media/dvb-frontends/si2165.c           | 2 +-
 drivers/media/dvb-frontends/si2168.c           | 2 +-
 drivers/media/dvb-frontends/sp2.c              | 2 +-
 drivers/media/dvb-frontends/stv090x.c          | 2 +-
 drivers/media/dvb-frontends/stv6110x.c         | 2 +-
 drivers/media/dvb-frontends/tc90522.c          | 2 +-
 drivers/media/dvb-frontends/tda10071.c         | 2 +-
 drivers/media/dvb-frontends/ts2020.c           | 2 +-
 drivers/media/i2c/ad5820.c                     | 2 +-
 drivers/media/i2c/adp1653.c                    | 2 +-
 drivers/media/i2c/adv7170.c                    | 2 +-
 drivers/media/i2c/adv7175.c                    | 2 +-
 drivers/media/i2c/adv7180.c                    | 2 +-
 drivers/media/i2c/adv7183.c                    | 2 +-
 drivers/media/i2c/adv7343.c                    | 2 +-
 drivers/media/i2c/adv7393.c                    | 2 +-
 drivers/media/i2c/adv748x/adv748x-core.c       | 2 +-
 drivers/media/i2c/adv7511-v4l2.c               | 2 +-
 drivers/media/i2c/adv7604.c                    | 2 +-
 drivers/media/i2c/adv7842.c                    | 2 +-
 drivers/media/i2c/ak7375.c                     | 2 +-
 drivers/media/i2c/ak881x.c                     | 2 +-
 drivers/media/i2c/ar0521.c                     | 2 +-
 drivers/media/i2c/bt819.c                      | 2 +-
 drivers/media/i2c/bt856.c                      | 2 +-
 drivers/media/i2c/bt866.c                      | 2 +-
 drivers/media/i2c/ccs/ccs-core.c               | 2 +-
 drivers/media/i2c/cs3308.c                     | 2 +-
 drivers/media/i2c/cs5345.c                     | 2 +-
 drivers/media/i2c/cs53l32a.c                   | 2 +-
 drivers/media/i2c/cx25840/cx25840-core.c       | 2 +-
 drivers/media/i2c/dw9714.c                     | 2 +-
 drivers/media/i2c/dw9768.c                     | 2 +-
 drivers/media/i2c/dw9807-vcm.c                 | 2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c       | 2 +-
 drivers/media/i2c/hi556.c                      | 2 +-
 drivers/media/i2c/hi846.c                      | 2 +-
 drivers/media/i2c/hi847.c                      | 2 +-
 drivers/media/i2c/imx208.c                     | 2 +-
 drivers/media/i2c/imx214.c                     | 2 +-
 drivers/media/i2c/imx219.c                     | 2 +-
 drivers/media/i2c/imx258.c                     | 2 +-
 drivers/media/i2c/imx274.c                     | 2 +-
 drivers/media/i2c/imx290.c                     | 4 ++--
 drivers/media/i2c/imx296.c                     | 2 +-
 drivers/media/i2c/imx319.c                     | 2 +-
 drivers/media/i2c/imx334.c                     | 2 +-
 drivers/media/i2c/imx335.c                     | 2 +-
 drivers/media/i2c/imx355.c                     | 2 +-
 drivers/media/i2c/imx412.c                     | 2 +-
 drivers/media/i2c/imx415.c                     | 2 +-
 drivers/media/i2c/ir-kbd-i2c.c                 | 2 +-
 drivers/media/i2c/isl7998x.c                   | 2 +-
 drivers/media/i2c/ks0127.c                     | 2 +-
 drivers/media/i2c/lm3560.c                     | 2 +-
 drivers/media/i2c/lm3646.c                     | 2 +-
 drivers/media/i2c/m52790.c                     | 2 +-
 drivers/media/i2c/max2175.c                    | 2 +-
 drivers/media/i2c/max9286.c                    | 2 +-
 drivers/media/i2c/ml86v7667.c                  | 2 +-
 drivers/media/i2c/msp3400-driver.c             | 2 +-
 drivers/media/i2c/mt9m001.c                    | 2 +-
 drivers/media/i2c/mt9m111.c                    | 2 +-
 drivers/media/i2c/mt9p031.c                    | 2 +-
 drivers/media/i2c/mt9t112.c                    | 2 +-
 drivers/media/i2c/mt9v011.c                    | 2 +-
 drivers/media/i2c/mt9v032.c                    | 2 +-
 drivers/media/i2c/mt9v111.c                    | 2 +-
 drivers/media/i2c/og01a1b.c                    | 2 +-
 drivers/media/i2c/ov02a10.c                    | 4 ++--
 drivers/media/i2c/ov08d10.c                    | 2 +-
 drivers/media/i2c/ov08x40.c                    | 2 +-
 drivers/media/i2c/ov13858.c                    | 2 +-
 drivers/media/i2c/ov13b10.c                    | 2 +-
 drivers/media/i2c/ov2640.c                     | 2 +-
 drivers/media/i2c/ov2659.c                     | 2 +-
 drivers/media/i2c/ov2680.c                     | 2 +-
 drivers/media/i2c/ov2685.c                     | 4 ++--
 drivers/media/i2c/ov2740.c                     | 2 +-
 drivers/media/i2c/ov4689.c                     | 2 +-
 drivers/media/i2c/ov5640.c                     | 2 +-
 drivers/media/i2c/ov5645.c                     | 2 +-
 drivers/media/i2c/ov5647.c                     | 2 +-
 drivers/media/i2c/ov5648.c                     | 4 ++--
 drivers/media/i2c/ov5670.c                     | 2 +-
 drivers/media/i2c/ov5675.c                     | 2 +-
 drivers/media/i2c/ov5693.c                     | 2 +-
 drivers/media/i2c/ov5695.c                     | 4 ++--
 drivers/media/i2c/ov6650.c                     | 2 +-
 drivers/media/i2c/ov7251.c                     | 2 +-
 drivers/media/i2c/ov7640.c                     | 2 +-
 drivers/media/i2c/ov7670.c                     | 2 +-
 drivers/media/i2c/ov772x.c                     | 2 +-
 drivers/media/i2c/ov7740.c                     | 2 +-
 drivers/media/i2c/ov8856.c                     | 2 +-
 drivers/media/i2c/ov8858.c                     | 4 ++--
 drivers/media/i2c/ov8865.c                     | 4 ++--
 drivers/media/i2c/ov9282.c                     | 2 +-
 drivers/media/i2c/ov9640.c                     | 2 +-
 drivers/media/i2c/ov9650.c                     | 2 +-
 drivers/media/i2c/ov9734.c                     | 2 +-
 drivers/media/i2c/rdacm20.c                    | 2 +-
 drivers/media/i2c/rdacm21.c                    | 2 +-
 drivers/media/i2c/rj54n1cb0c.c                 | 2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c       | 2 +-
 drivers/media/i2c/s5k5baf.c                    | 2 +-
 drivers/media/i2c/s5k6a3.c                     | 2 +-
 drivers/media/i2c/saa6588.c                    | 2 +-
 drivers/media/i2c/saa6752hs.c                  | 2 +-
 drivers/media/i2c/saa7110.c                    | 2 +-
 drivers/media/i2c/saa7115.c                    | 2 +-
 drivers/media/i2c/saa7127.c                    | 2 +-
 drivers/media/i2c/saa717x.c                    | 2 +-
 drivers/media/i2c/saa7185.c                    | 2 +-
 drivers/media/i2c/sony-btf-mpx.c               | 2 +-
 drivers/media/i2c/st-mipid02.c                 | 2 +-
 drivers/media/i2c/st-vgxy61.c                  | 2 +-
 drivers/media/i2c/tc358743.c                   | 2 +-
 drivers/media/i2c/tc358746.c                   | 2 +-
 drivers/media/i2c/tda1997x.c                   | 2 +-
 drivers/media/i2c/tda7432.c                    | 2 +-
 drivers/media/i2c/tda9840.c                    | 2 +-
 drivers/media/i2c/tea6415c.c                   | 2 +-
 drivers/media/i2c/tea6420.c                    | 2 +-
 drivers/media/i2c/ths7303.c                    | 2 +-
 drivers/media/i2c/ths8200.c                    | 2 +-
 drivers/media/i2c/tlv320aic23b.c               | 2 +-
 drivers/media/i2c/tvaudio.c                    | 2 +-
 drivers/media/i2c/tvp514x.c                    | 2 +-
 drivers/media/i2c/tvp5150.c                    | 2 +-
 drivers/media/i2c/tvp7002.c                    | 2 +-
 drivers/media/i2c/tw2804.c                     | 2 +-
 drivers/media/i2c/tw9903.c                     | 2 +-
 drivers/media/i2c/tw9906.c                     | 2 +-
 drivers/media/i2c/tw9910.c                     | 2 +-
 drivers/media/i2c/uda1342.c                    | 2 +-
 drivers/media/i2c/upd64031a.c                  | 2 +-
 drivers/media/i2c/upd64083.c                   | 2 +-
 drivers/media/i2c/video-i2c.c                  | 2 +-
 drivers/media/i2c/vp27smpx.c                   | 2 +-
 drivers/media/i2c/vpx3220.c                    | 2 +-
 drivers/media/i2c/wm8739.c                     | 2 +-
 drivers/media/i2c/wm8775.c                     | 2 +-
 drivers/media/radio/radio-tea5764.c            | 2 +-
 drivers/media/radio/saa7706h.c                 | 2 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c  | 2 +-
 drivers/media/radio/si4713/si4713.c            | 2 +-
 drivers/media/radio/tef6862.c                  | 2 +-
 drivers/media/test-drivers/vidtv/vidtv_demod.c | 2 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c | 2 +-
 drivers/media/tuners/e4000.c                   | 2 +-
 drivers/media/tuners/fc2580.c                  | 2 +-
 drivers/media/tuners/m88rs6000t.c              | 2 +-
 drivers/media/tuners/mt2060.c                  | 2 +-
 drivers/media/tuners/mxl301rf.c                | 2 +-
 drivers/media/tuners/qm1d1b0004.c              | 2 +-
 drivers/media/tuners/qm1d1c0042.c              | 2 +-
 drivers/media/tuners/si2157.c                  | 2 +-
 drivers/media/tuners/tda18212.c                | 2 +-
 drivers/media/tuners/tda18250.c                | 2 +-
 drivers/media/tuners/tua9001.c                 | 2 +-
 drivers/media/usb/go7007/s2250-board.c         | 2 +-
 drivers/media/v4l2-core/tuner-core.c           | 2 +-
 181 files changed, 188 insertions(+), 188 deletions(-)

diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
index 34fad7123704..439c15bc9e44 100644
--- a/drivers/media/cec/i2c/ch7322.c
+++ b/drivers/media/cec/i2c/ch7322.c
@@ -591,7 +591,7 @@ static struct i2c_driver ch7322_i2c_driver =3D {
 		.name =3D "ch7322",
 		.of_match_table =3D of_match_ptr(ch7322_of_match),
 	},
-	.probe_new	=3D ch7322_probe,
+	.probe		=3D ch7322_probe,
 	.remove		=3D ch7322_remove,
 };
=20
diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-fronte=
nds/a8293.c
index cca7cbdd4c7c..f39887c04978 100644
--- a/drivers/media/dvb-frontends/a8293.c
+++ b/drivers/media/dvb-frontends/a8293.c
@@ -266,7 +266,7 @@ static struct i2c_driver a8293_driver =3D {
 		.name	=3D "a8293",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D a8293_probe,
+	.probe		=3D a8293_probe,
 	.remove		=3D a8293_remove,
 	.id_table	=3D a8293_id_table,
 };
diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-front=
ends/af9013.c
index 206758a73ae2..a829c89792a4 100644
--- a/drivers/media/dvb-frontends/af9013.c
+++ b/drivers/media/dvb-frontends/af9013.c
@@ -1563,7 +1563,7 @@ static struct i2c_driver af9013_driver =3D {
 		.name	=3D "af9013",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D af9013_probe,
+	.probe		=3D af9013_probe,
 	.remove		=3D af9013_remove,
 	.id_table	=3D af9013_id_table,
 };
diff --git a/drivers/media/dvb-frontends/af9033.c b/drivers/media/dvb-front=
ends/af9033.c
index a30773f62006..49b7b04a7899 100644
--- a/drivers/media/dvb-frontends/af9033.c
+++ b/drivers/media/dvb-frontends/af9033.c
@@ -1183,7 +1183,7 @@ static struct i2c_driver af9033_driver =3D {
 		.name	=3D "af9033",
 		.suppress_bind_attrs	=3D true,
 	},
-	.probe_new	=3D af9033_probe,
+	.probe		=3D af9033_probe,
 	.remove		=3D af9033_remove,
 	.id_table	=3D af9033_id_table,
 };
diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/d=
vb-frontends/au8522_decoder.c
index 0f748cf46089..acc27376c246 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -776,7 +776,7 @@ static struct i2c_driver au8522_driver =3D {
 	.driver =3D {
 		.name	=3D "au8522",
 	},
-	.probe_new	=3D au8522_probe,
+	.probe		=3D au8522_probe,
 	.remove		=3D au8522_remove,
 	.id_table	=3D au8522_id,
 };
diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-fron=
tends/cxd2099.c
index c0967ad95220..3f3b85743666 100644
--- a/drivers/media/dvb-frontends/cxd2099.c
+++ b/drivers/media/dvb-frontends/cxd2099.c
@@ -681,7 +681,7 @@ static struct i2c_driver cxd2099_driver =3D {
 	.driver =3D {
 		.name	=3D "cxd2099",
 	},
-	.probe_new	=3D cxd2099_probe,
+	.probe		=3D cxd2099_probe,
 	.remove		=3D cxd2099_remove,
 	.id_table	=3D cxd2099_id,
 };
diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dv=
b-frontends/cxd2820r_core.c
index 47aa40967171..d7ee294c6833 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -733,7 +733,7 @@ static struct i2c_driver cxd2820r_driver =3D {
 		.name                =3D "cxd2820r",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new =3D cxd2820r_probe,
+	.probe    =3D cxd2820r_probe,
 	.remove   =3D cxd2820r_remove,
 	.id_table =3D cxd2820r_id_table,
 };
diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-fron=
tends/dvb-pll.c
index e35e00db7dbb..90cb41eacf98 100644
--- a/drivers/media/dvb-frontends/dvb-pll.c
+++ b/drivers/media/dvb-frontends/dvb-pll.c
@@ -942,7 +942,7 @@ static struct i2c_driver dvb_pll_driver =3D {
 	.driver =3D {
 		.name =3D "dvb_pll",
 	},
-	.probe_new =3D dvb_pll_probe,
+	.probe    =3D dvb_pll_probe,
 	.remove   =3D dvb_pll_remove,
 	.id_table =3D dvb_pll_id,
 };
diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-front=
ends/helene.c
index e4bbf6a51a2b..68c1a3e0e2ba 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -1110,7 +1110,7 @@ static struct i2c_driver helene_driver =3D {
 	.driver =3D {
 		.name =3D "helene",
 	},
-	.probe_new =3D helene_probe,
+	.probe =3D helene_probe,
 	.id_table =3D helene_id,
 };
 module_i2c_driver(helene_driver);
diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-fr=
ontends/lgdt3306a.c
index 6bf723b5ffad..70258884126b 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2249,7 +2249,7 @@ static struct i2c_driver lgdt3306a_driver =3D {
 		.name                =3D "lgdt3306a",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D lgdt3306a_probe,
+	.probe		=3D lgdt3306a_probe,
 	.remove		=3D lgdt3306a_remove,
 	.id_table	=3D lgdt3306a_id_table,
 };
diff --git a/drivers/media/dvb-frontends/lgdt330x.c b/drivers/media/dvb-fro=
ntends/lgdt330x.c
index 1d6932d8e497..83565209c3b1 100644
--- a/drivers/media/dvb-frontends/lgdt330x.c
+++ b/drivers/media/dvb-frontends/lgdt330x.c
@@ -993,7 +993,7 @@ static struct i2c_driver lgdt330x_driver =3D {
 		.name	=3D "lgdt330x",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D lgdt330x_probe,
+	.probe		=3D lgdt330x_probe,
 	.remove		=3D lgdt330x_remove,
 	.id_table	=3D lgdt330x_id_table,
 };
diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-fr=
ontends/m88ds3103.c
index f26508b217ee..cf49ac56a37e 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1941,7 +1941,7 @@ static struct i2c_driver m88ds3103_driver =3D {
 		.name	=3D "m88ds3103",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D m88ds3103_probe,
+	.probe		=3D m88ds3103_probe,
 	.remove		=3D m88ds3103_remove,
 	.id_table	=3D m88ds3103_id_table,
 };
diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-fro=
ntends/mn88443x.c
index 1f1753f2ab1a..43efd557e28b 100644
--- a/drivers/media/dvb-frontends/mn88443x.c
+++ b/drivers/media/dvb-frontends/mn88443x.c
@@ -800,7 +800,7 @@ static struct i2c_driver mn88443x_driver =3D {
 		.name =3D "mn88443x",
 		.of_match_table =3D of_match_ptr(mn88443x_of_match),
 	},
-	.probe_new =3D mn88443x_probe,
+	.probe    =3D mn88443x_probe,
 	.remove   =3D mn88443x_remove,
 	.id_table =3D mn88443x_i2c_id,
 };
diff --git a/drivers/media/dvb-frontends/mn88472.c b/drivers/media/dvb-fron=
tends/mn88472.c
index 4a71f1c6371a..73d1e52de569 100644
--- a/drivers/media/dvb-frontends/mn88472.c
+++ b/drivers/media/dvb-frontends/mn88472.c
@@ -718,7 +718,7 @@ static struct i2c_driver mn88472_driver =3D {
 		.name =3D "mn88472",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new =3D mn88472_probe,
+	.probe    =3D mn88472_probe,
 	.remove   =3D mn88472_remove,
 	.id_table =3D mn88472_id_table,
 };
diff --git a/drivers/media/dvb-frontends/mn88473.c b/drivers/media/dvb-fron=
tends/mn88473.c
index 205b14ae584e..eb50591c0e7a 100644
--- a/drivers/media/dvb-frontends/mn88473.c
+++ b/drivers/media/dvb-frontends/mn88473.c
@@ -753,7 +753,7 @@ static struct i2c_driver mn88473_driver =3D {
 		.name		     =3D "mn88473",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D mn88473_probe,
+	.probe		=3D mn88473_probe,
 	.remove		=3D mn88473_remove,
 	.id_table	=3D mn88473_id_table,
 };
diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-front=
ends/mxl692.c
index 9858e11943a0..2a31bde2630f 100644
--- a/drivers/media/dvb-frontends/mxl692.c
+++ b/drivers/media/dvb-frontends/mxl692.c
@@ -1355,7 +1355,7 @@ static struct i2c_driver mxl692_driver =3D {
 	.driver =3D {
 		.name	=3D "mxl692",
 	},
-	.probe_new	=3D mxl692_probe,
+	.probe		=3D mxl692_probe,
 	.remove		=3D mxl692_remove,
 	.id_table	=3D mxl692_id_table,
 };
diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-fron=
tends/rtl2830.c
index db3254950147..35c969fd2cb5 100644
--- a/drivers/media/dvb-frontends/rtl2830.c
+++ b/drivers/media/dvb-frontends/rtl2830.c
@@ -886,7 +886,7 @@ static struct i2c_driver rtl2830_driver =3D {
 		.name			=3D "rtl2830",
 		.suppress_bind_attrs	=3D true,
 	},
-	.probe_new	=3D rtl2830_probe,
+	.probe		=3D rtl2830_probe,
 	.remove		=3D rtl2830_remove,
 	.id_table	=3D rtl2830_id_table,
 };
diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-fron=
tends/rtl2832.c
index 900d4db8b922..601cf45c3935 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1135,7 +1135,7 @@ static struct i2c_driver rtl2832_driver =3D {
 		.name	=3D "rtl2832",
 		.suppress_bind_attrs	=3D true,
 	},
-	.probe_new	=3D rtl2832_probe,
+	.probe		=3D rtl2832_probe,
 	.remove		=3D rtl2832_remove,
 	.id_table	=3D rtl2832_id_table,
 };
diff --git a/drivers/media/dvb-frontends/si2165.c b/drivers/media/dvb-front=
ends/si2165.c
index cc07e965c34c..72810efd1a96 100644
--- a/drivers/media/dvb-frontends/si2165.c
+++ b/drivers/media/dvb-frontends/si2165.c
@@ -1292,7 +1292,7 @@ static struct i2c_driver si2165_driver =3D {
 	.driver =3D {
 		.name	=3D "si2165",
 	},
-	.probe_new	=3D si2165_probe,
+	.probe		=3D si2165_probe,
 	.remove		=3D si2165_remove,
 	.id_table	=3D si2165_id_table,
 };
diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-front=
ends/si2168.c
index 2a0e108c5eb0..dae1f2153e8b 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -798,7 +798,7 @@ static struct i2c_driver si2168_driver =3D {
 		.name                =3D "si2168",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D si2168_probe,
+	.probe		=3D si2168_probe,
 	.remove		=3D si2168_remove,
 	.id_table	=3D si2168_id_table,
 };
diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontend=
s/sp2.c
index 3395f6b5b948..4d7d0b8b51b4 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -416,7 +416,7 @@ static struct i2c_driver sp2_driver =3D {
 	.driver =3D {
 		.name	=3D "sp2",
 	},
-	.probe_new	=3D sp2_probe,
+	.probe		=3D sp2_probe,
 	.remove		=3D sp2_remove,
 	.id_table	=3D sp2_id,
 };
diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-fron=
tends/stv090x.c
index 9bde0ad6f26e..a07dc5fdeb3d 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -5084,7 +5084,7 @@ static struct i2c_driver stv090x_driver =3D {
 		.name	=3D "stv090x",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D stv090x_probe,
+	.probe		=3D stv090x_probe,
 	.remove		=3D stv090x_remove,
 	.id_table	=3D stv090x_id_table,
 };
diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-fro=
ntends/stv6110x.c
index b2f456116c60..11653f846c12 100644
--- a/drivers/media/dvb-frontends/stv6110x.c
+++ b/drivers/media/dvb-frontends/stv6110x.c
@@ -480,7 +480,7 @@ static struct i2c_driver stv6110x_driver =3D {
 		.name	=3D "stv6110x",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D stv6110x_probe,
+	.probe		=3D stv6110x_probe,
 	.remove		=3D stv6110x_remove,
 	.id_table	=3D stv6110x_id_table,
 };
diff --git a/drivers/media/dvb-frontends/tc90522.c b/drivers/media/dvb-fron=
tends/tc90522.c
index 77a991bf4713..879f028f9682 100644
--- a/drivers/media/dvb-frontends/tc90522.c
+++ b/drivers/media/dvb-frontends/tc90522.c
@@ -840,7 +840,7 @@ static struct i2c_driver tc90522_driver =3D {
 	.driver =3D {
 		.name	=3D "tc90522",
 	},
-	.probe_new	=3D tc90522_probe,
+	.probe		=3D tc90522_probe,
 	.remove		=3D tc90522_remove,
 	.id_table	=3D tc90522_id,
 };
diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-fro=
ntends/tda10071.c
index c8e5617d08c0..6640851d8bbc 100644
--- a/drivers/media/dvb-frontends/tda10071.c
+++ b/drivers/media/dvb-frontends/tda10071.c
@@ -1240,7 +1240,7 @@ static struct i2c_driver tda10071_driver =3D {
 		.name	=3D "tda10071",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D tda10071_probe,
+	.probe		=3D tda10071_probe,
 	.remove		=3D tda10071_remove,
 	.id_table	=3D tda10071_id_table,
 };
diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-front=
ends/ts2020.c
index c28fee7509cd..f5b60f827697 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -720,7 +720,7 @@ static struct i2c_driver ts2020_driver =3D {
 	.driver =3D {
 		.name	=3D "ts2020",
 	},
-	.probe_new	=3D ts2020_probe,
+	.probe		=3D ts2020_probe,
 	.remove		=3D ts2020_remove,
 	.id_table	=3D ts2020_id_table,
 };
diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 44c26af49071..5f605b9be3b1 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -370,7 +370,7 @@ static struct i2c_driver ad5820_i2c_driver =3D {
 		.pm	=3D &ad5820_pm,
 		.of_match_table =3D ad5820_of_table,
 	},
-	.probe_new	=3D ad5820_probe,
+	.probe		=3D ad5820_probe,
 	.remove		=3D ad5820_remove,
 	.id_table	=3D ad5820_id_table,
 };
diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index a61a77de6eee..98ca417b8004 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -535,7 +535,7 @@ static struct i2c_driver adp1653_i2c_driver =3D {
 		.name	=3D ADP1653_NAME,
 		.pm	=3D &adp1653_pm_ops,
 	},
-	.probe_new	=3D adp1653_probe,
+	.probe		=3D adp1653_probe,
 	.remove		=3D adp1653_remove,
 	.id_table	=3D adp1653_id_table,
 };
diff --git a/drivers/media/i2c/adv7170.c b/drivers/media/i2c/adv7170.c
index aa0f80e299b3..4a2b9fd9e2da 100644
--- a/drivers/media/i2c/adv7170.c
+++ b/drivers/media/i2c/adv7170.c
@@ -387,7 +387,7 @@ static struct i2c_driver adv7170_driver =3D {
 	.driver =3D {
 		.name	=3D "adv7170",
 	},
-	.probe_new	=3D adv7170_probe,
+	.probe		=3D adv7170_probe,
 	.remove		=3D adv7170_remove,
 	.id_table	=3D adv7170_id,
 };
diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
index d9bea2b9ec33..e454cba4b026 100644
--- a/drivers/media/i2c/adv7175.c
+++ b/drivers/media/i2c/adv7175.c
@@ -442,7 +442,7 @@ static struct i2c_driver adv7175_driver =3D {
 	.driver =3D {
 		.name	=3D "adv7175",
 	},
-	.probe_new	=3D adv7175_probe,
+	.probe		=3D adv7175_probe,
 	.remove		=3D adv7175_remove,
 	.id_table	=3D adv7175_id,
 };
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index a22402b7acff..99ba925e8ec8 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1610,7 +1610,7 @@ static struct i2c_driver adv7180_driver =3D {
 		   .pm =3D ADV7180_PM_OPS,
 		   .of_match_table =3D of_match_ptr(adv7180_of_id),
 		   },
-	.probe_new =3D adv7180_probe,
+	.probe =3D adv7180_probe,
 	.remove =3D adv7180_remove,
 	.id_table =3D adv7180_id,
 };
diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index 98b63d79d33d..3659feafac69 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -631,7 +631,7 @@ static struct i2c_driver adv7183_driver =3D {
 	.driver =3D {
 		.name   =3D "adv7183",
 	},
-	.probe_new      =3D adv7183_probe,
+	.probe          =3D adv7183_probe,
 	.remove         =3D adv7183_remove,
 	.id_table       =3D adv7183_id,
 };
diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
index 7e84869d2434..ff21cd4744d3 100644
--- a/drivers/media/i2c/adv7343.c
+++ b/drivers/media/i2c/adv7343.c
@@ -521,7 +521,7 @@ static struct i2c_driver adv7343_driver =3D {
 		.of_match_table =3D of_match_ptr(adv7343_of_match),
 		.name	=3D "adv7343",
 	},
-	.probe_new	=3D adv7343_probe,
+	.probe		=3D adv7343_probe,
 	.remove		=3D adv7343_remove,
 	.id_table	=3D adv7343_id,
 };
diff --git a/drivers/media/i2c/adv7393.c b/drivers/media/i2c/adv7393.c
index 61e916cbe651..7638af455cef 100644
--- a/drivers/media/i2c/adv7393.c
+++ b/drivers/media/i2c/adv7393.c
@@ -455,7 +455,7 @@ static struct i2c_driver adv7393_driver =3D {
 	.driver =3D {
 		.name	=3D "adv7393",
 	},
-	.probe_new	=3D adv7393_probe,
+	.probe		=3D adv7393_probe,
 	.remove		=3D adv7393_remove,
 	.id_table	=3D adv7393_id,
 };
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/a=
dv748x/adv748x-core.c
index 4498d78a2357..3eb6d5e8f082 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -847,7 +847,7 @@ static struct i2c_driver adv748x_driver =3D {
 		.of_match_table =3D adv748x_of_table,
 		.pm =3D &adv748x_pm_ops,
 	},
-	.probe_new =3D adv748x_probe,
+	.probe =3D adv748x_probe,
 	.remove =3D adv748x_remove,
 };
=20
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v=
4l2.c
index 3999fa524cab..a9183d9282fd 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1957,7 +1957,7 @@ static struct i2c_driver adv7511_driver =3D {
 	.driver =3D {
 		.name =3D "adv7511-v4l2",
 	},
-	.probe_new =3D adv7511_probe,
+	.probe =3D adv7511_probe,
 	.remove =3D adv7511_remove,
 	.id_table =3D adv7511_id,
 };
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 3d0898c4175e..b202a85fbeaa 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3689,7 +3689,7 @@ static struct i2c_driver adv76xx_driver =3D {
 		.name =3D "adv7604",
 		.of_match_table =3D of_match_ptr(adv76xx_of_id),
 	},
-	.probe_new =3D adv76xx_probe,
+	.probe =3D adv76xx_probe,
 	.remove =3D adv76xx_remove,
 	.id_table =3D adv76xx_i2c_id,
 };
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index cb8655574119..c1664a3620c8 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3619,7 +3619,7 @@ static struct i2c_driver adv7842_driver =3D {
 	.driver =3D {
 		.name =3D "adv7842",
 	},
-	.probe_new =3D adv7842_probe,
+	.probe =3D adv7842_probe,
 	.remove =3D adv7842_remove,
 	.id_table =3D adv7842_id,
 };
diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index e7cec45bc271..463b51d46320 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -306,7 +306,7 @@ static struct i2c_driver ak7375_i2c_driver =3D {
 		.pm =3D &ak7375_pm_ops,
 		.of_match_table =3D ak7375_of_table,
 	},
-	.probe_new =3D ak7375_probe,
+	.probe =3D ak7375_probe,
 	.remove =3D ak7375_remove,
 };
 module_i2c_driver(ak7375_i2c_driver);
diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index 7c9ab76e2448..ce840adc2aa7 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -314,7 +314,7 @@ static struct i2c_driver ak881x_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "ak881x",
 	},
-	.probe_new	=3D ak881x_probe,
+	.probe		=3D ak881x_probe,
 	.remove		=3D ak881x_remove,
 	.id_table	=3D ak881x_id,
 };
diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 77f597571167..a4e39871e8f7 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1198,7 +1198,7 @@ static struct i2c_driver ar0521_i2c_driver =3D {
 		.pm =3D &ar0521_pm_ops,
 		.of_match_table =3D ar0521_dt_ids,
 	},
-	.probe_new =3D ar0521_probe,
+	.probe =3D ar0521_probe,
 	.remove =3D ar0521_remove,
 };
=20
diff --git a/drivers/media/i2c/bt819.c b/drivers/media/i2c/bt819.c
index 39f8a5361166..b4a25cc996dc 100644
--- a/drivers/media/i2c/bt819.c
+++ b/drivers/media/i2c/bt819.c
@@ -468,7 +468,7 @@ static struct i2c_driver bt819_driver =3D {
 	.driver =3D {
 		.name	=3D "bt819",
 	},
-	.probe_new	=3D bt819_probe,
+	.probe		=3D bt819_probe,
 	.remove		=3D bt819_remove,
 	.id_table	=3D bt819_id,
 };
diff --git a/drivers/media/i2c/bt856.c b/drivers/media/i2c/bt856.c
index d1d397b15b85..814acbd6a5a8 100644
--- a/drivers/media/i2c/bt856.c
+++ b/drivers/media/i2c/bt856.c
@@ -239,7 +239,7 @@ static struct i2c_driver bt856_driver =3D {
 	.driver =3D {
 		.name	=3D "bt856",
 	},
-	.probe_new	=3D bt856_probe,
+	.probe		=3D bt856_probe,
 	.remove		=3D bt856_remove,
 	.id_table	=3D bt856_id,
 };
diff --git a/drivers/media/i2c/bt866.c b/drivers/media/i2c/bt866.c
index d632d9a07f04..dada059cbce4 100644
--- a/drivers/media/i2c/bt866.c
+++ b/drivers/media/i2c/bt866.c
@@ -206,7 +206,7 @@ static struct i2c_driver bt866_driver =3D {
 	.driver =3D {
 		.name	=3D "bt866",
 	},
-	.probe_new	=3D bt866_probe,
+	.probe		=3D bt866_probe,
 	.remove		=3D bt866_remove,
 	.id_table	=3D bt866_id,
 };
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-c=
ore.c
index 559a415fd827..49e0d9a09530 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3731,7 +3731,7 @@ static struct i2c_driver ccs_i2c_driver =3D {
 		.name =3D CCS_NAME,
 		.pm =3D &ccs_pm_ops,
 	},
-	.probe_new =3D ccs_probe,
+	.probe =3D ccs_probe,
 	.remove	=3D ccs_remove,
 };
=20
diff --git a/drivers/media/i2c/cs3308.c b/drivers/media/i2c/cs3308.c
index a0b66c04fe25..61afa3d799d2 100644
--- a/drivers/media/i2c/cs3308.c
+++ b/drivers/media/i2c/cs3308.c
@@ -118,7 +118,7 @@ static struct i2c_driver cs3308_driver =3D {
 	.driver =3D {
 		.name   =3D "cs3308",
 	},
-	.probe_new      =3D cs3308_probe,
+	.probe          =3D cs3308_probe,
 	.remove         =3D cs3308_remove,
 	.id_table       =3D cs3308_id,
 };
diff --git a/drivers/media/i2c/cs5345.c b/drivers/media/i2c/cs5345.c
index ac4b5632fc46..3019a132e079 100644
--- a/drivers/media/i2c/cs5345.c
+++ b/drivers/media/i2c/cs5345.c
@@ -198,7 +198,7 @@ static struct i2c_driver cs5345_driver =3D {
 	.driver =3D {
 		.name	=3D "cs5345",
 	},
-	.probe_new	=3D cs5345_probe,
+	.probe		=3D cs5345_probe,
 	.remove		=3D cs5345_remove,
 	.id_table	=3D cs5345_id,
 };
diff --git a/drivers/media/i2c/cs53l32a.c b/drivers/media/i2c/cs53l32a.c
index 670f89de32d4..82881b79e730 100644
--- a/drivers/media/i2c/cs53l32a.c
+++ b/drivers/media/i2c/cs53l32a.c
@@ -209,7 +209,7 @@ static struct i2c_driver cs53l32a_driver =3D {
 	.driver =3D {
 		.name	=3D "cs53l32a",
 	},
-	.probe_new	=3D cs53l32a_probe,
+	.probe		=3D cs53l32a_probe,
 	.remove		=3D cs53l32a_remove,
 	.id_table	=3D cs53l32a_id,
 };
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/c=
x25840/cx25840-core.c
index 46cf422270b2..5aec25289062 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -6045,7 +6045,7 @@ static struct i2c_driver cx25840_driver =3D {
 	.driver =3D {
 		.name	=3D "cx25840",
 	},
-	.probe_new	=3D cx25840_probe,
+	.probe		=3D cx25840_probe,
 	.remove		=3D cx25840_remove,
 	.id_table	=3D cx25840_id,
 };
diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index af59687383aa..cc09b32ede60 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -299,7 +299,7 @@ static struct i2c_driver dw9714_i2c_driver =3D {
 		.pm =3D &dw9714_pm_ops,
 		.of_match_table =3D dw9714_of_table,
 	},
-	.probe_new =3D dw9714_probe,
+	.probe =3D dw9714_probe,
 	.remove =3D dw9714_remove,
 	.id_table =3D dw9714_id_table,
 };
diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 83a3ee275bbe..daabbece8c7e 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -549,7 +549,7 @@ static struct i2c_driver dw9768_i2c_driver =3D {
 		.pm =3D &dw9768_pm_ops,
 		.of_match_table =3D dw9768_of_table,
 	},
-	.probe_new  =3D dw9768_probe,
+	.probe =3D dw9768_probe,
 	.remove =3D dw9768_remove,
 };
 module_i2c_driver(dw9768_i2c_driver);
diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
index 3599720db7e9..4148009e0e01 100644
--- a/drivers/media/i2c/dw9807-vcm.c
+++ b/drivers/media/i2c/dw9807-vcm.c
@@ -310,7 +310,7 @@ static struct i2c_driver dw9807_i2c_driver =3D {
 		.pm =3D &dw9807_pm_ops,
 		.of_match_table =3D dw9807_of_table,
 	},
-	.probe_new =3D dw9807_probe,
+	.probe =3D dw9807_probe,
 	.remove =3D dw9807_remove,
 };
=20
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/e=
t8ek8/et8ek8_driver.c
index ff9bb9fc97dd..d6fc843f9368 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1501,7 +1501,7 @@ static struct i2c_driver et8ek8_i2c_driver =3D {
 		.pm	=3D &et8ek8_pm_ops,
 		.of_match_table	=3D et8ek8_of_table,
 	},
-	.probe_new	=3D et8ek8_probe,
+	.probe		=3D et8ek8_probe,
 	.remove		=3D __exit_p(et8ek8_remove),
 	.id_table	=3D et8ek8_id_table,
 };
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 7daefab35cf0..50e78f5b058c 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1350,7 +1350,7 @@ static struct i2c_driver hi556_i2c_driver =3D {
 		.pm =3D &hi556_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(hi556_acpi_ids),
 	},
-	.probe_new =3D hi556_probe,
+	.probe =3D hi556_probe,
 	.remove =3D hi556_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 306dc35e925f..5283a09fd359 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -2189,7 +2189,7 @@ static struct i2c_driver hi846_i2c_driver =3D {
 		.pm =3D &hi846_pm_ops,
 		.of_match_table =3D hi846_of_match,
 	},
-	.probe_new =3D hi846_probe,
+	.probe =3D hi846_probe,
 	.remove =3D hi846_remove,
 };
=20
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 5a82b15a9513..7cdce392e137 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2999,7 +2999,7 @@ static struct i2c_driver hi847_i2c_driver =3D {
 		.pm =3D &hi847_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(hi847_acpi_ids),
 	},
-	.probe_new =3D hi847_probe,
+	.probe =3D hi847_probe,
 	.remove =3D hi847_remove,
 };
=20
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 64c70ebf9869..3e870fa9ff79 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -1100,7 +1100,7 @@ static struct i2c_driver imx208_i2c_driver =3D {
 		.pm =3D &imx208_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(imx208_acpi_ids),
 	},
-	.probe_new =3D imx208_probe,
+	.probe =3D imx208_probe,
 	.remove =3D imx208_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 710c9fb515fd..2f9c8582f940 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1112,7 +1112,7 @@ static struct i2c_driver imx214_i2c_driver =3D {
 		.pm =3D &imx214_pm_ops,
 		.name  =3D "imx214",
 	},
-	.probe_new  =3D imx214_probe,
+	.probe =3D imx214_probe,
 	.remove =3D imx214_remove,
 };
=20
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f9471c9e3a74..d737d5e9a4a6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1583,7 +1583,7 @@ static struct i2c_driver imx219_i2c_driver =3D {
 		.of_match_table	=3D imx219_dt_ids,
 		.pm =3D &imx219_pm_ops,
 	},
-	.probe_new =3D imx219_probe,
+	.probe =3D imx219_probe,
 	.remove =3D imx219_remove,
 };
=20
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 85d73b186111..e196565e846e 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1395,7 +1395,7 @@ static struct i2c_driver imx258_i2c_driver =3D {
 		.acpi_match_table =3D ACPI_PTR(imx258_acpi_ids),
 		.of_match_table	=3D imx258_dt_ids,
 	},
-	.probe_new =3D imx258_probe,
+	.probe =3D imx258_probe,
 	.remove =3D imx258_remove,
 };
=20
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 9219f3c9594b..f33b692e6951 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -2168,7 +2168,7 @@ static struct i2c_driver imx274_i2c_driver =3D {
 		.pm =3D &imx274_pm_ops,
 		.of_match_table	=3D imx274_of_id_table,
 	},
-	.probe_new	=3D imx274_probe,
+	.probe		=3D imx274_probe,
 	.remove		=3D imx274_remove,
 	.id_table	=3D imx274_id,
 };
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 5ea25b7acc55..b3f832e9d7e1 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1716,10 +1716,10 @@ static const struct of_device_id imx290_of_match[] =
=3D {
 MODULE_DEVICE_TABLE(of, imx290_of_match);
=20
 static struct i2c_driver imx290_i2c_driver =3D {
-	.probe_new  =3D imx290_probe,
+	.probe =3D imx290_probe,
 	.remove =3D imx290_remove,
 	.driver =3D {
-		.name  =3D "imx290",
+		.name =3D "imx290",
 		.pm =3D pm_ptr(&imx290_pm_ops),
 		.of_match_table =3D imx290_of_match,
 	},
diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 4f22c0515ef8..70c129833601 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -1152,7 +1152,7 @@ static struct i2c_driver imx296_i2c_driver =3D {
 		.name =3D "imx296",
 		.pm =3D &imx296_pm_ops
 	},
-	.probe_new =3D imx296_probe,
+	.probe =3D imx296_probe,
 	.remove =3D imx296_remove,
 };
=20
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 45b1b61b2880..a2140848d0d6 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2558,7 +2558,7 @@ static struct i2c_driver imx319_i2c_driver =3D {
 		.pm =3D &imx319_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(imx319_acpi_ids),
 	},
-	.probe_new =3D imx319_probe,
+	.probe =3D imx319_probe,
 	.remove =3D imx319_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 309c706114d2..bd79ebfe41ec 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1382,7 +1382,7 @@ static const struct of_device_id imx334_of_match[] =
=3D {
 MODULE_DEVICE_TABLE(of, imx334_of_match);
=20
 static struct i2c_driver imx334_driver =3D {
-	.probe_new =3D imx334_probe,
+	.probe =3D imx334_probe,
 	.remove =3D imx334_remove,
 	.driver =3D {
 		.name =3D "imx334",
diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 078ede2b7a00..482a0b7f040a 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1112,7 +1112,7 @@ static const struct of_device_id imx335_of_match[] =
=3D {
 MODULE_DEVICE_TABLE(of, imx335_of_match);
=20
 static struct i2c_driver imx335_driver =3D {
-	.probe_new =3D imx335_probe,
+	.probe =3D imx335_probe,
 	.remove =3D imx335_remove,
 	.driver =3D {
 		.name =3D "imx335",
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 25d4dbb6041e..6571a98b1e9e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1845,7 +1845,7 @@ static struct i2c_driver imx355_i2c_driver =3D {
 		.pm =3D &imx355_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(imx355_acpi_ids),
 	},
-	.probe_new =3D imx355_probe,
+	.probe =3D imx355_probe,
 	.remove =3D imx355_remove,
 };
 module_i2c_driver(imx355_i2c_driver);
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index e1e986dc8856..c7e862ae4040 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1293,7 +1293,7 @@ static const struct of_device_id imx412_of_match[] =
=3D {
 MODULE_DEVICE_TABLE(of, imx412_of_match);
=20
 static struct i2c_driver imx412_driver =3D {
-	.probe_new =3D imx412_probe,
+	.probe =3D imx412_probe,
 	.remove =3D imx412_remove,
 	.driver =3D {
 		.name =3D "imx412",
diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index d90392df98c7..4b5d1ee9cc6b 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1283,7 +1283,7 @@ static const struct of_device_id imx415_of_match[] =
=3D {
 MODULE_DEVICE_TABLE(of, imx415_of_match);
=20
 static struct i2c_driver imx415_driver =3D {
-	.probe_new =3D imx415_probe,
+	.probe =3D imx415_probe,
 	.remove =3D imx415_remove,
 	.driver =3D {
 		.name =3D "imx415",
diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 51921068931d..b37a2aaf8ac0 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -988,7 +988,7 @@ static struct i2c_driver ir_kbd_driver =3D {
 	.driver =3D {
 		.name   =3D "ir-kbd-i2c",
 	},
-	.probe_new      =3D ir_probe,
+	.probe          =3D ir_probe,
 	.remove         =3D ir_remove,
 	.id_table       =3D ir_kbd_id,
 };
diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index ae7af2cc94f5..92e49d95363d 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1614,7 +1614,7 @@ static struct i2c_driver isl7998x_i2c_driver =3D {
 		.of_match_table =3D of_match_ptr(isl7998x_of_match),
 		.pm =3D &isl7998x_pm_ops,
 	},
-	.probe_new	=3D isl7998x_probe,
+	.probe		=3D isl7998x_probe,
 	.remove		=3D isl7998x_remove,
 	.id_table	=3D isl7998x_id,
 };
diff --git a/drivers/media/i2c/ks0127.c b/drivers/media/i2c/ks0127.c
index 0d86f2db7ad2..5c583f57e3f3 100644
--- a/drivers/media/i2c/ks0127.c
+++ b/drivers/media/i2c/ks0127.c
@@ -696,7 +696,7 @@ static struct i2c_driver ks0127_driver =3D {
 	.driver =3D {
 		.name	=3D "ks0127",
 	},
-	.probe_new	=3D ks0127_probe,
+	.probe		=3D ks0127_probe,
 	.remove		=3D ks0127_remove,
 	.id_table	=3D ks0127_id,
 };
diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 5ef613604be7..05283ac68f2d 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -467,7 +467,7 @@ static struct i2c_driver lm3560_i2c_driver =3D {
 		   .name =3D LM3560_NAME,
 		   .pm =3D NULL,
 		   },
-	.probe_new =3D lm3560_probe,
+	.probe =3D lm3560_probe,
 	.remove =3D lm3560_remove,
 	.id_table =3D lm3560_id_table,
 };
diff --git a/drivers/media/i2c/lm3646.c b/drivers/media/i2c/lm3646.c
index 2a0cf74d2bed..fab3a7e05f92 100644
--- a/drivers/media/i2c/lm3646.c
+++ b/drivers/media/i2c/lm3646.c
@@ -396,7 +396,7 @@ static struct i2c_driver lm3646_i2c_driver =3D {
 	.driver =3D {
 		   .name =3D LM3646_NAME,
 		   },
-	.probe_new =3D lm3646_probe,
+	.probe =3D lm3646_probe,
 	.remove =3D lm3646_remove,
 	.id_table =3D lm3646_id_table,
 };
diff --git a/drivers/media/i2c/m52790.c b/drivers/media/i2c/m52790.c
index 0e6507ab7e08..f8a69142aae9 100644
--- a/drivers/media/i2c/m52790.c
+++ b/drivers/media/i2c/m52790.c
@@ -172,7 +172,7 @@ static struct i2c_driver m52790_driver =3D {
 	.driver =3D {
 		.name	=3D "m52790",
 	},
-	.probe_new	=3D m52790_probe,
+	.probe		=3D m52790_probe,
 	.remove		=3D m52790_remove,
 	.id_table	=3D m52790_id,
 };
diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index 1019020f3a37..70c2a2948fd4 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -1429,7 +1429,7 @@ static struct i2c_driver max2175_driver =3D {
 		.name	=3D DRIVER_NAME,
 		.of_match_table =3D max2175_of_ids,
 	},
-	.probe_new	=3D max2175_probe,
+	.probe		=3D max2175_probe,
 	.remove		=3D max2175_remove,
 	.id_table	=3D max2175_id,
 };
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 13a986b88588..88c58e0c49aa 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1716,7 +1716,7 @@ static struct i2c_driver max9286_i2c_driver =3D {
 		.name		=3D "max9286",
 		.of_match_table	=3D of_match_ptr(max9286_dt_ids),
 	},
-	.probe_new	=3D max9286_probe,
+	.probe		=3D max9286_probe,
 	.remove		=3D max9286_remove,
 };
=20
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index dbd2f0bd3651..5b72d4434224 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -433,7 +433,7 @@ static struct i2c_driver ml86v7667_i2c_driver =3D {
 	.driver =3D {
 		.name	=3D DRV_NAME,
 	},
-	.probe_new	=3D ml86v7667_probe,
+	.probe		=3D ml86v7667_probe,
 	.remove		=3D ml86v7667_remove,
 	.id_table	=3D ml86v7667_id,
 };
diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400=
-driver.c
index 12032e28b428..bec76801487a 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -892,7 +892,7 @@ static struct i2c_driver msp_driver =3D {
 		.name	=3D "msp3400",
 		.pm	=3D &msp3400_pm_ops,
 	},
-	.probe_new	=3D msp_probe,
+	.probe		=3D msp_probe,
 	.remove		=3D msp_remove,
 	.id_table	=3D msp_id,
 };
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index ebf9cf1e1bce..ce9568e8391c 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -877,7 +877,7 @@ static struct i2c_driver mt9m001_i2c_driver =3D {
 		.pm =3D &mt9m001_pm_ops,
 		.of_match_table =3D mt9m001_of_match,
 	},
-	.probe_new	=3D mt9m001_probe,
+	.probe		=3D mt9m001_probe,
 	.remove		=3D mt9m001_remove,
 	.id_table	=3D mt9m001_id,
 };
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index f5fe272d1205..2878d328fc01 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1384,7 +1384,7 @@ static struct i2c_driver mt9m111_i2c_driver =3D {
 		.name =3D "mt9m111",
 		.of_match_table =3D of_match_ptr(mt9m111_of_match),
 	},
-	.probe_new	=3D mt9m111_probe,
+	.probe		=3D mt9m111_probe,
 	.remove		=3D mt9m111_remove,
 	.id_table	=3D mt9m111_id,
 };
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 9e023a4b9bd1..348f1e1098fb 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1248,7 +1248,7 @@ static struct i2c_driver mt9p031_i2c_driver =3D {
 		.of_match_table =3D of_match_ptr(mt9p031_of_match),
 		.name =3D "mt9p031",
 	},
-	.probe_new      =3D mt9p031_probe,
+	.probe          =3D mt9p031_probe,
 	.remove         =3D mt9p031_remove,
 	.id_table       =3D mt9p031_id,
 };
diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index a82f056787b8..93f34b767027 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1119,7 +1119,7 @@ static struct i2c_driver mt9t112_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "mt9t112",
 	},
-	.probe_new =3D mt9t112_probe,
+	.probe    =3D mt9t112_probe,
 	.remove   =3D mt9t112_remove,
 	.id_table =3D mt9t112_id,
 };
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index c54c7fbf0963..774861ba7747 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -585,7 +585,7 @@ static struct i2c_driver mt9v011_driver =3D {
 	.driver =3D {
 		.name	=3D "mt9v011",
 	},
-	.probe_new	=3D mt9v011_probe,
+	.probe		=3D mt9v011_probe,
 	.remove		=3D mt9v011_remove,
 	.id_table	=3D mt9v011_id,
 };
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 7cfd4ebdd2e6..00e7bc6e3235 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1296,7 +1296,7 @@ static struct i2c_driver mt9v032_driver =3D {
 		.name =3D "mt9v032",
 		.of_match_table =3D of_match_ptr(mt9v032_of_match),
 	},
-	.probe_new	=3D mt9v032_probe,
+	.probe		=3D mt9v032_probe,
 	.remove		=3D mt9v032_remove,
 	.id_table	=3D mt9v032_id,
 };
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 46d91cd0870c..1f7edc0f5b1a 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1265,7 +1265,7 @@ static struct i2c_driver mt9v111_driver =3D {
 		.name =3D "mt9v111",
 		.of_match_table =3D mt9v111_of_match,
 	},
-	.probe_new	=3D mt9v111_probe,
+	.probe		=3D mt9v111_probe,
 	.remove		=3D mt9v111_remove,
 };
=20
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 35663c10fcd9..b5948759342e 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1115,7 +1115,7 @@ static struct i2c_driver og01a1b_i2c_driver =3D {
 		.pm =3D &og01a1b_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(og01a1b_acpi_ids),
 	},
-	.probe_new =3D og01a1b_probe,
+	.probe =3D og01a1b_probe,
 	.remove =3D og01a1b_remove,
 };
=20
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 2c1eb724d8e5..741d977a76f3 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -1002,8 +1002,8 @@ static struct i2c_driver ov02a10_i2c_driver =3D {
 		.pm =3D &ov02a10_pm_ops,
 		.of_match_table =3D ov02a10_of_match,
 	},
-	.probe_new	=3D &ov02a10_probe,
-	.remove		=3D &ov02a10_remove,
+	.probe		=3D ov02a10_probe,
+	.remove		=3D ov02a10_remove,
 };
 module_i2c_driver(ov02a10_i2c_driver);
=20
diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index a39e086a51c5..7d55d4ca24de 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1520,7 +1520,7 @@ static struct i2c_driver ov08d10_i2c_driver =3D {
 		.pm =3D &ov08d10_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(ov08d10_acpi_ids),
 	},
-	.probe_new =3D ov08d10_probe,
+	.probe =3D ov08d10_probe,
 	.remove =3D ov08d10_remove,
 };
=20
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 72ae7fba94eb..77bcdcd0824c 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -3313,7 +3313,7 @@ static struct i2c_driver ov08x40_i2c_driver =3D {
 		.pm =3D &ov08x40_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(ov08x40_acpi_ids),
 	},
-	.probe_new =3D ov08x40_probe,
+	.probe =3D ov08x40_probe,
 	.remove =3D ov08x40_remove,
 };
=20
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 69a7a2c590db..3db3e64fa3ff 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1806,7 +1806,7 @@ static struct i2c_driver ov13858_i2c_driver =3D {
 		.pm =3D &ov13858_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(ov13858_acpi_ids),
 	},
-	.probe_new =3D ov13858_probe,
+	.probe =3D ov13858_probe,
 	.remove =3D ov13858_remove,
 	.id_table =3D ov13858_id_table,
 };
diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index c1430044fb1e..6110fb1e6bc6 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1496,7 +1496,7 @@ static struct i2c_driver ov13b10_i2c_driver =3D {
 		.pm =3D &ov13b10_pm_ops,
 		.acpi_match_table =3D ACPI_PTR(ov13b10_acpi_ids),
 	},
-	.probe_new =3D ov13b10_probe,
+	.probe =3D ov13b10_probe,
 	.remove =3D ov13b10_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 39d56838a4ef..ec801a81c2d0 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -1298,7 +1298,7 @@ static struct i2c_driver ov2640_i2c_driver =3D {
 		.name =3D "ov2640",
 		.of_match_table =3D of_match_ptr(ov2640_of_match),
 	},
-	.probe_new =3D ov2640_probe,
+	.probe    =3D ov2640_probe,
 	.remove   =3D ov2640_remove,
 	.id_table =3D ov2640_id,
 };
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 42fc64ada08c..5429bd2eb053 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1584,7 +1584,7 @@ static struct i2c_driver ov2659_i2c_driver =3D {
 		.pm	=3D &ov2659_pm_ops,
 		.of_match_table =3D of_match_ptr(ov2659_of_match),
 	},
-	.probe_new	=3D ov2659_probe,
+	.probe		=3D ov2659_probe,
 	.remove		=3D ov2659_remove,
 	.id_table	=3D ov2659_id,
 };
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 54153bf66bdd..d06e9fc37f77 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1158,7 +1158,7 @@ static struct i2c_driver ov2680_i2c_driver =3D {
 		.pm =3D &ov2680_pm_ops,
 		.of_match_table	=3D of_match_ptr(ov2680_dt_ids),
 	},
-	.probe_new	=3D ov2680_probe,
+	.probe		=3D ov2680_probe,
 	.remove		=3D ov2680_remove,
 };
 module_i2c_driver(ov2680_i2c_driver);
diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index f119a93e7c64..303793e1f97d 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -903,8 +903,8 @@ static struct i2c_driver ov2685_i2c_driver =3D {
 		.pm =3D &ov2685_pm_ops,
 		.of_match_table =3D of_match_ptr(ov2685_of_match),
 	},
-	.probe_new	=3D &ov2685_probe,
-	.remove		=3D &ov2685_remove,
+	.probe		=3D ov2685_probe,
+	.remove		=3D ov2685_remove,
 };
=20
 module_i2c_driver(ov2685_i2c_driver);
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 89d126240c34..158d934733c3 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1215,7 +1215,7 @@ static struct i2c_driver ov2740_i2c_driver =3D {
 		.pm =3D pm_sleep_ptr(&ov2740_pm_ops),
 		.acpi_match_table =3D ov2740_acpi_ids,
 	},
-	.probe_new =3D ov2740_probe,
+	.probe =3D ov2740_probe,
 	.remove =3D ov2740_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index c602e507d42b..fda217d2cb10 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -1008,7 +1008,7 @@ static struct i2c_driver ov4689_i2c_driver =3D {
 		.pm =3D &ov4689_pm_ops,
 		.of_match_table =3D ov4689_of_match,
 	},
-	.probe_new =3D ov4689_probe,
+	.probe =3D ov4689_probe,
 	.remove	=3D ov4689_remove,
 };
=20
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1536649b9e90..3a9dc7d11dec 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -4011,7 +4011,7 @@ static struct i2c_driver ov5640_i2c_driver =3D {
 		.pm =3D &ov5640_pm_ops,
 	},
 	.id_table =3D ov5640_id,
-	.probe_new =3D ov5640_probe,
+	.probe    =3D ov5640_probe,
 	.remove   =3D ov5640_remove,
 };
=20
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index c8999fc4f26f..a70db7e601a4 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1286,7 +1286,7 @@ static struct i2c_driver ov5645_i2c_driver =3D {
 		.name  =3D "ov5645",
 		.pm =3D &ov5645_pm_ops,
 	},
-	.probe_new =3D ov5645_probe,
+	.probe =3D ov5645_probe,
 	.remove =3D ov5645_remove,
 	.id_table =3D ov5645_id,
 };
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 233576ee9503..8de398423b7c 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1515,7 +1515,7 @@ static struct i2c_driver ov5647_driver =3D {
 		.name	=3D "ov5647",
 		.pm	=3D &ov5647_pm_ops,
 	},
-	.probe_new	=3D ov5647_probe,
+	.probe		=3D ov5647_probe,
 	.remove		=3D ov5647_remove,
 	.id_table	=3D ov5647_id,
 };
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 17465fcf28e3..aa10eb4e3991 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2616,8 +2616,8 @@ static struct i2c_driver ov5648_driver =3D {
 		.of_match_table =3D ov5648_of_match,
 		.pm =3D &ov5648_pm_ops,
 	},
-	.probe_new =3D ov5648_probe,
-	.remove	 =3D ov5648_remove,
+	.probe =3D ov5648_probe,
+	.remove =3D ov5648_remove,
 };
=20
 module_i2c_driver(ov5648_driver);
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index c026610d0f31..d722348b938b 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2853,7 +2853,7 @@ static struct i2c_driver ov5670_i2c_driver =3D {
 		.acpi_match_table =3D ACPI_PTR(ov5670_acpi_ids),
 		.of_match_table =3D ov5670_of_ids,
 	},
-	.probe_new =3D ov5670_probe,
+	.probe =3D ov5670_probe,
 	.remove =3D ov5670_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index d55180b3b7aa..700c4b69846f 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1435,7 +1435,7 @@ static struct i2c_driver ov5675_i2c_driver =3D {
 		.acpi_match_table =3D ACPI_PTR(ov5675_acpi_ids),
 		.of_match_table =3D ov5675_of_match,
 	},
-	.probe_new =3D ov5675_probe,
+	.probe =3D ov5675_probe,
 	.remove =3D ov5675_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index e3c3bed69ad6..9a786ff4b5b7 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1554,7 +1554,7 @@ static struct i2c_driver ov5693_driver =3D {
 		.of_match_table =3D ov5693_of_match,
 		.pm =3D &ov5693_pm_ops,
 	},
-	.probe_new =3D ov5693_probe,
+	.probe =3D ov5693_probe,
 	.remove =3D ov5693_remove,
 };
 module_i2c_driver(ov5693_driver);
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index b287c28920a6..3023b7254167 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1392,8 +1392,8 @@ static struct i2c_driver ov5695_i2c_driver =3D {
 		.pm =3D &ov5695_pm_ops,
 		.of_match_table =3D of_match_ptr(ov5695_of_match),
 	},
-	.probe_new	=3D &ov5695_probe,
-	.remove		=3D &ov5695_remove,
+	.probe		=3D ov5695_probe,
+	.remove		=3D ov5695_remove,
 };
=20
 module_i2c_driver(ov5695_i2c_driver);
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 4c0ea2ae671b..1ad07935f046 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -1113,7 +1113,7 @@ static struct i2c_driver ov6650_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "ov6650",
 	},
-	.probe_new =3D ov6650_probe,
+	.probe    =3D ov6650_probe,
 	.remove   =3D ov6650_remove,
 	.id_table =3D ov6650_id,
 };
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 88e987435285..675fb37a6fea 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1806,7 +1806,7 @@ static struct i2c_driver ov7251_i2c_driver =3D {
 		.name  =3D "ov7251",
 		.pm =3D &ov7251_pm_ops,
 	},
-	.probe_new  =3D ov7251_probe,
+	.probe =3D ov7251_probe,
 	.remove =3D ov7251_remove,
 };
=20
diff --git a/drivers/media/i2c/ov7640.c b/drivers/media/i2c/ov7640.c
index e6751d5cc64b..293f5f404358 100644
--- a/drivers/media/i2c/ov7640.c
+++ b/drivers/media/i2c/ov7640.c
@@ -86,7 +86,7 @@ static struct i2c_driver ov7640_driver =3D {
 	.driver =3D {
 		.name	=3D "ov7640",
 	},
-	.probe_new =3D ov7640_probe,
+	.probe =3D ov7640_probe,
 	.remove =3D ov7640_remove,
 	.id_table =3D ov7640_id,
 };
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index ecbded4f0765..2f55491ef571 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -2033,7 +2033,7 @@ static struct i2c_driver ov7670_driver =3D {
 		.name	=3D "ov7670",
 		.of_match_table =3D of_match_ptr(ov7670_of_match),
 	},
-	.probe_new	=3D ov7670_probe,
+	.probe		=3D ov7670_probe,
 	.remove		=3D ov7670_remove,
 	.id_table	=3D ov7670_id,
 };
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index a238e63425f8..386d69c8e074 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1551,7 +1551,7 @@ static struct i2c_driver ov772x_i2c_driver =3D {
 		.name =3D "ov772x",
 		.of_match_table =3D ov772x_of_match,
 	},
-	.probe_new =3D ov772x_probe,
+	.probe    =3D ov772x_probe,
 	.remove   =3D ov772x_remove,
 	.id_table =3D ov772x_id,
 };
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index c9fd9b0bc54a..10e47c7d4e0c 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1212,7 +1212,7 @@ static struct i2c_driver ov7740_i2c_driver =3D {
 		.pm =3D &ov7740_pm_ops,
 		.of_match_table =3D of_match_ptr(ov7740_of_match),
 	},
-	.probe_new =3D ov7740_probe,
+	.probe    =3D ov7740_probe,
 	.remove   =3D ov7740_remove,
 	.id_table =3D ov7740_id,
 };
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index b5c7881383ca..f053c3a7676a 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2527,7 +2527,7 @@ static struct i2c_driver ov8856_i2c_driver =3D {
 		.acpi_match_table =3D ACPI_PTR(ov8856_acpi_ids),
 		.of_match_table =3D ov8856_of_match,
 	},
-	.probe_new =3D ov8856_probe,
+	.probe =3D ov8856_probe,
 	.remove =3D ov8856_remove,
 	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 9ca8a17bfbb9..3af6125a2eee 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1998,8 +1998,8 @@ static struct i2c_driver ov8858_i2c_driver =3D {
 		.pm =3D &ov8858_pm_ops,
 		.of_match_table =3D ov8858_of_match,
 	},
-	.probe_new	=3D &ov8858_probe,
-	.remove		=3D &ov8858_remove,
+	.probe		=3D ov8858_probe,
+	.remove		=3D ov8858_remove,
 };
=20
 module_i2c_driver(ov8858_i2c_driver);
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index cae1866134a0..f2213c6158d3 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3158,8 +3158,8 @@ static struct i2c_driver ov8865_driver =3D {
 		.acpi_match_table =3D ov8865_acpi_match,
 		.pm =3D &ov8865_pm_ops,
 	},
-	.probe_new =3D ov8865_probe,
-	.remove	 =3D ov8865_remove,
+	.probe =3D ov8865_probe,
+	.remove =3D ov8865_remove,
 };
=20
 module_i2c_driver(ov8865_driver);
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 7f46cac38aab..068c7449f50e 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1512,7 +1512,7 @@ static const struct of_device_id ov9282_of_match[] =
=3D {
 MODULE_DEVICE_TABLE(of, ov9282_of_match);
=20
 static struct i2c_driver ov9282_driver =3D {
-	.probe_new =3D ov9282_probe,
+	.probe =3D ov9282_probe,
 	.remove =3D ov9282_remove,
 	.driver =3D {
 		.name =3D "ov9282",
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index a80fa59bf2ae..cbaea049531d 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -762,7 +762,7 @@ static struct i2c_driver ov9640_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "ov9640",
 	},
-	.probe_new =3D ov9640_probe,
+	.probe    =3D ov9640_probe,
 	.remove   =3D ov9640_remove,
 	.id_table =3D ov9640_id,
 };
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 7e7cb1e4520e..da1ab5135eaa 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1571,7 +1571,7 @@ static struct i2c_driver ov965x_i2c_driver =3D {
 		.name	=3D DRIVER_NAME,
 		.of_match_table =3D of_match_ptr(ov965x_of_match),
 	},
-	.probe_new	=3D ov965x_probe,
+	.probe		=3D ov965x_probe,
 	.remove		=3D ov965x_remove,
 	.id_table	=3D ov965x_id,
 };
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 8b0a158cb297..b6244772bc59 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -1028,7 +1028,7 @@ static struct i2c_driver ov9734_i2c_driver =3D {
 		.pm =3D &ov9734_pm_ops,
 		.acpi_match_table =3D ov9734_acpi_ids,
 	},
-	.probe_new =3D ov9734_probe,
+	.probe =3D ov9734_probe,
 	.remove =3D ov9734_remove,
 };
=20
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index a2263fa825b5..01a2596282f0 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -676,7 +676,7 @@ static struct i2c_driver rdacm20_i2c_driver =3D {
 		.name	=3D "rdacm20",
 		.of_match_table =3D rdacm20_of_ids,
 	},
-	.probe_new	=3D rdacm20_probe,
+	.probe		=3D rdacm20_probe,
 	.remove		=3D rdacm20_remove,
 	.shutdown	=3D rdacm20_shutdown,
 };
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 9ccc56c30d3b..043fec778a5e 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -635,7 +635,7 @@ static struct i2c_driver rdacm21_i2c_driver =3D {
 		.name	=3D "rdacm21",
 		.of_match_table =3D rdacm21_of_ids,
 	},
-	.probe_new	=3D rdacm21_probe,
+	.probe		=3D rdacm21_probe,
 	.remove		=3D rdacm21_remove,
 };
=20
diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index 9db5473daba0..b430046f9e2a 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1421,7 +1421,7 @@ static struct i2c_driver rj54n1_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "rj54n1cb0c",
 	},
-	.probe_new	=3D rj54n1_probe,
+	.probe		=3D rj54n1_probe,
 	.remove		=3D rj54n1_remove,
 	.id_table	=3D rj54n1_id,
 };
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s=
5c73m3/s5c73m3-core.c
index 7938a3327d3e..ed5b10731a14 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1729,7 +1729,7 @@ static struct i2c_driver s5c73m3_i2c_driver =3D {
 		.of_match_table =3D of_match_ptr(s5c73m3_of_match),
 		.name	=3D DRIVER_NAME,
 	},
-	.probe_new	=3D s5c73m3_probe,
+	.probe		=3D s5c73m3_probe,
 	.remove		=3D s5c73m3_remove,
 	.id_table	=3D s5c73m3_id,
 };
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 960fbf6428ea..67da2045f543 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -2021,7 +2021,7 @@ static struct i2c_driver s5k5baf_i2c_driver =3D {
 		.of_match_table =3D s5k5baf_of_match,
 		.name =3D S5K5BAF_DRIVER_NAME
 	},
-	.probe_new	=3D s5k5baf_probe,
+	.probe		=3D s5k5baf_probe,
 	.remove		=3D s5k5baf_remove,
 	.id_table	=3D s5k5baf_id,
 };
diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index ef6673b10580..b3560c8f8b41 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -373,7 +373,7 @@ static struct i2c_driver s5k6a3_driver =3D {
 		.of_match_table	=3D of_match_ptr(s5k6a3_of_match),
 		.name		=3D S5K6A3_DRV_NAME,
 	},
-	.probe_new	=3D s5k6a3_probe,
+	.probe		=3D s5k6a3_probe,
 	.remove		=3D s5k6a3_remove,
 	.id_table	=3D s5k6a3_ids,
 };
diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index 8752f7cff611..dea9fc09356f 100644
--- a/drivers/media/i2c/saa6588.c
+++ b/drivers/media/i2c/saa6588.c
@@ -505,7 +505,7 @@ static struct i2c_driver saa6588_driver =3D {
 	.driver =3D {
 		.name	=3D "saa6588",
 	},
-	.probe_new	=3D saa6588_probe,
+	.probe		=3D saa6588_probe,
 	.remove		=3D saa6588_remove,
 	.id_table	=3D saa6588_id,
 };
diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 892d64fe6e81..c106e7a7d1f4 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -781,7 +781,7 @@ static struct i2c_driver saa6752hs_driver =3D {
 	.driver =3D {
 		.name	=3D "saa6752hs",
 	},
-	.probe_new	=3D saa6752hs_probe,
+	.probe		=3D saa6752hs_probe,
 	.remove		=3D saa6752hs_remove,
 	.id_table	=3D saa6752hs_id,
 };
diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index b58e71517376..1520790338ce 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -448,7 +448,7 @@ static struct i2c_driver saa7110_driver =3D {
 	.driver =3D {
 		.name	=3D "saa7110",
 	},
-	.probe_new	=3D saa7110_probe,
+	.probe		=3D saa7110_probe,
 	.remove		=3D saa7110_remove,
 	.id_table	=3D saa7110_id,
 };
diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index efeda3956f81..a1c71187e773 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1951,7 +1951,7 @@ static struct i2c_driver saa711x_driver =3D {
 	.driver =3D {
 		.name	=3D "saa7115",
 	},
-	.probe_new	=3D saa711x_probe,
+	.probe		=3D saa711x_probe,
 	.remove		=3D saa711x_remove,
 	.id_table	=3D saa711x_id,
 };
diff --git a/drivers/media/i2c/saa7127.c b/drivers/media/i2c/saa7127.c
index f98f3a1c38a9..818ed19cf37b 100644
--- a/drivers/media/i2c/saa7127.c
+++ b/drivers/media/i2c/saa7127.c
@@ -810,7 +810,7 @@ static struct i2c_driver saa7127_driver =3D {
 	.driver =3D {
 		.name	=3D "saa7127",
 	},
-	.probe_new	=3D saa7127_probe,
+	.probe		=3D saa7127_probe,
 	.remove		=3D saa7127_remove,
 	.id_table	=3D saa7127_id,
 };
diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index df01059076fa..933ec0171430 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -1343,7 +1343,7 @@ static struct i2c_driver saa717x_driver =3D {
 	.driver =3D {
 		.name	=3D "saa717x",
 	},
-	.probe_new	=3D saa717x_probe,
+	.probe		=3D saa717x_probe,
 	.remove		=3D saa717x_remove,
 	.id_table	=3D saa717x_id,
 };
diff --git a/drivers/media/i2c/saa7185.c b/drivers/media/i2c/saa7185.c
index c78f2e95ba37..5535d71f4860 100644
--- a/drivers/media/i2c/saa7185.c
+++ b/drivers/media/i2c/saa7185.c
@@ -343,7 +343,7 @@ static struct i2c_driver saa7185_driver =3D {
 	.driver =3D {
 		.name	=3D "saa7185",
 	},
-	.probe_new	=3D saa7185_probe,
+	.probe		=3D saa7185_probe,
 	.remove		=3D saa7185_remove,
 	.id_table	=3D saa7185_id,
 };
diff --git a/drivers/media/i2c/sony-btf-mpx.c b/drivers/media/i2c/sony-btf-=
mpx.c
index eef6c8a7c9c9..0f53834f3ae4 100644
--- a/drivers/media/i2c/sony-btf-mpx.c
+++ b/drivers/media/i2c/sony-btf-mpx.c
@@ -375,7 +375,7 @@ static struct i2c_driver sony_btf_mpx_driver =3D {
 	.driver =3D {
 		.name	=3D "sony-btf-mpx",
 	},
-	.probe_new =3D sony_btf_mpx_probe,
+	.probe =3D sony_btf_mpx_probe,
 	.remove =3D sony_btf_mpx_remove,
 	.id_table =3D sony_btf_mpx_id,
 };
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 31b89aff0e86..19efefe38727 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -1091,7 +1091,7 @@ static struct i2c_driver mipid02_i2c_driver =3D {
 		.name  =3D "st-mipid02",
 		.of_match_table =3D mipid02_dt_ids,
 	},
-	.probe_new =3D mipid02_probe,
+	.probe =3D mipid02_probe,
 	.remove =3D mipid02_remove,
 };
=20
diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index adbd093ad190..30f82ca344c4 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1951,7 +1951,7 @@ static struct i2c_driver vgxy61_i2c_driver =3D {
 		.of_match_table =3D vgxy61_dt_ids,
 		.pm =3D &vgxy61_pm_ops,
 	},
-	.probe_new =3D vgxy61_probe,
+	.probe =3D vgxy61_probe,
 	.remove =3D vgxy61_remove,
 };
=20
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 9197fa0b1bc2..15f8163be9bf 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2206,7 +2206,7 @@ static struct i2c_driver tc358743_driver =3D {
 		.name =3D "tc358743",
 		.of_match_table =3D of_match_ptr(tc358743_of_match),
 	},
-	.probe_new =3D tc358743_probe,
+	.probe =3D tc358743_probe,
 	.remove =3D tc358743_remove,
 	.id_table =3D tc358743_id,
 };
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index ec1a193ba161..e9b2d906c177 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1686,7 +1686,7 @@ static struct i2c_driver tc358746_driver =3D {
 		.pm =3D pm_ptr(&tc358746_pm_ops),
 		.of_match_table =3D tc358746_of_match,
 	},
-	.probe_new =3D tc358746_probe,
+	.probe =3D tc358746_probe,
 	.remove =3D tc358746_remove,
 };
=20
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 27f6393dc327..325e99125941 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2834,7 +2834,7 @@ static struct i2c_driver tda1997x_i2c_driver =3D {
 		.name =3D "tda1997x",
 		.of_match_table =3D of_match_ptr(tda1997x_of_id),
 	},
-	.probe_new =3D tda1997x_probe,
+	.probe =3D tda1997x_probe,
 	.remove =3D tda1997x_remove,
 	.id_table =3D tda1997x_i2c_id,
 };
diff --git a/drivers/media/i2c/tda7432.c b/drivers/media/i2c/tda7432.c
index bbceaac8e0b3..6ecdc8e2e0c6 100644
--- a/drivers/media/i2c/tda7432.c
+++ b/drivers/media/i2c/tda7432.c
@@ -409,7 +409,7 @@ static struct i2c_driver tda7432_driver =3D {
 	.driver =3D {
 		.name	=3D "tda7432",
 	},
-	.probe_new	=3D tda7432_probe,
+	.probe		=3D tda7432_probe,
 	.remove		=3D tda7432_remove,
 	.id_table	=3D tda7432_id,
 };
diff --git a/drivers/media/i2c/tda9840.c b/drivers/media/i2c/tda9840.c
index 25fbd7e3950e..1911ef2126be 100644
--- a/drivers/media/i2c/tda9840.c
+++ b/drivers/media/i2c/tda9840.c
@@ -191,7 +191,7 @@ static struct i2c_driver tda9840_driver =3D {
 	.driver =3D {
 		.name	=3D "tda9840",
 	},
-	.probe_new	=3D tda9840_probe,
+	.probe		=3D tda9840_probe,
 	.remove		=3D tda9840_remove,
 	.id_table	=3D tda9840_id,
 };
diff --git a/drivers/media/i2c/tea6415c.c b/drivers/media/i2c/tea6415c.c
index d375d2d24354..3ed6e441d515 100644
--- a/drivers/media/i2c/tea6415c.c
+++ b/drivers/media/i2c/tea6415c.c
@@ -150,7 +150,7 @@ static struct i2c_driver tea6415c_driver =3D {
 	.driver =3D {
 		.name	=3D "tea6415c",
 	},
-	.probe_new	=3D tea6415c_probe,
+	.probe		=3D tea6415c_probe,
 	.remove		=3D tea6415c_remove,
 	.id_table	=3D tea6415c_id,
 };
diff --git a/drivers/media/i2c/tea6420.c b/drivers/media/i2c/tea6420.c
index 9da1f3b02c57..63f23784bb41 100644
--- a/drivers/media/i2c/tea6420.c
+++ b/drivers/media/i2c/tea6420.c
@@ -132,7 +132,7 @@ static struct i2c_driver tea6420_driver =3D {
 	.driver =3D {
 		.name	=3D "tea6420",
 	},
-	.probe_new	=3D tea6420_probe,
+	.probe		=3D tea6420_probe,
 	.remove		=3D tea6420_remove,
 	.id_table	=3D tea6420_id,
 };
diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index 67de90cf696e..ea70c1c13872 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -376,7 +376,7 @@ static struct i2c_driver ths7303_driver =3D {
 	.driver =3D {
 		.name	=3D "ths73x3",
 	},
-	.probe_new	=3D ths7303_probe,
+	.probe		=3D ths7303_probe,
 	.remove		=3D ths7303_remove,
 	.id_table	=3D ths7303_id,
 };
diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 081ef5a4b950..0e0f676cd221 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -499,7 +499,7 @@ static struct i2c_driver ths8200_driver =3D {
 		.name =3D "ths8200",
 		.of_match_table =3D of_match_ptr(ths8200_of_match),
 	},
-	.probe_new =3D ths8200_probe,
+	.probe =3D ths8200_probe,
 	.remove =3D ths8200_remove,
 	.id_table =3D ths8200_id,
 };
diff --git a/drivers/media/i2c/tlv320aic23b.c b/drivers/media/i2c/tlv320aic=
23b.c
index 47198e803817..d800ff8af1ff 100644
--- a/drivers/media/i2c/tlv320aic23b.c
+++ b/drivers/media/i2c/tlv320aic23b.c
@@ -197,7 +197,7 @@ static struct i2c_driver tlv320aic23b_driver =3D {
 	.driver =3D {
 		.name	=3D "tlv320aic23b",
 	},
-	.probe_new	=3D tlv320aic23b_probe,
+	.probe		=3D tlv320aic23b_probe,
 	.remove		=3D tlv320aic23b_remove,
 	.id_table	=3D tlv320aic23b_id,
 };
diff --git a/drivers/media/i2c/tvaudio.c b/drivers/media/i2c/tvaudio.c
index a54c76d9e23b..ba20f35cafd5 100644
--- a/drivers/media/i2c/tvaudio.c
+++ b/drivers/media/i2c/tvaudio.c
@@ -2095,7 +2095,7 @@ static struct i2c_driver tvaudio_driver =3D {
 	.driver =3D {
 		.name	=3D "tvaudio",
 	},
-	.probe_new	=3D tvaudio_probe,
+	.probe		=3D tvaudio_probe,
 	.remove		=3D tvaudio_remove,
 	.id_table	=3D tvaudio_id,
 };
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index f294cae72b01..aa6d4b67b6d5 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -1208,7 +1208,7 @@ static struct i2c_driver tvp514x_driver =3D {
 		.of_match_table =3D of_match_ptr(tvp514x_of_match),
 		.name =3D TVP514X_MODULE_NAME,
 	},
-	.probe_new =3D tvp514x_probe,
+	.probe =3D tvp514x_probe,
 	.remove =3D tvp514x_remove,
 	.id_table =3D tvp514x_id,
 };
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 859f1cb2fa74..c7fb35ee3f9d 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2280,7 +2280,7 @@ static struct i2c_driver tvp5150_driver =3D {
 		.name	=3D "tvp5150",
 		.pm	=3D &tvp5150_pm_ops,
 	},
-	.probe_new	=3D tvp5150_probe,
+	.probe		=3D tvp5150_probe,
 	.remove		=3D tvp5150_remove,
 	.id_table	=3D tvp5150_id,
 };
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index 4ccd218f5584..a2d7bc799849 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -1079,7 +1079,7 @@ static struct i2c_driver tvp7002_driver =3D {
 		.of_match_table =3D of_match_ptr(tvp7002_of_match),
 		.name =3D TVP7002_MODULE_NAME,
 	},
-	.probe_new =3D tvp7002_probe,
+	.probe =3D tvp7002_probe,
 	.remove =3D tvp7002_remove,
 	.id_table =3D tvp7002_id,
 };
diff --git a/drivers/media/i2c/tw2804.c b/drivers/media/i2c/tw2804.c
index 710790ece11b..6a2521e3a25c 100644
--- a/drivers/media/i2c/tw2804.c
+++ b/drivers/media/i2c/tw2804.c
@@ -423,7 +423,7 @@ static struct i2c_driver tw2804_driver =3D {
 	.driver =3D {
 		.name	=3D "tw2804",
 	},
-	.probe_new	=3D tw2804_probe,
+	.probe		=3D tw2804_probe,
 	.remove		=3D tw2804_remove,
 	.id_table	=3D tw2804_id,
 };
diff --git a/drivers/media/i2c/tw9903.c b/drivers/media/i2c/tw9903.c
index 428ee55787e1..996be3960af3 100644
--- a/drivers/media/i2c/tw9903.c
+++ b/drivers/media/i2c/tw9903.c
@@ -254,7 +254,7 @@ static struct i2c_driver tw9903_driver =3D {
 	.driver =3D {
 		.name	=3D "tw9903",
 	},
-	.probe_new =3D tw9903_probe,
+	.probe =3D tw9903_probe,
 	.remove =3D tw9903_remove,
 	.id_table =3D tw9903_id,
 };
diff --git a/drivers/media/i2c/tw9906.c b/drivers/media/i2c/tw9906.c
index 7824ed9b04ed..25c625f6d6e4 100644
--- a/drivers/media/i2c/tw9906.c
+++ b/drivers/media/i2c/tw9906.c
@@ -222,7 +222,7 @@ static struct i2c_driver tw9906_driver =3D {
 	.driver =3D {
 		.name	=3D "tw9906",
 	},
-	.probe_new =3D tw9906_probe,
+	.probe =3D tw9906_probe,
 	.remove =3D tw9906_remove,
 	.id_table =3D tw9906_id,
 };
diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 459fa22f4341..477a64d8f8ab 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -1012,7 +1012,7 @@ static struct i2c_driver tw9910_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "tw9910",
 	},
-	.probe_new =3D tw9910_probe,
+	.probe    =3D tw9910_probe,
 	.remove   =3D tw9910_remove,
 	.id_table =3D tw9910_id,
 };
diff --git a/drivers/media/i2c/uda1342.c b/drivers/media/i2c/uda1342.c
index b6873d866272..da7bc4700bed 100644
--- a/drivers/media/i2c/uda1342.c
+++ b/drivers/media/i2c/uda1342.c
@@ -88,7 +88,7 @@ static struct i2c_driver uda1342_driver =3D {
 	.driver =3D {
 		.name	=3D "uda1342",
 	},
-	.probe_new	=3D uda1342_probe,
+	.probe		=3D uda1342_probe,
 	.remove		=3D uda1342_remove,
 	.id_table	=3D uda1342_id,
 };
diff --git a/drivers/media/i2c/upd64031a.c b/drivers/media/i2c/upd64031a.c
index 47eed3aab060..54c2ba0ba375 100644
--- a/drivers/media/i2c/upd64031a.c
+++ b/drivers/media/i2c/upd64031a.c
@@ -228,7 +228,7 @@ static struct i2c_driver upd64031a_driver =3D {
 	.driver =3D {
 		.name	=3D "upd64031a",
 	},
-	.probe_new	=3D upd64031a_probe,
+	.probe		=3D upd64031a_probe,
 	.remove		=3D upd64031a_remove,
 	.id_table	=3D upd64031a_id,
 };
diff --git a/drivers/media/i2c/upd64083.c b/drivers/media/i2c/upd64083.c
index 3f5a7d4853a1..2a820589a4cb 100644
--- a/drivers/media/i2c/upd64083.c
+++ b/drivers/media/i2c/upd64083.c
@@ -199,7 +199,7 @@ static struct i2c_driver upd64083_driver =3D {
 	.driver =3D {
 		.name	=3D "upd64083",
 	},
-	.probe_new	=3D upd64083_probe,
+	.probe		=3D upd64083_probe,
 	.remove		=3D upd64083_remove,
 	.id_table	=3D upd64083_id,
 };
diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index dddf9827b314..4ba2c5518579 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -959,7 +959,7 @@ static struct i2c_driver video_i2c_driver =3D {
 		.of_match_table =3D video_i2c_of_match,
 		.pm	=3D &video_i2c_pm_ops,
 	},
-	.probe_new	=3D video_i2c_probe,
+	.probe		=3D video_i2c_probe,
 	.remove		=3D video_i2c_remove,
 	.id_table	=3D video_i2c_id_table,
 };
diff --git a/drivers/media/i2c/vp27smpx.c b/drivers/media/i2c/vp27smpx.c
index ed1c58ea8ed3..0ba3c2b68037 100644
--- a/drivers/media/i2c/vp27smpx.c
+++ b/drivers/media/i2c/vp27smpx.c
@@ -181,7 +181,7 @@ static struct i2c_driver vp27smpx_driver =3D {
 	.driver =3D {
 		.name	=3D "vp27smpx",
 	},
-	.probe_new	=3D vp27smpx_probe,
+	.probe		=3D vp27smpx_probe,
 	.remove		=3D vp27smpx_remove,
 	.id_table	=3D vp27smpx_id,
 };
diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index aa73d5dcc3e7..1eaae886f217 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -546,7 +546,7 @@ static struct i2c_driver vpx3220_driver =3D {
 	.driver =3D {
 		.name	=3D "vpx3220",
 	},
-	.probe_new	=3D vpx3220_probe,
+	.probe		=3D vpx3220_probe,
 	.remove		=3D vpx3220_remove,
 	.id_table	=3D vpx3220_id,
 };
diff --git a/drivers/media/i2c/wm8739.c b/drivers/media/i2c/wm8739.c
index 8b34a673ffd3..19bf7a00dff9 100644
--- a/drivers/media/i2c/wm8739.c
+++ b/drivers/media/i2c/wm8739.c
@@ -252,7 +252,7 @@ static struct i2c_driver wm8739_driver =3D {
 	.driver =3D {
 		.name	=3D "wm8739",
 	},
-	.probe_new	=3D wm8739_probe,
+	.probe		=3D wm8739_probe,
 	.remove		=3D wm8739_remove,
 	.id_table	=3D wm8739_id,
 };
diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
index 56d98518f7eb..d1b716fd6f11 100644
--- a/drivers/media/i2c/wm8775.c
+++ b/drivers/media/i2c/wm8775.c
@@ -298,7 +298,7 @@ static struct i2c_driver wm8775_driver =3D {
 	.driver =3D {
 		.name	=3D "wm8775",
 	},
-	.probe_new	=3D wm8775_probe,
+	.probe		=3D wm8775_probe,
 	.remove		=3D wm8775_remove,
 	.id_table	=3D wm8775_id,
 };
diff --git a/drivers/media/radio/radio-tea5764.c b/drivers/media/radio/radi=
o-tea5764.c
index 2cb74afba49c..14e7dd3889ff 100644
--- a/drivers/media/radio/radio-tea5764.c
+++ b/drivers/media/radio/radio-tea5764.c
@@ -511,7 +511,7 @@ static struct i2c_driver tea5764_i2c_driver =3D {
 	.driver =3D {
 		.name =3D "radio-tea5764",
 	},
-	.probe_new =3D tea5764_i2c_probe,
+	.probe =3D tea5764_i2c_probe,
 	.remove =3D tea5764_i2c_remove,
 	.id_table =3D tea5764_id,
 };
diff --git a/drivers/media/radio/saa7706h.c b/drivers/media/radio/saa7706h.c
index 3c758a983344..91345198bbf1 100644
--- a/drivers/media/radio/saa7706h.c
+++ b/drivers/media/radio/saa7706h.c
@@ -405,7 +405,7 @@ static struct i2c_driver saa7706h_driver =3D {
 	.driver =3D {
 		.name	=3D DRIVER_NAME,
 	},
-	.probe_new	=3D saa7706h_probe,
+	.probe		=3D saa7706h_probe,
 	.remove		=3D saa7706h_remove,
 	.id_table	=3D saa7706h_id,
 };
diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/=
radio/si470x/radio-si470x-i2c.c
index a6ad926c2b4e..fd449e42c191 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -532,7 +532,7 @@ static struct i2c_driver si470x_i2c_driver =3D {
 		.pm		=3D &si470x_i2c_pm,
 #endif
 	},
-	.probe_new		=3D si470x_i2c_probe,
+	.probe			=3D si470x_i2c_probe,
 	.remove			=3D si470x_i2c_remove,
 	.id_table		=3D si470x_i2c_id,
 };
diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si47=
13/si4713.c
index 93d847c294e8..ddaf7a60b7d0 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -1657,7 +1657,7 @@ static struct i2c_driver si4713_i2c_driver =3D {
 		.name	=3D "si4713",
 		.of_match_table =3D of_match_ptr(si4713_of_match),
 	},
-	.probe_new	=3D si4713_probe,
+	.probe		=3D si4713_probe,
 	.remove         =3D si4713_remove,
 	.id_table       =3D si4713_id,
 };
diff --git a/drivers/media/radio/tef6862.c b/drivers/media/radio/tef6862.c
index d14c97d79e83..215168aa1588 100644
--- a/drivers/media/radio/tef6862.c
+++ b/drivers/media/radio/tef6862.c
@@ -183,7 +183,7 @@ static struct i2c_driver tef6862_driver =3D {
 	.driver =3D {
 		.name	=3D DRIVER_NAME,
 	},
-	.probe_new	=3D tef6862_probe,
+	.probe		=3D tef6862_probe,
 	.remove		=3D tef6862_remove,
 	.id_table	=3D tef6862_id,
 };
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media=
/test-drivers/vidtv/vidtv_demod.c
index b878db798686..7a0cd9601917 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -449,7 +449,7 @@ static struct i2c_driver vidtv_demod_i2c_driver =3D {
 		.name                =3D "dvb_vidtv_demod",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new =3D vidtv_demod_i2c_probe,
+	.probe    =3D vidtv_demod_i2c_probe,
 	.remove   =3D vidtv_demod_i2c_remove,
 	.id_table =3D vidtv_demod_i2c_id_table,
 };
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media=
/test-drivers/vidtv/vidtv_tuner.c
index 55a4387f3854..a748737d47f3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -425,7 +425,7 @@ static struct i2c_driver vidtv_tuner_i2c_driver =3D {
 		.name                =3D "dvb_vidtv_tuner",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new =3D vidtv_tuner_i2c_probe,
+	.probe    =3D vidtv_tuner_i2c_probe,
 	.remove   =3D vidtv_tuner_i2c_remove,
 	.id_table =3D vidtv_tuner_i2c_id_table,
 };
diff --git a/drivers/media/tuners/e4000.c b/drivers/media/tuners/e4000.c
index 7c269f3159ef..3893a00c18ce 100644
--- a/drivers/media/tuners/e4000.c
+++ b/drivers/media/tuners/e4000.c
@@ -729,7 +729,7 @@ static struct i2c_driver e4000_driver =3D {
 		.name	=3D "e4000",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D e4000_probe,
+	.probe		=3D e4000_probe,
 	.remove		=3D e4000_remove,
 	.id_table	=3D e4000_id_table,
 };
diff --git a/drivers/media/tuners/fc2580.c b/drivers/media/tuners/fc2580.c
index 3cd8279f4f2e..f6613dcf40a3 100644
--- a/drivers/media/tuners/fc2580.c
+++ b/drivers/media/tuners/fc2580.c
@@ -610,7 +610,7 @@ static struct i2c_driver fc2580_driver =3D {
 		.name	=3D "fc2580",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D fc2580_probe,
+	.probe		=3D fc2580_probe,
 	.remove		=3D fc2580_remove,
 	.id_table	=3D fc2580_id_table,
 };
diff --git a/drivers/media/tuners/m88rs6000t.c b/drivers/media/tuners/m88rs=
6000t.c
index 7d172a5a66d9..2cd7f0e0c70d 100644
--- a/drivers/media/tuners/m88rs6000t.c
+++ b/drivers/media/tuners/m88rs6000t.c
@@ -718,7 +718,7 @@ static struct i2c_driver m88rs6000t_driver =3D {
 	.driver =3D {
 		.name	=3D "m88rs6000t",
 	},
-	.probe_new	=3D m88rs6000t_probe,
+	.probe		=3D m88rs6000t_probe,
 	.remove		=3D m88rs6000t_remove,
 	.id_table	=3D m88rs6000t_id,
 };
diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.c
index e5d86874adb3..0278a9f0aeef 100644
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -524,7 +524,7 @@ static struct i2c_driver mt2060_driver =3D {
 		.name =3D "mt2060",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D mt2060_probe,
+	.probe		=3D mt2060_probe,
 	.remove		=3D mt2060_remove,
 	.id_table	=3D mt2060_id_table,
 };
diff --git a/drivers/media/tuners/mxl301rf.c b/drivers/media/tuners/mxl301r=
f.c
index c35442a77ae5..9b2b237745ae 100644
--- a/drivers/media/tuners/mxl301rf.c
+++ b/drivers/media/tuners/mxl301rf.c
@@ -326,7 +326,7 @@ static struct i2c_driver mxl301rf_driver =3D {
 	.driver =3D {
 		.name	=3D "mxl301rf",
 	},
-	.probe_new	=3D mxl301rf_probe,
+	.probe		=3D mxl301rf_probe,
 	.remove		=3D mxl301rf_remove,
 	.id_table	=3D mxl301rf_id,
 };
diff --git a/drivers/media/tuners/qm1d1b0004.c b/drivers/media/tuners/qm1d1=
b0004.c
index 0b6f750c54ad..af2d3618b9d5 100644
--- a/drivers/media/tuners/qm1d1b0004.c
+++ b/drivers/media/tuners/qm1d1b0004.c
@@ -253,7 +253,7 @@ static struct i2c_driver qm1d1b0004_driver =3D {
 	.driver =3D {
 		.name =3D "qm1d1b0004",
 	},
-	.probe_new =3D qm1d1b0004_probe,
+	.probe    =3D qm1d1b0004_probe,
 	.remove   =3D qm1d1b0004_remove,
 	.id_table =3D qm1d1b0004_id,
 };
diff --git a/drivers/media/tuners/qm1d1c0042.c b/drivers/media/tuners/qm1d1=
c0042.c
index f9be7a721d2c..ce7223315b0c 100644
--- a/drivers/media/tuners/qm1d1c0042.c
+++ b/drivers/media/tuners/qm1d1c0042.c
@@ -443,7 +443,7 @@ static struct i2c_driver qm1d1c0042_driver =3D {
 	.driver =3D {
 		.name	=3D "qm1d1c0042",
 	},
-	.probe_new	=3D qm1d1c0042_probe,
+	.probe		=3D qm1d1c0042_probe,
 	.remove		=3D qm1d1c0042_remove,
 	.id_table	=3D qm1d1c0042_id,
 };
diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 3fa3dcda917a..def06c262ea2 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -990,7 +990,7 @@ static struct i2c_driver si2157_driver =3D {
 		.name		     =3D "si2157",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D si2157_probe,
+	.probe		=3D si2157_probe,
 	.remove		=3D si2157_remove,
 	.id_table	=3D si2157_id_table,
 };
diff --git a/drivers/media/tuners/tda18212.c b/drivers/media/tuners/tda1821=
2.c
index 5fdf05a97415..8d742bd61df0 100644
--- a/drivers/media/tuners/tda18212.c
+++ b/drivers/media/tuners/tda18212.c
@@ -263,7 +263,7 @@ static struct i2c_driver tda18212_driver =3D {
 	.driver =3D {
 		.name	=3D "tda18212",
 	},
-	.probe_new	=3D tda18212_probe,
+	.probe		=3D tda18212_probe,
 	.remove		=3D tda18212_remove,
 	.id_table	=3D tda18212_id,
 };
diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda1825=
0.c
index 66ff2d035de7..32ea473f3f49 100644
--- a/drivers/media/tuners/tda18250.c
+++ b/drivers/media/tuners/tda18250.c
@@ -877,7 +877,7 @@ static struct i2c_driver tda18250_driver =3D {
 	.driver =3D {
 		.name	=3D "tda18250",
 	},
-	.probe_new	=3D tda18250_probe,
+	.probe		=3D tda18250_probe,
 	.remove		=3D tda18250_remove,
 	.id_table	=3D tda18250_id_table,
 };
diff --git a/drivers/media/tuners/tua9001.c b/drivers/media/tuners/tua9001.c
index ac38afd3441a..03a3a022b0a8 100644
--- a/drivers/media/tuners/tua9001.c
+++ b/drivers/media/tuners/tua9001.c
@@ -255,7 +255,7 @@ static struct i2c_driver tua9001_driver =3D {
 		.name	=3D "tua9001",
 		.suppress_bind_attrs =3D true,
 	},
-	.probe_new	=3D tua9001_probe,
+	.probe		=3D tua9001_probe,
 	.remove		=3D tua9001_remove,
 	.id_table	=3D tua9001_id_table,
 };
diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7=
007/s2250-board.c
index 29dfcc6d0b0a..db1fab96d529 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -620,7 +620,7 @@ static struct i2c_driver s2250_driver =3D {
 	.driver =3D {
 		.name	=3D "s2250",
 	},
-	.probe_new	=3D s2250_probe,
+	.probe		=3D s2250_probe,
 	.remove		=3D s2250_remove,
 	.id_table	=3D s2250_id,
 };
diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-core=
/tuner-core.c
index 1c0d23c52203..5687089bea6e 100644
--- a/drivers/media/v4l2-core/tuner-core.c
+++ b/drivers/media/v4l2-core/tuner-core.c
@@ -1411,7 +1411,7 @@ static struct i2c_driver tuner_driver =3D {
 		.name	=3D "tuner",
 		.pm	=3D &tuner_pm_ops,
 	},
-	.probe_new	=3D tuner_probe,
+	.probe		=3D tuner_probe,
 	.remove		=3D tuner_remove,
 	.command	=3D tuner_command,
 	.id_table	=3D tuner_id,

base-commit: ac9a78681b921877518763ba0e89202254349d1b
--=20
2.39.2

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vimswkwzqfivy4xz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRgzjYACgkQj4D7WH0S
/k4Iiwf/cFtXxlF+vFS6W1AOWk2pGmMO+WrBAueB3pIMsJ51hegr2/EBQB96QDPT
CTsVfJM1j7hz8DMSGuRGPUndnYeeYl+Ps56UV5dAnWjheju4QRo0qiWZo0f+q8df
spR16Mm9igBhUC5NvZgkIdYFeRe1UyJiUID8eBPQLa5XrE8kxtjnUBowP/Yr/Lfw
SD0kiGFWt9L+h8uUT1Ys1TTcxnw3KzfBlYeatmf33CKj5UuiKFOwnA9MC9khblgV
A44fyTc1+RuxncbUPCFEi3ymZ7qsKgqJQq+fQdJG836LxB3GM3DCXhGZMyJEzLDt
HIcjUte4cW4QyDb8YaxTXqEPd+YQ+Q==
=eWMu
-----END PGP SIGNATURE-----

--vimswkwzqfivy4xz--
