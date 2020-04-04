Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA20F19E742
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 21:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgDDTPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 15:15:33 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42274 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgDDTPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 15:15:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 558421C3C31; Sat,  4 Apr 2020 21:15:31 +0200 (CEST)
Date:   Sat, 4 Apr 2020 21:15:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux@rainbow-software.org, kilgota@auburn.edu, moinejf@free.fr
Subject: Re: gspca webcam: need to plug it 5 times before it works
Message-ID: <20200404191530.GA19753@duo.ucw.cz>
References: <20200404184732.GA17534@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20200404184732.GA17534@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> ..but if I'm patient enough, it eventually starts working... somehow.
>=20
> Incoming data seems to go in reliably. Outgoing commands (such as
> change gain) don't seem to be unreliable.
>=20
> Any idea how to debug / what could be wrong?

And I can force it to probe like this: which... makes it work, but
does not fix the outgoing commands.

Any ideas?

Best regards,
								Pavel

diff --git a/drivers/media/usb/gspca/sq930x.c b/drivers/media/usb/gspca/sq9=
30x.c
index c3610247a90e..c9756c0a78df 100644
--- a/drivers/media/usb/gspca/sq930x.c
+++ b/drivers/media/usb/gspca/sq930x.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2007 Sam Revitch <samr7@cs.washington.edu>
  */
=20
+#define DEBUG
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
 #define MODULE_NAME "sq930x"
@@ -446,7 +447,7 @@ static void reg_w(struct gspca_dev *gspca_dev, u16 valu=
e, u16 index)
 			USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			value, index, NULL, 0,
 			500);
-	msleep(30);
+	msleep(90);
 	if (ret < 0) {
 		pr_err("reg_w %04x %04x failed %d\n", value, index, ret);
 		gspca_dev->usb_err =3D ret;
@@ -635,19 +636,25 @@ static void cmos_probe(struct gspca_dev *gspca_dev)
 		SENSOR_MT9V111,
 	};
=20
+	printk("CMOS Probing...\n");
 	for (i =3D 0; i < ARRAY_SIZE(probe_order); i++) {
+	  printk("Probing type %d...\n", i);
+	 =20
 		sensor =3D &sensor_tb[probe_order[i]];
 		ucbus_write(&sd->gspca_dev, sensor->cmd, sensor->cmd_len, 8);
 		gpio_init(sd, sensor->gpio);
-		msleep(100);
+		msleep(200);
 		reg_r(gspca_dev, (sensor->i2c_addr << 8) | 0x001c, 1);
-		msleep(100);
-		if (gspca_dev->usb_buf[0] !=3D 0)
+		msleep(200);
+		if (gspca_dev->usb_buf[0] !=3D 0) {
+		  printk("#### LUCKY! Have type %d\n", i);
 			break;
+		}
 	}
 	if (i >=3D ARRAY_SIZE(probe_order)) {
-		pr_err("Unknown sensor\n");
-		gspca_dev->usb_err =3D -EINVAL;
+		printk("Unknown sensor ... hmm?\n");
+		sd->sensor =3D probe_order[i-1];
+		//gspca_dev->usb_err =3D -EINVAL;
 		return;
 	}
 	sd->sensor =3D probe_order[i];


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXojc0gAKCRAw5/Bqldv6
8pHGAJ4it2VlxK0sSNh7mmXW2ZO9AlZyYwCdEUZ+CKo+7OwP8dvOaKl3U0Tou0k=
=Ybm3
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
