Return-Path: <linux-media+bounces-24731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899BAA1115F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 361E03A762B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA50232457;
	Tue, 14 Jan 2025 19:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qc8XydbV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252D2209671
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884001; cv=none; b=DYraM2Hp7hAVaLzhNlbrWp7KsubMpykBBJqeTsmwsmkf6POhB/f1s1nm+zzssNvyw8yu+9DwCd7a2tC+QtlDFf696+cHM2i7K15Ikdk7FLSH6fBlFh1OoA3H7fS7CHSORemuvWMu1DPfn6AKJnPm5kncgxJpQVXTa3RshvORvBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884001; c=relaxed/simple;
	bh=FjS+aOsoiOXqy8ece6i9Kgrj719RNrGV9AGnSamBXT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnAX1qkJDTG5y+UMI+NIUYD0w+Q7TZ5MUu04VtHC+Vjtz5S9r4h/znrRb6sMpIQ9wDlhOe5/EEy3fuE8YiKPIYxvXePd61lCMIK7LvcIe6k5f8WZPrxaTECANc+cg8CNCud8YMgZ5eP9eX0HD5cVEN8nUv8oM3sju5PVPjvE0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qc8XydbV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43616c12d72so7417715e9.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 11:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736883996; x=1737488796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NRbVWx2EOoMdZRWV2YWE/ywExpZXtagQ4Bh07isrgM=;
        b=Qc8XydbVBZkXoKjOrDaYi+PZdDiDgqIGzkfTbOjoN3MyUjZbJ9e6gChTAkxKRq8IWH
         atglZsj2SE1u2T6LVsFG6J66l81HETenlbPaE7GlbIzLJI8Q8BwulbAjebCW+05++U4u
         27pH3fgyhcz8A+IjxroKkSguZzoQqepf4muDTyVLPOnKEDTKlQBet384lgcydsUTfLVV
         YiFm6OV6dExkgGRerzORoo51EBtGN8las5/XOg7/t1pz9UiPu0YuiSucbZqei8iuY5u9
         9UiXBixvOhWuHtnUdY5FA7uczfHny6R/tibVzesTPySVFWR0ku2jq+2B1d1uW4r76uCh
         Tp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883996; x=1737488796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NRbVWx2EOoMdZRWV2YWE/ywExpZXtagQ4Bh07isrgM=;
        b=FOqvgRWWqvkDNE9bEwloqDVGn8e16V3EsBfeUTtT3AyLDOirdL6WFqtTVHb5cGkf9H
         Hax4GaV3R66ilQms7ymqeFHKNcVCmNL/TtImvkcNfe25FoJ8fHA4hqpyIeZR+9HoeSKj
         vIMcscSndChpJAUq0up7FHBn7VZKcTL1H9tPnfksyFcFbGcUZ30jvCHLSBdcsSv8Q7zV
         XupKQZbFbZbjjEP5xBOtCjQ5u3Xp6JN5uvGv5Z48HtqAmU+jbLg5PAKUDL9S20D7tMy9
         o5/viBKORqCQhLTvpC8UlbQsvKgueeQ2A9X/O6z7awbKVrKgVSNmAtyjPcTYQORzt8Uq
         mmFA==
X-Gm-Message-State: AOJu0Yy+LVFnudWlscMpPK0dygw1qUo9qYFDj0TRpHZly3KIjq6hcfvE
	l1ux1+SO9R4BG/AoIL3pULd+gbiwxPzc5f8aufljnWq+K0ml7tk5kmejmBqK+Nc=
X-Gm-Gg: ASbGncsbPNoralfpeMFo0kim0uSsjaW0mwE+xromnqmxvcnfSZjgg2ol6E/RSfG9p6b
	9gOZBkIsjzIOvNWgFtgrPLaiGHXx6oVnrxKZo62cS9HJVviwz5rVYlda6k8cvfSTIeKHZNfLY5z
	Hp8A+P6kHL1qQeO8MwtG0kSkICcIfrmsaifhiUT1CTWlEYxbsZV15oqpyHtsALqq954saxXD6IN
	wymqbmbXseh+wmLERQ6ZJ7jxf75k3dqIPYVWHhjxBbtKUseIhq6HmltJk6EXm9fU1mR937G
