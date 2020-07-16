Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC01222E01
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 23:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgGPVdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 17:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgGPVdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 17:33:11 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B115C061755;
        Thu, 16 Jul 2020 14:33:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f139so13196567wmf.5;
        Thu, 16 Jul 2020 14:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jVRCxAU1h8uuMP5tlk5Q3qw+CDViJUj6+cwcmkFoV2I=;
        b=m2OYpSajgIdqjKm9kQG8kvxpt0MuknTil2/DXtr3coNClLWwVDowL4oW+qaM1nPeEQ
         tdKEGdYGp+qtPT15R2/PG4xjaIlSn3zzelPRoUwurVJQvHplOJ+nvOpzuKV6TQppv46b
         rHzDsX0tPxfrUVbXV9HZlESUPIFEuHknSIimxf8z0PLKPD9ZGeqZlyujR8Y8XUW5Hdzm
         1GhZEJxeYK+uMiYtJUngU81CpTJwWMlKst5ZzS9O6H3RssbleNq4FHvbxUpsn/lweUVz
         rk6iykT4jlf3Fftfw0bQ3eBAU3IrE8145Jm4ZVCycNSN/2p3p+CjhdRW0HF2towyYiem
         Y0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jVRCxAU1h8uuMP5tlk5Q3qw+CDViJUj6+cwcmkFoV2I=;
        b=JTpuB2sTB+hDVtVAIltMORi2FFqcBHAyKvL9KM2ZS1wP6WwSviHn2XU+LAxKtxoIKx
         IbANQkA45TCRB/MfnvRHMwH3/qvdIMidGLeIQ+NXT2twqvPatmvdLbX44pluF14JfBsO
         8eKPwLYyFD4aYILTxrc/Nx7BoYlBofEyGZTOeEKIJZZZ0lWA0f9L9cc2WHxLISrnH2RZ
         kgX16PM9vI+kzGL7u/ecbJGjlOc6ZL0dydKpOKYGTqbsTgKveBkLgVeEaoBKbSdRcLeh
         hViZHzwfeKJ1o86tA56XTtZ7bMH3SVSqi/nNpqJf1lD01cCzQGtI790WLYdLZAtMMBo3
         WHUg==
X-Gm-Message-State: AOAM530GfUpAxALGECaHR1vAAmu7Ou7XFFuUe/m7UyuRdGjTBpI3KDeo
        +BjjfqGvNd6qjrsM8JjGkI6eNutgrw==
X-Google-Smtp-Source: ABdhPJzyU+1bToje+Yv8U/cWOGO3OKW1Aeh17ICpPtjpRkx2p87s8HuYdnwNug4TFPuzHzsS5CZc0Q==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr6420782wmi.83.1594935189465;
        Thu, 16 Jul 2020 14:33:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
        by smtp.googlemail.com with ESMTPSA id v11sm7444825wmb.3.2020.07.16.14.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:33:08 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: dvb_usb_pctv452e: use ISL6423 voltage regulator per default
Date:   Thu, 16 Jul 2020 23:33:03 +0200
Message-Id: <20200716213303.20044-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both TT-connect S2-3600 and Pinnacle PCTV Sat HDTV are using
Intersil ISL6423 as LNB voltage regulator. This makes
TT-connect S2-3650 CI the only device which uses STM LNBP22 regulator
which is currently used for all devices driven by pctv452e driver.

This patch fixes this by creating an exception for TT-connect S2-3650 CI
to continue to use STM LNBP22 while all others now using correct ISL6423
driver which makes DiSEqC/EN50494 comands which involve voltage changes
now working on the other devices (which didn't work before).

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/media/usb/dvb-usb/Kconfig    |  1 +
 drivers/media/usb/dvb-usb/pctv452e.c | 24 ++++++++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/Kconfig b/drivers/media/usb/dvb-usb/Kconfig
index 25ba03edcb5c..7498110142e4 100644
--- a/drivers/media/usb/dvb-usb/Kconfig
+++ b/drivers/media/usb/dvb-usb/Kconfig
@@ -279,6 +279,7 @@ config DVB_USB_PCTV452E
 	tristate "Pinnacle PCTV HDTV Pro USB device/TT Connect S2-3600"
 	depends on DVB_USB
 	select TTPCI_EEPROM
+	select DVB_ISL6423 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_LNBP22 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STB0899 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STB6100 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/usb/dvb-usb/pctv452e.c b/drivers/media/usb/dvb-usb/pctv452e.c
index 441d878fc22c..4b13c1f35b28 100644
--- a/drivers/media/usb/dvb-usb/pctv452e.c
+++ b/drivers/media/usb/dvb-usb/pctv452e.c
@@ -20,6 +20,7 @@
 #include "stb6100.h"
 #include "stb6100_cfg.h"
 /* FE Power */
+#include "isl6423.h"
 #include "lnbp22.h"
 
 #include <media/dvb_ca_en50221.h>
@@ -83,6 +84,13 @@ static struct stb0899_postproc pctv45e_postproc[] = {
 	{ 0, 0 }
 };
 
+static struct isl6423_config pctv452e_isl6423_config = {
+	.current_max		= SEC_CURRENT_515m,
+	.curlim			= SEC_CURRENT_LIM_ON,
+	.mod_extern		= 1,
+	.addr			= 0x08,
+};
+
 /*
  * stores all private variables for communication with the PCTV452e DVB-S2
  */
@@ -909,15 +917,23 @@ static int pctv452e_frontend_attach(struct dvb_usb_adapter *a)
 						&a->dev->i2c_adap);
 	if (!a->fe_adap[0].fe)
 		return -ENODEV;
-	if ((dvb_attach(lnbp22_attach, a->fe_adap[0].fe,
-					&a->dev->i2c_adap)) == NULL)
-		err("Cannot attach lnbp22\n");
 
 	id = a->dev->desc->warm_ids[0];
 	if (USB_VID_TECHNOTREND == id->idVendor
-	    && USB_PID_TECHNOTREND_CONNECT_S2_3650_CI == id->idProduct)
+	    && USB_PID_TECHNOTREND_CONNECT_S2_3650_CI == id->idProduct) {
+		if (dvb_attach(lnbp22_attach,
+			       a->fe_adap[0].fe,
+			       &a->dev->i2c_adap) == NULL) {
+			err("Cannot attach lnbp22\n");
+		}
 		/* Error ignored. */
 		tt3650_ci_init(a);
+	} else if (dvb_attach(isl6423_attach,
+			      a->fe_adap[0].fe,
+			      &a->dev->i2c_adap,
+			      &pctv452e_isl6423_config) == NULL) {
+		err("Cannot attach isl6423\n");
+	}
 
 	return 0;
 }
-- 
2.17.1

