Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF0B514FAC0
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 22:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgBAVsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 16:48:38 -0500
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:62130 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbgBAVsi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Feb 2020 16:48:38 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 0EADD580BBF;
        Sat,  1 Feb 2020 21:48:36 +0000 (UTC)
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (100-96-10-4.trex.outbound.svc.cluster.local [100.96.10.4])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 6EC12580C01;
        Sat,  1 Feb 2020 21:48:35 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a33.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Sat, 01 Feb 2020 21:48:36 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Decisive-Illegal: 4d1d816605169eef_1580593715904_4227064481
X-MC-Loop-Signature: 1580593715904:1753791698
X-MC-Ingress-Time: 1580593715903
Received: from pdx1-sub0-mail-a33.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTP id 45A227FE29;
        Sat,  1 Feb 2020 13:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        luKqM65/4MQV740obZcQ0vBcdwY=; b=HvM4Vw3QzGWolvK2Fz9kxs2h3/Fg9LAH
        v2BwhU0sCxvvRraa2DYwxvGGfuVTKAMEx9d+Khq3O+6WXQsN3G9QdC4BBUvYHs7j
        XMEBDASp202SrtlBNYXw+567IzekhzJpEpCyHC33ZsnYaN7ZTy2VbY4SnXSndzz+
        Z95ovAxSEYg=
