Return-Path: <linux-media+bounces-11147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC58BFE90
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 15:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19AA51C222CB
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3276FE06;
	Wed,  8 May 2024 13:20:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD254FA3
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715174456; cv=none; b=gcixVQzI1z8YeYsp9ydyy/qd4P2yYIsVdSbnybl9SpHlG0SxNdhXM/EobcyHgugmtV4PRUYcHjODHRMGtiRxuZfQ8jrHBrxsU8I8MQGD07j076buxz7N581IfS+kWPlVKs/UgwUE00Y2cKvnXSZuApG0K7PwydKlJuH8iME+88w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715174456; c=relaxed/simple;
	bh=gWJnr2afl3GsTSkIozrot2O9OrwoddsWcPqHPuQJMFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iAXcn5hlpXOmwYrDnn/tGIX7mXP21dePLsVHdwoNpRGoyuElZC0K9BMxF9SlOotJ80FcYjtD3T4Ecu48gxEBvX6gv6swwCGvl758HcjfRu++eVACRnq4z5FYqX9Fsw1qa5KKplKKSkwJjQw+jRCmtxEcT4UjmkohGe9HFWqgFBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s4hE1-00062w-I4; Wed, 08 May 2024 15:20:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s4hE1-000Hdz-4F; Wed, 08 May 2024 15:20:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s4hE1-000YCD-0A;
	Wed, 08 May 2024 15:20:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] media: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed,  8 May 2024 15:20:42 +0200
Message-ID: <20240508132043.2171457-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=59073; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gWJnr2afl3GsTSkIozrot2O9OrwoddsWcPqHPuQJMFs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmO3wrGzwudeC5E+DxrHyRGKrhrOWNCi8EYTWNF AtWk3gUbc+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZjt8KwAKCRCPgPtYfRL+ Tt8fCAC2RXcfzA8HTdVxUdL+zEuncw2Newyu4bTfgpu8k6vSepzPorH0AfN4TfmoO723Z4FZM5H +nYwhfnefu884Cqs7zFCUWiazW4kWi849eSXnH4IzQ2yCd40rPl7DEPbrY3cAmNyaGck+6Wgvei wx4BMlk+L+0Nh4vCcEaJM42XvZxcwUhc6ODhz+wVqn5gdjIskI5L9sEYAcR6iwdHn42EMkb7tyS t/nGQTOBWNl8bm/DqKgM0f0hQ6/FOdrO4LJXeL0Xh1zunxqHa+6rGYQFMCpUG8X8uVrc1/8E5m1 Z74BK6dSTVU+nQlRRVvXw6PMODdg79fWD+KH79P+xyZoOdVe
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While add it, also remove commas after the sentinel entries.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I put all changes in a single patch and did the style adaptions
(removing of trailing , for the sentinel and consistent spacing in the
non-NULL entries) en passant. Tell me if you want it split somehow.

I also didn't Cc: all the individual maintainers.

Best regards
Uwe

 drivers/media/dvb-frontends/a8293.c            | 2 +-
 drivers/media/dvb-frontends/af9013.c           | 2 +-
 drivers/media/dvb-frontends/af9033.c           | 2 +-
 drivers/media/dvb-frontends/au8522_decoder.c   | 2 +-
 drivers/media/dvb-frontends/cxd2099.c          | 2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c    | 2 +-
 drivers/media/dvb-frontends/lgdt3306a.c        | 2 +-
 drivers/media/dvb-frontends/lgdt330x.c         | 2 +-
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
 drivers/media/dvb-frontends/tda10071.c         | 2 +-
 drivers/media/dvb-frontends/ts2020.c           | 4 ++--
 drivers/media/i2c/ad5820.c                     | 4 ++--
 drivers/media/i2c/adp1653.c                    | 2 +-
 drivers/media/i2c/adv7170.c                    | 4 ++--
 drivers/media/i2c/adv7175.c                    | 4 ++--
 drivers/media/i2c/adv7183.c                    | 4 ++--
 drivers/media/i2c/adv7343.c                    | 4 ++--
 drivers/media/i2c/adv7393.c                    | 4 ++--
 drivers/media/i2c/adv7511-v4l2.c               | 2 +-
 drivers/media/i2c/adv7842.c                    | 2 +-
 drivers/media/i2c/ak881x.c                     | 4 ++--
 drivers/media/i2c/bt819.c                      | 6 +++---
 drivers/media/i2c/bt856.c                      | 2 +-
 drivers/media/i2c/bt866.c                      | 2 +-
 drivers/media/i2c/cs3308.c                     | 2 +-
 drivers/media/i2c/cs5345.c                     | 2 +-
 drivers/media/i2c/cs53l32a.c                   | 2 +-
 drivers/media/i2c/cx25840/cx25840-core.c       | 2 +-
 drivers/media/i2c/ds90ub913.c                  | 5 ++++-
 drivers/media/i2c/dw9714.c                     | 4 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c       | 2 +-
 drivers/media/i2c/imx274.c                     | 2 +-
 drivers/media/i2c/isl7998x.c                   | 4 ++--
 drivers/media/i2c/ks0127.c                     | 6 +++---
 drivers/media/i2c/lm3560.c                     | 4 ++--
 drivers/media/i2c/lm3646.c                     | 2 +-
 drivers/media/i2c/m52790.c                     | 2 +-
 drivers/media/i2c/max2175.c                    | 4 ++--
 drivers/media/i2c/ml86v7667.c                  | 4 ++--
 drivers/media/i2c/msp3400-driver.c             | 2 +-
 drivers/media/i2c/mt9m001.c                    | 2 +-
 drivers/media/i2c/mt9m111.c                    | 2 +-
 drivers/media/i2c/mt9t112.c                    | 2 +-
 drivers/media/i2c/mt9v011.c                    | 2 +-
 drivers/media/i2c/ov13858.c                    | 4 ++--
 drivers/media/i2c/ov2640.c                     | 2 +-
 drivers/media/i2c/ov2659.c                     | 4 ++--
 drivers/media/i2c/ov5640.c                     | 4 ++--
 drivers/media/i2c/ov5645.c                     | 2 +-
 drivers/media/i2c/ov5647.c                     | 2 +-
 drivers/media/i2c/ov6650.c                     | 2 +-
 drivers/media/i2c/ov7640.c                     | 2 +-
 drivers/media/i2c/ov772x.c                     | 2 +-
 drivers/media/i2c/ov7740.c                     | 2 +-
 drivers/media/i2c/ov9640.c                     | 2 +-
 drivers/media/i2c/ov9650.c                     | 4 ++--
 drivers/media/i2c/rj54n1cb0c.c                 | 2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c       | 2 +-
 drivers/media/i2c/s5k5baf.c                    | 4 ++--
 drivers/media/i2c/saa6588.c                    | 2 +-
 drivers/media/i2c/saa6752hs.c                  | 2 +-
 drivers/media/i2c/saa7110.c                    | 2 +-
 drivers/media/i2c/saa717x.c                    | 2 +-
 drivers/media/i2c/saa7185.c                    | 2 +-
 drivers/media/i2c/sony-btf-mpx.c               | 2 +-
 drivers/media/i2c/tc358743.c                   | 2 +-
 drivers/media/i2c/tda7432.c                    | 2 +-
 drivers/media/i2c/tda9840.c                    | 2 +-
 drivers/media/i2c/tea6415c.c                   | 2 +-
 drivers/media/i2c/tea6420.c                    | 2 +-
 drivers/media/i2c/ths7303.c                    | 6 +++---
 drivers/media/i2c/ths8200.c                    | 4 ++--
 drivers/media/i2c/tlv320aic23b.c               | 2 +-
 drivers/media/i2c/tvaudio.c                    | 2 +-
 drivers/media/i2c/tvp5150.c                    | 2 +-
 drivers/media/i2c/tvp7002.c                    | 2 +-
 drivers/media/i2c/tw2804.c                     | 2 +-
 drivers/media/i2c/tw9900.c                     | 2 +-
 drivers/media/i2c/tw9903.c                     | 2 +-
 drivers/media/i2c/tw9906.c                     | 2 +-
 drivers/media/i2c/tw9910.c                     | 2 +-
 drivers/media/i2c/uda1342.c                    | 2 +-
 drivers/media/i2c/upd64031a.c                  | 2 +-
 drivers/media/i2c/upd64083.c                   | 2 +-
 drivers/media/i2c/vp27smpx.c                   | 2 +-
 drivers/media/i2c/vpx3220.c                    | 6 +++---
 drivers/media/i2c/wm8739.c                     | 2 +-
 drivers/media/i2c/wm8775.c                     | 2 +-
 drivers/media/radio/radio-tea5764.c            | 2 +-
 drivers/media/radio/saa7706h.c                 | 4 ++--
 drivers/media/radio/si470x/radio-si470x-i2c.c  | 2 +-
 drivers/media/radio/si4713/si4713.c            | 4 ++--
 drivers/media/radio/tef6862.c                  | 4 ++--
 drivers/media/test-drivers/vidtv/vidtv_demod.c | 2 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c | 2 +-
 drivers/media/tuners/e4000.c                   | 2 +-
 drivers/media/tuners/fc2580.c                  | 2 +-
 drivers/media/tuners/m88rs6000t.c              | 2 +-
 drivers/media/tuners/mt2060.c                  | 2 +-
 drivers/media/tuners/mxl301rf.c                | 2 +-
 drivers/media/tuners/qm1d1b0004.c              | 2 +-
 drivers/media/tuners/qm1d1c0042.c              | 2 +-
 drivers/media/tuners/tda18212.c                | 2 +-
 drivers/media/tuners/tda18250.c                | 2 +-
 drivers/media/tuners/tua9001.c                 | 2 +-
 drivers/media/usb/go7007/s2250-board.c         | 2 +-
 115 files changed, 148 insertions(+), 145 deletions(-)

diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-frontends/a8293.c
index f39887c04978..bf2773c5b97a 100644
--- a/drivers/media/dvb-frontends/a8293.c
+++ b/drivers/media/dvb-frontends/a8293.c
@@ -256,7 +256,7 @@ static void a8293_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id a8293_id_table[] = {
-	{"a8293", 0},
+	{ "a8293" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, a8293_id_table);
diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-frontends/af9013.c
index a829c89792a4..30bb78e9bc8a 100644
--- a/drivers/media/dvb-frontends/af9013.c
+++ b/drivers/media/dvb-frontends/af9013.c
@@ -1553,7 +1553,7 @@ static void af9013_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id af9013_id_table[] = {
-	{"af9013", 0},
+	{ "af9013" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, af9013_id_table);
diff --git a/drivers/media/dvb-frontends/af9033.c b/drivers/media/dvb-frontends/af9033.c
index 49b7b04a7899..eed2ea4da8fa 100644
--- a/drivers/media/dvb-frontends/af9033.c
+++ b/drivers/media/dvb-frontends/af9033.c
@@ -1173,7 +1173,7 @@ static void af9033_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id af9033_id_table[] = {
-	{"af9033", 0},
+	{ "af9033" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, af9033_id_table);
diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index acc27376c246..33d81ea01468 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -766,7 +766,7 @@ static void au8522_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id au8522_id[] = {
-	{"au8522", 0},
+	{ "au8522" },
 	{}
 };
 
diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-frontends/cxd2099.c
index 3f3b85743666..5e6e18819a0d 100644
--- a/drivers/media/dvb-frontends/cxd2099.c
+++ b/drivers/media/dvb-frontends/cxd2099.c
@@ -672,7 +672,7 @@ static void cxd2099_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cxd2099_id[] = {
-	{"cxd2099", 0},
+	{ "cxd2099" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cxd2099_id);
diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index 7feb08dccfa1..c3d8ced6c3ba 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -723,7 +723,7 @@ static void cxd2820r_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cxd2820r_id_table[] = {
-	{"cxd2820r", 0},
+	{ "cxd2820r" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cxd2820r_id_table);
diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 231b45632ad5..0898fdbbded7 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2244,7 +2244,7 @@ static void lgdt3306a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lgdt3306a_id_table[] = {
-	{"lgdt3306a", 0},
+	{ "lgdt3306a" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lgdt3306a_id_table);
diff --git a/drivers/media/dvb-frontends/lgdt330x.c b/drivers/media/dvb-frontends/lgdt330x.c
index 081d6ad3ce72..cab442a350a5 100644
--- a/drivers/media/dvb-frontends/lgdt330x.c
+++ b/drivers/media/dvb-frontends/lgdt330x.c
@@ -983,7 +983,7 @@ static void lgdt330x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lgdt330x_id_table[] = {
-	{"lgdt330x", 0},
+	{ "lgdt330x" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, lgdt330x_id_table);
diff --git a/drivers/media/dvb-frontends/mn88472.c b/drivers/media/dvb-frontends/mn88472.c
index 73d1e52de569..729751671c3d 100644
--- a/drivers/media/dvb-frontends/mn88472.c
+++ b/drivers/media/dvb-frontends/mn88472.c
@@ -708,7 +708,7 @@ static void mn88472_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mn88472_id_table[] = {
-	{"mn88472", 0},
+	{ "mn88472" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, mn88472_id_table);
diff --git a/drivers/media/dvb-frontends/mn88473.c b/drivers/media/dvb-frontends/mn88473.c
index eb50591c0e7a..fefc640d8afb 100644
--- a/drivers/media/dvb-frontends/mn88473.c
+++ b/drivers/media/dvb-frontends/mn88473.c
@@ -743,7 +743,7 @@ static void mn88473_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mn88473_id_table[] = {
-	{"mn88473", 0},
+	{ "mn88473" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, mn88473_id_table);
diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-frontends/mxl692.c
index 2a31bde2630f..bbc2bc778225 100644
--- a/drivers/media/dvb-frontends/mxl692.c
+++ b/drivers/media/dvb-frontends/mxl692.c
@@ -1346,7 +1346,7 @@ static void mxl692_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mxl692_id_table[] = {
-	{"mxl692", 0},
+	{ "mxl692" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, mxl692_id_table);
diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
index 35c969fd2cb5..f58434692b0a 100644
--- a/drivers/media/dvb-frontends/rtl2830.c
+++ b/drivers/media/dvb-frontends/rtl2830.c
@@ -876,7 +876,7 @@ static void rtl2830_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rtl2830_id_table[] = {
-	{"rtl2830", 0},
+	{ "rtl2830" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, rtl2830_id_table);
diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index 601cf45c3935..c5ea810ca89f 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1125,7 +1125,7 @@ static void rtl2832_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rtl2832_id_table[] = {
-	{"rtl2832", 0},
+	{ "rtl2832" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, rtl2832_id_table);
diff --git a/drivers/media/dvb-frontends/si2165.c b/drivers/media/dvb-frontends/si2165.c
index 013d423d3263..f87c9357cee3 100644
--- a/drivers/media/dvb-frontends/si2165.c
+++ b/drivers/media/dvb-frontends/si2165.c
@@ -1281,7 +1281,7 @@ static void si2165_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si2165_id_table[] = {
-	{"si2165", 0},
+	{ "si2165" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, si2165_id_table);
diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index dae1f2153e8b..6869807a90e3 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -788,7 +788,7 @@ static void si2168_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si2168_id_table[] = {
-	{"si2168", 0},
+	{ "si2168" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, si2168_id_table);
diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index 4d7d0b8b51b4..75adf2a4589f 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -407,7 +407,7 @@ static void sp2_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sp2_id[] = {
-	{"sp2", 0},
+	{ "sp2" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, sp2_id);
diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-frontends/stv090x.c
index cc45139057ba..fc7620ac504b 100644
--- a/drivers/media/dvb-frontends/stv090x.c
+++ b/drivers/media/dvb-frontends/stv090x.c
@@ -5074,7 +5074,7 @@ struct dvb_frontend *stv090x_attach(struct stv090x_config *config,
 EXPORT_SYMBOL_GPL(stv090x_attach);
 
 static const struct i2c_device_id stv090x_id_table[] = {
-	{"stv090x", 0},
+	{ "stv090x" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, stv090x_id_table);
diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-frontends/stv6110x.c
index c678f47d2449..33c8105da1c3 100644
--- a/drivers/media/dvb-frontends/stv6110x.c
+++ b/drivers/media/dvb-frontends/stv6110x.c
@@ -470,7 +470,7 @@ const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
 EXPORT_SYMBOL_GPL(stv6110x_attach);
 
 static const struct i2c_device_id stv6110x_id_table[] = {
-	{"stv6110x", 0},
+	{ "stv6110x" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, stv6110x_id_table);
diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
index 6640851d8bbc..e23794b821cd 100644
--- a/drivers/media/dvb-frontends/tda10071.c
+++ b/drivers/media/dvb-frontends/tda10071.c
@@ -1230,7 +1230,7 @@ static void tda10071_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda10071_id_table[] = {
-	{"tda10071_cx24118", 0},
+	{ "tda10071_cx24118" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tda10071_id_table);
diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
index a5ebce57f35e..a5baca2449c7 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -710,8 +710,8 @@ static void ts2020_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ts2020_id_table[] = {
-	{"ts2020", 0},
-	{"ts2022", 0},
+	{ "ts2020" },
+	{ "ts2022" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ts2020_id_table);
diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 1543d24f522c..f60271082fb5 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -347,8 +347,8 @@ static void ad5820_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ad5820_id_table[] = {
-	{ "ad5820", 0 },
-	{ "ad5821", 0 },
+	{ "ad5820" },
+	{ "ad5821" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad5820_id_table);
diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
index 5ace7b5804d4..391bc75bfcd0 100644
--- a/drivers/media/i2c/adp1653.c
+++ b/drivers/media/i2c/adp1653.c
@@ -522,7 +522,7 @@ static void adp1653_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adp1653_id_table[] = {
-	{ ADP1653_NAME, 0 },
+	{ ADP1653_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adp1653_id_table);
diff --git a/drivers/media/i2c/adv7170.c b/drivers/media/i2c/adv7170.c
index 4a2b9fd9e2da..ef8682b980b4 100644
--- a/drivers/media/i2c/adv7170.c
+++ b/drivers/media/i2c/adv7170.c
@@ -377,8 +377,8 @@ static void adv7170_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7170_id[] = {
-	{ "adv7170", 0 },
-	{ "adv7171", 0 },
+	{ "adv7170" },
+	{ "adv7171" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7170_id);
diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
index e454cba4b026..384da1ec5bf9 100644
--- a/drivers/media/i2c/adv7175.c
+++ b/drivers/media/i2c/adv7175.c
@@ -432,8 +432,8 @@ static void adv7175_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7175_id[] = {
-	{ "adv7175", 0 },
-	{ "adv7176", 0 },
+	{ "adv7175" },
+	{ "adv7176" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7175_id);
diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index 2a2cace4a153..25a31a6dd456 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -619,8 +619,8 @@ static void adv7183_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adv7183_id[] = {
-	{"adv7183", 0},
-	{},
+	{ "adv7183" },
+	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, adv7183_id);
diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
index 4fbe4e18570e..b96443404a26 100644
--- a/drivers/media/i2c/adv7343.c
+++ b/drivers/media/i2c/adv7343.c
@@ -502,8 +502,8 @@ static void adv7343_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adv7343_id[] = {
-	{"adv7343", 0},
-	{},
+	{ "adv7343" },
+	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, adv7343_id);
diff --git a/drivers/media/i2c/adv7393.c b/drivers/media/i2c/adv7393.c
index 7638af455cef..c7994bd0bbd4 100644
--- a/drivers/media/i2c/adv7393.c
+++ b/drivers/media/i2c/adv7393.c
@@ -446,8 +446,8 @@ static void adv7393_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adv7393_id[] = {
-	{"adv7393", 0},
-	{},
+	{ "adv7393" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, adv7393_id);
 
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 79946e9c7401..39b04a56659f 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1954,7 +1954,7 @@ static void adv7511_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7511_id[] = {
-	{ "adv7511-v4l2", 0 },
+	{ "adv7511-v4l2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7511_id);
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index f2d4217310e7..014fc913225c 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3617,7 +3617,7 @@ static void adv7842_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id adv7842_id[] = {
-	{ "adv7842", 0 },
+	{ "adv7842" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adv7842_id);
diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
index ce840adc2aa7..ee575d01a676 100644
--- a/drivers/media/i2c/ak881x.c
+++ b/drivers/media/i2c/ak881x.c
@@ -304,8 +304,8 @@ static void ak881x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ak881x_id[] = {
-	{ "ak8813", 0 },
-	{ "ak8814", 0 },
+	{ "ak8813" },
+	{ "ak8814" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak881x_id);
diff --git a/drivers/media/i2c/bt819.c b/drivers/media/i2c/bt819.c
index b4a25cc996dc..f97245f91f88 100644
--- a/drivers/media/i2c/bt819.c
+++ b/drivers/media/i2c/bt819.c
@@ -457,9 +457,9 @@ static void bt819_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id bt819_id[] = {
-	{ "bt819a", 0 },
-	{ "bt817a", 0 },
-	{ "bt815a", 0 },
+	{ "bt819a" },
+	{ "bt817a" },
+	{ "bt815a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bt819_id);
diff --git a/drivers/media/i2c/bt856.c b/drivers/media/i2c/bt856.c
index 814acbd6a5a8..6852aa47cafb 100644
--- a/drivers/media/i2c/bt856.c
+++ b/drivers/media/i2c/bt856.c
@@ -230,7 +230,7 @@ static void bt856_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bt856_id[] = {
-	{ "bt856", 0 },
+	{ "bt856" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bt856_id);
diff --git a/drivers/media/i2c/bt866.c b/drivers/media/i2c/bt866.c
index dada059cbce4..a2cc34d35ed2 100644
--- a/drivers/media/i2c/bt866.c
+++ b/drivers/media/i2c/bt866.c
@@ -197,7 +197,7 @@ static void bt866_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bt866_id[] = {
-	{ "bt866", 0 },
+	{ "bt866" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bt866_id);
diff --git a/drivers/media/i2c/cs3308.c b/drivers/media/i2c/cs3308.c
index 61afa3d799d2..078e0066ce4b 100644
--- a/drivers/media/i2c/cs3308.c
+++ b/drivers/media/i2c/cs3308.c
@@ -109,7 +109,7 @@ static void cs3308_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id cs3308_id[] = {
-	{ "cs3308", 0 },
+	{ "cs3308" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs3308_id);
diff --git a/drivers/media/i2c/cs5345.c b/drivers/media/i2c/cs5345.c
index 3019a132e079..3a9797a50e82 100644
--- a/drivers/media/i2c/cs5345.c
+++ b/drivers/media/i2c/cs5345.c
@@ -189,7 +189,7 @@ static void cs5345_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id cs5345_id[] = {
-	{ "cs5345", 0 },
+	{ "cs5345" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs5345_id);
diff --git a/drivers/media/i2c/cs53l32a.c b/drivers/media/i2c/cs53l32a.c
index 82881b79e730..c4cad3293905 100644
--- a/drivers/media/i2c/cs53l32a.c
+++ b/drivers/media/i2c/cs53l32a.c
@@ -200,7 +200,7 @@ static void cs53l32a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cs53l32a_id[] = {
-	{ "cs53l32a", 0 },
+	{ "cs53l32a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs53l32a_id);
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 04461c893d90..a90a9e5705a0 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3964,7 +3964,7 @@ static void cx25840_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-	{ "cx25840", 0 },
+	{ "cx25840" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cx25840_id);
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index ca9bb29dab89..8eed4a200fd8 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -877,7 +877,10 @@ static void ub913_remove(struct i2c_client *client)
 	ub913_gpiochip_remove(priv);
 }
 
-static const struct i2c_device_id ub913_id[] = { { "ds90ub913a-q1", 0 }, {} };
+static const struct i2c_device_id ub913_id[] = {
+	{ "ds90ub913a-q1" },
+	{}
+};
 MODULE_DEVICE_TABLE(i2c, ub913_id);
 
 static const struct of_device_id ub913_dt_ids[] = {
diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 0e88ce0ef8d7..2ddd7daa79e2 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -279,8 +279,8 @@ static int  __maybe_unused dw9714_vcm_resume(struct device *dev)
 }
 
 static const struct i2c_device_id dw9714_id_table[] = {
-	{ DW9714_NAME, 0 },
-	{ { 0 } }
+	{ DW9714_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dw9714_id_table);
 
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index e932d25ca7b3..7519863d77b1 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1501,7 +1501,7 @@ static const struct of_device_id et8ek8_of_table[] = {
 MODULE_DEVICE_TABLE(of, et8ek8_of_table);
 
 static const struct i2c_device_id et8ek8_id_table[] = {
-	{ ET8EK8_NAME, 0 },
+	{ ET8EK8_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, et8ek8_id_table);
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 3800de974e8a..a2b824986027 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1949,7 +1949,7 @@ static const struct of_device_id imx274_of_id_table[] = {
 MODULE_DEVICE_TABLE(of, imx274_of_id_table);
 
 static const struct i2c_device_id imx274_id[] = {
-	{ "IMX274", 0 },
+	{ "IMX274" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, imx274_id);
diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index c7089035bbc1..5ffd53e005ee 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1561,8 +1561,8 @@ static const struct of_device_id isl7998x_of_match[] = {
 MODULE_DEVICE_TABLE(of, isl7998x_of_match);
 
 static const struct i2c_device_id isl7998x_id[] = {
-	{ "isl79987", 0 },
-	{ /* sentinel */ },
+	{ "isl79987" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, isl7998x_id);
 
diff --git a/drivers/media/i2c/ks0127.c b/drivers/media/i2c/ks0127.c
index 5c583f57e3f3..4a75b88067e8 100644
--- a/drivers/media/i2c/ks0127.c
+++ b/drivers/media/i2c/ks0127.c
@@ -685,9 +685,9 @@ static void ks0127_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ks0127_id[] = {
-	{ "ks0127", 0 },
-	{ "ks0127b", 0 },
-	{ "ks0122s", 0 },
+	{ "ks0127" },
+	{ "ks0127b" },
+	{ "ks0122s" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ks0127_id);
diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 05283ac68f2d..f4cc844f4e3c 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -455,8 +455,8 @@ static void lm3560_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-	{LM3559_NAME, 0},
-	{LM3560_NAME, 0},
+	{ LM3559_NAME },
+	{ LM3560_NAME },
 	{}
 };
 
diff --git a/drivers/media/i2c/lm3646.c b/drivers/media/i2c/lm3646.c
index fab3a7e05f92..2d16e42ec224 100644
--- a/drivers/media/i2c/lm3646.c
+++ b/drivers/media/i2c/lm3646.c
@@ -386,7 +386,7 @@ static void lm3646_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3646_id_table[] = {
-	{LM3646_NAME, 0},
+	{ LM3646_NAME },
 	{}
 };
 
diff --git a/drivers/media/i2c/m52790.c b/drivers/media/i2c/m52790.c
index f8a69142aae9..9e1ecfd01e2a 100644
--- a/drivers/media/i2c/m52790.c
+++ b/drivers/media/i2c/m52790.c
@@ -163,7 +163,7 @@ static void m52790_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id m52790_id[] = {
-	{ "m52790", 0 },
+	{ "m52790" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m52790_id);
diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index cd73d2096ae4..bf02ca23a284 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -1413,8 +1413,8 @@ static void max2175_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max2175_id[] = {
-	{ DRIVER_NAME, 0},
-	{},
+	{ DRIVER_NAME },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, max2175_id);
 
diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
index 5b72d4434224..57ba3693649a 100644
--- a/drivers/media/i2c/ml86v7667.c
+++ b/drivers/media/i2c/ml86v7667.c
@@ -424,8 +424,8 @@ static void ml86v7667_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ml86v7667_id[] = {
-	{DRV_NAME, 0},
-	{},
+	{ DRV_NAME },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ml86v7667_id);
 
diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 599a5bc7cbb3..4c0b0ad68c08 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -874,7 +874,7 @@ static const struct dev_pm_ops msp3400_pm_ops = {
 };
 
 static const struct i2c_device_id msp_id[] = {
-	{ "msp3400", 0 },
+	{ "msp3400" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, msp_id);
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index ad1a3ab77411..12d3e86bdc0f 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -854,7 +854,7 @@ static void mt9m001_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt9m001_id[] = {
-	{ "mt9m001", 0 },
+	{ "mt9m001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9m001_id);
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index ceeeb94c38d5..9aa5dcda3805 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1383,7 +1383,7 @@ static const struct of_device_id mt9m111_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt9m111_of_match);
 
 static const struct i2c_device_id mt9m111_id[] = {
-	{ "mt9m111", 0 },
+	{ "mt9m111" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9m111_id);
diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index fb1588c57cc8..878dff9b7577 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1109,7 +1109,7 @@ static void mt9t112_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt9t112_id[] = {
-	{ "mt9t112", 0 },
+	{ "mt9t112" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9t112_id);
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 8834ff8786e5..055b7915260a 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -582,7 +582,7 @@ static void mt9v011_remove(struct i2c_client *c)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id mt9v011_id[] = {
-	{ "mt9v011", 0 },
+	{ "mt9v011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt9v011_id);
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 09387e335d80..7a3fc1d28514 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1740,8 +1740,8 @@ static void ov13858_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov13858_id_table[] = {
-	{"ov13858", 0},
-	{},
+	{ "ov13858" },
+	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, ov13858_id_table);
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 67c4bd2916e8..d27fc2df64e6 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -1271,7 +1271,7 @@ static void ov2640_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov2640_id[] = {
-	{ "ov2640", 0 },
+	{ "ov2640" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov2640_id);
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index d1653d7431d0..06b7896c3eaf 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1551,8 +1551,8 @@ static const struct dev_pm_ops ov2659_pm_ops = {
 };
 
 static const struct i2c_device_id ov2659_id[] = {
-	{ "ov2659", 0 },
-	{ /* sentinel */ },
+	{ "ov2659" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov2659_id);
 
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 5162d45fe73b..c1d3fce4a7d3 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -4003,8 +4003,8 @@ static const struct dev_pm_ops ov5640_pm_ops = {
 };
 
 static const struct i2c_device_id ov5640_id[] = {
-	{"ov5640", 0},
-	{},
+	{ "ov5640" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ov5640_id);
 
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 3b22b9e12787..6c2d221f6973 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1272,7 +1272,7 @@ static void ov5645_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov5645_id[] = {
-	{ "ov5645", 0 },
+	{ "ov5645" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ov5645_id);
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 7e1ecdf2485f..556a8bee6dbc 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1490,7 +1490,7 @@ static const struct dev_pm_ops ov5647_pm_ops = {
 };
 
 static const struct i2c_device_id ov5647_id[] = {
-	{ "ov5647", 0 },
+	{ "ov5647" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov5647_id);
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index b65befb22a79..9c7627161142 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -1128,7 +1128,7 @@ static void ov6650_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov6650_id[] = {
-	{ "ov6650", 0 },
+	{ "ov6650" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov6650_id);
diff --git a/drivers/media/i2c/ov7640.c b/drivers/media/i2c/ov7640.c
index 293f5f404358..9f68d89936eb 100644
--- a/drivers/media/i2c/ov7640.c
+++ b/drivers/media/i2c/ov7640.c
@@ -77,7 +77,7 @@ static void ov7640_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov7640_id[] = {
-	{ "ov7640", 0 },
+	{ "ov7640" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov7640_id);
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 3e36a55274ef..3b0fdb3c70c0 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1546,7 +1546,7 @@ static void ov772x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov772x_id[] = {
-	{ "ov772x", 0 },
+	{ "ov772x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov772x_id);
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 47b1b14d8796..0830676e5d5a 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1152,7 +1152,7 @@ static int __maybe_unused ov7740_runtime_resume(struct device *dev)
 }
 
 static const struct i2c_device_id ov7740_id[] = {
-	{ "ov7740", 0 },
+	{ "ov7740" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov7740_id);
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index e9a52a8a9dc0..01dbc0ba89c8 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -751,7 +751,7 @@ static void ov9640_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov9640_id[] = {
-	{ "ov9640", 0 },
+	{ "ov9640" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ov9640_id);
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 66cd0e9ddc9a..56df97c9886b 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1566,8 +1566,8 @@ static void ov965x_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ov965x_id[] = {
-	{ "OV9650", 0 },
-	{ "OV9652", 0 },
+	{ "OV9650" },
+	{ "OV9652" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov965x_id);
diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index a59db10153cd..b7ca39f63dba 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1410,7 +1410,7 @@ static void rj54n1_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id rj54n1_id[] = {
-	{ "rj54n1cb0c", 0 },
+	{ "rj54n1cb0c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rj54n1_id);
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index cf6be509af33..e89e888f028e 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1724,7 +1724,7 @@ static void s5c73m3_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id s5c73m3_id[] = {
-	{ DRIVER_NAME, 0 },
+	{ DRIVER_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s5c73m3_id);
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 6b11039c3579..24f399cd2124 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -2018,8 +2018,8 @@ static void s5k5baf_remove(struct i2c_client *c)
 }
 
 static const struct i2c_device_id s5k5baf_id[] = {
-	{ S5K5BAF_DRIVER_NAME, 0 },
-	{ },
+	{ S5K5BAF_DRIVER_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s5k5baf_id);
 
diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index dea9fc09356f..fb09e4560d8a 100644
--- a/drivers/media/i2c/saa6588.c
+++ b/drivers/media/i2c/saa6588.c
@@ -496,7 +496,7 @@ static void saa6588_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa6588_id[] = {
-	{ "saa6588", 0 },
+	{ "saa6588" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa6588_id);
diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 897eaa669b86..1ed8b5edb3fb 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -770,7 +770,7 @@ static void saa6752hs_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id saa6752hs_id[] = {
-	{ "saa6752hs", 0 },
+	{ "saa6752hs" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa6752hs_id);
diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index 1520790338ce..942aeeb40c52 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -439,7 +439,7 @@ static void saa7110_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa7110_id[] = {
-	{ "saa7110", 0 },
+	{ "saa7110" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa7110_id);
diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index 933ec0171430..b0793bb0c02a 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -1334,7 +1334,7 @@ static void saa717x_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa717x_id[] = {
-	{ "saa717x", 0 },
+	{ "saa717x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa717x_id);
diff --git a/drivers/media/i2c/saa7185.c b/drivers/media/i2c/saa7185.c
index 5535d71f4860..c04e452a332b 100644
--- a/drivers/media/i2c/saa7185.c
+++ b/drivers/media/i2c/saa7185.c
@@ -334,7 +334,7 @@ static void saa7185_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id saa7185_id[] = {
-	{ "saa7185", 0 },
+	{ "saa7185" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, saa7185_id);
diff --git a/drivers/media/i2c/sony-btf-mpx.c b/drivers/media/i2c/sony-btf-mpx.c
index 0f53834f3ae4..16072a9f8247 100644
--- a/drivers/media/i2c/sony-btf-mpx.c
+++ b/drivers/media/i2c/sony-btf-mpx.c
@@ -366,7 +366,7 @@ static void sony_btf_mpx_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id sony_btf_mpx_id[] = {
-	{ "sony-btf-mpx", 0 },
+	{ "sony-btf-mpx" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sony_btf_mpx_id);
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 0307fee3cce9..65d58ddf0287 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2197,7 +2197,7 @@ static void tc358743_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tc358743_id[] = {
-	{"tc358743", 0},
+	{ "tc358743" },
 	{}
 };
 
diff --git a/drivers/media/i2c/tda7432.c b/drivers/media/i2c/tda7432.c
index 6ecdc8e2e0c6..76ef0fdddf76 100644
--- a/drivers/media/i2c/tda7432.c
+++ b/drivers/media/i2c/tda7432.c
@@ -400,7 +400,7 @@ static void tda7432_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda7432_id[] = {
-	{ "tda7432", 0 },
+	{ "tda7432" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda7432_id);
diff --git a/drivers/media/i2c/tda9840.c b/drivers/media/i2c/tda9840.c
index 1911ef2126be..d61da811c9da 100644
--- a/drivers/media/i2c/tda9840.c
+++ b/drivers/media/i2c/tda9840.c
@@ -182,7 +182,7 @@ static void tda9840_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda9840_id[] = {
-	{ "tda9840", 0 },
+	{ "tda9840" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda9840_id);
diff --git a/drivers/media/i2c/tea6415c.c b/drivers/media/i2c/tea6415c.c
index 3ed6e441d515..4aaf66353610 100644
--- a/drivers/media/i2c/tea6415c.c
+++ b/drivers/media/i2c/tea6415c.c
@@ -141,7 +141,7 @@ static void tea6415c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tea6415c_id[] = {
-	{ "tea6415c", 0 },
+	{ "tea6415c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tea6415c_id);
diff --git a/drivers/media/i2c/tea6420.c b/drivers/media/i2c/tea6420.c
index 63f23784bb41..5c5ea3973251 100644
--- a/drivers/media/i2c/tea6420.c
+++ b/drivers/media/i2c/tea6420.c
@@ -123,7 +123,7 @@ static void tea6420_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tea6420_id[] = {
-	{ "tea6420", 0 },
+	{ "tea6420" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tea6420_id);
diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index 49ed83a0ac94..7526fabc7ee4 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -369,9 +369,9 @@ static void ths7303_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ths7303_id[] = {
-	{"ths7303", 0},
-	{"ths7353", 0},
-	{},
+	{ "ths7303" },
+	{ "ths7353" },
+	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, ths7303_id);
diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index ce0a7f809f19..686f10641c7a 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -487,8 +487,8 @@ static void ths8200_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ths8200_id[] = {
-	{ "ths8200", 0 },
-	{},
+	{ "ths8200" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ths8200_id);
 
diff --git a/drivers/media/i2c/tlv320aic23b.c b/drivers/media/i2c/tlv320aic23b.c
index d800ff8af1ff..b7b31b6192af 100644
--- a/drivers/media/i2c/tlv320aic23b.c
+++ b/drivers/media/i2c/tlv320aic23b.c
@@ -188,7 +188,7 @@ static void tlv320aic23b_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id tlv320aic23b_id[] = {
-	{ "tlv320aic23b", 0 },
+	{ "tlv320aic23b" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tlv320aic23b_id);
diff --git a/drivers/media/i2c/tvaudio.c b/drivers/media/i2c/tvaudio.c
index ba20f35cafd5..654725dfafac 100644
--- a/drivers/media/i2c/tvaudio.c
+++ b/drivers/media/i2c/tvaudio.c
@@ -2086,7 +2086,7 @@ static void tvaudio_remove(struct i2c_client *client)
    detect which device is present. So rather than listing all supported
    devices here, we pretend to support a single, fake device type. */
 static const struct i2c_device_id tvaudio_id[] = {
-	{ "tvaudio", 0 },
+	{ "tvaudio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tvaudio_id);
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 64b91aa3c82a..bd9b1fa817b1 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2265,7 +2265,7 @@ static const struct dev_pm_ops tvp5150_pm_ops = {
 };
 
 static const struct i2c_device_id tvp5150_id[] = {
-	{ "tvp5150", 0 },
+	{ "tvp5150" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tvp5150_id);
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index ea01bd86450e..c09a5bd71fd0 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -1070,7 +1070,7 @@ static void tvp7002_remove(struct i2c_client *c)
 
 /* I2C Device ID table */
 static const struct i2c_device_id tvp7002_id[] = {
-	{ "tvp7002", 0 },
+	{ "tvp7002" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tvp7002_id);
diff --git a/drivers/media/i2c/tw2804.c b/drivers/media/i2c/tw2804.c
index 6a2521e3a25c..3d154f4fb5f9 100644
--- a/drivers/media/i2c/tw2804.c
+++ b/drivers/media/i2c/tw2804.c
@@ -414,7 +414,7 @@ static void tw2804_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tw2804_id[] = {
-	{ "tw2804", 0 },
+	{ "tw2804" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw2804_id);
diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index bc7623ec46e5..53efdeaed1db 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -753,7 +753,7 @@ static const struct dev_pm_ops tw9900_pm_ops = {
 };
 
 static const struct i2c_device_id tw9900_id[] = {
-	{ "tw9900", 0 },
+	{ "tw9900" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9900_id);
diff --git a/drivers/media/i2c/tw9903.c b/drivers/media/i2c/tw9903.c
index 996be3960af3..b996a05e56f2 100644
--- a/drivers/media/i2c/tw9903.c
+++ b/drivers/media/i2c/tw9903.c
@@ -245,7 +245,7 @@ static void tw9903_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id tw9903_id[] = {
-	{ "tw9903", 0 },
+	{ "tw9903" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9903_id);
diff --git a/drivers/media/i2c/tw9906.c b/drivers/media/i2c/tw9906.c
index 25c625f6d6e4..6220f4fddbab 100644
--- a/drivers/media/i2c/tw9906.c
+++ b/drivers/media/i2c/tw9906.c
@@ -213,7 +213,7 @@ static void tw9906_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id tw9906_id[] = {
-	{ "tw9906", 0 },
+	{ "tw9906" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9906_id);
diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 905af98c7d53..86d2db6281f5 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -1001,7 +1001,7 @@ static void tw9910_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tw9910_id[] = {
-	{ "tw9910", 0 },
+	{ "tw9910" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tw9910_id);
diff --git a/drivers/media/i2c/uda1342.c b/drivers/media/i2c/uda1342.c
index da7bc4700bed..2318da6fb116 100644
--- a/drivers/media/i2c/uda1342.c
+++ b/drivers/media/i2c/uda1342.c
@@ -79,7 +79,7 @@ static void uda1342_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id uda1342_id[] = {
-	{ "uda1342", 0 },
+	{ "uda1342" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, uda1342_id);
diff --git a/drivers/media/i2c/upd64031a.c b/drivers/media/i2c/upd64031a.c
index 54c2ba0ba375..9d0b72a213be 100644
--- a/drivers/media/i2c/upd64031a.c
+++ b/drivers/media/i2c/upd64031a.c
@@ -219,7 +219,7 @@ static void upd64031a_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id upd64031a_id[] = {
-	{ "upd64031a", 0 },
+	{ "upd64031a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, upd64031a_id);
diff --git a/drivers/media/i2c/upd64083.c b/drivers/media/i2c/upd64083.c
index 2a820589a4cb..2e99ed5da42c 100644
--- a/drivers/media/i2c/upd64083.c
+++ b/drivers/media/i2c/upd64083.c
@@ -190,7 +190,7 @@ static void upd64083_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id upd64083_id[] = {
-	{ "upd64083", 0 },
+	{ "upd64083" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, upd64083_id);
diff --git a/drivers/media/i2c/vp27smpx.c b/drivers/media/i2c/vp27smpx.c
index 0ba3c2b68037..06fd46a63c72 100644
--- a/drivers/media/i2c/vp27smpx.c
+++ b/drivers/media/i2c/vp27smpx.c
@@ -172,7 +172,7 @@ static void vp27smpx_remove(struct i2c_client *client)
 /* ----------------------------------------------------------------------- */
 
 static const struct i2c_device_id vp27smpx_id[] = {
-	{ "vp27smpx", 0 },
+	{ "vp27smpx" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vp27smpx_id);
diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 1eaae886f217..5f1a22284168 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -535,9 +535,9 @@ static void vpx3220_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id vpx3220_id[] = {
-	{ "vpx3220a", 0 },
-	{ "vpx3216b", 0 },
-	{ "vpx3214c", 0 },
+	{ "vpx3220a" },
+	{ "vpx3216b" },
+	{ "vpx3214c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vpx3220_id);
diff --git a/drivers/media/i2c/wm8739.c b/drivers/media/i2c/wm8739.c
index 19bf7a00dff9..c091b78a5b41 100644
--- a/drivers/media/i2c/wm8739.c
+++ b/drivers/media/i2c/wm8739.c
@@ -243,7 +243,7 @@ static void wm8739_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wm8739_id[] = {
-	{ "wm8739", 0 },
+	{ "wm8739" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8739_id);
diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
index d1b716fd6f11..619b2988577c 100644
--- a/drivers/media/i2c/wm8775.c
+++ b/drivers/media/i2c/wm8775.c
@@ -289,7 +289,7 @@ static void wm8775_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wm8775_id[] = {
-	{ "wm8775", 0 },
+	{ "wm8775" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8775_id);
diff --git a/drivers/media/radio/radio-tea5764.c b/drivers/media/radio/radio-tea5764.c
index 14e7dd3889ff..dd85b0b1bcd9 100644
--- a/drivers/media/radio/radio-tea5764.c
+++ b/drivers/media/radio/radio-tea5764.c
@@ -502,7 +502,7 @@ static void tea5764_i2c_remove(struct i2c_client *client)
 
 /* I2C subsystem interface */
 static const struct i2c_device_id tea5764_id[] = {
-	{ "radio-tea5764", 0 },
+	{ "radio-tea5764" },
 	{ }					/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(i2c, tea5764_id);
diff --git a/drivers/media/radio/saa7706h.c b/drivers/media/radio/saa7706h.c
index 91345198bbf1..d9eecddffd91 100644
--- a/drivers/media/radio/saa7706h.c
+++ b/drivers/media/radio/saa7706h.c
@@ -395,8 +395,8 @@ static void saa7706h_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id saa7706h_id[] = {
-	{DRIVER_NAME, 0},
-	{},
+	{ DRIVER_NAME },
+	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, saa7706h_id);
diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index fd449e42c191..cdd2ac198f2c 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -28,7 +28,7 @@
 /* I2C Device ID List */
 static const struct i2c_device_id si470x_i2c_id[] = {
 	/* Generic Entry */
-	{ "si470x", 0 },
+	{ "si470x" },
 	/* Terminating entry */
 	{ }
 };
diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index ddaf7a60b7d0..e71272c6de37 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -1639,8 +1639,8 @@ static void si4713_remove(struct i2c_client *client)
 
 /* si4713_i2c_driver - i2c driver interface */
 static const struct i2c_device_id si4713_id[] = {
-	{ "si4713" , 0 },
-	{ },
+	{ "si4713" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si4713_id);
 
diff --git a/drivers/media/radio/tef6862.c b/drivers/media/radio/tef6862.c
index 215168aa1588..b00ccf651922 100644
--- a/drivers/media/radio/tef6862.c
+++ b/drivers/media/radio/tef6862.c
@@ -173,8 +173,8 @@ static void tef6862_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tef6862_id[] = {
-	{DRIVER_NAME, 0},
-	{},
+	{ DRIVER_NAME },
+	{}
 };
 
 MODULE_DEVICE_TABLE(i2c, tef6862_id);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 7a0cd9601917..505f96fccbf3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -407,7 +407,7 @@ static const struct dvb_frontend_ops vidtv_demod_ops = {
 };
 
 static const struct i2c_device_id vidtv_demod_i2c_id_table[] = {
-	{"dvb_vidtv_demod", 0},
+	{ "dvb_vidtv_demod" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, vidtv_demod_i2c_id_table);
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index a748737d47f3..4ba302d569d6 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -385,7 +385,7 @@ static const struct dvb_tuner_ops vidtv_tuner_ops = {
 };
 
 static const struct i2c_device_id vidtv_tuner_i2c_id_table[] = {
-	{"dvb_vidtv_tuner", 0},
+	{ "dvb_vidtv_tuner" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, vidtv_tuner_i2c_id_table);
diff --git a/drivers/media/tuners/e4000.c b/drivers/media/tuners/e4000.c
index 3893a00c18ce..549b2009f974 100644
--- a/drivers/media/tuners/e4000.c
+++ b/drivers/media/tuners/e4000.c
@@ -719,7 +719,7 @@ static void e4000_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id e4000_id_table[] = {
-	{"e4000", 0},
+	{ "e4000" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, e4000_id_table);
diff --git a/drivers/media/tuners/fc2580.c b/drivers/media/tuners/fc2580.c
index f6613dcf40a3..046389896dc5 100644
--- a/drivers/media/tuners/fc2580.c
+++ b/drivers/media/tuners/fc2580.c
@@ -600,7 +600,7 @@ static void fc2580_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id fc2580_id_table[] = {
-	{"fc2580", 0},
+	{ "fc2580" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, fc2580_id_table);
diff --git a/drivers/media/tuners/m88rs6000t.c b/drivers/media/tuners/m88rs6000t.c
index 2cd7f0e0c70d..cc57980ed417 100644
--- a/drivers/media/tuners/m88rs6000t.c
+++ b/drivers/media/tuners/m88rs6000t.c
@@ -709,7 +709,7 @@ static void m88rs6000t_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id m88rs6000t_id[] = {
-	{"m88rs6000t", 0},
+	{ "m88rs6000t" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, m88rs6000t_id);
diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.c
index 4205ed4cf467..4b9dca2f17cc 100644
--- a/drivers/media/tuners/mt2060.c
+++ b/drivers/media/tuners/mt2060.c
@@ -514,7 +514,7 @@ static void mt2060_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id mt2060_id_table[] = {
-	{"mt2060", 0},
+	{ "mt2060" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, mt2060_id_table);
diff --git a/drivers/media/tuners/mxl301rf.c b/drivers/media/tuners/mxl301rf.c
index 9b2b237745ae..7c03d4132763 100644
--- a/drivers/media/tuners/mxl301rf.c
+++ b/drivers/media/tuners/mxl301rf.c
@@ -317,7 +317,7 @@ static void mxl301rf_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id mxl301rf_id[] = {
-	{"mxl301rf", 0},
+	{ "mxl301rf" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, mxl301rf_id);
diff --git a/drivers/media/tuners/qm1d1b0004.c b/drivers/media/tuners/qm1d1b0004.c
index af2d3618b9d5..c53aeb558413 100644
--- a/drivers/media/tuners/qm1d1b0004.c
+++ b/drivers/media/tuners/qm1d1b0004.c
@@ -243,7 +243,7 @@ static void qm1d1b0004_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id qm1d1b0004_id[] = {
-	{"qm1d1b0004", 0},
+	{ "qm1d1b0004" },
 	{}
 };
 
diff --git a/drivers/media/tuners/qm1d1c0042.c b/drivers/media/tuners/qm1d1c0042.c
index ce7223315b0c..c58f5b6526f1 100644
--- a/drivers/media/tuners/qm1d1c0042.c
+++ b/drivers/media/tuners/qm1d1c0042.c
@@ -434,7 +434,7 @@ static void qm1d1c0042_remove(struct i2c_client *client)
 
 
 static const struct i2c_device_id qm1d1c0042_id[] = {
-	{"qm1d1c0042", 0},
+	{ "qm1d1c0042" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, qm1d1c0042_id);
diff --git a/drivers/media/tuners/tda18212.c b/drivers/media/tuners/tda18212.c
index 8d742bd61df0..39f2dc9c2845 100644
--- a/drivers/media/tuners/tda18212.c
+++ b/drivers/media/tuners/tda18212.c
@@ -254,7 +254,7 @@ static void tda18212_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda18212_id[] = {
-	{"tda18212", 0},
+	{ "tda18212" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tda18212_id);
diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18250.c
index 32ea473f3f49..68d0275f29e1 100644
--- a/drivers/media/tuners/tda18250.c
+++ b/drivers/media/tuners/tda18250.c
@@ -868,7 +868,7 @@ static void tda18250_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tda18250_id_table[] = {
-	{"tda18250", 0},
+	{ "tda18250" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tda18250_id_table);
diff --git a/drivers/media/tuners/tua9001.c b/drivers/media/tuners/tua9001.c
index 03a3a022b0a8..562a7a5c26f5 100644
--- a/drivers/media/tuners/tua9001.c
+++ b/drivers/media/tuners/tua9001.c
@@ -245,7 +245,7 @@ static void tua9001_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tua9001_id_table[] = {
-	{"tua9001", 0},
+	{ "tua9001" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tua9001_id_table);
diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/go7007/s2250-board.c
index db1fab96d529..a155b987282f 100644
--- a/drivers/media/usb/go7007/s2250-board.c
+++ b/drivers/media/usb/go7007/s2250-board.c
@@ -611,7 +611,7 @@ static void s2250_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id s2250_id[] = {
-	{ "s2250", 0 },
+	{ "s2250" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, s2250_id);

base-commit: e7b4ef8fffaca247809337bb78daceb406659f2d
-- 
2.43.0


