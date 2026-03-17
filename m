Return-Path: <linux-media+bounces-56132-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJtSD1rAuWnJMQIAu9opvQ
	(envelope-from <linux-media+bounces-56132-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:58:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B212B277E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7007307416E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 20:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7E538C432;
	Tue, 17 Mar 2026 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="U7ORllqn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8FD189F43
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773781077; cv=none; b=tABrNS9pgxNImVREJ6W/1TA9O2tmLb/wODi4HTTV/L0f25NQwFD64POqVPgaZgI8yWnQzfKS3oQHslq8pGU/wOpsgCJso766173qkwiR0wuKOeT9EJM+n3o/RyQJ7nyYyc7069F4y53fe53dg1BNv64MNO8xPSdyz71K78RNtyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773781077; c=relaxed/simple;
	bh=pP4O/kFpv/q30N2iPIHHBF05RXfPeh5q0ob66IcJnK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U2oy4Ruxjq/2nZ66VOapbPzc2/TJbKSIdWwvWimVSzVoxcDDaJ6xyz8d+/VLN6cvm/StR3YxbSNYe2uAQsAY35YwQxST6dcFTg4IkVFGuQfWVZNns2D/REmaBUuTVk9lLijIw1hQELVWAySSxQA74azX5Pb1paB1+oS3crJKjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=U7ORllqn; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-794719afcd4so56982687b3.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773781074; x=1774385874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByrpCv6on1cVA+6YWq+peFaMvD1BSgRUqiUFufKsVZg=;
        b=U7ORllqnyU120oRZVbdLUhYM4zb+rMl+dFu0iz9jxqPWmrVYvscFDAXA7Hizjm6Gcg
         VvR7i/7kq847RwUlflsDP4vQk337lRgpeXCSUiV7SMxVi9aHdTI4EYaAF4HuZ3gDP+nZ
         BLsnXkZ9SVOKKSskeHE8C71YNtDLxxeQJ0dOBs1vTkg25pb2LhIbshlovDGBq4/s+qxS
         vPqUtnqIryWEvauUaYmtQq+ycgjHSeT8nvInK31uligHfyWfF5sTN1cBHsXm3/KIHMCd
         Hg8092LxN3xpOQxSilm2yU9Z6wtjTN6p/cnCDUhcrHrhgKbBeanvD45EcTKp/1GiS/Z5
         SN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773781074; x=1774385874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ByrpCv6on1cVA+6YWq+peFaMvD1BSgRUqiUFufKsVZg=;
        b=LFJk9y+evBJtb7LM2H+3uwKzACb8mdIz9xj9pKt6yZmX+BuMYdz/H/woz0caIdg66o
         1HSv4L7WpttqWcJ9mUkNjvGytuHDL/a/am5zpxTkHHhQkVuvktUw3+9KZDfKJkpYzWFm
         HKcuSS1Y8o5k5yUXa8nbOtsVBFCv+n1sqSr9AkNLH3WoQYQS2UXwbQG6gOeDfxCpAW7v
         RvWnSgrJS3LhQPz1AL7JK8bcVtD3CoofDb6VsVtMChnh2UTuHvNeCE1alwKoxSdW8N63
         2m18c9SZDraRLBLdgo8u1feCgw11aRotmiLj222mfvLR/CKDuueCmnt46HjmXWkEdBg9
         gIiA==
X-Gm-Message-State: AOJu0YyOZpFlgKGbsmr7su8zhYFtCqeTUcqpiw2mchThl7MJjoU8JdqR
	DWDZyiI9c/XjIb+F2Dvu4aq2xeQ8vUgXbKkXMyN1r+jUGiGM0RHt5qkeIJ6B1W1b4fmyt2Eprfx
	tN5VPdy4=
X-Gm-Gg: ATEYQzxfKRoHCDgGpmfljyBRXJ/41L5XBmE342P1BIhzJY5g2mi279u3fA+ugkKO1cw
	E/dMWHkrT5310c3LVgGSa5uRMJ2Z4Ku6+Z5mrfi5iU0fNw14ZHD/lhUz6a822f8VAbBjwO1YEwP
	qflOoho4XquEJBXNG0tzHTFpDGCZ8zXGwNIEZ5GkWg3t7nT6U9klOhoqjgwvyQYeY7iAWKp0j0q
	JIG6tOyncc3+2H57RWGY/EMtD548zcIkF5V4QfFrAFVPaOQxOpl/v0FoQCLjPHiUfdgSDAvBjgS
	DeRRSK/BXHroDhXeRH5FiK2cakc03VR+9PBF1OvtYqRbvvshHK9X/hdcNPXR0uOa156hoO1S3PN
	yws5Gvd0homxAvdshd3eYLuv67ULmOyVaCHaTZqbXGArDoVX+lUAmW1BMYQ+8gTcmJ/hGUsxh1b
	C5hrLDWyC3V7AyFVBL6KdlxkZNtsVwz20BRh1SnkNdl2thJQwCdJfxp7UWebTfBBY7LlVC1YNyB
	oG3+VQnOSJWw19P8nI=
X-Received: by 2002:a05:690c:90:b0:798:6619:f1ab with SMTP id 00721157ae682-79a71c7a984mr10723897b3.54.1773781073324;
        Tue, 17 Mar 2026 13:57:53 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713df100sm5141577b3.11.2026.03.17.13.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:57:52 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 1/2] media: m88ds3103: Implement 3103c chip support
