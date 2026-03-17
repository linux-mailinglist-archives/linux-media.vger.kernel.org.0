Return-Path: <linux-media+bounces-56131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCPjIljAuWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:58:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3E2B2774
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FF5F3073417
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2784338C2BB;
	Tue, 17 Mar 2026 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="PNwxPg/a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3772538C432
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773781076; cv=none; b=eEoH/TLhsYz97tNa+9uHdzUW7silNKNKoGs67lr8+HIas+hWjLcx67hVcCeSb/uanKLORuqXep+nAPkWjgztS5yb7baubpq1L/dOXxiR8TviGIfOE0PR4jfzYIR5pkohYnyVorMSG5LyCx+LME2f9iKIbyCmjp9skP0fw+HsWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773781076; c=relaxed/simple;
	bh=ECM1AJM/PT/pb5P62Xg7tM7I1DMObJqp/KWREoG/jjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=by8WL7wfXbz814hFXnXeNr1YnC3xNhK5BiwLwR+0IEPodPeoDPQUlgLiKC8ICyt7ugUmkIwpu0WVVxjFaiKmBbGm06pC3wW/nryYx15j+veTTB3OLOl9Dm9rtHJIyFSTXxhKVrqhgm9YPLjYszlXnbLqdN0Lr9SudjIKvu8t060=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=PNwxPg/a; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79a62a2bb8cso14821977b3.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773781074; x=1774385874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67bPJoDTmYLqAbWyeLh2NybJbz9XKRl9HM+9kGKG7bU=;
        b=PNwxPg/a9PzQGOLmQNDMpO/2QwUUGBEA00u1arqWeUtE0YBEezZF9q4Hk1/A4MYaP6
         Wuga1//3yrpYgxnx8L9YYhcqxZTW/z4+TWBTU+4kd3XG8tZGCWS/iqsBsx5HblIEBxbc
         G3to1H8qun57Hk+6yFIfLwopz2EMA/Xwy7Z4h8qEAn9i5gW7TUM4JwWzkczorNxtu3Om
         kmlPpZhanltMR6XAgE3amN3KbGdM7Q0EeZbo5PBk+RDpcsT/BUCJIIpS7efJFIy77uyY
         OXvcsqpfsXa9KnzfEcDjMrLHZIk8mQQaDTg/tAHKcl0H4J0X8eXIDQZFF65ykiOhycFv
         bBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781074; x=1774385874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67bPJoDTmYLqAbWyeLh2NybJbz9XKRl9HM+9kGKG7bU=;
        b=m/pRoUityjm6PaXSWYYgsFbzH7r5JiJuN7woYBLvxHnI5Y2LQZEbhSVKQD5DY3TNaI
         slvGMYX4jwxYSCNfN0fB3kU3eZhHyNNccdussPjkSSXKcEmOGC35a8t32Nv5GS2yv3nw
         RwoUrNJQKsLIp+e294L5HA0mWissikcyjcc8S2I+SxCQUpX2zi5gDnmB8MpQYhi67PjN
         u6uIVsMaTw1WoeQjPYQeQCfwuw038bgcn8DYbIYt6NcXyhMidv1ILvdHYEBOJu5+4o7e
         kWzCM5RPFXFKlRYhfo9w8scz16IX41DvlzcYpVMj408uRJlcuGpNc6UnJJFoGuoCpn8k
         r0hg==
X-Gm-Message-State: AOJu0Yz5Rk+vpBRWOE9z1JD4vIBr3Vyge77XSM+0ZmZEaQmo7YU+hnK0
	UQd5aaDECus+FftBpK9SKpp+Eiz1OdFi8zipIBFUWarQkZyf14ihy1ldJB/4pETtxLHYKZcysDh
	A03L0ISs=
