Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13FBD26AE
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 11:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387802AbfJJJvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 05:51:37 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34101 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbfJJJvg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 05:51:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id j11so7070393wrp.1;
        Thu, 10 Oct 2019 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vR/97ha/8nINLtKlRJDAXkvt7wXAGo20zdsTBey8WDA=;
        b=TFMhmNn6fd8Y1HE/9jdGNBq/1CtQEn8SEuHZY+IeRl2wMKOOVecFJe6MvzmHxl+RrD
         5F4uJ9KO/neqIpGzQ/csSMhvjHQ1Wkc80+Qo8IDcavhMaRfx5pzjrz6qDplsJ/d1IOa8
         J1vPTfyIqm8kQUA8KQc8Z8RIthCeNnwwy7xJ9hNRuysUkHUsOZs/j88/Ri6fYg5iahYJ
         kXz8IKfxSwZM2UmYdtEvhh0ep3HfktR1X4WO1J4/MJxNvo7WF9NXnBV4xkQ8/0mbr+YX
         9/90WAoaS617Oq30MP+L3lo94v2mCjFqc4bJO0GH85PNtl4D9PXTOR9Z3v2r5yTY6JkE
         OFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vR/97ha/8nINLtKlRJDAXkvt7wXAGo20zdsTBey8WDA=;
        b=AEl0UpMTdgyy65GdoSqWogNJdKlpNJ9bvzXFcbS6w+NubSl3+WPMykOhvxZfnD5h9g
         bWtZNNQskSX102ZRxA2pYvgyqMy961838kAAiibGDN0DWi3Zg6yn1vsOUv2DsVlspl5k
         WSIam7fYxz0ycHjLwGW0xhzeHe0Pb49XFYbDyZq39bRlg6tmTQn5D9K/yKCu2TQaxCR0
         2cJqMgDFb8AU2cBgS6JN1evJiEEWYYWsZim5XgDiCmjReg4KvgrcPOGpesgzBgd8kqEy
         BxGl4/lP7kvraSfETZj0y0TfjmWnN4IvjDjwlIMWHt/KPMGhowcmoTmr6hQfswXNMs9u
         sH8w==
X-Gm-Message-State: APjAAAXOSabEnQrj3CNFoCU3r5i7eW/LXzCAaCDsSB8AxSfxxW9KikV4
        PHYsLPm39XGLag8DlgY4beI=
X-Google-Smtp-Source: APXvYqylf9nKxM3hVAWOugW/T0Pu5gy0Ed8GhiFvEZKb4vDEJGSpBHTcvlBCKf38r+fOzZBQA9UzHg==
X-Received: by 2002:adf:e688:: with SMTP id r8mr8260370wrm.342.1570701092960;
        Thu, 10 Oct 2019 02:51:32 -0700 (PDT)
Received: from localhost.localdomain ([46.114.37.24])
        by smtp.googlemail.com with ESMTPSA id o4sm11678251wre.91.2019.10.10.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 02:51:32 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, mchehab@infradead.org, jp@jpvw.nl,
        crope@iki.fi, sean@mess.org, linux-kernel@vger.kernel.org,
        Gon Solo <gonsolo@gmail.com>
Subject: [PATCH 1/4] si2168: Use bits and convert to kernel-doc format.
Date:   Thu, 10 Oct 2019 11:51:00 +0200
Message-Id: <20191010095103.3803-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010091848.GA2898@Limone>
References: <20191010091848.GA2898@Limone>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Gon Solo <gonsolo@gmail.com>
---
 drivers/media/dvb-frontends/si2168.h      | 47 +++++++++++++----------
 drivers/media/dvb-frontends/si2168_priv.h | 10 ++---
 2 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.h b/drivers/media/dvb-frontends/si2168.h
index 50dccb394efa..ecd21adf8950 100644
--- a/drivers/media/dvb-frontends/si2168.h
+++ b/drivers/media/dvb-frontends/si2168.h
@@ -9,38 +9,43 @@
 #define SI2168_H
 
 #include <linux/dvb/frontend.h>
-/*
- * I2C address
- * 0x64
+/**
+ * struct si2168_config - configuration parameters for si2168
+ *
+ * @fe:
+ *	frontend returned by driver
+ * @i2c_adapter:
+ *	tuner I2C adapter returned by driver
+ * @ts_mode:
+ *	Transport Stream mode. Can be:
+ *	- %SI2168_TS_PARALLEL
+ *	- %SI2168_TS_SERIAL
+ *	- %SI2168_TS_TRISTATE
+ *	- %SI2168_TS_CLK_MANUAL
+ * @ts_clock_inv:
+ *	TS clock inverted
+ * @ts_clock_gapped:
+ *	TS clock gapped
+ * @spectral_inversion:
+ *	Inverted spectrum
+ *
+ * Note:
+ *	The I2C address of this demod is 0x64.
  */
 struct si2168_config {
-	/*
-	 * frontend
-	 * returned by driver
-	 */
 	struct dvb_frontend **fe;
-
-	/*
-	 * tuner I2C adapter
-	 * returned by driver
-	 */
 	struct i2c_adapter **i2c_adapter;
 
-	/* TS mode */
 #define SI2168_TS_PARALLEL	0x06
 #define SI2168_TS_SERIAL	0x03
 #define SI2168_TS_TRISTATE	0x00
 #define SI2168_TS_CLK_MANUAL	0x20
 	u8 ts_mode;
 
-	/* TS clock inverted */
-	bool ts_clock_inv;
-
-	/* TS clock gapped */
-	bool ts_clock_gapped;
-
-	/* Inverted spectrum */
-	bool spectral_inversion;
+	/* Flags */
+	unsigned int ts_clock_inv:1;
+	unsigned int ts_clock_gapped:1;
+	unsigned int spectral_inversion:1;
 };
 
 #endif
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 804d5b30c697..18bea5222082 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -34,12 +34,12 @@ struct si2168_dev {
 	unsigned int chip_id;
 	unsigned int version;
 	const char *firmware_name;
-	bool active;
-	bool warm;
 	u8 ts_mode;
-	bool ts_clock_inv;
-	bool ts_clock_gapped;
-	bool spectral_inversion;
+	unsigned int active:1;
+	unsigned int warm:1;
+	unsigned int ts_clock_inv:1;
+	unsigned int ts_clock_gapped:1;
+	unsigned int spectral_inversion:1;
 };
 
 /* firmware command struct */
-- 
2.20.1