Date: Tue, 17 Mar 2026 15:57:47 -0500
Message-Id: <20260317205748.3365679-2-brad@nextdimension.cc>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56132-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nextdimension.cc:dkim,nextdimension.cc:email,nextdimension.cc:mid]
X-Rspamd-Queue-Id: E2B212B277E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hauppauge 416e products have moved to using the 3103C satellite
demod. This demod behaves mostly like a 3103b, but has
different initialization, clocking, and lock operations.

This Linux code was reverse egineered entirely
using a Windows reference driver.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/dvb-frontends/m88ds3103.c      | 427 ++++++++++++++++---
 drivers/media/dvb-frontends/m88ds3103_priv.h |  46 +-
 2 files changed, 400 insertions(+), 73 deletions(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index be156180e5ef..17afa2a06569 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -78,22 +78,34 @@ static int m88ds3103b_dt_write(struct m88ds3103_dev *dev, int reg, int data)
 		.addr = dev->dt_addr, .flags = 0, .buf = buf, .len = 2
 	};
 
-	m88ds3103_update_bits(dev, 0x11, 0x01, 0x00);
+	if (dev->chip_id == M88DS3103C_CHIP_ID)
+		m88ds3103_update_bits(dev, 0x04, 0x10, 0x00);
+	else
+		m88ds3103_update_bits(dev, 0x11, 0x01, 0x00);
 
 	val = 0x11;
 	ret = regmap_write(dev->regmap, 0x03, val);
 	if (ret)
 		dev_dbg(&client->dev, "fail=%d\n", ret);
 
+
 	ret = i2c_transfer(dev->dt_client->adapter, &msg, 1);
 	if (ret != 1) {
 		dev_err(&client->dev, "0x%02x (ret=%i, reg=0x%02x, value=0x%02x)\n",
 			dev->dt_addr, ret, reg, data);
 
-		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+		if (dev->chip_id == M88DS3103C_CHIP_ID)
+			m88ds3103_update_bits(dev, 0x04, 0x10, 0x10);
+		else
+			m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+
 		return -EREMOTEIO;
 	}
-	m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+
+	if (dev->chip_id == M88DS3103C_CHIP_ID)
+		m88ds3103_update_bits(dev, 0x04, 0x10, 0x10);
+	else
+		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
 
 	dev_dbg(&client->dev, "0x%02x reg 0x%02x, value 0x%02x\n",
 		dev->dt_addr, reg, data);
@@ -127,9 +139,14 @@ static int m88ds3103b_dt_read(struct m88ds3103_dev *dev, u8 reg)
 		}
 	};
 
-	m88ds3103_update_bits(dev, 0x11, 0x01, 0x00);
+	if (dev->chip_id == M88DS3103C_CHIP_ID) {
+		m88ds3103_update_bits(dev, 0x04, 0x10, 0x00);
+		val = 0x11;
+	} else {
+		m88ds3103_update_bits(dev, 0x11, 0x01, 0x00);
+		val = 0x12;
+	}
 
-	val = 0x12;
 	ret = regmap_write(dev->regmap, 0x03, val);
 	if (ret)
 		dev_dbg(&client->dev, "fail=%d\n", ret);
@@ -139,10 +156,18 @@ static int m88ds3103b_dt_read(struct m88ds3103_dev *dev, u8 reg)
 		dev_err(&client->dev, "0x%02x (ret=%d, reg=0x%02x)\n",
 			dev->dt_addr, ret, reg);
 
-		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+		if (dev->chip_id == M88DS3103C_CHIP_ID)
+			m88ds3103_update_bits(dev, 0x04, 0x10, 0x10);
+		else
+			m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+
 		return -EREMOTEIO;
 	}
-	m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+
+	if (dev->chip_id == M88DS3103C_CHIP_ID)
+		m88ds3103_update_bits(dev, 0x04, 0x10, 0x10);
+	else
+		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
 
 	dev_dbg(&client->dev, "0x%02x reg 0x%02x, value 0x%02x\n",
 		dev->dt_addr, reg, b1[0]);
