Return-Path: <linux-media+bounces-10938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0197C8BD88F
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 02:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1B2B23397
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D44210FA;
	Tue,  7 May 2024 00:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="SNO4lIgl"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA208489
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715041532; cv=none; b=d3L7yWkLdWdyJabuiMOPGFmlgiO7ylK+pPT7ibOlAhEKsc0hFJZ1YAvvkZRg22PV1GvvjcqTjUw+GNP/CHFOb47jK50ULB9OOtoyIhRMuFFSIm/0PF94PoZD5wdNXH4PevG5aKr2e5r/Ygtssd37NxOPkDb6smNWEof5AAaaHrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715041532; c=relaxed/simple;
	bh=uJtkiNw4jVo4q3TVO6USpBvkUU5+QopsS/sTv17NpLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SbyKKCuvwDn/Z5qzojF3Q/oHfTzVa+cYYl9tuZKf3JngIAAnNmR8y/2m7EW49CUUpwaJW/KY5sMgdhetrgW6PI7Zol6ZQxHqqDcjXOMmC4lHW8J9m3CSHiWwH7sRURvTXREOkdlIgZEaBKAqjW+lSZXOot6n8HcrIEBSyiupHoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=SNO4lIgl; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1715041526; x=1715646326; i=herdler@nurfuerspam.de;
	bh=e42ZZbhTDJrc4js2SE11f5o/CXHCWYa4FVg1NvzWaq0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SNO4lIglotsLrDp1LXsX7mZ9orAUqHtnDI0+d5VfsmxpYxedCyESfz+uXoC+fnAZ
	 RDDYlJWMAxGyIhMnQtikPLsDrHvKxqWWL6lPWYsRukM2KEJSYntCvcfzFyFSYhpo8
	 XMYU7dcw6FRm3awAZBxgZmBdERUT/I06bVAIwFB3XRBw/dV2UcaCeMsPMsbnyzBOg
	 2k4rD9N1TL19TSVT7WAQQIyNZIOREEZAbLPUiuvFDKHtqeBI5UcLhx2g5vY1l2XmD
	 Vsu/A5qbymOQXztGDS/dIxjlusqJK7v4uK6qUcQDD3LwPuUuxhwlhrjhQmJsaDb4e
	 dyUZ/BGzWq00bigksg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.174.109]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWASY-1s6mJY1d3i-00XebV; Tue, 07
 May 2024 02:25:26 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 05/21] media: sp8870: coding style fixes: miscellaneous
Date: Tue,  7 May 2024 02:24:44 +0200
Message-Id: <20240507002500.81867-6-herdler@nurfuerspam.de>
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
X-Provags-ID: V03:K1:CxpjegexGPWqsvtWg2YgVEodrsXjQeRx/aqqIIm4TfK4fh/zI1/
 GZeJGspZHko3UirtKhAL/idLPzJkg5WgAxpy6k/VIIqM2nGmLY0ytoLZguUIHFCUsV8a6fP
 s/CWy7GlBzSxSGtETV+n0En+lT8KoGMqWTax6Mf10IjJ0U1cJ4l52qyfhBNAYyc5qyb21QG
 HeGm6qe1gD/VZls0U1leg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cy7ja2MNk9M=;dgvrFIRPn/fZZXcRkh2ni/lwjjJ
 ZAsN6uzKwysXpZauOIJ8ZyBUuy4OTzXaCYv00wr9UCMa3XVlrnDfERDx9frfsZbxim3cRH9n4
 CweQ9tYB5PBU89as+ShzOIcO4zidWJt9i2YprHY+W5lAIMVPWcBdE1kfH64yubwnv+5a2/1hc
 ObK08PgqXgbmCYpWe3FLODaAL39u4W9OFWGhWWdvt4GHG+peRl+lhZ7FvYA3EVy1jgrYFwvix
 VFaK+jwT0dHmlGSSn9dZzqiqg4RfCWqO8FzugPgEnZ6NoftaUzkqLNve2vvXEb2E+6AbCVD48
 5Gf6X9AzDgUqg9aMdm9gG+NMdFC9uRVhhUXF0J9eP9beSPtEYE8TUhiLNo6sM833F03Ri53RS
 UgKCp4qLO+NI/5GVPwaWyvbGjMBaedOsD3NSZUNlWK+9wQ/ytr39VfMd7jn0dQzaYfmCw6zWQ
 LkGsvNALoy5d3FR+5IuQK2xGhi6VsvNx41/bBwZo7wCi+sZ/sadK9ht+ZRtWowwo+8cntmHKW
 NAxA7hilHyGnJcGY5qKkmk6U80k0RvlLsQEDRYZXuihjxQPdtdRn2AO3iMx8KQwThGMVvGNa/
 GsNMQBFv6cerhW/GSRikzigNiFgjRAAiyrA+43p3WkQdxtDAoevz2OTNkjbPoFHYGq8Ewgsau
 liTayfZ/zUDoV28bvL10RkR3Rb8Wv6z2xJ1VklpsXqvjRW4PDztdbGuGgSuTedarD9jMHdCf5
 X/0EtrT0FroK5K/d1YwCrn9ArFiaAaubpD+xn9rDU3hUz0mpg30FH0vMfUoVWUmw8LamZm5jo
 eJXVvLAXegeiFMeIVLRZfNa7cZE6wRmg1z2RdkB2cAt2U=

