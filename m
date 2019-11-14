Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9985FCF10
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfKNUEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:21 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:36487
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726786AbfKNUEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:21 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id A022B5A0D5E;
        Thu, 14 Nov 2019 20:04:20 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-196-9.trex.outbound.svc.cluster.local [100.96.196.9])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id E879F5A0BE0;
        Thu, 14 Nov 2019 20:04:19 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:20 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Spicy-Continue: 78ead0f526e31cf1_1573761860371_2879613799
X-MC-Loop-Signature: 1573761860371:743977889
X-MC-Ingress-Time: 1573761860371
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 404648260B;
        Thu, 14 Nov 2019 12:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        ZmS/6elZisBkDcN4h4o5PyV1BEY=; b=QOhTekokM3L2X4ptbpiZm10cQ5ep5Qh2
        TuE+zhfJJf5hgUdjrbmBxp5X/Y09fJuBaY0UsOokxSjZ1LKkKMlGIDmsYWAsTluX
        Zyy6MKzR1COY5x0VpEN25n3MANRa1t/y9i04dckwh/GjSaF8Z+af+95YbTGCSkIi
        KJdHxyQoPeg=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id BFDCC8259B;
        Thu, 14 Nov 2019 12:04:17 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 04/14] si2157: Add analog tuning related functions
Date:   Thu, 14 Nov 2019 14:03:58 -0600
Message-Id: <20191114200408.28883-5-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Include set_analog_params, get_frequency, and get_bandwidth.

Tested with NTSC and PAL standards via ch3/4 generator. Other standards
are included, but are untested due to lack of generator.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Changes since v1:
- remove __func__ from dev_dbg macros

 drivers/media/tuners/si2157.c      | 230 ++++++++++++++++++++++++++++-
 drivers/media/tuners/si2157_priv.h |   2 +
 2 files changed, 229 insertions(+), 3 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.=
c
index e1e23e78fd19..78a855df30da 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -371,7 +371,7 @@ static int si2157_set_params(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
=20
-	/* set if frequency if needed */
+	/* set digital if frequency if needed */
 	if (if_frequency !=3D dev->if_frequency) {
 		memcpy(cmd.args, "\x14\x00\x06\x07", 4);
 		cmd.args[4] =3D (if_frequency / 1000) & 0xff;
@@ -385,7 +385,7 @@ static int si2157_set_params(struct dvb_frontend *fe)
 		dev->if_frequency =3D if_frequency;
 	}
=20
-	/* set frequency */
+	/* set digital frequency */
 	memcpy(cmd.args, "\x41\x00\x00\x00\x00\x00\x00\x00", 8);
 	cmd.args[4] =3D (c->frequency >>  0) & 0xff;
 	cmd.args[5] =3D (c->frequency >>  8) & 0xff;
@@ -397,18 +397,239 @@ static int si2157_set_params(struct dvb_frontend *=
fe)
 	if (ret)
 		goto err;
=20
+	dev->bandwidth =3D bandwidth;
+	dev->frequency =3D c->frequency;
+
 	return 0;
 err:
+	dev->bandwidth =3D 0;
+	dev->frequency =3D 0;
+	dev->if_frequency =3D 0;
 	dev_dbg(&client->dev, "failed=3D%d\n", ret);
 	return ret;
 }
