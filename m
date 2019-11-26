Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E641D10A157
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 16:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfKZPj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 10:39:58 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38059 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfKZPj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 10:39:58 -0500
Received: by mail-qt1-f194.google.com with SMTP id 14so21865887qtf.5;
        Tue, 26 Nov 2019 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqOLj+zmhCKP7Os2hVh7KNkHJtVIfRP5Fr7ygxzfC/k=;
        b=ZryQJlQklZkrilo3PB6/3iQkzFYlNRAE83eqDldO3pYYrXbuN1qjXyaSyDg40Q3Ww5
         r/FrUnvEAuKgvzCqaPXgOAL3PNq9MLItAvdW9jCp76ILGphb7Ljr4ZDpVQdOftgxTp7F
         +RT9wdHGyU7YMnPBOP0zn8Kfwh7I22gbbIdHKkFpN+GiSlclJY3nPMJ5e1czT60+X2H1
         NMP16huoRg+U4XS4O5sxylbyxdM60MhTXvMqCvW3dtDDvnw321e1QpjjghbHVJ8qY2cB
         BzR/B9F4vMkDMy+0UwZ7YL2js25YJkFu3fbgp3wMLIv+/gYJ4KVTkKKEaEyCFMQNO+dH
         INWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqOLj+zmhCKP7Os2hVh7KNkHJtVIfRP5Fr7ygxzfC/k=;
        b=Jou5feRaC96lUcXxudDoS8sFOqBcH9WKKvaFpQtDEbB21YaD7sJhgSA008yR9Yf6Dc
         j57hctEQZlcm+h7rqRAQpPXaBx4HJDxNLpale6kh9Oo8WsTaPzyR+Fizxpq372cvljAK
         YKICv8ITTHTjKDHpTBp+FStJGPQKQbEXD2OeY6Mdp4aaIz5izn/Pe1cpr48VRQAetIEy
         OfU2OxNcXFNEPQxc4atO506pynFtaoOm0WN+jGXnsL5XCq74FdSZjzzFcRf6P9kaFAus
         aDhVDnO2fNNV8/mHweIHamukvZol5eaAXNQCTflpgMOCtM7a9c/r03wnzpU1JP4OmB96
         2q3w==
X-Gm-Message-State: APjAAAXtTq+ElCLD8xLqAKwUAf6CnhsURbqGqK9tUXheiD2zc5X0Sz0p
        ESnLW3BU5+4JUHa8PTVC6UM=
X-Google-Smtp-Source: APXvYqwRg51oIe6DA1IT2q++wUTdAqhqELpT4Qih6rNjRSxcYqDcBeXG9pFn2r75cIpoj1BsYMC0kg==
X-Received: by 2002:ac8:690c:: with SMTP id e12mr23339115qtr.239.1574782796765;
        Tue, 26 Nov 2019 07:39:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id z64sm6047532qtc.4.2019.11.26.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 07:39:55 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dummy_dvb_fe: register adapter/frontend
Date:   Tue, 26 Nov 2019 12:31:57 -0300
Message-Id: <20191126153157.26355-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Before using the DTV frontend core, a bridge driver should register the
new frontend at the subsystem and unregister it at device detach / removal.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 39 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..1ccb58c67e8e 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -13,12 +13,12 @@
 #include <media/dvb_frontend.h>
 #include "dvb_dummy_fe.h"
 
+DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
 };
 
-
 static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
@@ -84,7 +84,36 @@ static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
 
 static int dvb_dummy_fe_init(struct dvb_frontend* fe)
 {
-	return 0;
+	int result = 0;
+	struct dvb_adapter *adapter = fe->dvb;
+
+	result = dvb_register_adapter(adapter,
+				      KBUILD_MODNAME,
+				      THIS_MODULE,
+				      adapter->device,
+				      adapter_nr);
+
+	if (!result) {
+		pr_err("DVB_DUMMY_FE: Failed to register the adapter, errno:%d",
+			result);
+		goto err;
+	}
+
+	result = dvb_register_frontend(adapter, fe);
+	if (!result) {
+		pr_err("DVB_DUMMY_FE: Failed to register the frontend, errno:%d",
+			result);
+		goto err;
+	}
+
+	return result;
+
+err:
+	dvb_unregister_adapter(adapter);
+	dvb_unregister_frontend(fe);
+	dvb_frontend_detach(fe);
+	return result;
+
 }
 
 static int dvb_dummy_fe_set_tone(struct dvb_frontend *fe,
@@ -102,6 +131,12 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
 static void dvb_dummy_fe_release(struct dvb_frontend* fe)
 {
 	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
+	struct dvb_adapter *adapter = fe->dvb;
+
+	dvb_unregister_adapter(adapter);
+	dvb_unregister_frontend(fe);
+	dvb_frontend_detach(fe);
+
 	kfree(state);
 }
 
-- 
2.24.0

