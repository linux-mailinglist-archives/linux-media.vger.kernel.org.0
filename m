Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA0A3F9A2A
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 21:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfKLUCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 15:02:33 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:35522 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLUCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 15:02:32 -0500
Received: by mail-qv1-f68.google.com with SMTP id y18so6938779qve.2;
        Tue, 12 Nov 2019 12:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=egk/lZEiggqdaMVw9z9rRydBjA23p+M+ZjlETBQpQrk=;
        b=tz9g7F7RqcND9vyX6EzyDR8WugOqdRrkF7AVhZb4HwbLwDnFLJfPDOF4UcMw+eDIZb
         dUS51FO/n7D8FcnyBged0ERRayG+H8b2B9azzy1P+ctNMXVPFICVEQ/xpboWRtNfYe8m
         f5FKdDhO18C97xMLrWtERqUkyUupQbzJJWnVoMNOj2ea7CNs6SwMb76ZE5y5SiCgapgE
         Qk19BYtsIcGNmtnau2yrqftyWgKpm3EqDOf6Q9ldWHA4MOBM+hSgNs4tjqSEakEZ9lCW
         yZfTvMnx/ej5SpqNQg8MJAmECEuYCGOBnckx8uST+7S8V5A5hOXEG1FtA1cNAkcTIrTy
         HS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=egk/lZEiggqdaMVw9z9rRydBjA23p+M+ZjlETBQpQrk=;
        b=ErlqqozKvVkmmOBOIATh0/ykfv/knZY6dyKvnQQllw+mHP2yFN0By5V2nTmjei1roZ
         SfscuMQdGqQQPKiWyyXefRRh7BeZcPLIaW7IOdntbgkZ3DaFFZLCBPwUsi1Jl7lyIipk
         ZoRrs0eu5UArAQJvAcQKI9NH9nW3sAPyw+QjzUUQ3pAME//1i0k4BT5aFlznVU3VAZdN
         sd/D66byOZfxJ3torxAy8eXm+WoG/R501HJ45hdKNV1uxhNwu7ewCyvsfJUbPbx2q+ka
         vWAiPJx071J2DeT31GkL2Nom3/jRtQGXs1eOhy0h4fsgK6BpT7gzXUoeLu/06c7YJsat
         FdHw==
X-Gm-Message-State: APjAAAUTS0eXe6YS3O+Y4fLRkK8ZFrEHYA6Jy9rpUWNfSsQhBPflKxx+
        lX6368yx2/sZK306S76QW6I=
X-Google-Smtp-Source: APXvYqyrVK51DI9dxFfCpGG8F3pvrfh5PXiWnNHvylqefb0EIKgrbpDgR3garl1JMO+bA5rH1OFZqg==
X-Received: by 2002:ad4:55ce:: with SMTP id bt14mr29737332qvb.131.1573588950357;
        Tue, 12 Nov 2019 12:02:30 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id c21sm11295103qtg.61.2019.11.12.12.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:02:29 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] media: bcm3510.c: Fix checkpatch.pl errors
Date:   Tue, 12 Nov 2019 16:55:04 -0300
Message-Id: <20191112195504.36952-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This patch fixes errors reported by checkpatch.pl such as:

ERROR: space required after that ',' (ctx:VxV)
+	if ((ret = bcm3510_writeB(st,0xa6,hab)) < 0)
 	                                 ^

ERROR: do not use assignment in if condition
+	if ((ret = bcm3510_writeB(st,0xa6,hab)) < 0)

Most warnings were also taken care of.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/bcm3510.c | 448 ++++++++++++++++----------
 1 file changed, 270 insertions(+), 178 deletions(-)

diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index e92542b92d34..1b12d0e24edf 100644
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -49,8 +49,8 @@
 
 struct bcm3510_state {
 
-	struct i2c_adapter* i2c;
-	const struct bcm3510_config* config;
+	struct i2c_adapter *i2c;
+	const struct bcm3510_config *config;
 	struct dvb_frontend frontend;
 
 	/* demodulator private data */
@@ -67,31 +67,37 @@ static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "set debugging level (1=info,2=i2c (|-able)).");
 
-#define dprintk(level,x...) if (level & debug) printk(x)
-#define dbufout(b,l,m) {\
-	    int i; \
-	    for (i = 0; i < l; i++) \
-		m("%02x ",b[i]); \
+#define dprintk(level, x...) if (level & debug) printk(KERN_DEBUG x)
+#define dbufout(b, l, m) {\
+	int i; \
+	for (i = 0; i < l; i++) \
+		m("%02x ", b[i]); \
 }
-#define deb_info(args...) dprintk(0x01,args)
-#define deb_i2c(args...)  dprintk(0x02,args)
-#define deb_hab(args...)  dprintk(0x04,args)
+#define deb_info(args...) dprintk(0x01, args)
+#define deb_i2c(args...)  dprintk(0x02, args)
+#define deb_hab(args...)  dprintk(0x04, args)
 
 /* transfer functions */