=20
+static int si2157_set_analog_params(struct dvb_frontend *fe,
+				     struct analog_parameters *params)
+{
+	struct i2c_client *client =3D fe->tuner_priv;
+	struct si2157_dev *dev =3D i2c_get_clientdata(client);
+	char *std; /* for debugging */
+	int ret;
+	struct si2157_cmd cmd;
+	u32 bandwidth =3D 0;
+	u32 if_frequency =3D 0;
+	u32 freq =3D 0;
+	u64 tmp_lval =3D 0;
+	u8 system =3D 0;
+	u8 color =3D 0;    /* 0=3DNTSC/PAL, 0x10=3DSECAM */
+	u8 invert_analog =3D 1; /* analog tuner spectrum; 0=3Dnormal, 1=3Dinver=
ted */
+
+	if (dev->chiptype !=3D SI2157_CHIPTYPE_SI2157) {
+		dev_info(&client->dev, "Analog tuning not supported for chiptype=3D%u\=
n",
+			 dev->chiptype);
+		ret =3D -EINVAL;
+		goto err;
+	}
+
+	if (!dev->active)
+		si2157_init(fe);
+
+	if (!dev->active) {
+		ret =3D -EAGAIN;
+		goto err;
+	}
+	if (params->mode =3D=3D V4L2_TUNER_RADIO) {
+	/*
+	 * std =3D "fm";
+	 * bandwidth =3D 1700000; //best can do for FM, AGC will be a mess thou=
gh
+	 * if_frequency =3D 1250000;  //HVR-225x(saa7164), HVR-12xx(cx23885)
+	 * if_frequency =3D 6600000;  //HVR-9xx(cx231xx)
+	 * if_frequency =3D 5500000;  //HVR-19xx(pvrusb2)
+	 */
+		dev_err(&client->dev, "si2157 does not currently support FM radio\n");
+		ret =3D -EINVAL;
+		goto err;
+	}
+	tmp_lval =3D params->frequency * 625LL;
+	do_div(tmp_lval, 10); /* convert to HZ */
+	freq =3D (u32)tmp_lval;
+
+	if (freq < 1000000) /* is freq in KHz */
+		freq =3D freq * 1000;
+	dev->frequency =3D freq;
+
+	/* if_frequency values based on tda187271C2 */
+	if (params->std & (V4L2_STD_B | V4L2_STD_GH)) {
+		if (freq >=3D 470000000) {
+			std =3D "palGH";
+			bandwidth =3D 8000000;
+			if_frequency =3D 6000000;
+			system =3D 1;
+			if (params->std & (V4L2_STD_SECAM_G | V4L2_STD_SECAM_H)) {
+				std =3D "secamGH";
+				color =3D 0x10;
+			}
+		} else {
+			std =3D "palB";
+			bandwidth =3D 7000000;
+			if_frequency =3D 6000000;
+			system =3D 0;
+			if (params->std & V4L2_STD_SECAM_B) {
+				std =3D "secamB";
+				color =3D 0x10;
+			}
+		}
+	} else if (params->std & V4L2_STD_MN) {
+		std =3D "MN";
+		bandwidth =3D 6000000;
+		if_frequency =3D 5400000;
+		system =3D 2;
+	} else if (params->std & V4L2_STD_PAL_I) {
+		std =3D "palI";
+		bandwidth =3D 8000000;
+		if_frequency =3D 7250000; /* TODO: does not work yet */
+		system =3D 4;
+	} else if (params->std & V4L2_STD_DK) {
+		std =3D "palDK";
+		bandwidth =3D 8000000;
+		if_frequency =3D 6900000; /* TODO: does not work yet */
+		system =3D 5;
+		if (params->std & V4L2_STD_SECAM_DK) {
+			std =3D "secamDK";
+			color =3D 0x10;
+		}
+	} else if (params->std & V4L2_STD_SECAM_L) {
+		std =3D "secamL";
+		bandwidth =3D 8000000;
+		if_frequency =3D 6750000; /* TODO: untested */
+		system =3D 6;
+		color =3D 0x10;
+	} else if (params->std & V4L2_STD_SECAM_LC) {
+		std =3D "secamL'";
+		bandwidth =3D 7000000;
+		if_frequency =3D 1250000; /* TODO: untested */
+		system =3D 7;
+		color =3D 0x10;
+	} else {
+		std =3D "unknown";
+	}
+	/* calc channel center freq */
+	freq =3D freq - 1250000 + (bandwidth / 2);
+
+	dev_dbg(&client->dev,
+		"mode=3D%d system=3D%u std=3D'%s' params->frequency=3D%u center freq=3D=
%u if=3D%u bandwidth=3D%u\n",
+		params->mode, system, std, params->frequency,
+		freq, if_frequency, bandwidth);
+
+	/* set analog IF port */
+	memcpy(cmd.args, "\x14\x00\x03\x06\x08\x02", 6);
+	/* in using dev->if_port, we assume analog and digital IF's */
+	/*   are always on different ports */
+	/* assumes if_port definition is 0 or 1 for digital out */
+	cmd.args[4] =3D (dev->if_port =3D=3D 1) ? 8 : 10;
+	/* Analog AGC assumed external */
+	cmd.args[5] =3D (dev->if_port =3D=3D 1) ? 2 : 1;
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 4;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	/* set analog IF output config */
+	memcpy(cmd.args, "\x14\x00\x0d\x06\x94\x64", 6);
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 4;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	/* make this distinct from a digital IF */
+	dev->if_frequency =3D if_frequency | 1;
+
+	/* calc and set tuner analog if center frequency */
+	if_frequency =3D if_frequency + 1250000 - (bandwidth / 2);
+	dev_dbg(&client->dev, "IF Ctr freq=3D%d\n", if_frequency);
+
+	memcpy(cmd.args, "\x14\x00\x0C\x06", 4);
+	cmd.args[4] =3D (if_frequency / 1000) & 0xff;
+	cmd.args[5] =3D ((if_frequency / 1000) >> 8) & 0xff;
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 4;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	/* set analog AGC config */
+	memcpy(cmd.args, "\x14\x00\x07\x06\x32\xc8", 6);
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 4;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	/* set analog video mode */
+	memcpy(cmd.args, "\x14\x00\x04\x06\x00\x00", 6);
+	cmd.args[4] =3D system | color;
+	/* can use dev->inversion if assumed applies to both digital/analog */
+	if (invert_analog)
+		cmd.args[5] |=3D 0x02;
+	cmd.wlen =3D 6;
+	cmd.rlen =3D 1;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	/* set analog frequency */
+	memcpy(cmd.args, "\x41\x01\x00\x00\x00\x00\x00\x00", 8);
+	cmd.args[4] =3D (freq >>  0) & 0xff;
+	cmd.args[5] =3D (freq >>  8) & 0xff;
+	cmd.args[6] =3D (freq >> 16) & 0xff;
+	cmd.args[7] =3D (freq >> 24) & 0xff;
+	cmd.wlen =3D 8;
+	cmd.rlen =3D 1;
+	ret =3D si2157_cmd_execute(client, &cmd);
+	if (ret)
+		goto err;
+
+	dev->bandwidth =3D bandwidth;
+
+	return 0;
+err:
+	dev->bandwidth =3D 0;
+	dev->frequency =3D 0;
+	dev->if_frequency =3D 0;
+	dev_dbg(&client->dev, "failed=3D%d\n", ret);
+	return ret;
+}
+
+static int si2157_get_frequency(struct dvb_frontend *fe, u32 *frequency)
+{
+	struct i2c_client *client =3D fe->tuner_priv;
+	struct si2157_dev *dev =3D i2c_get_clientdata(client);
+
+	*frequency =3D dev->frequency;
+	dev_dbg(&client->dev, "freq=3D%u\n", dev->frequency);
+	return 0;
+}
+
+static int si2157_get_bandwidth(struct dvb_frontend *fe, u32 *bandwidth)
+{
+	struct i2c_client *client =3D fe->tuner_priv;
+	struct si2157_dev *dev =3D i2c_get_clientdata(client);
+
+	*bandwidth =3D dev->bandwidth;
+	dev_dbg(&client->dev, "bandwidth=3D%u\n", dev->bandwidth);
+	return 0;
+}
+
 static int si2157_get_if_frequency(struct dvb_frontend *fe, u32 *frequen=
cy)
 {
 	struct i2c_client *client =3D fe->tuner_priv;
 	struct si2157_dev *dev =3D i2c_get_clientdata(client);
=20
-	*frequency =3D dev->if_frequency;
+	*frequency =3D dev->if_frequency & ~1; /* strip analog IF indicator bit=
 */
+	dev_dbg(&client->dev, "if_frequency=3D%u\n", *frequency);
 	return 0;
 }
=20
@@ -422,6 +643,9 @@ static const struct dvb_tuner_ops si2157_ops =3D {
 	.init =3D si2157_init,
 	.sleep =3D si2157_sleep,
 	.set_params =3D si2157_set_params,
+	.set_analog_params =3D si2157_set_analog_params,
+	.get_frequency     =3D si2157_get_frequency,
+	.get_bandwidth     =3D si2157_get_bandwidth,
 	.get_if_frequency =3D si2157_get_if_frequency,
 };
=20
diff --git a/drivers/media/tuners/si2157_priv.h b/drivers/media/tuners/si=
2157_priv.h
index 778f81b39996..ef4796098931 100644
--- a/drivers/media/tuners/si2157_priv.h
+++ b/drivers/media/tuners/si2157_priv.h
@@ -29,6 +29,8 @@ struct si2157_dev {
 	u8 chiptype;
 	u8 if_port;
 	u32 if_frequency;
+	u32 bandwidth;
+	u32 frequency;
 	struct delayed_work stat_work;
=20
 #if defined(CONFIG_MEDIA_CONTROLLER)
--=20
2.23.0

