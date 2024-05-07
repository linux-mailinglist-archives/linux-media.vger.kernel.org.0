Return-Path: <linux-media+bounces-10937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9186D8BD88E
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A6F8B22BCA
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486EBA59;
	Tue,  7 May 2024 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="dFb5ZDuG"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3713679F0
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041532; cv=none; b=UIYo72BZPzPcTEJy051XwWtqT4mcL0QKI+aMZe2PH4a9bR8WqymODI8JOO6WC2D26G3dbVKWEmAf9Hiu0QKKBH5Bc3ec0tmDH7jGN0DEcAYKlOK+s7duoDu3PNTtRRUuWvJONyStrBmNMp6zZDoYfPwsCRvKX+aie/j0SIzfGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041532; c=relaxed/simple;
	bh=QlfYLJaDSZOnHpRaTpqJOJDYvkDTxKGxdXulZd1DAKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EriYVZl1HzfpuWPIwG/GHocobOElMtQ6nhDpm2PBlIobT5ZouL+67ndhW+4yZBomAnSaE+r5olZh+uJ8QvRe2bfhD38X2ax2OWp3MXv7IcUGNphGvlsWcU7xR2CDHPGlOTM+f7w1D+/IcrRGwXEhsuNDmeKBmcxoPey8+r4ylvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=dFb5ZDuG; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041526; x=1715646326; i=herdler@nurfuerspam.de;
	bh=/o9tSanuJCe6yecdSJ1RmC3+RUcLKPA6pazNEyxhe2Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dFb5ZDuGBoNHZy5tpw8QU1QkUNrE+phLw68EcFN5JKB646R75QOKcwKjJZHXp5CU
	 YYl3z9SEvM9jfB8eCUh2Mwc8aP30uGxKIRk+7O2lkoXslHnHEJXjSj+IHEGud/r/P
	 4L2SBFe++BFpLwM8ts6BnyTIa5PJ9F6Wnfak1DSgmJlY+9KrIWVbotY8aKUWcY2H8
	 vqCSDKKMDwPZIySB+9wkxDqOs9rtzkK1eT3a73ypiJcIXXex8WwBINeYu4oF3bRu8
	 s+3Xi+KI0BwhZJqTRsc5IDVoiimX4PwSVQdA685EIDZwJTBIl760kSnFTjLggRilh
	 n7R4Xjh7H+smMx/08g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma24y-1s9Vrt3pJc-00W0yR; Tue, 07
 May 2024 02:25:26 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 03/21] media: sp8870: coding style fixes: whitespace
Date: Tue,  7 May 2024 02:24:42 +0200
Message-Id: <20240507002500.81867-4-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:Se3LleURTj4+N7ayZxW1JN6GY761OhqJPZtoiGfwUDawN7ft2MT
 BZH3eqnmQrGW/YHXO6nJ9CS4/RkZEdaMUyPYgWwBa9xlDWX3+k2h0FVEj4q/AMeBMq7mxsN
 WvU+7V85XSvPznN3Ypm67BRy3vdA11SKQ0DHrJk+2JRaJg5Ace1inUdVim+pSNc9NTbI4hO
 ttIb2lCBTF88CUvOVRU1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Dza5eeaEC5U=;JeotGqZfrj9p/gjFq1EnsjOrCnR
 9jPhUde2z+2zPJQ5pFRC1+K4g8dTXNURH5FSWI1fKMVbdALwxS6RzFlSj8u/XdYrOhaABTC5g
 yM+0ePJxiHXKbQFFE38aQlNwMfZGiazU37jbO2aoOj4rMkFaqQOXpH9756KU9S+16ZVQ/MHcT
 /BUAuqw0Chwgpf4RS8w4tybT7eweL0kSxL81TTx1I4bwqm8UP5/6oL1bAqa7sMqfekH00iCco
 rAb+Vg5JUt5po3G8dt4adI5nyKPut2rBl/8myLeqFpfkaZ5EfqnElrLPh3jisPlJbdiDD9/nP
 V+ST1RtWooHh2UqNNd5tzTM2RPs4wFrSdj2kLNPZBu8iCu9xsrrYCuJqjUyDgytsvKoFD2vq0
 1fHJYeo5i3ZGLxGuCVlYKQMkmYAftmpsegtlFriqCwdCQ+whzLMD4fYTHRPxmGzpWBGahFAZ5
 ShWlZiPLuI74KH9oXfn+xPAiCxGQUvZmDfQmoJsFv6nIw2IRtq8I2AJy3emZZQ7AVdfw40eXA
 ZUFujc6lJSi78pksqSU1Be/Vo52IDTNfMNZh3qXoVhGOfUFGAOQcykc6Wgwo4xX+KK/TMmC61
 3noWjJzLsnmxNmHSmCVk0ofMDh+c5awDoNem5rPviKNVDFNY2pNA1gcUeXkb4G3ViFXMz9mKj
 6Gm4V8TVhTDWhR0bfLclW+rSffsyk7w2/LndMkaRoFgRjGiAWUyalI3W1kkUqyOtRTlPHkKhk
 fgq6M/t+9D4cn26FcgEDAqwb+HRTAfHO6jF1Ov8g5aNscHkbV/0oTHwZ3WO/8gzdFV8gmxpCE
 AAhZ63UleQV4L5vcxdedTNBjhtwU9d3A1cQrsg3f/nurs=

