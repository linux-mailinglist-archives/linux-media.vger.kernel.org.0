Return-Path: <linux-media+bounces-10936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F158BD88D
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222EF1F232E4
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5076FA5F;
	Tue,  7 May 2024 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="A6iyJANz"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866679EA
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041532; cv=none; b=l0OL1AQ1Af7GODGJK0sR8bUixswgAScoeBwvmBBf1gcVcPefOhTC8hvJgxH+NJFaVVzkcA4SlMckSCbqwIiyaG7K6lXhlIjKDMYv9N41BlZkhcvnTcZdYSdjWMl4MCkeDL/f04DSrv5vgm9IEhuPqh+1nHqgBV/7GdGqx/+RleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041532; c=relaxed/simple;
	bh=wE0PMf90UbS05DBxYx67N2rPFc4cLzgAaH+e/csKs1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JFu1Qg0nwyOPUcqxMl4VUYduqd703ultz/TOcL263M/luo7PfC1kv8MM9ePdc5ynNcDVHwqZ/+ZnfxHgId+/FIJTekz/TwyhutVg1ZshUaX2qdqdfMfM9cxxESNYInaj0l9/wtnO/hDZlEEP2dJlbTA4g6ElssjPJmPhuuGaXZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=A6iyJANz; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041526; x=1715646326; i=herdler@nurfuerspam.de;
	bh=aThl7X8mE/f2OZ2PVg5AgPTumQ/wRz3cNR4HqrZdySA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A6iyJANzE02cQKqJ8vc/dJGTiEd0gt1pyjypyOpXVsGFtyu/wrdb2Cg0tn7bCucR
	 BilNIVJFo4tvObXYuOjF5o1NEEqfW1+UZAy5R68h6pF8hdgsIJ5oSl5D/jghxNnUl
	 yqWGu7uWKjR9aopvW3CRbl/SmwHYSdcyemGFA2H3hwjfrd8rRc0wOZhXap2nTGVLD
	 TvAHaerSIb6fkhBDgSaM6jPI3ISAFnYdLK1zo2D78RtryiXIo4mh3potdsFFbHdK7
	 GI2/W7pA/YmIAaul3eNpfLoWY/Hhtoq3aNrjrrWGdkDqT4ft7YN/VCDeoRxx+3qhp
	 Qb3i9xOR/wNEmw8AZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1sDO1U0bv0-00R51x; Tue, 07
 May 2024 02:25:26 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 04/21] media: sp8870: coding style fixes: newline, comments and braces
Date: Tue,  7 May 2024 02:24:43 +0200
Message-Id: <20240507002500.81867-5-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20240507002500.81867-1-herdler@nurfuerspam.de>
References: <20240507002500.81867-1-herdler@nurfuerspam.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T3mPTbm0FS+nAzJ9ogFb5tEHajSLoHZMIguY4PAESwxi1tccPNC
 nAUDHVbpyXZ/SUAOU7gv2vkqPOh80B59+0i8PgHo9WiTDlsRL10vBbSas1212Hddzocfslc
 v5t2wUMaQuzk4RUmBtnN+hXhasq0ybsIMwzzRRW2h3wheKZP+BpOk0SCCVwDAk2A6cB1Yrg
 hv/lv/o6EBeVAi+Wx/XBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pupaWg+FfbM=;LvQYhxevC3yj+Ez2EvYNPNeF0v+
 AVxiVQ6I2or9rCjqPvBxzdZJO/ePM39CmHhAoIeKW/9Yuvf1BJt3oZt6BDjz0tAQckHjLzgyl
 ZBhp7sAxq9elBLSrBLXEa0LnEQeD+jOxp2BmPoT+rnOXlsdiyu4PZ82Gij7Xrh3/40moZTkCt
 /M4nJmCLPcooQrkjRfhodo/To9xrOZiX+NI9earWDdFiwnfOYC3iYCAPE47gPM+brmgz/verG
 PEDarpMempe4d215ZdZi3yUsSn9+xinmEwlcjqQP5bF1zb/rtiE8GNwIallra+nArWUtUApH9
 J/xRC3IKqX5Z25G7+WtKxk9n3kTjeVJ8+N+qHukoei4RRiredP1wD4BjnaZGM/oSYhxW2hpXk
 gmzkk6dIse4xQtQWuzOnrh9leiAJcW+9qb7xqqpx4W0gZKV7z55JkyBg9UbiZx5n/a9tF+5nl
 yfAMxqCzGbls85a8SzdoCWPCvJpilk+SqKHq+oycYUuuEVo6cmv0pg9mxmKroLHrYxH9kzwVr
 Vz52CkGE3cMosfcqP2Q9q6uiFIrhb/NWIi4oSGLtUX8NOFDORf7De2xS6/jULLmQU87JTQCCV
 NRbcZIrjsuSNxhZICRKstuOlrLxv0eI53BpV+Pz1Y80bhows3NJyyGUPmtc4SOP8IKcFhfwUp
 1NUG4hdk0fto0DSbf6jMQH9GSSiyXtX1Iery8vJSokDfph7I8ZhdCjivDv0zd8PEw418rxQSq
 VW/Qd9VNiFWAz++alhdYBHKDJf9zrCd4bzPu6E9vQZe6+2NuFVQKX6oRkpEeHf0Eq+dIB7LIL
 Baqz5j2sGBxGSA8Hy4HBZmBa+IRkMbcHGs6uvMWhSTs/Y=

