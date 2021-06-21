Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813E63AE956
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 14:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFUMqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 08:46:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:42954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230151AbhFUMqT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 08:46:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 218C26100A;
        Mon, 21 Jun 2021 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624279445;
        bh=zBkrPCc4gukU1g4aKIjdASlfQzXliDqkFOJ3vMm+t6s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O1zAklzB02xKPtjGbXU9ihqBoFIwm+3B6CpTPV2laRLwIz3KMPN0iYzLNTxq07fDd
         qKZRBYVaEtgTMSH0d4zBt2ccFoao1nC3s31g5RAV2uKZ7XRVzoJJwyBsDJQdSkFbw/
         MY0lkkf8DPUPHcWNhit4cJeU1RmuPwqHYOF8BwlPT+htFGCbUXLi16f7O6BCE8Hp8D
         CGSR9Dts0ZeotkJQq5F2Ti9iJNoI4W/g1f+pT7hCdSsAoRMDaMY/CnO+Hx5fF+667l
         zAGlyIR9ZRwXTLQbEdyTsv54zdmzko60P2+Rx9c1orT0mt3G8Z8MODdrHcghCER2PJ
         L8eVrNz0NBlFg==
Date:   Mon, 21 Jun 2021 14:44:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     =?UTF-8?B?SsOhbiDEjMOhbmk=?= <pego149@gmail.com>
Cc:     linux-media@vger.kernel.org, jp@jpvw.nl
Subject: Re: [PATCH] Signed-off-by: =?UTF-8?B?SsOhbiDEjMOhbmk=?=
 <pego149@gmail.com> Added Geniatech MyGica T230C2_LITE and T230A as many
 people asking support for these devices on forums.
Message-ID: <20210621144402.303c95c0@coco.lan>
In-Reply-To: <YMuptIYFLdwSmw//@kali>
References: <YMuptIYFLdwSmw//@kali>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 17 Jun 2021 21:59:48 +0200
J=C3=A1n =C4=8C=C3=A1ni <pego149@gmail.com> escreveu:

Patch applied, although the e-mail subject is really weird.

Next time, please ensure that the subject line would be a short
description of the patch, and that a more detailed description,
plus your SoB are at the beginning of the e-mail, e. g. the e-mail
should be like:


Date: Thu, 17 Jun 2021 21:59:48 +0200
Subject: [PATCH] media: dvbsky: add support for MyGica T230C2_LITE and T230A
From: J=C3=A1n =C4=8C=C3=A1ni <pego149@gmail.com>

Add Geniatech MyGica T230C2_LITE and T230A as many people
are asking support for these devices on forums.

Signed-off-by: J=C3=A1n =C4=8C=C3=A1ni <pego149@gmail.com>

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-=
usb-v2/dvbsky.c
index 689829f1b52a..1221c924312a 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -541,7 +541,9 @@ static int dvbsky_mygica_t230c_attach(struct dvb_usb_ad=
apter *adap)
 	si2168_config.i2c_adapter =3D &i2c_adapter;
 	si2168_config.fe =3D &adap->fe[0];
 	si2168_config.ts_mode =3D SI2168_TS_PARALLEL;
-	if (le16_to_cpu(d->udev->descriptor.idProduct) =3D=3D USB_PID_MYGICA_T230=
C2)
+	if (le16_to_cpu(d->udev->descriptor.idProduct) =3D=3D USB_PID_MYGICA_T230=
C2 ||
+	    le16_to_cpu(d->udev->descriptor.idProduct) =3D=3D USB_PID_MYGICA_T230=
C2_LITE ||
+	    le16_to_cpu(d->udev->descriptor.idProduct) =3D=3D USB_PID_MYGICA_T230=
A)
 		si2168_config.ts_mode |=3D SI2168_TS_CLK_MANUAL;
 	si2168_config.ts_clock_inv =3D 1;
=20
@@ -577,15 +579,24 @@ static int dvbsky_mygica_t230c_attach(struct dvb_usb_=
adapter *adap)
=20
 static int dvbsky_identify_state(struct dvb_usb_device *d, const char **na=
me)
 {
-	dvbsky_gpio_ctrl(d, 0x04, 1);
-	msleep(20);
-	dvbsky_gpio_ctrl(d, 0x83, 0);
-	dvbsky_gpio_ctrl(d, 0xc0, 1);
-	msleep(100);
-	dvbsky_gpio_ctrl(d, 0x83, 1);
-	dvbsky_gpio_ctrl(d, 0xc0, 0);
-	msleep(50);
-
+	if (le16_to_cpu(d->udev->descriptor.idProduct) =3D=3D USB_PID_MYGICA_T230=
A) {
+		dvbsky_gpio_ctrl(d, 0x87, 0);
+		msleep(20);
+		dvbsky_gpio_ctrl(d, 0x86, 1);
+		dvbsky_gpio_ctrl(d, 0x80, 0);
+		msleep(100);
+		dvbsky_gpio_ctrl(d, 0x80, 1);
+		msleep(50);
+	} else {
+		dvbsky_gpio_ctrl(d, 0x04, 1);
+		msleep(20);
+		dvbsky_gpio_ctrl(d, 0x83, 0);
+		dvbsky_gpio_ctrl(d, 0xc0, 1);
+		msleep(100);
+		dvbsky_gpio_ctrl(d, 0x83, 1);
+		dvbsky_gpio_ctrl(d, 0xc0, 0);
+		msleep(50);
+	}
 	return WARM;
 }
=20
@@ -789,6 +800,12 @@ static const struct usb_device_id dvbsky_id_table[] =
=3D {
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
 		&mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C v2",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2_LITE,
+		 &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C v2  Lite=
",
+		 NULL) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230A,
+		 &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230A",
+		 NULL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index d37cb74b769c..b0a535d6893a 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -394,6 +394,8 @@
 #define USB_PID_MYGICA_T230C				0xc689
 #define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_MYGICA_T230C_LITE			0xc699
+#define USB_PID_MYGICA_T230C2_LITE			0xc69a
+#define USB_PID_MYGICA_T230A				0x689a
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
 #define USB_PID_ELGATO_EYETV_DTT_2			0x003f


Thanks,
Mauro