This patch fixes the following checkpatch warnings:

ERROR:BRACKET_SPACE: space prohibited before open square bracket '['
ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
ERROR:SPACING: space required before the open brace '{'
WARNING:SPACING: space prohibited between function name and open parenthes=
is '('
CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

Whitespace changes only.
"git diff -w" shows no changes.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/sp8870.c | 80 +++++++++++++--------------
 drivers/staging/media/av7110/sp8870.h |  6 +-
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media=
/av7110/sp8870.c
index abf5c7260..4fb8518d2 100644
=2D-- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -28,9 +28,9 @@

 struct sp8870_state {

-	struct i2c_adapter* i2c;
+	struct i2c_adapter *i2c;

-	const struct sp8870_config* config;
+	const struct sp8870_config *config;

 	struct dvb_frontend frontend;

@@ -50,9 +50,9 @@ static int debug;
 /* starting point for firmware in file 'Sc_main.mc' */
 #define SP8870_FIRMWARE_OFFSET 0x0A

-static int sp8870_writereg (struct sp8870_state* state, u16 reg, u16 data=
)
+static int sp8870_writereg(struct sp8870_state *state, u16 reg, u16 data)
 {
-	u8 buf [] =3D { reg >> 8, reg & 0xff, data >> 8, data & 0xff };
+	u8 buf[] =3D { reg >> 8, reg & 0xff, data >> 8, data & 0xff };
 	struct i2c_msg msg =3D { .addr =3D state->config->demod_address, .flags =
=3D 0, .buf =3D buf, .len =3D 4 };
 	int err;

@@ -64,15 +64,15 @@ static int sp8870_writereg (struct sp8870_state* state=
, u16 reg, u16 data)
 	return 0;
 }

-static int sp8870_readreg (struct sp8870_state* state, u16 reg)
+static int sp8870_readreg(struct sp8870_state *state, u16 reg)
 {
 	int ret;
-	u8 b0 [] =3D { reg >> 8 , reg & 0xff };
-	u8 b1 [] =3D { 0, 0 };
+	u8 b0[] =3D { reg >> 8, reg & 0xff };
+	u8 b1[] =3D { 0, 0 };
 	struct i2c_msg msg [] =3D { { .addr =3D state->config->demod_address, .f=
lags =3D 0, .buf =3D b0, .len =3D 2 },
 			   { .addr =3D state->config->demod_address, .flags =3D I2C_M_RD, .buf=
 =3D b1, .len =3D 2 } };

-	ret =3D i2c_transfer (state->i2c, msg, 2);
+	ret =3D i2c_transfer(state->i2c, msg, 2);

 	if (ret !=3D 2) {
 		dprintk("%s: readreg error (ret =3D=3D %i)\n", __func__, ret);
@@ -82,7 +82,7 @@ static int sp8870_readreg (struct sp8870_state* state, u=
16 reg)
 	return (b1[0] << 8 | b1[1]);
 }

-static int sp8870_firmware_upload (struct sp8870_state* state, const stru=
ct firmware *fw)
+static int sp8870_firmware_upload(struct sp8870_state *state, const struc=
t firmware *fw)
 {
 	struct i2c_msg msg;
 	const char *fw_buf =3D fw->data;
@@ -107,7 +107,7 @@ static int sp8870_firmware_upload (struct sp8870_state=
* state, const struct firm

 	// do firmware upload
 	fw_pos =3D SP8870_FIRMWARE_OFFSET;
-	while (fw_pos < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET){
+	while (fw_pos < SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET) {
 		tx_len =3D (fw_pos <=3D SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET -=
 252) ? 252 : SP8870_FIRMWARE_SIZE + SP8870_FIRMWARE_OFFSET - fw_pos;
 		// write register 0xCF0A
 		tx_buf[0] =3D 0xCF;
@@ -129,7 +129,7 @@ static int sp8870_firmware_upload (struct sp8870_state=
* state, const struct firm
 	return 0;
 };

-static void sp8870_microcontroller_stop (struct sp8870_state* state)
+static void sp8870_microcontroller_stop(struct sp8870_state *state)
 {
 	sp8870_writereg(state, 0x0F08, 0x000);
 	sp8870_writereg(state, 0x0F09, 0x000);
@@ -138,7 +138,7 @@ static void sp8870_microcontroller_stop (struct sp8870=
_state* state)
 	sp8870_writereg(state, 0x0F00, 0x000);
 }

-static void sp8870_microcontroller_start (struct sp8870_state* state)
+static void sp8870_microcontroller_start(struct sp8870_state *state)
 {
 	sp8870_writereg(state, 0x0F08, 0x000);
 	sp8870_writereg(state, 0x0F09, 0x000);
@@ -150,12 +150,12 @@ static void sp8870_microcontroller_start (struct sp8=
870_state* state)
 	sp8870_readreg(state, 0x0D01);
 }

-static int sp8870_read_data_valid_signal(struct sp8870_state* state)
+static int sp8870_read_data_valid_signal(struct sp8870_state *state)
 {
 	return (sp8870_readreg(state, 0x0D02) > 0);
 }

-static int configure_reg0xc05 (struct dtv_frontend_properties *p, u16 *re=
g0xc05)
+static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg=
0xc05)
 {
 	int known_parameters =3D 1;

@@ -226,7 +226,7 @@ static int configure_reg0xc05 (struct dtv_frontend_pro=
perties *p, u16 *reg0xc05)
 	return 0;
 }

-static int sp8870_wake_up(struct sp8870_state* state)
+static int sp8870_wake_up(struct sp8870_state *state)
 {
 	// enable TS output and interface pins
 	return sp8870_writereg(state, 0xC18, 0x00D);
@@ -235,7 +235,7 @@ static int sp8870_wake_up(struct sp8870_state* state)
 static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;
 	int  err;
 	u16 reg0xc05;

@@ -290,9 +290,9 @@ static int sp8870_set_frontend_parameters(struct dvb_f=
rontend *fe)
 	return 0;
 }

-static int sp8870_init (struct dvb_frontend* fe)
+static int sp8870_init(struct dvb_frontend *fe)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;
 	const struct firmware *fw =3D NULL;

 	sp8870_wake_up(state);
@@ -342,17 +342,17 @@ static int sp8870_init (struct dvb_frontend* fe)
 static int sp8870_read_status(struct dvb_frontend *fe,
 			      enum fe_status *fe_status)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;
 	int status;
 	int signal;

 	*fe_status =3D 0;

-	status =3D sp8870_readreg (state, 0x0200);
+	status =3D sp8870_readreg(state, 0x0200);
 	if (status < 0)
 		return -EIO;

-	signal =3D sp8870_readreg (state, 0x0303);
+	signal =3D sp8870_readreg(state, 0x0303);
 	if (signal < 0)
 		return -EIO;

@@ -366,9 +366,9 @@ static int sp8870_read_status(struct dvb_frontend *fe,
 	return 0;
 }

-static int sp8870_read_ber (struct dvb_frontend* fe, u32 * ber)
+static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;
 	int ret;
 	u32 tmp;

@@ -393,21 +393,21 @@ static int sp8870_read_ber (struct dvb_frontend* fe,=
 u32 * ber)
 	return 0;
 }

-static int sp8870_read_signal_strength(struct dvb_frontend* fe,  u16 * si=
gnal)
+static int sp8870_read_signal_strength(struct dvb_frontend *fe,  u16 *sig=
nal)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;
 	int ret;
 	u16 tmp;

 	*signal =3D 0;

-	ret =3D sp8870_readreg (state, 0x306);
+	ret =3D sp8870_readreg(state, 0x306);
 	if (ret < 0)
 		return -EIO;

 	tmp =3D ret << 8;

-	ret =3D sp8870_readreg (state, 0x303);
+	ret =3D sp8870_readreg(state, 0x303);
 	if (ret < 0)
 		return -EIO;

@@ -419,9 +419,9 @@ static int sp8870_read_signal_strength(struct dvb_fron=
tend* fe,  u16 * signal)
 	return 0;
 }

-static int sp8870_read_uncorrected_blocks (struct dvb_frontend* fe, u32* =
ublocks)
+static int sp8870_read_uncorrected_blocks(struct dvb_frontend *fe, u32 *u=
blocks)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;
 	int ret;

 	*ublocks =3D 0;
@@ -451,7 +451,7 @@ static int switches;
 static int sp8870_set_frontend(struct dvb_frontend *fe)
 {
 	struct dtv_frontend_properties *p =3D &fe->dtv_property_cache;
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;

 	/*
 	    The firmware of the sp8870 sometimes locks up after setting frontend=
 parameters.
@@ -507,15 +507,15 @@ static int sp8870_set_frontend(struct dvb_frontend *=
fe)
 	return 0;
 }

-static int sp8870_sleep(struct dvb_frontend* fe)
+static int sp8870_sleep(struct dvb_frontend *fe)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;

 	// tristate TS output and disable interface pins
 	return sp8870_writereg(state, 0xC18, 0x000);
 }

-static int sp8870_get_tune_settings(struct dvb_frontend* fe, struct dvb_f=
rontend_tune_settings* fesettings)
+static int sp8870_get_tune_settings(struct dvb_frontend *fe, struct dvb_f=
rontend_tune_settings *fesettings)
 {
 	fesettings->min_delay_ms =3D 350;
 	fesettings->step_size =3D 0;
@@ -523,9 +523,9 @@ static int sp8870_get_tune_settings(struct dvb_fronten=
d* fe, struct dvb_frontend
 	return 0;
 }

-static int sp8870_i2c_gate_ctrl(struct dvb_frontend* fe, int enable)
+static int sp8870_i2c_gate_ctrl(struct dvb_frontend *fe, int enable)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;

 	if (enable) {
 		return sp8870_writereg(state, 0x206, 0x001);
@@ -534,18 +534,18 @@ static int sp8870_i2c_gate_ctrl(struct dvb_frontend*=
 fe, int enable)
 	}
 }

-static void sp8870_release(struct dvb_frontend* fe)
+static void sp8870_release(struct dvb_frontend *fe)
 {
-	struct sp8870_state* state =3D fe->demodulator_priv;
+	struct sp8870_state *state =3D fe->demodulator_priv;
 	kfree(state);
 }

 static const struct dvb_frontend_ops sp8870_ops;

-struct dvb_frontend* sp8870_attach(const struct sp8870_config* config,
-				   struct i2c_adapter* i2c)
+struct dvb_frontend *sp8870_attach(const struct sp8870_config *config,
+				   struct i2c_adapter *i2c)
 {
-	struct sp8870_state* state =3D NULL;
+	struct sp8870_state *state =3D NULL;

 	/* allocate memory for the internal state */
 	state =3D kzalloc(sizeof(struct sp8870_state), GFP_KERNEL);
diff --git a/drivers/staging/media/av7110/sp8870.h b/drivers/staging/media=
/av7110/sp8870.h
index 5eacf39f4..2d125c8f2 100644
=2D-- a/drivers/staging/media/av7110/sp8870.h
+++ b/drivers/staging/media/av7110/sp8870.h
@@ -19,15 +19,15 @@ struct sp8870_config
 	u8 demod_address;

 	/* request firmware for device */
-	int (*request_firmware)(struct dvb_frontend* fe, const struct firmware *=
*fw, char* name);
+	int (*request_firmware)(struct dvb_frontend *fe, const struct firmware *=
*fw, char *name);
 };

 #if IS_REACHABLE(CONFIG_DVB_SP8870)
 extern struct dvb_frontend* sp8870_attach(const struct sp8870_config* con=
fig,
 					  struct i2c_adapter* i2c);
 #else
-static inline struct dvb_frontend* sp8870_attach(const struct sp8870_conf=
ig* config,
-					  struct i2c_adapter* i2c)
+static inline struct dvb_frontend *sp8870_attach(const struct sp8870_conf=
ig *config,
+						 struct i2c_adapter *i2c)
 {
 	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
=2D-
2.34.0