X-Gm-Gg: ATEYQzwQBch85E5sEMsrQvqJ68Wub6tbX55H+6RB31KZYsjr/yhiXmnTxyzy0R8BcxM
	DVXBR7XatSA2G2pbJIj3SX8Cb4vZUdBXUuEa57F1gn438NpZ5X3Q7KX7l5rS/KdIC36pdmb4mF6
	2gL3k8hmSvoiZ+Q4ITiuhhVxWLVgwxTHe0fKmj2Q5HGpBOlrCh+cOnja8VWiHNnBzRI/XqMr1aH
	efM+XX9p+hWrklz8nqRmGWRp+TWboGZb0sJMIBF2HLM9amskUR8NyQd/IGNq/tmr3gINuBbs+pv
	Wv47ie0h263HZxzfu99FlTZ9sSU+zyOq7fXkdAR3RkKCXa1yR3aJ/0/hKVHHgTTymEtCz199Az9
	VqkDQc5Vj2a4B0yka1aBIjS4Yr5twQqNXYH0leNBcbtRvAHEE/v2WsLspfdx+x5vaSUokCotY6x
	GVJHspzibSKPPWDkZaXuUEIyliqQ1KpNKAr/oeQpd5VWrkm5LHPoW2pXaZ0JSGXcmIMELbLCjls
	VsLjPvRlIY81JYYR2d6eBKzexN+SQ==
X-Received: by 2002:a05:690c:16:b0:79a:467a:3c57 with SMTP id 00721157ae682-79a71c95411mr9465947b3.54.1773781074058;
        Tue, 17 Mar 2026 13:57:54 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713df100sm5141577b3.11.2026.03.17.13.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:57:53 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 2/2] media: em28xx: Add Hauppauge 461e v3
Date: Tue, 17 Mar 2026 15:57:48 -0500
Message-Id: <20260317205748.3365679-3-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260317205748.3365679-1-brad@nextdimension.cc>
References: <20260317205748.3365679-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56131-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0F3E2B2774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Same as 461v2, but uses Montage ds3103c instead of ds3103b

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 34 +++++++++++++++++++------
 drivers/media/usb/em28xx/em28xx-dvb.c   | 25 ++++++++++++++----
 drivers/media/usb/em28xx/em28xx.h       |  1 +
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index b4bafd2fa482..0cadf0f6d99a 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -387,14 +387,14 @@ static const struct em28xx_reg_seq c3tech_digital_duo_digital[] = {
  * GPIO 7 = P07_LED (green LED)
  */
 static const struct em28xx_reg_seq pctv_461e[] = {
-	{EM2874_R80_GPIO_P0_CTRL,      0x7f, 0xff,    0},
-	{0x0d,                 0xff, 0xff,    0},
-	{EM2874_R80_GPIO_P0_CTRL,      0x3f, 0xff,  100}, /* reset demod */
-	{EM2874_R80_GPIO_P0_CTRL,      0x7f, 0xff,  200}, /* reset demod */
-	{0x0d,                 0x42, 0xff,    0},
-	{EM2874_R80_GPIO_P0_CTRL,      0xeb, 0xff,    0},
-	{EM2874_R5F_TS_ENABLE, 0x84, 0x84,    0}, /* parallel? | null discard */
-	{                  -1,   -1,   -1,   -1},
+	{EM2874_R80_GPIO_P0_CTRL,	0x7f,	0xff,	0},
+	{0x0d,				0xff,	0xff,	0},
+	{EM2874_R80_GPIO_P0_CTRL,	0x3f,	0xff,	100}, /* reset demod */
+	{EM2874_R80_GPIO_P0_CTRL,	0x7f,	0xff,	200}, /* reset demod */
+	{0x0d,				0x42,	0xff,	0},
+	{EM2874_R80_GPIO_P0_CTRL,	0xeb,	0xff,	0},
+	{EM2874_R5F_TS_ENABLE,		0x84,	0x84,	0}, /* parallel? | null discard */
+	{-1,				-1,	-1,	-1},
 };
 
 #if 0
@@ -2496,6 +2496,20 @@ const struct em28xx_board em28xx_boards[] = {
 		.has_dvb       = 1,
 		.ir_codes      = RC_MAP_PINNACLE_PCTV_HD,
 	},
+	/*
+	 * 2013:x462 PCTV DVB-S2 Stick (461e_v3)
+	 * Empia EM28178, Montage M88DS3103c, Montage M88TS2022, Allegro A8293
+	 */
+	[EM28178_BOARD_PCTV_461E_V3] = {
+		.def_i2c_bus   = 1,
+		.i2c_speed     = EM28XX_I2C_CLK_WAIT_ENABLE |
+				 EM28XX_I2C_FREQ_400_KHZ,
+		.name          = "PCTV DVB-S2 Stick (461e v3)",
+		.tuner_type    = TUNER_ABSENT,
+		.tuner_gpio    = pctv_461e,
+		.has_dvb       = 1,
+		.ir_codes      = RC_MAP_PINNACLE_PCTV_HD,
+	},
 	/*
 	 * 2013:025f PCTV tripleStick (292e).
 	 * Empia EM28178, Silicon Labs Si2168, Silicon Labs Si2157
@@ -3011,6 +3025,10 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28178_BOARD_PCTV_461E_V2 },
 	{ USB_DEVICE(0x2013, 0x0259),
 			.driver_info = EM28178_BOARD_PCTV_461E_V2 },
+	{ USB_DEVICE(0x2013, 0x0462),
+			.driver_info = EM28178_BOARD_PCTV_461E_V3 },
+	{ USB_DEVICE(0x2013, 0x8462), /* Bulk transport 461e v3 */
+			.driver_info = EM28178_BOARD_PCTV_461E_V3 },
 	{ USB_DEVICE(0x2013, 0x025f),
 			.driver_info = EM28178_BOARD_PCTV_292E },
 	{ USB_DEVICE(0x2013, 0x0264), /* Hauppauge WinTV-soloHD 292e SE */
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 2f0972072a00..0c8f5b0cdcd3 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -1237,7 +1237,7 @@ static int em28178_dvb_init_pctv_461e(struct em28xx *dev)
 	return 0;
 }
 