This patch fixes the following checkpatch:

ERROR:ASSIGN_IN_IF: do not use assignment in if condition
WARNING:BRACES: braces {} are not necessary for any arm of this statement
WARNING:CONST_STRUCT: struct dvb_frontend_ops should normally be const
WARNING:EXPORT_SYMBOL: EXPORT_SYMBOL(foo); should immediately follow its f=
unction/variable
CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*state)...) over kzalloc(=
sizeof(struct sp8870_state)...)
CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written ...
CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
=2D--
 drivers/staging/media/av7110/sp8870.c | 24 +++++++++++++-----------
 drivers/staging/media/av7110/sp8870.h |  3 +--
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media=
/av7110/sp8870.c
index 4e2a1cbd4..282beb157 100644
=2D-- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -59,7 +59,8 @@ static int sp8870_writereg(struct sp8870_state *state, u=
16 reg, u16 data)

 	int err;

-	if ((err =3D i2c_transfer (state->i2c, &msg, 1)) !=3D 1) {
+	err =3D i2c_transfer(state->i2c, &msg, 1);
+	if (err !=3D 1) {
 		dprintk ("%s: writereg error (err =3D=3D %i, reg =3D=3D 0x%02x, data =
=3D=3D 0x%02x)\n", __func__, err, reg, data);
 		return -EREMOTEIO;
 	}
@@ -123,7 +124,8 @@ static int sp8870_firmware_upload(struct sp8870_state =
*state, const struct firmw
 		msg.flags =3D 0;
 		msg.buf =3D tx_buf;
 		msg.len =3D tx_len + 2;
-		if ((err =3D i2c_transfer (state->i2c, &msg, 1)) !=3D 1) {
+		err =3D i2c_transfer(state->i2c, &msg, 1);
+		if (err !=3D 1) {
 			printk("%s: firmware upload failed!\n", __func__);
 			printk ("%s: i2c error (err =3D=3D %i)\n", __func__, err);
 			return err;
@@ -245,7 +247,8 @@ static int sp8870_set_frontend_parameters(struct dvb_f=
rontend *fe)
 	int  err;
 	u16 reg0xc05;

-	if ((err =3D configure_reg0xc05(p, &reg0xc05)))
+	err =3D configure_reg0xc05(p, &reg0xc05);
+	if (err)
 		return err;

 	// system controller stop
@@ -533,11 +536,10 @@ static int sp8870_i2c_gate_ctrl(struct dvb_frontend =
*fe, int enable)
 {
 	struct sp8870_state *state =3D fe->demodulator_priv;

-	if (enable) {
+	if (enable)
 		return sp8870_writereg(state, 0x206, 0x001);
-	} else {
+	else
 		return sp8870_writereg(state, 0x206, 0x000);
-	}
 }

 static void sp8870_release(struct dvb_frontend *fe)
@@ -555,8 +557,9 @@ struct dvb_frontend *sp8870_attach(const struct sp8870=
_config *config,
 	struct sp8870_state *state =3D NULL;

 	/* allocate memory for the internal state */
-	state =3D kzalloc(sizeof(struct sp8870_state), GFP_KERNEL);
-	if (state =3D=3D NULL) goto error;
+	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		goto error;

 	/* setup the state */
 	state->config =3D config;
@@ -568,7 +571,7 @@ struct dvb_frontend *sp8870_attach(const struct sp8870=
_config *config,
 		goto error;

 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &sp8870_ops, sizeof(struct dvb_frontend_ops=
));
+	memcpy(&state->frontend.ops, &sp8870_ops, sizeof(sp8870_ops));
 	state->frontend.demodulator_priv =3D state;
 	return &state->frontend;

@@ -576,6 +579,7 @@ struct dvb_frontend *sp8870_attach(const struct sp8870=
_config *config,
 	kfree(state);
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(sp8870_attach);

 static const struct dvb_frontend_ops sp8870_ops =3D {
 	.delsys =3D { SYS_DVBT },
@@ -613,5 +617,3 @@ MODULE_PARM_DESC(debug, "Turn on/off frontend debuggin=
g (default:off).");
 MODULE_DESCRIPTION("Spase SP8870 DVB-T Demodulator driver");
 MODULE_AUTHOR("Juergen Peitz");
 MODULE_LICENSE("GPL");
-
-EXPORT_SYMBOL_GPL(sp8870_attach);
diff --git a/drivers/staging/media/av7110/sp8870.h b/drivers/staging/media=
/av7110/sp8870.h
index 2cfee1bb6..3f566671c 100644
=2D-- a/drivers/staging/media/av7110/sp8870.h
+++ b/drivers/staging/media/av7110/sp8870.h
@@ -20,8 +20,7 @@ struct sp8870_config {
 };

 #if IS_REACHABLE(CONFIG_DVB_SP8870)
-extern struct dvb_frontend* sp8870_attach(const struct sp8870_config* con=
fig,
-					  struct i2c_adapter* i2c);
+struct dvb_frontend *sp8870_attach(const struct sp8870_config *config, st=
ruct i2c_adapter *i2c);
 #else
 static inline struct dvb_frontend *sp8870_attach(const struct sp8870_conf=
ig *config,
 						 struct i2c_adapter *i2c)
=2D-
2.34.0


