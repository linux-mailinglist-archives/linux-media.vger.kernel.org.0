Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56AC12C2DD
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2019 15:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfL2OyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Dec 2019 09:54:14 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45957 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfL2OyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Dec 2019 09:54:14 -0500
Received: by mail-lj1-f195.google.com with SMTP id j26so31070530ljc.12;
        Sun, 29 Dec 2019 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6XH/Q/b5MM1bx9nTyprJ5TouNRSVpMkUv4S5whbl8F4=;
        b=gHim8yTjp2XkdL33dtLSkq/vW4ANMn8+UtNmRQQjcmdXB4UMnqqL6XaBvqygg2SDDM
         vTeNWZFUwSOR9bttwuYxy0YpvyijFjWpNU6SNY1WMAUqYnMCXM1oVVBlJO7hydqhbefg
         5vpgBs5aAFoJq/8TS/rDnIWqyEQ0R9TEnRpS4QfLY5FvNdeXrS2qsDI9id9AGqfZLYvU
         QQF+jdLIDE+YqA8q6hv+FrLx1eU950/SrvoqTv3xAbRdwuzplfFpyNu9BQVLDxoYf/HP
         NJD1aGs0zEuggl9iGtncMmGOnt3C3L99H7boonPjOX4SPvlY0gjhdwcVOifIxGUZrVYi
         6XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6XH/Q/b5MM1bx9nTyprJ5TouNRSVpMkUv4S5whbl8F4=;
        b=ICrImsVWPbUybzBZXNSE1MvPrVdNYJL2Vgwm6YPbRZDa7qr9zWMyLHQm4YE5t0eReK
         mcNpwsgrzGj/7fZafLVFN/DEAuO9tPN5EUlEXzpqSX5JyCZHt9k7zDcQ11MDoJf088IT
         otw7/lnag5Ic9brHGgI7H2IQlnkaXivY/GJtlcYA3JdztwviXxhMZfv/QjEUJUm8yXCO
         eKcBQUuudA4RfOo7PM0PAnORIUY68p9ssxngvvt+cUfNi98cYKS/f7h8Nl0ZJCcmKgNy
         YIMq9UQ5z3jWZkQMK6Pztj2JAe5Gvx1izTccUrUwX7bJLcJZH9A+em2eKtsAB9sp26MN
         S1fQ==
X-Gm-Message-State: APjAAAWNjaJmWpfh/A6xuvFIOpciHzN/BtBLxY/BET+ZSZYvdlS1wdj8
        XYZTFfO+bHlfHlf/THmjIvU=
X-Google-Smtp-Source: APXvYqxKM248FrkgwBtcGlZgQFCHgbTZ+zzGppEiCj5B92N7tgdOJt9aJ8JddY3M4zdIabhjoggsWg==
X-Received: by 2002:a2e:a408:: with SMTP id p8mr34378652ljn.145.1577631251784;
        Sun, 29 Dec 2019 06:54:11 -0800 (PST)
Received: from localhost.localdomain ([194.29.183.39])
        by smtp.googlemail.com with ESMTPSA id q186sm16312910ljq.14.2019.12.29.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 06:54:11 -0800 (PST)
From:   Tomasz Maciej Nowak <tmn505@gmail.com>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb: add support for TerraTec TC2 Stick (193534)
Date:   Sun, 29 Dec 2019 15:53:55 +0100
Message-Id: <20191229145355.6941-1-tmn505@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Seems to be a clone of Logilink VG0022A. Supports DVB-C, DVB-T and
DVB-T2. Only terrestrial reception was tested on Polish and Czech
multiplexes.

Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 15 ++++++++++-----
 include/media/dvb-usb-ids.h           |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 792667ee5ebc..e1df2e7f7842 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1621,9 +1621,10 @@ static int it930x_tuner_attach(struct dvb_usb_adapter *adap)
 	si2157_config.fe = adap->fe[0];
 
 	/*
-	 * HACK: The Logilink VG0022A has a bug: when the si2157
-	 * firmware that came with the device is replaced by a new
-	 * one, the I2C transfers to the tuner will return just 0xff.
+	 * HACK: The Logilink VG0022A and TerraTec TC2 Stick have
+	 * a bug: when the si2157 firmware that came with the device
+	 * is replaced by a new one, the I2C transfers to the tuner
+	 * will return just 0xff.
 	 *
 	 * Probably, the vendor firmware has some patch specifically
 	 * designed for this device. So, we can't replace by the
@@ -1633,8 +1634,10 @@ static int it930x_tuner_attach(struct dvb_usb_adapter *adap)
 	 * while we don't have that, the next best solution is to just
 	 * keep the original firmware at the device.
 	 */
-	if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK &&
-	    le16_to_cpu(d->udev->descriptor.idProduct) == 0x0100)
+	if ((le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK &&
+	    le16_to_cpu(d->udev->descriptor.idProduct) == 0x0100) ||
+	    (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_TERRATEC &&
+	    le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_TERRATEC_CINERGY_TC2_STICK))
 		si2157_config.dont_load_firmware = true;
 
 	si2157_config.if_port = it930x_addresses_table[state->it930x_addresses].tuner_if_port;
@@ -2150,6 +2153,8 @@ static const struct usb_device_id af9035_id_table[] = {
 		&it930x_props, "AVerMedia TD310 DVB-T2", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
 		&it930x_props, "Logilink VG0022A", NULL) },
+	{ DVB_USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_TC2_STICK,
+		&it930x_props, "TerraTec Cinergy TC2 Stick", NULL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, af9035_id_table);
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 1409230ad3a4..0ccb78a840d8 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -180,6 +180,7 @@
 #define USB_PID_TERRATEC_CINERGY_T_STICK_RC		0x0097
 #define USB_PID_TERRATEC_CINERGY_T_STICK_DUAL_RC	0x0099
 #define USB_PID_TERRATEC_CINERGY_T_STICK_BLACK_REV1	0x00a9
+#define USB_PID_TERRATEC_CINERGY_TC2_STICK		0x10b2
 #define USB_PID_TWINHAN_VP7041_COLD			0x3201
 #define USB_PID_TWINHAN_VP7041_WARM			0x3202
 #define USB_PID_TWINHAN_VP7020_COLD			0x3203
-- 
2.24.1