-static int em28178_dvb_init_pctv_461e_v2(struct em28xx *dev)
+static int em28178_dvb_init_pctv_461e_vX(struct em28xx *dev, int version)
 {
 	struct em28xx_dvb *dvb = dev->dvb;
 	struct i2c_adapter *i2c_adapter;
@@ -1254,9 +1254,19 @@ static int em28178_dvb_init_pctv_461e_v2(struct em28xx *dev)
 	m88ds3103_pdata.agc = 0x99;
 	m88ds3103_pdata.agc_inv = 0;
 	m88ds3103_pdata.spec_inv = 0;
-	dvb->i2c_client_demod[0] = dvb_module_probe("m88ds3103", "m88ds3103b",
-						 &dev->i2c_adap[dev->def_i2c_bus],
-						 0x6a, &m88ds3103_pdata);
+
+	if (version == 2)
+		dvb->i2c_client_demod[0] = dvb_module_probe("m88ds3103", "m88ds3103b",
+							    &dev->i2c_adap[dev->def_i2c_bus],
+							    0x6a, &m88ds3103_pdata);
+	else {
+		m88ds3103_pdata.lnb_hv_pol = 1;
+		m88ds3103_pdata.lnb_en_pol = 1;
+
+		dvb->i2c_client_demod[0] = dvb_module_probe("m88ds3103", "m88ds3103c",
+							    &dev->i2c_adap[dev->def_i2c_bus],
+							    0x6a, &m88ds3103_pdata);
+	}
 
 	if (!dvb->i2c_client_demod[0])
 		return -ENODEV;
@@ -2144,7 +2154,12 @@ static int em28xx_dvb_init(struct em28xx *dev)
 			goto out_free;
 		break;
 	case EM28178_BOARD_PCTV_461E_V2:
-		result = em28178_dvb_init_pctv_461e_v2(dev);
+		result = em28178_dvb_init_pctv_461e_vX(dev, 2);
+		if (result)
+			goto out_free;
+		break;
+	case EM28178_BOARD_PCTV_461E_V3:
+		result = em28178_dvb_init_pctv_461e_vX(dev, 3);
 		if (result)
 			goto out_free;
 		break;
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index ae4010c55623..e475dab25635 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -148,6 +148,7 @@
 #define EM2828X_BOARD_HAUPPAUGE_935_V2            109
 #define EM2828X_BOARD_HAUPPAUGE_955_V2            110
 #define EM2828X_BOARD_HAUPPAUGE_975_V2            111
+#define EM28178_BOARD_PCTV_461E_V3                112
 
 /* Limits minimum and default number of buffers */
 #define EM28XX_MIN_BUF 4
-- 
2.35.1


