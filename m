Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4C661781
	for <lists+linux-media@lfdr.de>; Sun,  7 Jul 2019 22:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfGGU65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jul 2019 16:58:57 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42943 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfGGU64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jul 2019 16:58:56 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hkEFK-0000Ft-Dz; Sun, 07 Jul 2019 22:58:54 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hkEFG-0007ij-Mr; Sun, 07 Jul 2019 22:58:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/3] si2157: get chip id during probing
Date:   Sun,  7 Jul 2019 22:58:44 +0200
Message-Id: <20190707205846.22964-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Andreas Kemnade <andreas@kemnade.info>

If the si2157 is behind a e.g. si2168, the si2157 will
at least in some situations not be readable after the si268
got the command 0101. It still accepts commands but the answer
is just ffffff. So read the chip id before that so the
information is not lost.

The following line in kernel output is a symptome
of that problem:
si2157 7-0063: unknown chip version Si21255-\xffffffff\xffffffff\xffffffff

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/media/tuners/si2157.c      | 73 +++++++++++++++++-------------
 drivers/media/tuners/si2157_priv.h |  8 ++++
 2 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 7be893def190..4d3313a611d6 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -75,7 +75,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	struct si2157_cmd cmd;
 	const struct firmware *fw;
 	const char *fw_name;
-	unsigned int uitmp, chip_id;
+	unsigned int uitmp;
 
 	dev_dbg(&client->dev, "\n");
 
@@ -109,34 +109,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
 
-	/* Si2141 needs a second command before it answers the revision query */
-	if (dev->chiptype == SI2157_CHIPTYPE_SI2141) {
-		memcpy(cmd.args, "\xc0\x08\x01\x02\x00\x00\x01", 7);
-		cmd.wlen = 7;
-		ret = si2157_cmd_execute(client, &cmd);
-		if (ret)
-			goto err;
-	}
-
-	/* query chip revision */
-	memcpy(cmd.args, "\x02", 1);
-	cmd.wlen = 1;
-	cmd.rlen = 13;
-	ret = si2157_cmd_execute(client, &cmd);
-	if (ret)
-		goto err;
-
-	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
-			cmd.args[4] << 0;
-
-	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
-	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
-	#define SI2157_A30 ('A' << 24 | 57 << 16 | '3' << 8 | '0' << 0)
-	#define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
-	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
-	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
-
-	switch (chip_id) {
+	switch (dev->chip_id) {
 	case SI2158_A20:
 	case SI2148_A20:
 		fw_name = SI2158_A20_FIRMWARE;
@@ -157,9 +130,6 @@ static int si2157_init(struct dvb_frontend *fe)
 		goto err;
 	}
 
-	dev_info(&client->dev, "found a 'Silicon Labs Si21%d-%c%c%c'\n",
-			cmd.args[2], cmd.args[1], cmd.args[3], cmd.args[4]);
-
 	if (fw_name == NULL)
 		goto skip_fw_download;
 
@@ -451,6 +421,45 @@ static int si2157_probe(struct i2c_client *client,
 
 	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
 	fe->tuner_priv = client;
+	/* power up */
+	if (dev->chiptype == SI2157_CHIPTYPE_SI2146) {
+		memcpy(cmd.args, "\xc0\x05\x01\x00\x00\x0b\x00\x00\x01", 9);
+		cmd.wlen = 9;
+	} else {
+		memcpy(cmd.args,
+		"\xc0\x00\x0c\x00\x00\x01\x01\x01\x01\x01\x01\x02\x00\x00\x01",
+		15);
+		cmd.wlen = 15;
+	}
+	cmd.rlen = 1;
+	ret = si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+	/* query chip revision */
+	/* hack: do it here because after the si2168 gets 0101, commands will
+	 * still be executed here but no result
+	 */
+	/* Si2141 needs a second command before it answers the revision query */
+	if (dev->chiptype == SI2157_CHIPTYPE_SI2141) {
+		memcpy(cmd.args, "\xc0\x08\x01\x02\x00\x00\x01", 7);
+		cmd.wlen = 7;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+	}
+
+	memcpy(cmd.args, "\x02", 1);
+	cmd.wlen = 1;
+	cmd.rlen = 13;
+	ret = si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err_kfree;
+	dev->chip_id = cmd.args[1] << 24 |
+			cmd.args[2] << 16 |
+			cmd.args[3] << 8 |
+			cmd.args[4] << 0;
+	dev_info(&client->dev, "found a 'Silicon Labs Si21%d-%c%c%c'\n",
+			cmd.args[2], cmd.args[1], cmd.args[3], cmd.args[4]);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	if (cfg->mdev) {
diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si2157_priv.h
index 7d16934c7708..168ce7ad8ec4 100644
--- a/drivers/media/tuners/si2157_priv.h
+++ b/drivers/media/tuners/si2157_priv.h
@@ -28,6 +28,7 @@ struct si2157_dev {
 	u8 chiptype;
 	u8 if_port;
 	u32 if_frequency;
+	u32 chip_id;
 	struct delayed_work stat_work;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
@@ -42,6 +43,13 @@ struct si2157_dev {
 #define SI2157_CHIPTYPE_SI2146 1
 #define SI2157_CHIPTYPE_SI2141 2
 
+#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
+#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)
+#define SI2157_A30 ('A' << 24 | 57 << 16 | '3' << 8 | '0' << 0)
+#define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
+#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
+#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
+
 /* firmware command struct */
 #define SI2157_ARGLEN      30
 struct si2157_cmd {
-- 
2.20.1