X-Google-Smtp-Source: AGHT+IEm39xDGvRG6LIa6eTwjMOno1ysykfGcVPW7Rox4yS0rTGeEYYep2u13JBuebReasaYRgJ+0A==
X-Received: by 2002:a05:600c:3ca0:b0:436:17f4:9b3b with SMTP id 5b1f17b1804b1-436e270729bmr100990625e9.6.1736883996333;
        Tue, 14 Jan 2025 11:46:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm184337515e9.28.2025.01.14.11.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:46:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 20:46:18 +0100
Subject: [PATCH 2/6] media: dvb: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-media-v1-2-9316270aa65f@linaro.org>
References: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
In-Reply-To: <20250114-str-enable-disable-media-v1-0-9316270aa65f@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Olli Salonen <olli.salonen@iki.fi>, Abylay Ospan <aospan@amazon.com>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Tim Harvey <tharvey@gateworks.com>, Andy Walls <awalls@md.metrocast.net>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7410;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FjS+aOsoiOXqy8ece6i9Kgrj719RNrGV9AGnSamBXT0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhr8QqVgKxIe22RXTtvXcA8WP+Llq08lMITZmP
 +N5Vvchia2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4a/EAAKCRDBN2bmhouD
 17zoD/99VqxnhvQH2aNwSfHxVOh7Jga+L8BPvHkIxe94n8DjqqP6VPiyL93DyD7/SpH5cABNIdE
 7rgh3TpVsc7bFLM8kMEx1ol/2Fr/7kpFRy+qOvStNE3DNa2B5LJ6kB/wCLkEVzFxKlc2fzsGWx7
 CGA3+zZFxHbYl/itTaKjSY8cPIMI3lECKf5zq3Jv62vxDAMbK58SOkxtvQFm7OHfoHqUHvtH64A
 NrhcEhNwrFQO9ZAeJvpYZBddsyZXwBopdQeGl3XHHU62VRYAQVRhL2U6eOZDeymKe6w+uPgu1Te
 rehOYjq/Nv3jY7v6DTltzB9icmo566fQJOmSi6CrX62pUXvNimxJP3oEVVAsvYq9rPLhm3xQ9tb
 m+b6kLCjFapHHrrIS85XBiNDRajmQhNXE/YN7fGPMsyPIWSfl5blJeA4wusU0mTpJcjzB+vQb07
 0cxEgRsZguyRg6o3WWf168zlp75m+uki7275BwFM9/9xBgjm8UDd1xPO9qi28J0BM5a5KXSKok8
 agrM0RNPqaIdJ8kgVcVvkdV6b22apXIVSJGsP1L46jOz/72zgqXyNiYBi/mM1cw8MjCiBdB8jyG
 7FpJMnGQjR5wrtxA9W1KGtRQ4X5rrbwvy8/vFOI1YCJA+sz0P7wbtTUOTgo2BO5vFqB4xMbiSk8
 KRwokeXag15pDYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/dvb-frontends/ascot2e.c   | 3 ++-
 drivers/media/dvb-frontends/cx24120.c   | 5 +++--
 drivers/media/dvb-frontends/cxd2841er.c | 3 ++-
 drivers/media/dvb-frontends/drxk_hard.c | 5 +++--
 drivers/media/dvb-frontends/helene.c    | 3 ++-
 drivers/media/dvb-frontends/horus3a.c   | 3 ++-
 drivers/media/dvb-frontends/sp2.c       | 3 ++-
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
index cf8e5f1bd10181a65376660bfa4648c0e536fd25..15a33dac3af95dbd6368b83eff7c49f5ae3187ed 100644
--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/dvb/frontend.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include "ascot2e.h"
 #include <media/dvb_frontend.h>
@@ -104,7 +105,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
 			      u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