This patch fixes the following checkpatch warnings:

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
ERROR:TRAILING_STATEMENTS: trailing statements should be on next line [*]
WARNING:LINE_SPACING: Missing a blank line after declarations
WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separat=
e line
WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
CHECK:LINE_SPACING: Please don't use multiple blank lines
CHECK:LINE_SPACING: Please use a blank line after function/struct/union/en=
um declarations

Except the 2 comment-blocks, newline changes only.
[* The remaining trailing statement will be fixed in the logging patch.]

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/sp8870.c | 50 ++++++++++++++++-----------
 drivers/staging/media/av7110/sp8870.h | 13 +++----
 2 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media=
/av7110/sp8870.c
index 4fb8518d2..4e2a1cbd4 100644
=2D-- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -1,11 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
-    Driver for Spase SP8870 demodulator
-
-    Copyright (C) 1999 Juergen Peitz
-
+ *  Driver for Spase SP8870 demodulator
+.*
+ *  Copyright (C) 1999 Juergen Peitz
+ */

-*/
 /*
  * This driver needs external firmware. Please use the command
  * "<kerneldir>/scripts/get_dvb_firmware alps_tdlb7" to
@@ -25,9 +24,7 @@
 #include <media/dvb_frontend.h>
 #include "sp8870.h"

-
 struct sp8870_state {
-
 	struct i2c_adapter *i2c;

 	const struct sp8870_config *config;
@@ -53,7 +50,13 @@ static int debug;
 static int sp8870_writereg(struct sp8870_state *state, u16 reg, u16 data)
 {
 	u8 buf[] =3D { reg >> 8, reg & 0xff, data >> 8, data & 0xff };
-	struct i2c_msg msg =3D { .addr =3D state->config->demod_address, .flags =
=3D 0, .buf =3D buf, .len =3D 4 };
+	struct i2c_msg msg =3D {
+		.addr =3D state->config->demod_address,
+		.flags =3D 0,
+		.buf =3D buf,
+		.len =3D 4
+	};
+
 	int err;

 	if ((err =3D i2c_transfer (state->i2c, &msg, 1)) !=3D 1) {
@@ -69,8 +72,10 @@ static int sp8870_readreg(struct sp8870_state *state, u=
16 reg)
 	int ret;
 	u8 b0[] =3D { reg >> 8, reg & 0xff };
 	u8 b1[] =3D { 0, 0 };
-	struct i2c_msg msg [] =3D { { .addr =3D state->config->demod_address, .f=
lags =3D 0, .buf =3D b0, .len =3D 2 },
-			   { .addr =3D state->config->demod_address, .flags =3D I2C_M_RD, .buf=
 =3D b1, .len =3D 2 } };
+	struct i2c_msg msg[] =3D {
+		{ .addr =3D state->config->demod_address, .flags =3D 0, .buf =3D b0, .l=
en =3D 2 },
+		{ .addr =3D state->config->demod_address, .flags =3D I2C_M_RD, .buf =3D=
 b1, .len =3D 2 }
+	};

 	ret =3D i2c_transfer(state->i2c, msg, 2);

@@ -108,7 +113,8 @@ static int sp8870_firmware_upload(struct sp8870_state =
*state, const struct firmw
 	// do firmware upload
 	fw_pos =3D SP8870_FIRMWARE_OFFSET;
 	while (fw_pos < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET) {
-		tx_len =3D (fw_pos <=3D SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET -=
 252) ? 252 : SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - fw_pos;
+		tx_len =3D (fw_pos <=3D SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET -=
 252) ? 252 :
+			 SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - fw_pos;
 		// write register 0xCF0A
 		tx_buf[0] =3D 0xCF;
 		tx_buf[1] =3D 0x0A;
@@ -248,7 +254,8 @@ static int sp8870_set_frontend_parameters(struct dvb_f=
rontend *fe)
 	// set tuner parameters
 	if (fe->ops.tuner_ops.set_params) {
 		fe->ops.tuner_ops.set_params(fe);
-		if (fe->ops.i2c_gate_ctrl) fe->ops.i2c_gate_ctrl(fe, 0);
+		if (fe->ops.i2c_gate_ctrl)
+			fe->ops.i2c_gate_ctrl(fe, 0);
 	}

 	// sample rate correction bit [23..17]
@@ -296,12 +303,12 @@ static int sp8870_init(struct dvb_frontend *fe)
 	const struct firmware *fw =3D NULL;

 	sp8870_wake_up(state);
-	if (state->initialised) return 0;
+	if (state->initialised)
+		return 0;
 	state->initialised =3D 1;

 	dprintk ("%s\n", __func__);

-
 	/* request the firmware, this will block until someone uploads it */
 	printk("sp8870: waiting for firmware upload (%s)...\n", SP8870_DEFAULT_F=
IRMWARE);
 	if (state->config->request_firmware(fe, &fw, SP8870_DEFAULT_FIRMWARE)) {
@@ -454,11 +461,11 @@ static int sp8870_set_frontend(struct dvb_frontend *=
fe)
 	struct sp8870_state *state =3D fe->demodulator_priv;

 	/*
-	    The firmware of the sp8870 sometimes locks up after setting frontend=
 parameters.
-	    We try to detect this by checking the data valid signal.
-	    If it is not set after MAXCHECKS we try to recover the lockup by set=
ting
-	    the frontend parameters again.
-	*/
+	 *  The firmware of the sp8870 sometimes locks up after setting frontend=
 parameters.
+	 *  We try to detect this by checking the data valid signal.
+	 *  If it is not set after MAXCHECKS we try to recover the lockup by set=
ting
+	 *  the frontend parameters again.
+	 */

 	int err =3D 0;
 	int valid =3D 0;
@@ -468,7 +475,6 @@ static int sp8870_set_frontend(struct dvb_frontend *fe=
)
 	dprintk("%s: frequency =3D %i\n", __func__, p->frequency);

 	for (trials =3D 1; trials <=3D MAXTRIALS; trials++) {
-
 		err =3D sp8870_set_frontend_parameters(fe);
 		if (err)
 			return err;
@@ -537,6 +543,7 @@ static int sp8870_i2c_gate_ctrl(struct dvb_frontend *f=
e, int enable)
 static void sp8870_release(struct dvb_frontend *fe)
 {
 	struct sp8870_state *state =3D fe->demodulator_priv;
+
 	kfree(state);
 }

@@ -557,7 +564,8 @@ struct dvb_frontend *sp8870_attach(const struct sp8870=
_config *config,
 	state->initialised =3D 0;

 	/* check if the demod is there */
-	if (sp8870_readreg(state, 0x0200) < 0) goto error;
+	if (sp8870_readreg(state, 0x0200) < 0)
+		goto error;

 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &sp8870_ops, sizeof(struct dvb_frontend_ops=
));
diff --git a/drivers/staging/media/av7110/sp8870.h b/drivers/staging/media=
/av7110/sp8870.h
index 2d125c8f2..2cfee1bb6 100644
=2D-- a/drivers/staging/media/av7110/sp8870.h
+++ b/drivers/staging/media/av7110/sp8870.h
@@ -1,11 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
-    Driver for Spase SP8870 demodulator
-
-    Copyright (C) 1999 Juergen Peitz
-
-
-*/
+ *  Driver for Spase SP8870 demodulator
+ *
+ *  Copyright (C) 1999 Juergen Peitz
+ */

 #ifndef SP8870_H
 #define SP8870_H
@@ -13,8 +11,7 @@
 #include <linux/dvb/frontend.h>
 #include <linux/firmware.h>

-struct sp8870_config
-{
+struct sp8870_config {
 	/* the demodulator's i2c address */
 	u8 demod_address;

=2D-
2.34.0