Received: from localhost.localdomain (66-90-181-52.dyn.grandenetworks.net [66.90.181.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a33.g.dreamhost.com (Postfix) with ESMTPSA id A3FDF7FE24;
        Sat,  1 Feb 2020 13:48:30 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a33
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH 1/3] m88ds3103: Add support for ds3103b demod
Date:   Sat,  1 Feb 2020 15:48:24 -0600
Message-Id: <20200201214826.22873-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200201214826.22873-1-brad@nextdimension.cc>
References: <20200201214826.22873-1-brad@nextdimension.cc>
MIME-Version: 1.0
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: 30
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgedvgdduheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqeenucffohhmrghinhepihhnfhhordhnrghmvgenucfkphepieeirdeltddrudekuddrhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeeiiedrledtrddukedurdehvddprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggt
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ds3103b demodulator identifies as an m88rs600, but requires different
clock settings and firmware, along with differences in register settings.

Changes were reverse engineered using an instrumented downstream GPLv2
driver to compare i2c traffic and clocking. The mclk functions are from
the downstream GPLv2 driver.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 drivers/media/dvb-frontends/m88ds3103.c      | 466 ++++++++++++++++++-
 drivers/media/dvb-frontends/m88ds3103_priv.h |  14 +-
 2 files changed, 467 insertions(+), 13 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-=
frontends/m88ds3103.c
index c96f05ff5f2f..baf21b999ccc 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -64,6 +64,92 @@ static int m88ds3103_wr_reg_val_tab(struct m88ds3103_d=
ev *dev,
 	return ret;
 }
=20
+/*
+ * m88ds3103b demod has an internal device related to clocking. First th=
e i2c
+ * gate must be opened, for one transaction, then writes will be allowed=
.
+ */
+static int m88ds3103b_dt_write(struct m88ds3103_dev *dev, int reg, int d=
ata)
+{
+	struct i2c_client *client =3D dev->client;
+	u8 buf[] =3D {reg, data};
+	u8 val;
+	int ret;
+	struct i2c_msg msg =3D {
+		.addr =3D dev->dt_addr, .flags =3D 0, .buf =3D buf, .len =3D 2
+	};
+
+	m88ds3103_update_bits(dev, 0x11, 0x01, 0x00);
+
+	val =3D 0x11;
+	ret =3D regmap_write(dev->regmap, 0x03, val);
+	if (ret)
+		dev_dbg(&client->dev, "fail=3D%d\n", ret);
+
+	ret =3D i2c_transfer(dev->dt_client->adapter, &msg, 1);
+	if (ret !=3D 1) {
+		dev_err(&client->dev, "0x%02x (ret=3D%i, reg=3D0x%02x, value=3D0x%02x)=
\n",
+			dev->dt_addr, ret, reg, data);
+
+		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+		return -EREMOTEIO;
+	}
+	m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+
+	dev_dbg(&client->dev, "0x%02x reg 0x%02x, value 0x%02x\n",
+		dev->dt_addr, reg, data);
+
+	return 0;
+}
+
+/*
+ * m88ds3103b demod has an internal device related to clocking. First th=
e i2c
+ * gate must be opened, for two transactions, then reads will be allowed=
.
+ */
+static int m88ds3103b_dt_read(struct m88ds3103_dev *dev, u8 reg)
+{
+	struct i2c_client *client =3D dev->client;
+	int ret;
+	u8 val;
+	u8 b0[] =3D { reg };
+	u8 b1[] =3D { 0 };
+	struct i2c_msg msg[] =3D {
+		{
+			.addr =3D dev->dt_addr,
+			.flags =3D 0,
+			.buf =3D b0,
+			.len =3D 1
+		},
+		{
+			.addr =3D dev->dt_addr,
+			.flags =3D I2C_M_RD,
+			.buf =3D b1,
+			.len =3D 1
+		}
+	};
+
+	m88ds3103_update_bits(dev, 0x11, 0x01, 0x00);
+
+	val =3D 0x12;
+	ret =3D regmap_write(dev->regmap, 0x03, val);
+	if (ret)
+		dev_dbg(&client->dev, "fail=3D%d\n", ret);
+
+	ret =3D i2c_transfer(dev->dt_client->adapter, msg, 2);
+	if (ret !=3D 2) {
+		dev_err(&client->dev, "0x%02x (ret=3D%d, reg=3D0x%02x)\n",
+			dev->dt_addr, ret, reg);
+
+		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+		return -EREMOTEIO;
+	}
+	m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+
+	dev_dbg(&client->dev, "0x%02x reg 0x%02x, value 0x%02x\n",
+		dev->dt_addr, reg, b1[0]);
+
+	return b1[0];
+}
+
 /*
  * Get the demodulator AGC PWM voltage setting supplied to the tuner.
  */
@@ -288,6 +374,253 @@ static int m88ds3103_read_status(struct dvb_fronten=
d *fe,
 	return ret;
 }
=20
+static int m88ds3103b_select_mclk(struct m88ds3103_dev *dev)
+{
+	struct i2c_client *client =3D dev->client;
+	struct dtv_frontend_properties *c =3D &dev->fe.dtv_property_cache;
+	u32 adc_Freq_MHz[3] =3D {96, 93, 99};
+	u8  reg16_list[3] =3D {96, 92, 100}, reg16, reg15;
+	u32 offset_MHz[3];
+	u32 max_offset =3D 0;
+	u32 old_setting =3D dev->mclk;
+	u32 tuner_freq_MHz =3D c->frequency / 1000;
+	u8 i;
+	char big_symbol =3D 0;
+
+	big_symbol =3D (c->symbol_rate > 45010000) ? 1 : 0;
+
+	if (big_symbol) {
+		reg16 =3D 115;
+	} else {
+		reg16 =3D 96;
+
+		/* TODO: IS THIS NECESSARY ? */
+		for (i =3D 0; i < 3; i++) {
+			offset_MHz[i] =3D tuner_freq_MHz % adc_Freq_MHz[i];
+
+			if (offset_MHz[i] > (adc_Freq_MHz[i] / 2))
+				offset_MHz[i] =3D adc_Freq_MHz[i] - offset_MHz[i];
+
+			if (offset_MHz[i] > max_offset) {
+				max_offset =3D offset_MHz[i];
+				reg16 =3D reg16_list[i];
+				dev->mclk =3D adc_Freq_MHz[i] * 1000 * 1000;
+
+				if (big_symbol)
+					dev->mclk /=3D 2;
+
+				dev_dbg(&client->dev, "modifying mclk %u -> %u\n",
+					old_setting, dev->mclk);
+			}
+		}
+	}
+
+	if (dev->mclk =3D=3D 93000000)
+		regmap_write(dev->regmap, 0xA0, 0x42);
+	else if (dev->mclk =3D=3D 96000000)
+		regmap_write(dev->regmap, 0xA0, 0x44);
+	else if (dev->mclk =3D=3D 99000000)
+		regmap_write(dev->regmap, 0xA0, 0x46);
+	else if (dev->mclk =3D=3D 110250000)
+		regmap_write(dev->regmap, 0xA0, 0x4E);
+	else
+		regmap_write(dev->regmap, 0xA0, 0x44);
+
+	reg15 =3D m88ds3103b_dt_read(dev, 0x15);
+
+	m88ds3103b_dt_write(dev, 0x05, 0x40);
+	m88ds3103b_dt_write(dev, 0x11, 0x08);
+
+	if (big_symbol)
+		reg15 |=3D 0x02;
+	else
+		reg15 &=3D ~0x02;
+
+	m88ds3103b_dt_write(dev, 0x15, reg15);
+	m88ds3103b_dt_write(dev, 0x16, reg16);
+
+	usleep_range(5000, 5500);
+
+	m88ds3103b_dt_write(dev, 0x05, 0x00);
+	m88ds3103b_dt_write(dev, 0x11, (u8)(big_symbol ? 0x0E : 0x0A));
+
+	usleep_range(5000, 5500);
+
+	return 0;
+}
+
+static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
+{
+	u8 reg11 =3D 0x0A, reg15, reg16, reg1D, reg1E, reg1F, tmp;
+	u8 sm, f0 =3D 0, f1 =3D 0, f2 =3D 0, f3 =3D 0, pll_ldpc_mode;
+	u16 pll_div_fb, N;
+	u32 div;
+
+	reg15 =3D m88ds3103b_dt_read(dev, 0x15);
+	reg16 =3D m88ds3103b_dt_read(dev, 0x16);
+	reg1D =3D m88ds3103b_dt_read(dev, 0x1D);
+
+	if (dev->cfg->ts_mode !=3D M88DS3103_TS_SERIAL) {
+		if (reg16 =3D=3D 92)
+			tmp =3D 93;
+		else if (reg16 =3D=3D 100)
+			tmp =3D 99;
+		else
+			tmp =3D 96;
+
+		mclk_khz *=3D tmp;
+		mclk_khz /=3D 96;
+	}
+
+	pll_ldpc_mode =3D (reg15 >> 1) & 0x01;
+
+	pll_div_fb =3D (reg15 & 0x01) << 8;
+	pll_div_fb +=3D reg16;
+	pll_div_fb +=3D 32;
+
+	div =3D 9000 * pll_div_fb * 4;
+	div /=3D mclk_khz;
+
+	if (dev->cfg->ts_mode =3D=3D M88DS3103_TS_SERIAL) {
+		reg11 |=3D 0x02;
+
+		if (div <=3D 32) {
+			N =3D 2;
+
+			f0 =3D 0;
+			f1 =3D div / N;
+			f2 =3D div - f1;
+			f3 =3D 0;
+		} else if (div <=3D 34) {
+			N =3D 3;
+
+			f0 =3D div / N;
+			f1 =3D (div - f0) / (N - 1);
+			f2 =3D div - f0 - f1;
+			f3 =3D 0;
+		} else if (div <=3D 64) {
+			N =3D 4;
+
+			f0 =3D div / N;
+			f1 =3D (div - f0) / (N - 1);
+			f2 =3D (div - f0 - f1) / (N - 2);
+			f3 =3D div - f0 - f1 - f2;
+		} else {
+			N =3D 4;
+
+			f0 =3D 16;
+			f1 =3D 16;
+			f2 =3D 16;
+			f3 =3D 16;
+		}
+
+		if (f0 =3D=3D 16)
+			f0 =3D 0;
+		else if ((f0 < 8) && (f0 !=3D 0))
+			f0 =3D 8;
+
+		if (f1 =3D=3D 16)
+			f1 =3D 0;
+		else if ((f1 < 8) && (f1 !=3D 0))
+			f1 =3D 8;
+
+		if (f2 =3D=3D 16)
+			f2 =3D 0;
+		else if ((f2 < 8) && (f2 !=3D 0))
+			f2 =3D 8;
+
+		if (f3 =3D=3D 16)
+			f3 =3D 0;
+		else if ((f3 < 8) && (f3 !=3D 0))
+			f3 =3D 8;
+	} else {
+		reg11 &=3D ~0x02;
+
+		if (div <=3D 32) {
+			N =3D 2;
+
+			f0 =3D 0;
+			f1 =3D div / N;
+			f2 =3D div - f1;
+			f3 =3D 0;
+		} else if (div <=3D 48) {
+			N =3D 3;
+
+			f0 =3D div / N;
+			f1 =3D (div - f0) / (N - 1);
+			f2 =3D div - f0 - f1;
+			f3 =3D 0;
+		} else if (div <=3D 64) {
+			N =3D 4;
+
+			f0 =3D div / N;
+			f1 =3D (div - f0) / (N - 1);
+			f2 =3D (div - f0 - f1) / (N - 2);
+			f3 =3D div - f0 - f1 - f2;
+		} else {
+			N =3D 4;
+
+			f0 =3D 16;
+			f1 =3D 16;
+			f2 =3D 16;
+			f3 =3D 16;
+		}
+
+		if (f0 =3D=3D 16)
+			f0 =3D 0;
+		else if ((f0 < 9) && (f0 !=3D 0))
+			f0 =3D 9;
+
+		if (f1 =3D=3D 16)
+			f1 =3D 0;
+		else if ((f1 < 9) && (f1 !=3D 0))
+			f1 =3D 9;
+
+		if (f2 =3D=3D 16)
+			f2 =3D 0;
+		else if ((f2 < 9) && (f2 !=3D 0))
+			f2 =3D 9;
+
+		if (f3 =3D=3D 16)
+			f3 =3D 0;
+		else if ((f3 < 9) && (f3 !=3D 0))
+			f3 =3D 9;
+	}
+
+	sm =3D N - 1;
+
+	/* Write to registers */
+	//reg15 &=3D 0x01;
+	//reg15 |=3D (pll_div_fb >> 8) & 0x01;
+
+	//reg16 =3D pll_div_fb & 0xFF;
+
+	reg1D &=3D ~0x03;
+	reg1D |=3D sm;
+	reg1D |=3D 0x80;
+
+	reg1E =3D ((f3 << 4) + f2) & 0xFF;
+	reg1F =3D ((f1 << 4) + f0) & 0xFF;
+
+	m88ds3103b_dt_write(dev, 0x05, 0x40);
+	m88ds3103b_dt_write(dev, 0x11, 0x08);
+	m88ds3103b_dt_write(dev, 0x1D, reg1D);
+	m88ds3103b_dt_write(dev, 0x1E, reg1E);
+	m88ds3103b_dt_write(dev, 0x1F, reg1F);
+
+	m88ds3103b_dt_write(dev, 0x17, 0xc1);
+	m88ds3103b_dt_write(dev, 0x17, 0x81);
+
+	usleep_range(5000, 5500);
+
+	m88ds3103b_dt_write(dev, 0x05, 0x00);
+	m88ds3103b_dt_write(dev, 0x11, 0x0A);
+
+	usleep_range(5000, 5500);
+
+	return 0;
+}
+
 static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 {
 	struct m88ds3103_dev *dev =3D fe->demodulator_priv;
@@ -298,7 +631,7 @@ static int m88ds3103_set_frontend(struct dvb_frontend=
 *fe)
 	u8 u8tmp, u8tmp1 =3D 0, u8tmp2 =3D 0; /* silence compiler warning */
 	u8 buf[3];
 	u16 u16tmp;
-	u32 tuner_frequency_khz, target_mclk;
+	u32 tuner_frequency_khz, target_mclk, u32tmp;
 	s32 s32tmp;
 	static const struct reg_sequence reset_buf[] =3D {
 		{0x07, 0x80}, {0x07, 0x00}
@@ -321,6 +654,20 @@ static int m88ds3103_set_frontend(struct dvb_fronten=
d *fe)
=20
 	/* Disable demod clock path */
 	if (dev->chip_id =3D=3D M88RS6000_CHIP_ID) {
+		if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+			ret =3D regmap_read(dev->regmap, 0xb2, &u32tmp);
+			if (ret)
+				goto err;
+			if (u32tmp =3D=3D 0x01) {
+				ret =3D regmap_write(dev->regmap, 0x00, 0x00);
+				if (ret)
+					goto err;
+				ret =3D regmap_write(dev->regmap, 0xb2, 0x00);
+				if (ret)
+					goto err;
+			}
+		}
+
 		ret =3D regmap_write(dev->regmap, 0x06, 0xe0);
 		if (ret)
 			goto err;
@@ -346,7 +693,7 @@ static int m88ds3103_set_frontend(struct dvb_frontend=
 *fe)
 		tuner_frequency_khz =3D c->frequency;
 	}
=20
-	/* select M88RS6000 demod main mclk and ts mclk from tuner die. */
+	/* set M88RS6000/DS3103B demod main mclk and ts mclk from tuner die */
 	if (dev->chip_id =3D=3D M88RS6000_CHIP_ID) {
 		if (c->symbol_rate > 45010000)
 			dev->mclk =3D 110250000;
@@ -358,6 +705,11 @@ static int m88ds3103_set_frontend(struct dvb_fronten=
d *fe)
 		else
 			target_mclk =3D 144000000;
=20
+		if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+			m88ds3103b_select_mclk(dev);
+			m88ds3103b_set_mclk(dev, target_mclk / 1000);
+		}
+
 		/* Enable demod clock path */
 		ret =3D regmap_write(dev->regmap, 0x06, 0x00);
 		if (ret)
@@ -469,12 +821,42 @@ static int m88ds3103_set_frontend(struct dvb_fronte=
nd *fe)
 		ret =3D m88ds3103_update_bits(dev, 0x9d, 0x08, 0x08);
 		if (ret)
 			goto err;
+
+		if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+			buf[0] =3D m88ds3103b_dt_read(dev, 0x15);
+			buf[1] =3D m88ds3103b_dt_read(dev, 0x16);
+
+			if (c->symbol_rate > 45010000) {
+				buf[0] &=3D ~0x03;
+				buf[0] |=3D 0x02;
+				buf[0] |=3D ((147 - 32) >> 8) & 0x01;
+				buf[1] =3D (147 - 32) & 0xFF;
+
+				dev->mclk =3D 110250 * 1000;
+			} else {
+				buf[0] &=3D ~0x03;
+				buf[0] |=3D ((128 - 32) >> 8) & 0x01;
+				buf[1] =3D (128 - 32) & 0xFF;
+
+				dev->mclk =3D 96000 * 1000;
+			}
+			m88ds3103b_dt_write(dev, 0x15, buf[0]);
+			m88ds3103b_dt_write(dev, 0x16, buf[1]);
+
+			regmap_read(dev->regmap, 0x30, &u32tmp);
+			u32tmp &=3D ~0x80;
+			regmap_write(dev->regmap, 0x30, u32tmp & 0xff);
+		}
+
 		ret =3D regmap_write(dev->regmap, 0xf1, 0x01);
 		if (ret)
 			goto err;
-		ret =3D m88ds3103_update_bits(dev, 0x30, 0x80, 0x80);
-		if (ret)
-			goto err;
+
+		if (dev->chiptype !=3D M88DS3103_CHIPTYPE_3103B) {
+			ret =3D m88ds3103_update_bits(dev, 0x30, 0x80, 0x80);
+			if (ret)
+				goto err;
+		}
 	}