@@ -185,14 +210,25 @@ static int m88ds3103_read_status(struct dvb_frontend *fe,
 
 	switch (c->delivery_system) {
 	case SYS_DVBS:
-		ret = regmap_read(dev->regmap, 0xd1, &utmp);
-		if (ret)
-			goto err;
+		if (dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
+			ret = regmap_read(dev->regmap, 0x0d, &utmp);
+			if (ret)
+				goto err;
 
-		if ((utmp & 0x07) == 0x07)
-			*status = FE_HAS_SIGNAL | FE_HAS_CARRIER |
-					FE_HAS_VITERBI | FE_HAS_SYNC |
-					FE_HAS_LOCK;
+			if ((utmp & 0xf7) == 0xf7)
+				*status = FE_HAS_SIGNAL | FE_HAS_CARRIER |
+					  FE_HAS_VITERBI | FE_HAS_SYNC |
+					  FE_HAS_LOCK;
+		} else {
+			ret = regmap_read(dev->regmap, 0xd1, &utmp);
+			if (ret)
+				goto err;
+
+			if ((utmp & 0x07) == 0x07)
+				*status = FE_HAS_SIGNAL | FE_HAS_CARRIER |
+					  FE_HAS_VITERBI | FE_HAS_SYNC |
+					  FE_HAS_LOCK;
+		}
 		break;
 	case SYS_DVBS2:
 		ret = regmap_read(dev->regmap, 0x0d, &utmp);
@@ -201,8 +237,8 @@ static int m88ds3103_read_status(struct dvb_frontend *fe,
 
 		if ((utmp & 0x8f) == 0x8f)
 			*status = FE_HAS_SIGNAL | FE_HAS_CARRIER |
-					FE_HAS_VITERBI | FE_HAS_SYNC |
-					FE_HAS_LOCK;
+				  FE_HAS_VITERBI | FE_HAS_SYNC |
+				  FE_HAS_LOCK;
 		break;
 	default:
 		dev_dbg(&client->dev, "invalid delivery_system\n");
@@ -371,6 +407,7 @@ static int m88ds3103_read_status(struct dvb_frontend *fe,
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -428,8 +465,10 @@ static int m88ds3103b_select_mclk(struct m88ds3103_dev *dev)
 
 	reg15 = m88ds3103b_dt_read(dev, 0x15);
 
-	m88ds3103b_dt_write(dev, 0x05, 0x40);
-	m88ds3103b_dt_write(dev, 0x11, 0x08);
+	if (dev->chiptype != M88DS3103_CHIPTYPE_3103C) {
+		m88ds3103b_dt_write(dev, 0x05, 0x40);
+		m88ds3103b_dt_write(dev, 0x11, 0x08);
+	}
 
 	if (big_symbol)
 		reg15 |= 0x02;
@@ -441,8 +480,10 @@ static int m88ds3103b_select_mclk(struct m88ds3103_dev *dev)
 
 	usleep_range(5000, 5500);
 
-	m88ds3103b_dt_write(dev, 0x05, 0x00);
-	m88ds3103b_dt_write(dev, 0x11, (u8)(big_symbol ? 0x0E : 0x0A));
+	if (dev->chiptype != M88DS3103_CHIPTYPE_3103C) {
+		m88ds3103b_dt_write(dev, 0x05, 0x00);
+		m88ds3103b_dt_write(dev, 0x11, (u8)(big_symbol ? 0x0E : 0x0A));
+	}
 
 	usleep_range(5000, 5500);
 
@@ -583,12 +624,6 @@ static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
 
 	sm = N - 1;
 
-	/* Write to registers */
-	//reg15 &= 0x01;
-	//reg15 |= (pll_div_fb >> 8) & 0x01;
-
-	//reg16 = pll_div_fb & 0xFF;
-
 	reg1D &= ~0x03;
 	reg1D |= sm;
 	reg1D |= 0x80;
@@ -596,8 +631,11 @@ static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
 	reg1E = ((f3 << 4) + f2) & 0xFF;
 	reg1F = ((f1 << 4) + f0) & 0xFF;
 
-	m88ds3103b_dt_write(dev, 0x05, 0x40);
-	m88ds3103b_dt_write(dev, 0x11, 0x08);
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
+		m88ds3103b_dt_write(dev, 0x05, 0x40);
+		m88ds3103b_dt_write(dev, 0x11, 0x08);
+	}
+
 	m88ds3103b_dt_write(dev, 0x1D, reg1D);
 	m88ds3103b_dt_write(dev, 0x1E, reg1E);
 	m88ds3103b_dt_write(dev, 0x1F, reg1F);
@@ -607,14 +645,89 @@ static int m88ds3103b_set_mclk(struct m88ds3103_dev *dev, u32 mclk_khz)
 
 	usleep_range(5000, 5500);
 
-	m88ds3103b_dt_write(dev, 0x05, 0x00);
-	m88ds3103b_dt_write(dev, 0x11, 0x0A);
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
+		m88ds3103b_dt_write(dev, 0x05, 0x00);
+		m88ds3103b_dt_write(dev, 0x11, 0x0A);
+	}
 
 	usleep_range(5000, 5500);
 
 	return 0;
 }
 
+static int mt_fe_dmd_ds3103c_set_ts_out_mode(struct dvb_frontend *fe, enum m88ds3103_ts_mode mode)
+{
+	struct m88ds3103_dev *dev = fe->demodulator_priv;
+	struct i2c_client *client = dev->client;
+
+	unsigned int tmp, val = 0, ret = 0;
+
+	ret = regmap_read(dev->regmap, 0x0b, &val);
+	val &= ~0x01;
+	ret = regmap_write(dev->regmap, 0x0b, val);
+
+	ret = regmap_read(dev->regmap, 0xfd, &tmp);
+	if (mode == M88DS3103_TS_PARALLEL) {
+		tmp &= ~0x01;
+		tmp &= ~0x04;
+
+		regmap_write(dev->regmap, 0xfa, 0x01);
+		regmap_write(dev->regmap, 0xf1, 0x60);
+		regmap_write(dev->regmap, 0xfa, 0x00);
+	} else if (mode == M88DS3103_TS_SERIAL) {
+		tmp &= ~0x01;
+		tmp |= 0x04;
+	} else {
+		tmp |= 0x01;
+		tmp &= ~0x04;
+
+		regmap_write(dev->regmap, 0xfa, 0x01);
+		regmap_write(dev->regmap, 0xf1, 0x60);
+		regmap_write(dev->regmap, 0xfa, 0x00);
+	}
+
+	if (dev->cfg->ts_clk_pol) {
+		tmp &= ~0xf8;
+		tmp |= 0x02;
+	} else {
+		tmp &= ~0xb8;
+		tmp |= 0x42;
+	}
+
+	tmp |= 0x80;
+	regmap_write(dev->regmap, 0xfd, tmp);
+
+	val = 0;
+	if (mode != M88DS3103_TS_SERIAL) {
+		tmp = M88DS3103_TS_CI;
+
+		val |= tmp & 0x03;
+		val |= (tmp << 2) & 0x0C;
+		val |= (tmp << 4) & 0x30;
+		val |= (tmp << 6) & 0xC0;
+	} else
+		val = 0x00;
+
+	regmap_write(dev->regmap, 0x0a, val);
+
+	regmap_read(dev->regmap, 0x0b, &tmp);
+
+	tmp &= ~0x20;
+	tmp |= 0x01;
+
+	regmap_write(dev->regmap, 0x0b, tmp);
+
+
+	ret = regmap_read(dev->regmap, 0x0c, &tmp);
+
+	regmap_write(dev->regmap, 0xf4, 0x01);
+
+	tmp &= ~0x80;
+	regmap_write(dev->regmap, 0x0c, tmp);
+
+	return 0;
+}
+
 static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 {
 	struct m88ds3103_dev *dev = fe->demodulator_priv;
@@ -627,6 +740,7 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	u16 u16tmp;
 	u32 tuner_frequency_khz, target_mclk, u32tmp;
 	s32 s32tmp;
+	unsigned int utmp;
 	static const struct reg_sequence reset_buf[] = {
 		{0x07, 0x80}, {0x07, 0x00}
 	};
@@ -646,9 +760,14 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
 
+	/* Clear TS */
+	ret = regmap_write(dev->regmap, 0xf5, 0x00);
+
 	/* Disable demod clock path */
-	if (dev->chip_id == M88RS6000_CHIP_ID) {
-		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
+	if (dev->chip_id == M88RS6000_CHIP_ID ||
+	    dev->chip_id == M88DS3103C_CHIP_ID) {
+		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B ||
+		    dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
 			ret = regmap_read(dev->regmap, 0xb2, &u32tmp);
 			if (ret)
 				goto err;
@@ -688,7 +807,8 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	}
 
 	/* set M88RS6000/DS3103B demod main mclk and ts mclk from tuner die */
-	if (dev->chip_id == M88RS6000_CHIP_ID) {
+	if (dev->chip_id == M88RS6000_CHIP_ID ||
+	    dev->chip_id == M88DS3103C_CHIP_ID) {
 		if (c->symbol_rate > 45010000)
 			dev->mclk = 110250000;
 		else
@@ -699,7 +819,8 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 		else
 			target_mclk = 144000000;
 
-		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
+		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B ||
+		    dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
 			m88ds3103b_select_mclk(dev);
 			m88ds3103b_set_mclk(dev, target_mclk / 1000);
 		}
@@ -772,6 +893,9 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 		if (dev->chip_id == M88RS6000_CHIP_ID) {
 			len = ARRAY_SIZE(m88rs6000_dvbs_init_reg_vals);
 			init = m88rs6000_dvbs_init_reg_vals;
+		} else if (dev->chip_id == M88DS3103C_CHIP_ID) {
+			len = ARRAY_SIZE(m88ds3103c_dvbs_init_reg_vals);
+			init = m88ds3103c_dvbs_init_reg_vals;
 		} else {
 			len = ARRAY_SIZE(m88ds3103_dvbs_init_reg_vals);
 			init = m88ds3103_dvbs_init_reg_vals;
@@ -781,6 +905,9 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 		if (dev->chip_id == M88RS6000_CHIP_ID) {
 			len = ARRAY_SIZE(m88rs6000_dvbs2_init_reg_vals);
 			init = m88rs6000_dvbs2_init_reg_vals;
+		} else if (dev->chip_id == M88DS3103C_CHIP_ID) {
+			len = ARRAY_SIZE(m88ds3103c_dvbs_init_reg_vals);
+			init = m88ds3103c_dvbs_init_reg_vals;
 		} else {
 			len = ARRAY_SIZE(m88ds3103_dvbs2_init_reg_vals);
 			init = m88ds3103_dvbs2_init_reg_vals;
@@ -799,7 +926,8 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 			goto err;
 	}
 
-	if (dev->chip_id == M88RS6000_CHIP_ID) {
+	if (dev->chip_id == M88RS6000_CHIP_ID ||
+	    dev->chip_id == M88DS3103C_CHIP_ID) {
 		if (c->delivery_system == SYS_DVBS2 &&
 		    c->symbol_rate <= 5000000) {
 			ret = regmap_write(dev->regmap, 0xc0, 0x04);
@@ -812,11 +940,14 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 			if (ret)
 				goto err;
 		}
-		ret = m88ds3103_update_bits(dev, 0x9d, 0x08, 0x08);
-		if (ret)
-			goto err;
+		if (dev->chip_id != M88DS3103C_CHIP_ID) {
+			ret = m88ds3103_update_bits(dev, 0x9d, 0x08, 0x08);
+			if (ret)
+				goto err;
+		}
 
-		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
+		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B ||
+		    dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
 			buf[0] = m88ds3103b_dt_read(dev, 0x15);
 			buf[1] = m88ds3103b_dt_read(dev, 0x16);
 
@@ -838,15 +969,22 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 			m88ds3103b_dt_write(dev, 0x16, buf[1]);
 
 			regmap_read(dev->regmap, 0x30, &u32tmp);
-			u32tmp &= ~0x80;
-			regmap_write(dev->regmap, 0x30, u32tmp & 0xff);
+			if (dev->chip_id == M88DS3103C_CHIP_ID) {
+				regmap_write(dev->regmap, 0x30, dev->config.agc_inv ? 0x18 : 0x08);
+			} else {
+				u32tmp &= ~0x80;
+				regmap_write(dev->regmap, 0x30, u32tmp & 0xff);
+			}
 		}
 
-		ret = regmap_write(dev->regmap, 0xf1, 0x01);
-		if (ret)
-			goto err;
+		if (dev->chip_id != M88DS3103C_CHIP_ID) {
+			ret = regmap_write(dev->regmap, 0xf1, 0x01);
+			if (ret)
+				goto err;
+		}
 
-		if (dev->chiptype != M88DS3103_CHIPTYPE_3103B) {
+		if (dev->chiptype != M88DS3103_CHIPTYPE_3103B &&
+		    dev->chiptype != M88DS3103_CHIPTYPE_3103C) {
 			ret = m88ds3103_update_bits(dev, 0x30, 0x80, 0x80);
 			if (ret)
 				goto err;
@@ -864,7 +1002,8 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 		break;
 	case M88DS3103_TS_PARALLEL:
 		u8tmp = 0x02;
-		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
+		if (dev->chiptype == M88DS3103_CHIPTYPE_3103B ||
+		    dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
 			u8tmp = 0x01;
 			u8tmp1 = 0x01;
 		}
@@ -881,10 +1020,12 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	if (dev->cfg->ts_clk_pol)
 		u8tmp |= 0x40;
 
-	/* TS mode */
-	ret = regmap_write(dev->regmap, 0xfd, u8tmp);
-	if (ret)
-		goto err;
+	if (dev->chiptype != M88DS3103_CHIPTYPE_3103C) {
+		/* TS mode */
+		ret = regmap_write(dev->regmap, 0xfd, u8tmp);
+		if (ret)
+			goto err;
+	}
 
 	switch (dev->cfg->ts_mode) {
 	case M88DS3103_TS_SERIAL:
@@ -918,7 +1059,12 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	ret = regmap_update_bits(dev->regmap, 0xfe, 0x0f, u8tmp);
 	if (ret)
 		goto err;
-	u8tmp = ((u8tmp1 & 0x03) << 6) | u8tmp2 >> 0;
+
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103C)
+		u8tmp = 0xcb;
+	else
+		u8tmp = ((u8tmp1 & 0x03) << 6) | u8tmp2 >> 0;
+
 	ret = regmap_write(dev->regmap, 0xea, u8tmp);
 	if (ret)
 		goto err;
@@ -930,7 +1076,8 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	else
 		u8tmp = 0x06;
 
-	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B)
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B ||
+	    dev->chiptype == M88DS3103_CHIPTYPE_3103C)
 		m88ds3103b_set_mclk(dev, target_mclk / 1000);
 
 	ret = regmap_write(dev->regmap, 0xc3, 0x08);
@@ -949,9 +1096,14 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
 
-	u16tmp = DIV_ROUND_CLOSEST_ULL((u64)c->symbol_rate * 0x10000, dev->mclk);
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103C)
+		u16tmp = DIV_ROUND_CLOSEST_ULL((((u64)c->symbol_rate << 15) + dev->mclk / 4), (dev->mclk / 2));
+	else
+		u16tmp = DIV_ROUND_CLOSEST_ULL((u64)c->symbol_rate * 0x10000, dev->mclk);
+
 	buf[0] = (u16tmp >> 0) & 0xff;
 	buf[1] = (u16tmp >> 8) & 0xff;
+
 	ret = regmap_bulk_write(dev->regmap, 0x61, buf, 2);
 	if (ret)
 		goto err;
@@ -960,7 +1112,15 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
 
-	ret = m88ds3103_update_bits(dev, 0x30, 0x10, dev->cfg->agc_inv << 4);
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B)
+		ret = m88ds3103_update_bits(dev, 0x30, 0x08, dev->cfg->agc_inv << 3);
+	else if (dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
+		ret = m88ds3103_update_bits(dev, 0x08, 0x43, 0x43);
+
+		ret = m88ds3103_update_bits(dev, 0x30, 0x18, dev->cfg->agc_inv ? 0x18 : 0x08);
+	} else
+		ret = m88ds3103_update_bits(dev, 0x30, 0x10, dev->cfg->agc_inv << 4);
+
 	if (ret)
 		goto err;
 
@@ -974,10 +1134,37 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 				(c->delivery_system == SYS_DVBS) ? 0x10 : 0x0);
 		if (ret)
 			goto err;
+	}
+
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
+		ret = m88ds3103_update_bits(dev, 0x76, 0x80, 0x00);
+		if (ret)
+			goto err;
+
+		ret = m88ds3103_update_bits(dev, 0x22, 0x01, 0x01);
+		ret = m88ds3103_update_bits(dev, 0x23, 0x01, 0x00);
+		ret = m88ds3103_update_bits(dev, 0x24, 0x01, 0x00);
 
 		ret = m88ds3103_update_bits(dev, 0xc9, 0x08, 0x08);
 		if (ret)
 			goto err;
+
+		ret = regmap_read(dev->regmap, 0x08, &utmp);
+		if (ret)
+			goto err;
+
+		if (c->delivery_system == SYS_DVBS) {
+			utmp = (utmp & 0xfb) | 0x40;
+			regmap_write(dev->regmap, 0x08, utmp);
+			regmap_write(dev->regmap, 0xe0, 0xf8);
+		} else if (c->delivery_system == SYS_DVBS2) {
+			utmp = utmp | 0x44;
+			regmap_write(dev->regmap, 0x08, utmp);
+		} else {
+			utmp = utmp & 0xbb;
+			regmap_write(dev->regmap, 0x08, utmp);
+			regmap_write(dev->regmap, 0xe0, 0xf8);
+		}
 	}
 
 	dev_dbg(&client->dev, "carrier offset=%d\n",
@@ -986,8 +1173,12 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	/* Use 32-bit calc as there is no s64 version of DIV_ROUND_CLOSEST() */
 	s32tmp = 0x10000 * (tuner_frequency_khz - c->frequency);
 	s32tmp = DIV_ROUND_CLOSEST(s32tmp, dev->mclk / 1000);
+
+	usleep_range(1000, 1200);
+
 	buf[0] = (s32tmp >> 0) & 0xff;
 	buf[1] = (s32tmp >> 8) & 0xff;
+
 	ret = regmap_bulk_write(dev->regmap, 0x5e, buf, 2);
 	if (ret)
 		goto err;
@@ -1012,6 +1203,7 @@ static int m88ds3103_set_frontend(struct dvb_frontend *fe)
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1025,19 +1217,72 @@ static int m88ds3103_init(struct dvb_frontend *fe)
 	const struct firmware *firmware;
 	const char *name;
 
+
 	dev_dbg(&client->dev, "\n");
 
 	/* set cold state by default */
 	dev->warm = false;
 
 	/* wake up device from sleep */
-	ret = m88ds3103_update_bits(dev, 0x08, 0x01, 0x01);
-	if (ret)
-		goto err;
-	ret = m88ds3103_update_bits(dev, 0x04, 0x01, 0x00);
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
+		ret = m88ds3103_update_bits(dev, 0x0b, 0x90, 0x80);	/* set dt_addr */
+
+		m88ds3103b_dt_write(dev, 0x04, 0x01);	/* reset */
+		m88ds3103b_dt_write(dev, 0x04, 0x00);
+		usleep_range(800, 1200);
+
+		ret = m88ds3103_update_bits(dev, 0x04, 0x01, 0x00);
+		if (ret)
+			goto err;
+
+		m88ds3103b_dt_write(dev, 0x10, 0x01);	/* wakeup */
+		m88ds3103b_dt_write(dev, 0x11, 0x01);	/* wakeup */
+
+		ret = m88ds3103_update_bits(dev, 0x08, 0x01, 0x01);
+		if (ret)
+			goto err;
+
+		ret = m88ds3103_update_bits(dev, 0x0b, 0x01, 0x01);
+		if (ret)
+			goto err;
+		/* global reset, global diseqc reset, global fec reset */
+		ret = regmap_write(dev->regmap, 0x07, 0x80);
+		if (ret)
+			goto err;
+		ret = regmap_write(dev->regmap, 0x07, 0x00);
+		if (ret)
+			goto err;
+		usleep_range(800, 1200);
+
+		ret = m88ds3103_update_bits(dev, 0x08, 0x01, 0x01);
+		if (ret)
+			goto err;
+	} else {
+		ret = m88ds3103_update_bits(dev, 0x08, 0x01, 0x01);
+		if (ret)
+			goto err;
+		ret = m88ds3103_update_bits(dev, 0x04, 0x01, 0x00);
+		if (ret)
+			goto err;
+		ret = m88ds3103_update_bits(dev, 0x23, 0x10, 0x00);
+		if (ret)
+			goto err;
+	}
+
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
+		m88ds3103b_dt_write(dev, 0x10, 0x01);	/* wakeup */
+		m88ds3103b_dt_write(dev, 0x11, 0x01);	/* wakeup */
+		m88ds3103b_dt_write(dev, 0x24, 0x04);
+		m88ds3103b_dt_write(dev, 0x84, 0x04);
+		m88ds3103b_dt_write(dev, 0x15, 0x6c);
+		usleep_range(800, 1200);
+	}
+
+	/* global reset, global diseqc reset, global fec reset */
+	ret = regmap_write(dev->regmap, 0x07, 0xe0);
 	if (ret)
 		goto err;