-		(write == 0 ? "read" : "write"), reg, len);
+		str_read_write(write == 0), reg, len);
 	print_hex_dump_bytes("ascot2e: I2C data: ",
 		DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/cx24120.c b/drivers/media/dvb-frontends/cx24120.c
index 44515fdbe91d4f5eb23fb13dfc571507255655cb..2e4097a6043d05938c192a404099615cec5c8edb 100644
--- a/drivers/media/dvb-frontends/cx24120.c
+++ b/drivers/media/dvb-frontends/cx24120.c
@@ -21,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/firmware.h>
+#include <linux/string_choices.h>
 #include <media/dvb_frontend.h>
 #include "cx24120.h"
 
@@ -453,13 +454,13 @@ static int cx24120_msg_mpeg_output_global_config(struct cx24120_state *state,
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
index 415f1f91cc30724a77b6bb417e33f25aacf5a909..a4ec529b5ba547e866b9694527af0dad171eb318 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
 #include <linux/math64.h>
@@ -206,7 +207,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_priv *priv,
 {
 	dev_dbg(&priv->i2c->dev,
 		"cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %*ph\n",
-		(write == 0 ? "read" : "write"), addr, reg, len, len, data);
+		str_read_write(write == 0), addr, reg, len, len, data);
 }
 
 static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 87f3d4f0eb8c484ddee4104162679ddeb88f6d73..b7d93119dcaa60eb4f774b77d53163da368fab13 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -15,6 +15,7 @@
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/hardirq.h>
+#include <linux/string_choices.h>
 #include <asm/div64.h>
 
 #include <media/dvb_frontend.h>
@@ -1068,7 +1069,7 @@ static int mpegts_configure_pins(struct drxk_state *state, bool mpeg_enable)
 	u16 err_cfg = 0;
 
 	dprintk(1, ": mpeg %s, %s mode\n",
-		mpeg_enable ? "enable" : "disable",
+		str_enable_disable(mpeg_enable),
 		state->m_enable_parallel ? "parallel" : "serial");
 
 	/* stop lock indicator process */
@@ -6279,7 +6280,7 @@ static int drxk_gate_ctrl(struct dvb_frontend *fe, int enable)
 {
 	struct drxk_state *state = fe->demodulator_priv;
 
-	dprintk(1, ": %s\n", enable ? "enable" : "disable");
+	dprintk(1, ": %s\n", str_enable_disable(enable));
 
 	if (state->m_drxk_state == DRXK_NO_DEV)
 		return -ENODEV;
diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index f127adee3ebb7d041f0b85607a49aa1ec45b53e2..ae2a696a777050b6b0849481f9262893e34e7061 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/dvb/frontend.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include "helene.h"
 #include <media/dvb_frontend.h>
@@ -279,7 +280,7 @@ static void helene_i2c_debug(struct helene_priv *priv,
 		u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n",
-			(write == 0 ? "read" : "write"), reg, len);
+			str_read_write(write == 0), reg, len);
 	print_hex_dump_bytes("helene: I2C data: ",
 			DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb-frontends/horus3a.c
index 0330b78a5b3f29a88e65dcc228a6f09a2125434a..0c3280d4f4989ad37970107712884c3dece55ee7 100644
--- a/drivers/media/dvb-frontends/horus3a.c
+++ b/drivers/media/dvb-frontends/horus3a.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/dvb/frontend.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include "horus3a.h"
 #include <media/dvb_frontend.h>
@@ -38,7 +39,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *priv,
 			      u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n",
-		(write == 0 ? "read" : "write"), reg, len);
+		str_read_write(write == 0), reg, len);
 	print_hex_dump_bytes("horus3a: I2C data: ",
 		DUMP_PREFIX_OFFSET, data, len);
 }
diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-frontends/sp2.c
index 75adf2a4589fd058d8c07621c9ae00d64177c3c1..2865d52a88a1e9b949dcca1c6ba3dd8803cc9bf7 100644
--- a/drivers/media/dvb-frontends/sp2.c
+++ b/drivers/media/dvb-frontends/sp2.c
@@ -12,6 +12,7 @@
  *  Copyright (C) 2009 Abylay Ospan <aospan@netup.ru>
  */
 
+#include <linux/string_choices.h>
 #include "sp2_priv.h"
 
 static int sp2_read_i2c(struct sp2 *s, u8 reg, u8 *buf, int len)
@@ -132,7 +133,7 @@ static int sp2_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot, u8 acs,
 		return ret;
 
 	dev_dbg(&s->client->dev, "%s: slot=%d, addr=0x%04x, %s, data=%x",
-			(read) ? "read" : "write", slot, addr,
+			str_read_write(read), slot, addr,
 			(acs == SP2_CI_ATTR_ACS) ? "attr" : "io",
 			(read) ? mem : data);
 

-- 
2.43.0