=20
 	switch (dev->cfg->ts_mode) {
@@ -488,6 +870,10 @@ static int m88ds3103_set_frontend(struct dvb_fronten=
d *fe)
 		break;
 	case M88DS3103_TS_PARALLEL:
 		u8tmp =3D 0x02;
+		if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+			u8tmp =3D 0x01;
+			u8tmp1 =3D 0x01;
+		}
 		break;
 	case M88DS3103_TS_CI:
 		u8tmp =3D 0x03;
@@ -516,6 +902,12 @@ static int m88ds3103_set_frontend(struct dvb_fronten=
d *fe)
 		u8tmp1 =3D 0x3f;
 		u8tmp2 =3D 0x3f;
 		break;
+	case M88DS3103_TS_PARALLEL:
+		if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+			ret =3D m88ds3103_update_bits(dev, 0x29, 0x01, u8tmp1);
+			if (ret)
+				goto err;
+		}
 	default:
 		u16tmp =3D DIV_ROUND_UP(target_mclk, dev->cfg->ts_clk);
 		u8tmp1 =3D u16tmp / 2 - 1;
@@ -543,6 +935,9 @@ static int m88ds3103_set_frontend(struct dvb_frontend=
 *fe)
 	else
 		u8tmp =3D 0x06;
=20
+	if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B)
+		m88ds3103b_set_mclk(dev, target_mclk / 1000);
+
 	ret =3D regmap_write(dev->regmap, 0xc3, 0x08);
 	if (ret)
 		goto err;
