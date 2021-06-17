Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD183ABD3D
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 21:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhFQUCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 16:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhFQUCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 16:02:00 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A2BC061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 12:59:52 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l1so12024816ejb.6
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=vX3+zlpBxwZvAkRkerNwjWw0UW9oSlH9+B9qHX9BkGI=;
        b=fO0Koy0K/h6TibpAxqeCP+Gi1b0cVaRmbuBIZA8W69Vn2iSiZS5UZ3BWf4HnCzQm1M
         XSat1AVDEgr2QavO9wJoWsATvqrfw5rGOj0nMlcuTGrmsJYG4S4icjwn03j/oFOJxVGR
         +zcOoFSVUogdcBkYmyFARaePN+U/oQBtR2ntdJP3j6DCKL+7J5jZwhuUpxoWi0sXxxiY
         V3zGYkEGyY73LaXnbz1ZMNUt9ssWgx2N0XjMo6M+LBW6f9xs5T90zzme6FVLVNF8qker
         NyQrOlVY3z6lGVZNUaw9A2LId10Dlrs5/3uiojw2jH+UQlPdRQyvlAaFvcZd7PPd1Of1
         dsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=vX3+zlpBxwZvAkRkerNwjWw0UW9oSlH9+B9qHX9BkGI=;
        b=qJWZXyPDOnmBqOiu8pl6HF6P46mfXcfXzKcTMJ3f7BbllyC57QhH+ukJVNQWIpf4oU
         0pYs2133vMiIf6VI6TUYVp9SlPfQwVLmBEF84A86JCkMQMsrz8ZVXTP7BfDHhvOGMumM
         qtWL8EIkVSA4NrIdDBs3SiQXW3M5hiV7NR3MxLVn9JdYfaT7vKwll4jX3YiC8Z+YmPDy
         2LMji0hteDvD+1YaKkdnY7wC7XIa6LLZje32eid1/QSyEU8QIMADNHs3dtZqkwVkQVB+
         AymkKxt1XObFbh8HrUwIVHzwzEyBMwQMWujDdF1ZBQNtOFQ9vvGUdF+1SlJrXPqfRFdD
         lHDg==
X-Gm-Message-State: AOAM532R4JPDIa6/X1xDz89o3vXdHSM3EEiq3DP3fWrbfQm8v62HM3KA
        WSZ1B6qtA6mxPI71zdkwKDH4SaN93YXuwH/d
X-Google-Smtp-Source: ABdhPJzpTxsY9FwMW0EvoxewsgCegE5XS3rvlkQZgo7rhr9N+vs/9pqz0fn3Yd86Sg8W4TaScWWfmQ==
X-Received: by 2002:a17:906:5d14:: with SMTP id g20mr6920636ejt.243.1623959991001;
        Thu, 17 Jun 2021 12:59:51 -0700 (PDT)
Received: from kali ([185.133.60.141])
        by smtp.gmail.com with ESMTPSA id d4sm4366846ejo.98.2021.06.17.12.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 12:59:50 -0700 (PDT)
Date:   Thu, 17 Jun 2021 21:59:48 +0200
From:   =?utf-8?B?SsOhbiDEjMOhbmk=?= <pego149@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     jp@jpvw.nl
Subject: [PATCH] Signed-off-by: =?utf-8?B?SsOhbiA=?=
 =?utf-8?Q?=C4=8C=C3=A1ni_=3Cpego149=40gmail=2Ecom=3E_Added_Geniatech_MyGi?=
 =?utf-8?Q?ca_T230C2=5FLITE_and_T230?= =?utf-8?Q?A?= as many people asking
 support for these devices on forums.
Message-ID: <YMuptIYFLdwSmw//@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

---
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 37 +++++++++++++++++++--------
 include/media/dvb-usb-ids.h           |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 689829f1b52a..1221c924312a 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -541,7 +541,9 @@ static int dvbsky_mygica_t230c_attach(struct dvb_usb_adapter *adap)
 	si2168_config.i2c_adapter = &i2c_adapter;
 	si2168_config.fe = &adap->fe[0];
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
-	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2)
+	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2 ||
+	    le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2_LITE ||
+	    le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230A)
 		si2168_config.ts_mode |= SI2168_TS_CLK_MANUAL;
 	si2168_config.ts_clock_inv = 1;
 
@@ -577,15 +579,24 @@ static int dvbsky_mygica_t230c_attach(struct dvb_usb_adapter *adap)
 
 static int dvbsky_identify_state(struct dvb_usb_device *d, const char **name)
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
+	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230A) {
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
 
@@ -789,6 +800,12 @@ static const struct usb_device_id dvbsky_id_table[] = {
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
 		&mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C v2",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2_LITE,
+		 &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C v2  Lite",
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
-- 
2.30.2

