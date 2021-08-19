Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BF73F176F
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 12:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238284AbhHSKnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 06:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236149AbhHSKng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 06:43:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D15DC061575;
        Thu, 19 Aug 2021 03:43:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w20so11907228lfu.7;
        Thu, 19 Aug 2021 03:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SMIlymcR9fqj2FZnNNJcBtiEvgBexsG0GHbUUOEAov4=;
        b=NAV8IguFKhCO1Ki7PLxEUvd2Q3wakLjnzkvYn+6/k067KnwIYGatl1QHsb8wkLYly7
         3y6f9Fl/txCkdRmM/B/cxgWAigzSoJnM5VdX/bf4aRAGkHDLB76wRQ7DV5/9Q6edzhSp
         mri7qTDkBDQy9AsFvvtUWcPppX8mjWRu1M/LsZapznTUKLZMVTm++fOepmTYgW1gyqFr
         us+el6AkhXMM+BDVOhDonS406ErNtcq7GONhUIFt0a9gWeLRZ7WDlsInSsj5Sk6JN4d9
         +ZQjk55D5tbrH2KeCWaNumX4IggTTXGf4FlXm+3Yg4DocmtUtEs49HyzpjG42ysnBkwo
         rbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SMIlymcR9fqj2FZnNNJcBtiEvgBexsG0GHbUUOEAov4=;
        b=pXeNQrQM4jK9pLUkCGUBOu3pZ4HKNLqTM6Pj0Mbhl6LVS6kOUWT+6RtI6njPtQGbO+
         K61L2Fo6qEQF2iyRtypyJ/HwOOOSR7GkRiIByXak2tO2XJMhRXRp00G9RHI0yZit9iIh
         iVc6ODjwsC8acVB0wGsZfo+dGUOPPnT6XC8grVI39Y88h6gaPuNL9sVrTak2I8Ky0jxs
         3/DkRmIUm79ej7+EY4NkJTm/DX6WrlctMKBd/2/JUqxbtxNamBcnVv/GJnSGLgX6at6N
         5aK2Ec0w5JnSxkyQp/gKmRSTKv2BjYD+guein4DroolseAUNs8jfJ8YfID2boeWB36lh
         zmfw==
X-Gm-Message-State: AOAM531x9XUUgEx2IEyQv4/4ahicpe/UpNdtknlrIwUoL/61d7agOEzt
        CKHnFME0z85tS6cSQAfzDZ0=
X-Google-Smtp-Source: ABdhPJxT79s4enK05cI9PSRipP2aRsa2MRWrUnkOu12pMBmKvYv83tgoD2BlyDUx/fcQfj2ylbr6+Q==
X-Received: by 2002:a05:6512:21cf:: with SMTP id d15mr10077240lft.548.1629369778893;
        Thu, 19 Aug 2021 03:42:58 -0700 (PDT)
Received: from localhost.localdomain ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id c26sm266218lff.191.2021.08.19.03.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 03:42:58 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Subject: [PATCH v3] media: mxl111sf: change mutex_init() location
Date:   Thu, 19 Aug 2021 13:42:21 +0300
Message-Id: <20210819104221.27122-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819103859.17498-1-paskripkin@gmail.com>
References: <20210819103859.17498-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
mutex. The problem was in wrong mutex_init() location.

Previous mutex_init(&state->msg_lock) call was in ->init() function, but
dvb_usbv2_init() has this order of calls:

	dvb_usbv2_init()
	  dvb_usbv2_adapter_init()
	    dvb_usbv2_adapter_frontend_init()
	      props->frontend_attach()

	  props->init()

Since mxl111sf_* devices call mxl111sf_ctrl_msg() in ->frontend_attach()
internally we need to initialize state->msg_lock before
frontend_attach(). To achieve it, ->probe() call added to all mxl111sf_*
devices, which will simply initiaize mutex.

Reported-and-tested-by: syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Fixes: 8572211842af ("[media] mxl111sf: convert to new DVB USB")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v3:
	I forgot to remove mutex_init() call from ->init()

Changes in v2:
	Addressed same bug in all mxl111sf_* devices by adding ->probe
	call

---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 7865fa0a8295..cd5861a30b6f 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -931,8 +931,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
 		  .len = sizeof(eeprom), .buf = eeprom },
 	};
 
-	mutex_init(&state->msg_lock);
-
 	ret = get_chip_info(state);
 	if (mxl_fail(ret))
 		pr_err("failed to get chip info during probe");
@@ -1074,6 +1072,14 @@ static int mxl111sf_get_stream_config_dvbt(struct dvb_frontend *fe,
 	return 0;
 }
 
+static int mxl111sf_probe(struct dvb_usb_device *dev)
+{
+	struct mxl111sf_state *state = d_to_priv(dev);
+
+	mutex_init(&state->msg_lock);
+	return 0;
+}
+
 static struct dvb_usb_device_properties mxl111sf_props_dvbt = {
 	.driver_name = KBUILD_MODNAME,
 	.owner = THIS_MODULE,
@@ -1083,6 +1089,7 @@ static struct dvb_usb_device_properties mxl111sf_props_dvbt = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_dvbt,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1124,6 +1131,7 @@ static struct dvb_usb_device_properties mxl111sf_props_atsc = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_atsc,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1165,6 +1173,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mh = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1233,6 +1242,7 @@ static struct dvb_usb_device_properties mxl111sf_props_atsc_mh = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_atsc_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1311,6 +1321,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mercury = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mercury,
 	.tuner_attach      = mxl111sf_attach_tuner,
@@ -1381,6 +1392,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mercury_mh = {
 	.generic_bulk_ctrl_endpoint = 0x02,
 	.generic_bulk_ctrl_endpoint_response = 0x81,
 
+	.probe             = mxl111sf_probe,
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mercury_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
-- 
2.32.0