@@ -578,6 +973,16 @@ static int m88ds3103_set_frontend(struct dvb_fronten=
d *fe)
 	if (ret)
 		goto err;
=20
+	if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+		/* enable/disable 192M LDPC clock */
+		ret =3D m88ds3103_update_bits(dev, 0x29, 0x10,
+					(c->delivery_system =3D=3D SYS_DVBS) ? 0x10 : 0x0);
+		if (ret)
+			goto err;
+
+		ret =3D m88ds3103_update_bits(dev, 0xc9, 0x08, 0x08);
+	}
+
 	dev_dbg(&client->dev, "carrier offset=3D%d\n",
 		(tuner_frequency_khz - c->frequency));
=20
@@ -642,7 +1047,7 @@ static int m88ds3103_init(struct dvb_frontend *fe)
 	if (utmp)
 		goto warm;
=20
-	/* global reset, global diseqc reset, golbal fec reset */
+	/* global reset, global diseqc reset, global fec reset */
 	ret =3D regmap_write(dev->regmap, 0x07, 0xe0);
 	if (ret)
 		goto err;
@@ -652,12 +1057,15 @@ static int m88ds3103_init(struct dvb_frontend *fe)
=20
 	/* cold state - try to download firmware */
 	dev_info(&client->dev, "found a '%s' in cold state\n",
-		 m88ds3103_ops.info.name);
+		 dev->fe.ops.info.name);
=20
-	if (dev->chip_id =3D=3D M88RS6000_CHIP_ID)
+	if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B)
+		name =3D M88DS3103B_FIRMWARE;
+	else if (dev->chip_id =3D=3D M88RS6000_CHIP_ID)
 		name =3D M88RS6000_FIRMWARE;
 	else
 		name =3D M88DS3103_FIRMWARE;