-	ret = m88ds3103_update_bits(dev, 0x23, 0x10, 0x00);
+	ret = regmap_write(dev->regmap, 0x07, 0x00);
 	if (ret)
 		goto err;
 
@@ -1051,20 +1296,14 @@ static int m88ds3103_init(struct dvb_frontend *fe)
 	if (utmp)
 		goto warm;
 
-	/* global reset, global diseqc reset, global fec reset */
-	ret = regmap_write(dev->regmap, 0x07, 0xe0);
-	if (ret)
-		goto err;
-	ret = regmap_write(dev->regmap, 0x07, 0x00);
-	if (ret)
-		goto err;
-
 	/* cold state - try to download firmware */
 	dev_info(&client->dev, "found a '%s' in cold state\n",
 		 dev->fe.ops.info.name);
 
 	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B)
 		name = M88DS3103B_FIRMWARE;
+	else if (dev->chiptype == M88DS3103_CHIPTYPE_3103C)
+		name = M88DS3103C_FIRMWARE;
 	else if (dev->chip_id == M88RS6000_CHIP_ID)
 		name = M88RS6000_FIRMWARE;
 	else
@@ -1116,6 +1355,18 @@ static int m88ds3103_init(struct dvb_frontend *fe)
 	dev_info(&client->dev, "firmware version: %X.%X\n",
 		 (utmp >> 4) & 0xf, (utmp >> 0 & 0xf));
 
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
+		mt_fe_dmd_ds3103c_set_ts_out_mode(fe, dev->cfg->ts_mode);
+
+		ret = m88ds3103_update_bits(dev, 0x4d, 0x02, dev->cfg->spec_inv << 1);
+		if (ret)
+			goto err;
+
+		ret = m88ds3103_update_bits(dev, 0x30, 0x10, dev->cfg->agc_inv ? 0x10 : 0x00);
+		if (ret)
+			goto err;
+	}
+
 	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
 		m88ds3103b_dt_write(dev, 0x21, 0x92);
 		m88ds3103b_dt_write(dev, 0x15, 0x6C);
