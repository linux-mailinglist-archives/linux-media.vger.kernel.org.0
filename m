Return-Path: <linux-media+bounces-18800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79AE98A184
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBEE71C2136D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE2A18E36B;
	Mon, 30 Sep 2024 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bx635g+1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6E192D73
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697871; cv=none; b=T6gS5QneSul714C/eOxFJvMkhnSZ5gKJNoA4VuxwtifLHqs0n00FbJx3WVnefoz5vdoUMsEFR6xRzX7dNOPLpKnuQsfcR7D5BabccIos7rZ/nhP11KUk2MGBweve43VJaRQ5nDqAEodHmCpqZKjZtnSa5rsVwCtxD2ZvO/pR6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697871; c=relaxed/simple;
	bh=Fj4hGSAt0kunFV3KWV3o9auUA/DMd0UV/ICWjq4I7Sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMW9VYXpp9pcUMzxaj5fql2tM677LJszxmEZA1Oai9yIXYWvJl5/mW8pRAz5UCqr8AvjYtmDeOHzzQS4O4nD/FBSCnpBqMwge1VKgBzUJkaR+6J6qxglCxL/DvgPssZMA21tWT8obMpjY8K1vTo+MbdDCPIGML8VgbCu17FhVjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bx635g+1; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb2cba60e1so22310776d6.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697868; x=1728302668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twxbXJ5TDeltaVeKhttrEsGiOfaRdH40FC0hJR39r6Y=;
        b=Bx635g+15ygoQNcr+uvdEZL83Hq6iG7XNDJQryHgpYp9msjQk84Jggo1Ykwol3kuGV
         heoqxCo0mBJ9XUWPq/iSbECsTVIAzA2QxA4v7QpBDpf8JW49O2U5rYgC/9aXH5K93inm
         N55NeqXA37d7y58i0QIiMlUw1IgUWdIi0+t40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697868; x=1728302668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twxbXJ5TDeltaVeKhttrEsGiOfaRdH40FC0hJR39r6Y=;
        b=PlGhCxfJS9QjnGhDrLXtQvKyinJXqSdeEHHNfDpdAaywelxldMnPl9t5u1NqTKNFlY
         e0gShpL/7erMVHgfVqhVwUxpw2ddKYHaWJF+0FmQfHUuzNJ8POCbnB8ZSrczFQSF5HFO
         F2X98omfyqi+HZgct8UiLA5lde21IUC4BeXpRdJk3teuejOGOxx4hIzT5MoaZV/k+5Ei
         DYWxFjInYAN+Cbnz7jZGxH6dQz/goNIIElpoGtzDddpqu2sbOFjeqpf8r5nRTxPRhVzR
         cFwBl/ky6tKLhamEVk11JSOaY1uOsEOsD4RdIDRVDQv/uicev/uShjZC+O/LbAC8MFUH
         4VBw==
X-Gm-Message-State: AOJu0Yz5BQwD8dLf7Dv2Ky1vRrX6n0/ZC/eS6lReiIq31jCcB/m2ZtG4
	ie5WCjYZuRlvDsiUeS0N4YVpDtUQU8gvg2UtjgZHPJ6Z+GG0bsVhiPwmgOPMNQ==
X-Google-Smtp-Source: AGHT+IHtaxsqjQiVBMHhpTB74imzDxkcStWQYXWBLNrF2q84xYJXsQbMLDqKSk4hEvyHVvp0GEvPAw==
X-Received: by 2002:a05:6214:5701:b0:6cb:2cfa:3b9d with SMTP id 6a1803df08f44-6cb3b5cafb1mr203537826d6.14.1727697867933;
        Mon, 30 Sep 2024 05:04:27 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:07 +0000