+
 	/* request the firmware, this will block and timeout */
 	ret =3D request_firmware(&firmware, name, &client->dev);
 	if (ret) {
@@ -700,10 +1108,16 @@ static int m88ds3103_init(struct dvb_frontend *fe)
 	}
=20
 	dev_info(&client->dev, "found a '%s' in warm state\n",
-		 m88ds3103_ops.info.name);
+		 dev->fe.ops.info.name);
 	dev_info(&client->dev, "firmware version: %X.%X\n",
 		 (utmp >> 4) & 0xf, (utmp >> 0 & 0xf));
=20
+	if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+		m88ds3103b_dt_write(dev, 0x21, 0x92);
+		m88ds3103b_dt_write(dev, 0x15, 0x6C);
+		m88ds3103b_dt_write(dev, 0x17, 0xC1);
+		m88ds3103b_dt_write(dev, 0x17, 0x81);
+	}
 warm:
 	/* warm state */
 	dev->warm =3D true;
@@ -1393,6 +1807,8 @@ static int m88ds3103_probe(struct i2c_client *clien=
t,
 		goto err_kfree;
=20
 	dev->chip_id =3D utmp >> 1;
+	dev->chiptype =3D (u8)id->driver_data;
+
 	dev_dbg(&client->dev, "chip_id=3D%02x\n", dev->chip_id);
=20
 	switch (dev->chip_id) {
@@ -1459,7 +1875,10 @@ static int m88ds3103_probe(struct i2c_client *clie=
nt,
=20
 	/* create dvb_frontend */
 	memcpy(&dev->fe.ops, &m88ds3103_ops, sizeof(struct dvb_frontend_ops));
-	if (dev->chip_id =3D=3D M88RS6000_CHIP_ID)
+	if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B)
+		strscpy(dev->fe.ops.info.name, "Montage Technology M88DS3103B",
+			sizeof(dev->fe.ops.info.name));
+	else if (dev->chip_id =3D=3D M88RS6000_CHIP_ID)
 		strscpy(dev->fe.ops.info.name, "Montage Technology M88RS6000",
 			sizeof(dev->fe.ops.info.name));
 	if (!pdata->attach_in_use)
@@ -1470,6 +1889,25 @@ static int m88ds3103_probe(struct i2c_client *clie=
nt,
 	/* setup callbacks */
 	pdata->get_dvb_frontend =3D m88ds3103_get_dvb_frontend;
 	pdata->get_i2c_adapter =3D m88ds3103_get_i2c_adapter;
+
+	if (dev->chiptype =3D=3D M88DS3103_CHIPTYPE_3103B) {
+		/* enable i2c repeater for tuner */
+		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+
+		/* get frontend address */
+		ret =3D regmap_read(dev->regmap, 0x29, &utmp);
+		if (ret)
+			goto err_kfree;
+		dev->dt_addr =3D ((utmp & 0x80) =3D=3D 0) ? 0x42 >> 1 : 0x40 >> 1;
+		dev_err(&client->dev, "dt addr is 0x%02x", dev->dt_addr);
+
+		dev->dt_client =3D i2c_new_dummy_device(client->adapter, dev->dt_addr)=
;
+		if (!dev->dt_client) {
+			ret =3D -ENODEV;
+			goto err_kfree;
+		}
+	}
+
 	return 0;
 err_kfree:
 	kfree(dev);
@@ -1484,6 +1922,9 @@ static int m88ds3103_remove(struct i2c_client *clie=
nt)
=20
 	dev_dbg(&client->dev, "\n");
=20
+	if (dev->dt_client)
+		i2c_unregister_device(dev->dt_client);
+
 	i2c_mux_del_adapters(dev->muxc);
=20
 	kfree(dev);
@@ -1491,7 +1932,9 @@ static int m88ds3103_remove(struct i2c_client *clie=
nt)
 }
=20
 static const struct i2c_device_id m88ds3103_id_table[] =3D {
-	{"m88ds3103", 0},
+	{"m88ds3103",  M88DS3103_CHIPTYPE_3103},
+	{"m88rs6000",  M88DS3103_CHIPTYPE_RS6000},
+	{"m88ds3103b", M88DS3103_CHIPTYPE_3103B},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, m88ds3103_id_table);
@@ -1513,3 +1956,4 @@ MODULE_DESCRIPTION("Montage Technology M88DS3103 DV=
B-S/S2 demodulator driver");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(M88DS3103_FIRMWARE);
 MODULE_FIRMWARE(M88RS6000_FIRMWARE);
+MODULE_FIRMWARE(M88DS3103B_FIRMWARE);
diff --git a/drivers/media/dvb-frontends/m88ds3103_priv.h b/drivers/media=
/dvb-frontends/m88ds3103_priv.h
index c825032f07ab..aa5306f40201 100644
--- a/drivers/media/dvb-frontends/m88ds3103_priv.h
+++ b/drivers/media/dvb-frontends/m88ds3103_priv.h
@@ -16,13 +16,20 @@
 #include <linux/regmap.h>
 #include <linux/math64.h>
=20
-#define M88DS3103_FIRMWARE "dvb-demod-m88ds3103.fw"
-#define M88RS6000_FIRMWARE "dvb-demod-m88rs6000.fw"
+#define M88DS3103B_FIRMWARE "dvb-demod-m88ds3103b.fw"
+#define M88DS3103_FIRMWARE  "dvb-demod-m88ds3103.fw"
+#define M88RS6000_FIRMWARE  "dvb-demod-m88rs6000.fw"
+
 #define M88RS6000_CHIP_ID 0x74
 #define M88DS3103_CHIP_ID 0x70
=20
+#define M88DS3103_CHIPTYPE_3103   0
+#define M88DS3103_CHIPTYPE_RS6000 1
+#define M88DS3103_CHIPTYPE_3103B  2
+
 struct m88ds3103_dev {
 	struct i2c_client *client;
+	struct i2c_client *dt_client;
 	struct regmap_config regmap_config;
 	struct regmap *regmap;
 	struct m88ds3103_config config;
@@ -35,10 +42,13 @@ struct m88ds3103_dev {
 	struct i2c_mux_core *muxc;
 	/* auto detect chip id to do different config */
 	u8 chip_id;
+	/* chip type to differentiate m88rs6000 from m88ds3103b */
+	u8 chiptype;
 	/* main mclk is calculated for M88RS6000 dynamically */
 	s32 mclk;
 	u64 post_bit_error;
 	u64 post_bit_count;
+	u8 dt_addr;
 };
=20
 struct m88ds3103_reg_val {
--=20
2.23.0

