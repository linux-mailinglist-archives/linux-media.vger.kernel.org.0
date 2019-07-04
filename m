Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB6A5F6AC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 12:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfGDKdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 06:33:25 -0400
Received: from ns.iliad.fr ([212.27.33.1]:45444 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727303AbfGDKdZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 06:33:25 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 2D38320554;
        Thu,  4 Jul 2019 12:33:23 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 14946201B0;
        Thu,  4 Jul 2019 12:33:23 +0200 (CEST)
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v3] media: si2168: Refactor command setup code
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Message-ID: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
Date:   Thu, 4 Jul 2019 12:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jul  4 12:33:23 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactor the command setup code, and let the compiler determine
the size of each command.

Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
Changes from v1:
- Use a real function to populate struct si2168_cmd *cmd, and a trivial
macro wrapping it (macro because sizeof).
Changes from v2:
- Fix header mess
- Add Jonathan's tag
---
 drivers/media/dvb-frontends/si2168.c | 146 +++++++++------------------
 1 file changed, 45 insertions(+), 101 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index c64b360ce6b5..5e81e076369c 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -12,6 +12,16 @@
 
 static const struct dvb_frontend_ops si2168_ops;
 
+static void cmd_setup(struct si2168_cmd *cmd, char *args, int wlen, int rlen)
+{
+	memcpy(cmd->args, args, wlen);
+	cmd->wlen = wlen;
+	cmd->rlen = rlen;
+}
+
+#define CMD_SETUP(cmd, args, rlen) \
+	cmd_setup(cmd, args, sizeof(args) - 1, rlen)
+
 /* execute firmware command */
 static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 {
@@ -84,15 +94,13 @@ static int si2168_ts_bus_ctrl(struct dvb_frontend *fe, int acquire)
 	dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
 
 	/* set TS_MODE property */
-	memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
+	CMD_SETUP(&cmd, "\x14\x00\x01\x10\x10\x00", 4);
 	if (acquire)
 		cmd.args[4] |= dev->ts_mode;
 	else
 		cmd.args[4] |= SI2168_TS_TRISTATE;
 	if (dev->ts_clock_gapped)
 		cmd.args[4] |= 0x40;
-	cmd.wlen = 6;
-	cmd.rlen = 4;
 	ret = si2168_cmd_execute(client, &cmd);
 
 	return ret;
@@ -116,19 +124,13 @@ static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
 
 	switch (c->delivery_system) {
 	case SYS_DVBT:
-		memcpy(cmd.args, "\xa0\x01", 2);
-		cmd.wlen = 2;
-		cmd.rlen = 13;
+		CMD_SETUP(&cmd, "\xa0\x01", 13);
 		break;
 	case SYS_DVBC_ANNEX_A:
-		memcpy(cmd.args, "\x90\x01", 2);
-		cmd.wlen = 2;
-		cmd.rlen = 9;
+		CMD_SETUP(&cmd, "\x90\x01", 9);
 		break;
 	case SYS_DVBT2:
-		memcpy(cmd.args, "\x50\x01", 2);
-		cmd.wlen = 2;
-		cmd.rlen = 14;
+		CMD_SETUP(&cmd, "\x50\x01", 14);
 		break;
 	default:
 		ret = -EINVAL;
@@ -165,9 +167,7 @@ static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
 
 	/* BER */
 	if (*status & FE_HAS_VITERBI) {
-		memcpy(cmd.args, "\x82\x00", 2);
-		cmd.wlen = 2;
-		cmd.rlen = 3;
+		CMD_SETUP(&cmd, "\x82\x00", 3);
 		ret = si2168_cmd_execute(client, &cmd);
 		if (ret)
 			goto err;
@@ -198,9 +198,7 @@ static int si2168_read_status(struct dvb_frontend *fe, enum fe_status *status)
 
 	/* UCB */
 	if (*status & FE_HAS_SYNC) {
-		memcpy(cmd.args, "\x84\x01", 2);
-		cmd.wlen = 2;
-		cmd.rlen = 3;
+		CMD_SETUP(&cmd, "\x84\x01", 3);
 		ret = si2168_cmd_execute(client, &cmd);
 		if (ret)
 			goto err;
@@ -286,22 +284,18 @@ static int si2168_set_frontend(struct dvb_frontend *fe)
 			goto err;
 	}
 
-	memcpy(cmd.args, "\x88\x02\x02\x02\x02", 5);
-	cmd.wlen = 5;
-	cmd.rlen = 5;
+	CMD_SETUP(&cmd, "\x88\x02\x02\x02\x02", 5);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
 	/* that has no big effect */
 	if (c->delivery_system == SYS_DVBT)
-		memcpy(cmd.args, "\x89\x21\x06\x11\xff\x98", 6);
+		CMD_SETUP(&cmd, "\x89\x21\x06\x11\xff\x98", 3);
 	else if (c->delivery_system == SYS_DVBC_ANNEX_A)
-		memcpy(cmd.args, "\x89\x21\x06\x11\x89\xf0", 6);
+		CMD_SETUP(&cmd, "\x89\x21\x06\x11\x89\xf0", 3);
 	else if (c->delivery_system == SYS_DVBT2)
-		memcpy(cmd.args, "\x89\x21\x06\x11\x89\x20", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 3;
+		CMD_SETUP(&cmd, "\x89\x21\x06\x11\x89\x20", 3);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -318,103 +312,77 @@ static int si2168_set_frontend(struct dvb_frontend *fe)
 			goto err;
 	}
 
-	memcpy(cmd.args, "\x51\x03", 2);
-	cmd.wlen = 2;
-	cmd.rlen = 12;
+	CMD_SETUP(&cmd, "\x51\x03", 12);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x12\x08\x04", 3);
-	cmd.wlen = 3;
-	cmd.rlen = 3;
+	CMD_SETUP(&cmd, "\x12\x08\x04", 3);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x0c\x10\x12\x00", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
+	CMD_SETUP(&cmd, "\x14\x00\x0c\x10\x12\x00", 4);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x06\x10\x24\x00", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
+	CMD_SETUP(&cmd, "\x14\x00\x06\x10\x24\x00", 4);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x07\x10\x00\x24", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
+	CMD_SETUP(&cmd, "\x14\x00\x07\x10\x00\x24", 4);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x0a\x10\x00\x00", 6);
+	CMD_SETUP(&cmd, "\x14\x00\x0a\x10\x00\x00", 4);
 	cmd.args[4] = delivery_system | bandwidth;
 	if (dev->spectral_inversion)
 		cmd.args[5] |= 1;
-	cmd.wlen = 6;
-	cmd.rlen = 4;
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
 	/* set DVB-C symbol rate */
 	if (c->delivery_system == SYS_DVBC_ANNEX_A) {
-		memcpy(cmd.args, "\x14\x00\x02\x11", 4);
+		CMD_SETUP(&cmd, "\x14\x00\x02\x11\x00\x00", 4);
 		cmd.args[4] = ((c->symbol_rate / 1000) >> 0) & 0xff;
 		cmd.args[5] = ((c->symbol_rate / 1000) >> 8) & 0xff;
-		cmd.wlen = 6;
-		cmd.rlen = 4;
 		ret = si2168_cmd_execute(client, &cmd);
 		if (ret)
 			goto err;
 	}
 
-	memcpy(cmd.args, "\x14\x00\x0f\x10\x10\x00", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
+	CMD_SETUP(&cmd, "\x14\x00\x0f\x10\x10\x00", 4);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x09\x10\xe3\x08", 6);
+	CMD_SETUP(&cmd, "\x14\x00\x09\x10\xe3\x08", 4);
 	cmd.args[5] |= dev->ts_clock_inv ? 0x00 : 0x10;
-	cmd.wlen = 6;
-	cmd.rlen = 4;
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x08\x10\xd7\x05", 6);
+	CMD_SETUP(&cmd, "\x14\x00\x08\x10\xd7\x05", 4);
 	cmd.args[5] |= dev->ts_clock_inv ? 0x00 : 0x10;
-	cmd.wlen = 6;
-	cmd.rlen = 4;
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x01\x12\x00\x00", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
+	CMD_SETUP(&cmd, "\x14\x00\x01\x12\x00\x00", 4);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x14\x00\x01\x03\x0c\x00", 6);
-	cmd.wlen = 6;
-	cmd.rlen = 4;
+	CMD_SETUP(&cmd, "\x14\x00\x01\x03\x0c\x00", 4);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
-	memcpy(cmd.args, "\x85", 1);
-	cmd.wlen = 1;
-	cmd.rlen = 1;
+	CMD_SETUP(&cmd, "\x85", 1);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -444,26 +412,20 @@ static int si2168_init(struct dvb_frontend *fe)
 	dev_dbg(&client->dev, "\n");
 
 	/* initialize */
-	memcpy(cmd.args, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x00", 13);
-	cmd.wlen = 13;
-	cmd.rlen = 0;
+	CMD_SETUP(&cmd, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x00", 0);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
 	if (dev->warm) {
 		/* resume */
-		memcpy(cmd.args, "\xc0\x06\x08\x0f\x00\x20\x21\x01", 8);
-		cmd.wlen = 8;
-		cmd.rlen = 1;
+		CMD_SETUP(&cmd, "\xc0\x06\x08\x0f\x00\x20\x21\x01", 1);
 		ret = si2168_cmd_execute(client, &cmd);
 		if (ret)
 			goto err;
 
 		udelay(100);
-		memcpy(cmd.args, "\x85", 1);
-		cmd.wlen = 1;
-		cmd.rlen = 1;
+		CMD_SETUP(&cmd, "\x85", 1);
 		ret = si2168_cmd_execute(client, &cmd);
 		if (ret)
 			goto err;
@@ -472,9 +434,7 @@ static int si2168_init(struct dvb_frontend *fe)
 	}
 
 	/* power up */
-	memcpy(cmd.args, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 8);
-	cmd.wlen = 8;
-	cmd.rlen = 1;
+	CMD_SETUP(&cmd, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 1);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -542,17 +502,13 @@ static int si2168_init(struct dvb_frontend *fe)
 
 	release_firmware(fw);
 
-	memcpy(cmd.args, "\x01\x01", 2);
-	cmd.wlen = 2;
-	cmd.rlen = 1;
+	CMD_SETUP(&cmd, "\x01\x01", 1);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
 
 	/* query firmware version */
-	memcpy(cmd.args, "\x11", 1);
-	cmd.wlen = 1;
-	cmd.rlen = 10;
+	CMD_SETUP(&cmd, "\x11", 10);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -610,9 +566,7 @@ static int si2168_sleep(struct dvb_frontend *fe)
 	if (dev->version > ('B' << 24 | 4 << 16 | 0 << 8 | 11 << 0))
 		dev->warm = false;
 
-	memcpy(cmd.args, "\x13", 1);
-	cmd.wlen = 1;
-	cmd.rlen = 0;
+	CMD_SETUP(&cmd, "\x13", 0);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -638,9 +592,7 @@ static int si2168_select(struct i2c_mux_core *muxc, u32 chan)
 	struct si2168_cmd cmd;
 
 	/* open I2C gate */
-	memcpy(cmd.args, "\xc0\x0d\x01", 3);
-	cmd.wlen = 3;
-	cmd.rlen = 0;
+	CMD_SETUP(&cmd, "\xc0\x0d\x01", 0);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -658,9 +610,7 @@ static int si2168_deselect(struct i2c_mux_core *muxc, u32 chan)
 	struct si2168_cmd cmd;
 
 	/* close I2C gate */
-	memcpy(cmd.args, "\xc0\x0d\x00", 3);
-	cmd.wlen = 3;
-	cmd.rlen = 0;
+	CMD_SETUP(&cmd, "\xc0\x0d\x00", 0);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err;
@@ -753,25 +703,19 @@ static int si2168_probe(struct i2c_client *client,
 	mutex_init(&dev->i2c_mutex);
 
 	/* Initialize */
-	memcpy(cmd.args, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x00", 13);
-	cmd.wlen = 13;
-	cmd.rlen = 0;
+	CMD_SETUP(&cmd, "\xc0\x12\x00\x0c\x00\x0d\x16\x00\x00\x00\x00\x00\x00", 0);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err_kfree;
 
 	/* Power up */
-	memcpy(cmd.args, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 8);
-	cmd.wlen = 8;
-	cmd.rlen = 1;
+	CMD_SETUP(&cmd, "\xc0\x06\x01\x0f\x00\x20\x20\x01", 1);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err_kfree;
 
 	/* Query chip revision */
-	memcpy(cmd.args, "\x02", 1);
-	cmd.wlen = 1;
-	cmd.rlen = 13;
+	CMD_SETUP(&cmd, "\x02", 13);
 	ret = si2168_cmd_execute(client, &cmd);
 	if (ret)
 		goto err_kfree;
-- 
2.17.1