Subject: [PATCH 12/45] media: dvb-frontends: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-12-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/dvb-frontends/cx24120.c:456:3-9: opportunity for str_enable_disable(enable)
drivers/media/dvb-frontends/cx24120.c:462:2-8: opportunity for str_enabled_disabled(enable)
drivers/media/dvb-frontends/helene.c:282:4-14: opportunity for str_read_write(write == 0)
drivers/media/dvb-frontends/cxd2841er.c:209:3-13: opportunity for str_read_write(write == 0)
drivers/media/dvb-frontends/drxk_hard.c:6282:22-28: opportunity for str_enable_disable(enable)
drivers/media/dvb-frontends/drxk_hard.c:1071:2-13: opportunity for str_enable_disable(mpeg_enable)
drivers/media/dvb-frontends/sp2.c:135:3-9: opportunity for str_read_write(( read ))
drivers/media/dvb-frontends/horus3a.c:41:3-13: opportunity for str_read_write(write == 0)
drivers/media/dvb-frontends/ascot2e.c:107:3-13: opportunity for str_read_write(write == 0)
drivers/media/usb/dvb-usb/af9005-fe.c:1282:27-31: opportunity for str_high_low(temp)
drivers/media/usb/dvb-usb/af9005-fe.c:790:30-32: opportunity for str_on_off(on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/ascot2e.c   | 2 +-
 drivers/media/dvb-frontends/cx24120.c   | 4 ++--
 drivers/media/dvb-frontends/cxd2841er.c | 2 +-
 drivers/media/dvb-frontends/drxk_hard.c | 4 ++--
 drivers/media/dvb-frontends/helene.c    | 2 +-
 drivers/media/dvb-frontends/horus3a.c   | 2 +-
 drivers/media/dvb-frontends/sp2.c       | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
index cf8e5f1bd101..ec7a718428fc 100644
--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
 			      u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
-		(write == 0 ? "read" : "write"), reg, len);
+		str_write_read(write), reg, len);
 	print_hex_dump_bytes("ascot2e: I2C data: ",
 		DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/cx24120.c b/drivers/media/dvb-frontends/cx24120.c
index 44515fdbe91d..a02aaebb091a 100644
--- a/drivers/media/dvb-frontends/cx24120.c
+++ b/drivers/media/dvb-frontends/cx24120.c
@@ -453,13 +453,13 @@ static int cx24120_msg_mpeg_output_global_config(struct cx24120_state *state,
 	ret = cx24120_message_send(state, &cmd);
 	if (ret != 0) {
 		dev_dbg(&state->i2c->dev, "failed to %s MPEG output\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 		return ret;
 	}
 
 	state->mpeg_enabled = enable;
 	dev_dbg(&state->i2c->dev, "MPEG output %s\n",
-		enable ? "enabled" : "disabled");
+		str_enabled_disabled(enable));
 
 	return 0;
 }
diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index d925ca24183b..d1b84cd9c510 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
 {
 	dev_dbg(&priv->i2c->dev,
 		"cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
-		(write == 0 ? "read" : "write"), addr, reg, len, len, data);
+		str_write_read(write), addr, reg, len, len, data);
 }
 
 static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 87f3d4f0eb8c..cbb1ba0f1323 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -1068,7 +1068,7 @@ static int mpegts_configure_pins(struct drxk_state *state, bool mpeg_enable)
 	u16 err_cfg = 0;
 
 	dprintk(1, ": mpeg %s, %s mode\n",
-		mpeg_enable ? "enable" : "disable",
+		str_enable_disable(mpeg_enable),
 		state->m_enable_parallel ? "parallel" : "serial");
 
 	/* stop lock indicator process */
@@ -6279,7 +6279,7 @@ static int drxk_gate_ctrl(struct dvb_frontend *fe, int enable)
 {
 	struct drxk_state *state = fe->demodulator_priv;
 
-	dprintk(1, ": %s\n", enable ? "enable" : "disable");
+	dprintk(1, ": %s\n", str_enable_disable(enable));
 
 	if (state->m_drxk_state == DRXK_NO_DEV)
 		return -ENODEV;
diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index f127adee3ebb..b4527c141d9c 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
 		u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
-			(write == 0 ? "read" : "write"), reg, len);
+			str_write_read(write), reg, len);
 	print_hex_dump_bytes("helene: I2C data: ",
 			DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
index 0330b78a5b3f..10300ebf3ca0 100644
--- a/drivers/media/dvb-frontends/horus3a.c
+++ b/drivers/media/dvb-frontends/horus3a.c
@@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
 			      u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
-		(write == 0 ? "read" : "write"), reg, len);
+		str_write_read(write), reg, len);
 	print_hex_dump_bytes("horus3a: I2C data: ",
 		DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index 75adf2a4589f..0332e3c312c6 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -132,7 +132,7 @@ static int sp2_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot, u8 acs,
 		return ret;
 
 	dev_dbg(&s->client->dev, "%s: slot=%d, addr=0x%04x, %s, data=%x",
-			(read) ? "read" : "write", slot, addr,
+			str_read_write(read), slot, addr,
 			(acs == SP2_CI_ATTR_ACS) ? "attr" : "io",
 			(read) ? mem : data);
 

-- 
2.46.1.824.gd892dcdcdd-goog


