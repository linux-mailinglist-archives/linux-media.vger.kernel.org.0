Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791403AF726
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 23:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhFUVEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 17:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhFUVEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 17:04:08 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AE4C061574
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 14:01:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t3so20817879edc.7
        for <linux-media@vger.kernel.org>; Mon, 21 Jun 2021 14:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=jgzdNR9EOPR7strBW60vZtNrWG6pPk/MR+J/f+XaWWo=;
        b=Ib373hiG0CNJ9er2ciXepMP2rn9znXVpm6ttagr+HODEE5k5UOh2QYiGg3KjVYI0cW
         ngEo4ydz7AU1zBPjAiM8w99tqBDlG0c4P3MMVrfv9yhbyWuV16mgeINWxulQ2xgBJEit
         IEvyRlbKSnhCq6FK8OoMZCV7qYXY0MS3085p3W+nzsg4jjD54zOMAASPZX4cwYY+Ko8e
         J+NzK42ktmhUYHdRvoOW/XcKtJtcI6iq1MREc8BkE629TF8KYLY5Xzhikq1duK3acb9a
         sMa2EMmbGE5YJ7IYKJibkAYAq1gvqdfm1d4RYDcgCg7K5O4ELndmOGY4vCxuntrqssdA
         iZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=jgzdNR9EOPR7strBW60vZtNrWG6pPk/MR+J/f+XaWWo=;
        b=ajRrmBOHosctCg5NYJLET+0Aa7yBr73EaYO5euGGk6arTN7/EN3sQB7lSn2Dclq/0Y
         ANqyYaoBeaB4ftyDYIkewyp0b3xJbwKXSXEdy8zimTTQStt47SFf5wUeTIVHhsvu07q0
         q/APGbhv+9eGW9acbjXyb2l44XlpPGulfGEG2P1lkQBNMU1a8LkXQ0mA6JRq6ObuQNpF
         gLRW7gEU5py7FYDZ/9RUeIlCM1j+XZKIgHL2NL8LeAI9reX9Q8sV7E8wSC7oPMERglkM
         famKijvGxHRu6pu8zS+/MB6E5ggOKNDsxITag7Udnd4voKq5Hm49S8TA3s8tZLAN/Bms
         J6sA==
X-Gm-Message-State: AOAM532I2F909lxBAFB9wCE5EzVLhqhxImzZ2DSO2vNE90ZIWSUZpCjj
        tf8QooSPmJdic04mjcF0DN9y1CecVt8P/QmR
X-Google-Smtp-Source: ABdhPJyXfUZn1WyfcpJjyW9Fsw1StyFVlv1hygbGep6fGEz91qT/P8yZjiL/pQlqHsE5k8YFGXUh9g==
X-Received: by 2002:a05:6402:3513:: with SMTP id b19mr371464edd.379.1624309311258;
        Mon, 21 Jun 2021 14:01:51 -0700 (PDT)
Received: from kali ([185.133.60.141])
        by smtp.gmail.com with ESMTPSA id e22sm11291658edu.35.2021.06.21.14.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 14:01:50 -0700 (PDT)
Date:   Mon, 21 Jun 2021 23:01:47 +0200
From:   =?utf-8?B?SsOhbiDEjMOhbmk=?= <pego149@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     jp@jpvw.nl
Subject: [PATCH] media: dvbsky: add support for MyGica T230A
Message-ID: <YND+OwGYnKT3NLmL@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Ján Čáni <pego149@gmail.com>
Tested-by: Ján Čáni <pego149@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 33 +++++++++++++++++++--------
 include/media/dvb-usb-ids.h           |  1 +
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 689829f1b52a..4b7baed066a8 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -541,7 +541,8 @@ static int dvbsky_mygica_t230c_attach(struct dvb_usb_adapter *adap)
 	si2168_config.i2c_adapter = &i2c_adapter;
 	si2168_config.fe = &adap->fe[0];
 	si2168_config.ts_mode = SI2168_TS_PARALLEL;
-	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2)
+	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230C2 ||
+	    le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230A)
 		si2168_config.ts_mode |= SI2168_TS_CLK_MANUAL;
 	si2168_config.ts_clock_inv = 1;
 
@@ -577,15 +578,24 @@ static int dvbsky_mygica_t230c_attach(struct dvb_usb_adapter *adap)
 
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
 
@@ -789,6 +799,9 @@ static const struct usb_device_id dvbsky_id_table[] = {
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
 		&mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C v2",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230A,
+		 &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230A",
+		 NULL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index d37cb74b769c..e03b80db0c46 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -394,6 +394,7 @@
 #define USB_PID_MYGICA_T230C				0xc689
 #define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_MYGICA_T230C_LITE			0xc699
+#define USB_PID_MYGICA_T230A				0x689a
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
 #define USB_PID_ELGATO_EYETV_DTT_2			0x003f
-- 
2.30.2