@@ -1139,6 +1390,7 @@ static int m88ds3103_init(struct dvb_frontend *fe)
 	release_firmware(firmware);
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1157,6 +1409,8 @@ static int m88ds3103_sleep(struct dvb_frontend *fe)
 	/* TS Hi-Z */
 	if (dev->chip_id == M88RS6000_CHIP_ID)
 		utmp = 0x29;
+	else if (dev->chip_id == M88DS3103C_CHIP_ID)
+		utmp = 0x0b;
 	else
 		utmp = 0x27;
 	ret = m88ds3103_update_bits(dev, utmp, 0x01, 0x00);
@@ -1167,6 +1421,17 @@ static int m88ds3103_sleep(struct dvb_frontend *fe)
 	ret = m88ds3103_update_bits(dev, 0x08, 0x01, 0x00);
 	if (ret)
 		goto err;
+
+	/* Internal tuner sleep */
+	if (dev->chip_id == M88DS3103C_CHIP_ID) {
+		ret = m88ds3103b_dt_write(dev, 0x10, 0x00);
+		if (ret)
+			goto err;
+		ret = m88ds3103b_dt_write(dev, 0x11, 0x00);
+		if (ret)
+			goto err;
+	}
+
 	ret = m88ds3103_update_bits(dev, 0x04, 0x01, 0x01);
 	if (ret)
 		goto err;