-static int bcm3510_writebytes (struct bcm3510_state *state, u8 reg, u8 *buf, u8 len)
+static int bcm3510_writebytes(struct bcm3510_state *state,
+						      u8 reg,
+						      u8 *buf,
+						      u8 len)
 {
 	u8 b[256];
 	int err;
-	struct i2c_msg msg = { .addr = state->config->demod_address, .flags = 0, .buf = b, .len = len + 1 };
+	struct i2c_msg msg = { .addr = state->config->demod_address,
+						   .flags = 0,
+						   .buf = b,
+						   .len = len + 1 };
 
 	b[0] = reg;
-	memcpy(&b[1],buf,len);
+	memcpy(&b[1], buf, len);
 
-	deb_i2c("i2c wr %02x: ",reg);
-	dbufout(buf,len,deb_i2c);
+	deb_i2c("i2c wr %02x: ", reg);
+	dbufout(buf, len, deb_i2c);
 	deb_i2c("\n");
-
-	if ((err = i2c_transfer (state->i2c, &msg, 1)) != 1) {
+	err = i2c_transfer(state->i2c, &msg, 1);
+	if (err != 1) {
 
 		deb_info("%s: i2c write error (addr %02x, reg %02x, err == %i)\n",
 			__func__, state->config->demod_address, reg,  err);
@@ -101,7 +107,10 @@ static int bcm3510_writebytes (struct bcm3510_state *state, u8 reg, u8 *buf, u8
 	return 0;
 }
 
-static int bcm3510_readbytes (struct bcm3510_state *state, u8 reg, u8 *buf, u8 len)
+static int bcm3510_readbytes(struct bcm3510_state *state,
+							 u8 reg,
+							 u8 *buf,
+							 u8 len)
 {
 	struct i2c_msg msg[] = {
 		{ .addr = state->config->demod_address, .flags = 0,        .buf = &reg, .len = 1 },
@@ -109,42 +118,51 @@ static int bcm3510_readbytes (struct bcm3510_state *state, u8 reg, u8 *buf, u8 l
 	};
 	int err;
 
-	memset(buf,0,len);
+	memset(buf, 0, len);
+
+	err = i2c_transfer(state->i2c, msg, 2);
 
-	if ((err = i2c_transfer (state->i2c, msg, 2)) != 2) {
+	if (err != 2) {
 		deb_info("%s: i2c read error (addr %02x, reg %02x, err == %i)\n",
 			__func__, state->config->demod_address, reg,  err);
 		return -EREMOTEIO;
 	}
-	deb_i2c("i2c rd %02x: ",reg);
-	dbufout(buf,len,deb_i2c);
+
+	deb_i2c("i2c rd %02x: ", reg);
+	dbufout(buf, len, deb_i2c);
 	deb_i2c("\n");
 
 	return 0;
 }
 
-static int bcm3510_writeB(struct bcm3510_state *state, u8 reg, bcm3510_register_value v)
+static int bcm3510_writeB(struct bcm3510_state *state,
+						  u8 reg,
+						  bcm3510_register_value v)
 {
-	return bcm3510_writebytes(state,reg,&v.raw,1);
+	return bcm3510_writebytes(state, reg, &v.raw, 1);
 }
 
-static int bcm3510_readB(struct bcm3510_state *state, u8 reg, bcm3510_register_value *v)
+static int bcm3510_readB(struct bcm3510_state *state,
+						 u8 reg,
+						 bcm3510_register_value *v)
 {
-	return bcm3510_readbytes(state,reg,&v->raw,1);
+	return bcm3510_readbytes(state, reg, &v->raw, 1);
 }
 
 /* Host Access Buffer transfers */
 static int bcm3510_hab_get_response(struct bcm3510_state *st, u8 *buf, int len)
 {
 	bcm3510_register_value v;
-	int ret,i;
+	int ret, i;
 
 	v.HABADR_a6.HABADR = 0;
-	if ((ret = bcm3510_writeB(st,0xa6,v)) < 0)
+	ret = bcm3510_writeB(st, 0xa6, v);
+	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < len; i++) {
-		if ((ret = bcm3510_readB(st,0xa7,&v)) < 0)
+		ret = bcm3510_readB(st, 0xa7, &v);
+		if (ret < 0)
 			return ret;
 		buf[i] = v.HABDATA_a7;
 	}
@@ -153,37 +171,43 @@ static int bcm3510_hab_get_response(struct bcm3510_state *st, u8 *buf, int len)
 
 static int bcm3510_hab_send_request(struct bcm3510_state *st, u8 *buf, int len)
 {
-	bcm3510_register_value v,hab;
-	int ret,i;
+	bcm3510_register_value v, hab;
+	int ret, i;
 	unsigned long t;
-
 /* Check if any previous HAB request still needs to be serviced by the
- * Acquisition Processor before sending new request */
-	if ((ret = bcm3510_readB(st,0xa8,&v)) < 0)
+ * Acquisition Processor before sending new request
+ */
+	ret = bcm3510_readB(st, 0xa8, &v);
+	if (ret < 0)
 		return ret;
 	if (v.HABSTAT_a8.HABR) {
 		deb_info("HAB is running already - clearing it.\n");
 		v.HABSTAT_a8.HABR = 0;
-		bcm3510_writeB(st,0xa8,v);
+		bcm3510_writeB(st, 0xa8, v);
 //		return -EBUSY;
 	}
 
 /* Send the start HAB Address (automatically incremented after write of
- * HABDATA) and write the HAB Data */
+ * HABDATA) and write the HAB Data
+ */
 	hab.HABADR_a6.HABADR = 0;
-	if ((ret = bcm3510_writeB(st,0xa6,hab)) < 0)
+	ret = bcm3510_writeB(st, 0xa6, hab);
+	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < len; i++) {
 		hab.HABDATA_a7 = buf[i];
-		if ((ret = bcm3510_writeB(st,0xa7,hab)) < 0)
+		ret = bcm3510_writeB(st, 0xa7, hab);
+		if (ret < 0)
 			return ret;
 	}
 
 /* Set the HABR bit to indicate AP request in progress (LBHABR allows HABR to
- * be written) */
+ * be written)
+ */
 	v.raw = 0; v.HABSTAT_a8.HABR = 1; v.HABSTAT_a8.LDHABR = 1;
-	if ((ret = bcm3510_writeB(st,0xa8,v)) < 0)
+	ret = bcm3510_writeB(st, 0xa8, v);
+	if (ret < 0)
 		return ret;
 
 /* Polling method: Wait until the AP finishes processing the HAB request */
@@ -191,7 +215,9 @@ static int bcm3510_hab_send_request(struct bcm3510_state *st, u8 *buf, int len)
 	while (time_before(jiffies, t)) {
 		deb_info("waiting for HAB to complete\n");
 		msleep(10);
-		if ((ret = bcm3510_readB(st,0xa8,&v)) < 0)
+
+		ret = bcm3510_readB(st, 0xa8, &v);
+		if (ret < 0)
 			return ret;
 
 		if (!v.HABSTAT_a8.HABR)
@@ -202,7 +228,9 @@ static int bcm3510_hab_send_request(struct bcm3510_state *st, u8 *buf, int len)
 	return -ETIMEDOUT;
 }
 
-static int bcm3510_do_hab_cmd(struct bcm3510_state *st, u8 cmd, u8 msgid, u8 *obuf, u8 olen, u8 *ibuf, u8 ilen)
+static int bcm3510_do_hab_cmd(struct bcm3510_state *st,
+			      u8 cmd, u8 msgid, u8 *obuf,
+			      u8 olen, u8 *ibuf, u8 ilen)
 {
 	u8 ob[MAX_XFER_SIZE], ib[MAX_XFER_SIZE];
 	int ret = 0;
@@ -219,10 +247,10 @@ static int bcm3510_do_hab_cmd(struct bcm3510_state *st, u8 cmd, u8 msgid, u8 *ob
 
 	ob[0] = cmd;
 	ob[1] = msgid;
-	memcpy(&ob[2],obuf,olen);
+	memcpy(&ob[2], obuf, olen);
 
 	deb_hab("hab snd: ");
-	dbufout(ob,olen+2,deb_hab);
+	dbufout(ob, olen+2, deb_hab);
 	deb_hab("\n");
 
 	if (mutex_lock_interruptible(&st->hab_mutex) < 0)
@@ -233,47 +261,29 @@ static int bcm3510_do_hab_cmd(struct bcm3510_state *st, u8 cmd, u8 msgid, u8 *ob
 		goto error;
 
 	deb_hab("hab get: ");
-	dbufout(ib,ilen+2,deb_hab);
+	dbufout(ib, ilen+2, deb_hab);
 	deb_hab("\n");
 
-	memcpy(ibuf,&ib[2],ilen);
+	memcpy(ibuf, &ib[2], ilen);
 error:
 	mutex_unlock(&st->hab_mutex);
 	return ret;
 }
 
-#if 0
-/* not needed, we use a semaphore to prevent HAB races */
-static int bcm3510_is_ap_ready(struct bcm3510_state *st)
-{
-	bcm3510_register_value ap,hab;
-	int ret;
-
-	if ((ret = bcm3510_readB(st,0xa8,&hab)) < 0 ||
-		(ret = bcm3510_readB(st,0xa2,&ap) < 0))
-		return ret;
-
-	if (ap.APSTAT1_a2.RESET || ap.APSTAT1_a2.IDLE || ap.APSTAT1_a2.STOP || hab.HABSTAT_a8.HABR) {
-		deb_info("AP is busy\n");
-		return -EBUSY;
-	}
-
-	return 0;
-}
-#endif
-
 static int bcm3510_bert_reset(struct bcm3510_state *st)
 {
 	bcm3510_register_value b;
 	int ret;
 
-	if ((ret = bcm3510_readB(st,0xfa,&b)) < 0)
+	ret = bcm3510_readB(st, 0xfa, &b);
+	if (ret < 0)
 		return ret;
 
-	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.RESYNC = 1; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st,0xfa,b);
-	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1; bcm3510_writeB(st,0xfa,b);
+	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st, 0xfa, b);
+	b.BERCTL_fa.RESYNC = 1; bcm3510_writeB(st, 0xfa, b);
+	b.BERCTL_fa.RESYNC = 0; bcm3510_writeB(st, 0xfa, b);
+	b.BERCTL_fa.CNTCTL = 1; b.BERCTL_fa.BITCNT = 1;
+	bcm3510_writeB(st, 0xfa, b);
 
 	/* clear residual bit counter TODO  */
 	return 0;
@@ -281,17 +291,34 @@ static int bcm3510_bert_reset(struct bcm3510_state *st)
 
 static int bcm3510_refresh_state(struct bcm3510_state *st)
 {
-	if (time_after(jiffies,st->next_status_check)) {
-		bcm3510_do_hab_cmd(st, CMD_STATUS, MSGID_STATUS1, NULL,0, (u8 *)&st->status1, sizeof(st->status1));
-		bcm3510_do_hab_cmd(st, CMD_STATUS, MSGID_STATUS2, NULL,0, (u8 *)&st->status2, sizeof(st->status2));
-		st->next_status_check = jiffies + (st->status_check_interval*HZ)/1000;
+	if (time_after(jiffies, st->next_status_check)) {
+
+		bcm3510_do_hab_cmd(st,
+				   CMD_STATUS,
+				   MSGID_STATUS1,
+				   NULL,
+				   0,
+				   (u8 *)&st->status1,
+				   sizeof(st->status1));
+
+		bcm3510_do_hab_cmd(st,
+				   CMD_STATUS,
+				   MSGID_STATUS2,
+				   NULL,
+				   0,
+				   (u8 *)&st->status2,
+				   sizeof(st->status2));
+
+		st->next_status_check =
+			jiffies + (st->status_check_interval*HZ)/1000;
 	}
 	return 0;
 }
 
 static int bcm3510_read_status(struct dvb_frontend *fe, enum fe_status *status)
 {
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
+
 	bcm3510_refresh_state(st);
 
 	*status = 0;
@@ -309,30 +336,36 @@ static int bcm3510_read_status(struct dvb_frontend *fe, enum fe_status *status)
 	else /* more frequently checks if no lock has been achieved yet */
 		st->status_check_interval = 500;
 
-	deb_info("real_status: %02x\n",*status);
+	deb_info("real_status: %02x\n", *status);
 	return 0;
 }
 
-static int bcm3510_read_ber(struct dvb_frontend* fe, u32* ber)
+static int bcm3510_read_ber(struct dvb_frontend *fe, u32 *ber)
 {
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
+
 	bcm3510_refresh_state(st);
 
-	*ber = (st->status2.LDBER0 << 16) | (st->status2.LDBER1 << 8) | st->status2.LDBER2;
+	*ber = (st->status2.LDBER0 << 16) |
+		   (st->status2.LDBER1 << 8) |
+		   st->status2.LDBER2;
+
 	return 0;
 }
 
-static int bcm3510_read_unc(struct dvb_frontend* fe, u32* unc)
+static int bcm3510_read_unc(struct dvb_frontend *fe, u32 *unc)
 {
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
+
 	bcm3510_refresh_state(st);
 	*unc = (st->status2.LDUERC0 << 8) | st->status2.LDUERC1;
+
 	return 0;
 }
 
-static int bcm3510_read_signal_strength(struct dvb_frontend* fe, u16* strength)
+static int bcm3510_read_signal_strength(struct dvb_frontend *fe, u16 *strength)
 {
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
 	s32 t;
 
 	bcm3510_refresh_state(st);
@@ -350,9 +383,10 @@ static int bcm3510_read_signal_strength(struct dvb_frontend* fe, u16* strength)
 	return 0;
 }
 
-static int bcm3510_read_snr(struct dvb_frontend* fe, u16* snr)
+static int bcm3510_read_snr(struct dvb_frontend *fe, u16 *snr)
 {
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
+
 	bcm3510_refresh_state(st);
 
 	*snr = st->status1.SNR_EST0*1000 + ((st->status1.SNR_EST1*1000) >> 8);
@@ -360,21 +394,25 @@ static int bcm3510_read_snr(struct dvb_frontend* fe, u16* snr)
 }
 
 /* tuner frontend programming */
-static int bcm3510_tuner_cmd(struct bcm3510_state* st,u8 bc, u16 n, u8 a)
+static int bcm3510_tuner_cmd(struct bcm3510_state *st, u8 bc, u16 n, u8 a)
 {
 	struct bcm3510_hab_cmd_tune c;
-	memset(&c,0,sizeof(struct bcm3510_hab_cmd_tune));
+
+	memset(&c, 0, sizeof(struct bcm3510_hab_cmd_tune));
 
 /* I2C Mode disabled,  set 16 control / Data pairs */
 	c.length = 0x10;
 	c.clock_width = 0;
 /* CS1, CS0, DATA, CLK bits control the tuner RF_AGC_SEL pin is set to
- * logic high (as Configuration) */
+ * logic high (as Configuration)
+ */
 	c.misc = 0x10;
 /* Set duration of the initial state of TUNCTL = 3.34 micro Sec */
 	c.TUNCTL_state = 0x40;
 
-/* PRESCALER DIVIDE RATIO | BC1_2_3_4; (band switch), 1stosc REFERENCE COUNTER REF_S12 and REF_S11 */
+/* PRESCALER DIVIDE RATIO | BC1_2_3_4; (band switch),
+ * 1stosc REFERENCE COUNTER REF_S12 and REF_S11
+ */
 	c.ctl_dat[0].ctrl.size = BITS_8;
 	c.ctl_dat[0].data      = 0x80 | bc;
 
@@ -446,18 +484,25 @@ static int bcm3510_tuner_cmd(struct bcm3510_state* st,u8 bc, u16 n, u8 a)
 	c.ctl_dat[15].ctrl.cs1  = 1;
 	c.ctl_dat[15].data      = 0x40;
 
-	return bcm3510_do_hab_cmd(st,CMD_TUNE, MSGID_TUNE,(u8 *) &c,sizeof(c), NULL, 0);
+	return bcm3510_do_hab_cmd(st,
+				  CMD_TUNE,
+				  MSGID_TUNE,
+				  (u8 *) &c,
+				  sizeof(c),
+				  NULL,
+				  0);
+
 }
 
-static int bcm3510_set_freq(struct bcm3510_state* st,u32 freq)
+static int bcm3510_set_freq(struct bcm3510_state *st, u32 freq)
 {
-	u8 bc,a;
+	u8 bc, a;
 	u16 n;
-	s32 YIntercept,Tfvco1;
+	s32 YIntercept, Tfvco1;
 
 	freq /= 1000;
 
-	deb_info("%dkHz:",freq);
+	deb_info("%dkHz:", freq);
 	/* set Band Switch */
 	if (freq <= 168000)
 		bc = 0x1c;
@@ -472,7 +517,7 @@ static int bcm3510_set_freq(struct bcm3510_state* st,u32 freq)
 	} else if (freq >= 90000) {
 		freq -= 90001;
 		YIntercept = 15005;
-	} else if (freq >= 76000){
+	} else if (freq >= 76000) {
 		freq -= 76001;
 		YIntercept = 14865;
 	} else {
@@ -487,7 +532,7 @@ static int bcm3510_set_freq(struct bcm3510_state* st,u32 freq)
 
 	deb_info(" BC1_2_3_4: %x, N: %x A: %x\n", bc, n, a);
 	if (n >= 16 && n <= 2047)
-		return bcm3510_tuner_cmd(st,bc,n,a);
+		return bcm3510_tuner_cmd(st, bc, n, a);
 
 	return -EINVAL;
 }
@@ -495,51 +540,34 @@ static int bcm3510_set_freq(struct bcm3510_state* st,u32 freq)
 static int bcm3510_set_frontend(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
 	struct bcm3510_hab_cmd_ext_acquire cmd;
 	struct bcm3510_hab_cmd_bert_control bert;
 	int ret;
 
-	memset(&cmd,0,sizeof(cmd));
+	memset(&cmd, 0, sizeof(cmd));
 	switch (c->modulation) {
-		case QAM_256:
+	case QAM_256:
 			cmd.ACQUIRE0.MODE = 0x1;
 			cmd.ACQUIRE1.SYM_RATE = 0x1;
 			cmd.ACQUIRE1.IF_FREQ = 0x1;
 			break;
-		case QAM_64:
+	case QAM_64:
 			cmd.ACQUIRE0.MODE = 0x2;
 			cmd.ACQUIRE1.SYM_RATE = 0x2;
 			cmd.ACQUIRE1.IF_FREQ = 0x1;
 			break;
-#if 0
-		case QAM_256:
-			cmd.ACQUIRE0.MODE = 0x3;
-			break;
-		case QAM_128:
-			cmd.ACQUIRE0.MODE = 0x4;
-			break;
-		case QAM_64:
-			cmd.ACQUIRE0.MODE = 0x5;
-			break;
-		case QAM_32:
-			cmd.ACQUIRE0.MODE = 0x6;
-			break;
-		case QAM_16:
-			cmd.ACQUIRE0.MODE = 0x7;
-			break;
-#endif
-		case VSB_8:
+	case VSB_8:
 			cmd.ACQUIRE0.MODE = 0x8;
 			cmd.ACQUIRE1.SYM_RATE = 0x0;
 			cmd.ACQUIRE1.IF_FREQ = 0x0;
 			break;
-		case VSB_16:
+	case VSB_16:
 			cmd.ACQUIRE0.MODE = 0x9;
 			cmd.ACQUIRE1.SYM_RATE = 0x0;
 			cmd.ACQUIRE1.IF_FREQ = 0x0;
 			break;
-		default:
+	default:
 			return -EINVAL;
 	}
 	cmd.ACQUIRE0.OFFSET = 0;
@@ -558,13 +586,21 @@ static int bcm3510_set_frontend(struct dvb_frontend *fe)
 			cmd.NTSC_OFFSET1;
 		}
 	} */
-	bcm3510_do_hab_cmd(st, CMD_ACQUIRE, MSGID_EXT_TUNER_ACQUIRE, (u8 *) &cmd, sizeof(cmd), NULL, 0);
+	bcm3510_do_hab_cmd(st,
+			   CMD_ACQUIRE,
+			   MSGID_EXT_TUNER_ACQUIRE,
+			   (u8 *) &cmd,
+			   sizeof(cmd),
+			   NULL,
+			   0);
 
 /* doing it with different MSGIDs, data book and source differs */
 	bert.BE = 0;
 	bert.unused = 0;
-	bcm3510_do_hab_cmd(st, CMD_STATE_CONTROL, MSGID_BERT_CONTROL, (u8 *) &bert, sizeof(bert), NULL, 0);
-	bcm3510_do_hab_cmd(st, CMD_STATE_CONTROL, MSGID_BERT_SET, (u8 *) &bert, sizeof(bert), NULL, 0);
+	bcm3510_do_hab_cmd(st, CMD_STATE_CONTROL, MSGID_BERT_CONTROL,
+			   (u8 *) &bert, sizeof(bert), NULL, 0);
+	bcm3510_do_hab_cmd(st, CMD_STATE_CONTROL, MSGID_BERT_SET,
+			   (u8 *) &bert, sizeof(bert), NULL, 0);
 
 	bcm3510_bert_reset(st);
 
@@ -572,8 +608,8 @@ static int bcm3510_set_frontend(struct dvb_frontend *fe)
 	if (ret < 0)
 		return ret;
 
-	memset(&st->status1,0,sizeof(st->status1));
-	memset(&st->status2,0,sizeof(st->status2));
+	memset(&st->status1, 0, sizeof(st->status1));
+	memset(&st->status2, 0, sizeof(st->status2));
 	st->status_check_interval = 500;
 
 /* Give the AP some time */
@@ -582,12 +618,14 @@ static int bcm3510_set_frontend(struct dvb_frontend *fe)
 	return 0;
 }
 
-static int bcm3510_sleep(struct dvb_frontend* fe)
+static int bcm3510_sleep(struct dvb_frontend *fe)
 {
 	return 0;
 }
 
-static int bcm3510_get_tune_settings(struct dvb_frontend *fe, struct dvb_frontend_tune_settings *s)
+static int
+bcm3510_get_tune_settings(struct dvb_frontend *fe,
+			  struct dvb_frontend_tune_settings *s)
 {
 	s->min_delay_ms = 1000;
 	s->step_size = 0;
@@ -595,9 +633,10 @@ static int bcm3510_get_tune_settings(struct dvb_frontend *fe, struct dvb_fronten
 	return 0;
 }
 
-static void bcm3510_release(struct dvb_frontend* fe)
+static void bcm3510_release(struct dvb_frontend *fe)
 {
-	struct bcm3510_state* state = fe->demodulator_priv;
+	struct bcm3510_state *state = fe->demodulator_priv;
+
 	kfree(state);
 }
 
@@ -610,34 +649,45 @@ static void bcm3510_release(struct dvb_frontend* fe)
 static int bcm3510_write_ram(struct bcm3510_state *st, u16 addr, const u8 *b,
 			     u16 len)
 {
-	int ret = 0,i;
-	bcm3510_register_value vH, vL,vD;
+	int ret = 0, i;
+	bcm3510_register_value vH, vL, vD;
 
 	vH.MADRH_a9 = addr >> 8;
 	vL.MADRL_aa = addr;
-	if ((ret = bcm3510_writeB(st,0xa9,vH)) < 0) return ret;
-	if ((ret = bcm3510_writeB(st,0xaa,vL)) < 0) return ret;
+
+	ret = bcm3510_writeB(st, 0xa9, vH);
+	if (ret < 0)
+		return ret;
+
+	ret = bcm3510_writeB(st, 0xaa, vL);
+	if (ret < 0)
+		return ret;
 
 	for (i = 0; i < len; i++) {
 		vD.MDATA_ab = b[i];
-		if ((ret = bcm3510_writeB(st,0xab,vD)) < 0)
+		ret = bcm3510_writeB(st, 0xab, vD);
+		if (ret < 0)
 			return ret;
 	}
 
 	return 0;
 }
 
-static int bcm3510_download_firmware(struct dvb_frontend* fe)
+static int bcm3510_download_firmware(struct dvb_frontend *fe)
 {
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
 	const struct firmware *fw;
-	u16 addr,len;
+	u16 addr, len;
 	const u8 *b;
-	int ret,i;
+	int ret, i;
 
 	deb_info("requesting firmware\n");
-	if ((ret = st->config->request_firmware(fe, &fw, BCM3510_DEFAULT_FIRMWARE)) < 0) {
-		err("could not load firmware (%s): %d",BCM3510_DEFAULT_FIRMWARE,ret);
+
+	ret = st->config->request_firmware(fe, &fw, BCM3510_DEFAULT_FIRMWARE);
+	if (ret < 0) {
+		err("could not load firmware (%s): %d",
+		    BCM3510_DEFAULT_FIRMWARE,
+		    ret);
 		return ret;
 	}
 	deb_info("got firmware: %zu\n", fw->size);
@@ -646,9 +696,11 @@ static int bcm3510_download_firmware(struct dvb_frontend* fe)
 	for (i = 0; i < fw->size;) {
 		addr = le16_to_cpu(*((__le16 *)&b[i]));
 		len  = le16_to_cpu(*((__le16 *)&b[i+2]));
-		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04zx\n",addr,len,fw->size);
-		if ((ret = bcm3510_write_ram(st,addr,&b[i+4],len)) < 0) {
-			err("firmware download failed: %d\n",ret);
+		deb_info("firmware chunk, addr: 0x%04x, len: 0x%04x, total length: 0x%04zx\n",
+			 addr, len, fw->size);
+		ret = bcm3510_write_ram(st, addr, &b[i+4], len);
+		if (ret < 0) {
+			err("firmware download failed: %d\n", ret);
 			return ret;
 		}
 		i += 4 + len;
@@ -661,10 +713,15 @@ static int bcm3510_download_firmware(struct dvb_frontend* fe)
 static int bcm3510_check_firmware_version(struct bcm3510_state *st)
 {
 	struct bcm3510_hab_cmd_get_version_info ver;
-	bcm3510_do_hab_cmd(st,CMD_GET_VERSION_INFO,MSGID_GET_VERSION_INFO,NULL,0,(u8*)&ver,sizeof(ver));
+
+	bcm3510_do_hab_cmd(st, CMD_GET_VERSION_INFO, MSGID_GET_VERSION_INFO,
+			   NULL, 0, (u8*)&ver, sizeof(ver));
 
 	deb_info("Version information: 0x%02x 0x%02x 0x%02x 0x%02x\n",
-		ver.microcode_version, ver.script_version, ver.config_version, ver.demod_version);
+		 ver.microcode_version,
+		 ver.script_version,
+		 ver.config_version,
+		 ver.demod_version);
 
 	if (ver.script_version == BCM3510_DEF_SCRIPT_VERSION &&
 		ver.config_version == BCM3510_DEF_CONFIG_VERSION &&
@@ -682,14 +739,16 @@ static int bcm3510_reset(struct bcm3510_state *st)
 	unsigned long  t;
 	bcm3510_register_value v;
 
-	bcm3510_readB(st,0xa0,&v); v.HCTL1_a0.RESET = 1;
-	if ((ret = bcm3510_writeB(st,0xa0,v)) < 0)
+	bcm3510_readB(st, 0xa0, &v); v.HCTL1_a0.RESET = 1;
+	ret = bcm3510_writeB(st, 0xa0, v);
+	if (ret < 0)
 		return ret;
 
 	t = jiffies + 3*HZ;
 	while (time_before(jiffies, t)) {
 		msleep(10);
-		if ((ret = bcm3510_readB(st,0xa2,&v)) < 0)
+		ret = bcm3510_readB(st, 0xa2, &v);
+		if (ret < 0)
 			return ret;
 
 		if (v.APSTAT1_a2.RESET)
@@ -706,13 +765,16 @@ static int bcm3510_clear_reset(struct bcm3510_state *st)
 	unsigned long t;
 
 	v.raw = 0;
-	if ((ret = bcm3510_writeB(st,0xa0,v)) < 0)
+
+	ret = bcm3510_writeB(st, 0xa0, v);
+	if (ret < 0)
 		return ret;
 
 	t = jiffies + 3*HZ;
 	while (time_before(jiffies, t)) {
 		msleep(10);
-		if ((ret = bcm3510_readB(st,0xa2,&v)) < 0)
+		ret = bcm3510_readB(st, 0xa2, &v);
+		if (ret < 0)
 			return ret;
 
 		/* verify that reset is cleared */
@@ -728,8 +790,11 @@ static int bcm3510_init_cold(struct bcm3510_state *st)
 	int ret;
 	bcm3510_register_value v;
 
-	/* read Acquisation Processor status register and check it is not in RUN mode */
-	if ((ret = bcm3510_readB(st,0xa2,&v)) < 0)
+	/* read Acquisation Processor status register and check it is not in RUN
+	 * mode
+	 */
+	ret = bcm3510_readB(st, 0xa2, &v);
+	if (ret < 0)
 		return ret;
 	if (v.APSTAT1_a2.RUN) {
 		deb_info("AP is already running - firmware already loaded.\n");
@@ -737,13 +802,17 @@ static int bcm3510_init_cold(struct bcm3510_state *st)
 	}
 
 	deb_info("reset?\n");
-	if ((ret = bcm3510_reset(st)) < 0)
+
+	ret = bcm3510_reset(st);
+	if (ret < 0)
 		return ret;
 
 	deb_info("tristate?\n");
 	/* tri-state */
 	v.TSTCTL_2e.CTL = 0;
-	if ((ret = bcm3510_writeB(st,0x2e,v)) < 0)
+
+	ret = bcm3510_writeB(st, 0x2e, v);
+	if (ret < 0)
 		return ret;
 
 	deb_info("firmware?\n");
@@ -751,40 +820,48 @@ static int bcm3510_init_cold(struct bcm3510_state *st)
 		(ret = bcm3510_clear_reset(st)) < 0)
 		return ret;
 
-	/* anything left here to Let the acquisition processor begin execution at program counter 0000 ??? */
+	/* anything left here to Let the acquisition processor begin execution
+	 * at program counter 0000 ???
+	 */
 
 	return 0;
 }
 
-static int bcm3510_init(struct dvb_frontend* fe)
+static int bcm3510_init(struct dvb_frontend *fe)
 {
-	struct bcm3510_state* st = fe->demodulator_priv;
+	struct bcm3510_state *st = fe->demodulator_priv;
+
 	bcm3510_register_value j;
 	struct bcm3510_hab_cmd_set_agc c;
 	int ret;
 
-	if ((ret = bcm3510_readB(st,0xca,&j)) < 0)
+	ret = bcm3510_readB(st, 0xca, &j);
+	if (ret < 0)
 		return ret;
 
-	deb_info("JDEC: %02x\n",j.raw);
+	deb_info("JDEC: %02x\n", j.raw);
 
 	switch (j.JDEC_ca.JDEC) {
-		case JDEC_WAIT_AT_RAM:
+	case JDEC_WAIT_AT_RAM:
 			deb_info("attempting to download firmware\n");
-			if ((ret = bcm3510_init_cold(st)) < 0)
+			ret = bcm3510_init_cold(st);
+			if (ret < 0)
 				return ret;
 			/* fall-through */
-		case JDEC_EEPROM_LOAD_WAIT:
+	case JDEC_EEPROM_LOAD_WAIT:
 			deb_info("firmware is loaded\n");
 			bcm3510_check_firmware_version(st);
 			break;
-		default:
+	default:
 			return -ENODEV;
 	}
 
-	memset(&c,0,1);
+	memset(&c, 0, 1);
 	c.SEL = 1;
-	bcm3510_do_hab_cmd(st,CMD_AUTO_PARAM,MSGID_SET_RF_AGC_SEL,(u8 *)&c,sizeof(c),NULL,0);
+	bcm3510_do_hab_cmd(st,
+			   CMD_AUTO_PARAM,
+			   MSGID_SET_RF_AGC_SEL,
+			   (u8 *)&c, sizeof(c), NULL, 0);
 
 	return 0;
 }
@@ -792,10 +869,11 @@ static int bcm3510_init(struct dvb_frontend* fe)
 
 static const struct dvb_frontend_ops bcm3510_ops;
 
-struct dvb_frontend* bcm3510_attach(const struct bcm3510_config *config,
-				   struct i2c_adapter *i2c)
+struct dvb_frontend *bcm3510_attach(const struct bcm3510_config *config,
+				    struct i2c_adapter *i2c)
 {
-	struct bcm3510_state* state = NULL;
+	struct bcm3510_state *state = NULL;
+
 	int ret;
 	bcm3510_register_value v;
 
@@ -810,21 +888,28 @@ struct dvb_frontend* bcm3510_attach(const struct bcm3510_config *config,
 	state->i2c = i2c;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &bcm3510_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &bcm3510_ops,
+	       sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 
 	mutex_init(&state->hab_mutex);
 
-	if ((ret = bcm3510_readB(state,0xe0,&v)) < 0)
+	ret = bcm3510_readB(state, 0xe0, &v);
+	if (ret < 0)
 		goto error;
 
-	deb_info("Revision: 0x%1x, Layer: 0x%1x.\n",v.REVID_e0.REV,v.REVID_e0.LAYER);
+	deb_info("Revision: 0x%1x, Layer: 0x%1x.\n",
+		 v.REVID_e0.REV,
+		 v.REVID_e0.LAYER);
 
 	if ((v.REVID_e0.REV != 0x1 && v.REVID_e0.LAYER != 0xb) && /* cold */
 		(v.REVID_e0.REV != 0x8 && v.REVID_e0.LAYER != 0x0))   /* warm */
 		goto error;
 
-	info("Revision: 0x%1x, Layer: 0x%1x.",v.REVID_e0.REV,v.REVID_e0.LAYER);
+	info("Revision: 0x%1x, Layer: 0x%1x.",
+	     v.REVID_e0.REV,
+	     v.REVID_e0.LAYER);
 
 	bcm3510_reset(state);
 
@@ -842,11 +927,18 @@ static const struct dvb_frontend_ops bcm3510_ops = {
 		.name = "Broadcom BCM3510 VSB/QAM frontend",
 		.frequency_min_hz =  54 * MHz,
 		.frequency_max_hz = 803 * MHz,
-		.caps =
-			FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
-			FE_CAN_FEC_5_6 | FE_CAN_FEC_7_8 | FE_CAN_FEC_AUTO |
-			FE_CAN_8VSB | FE_CAN_16VSB |
-			FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_128 | FE_CAN_QAM_256
+		.caps =	FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_8VSB |
+			FE_CAN_16VSB |
+			FE_CAN_QAM_16 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_128 |
+			FE_CAN_QAM_256
 	},
 
 	.release = bcm3510_release,
-- 
2.24.0