@@ -1177,6 +1442,7 @@ static int m88ds3103_sleep(struct dvb_frontend *fe)
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1341,11 +1607,13 @@ static int m88ds3103_get_frontend(struct dvb_frontend *fe,
 	if (ret)
 		goto err;
 
+//	dev_dbg(&client->dev, "%s()  0x%X  |  0x%X\n", __func__, buf[0], buf[1]);
 	c->symbol_rate = DIV_ROUND_CLOSEST_ULL((u64)(buf[1] << 8 | buf[0] << 0) * dev->mclk, 0x10000);
 
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1378,7 +1646,7 @@ static int m88ds3103_set_tone(struct dvb_frontend *fe,
 	int ret;
 	unsigned int utmp, tone, reg_a1_mask;
 
-	dev_dbg(&client->dev, "fe_sec_tone_mode=%d\n", fe_sec_tone_mode);
+	dev_dbg(&client->dev, "fe_sec_tone_mode=%s\n", fe_sec_tone_mode == SEC_TONE_ON ? "ON" : "OFF");
 
 	if (!dev->warm) {
 		ret = -EAGAIN;
@@ -1413,6 +1681,7 @@ static int m88ds3103_set_tone(struct dvb_frontend *fe,
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1463,6 +1732,7 @@ static int m88ds3103_set_voltage(struct dvb_frontend *fe,
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1542,6 +1812,7 @@ static int m88ds3103_diseqc_send_master_cmd(struct dvb_frontend *fe,
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1621,6 +1892,7 @@ static int m88ds3103_diseqc_send_burst(struct dvb_frontend *fe,
 	return 0;
 err:
 	dev_dbg(&client->dev, "failed=%d\n", ret);
+
 	return ret;
 }
 
@@ -1818,6 +2090,7 @@ static int m88ds3103_probe(struct i2c_client *client)
 	switch (dev->chip_id) {
 	case M88RS6000_CHIP_ID:
 	case M88DS3103_CHIP_ID:
+	case M88DS3103C_CHIP_ID:
 		break;
 	default:
 		ret = -ENODEV;
@@ -1847,7 +2120,8 @@ static int m88ds3103_probe(struct i2c_client *client)
 
 	/* 0x29 register is defined differently for m88rs6000. */
 	/* set internal tuner address to 0x21 */
-	if (dev->chip_id == M88RS6000_CHIP_ID)
+	if (dev->chip_id == M88RS6000_CHIP_ID ||
+	    dev->chip_id == M88DS3103C_CHIP_ID)
 		utmp = 0x00;
 
 	ret = regmap_write(dev->regmap, 0x29, utmp);
@@ -1882,6 +2156,9 @@ static int m88ds3103_probe(struct i2c_client *client)
 	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B)
 		strscpy(dev->fe.ops.info.name, "Montage Technology M88DS3103B",
 			sizeof(dev->fe.ops.info.name));
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103C)
+		strscpy(dev->fe.ops.info.name, "Montage Technology M88DS3103C",
+			sizeof(dev->fe.ops.info.name));
 	else if (dev->chip_id == M88RS6000_CHIP_ID)
 		strscpy(dev->fe.ops.info.name, "Montage Technology M88RS6000",
 			sizeof(dev->fe.ops.info.name));
@@ -1894,15 +2171,22 @@ static int m88ds3103_probe(struct i2c_client *client)
 	pdata->get_dvb_frontend = m88ds3103_get_dvb_frontend;
 	pdata->get_i2c_adapter = m88ds3103_get_i2c_adapter;
 
-	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B) {
+	if (dev->chiptype == M88DS3103_CHIPTYPE_3103B ||
+	    dev->chiptype == M88DS3103_CHIPTYPE_3103C) {
 		/* enable i2c repeater for tuner */
-		m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
+		if (dev->chip_id == M88DS3103C_CHIP_ID)
+			m88ds3103_update_bits(dev, 0x04, 0x10, 0x10);
+		else
+			m88ds3103_update_bits(dev, 0x11, 0x01, 0x01);
 
 		/* get frontend address */
 		ret = regmap_read(dev->regmap, 0x29, &utmp);
 		if (ret)
 			goto err_del_adapters;
+
 		dev->dt_addr = ((utmp & 0x80) == 0) ? 0x42 >> 1 : 0x40 >> 1;
+		if (dev->chiptype == M88DS3103_CHIPTYPE_3103C)
+			dev->dt_addr = 0x5c >> 1;
 		dev_dbg(&client->dev, "dt addr is 0x%02x\n", dev->dt_addr);
 
 		dev->dt_client = i2c_new_dummy_device(client->adapter,
@@ -1941,6 +2225,7 @@ static const struct i2c_device_id m88ds3103_id_table[] = {
 	{"m88ds3103",  M88DS3103_CHIPTYPE_3103},
 	{"m88rs6000",  M88DS3103_CHIPTYPE_RS6000},
 	{"m88ds3103b", M88DS3103_CHIPTYPE_3103B},
+	{"m88ds3103c", M88DS3103_CHIPTYPE_3103C},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, m88ds3103_id_table);
diff --git a/drivers/media/dvb-frontends/m88ds3103_priv.h b/drivers/media/dvb-frontends/m88ds3103_priv.h
index 594ad9cbc2cc..d7d16e7904da 100644
--- a/drivers/media/dvb-frontends/m88ds3103_priv.h
+++ b/drivers/media/dvb-frontends/m88ds3103_priv.h
@@ -17,15 +17,18 @@
 #include <linux/math64.h>
 
 #define M88DS3103B_FIRMWARE "dvb-demod-m88ds3103b.fw"
+#define M88DS3103C_FIRMWARE "dvb-demod-m88ds3103c.fw"
 #define M88DS3103_FIRMWARE  "dvb-demod-m88ds3103.fw"
 #define M88RS6000_FIRMWARE  "dvb-demod-m88rs6000.fw"
 
-#define M88RS6000_CHIP_ID 0x74
-#define M88DS3103_CHIP_ID 0x70
+#define M88DS3103_CHIP_ID  0x70
+#define M88RS6000_CHIP_ID  0x74
+#define M88DS3103C_CHIP_ID 0x71
 
 #define M88DS3103_CHIPTYPE_3103   0
 #define M88DS3103_CHIPTYPE_RS6000 1
 #define M88DS3103_CHIPTYPE_3103B  2
+#define M88DS3103_CHIPTYPE_3103C  3
 
 struct m88ds3103_dev {
 	struct i2c_client *client;
@@ -399,4 +402,43 @@ static const struct m88ds3103_reg_val m88rs6000_dvbs2_init_reg_vals[] = {
 	{0xb8, 0x00},
 	{0x29, 0x01},
 };
+
+static const struct m88ds3103_reg_val m88ds3103c_dvbs_init_reg_vals[] = {
+	{0x04, 0x10},
+	{0x8a, 0x01},
+	{0x16, 0xa7},
+	{0x30, 0x08},
+	{0x32, 0x32},
+	{0x33, 0x35},
+	{0x35, 0xff},
+	{0x4a, 0x80},
+	{0x4d, 0x93},
+	{0xae, 0x09},
+	{0x22, 0x01},
+	{0x23, 0x00},
+	{0x24, 0x00},
+	{0x27, 0x07},
+	{0x9c, 0x31},
+	{0x9d, 0xc1},
+	{0xcb, 0xf4},
+	{0xca, 0x00},
+	{0x7f, 0x04},
+	{0x78, 0x0c},
+	{0x85, 0x08},
+	{0x08, 0x47},
+	{0xf0, 0x03},
+	{0xfa, 0x01},
+	{0xf2, 0x00},
+	{0xfa, 0x00},
+	{0xe6, 0x00},
+	{0xe7, 0xf3},
+	{0x08, 0x43},
+	{0xe0, 0xf8},
+	{0x00, 0x00},
+	{0xbd, 0x82},
+	{0x80, 0xa8},
+	{0x81, 0xea},
+	{0xbe, 0xa1}
+};
+
 #endif
-- 
2.35.1


