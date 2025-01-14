Return-Path: <linux-media+bounces-24733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB8FA11162
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 118957A3EA3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 19:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D9520CCDD;
	Tue, 14 Jan 2025 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OED1sDo9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F6D209671
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 19:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884005; cv=none; b=PJwgVqA69U3bSMbRJ09VgRf2bhFXSjRbP2ukzJiULcZx0xAnGaiWxLjs2V6tVdszTbPzhKCyjVuEGKE9wqn6aId9TYCswphzJhW7+QTbRMR54c21erPDFsU9cGek0vU/PAaS2te+bOttJuoX2le+7wsXLnpmk27DiX3/tNeOAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884005; c=relaxed/simple;
	bh=J+bOpSDav9KLWsbQzTSsAbI6/NeG0pC4FqfVEYLhlLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECsMiGcw9R7LSKthDZ223PTbvEY7haMNrowsIJ+Q7Yg1YbXD3RguXA+Py4/3Stw2C4fB4yAS+++Fn1/uCDDVtd3MtaSEfU0ITpYjtI4hUN2fY1GGThQLgyfzf1fF5uOqY+QeoEjghP1UVVxlvSvdoHcIy3SLrnQObnjw8HQf+lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OED1sDo9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43616bf3358so7447965e9.3
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 11:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736884000; x=1737488800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XP1TbAg4KH9+xlcsz3vyOsAw2IgWf28lGyGn4Q94zVc=;
        b=OED1sDo900jfeXPWZTq1I7ixrXduZG7m7daAK0lqsfV3ahikQHThbaQHKQHk8CN7g+
         abt7Jr6I4nZQYlBdvrdKpDAzEpiKf5ApOAUhT0pU1PN1Pz6e1SjSBJHf8KTw+nT0MUWM
         kUFDkOLh8VI70PcKFyj52Mkisz+h8SKxhYILRjxVw+B7oNYgLwyHpsrygY+Udeoj0eC/
         Zxl0y6XZrouvSCYTnwIeLYFcIS0knQOmhdK2+JbTYLtFDUj9L/nH8jcOiaBJKILUhedr
         BLgcLaDN93Wvmr/axY6pAK2XheOpu4Qtt2eVynbTGGhNznSKH7rXIbeqQdJu32PvBpp1
         3Wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736884000; x=1737488800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP1TbAg4KH9+xlcsz3vyOsAw2IgWf28lGyGn4Q94zVc=;
        b=bVQngpVwYE+3iTEeGqo14aW1bRcaga/PYkGlWGeXEeDiZ01/0wBnL9l9mLWNZB2RnC
         RI9G2WZ8ve7gxhRjyeW/YhDoHC0n3UURlHZc7EvHmdb+jZFMaQ53uy+jxGvaJkg+UVLM
         xqWUSNXHABlHWCebzf27iv33MGwseehpXDzYnWNcB2wmtKzHsasHZP7REZNALfmdXeIm
         EKEvCDZWxJAwmSuna6WiwBJcouwOACk6kDvXbPVJRnU7XVrygT5WuPbzf9BpLY0Llv/y
         DH37mUpcYl+PvfZJV4jnmMiDPCBUP+l5X/NReZnovw6EgYhaNQbhrHtQfUl6FhM2Ma2y
         CeIw==
X-Gm-Message-State: AOJu0YxWwl2Nt7oaRrUCG6bxHHnCfy6bRRbxMrS28+mMaE0ueHystXfT
	n9cz3wMSA2yzt1ZSA0HymKEEz7iJITtu81Qn7eBI0Rx+aSOarSmYiI3dl4hSdHA=
X-Gm-Gg: ASbGncu5v/DQyv2pgFAVqx3qpkc64+zRzTcWHpgjonsYFROUZQHxs+B3S41UYYb+mcA
	/Td24C8gpmTiH9HTJ6VWJCYREnTlGmR5on8zIEIIYuPpOiEhF84wYVsQV2yLn+QrsiEiFuuaoON
	N4kEWUgVZBZ65rECpk2L4UOvqOCUKK+7I32dS+va2hn78u24hh6K9Zdg+8BOKvTBSl4XqgL0lLn
	MRdlnq8ZDeTpRpd3gjL4II8rnvbhA3ycfXD6dSa1L4oVkFInnl9gxqDdehHN5IvAlpsZOPR
X-Google-Smtp-Source: AGHT+IGShG0RwoxhG9NZzaebSfDGRDX8ggX+btd3dOSB2+uCAvZlI9ITUhzxoD3xUzJVaex96rMq9g==
X-Received: by 2002:a05:600c:3b11:b0:42c:bb35:b6d0 with SMTP id 5b1f17b1804b1-436e267f21bmr103979185e9.1.1736883999138;
        Tue, 14 Jan 2025 11:46:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37c2esm184337515e9.28.2025.01.14.11.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:46:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 14 Jan 2025 20:46:19 +0100
Subject: [PATCH 3/6] media: i2c: Use str_enable_disable-like helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-str-enable-disable-media-v1-3-9316270aa65f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=35764;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=J+bOpSDav9KLWsbQzTSsAbI6/NeG0pC4FqfVEYLhlLE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnhr8R6i6gJBQFdiogyILc5eLTLuL9AB6XpNAMX
 JZIlsrPVgOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4a/EQAKCRDBN2bmhouD
 14qAD/0et86SvA9Kb26BeZHQl+hidokM/Tqzc8Q86qoULoM4+Dpsm5hqSheMLJY7Jqe404VsMRi
 lMAQ/CyctTzsKaC735AzD8nfVt11qqL6OHV80VQkcujTMtRo1W2i6MHeaaeEYeaf2wtwGmg4CaS
 hEcjNNlqyz95mxH1qywO69K87OswZpDL5/qNRnrXU/PEolzCI/hrrlegoYVY+bFhutT9kDQuWUv
 iKMBwTHgA1MjcdTgHOMCvrHE/A65ClJVLrO43cUUQaa+9tqZfgK/5lpdRTTuXOZDeKzkLQOLUvb
 +UCFgSqTE/9OBRfL1R1Qv3GcKU29jRIsGaHbqK43UoDiGwsPzRtMVzDy81eAvbSvpgxXTFIrd7D
 Gto43sJUO2Ou0svzmg3MWaHwUH1vlPSGa4zHzBLQSo2azkC8HR3G1GCNOyGYONrGQAdH9ORoUXR
 pHpCYAhPmgS6aqXCeyQQyZsOt7yy7wlQ53ylyySnQFlsXcIm3kA3auCxidm8+tepi1HuSzkBc5Y
 SSqqi6hI/6ZI9kbZo1XM6N7aAk+6bwlvJ0G6jmedOpP2i7ElLHwWv6QtYYNdcIoZLwBl/Uhaa97
 6Jn+VeucjiPyTFMDpgfjkiTlezXw+bKKGfWnDHH1M78s7jq1U9g/5jEfFtxsOB+jpJN8hNFeAPh
 CxjEb8jbj6UaxnQ==
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
 drivers/media/i2c/adv7511-v4l2.c         | 10 +++----
 drivers/media/i2c/adv7604.c              | 43 +++++++++++++++--------------
 drivers/media/i2c/adv7842.c              | 46 +++++++++++++++-----------------
 drivers/media/i2c/cx25840/cx25840-core.c |  5 ++--
 drivers/media/i2c/cx25840/cx25840-ir.c   | 35 ++++++++++++------------
 drivers/media/i2c/max9286.c              |  3 ++-
 drivers/media/i2c/msp3400-driver.c       |  5 ++--
 drivers/media/i2c/saa7110.c              |  3 ++-
 drivers/media/i2c/saa7115.c              |  4 +--
 drivers/media/i2c/saa7127.c              | 13 ++++-----
 drivers/media/i2c/saa717x.c              |  3 ++-
 drivers/media/i2c/tc358743.c             | 43 +++++++++++++----------------
 drivers/media/i2c/tda1997x.c             |  7 ++---
 drivers/media/i2c/ths7303.c              |  3 ++-
 drivers/media/i2c/ths8200.c              |  9 ++++---
 drivers/media/i2c/tvp7002.c              |  4 +--
 drivers/media/i2c/vpx3220.c              |  3 ++-
 17 files changed, 119 insertions(+), 120 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index 4036972af3a6628b72de0c770b13ba829742ff2f..3589a99d1ad7b859c9b3ef59891b02ed732a1081 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <linux/hdmi.h>
@@ -583,7 +584,7 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 		"9", "A", "B", "C", "D", "E", "F"
 	};
 
-	v4l2_info(sd, "power %s\n", state->power_on ? "on" : "off");
+	v4l2_info(sd, "power %s\n", str_on_off(state->power_on));
 	v4l2_info(sd, "%s hotplug, %s Rx Sense, %s EDID (%d block(s))\n",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT) ? "detected" : "no",
 		  (adv7511_rd(sd, 0x42) & MASK_ADV7511_MSEN_DETECT) ? "detected" : "no",
@@ -635,8 +636,7 @@ static int adv7511_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "i2c cec addr: 0x%x\n", state->i2c_cec_addr);
 
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+	v4l2_info(sd, "CEC: %s\n", str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		for (i = 0; i < ADV7511_MAX_ADDRS; i++) {
 			bool is_valid = state->cec_valid_addrs & (1 << i);
@@ -657,7 +657,7 @@ static int adv7511_s_power(struct v4l2_subdev *sd, int on)
 	const int retries = 20;
 	int i;
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 
@@ -888,7 +888,7 @@ static void adv7511_set_isr(struct v4l2_subdev *sd, bool enable)
 	u8 irqs_rd;
 	int retries = 100;
 
-	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, enable ? "enable" : "disable");
+	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, str_enable_disable(enable));
 
 	if (state->enabled_irq == enable)
 		return;
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index e271782b7b70bd15beff57aa5436d453e4d8ebab..87709bba78948915635e2fa85c7b27f72045e7fb 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/v4l2-dv-timings.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -2563,15 +2564,14 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 	};
 
 	v4l2_info(sd, "-----Chip status-----\n");
-	v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
+	v4l2_info(sd, "Chip power: %s\n", str_off_on(no_power(sd)));
 	edid_enabled = rep_read(sd, info->edid_status_reg);
 	v4l2_info(sd, "EDID enabled port A: %s, B: %s, C: %s, D: %s\n",
-			((edid_enabled & 0x01) ? "Yes" : "No"),
-			((edid_enabled & 0x02) ? "Yes" : "No"),
-			((edid_enabled & 0x04) ? "Yes" : "No"),
-			((edid_enabled & 0x08) ? "Yes" : "No"));
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+		  str_yes_no(edid_enabled & 0x01),
+		  str_yes_no(edid_enabled & 0x02),
+		  str_yes_no(edid_enabled & 0x04),
+		  str_yes_no(edid_enabled & 0x08));
+	v4l2_info(sd, "CEC: %s\n", str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		int i;
 
@@ -2587,19 +2587,18 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Signal status-----\n");
 	cable_det = info->read_cable_det(sd);
 	v4l2_info(sd, "Cable detected (+5V power) port A: %s, B: %s, C: %s, D: %s\n",
-			((cable_det & 0x01) ? "Yes" : "No"),
-			((cable_det & 0x02) ? "Yes" : "No"),
-			((cable_det & 0x04) ? "Yes" : "No"),
-			((cable_det & 0x08) ? "Yes" : "No"));
+		  str_yes_no(cable_det & 0x01),
+		  str_yes_no(cable_det & 0x02),
+		  str_yes_no(cable_det & 0x04),
+		  str_yes_no(cable_det & 0x08));
 	v4l2_info(sd, "TMDS signal detected: %s\n",
-			no_signal_tmds(sd) ? "false" : "true");
+			str_false_true(no_signal_tmds(sd)));
 	v4l2_info(sd, "TMDS signal locked: %s\n",
-			no_lock_tmds(sd) ? "false" : "true");
-	v4l2_info(sd, "SSPD locked: %s\n", no_lock_sspd(sd) ? "false" : "true");
-	v4l2_info(sd, "STDI locked: %s\n", no_lock_stdi(sd) ? "false" : "true");
-	v4l2_info(sd, "CP locked: %s\n", no_lock_cp(sd) ? "false" : "true");
-	v4l2_info(sd, "CP free run: %s\n",
-			(in_free_run(sd)) ? "on" : "off");
+			str_false_true(no_lock_tmds(sd)));
+	v4l2_info(sd, "SSPD locked: %s\n", str_false_true(no_lock_sspd(sd)));
+	v4l2_info(sd, "STDI locked: %s\n", str_false_true(no_lock_stdi(sd)));
+	v4l2_info(sd, "CP locked: %s\n", str_false_true(no_lock_cp(sd)));
+	v4l2_info(sd, "CP free run: %s\n", str_on_off(in_free_run(sd)));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
 			io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
 			(io_read(sd, 0x01) & 0x70) >> 4);
@@ -2639,7 +2638,7 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 				(reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
 				(((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 					"(16-235)" : "(0-255)",
-				(reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+				str_enabled_disabled(reg_io_0x02 & 0x08));
 	}
 	v4l2_info(sd, "Color space conversion: %s\n",
 			csc_coeff_sel_rb[cp_read(sd, info->cp_csc) >> 4]);
@@ -2651,9 +2650,9 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Digital video port selected: %c\n",
 			(hdmi_read(sd, 0x00) & 0x03) + 'A');
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			(hdmi_read(sd, 0x05) & 0x40) ? "true" : "false");
+			str_true_false(hdmi_read(sd, 0x05) & 0x40));
 	v4l2_info(sd, "HDCP keys read: %s%s\n",
-			(hdmi_read(sd, 0x04) & 0x20) ? "yes" : "no",
+			str_yes_no(hdmi_read(sd, 0x04) & 0x20),
 			(hdmi_read(sd, 0x04) & 0x10) ? "ERROR" : "");
 	if (is_hdmi(sd)) {
 		bool audio_pll_locked = hdmi_read(sd, 0x04) & 0x01;
@@ -2674,7 +2673,7 @@ static int adv76xx_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "Audio N: %u\n", ((hdmi_read(sd, 0x5d) & 0x0f) << 16) +
 				(hdmi_read(sd, 0x5e) << 8) +
 				hdmi_read(sd, 0x5f));
-		v4l2_info(sd, "AV Mute: %s\n", (hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+		v4l2_info(sd, "AV Mute: %s\n", str_on_off(hdmi_read(sd, 0x04) & 0x40));
 
 		v4l2_info(sd, "Deep color mode: %s\n", deep_color_mode_txt[(hdmi_read(sd, 0x0b) & 0x60) >> 5]);
 		v4l2_info(sd, "HDMI colorspace: %s\n", hdmi_color_space_txt[hdmi_read(sd, 0x53) & 0xf]);
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 5545cd23e113d5c81d916eb764afb6f6612edc96..17055684f45b5b79cc8c5f09591d4d35653e8ff9 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <linux/v4l2-dv-timings.h>
@@ -2657,12 +2658,12 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 	/* SDP (Standard definition processor) block */
 	u8 sdp_signal_detected = sdp_read(sd, 0x5A) & 0x01;
 
-	v4l2_info(sd, "Chip powered %s\n", no_power(sd) ? "off" : "on");
+	v4l2_info(sd, "Chip powered %s\n", str_on_off(no_power(sd)));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x\n",
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f);
 
 	v4l2_info(sd, "SDP: free run: %s\n",
-		(sdp_read(sd, 0x56) & 0x01) ? "on" : "off");
+		  str_on_off(sdp_read(sd, 0x56) & 0x01));
 	v4l2_info(sd, "SDP: %s\n", sdp_signal_detected ?
 		"valid SD/PR signal detected" : "invalid/no signal");
 	if (sdp_signal_detected) {
@@ -2687,7 +2688,7 @@ static int adv7842_sdp_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "SDP: %s\n",
 			(sdp_read(sd, 0x57) & 0x08) ? "Interlaced" : "Progressive");
 		v4l2_info(sd, "SDP: deinterlacer %s\n",
-			(sdp_read(sd, 0x12) & 0x08) ? "enabled" : "disabled");
+			  str_enabled_disabled(sdp_read(sd, 0x12) & 0x08));
 		v4l2_info(sd, "SDP: csc %s mode\n",
 			(sdp_io_read(sd, 0xe0) & 0x40) ? "auto" : "manual");
 	}
@@ -2734,19 +2735,16 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	};
 
 	v4l2_info(sd, "-----Chip status-----\n");
-	v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
+	v4l2_info(sd, "Chip power: %s\n", str_on_off(no_power(sd)));
 	v4l2_info(sd, "HDMI/DVI-D port selected: %s\n",
 			state->hdmi_port_a ? "A" : "B");
 	v4l2_info(sd, "EDID A %s, B %s\n",
-		  ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
-		  "enabled" : "disabled",
-		  ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
-		  "enabled" : "disabled");
+		  str_enabled_disabled((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)),
+		  str_enabled_disabled((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)));
 	v4l2_info(sd, "HPD A %s, B %s\n",
-		  reg_io_0x21 & 0x02 ? "enabled" : "disabled",
-		  reg_io_0x21 & 0x01 ? "enabled" : "disabled");
-	v4l2_info(sd, "CEC: %s\n", state->cec_enabled_adap ?
-			"enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x21 & 0x02),
+		  str_enabled_disabled(reg_io_0x21 & 0x01));
+	v4l2_info(sd, "CEC: %s\n", str_enabled_disabled(state->cec_enabled_adap));
 	if (state->cec_enabled_adap) {
 		int i;
 
@@ -2762,21 +2760,20 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Signal status-----\n");
 	if (state->hdmi_port_a) {
 		v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			  io_read(sd, 0x6f) & 0x02 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x02));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x02) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x02));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x20) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x20));
 	} else {
 		v4l2_info(sd, "Cable detected (+5V power):%s\n",
-			  io_read(sd, 0x6f) & 0x01 ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6f) & 0x01));
 		v4l2_info(sd, "TMDS signal detected: %s\n",
-			  (io_read(sd, 0x6a) & 0x01) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x01));
 		v4l2_info(sd, "TMDS signal locked: %s\n",
-			  (io_read(sd, 0x6a) & 0x10) ? "true" : "false");
+			  str_true_false(io_read(sd, 0x6a) & 0x10));
 	}
-	v4l2_info(sd, "CP free run: %s\n",
-		  (!!(cp_read(sd, 0xff) & 0x10) ? "on" : "off"));
+	v4l2_info(sd, "CP free run: %s\n", str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
 	v4l2_info(sd, "Prim-mode = 0x%x, video std = 0x%x, v_freq = 0x%x\n",
 		  io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
 		  (io_read(sd, 0x01) & 0x70) >> 4);
@@ -2820,7 +2817,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 		  (reg_io_0x02 & 0x02) ? "RGB" : "YCbCr",
 		  (((reg_io_0x02 >> 2) & 0x01) ^ (reg_io_0x02 & 0x01)) ?
 			"(16-235)" : "(0-255)",
-		  (reg_io_0x02 & 0x08) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_io_0x02 & 0x08));
 	v4l2_info(sd, "Color space conversion: %s\n",
 		  csc_coeff_sel_rb[cp_read(sd, 0xf4) >> 4]);
 
@@ -2829,9 +2826,9 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			(hdmi_read(sd, 0x05) & 0x40) ? "true" : "false");
+			str_true_false(hdmi_read(sd, 0x05) & 0x40));
 	v4l2_info(sd, "HDCP keys read: %s%s\n",
-			(hdmi_read(sd, 0x04) & 0x20) ? "yes" : "no",
+			str_yes_no(hdmi_read(sd, 0x04) & 0x20),
 			(hdmi_read(sd, 0x04) & 0x10) ? "ERROR" : "");
 	if (!is_hdmi(sd))
 		return 0;
@@ -2850,8 +2847,7 @@ static int adv7842_cp_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Audio N: %u\n", ((hdmi_read(sd, 0x5d) & 0x0f) << 16) +
 			(hdmi_read(sd, 0x5e) << 8) +
 			hdmi_read(sd, 0x5f));
-	v4l2_info(sd, "AV Mute: %s\n",
-			(hdmi_read(sd, 0x04) & 0x40) ? "on" : "off");
+	v4l2_info(sd, "AV Mute: %s\n", str_on_off(hdmi_read(sd, 0x04) & 0x40));
 	v4l2_info(sd, "Deep color mode: %s\n",
 			deep_color_mode_txt[hdmi_read(sd, 0x0b) >> 6]);
 
diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index a90a9e5705a03088d844e1d1a9e894e73a5402d3..e0abee073b58931ed5940e18c6aac9ae2fd74e2e 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -33,6 +33,7 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/math64.h>
+#include <linux/string_choices.h>
 #include <media/v4l2-common.h>
 #include <media/drv-intf/cx25840.h>
 
@@ -2366,7 +2367,7 @@ static int cx25840_s_audio_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 
 	v4l_dbg(1, cx25840_debug, client, "%s audio output\n",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 
 	if (enable) {
 		v = cx25840_read(client, 0x115) | 0x80;
@@ -2389,7 +2390,7 @@ static int cx25840_s_stream(struct v4l2_subdev *sd, int enable)
 	u8 v;
 
 	v4l_dbg(1, cx25840_debug, client, "%s video output\n",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 
 	/*
 	 * It's not clear what should be done for these devices.
diff --git a/drivers/media/i2c/cx25840/cx25840-ir.c b/drivers/media/i2c/cx25840/cx25840-ir.c
index 8cef9656c61224861f1b0027be5e67fdec18cacd..5ae6568b79b1563c1c386d8684533c3add5d7708 100644
--- a/drivers/media/i2c/cx25840/cx25840-ir.c
+++ b/drivers/media/i2c/cx25840/cx25840-ir.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
+#include <linux/string_choices.h>
 #include <media/drv-intf/cx25840.h>
 #include <media/rc-core.h>
 
@@ -1023,11 +1024,11 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "IR Receiver:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_RXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_RXE));
 	v4l2_info(sd, "\tDemodulation from a carrier:       %s\n",
-		  cntrl & CNTRL_DMD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_DMD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_RFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_RFE));
 	switch (cntrl & CNTRL_EDG) {
 	case CNTRL_EDG_NONE:
 		s = "disabled";
@@ -1086,33 +1087,33 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, rxclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, rxclk));
 	v4l2_info(sd, "\tLow pass filter:                   %s\n",
-		  filtr ? "enabled" : "disabled");
+		  str_enabled_disabled(filtr));
 	if (filtr)
 		v4l2_info(sd, "\tMin acceptable pulse width (LPF):  %u us, %u ns\n",
 			  lpf_count_to_us(filtr),
 			  lpf_count_to_ns(filtr));
 	v4l2_info(sd, "\tPulse width timer timed-out:       %s\n",
-		  stats & STATS_RTO ? "yes" : "no");
+		  str_yes_no(stats & STATS_RTO));
 	v4l2_info(sd, "\tPulse width timer time-out intr:   %s\n",
-		  irqen & IRQEN_RTE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RTE));
 	v4l2_info(sd, "\tFIFO overrun:                      %s\n",
-		  stats & STATS_ROR ? "yes" : "no");
+		  str_yes_no(stats & STATS_ROR));
 	v4l2_info(sd, "\tFIFO overrun interrupt:            %s\n",
-		  irqen & IRQEN_ROE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_ROE));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_RBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_RBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_RSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_RSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_RSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RSE));
 
 	v4l2_info(sd, "IR Transmitter:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_TXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_TXE));
 	v4l2_info(sd, "\tModulation onto a carrier:         %s\n",
-		  cntrl & CNTRL_MOD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_MOD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_TFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_TFE));
 	v4l2_info(sd, "\tFIFO interrupt watermark:          %s\n",
 		  cntrl & CNTRL_TIC ? "not empty" : "half full or less");
 	v4l2_info(sd, "\tCarrier polarity:                  %s\n",
@@ -1128,11 +1129,11 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, txclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, txclk));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_TBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_TBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_TSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_TSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_TSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_TSE));
 
 	return 0;
 }
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273f8547d7e7ec194cade5b5e9c8df2..fb893b9855f323b5e4cc7b11acb44b72c2f52342 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -22,6 +22,7 @@
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
@@ -1330,7 +1331,7 @@ static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
 
 	if (ret < 0)
 		dev_err(&priv->client->dev, "Unable to turn power %s\n",
-			enable ? "on" : "off");
+			str_on_off(enable));
 
 	return ret;
 }
diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c084e7a5d46fa08b4f182fe28805b01..3707b9f487674f08e383b509421d0f4d7538f659 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -39,6 +39,7 @@
 #include <linux/i2c.h>
 #include <linux/kthread.h>
 #include <linux/freezer.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -338,8 +339,8 @@ static int msp_s_ctrl(struct v4l2_ctrl *ctrl)
 			val = (val * 0x7f / 65535) << 8;
 
 		dev_dbg_lvl(&client->dev, 1, msp_debug, "mute=%s scanning=%s volume=%d\n",
-				state->muted->val ? "on" : "off",
-				state->scan_in_progress ? "yes" : "no",
+				str_on_off(state->muted->val),
+				str_yes_no(state->scan_in_progress),
 				state->volume->val);
 
 		msp_write_dsp(client, 0x0000, val);
diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index 942aeeb40c524f47aa2fab6bda76d7bca5f0e2b2..7a96cefdb251938eaa54e314800ae68e4f24d2c2 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/wait.h>
 #include <linux/uaccess.h>
 #include <linux/i2c.h>
@@ -310,7 +311,7 @@ static int saa7110_s_stream(struct v4l2_subdev *sd, int enable)
 	if (decoder->enable != enable) {
 		decoder->enable = enable;
 		saa7110_write(sd, 0x0E, enable ? 0x18 : 0x80);
-		v4l2_dbg(1, debug, sd, "YUV %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "YUV %s\n", str_on_off(enable));
 	}
 	return 0;
 }
diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773ffd74cb0c0cf57247d65352d507f..7317414b64024d37dd899236e6eacbc768acd446 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -1362,8 +1363,7 @@ static int saa711x_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct saa711x_state *state = to_state(sd);
 
-	v4l2_dbg(1, debug, sd, "%s output\n",
-			enable ? "enable" : "disable");
+	v4l2_dbg(1, debug, sd, "%s output\n", str_enable_disable(enable));
 
 	if (state->enable == enable)
 		return 0;
diff --git a/drivers/media/i2c/saa7127.c b/drivers/media/i2c/saa7127.c
index 818ed19cf37b540895b591f3f59ac94947b8d569..771dfb5a6766fcba0e967e99ed0998ce7c010d02 100644
--- a/drivers/media/i2c/saa7127.c
+++ b/drivers/media/i2c/saa7127.c
@@ -39,6 +39,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/i2c/saa7127.h>
@@ -343,7 +344,7 @@ static int saa7127_set_vps(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 0 || data->line != 16))
 		return -EINVAL;
 	if (state->vps_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn VPS Signal %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn VPS Signal %s\n", str_on_off(enable));
 		saa7127_write(sd, 0x54, enable << 7);
 		state->vps_enable = enable;
 	}
@@ -376,7 +377,7 @@ static int saa7127_set_cc(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_d
 		return -EINVAL;
 	if (state->cc_enable != enable) {
 		v4l2_dbg(1, debug, sd,
-			"Turn CC %s\n", enable ? "on" : "off");
+			"Turn CC %s\n", str_on_off(enable));
 		saa7127_write(sd, SAA7127_REG_CLOSED_CAPTION,
 			(state->xds_enable << 7) | (enable << 6) | 0x11);
 		state->cc_enable = enable;
@@ -402,7 +403,7 @@ static int saa7127_set_xds(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 1 || data->line != 21))
 		return -EINVAL;
 	if (state->xds_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn XDS %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn XDS %s\n", str_on_off(enable));
 		saa7127_write(sd, SAA7127_REG_CLOSED_CAPTION,
 				(enable << 7) | (state->cc_enable << 6) | 0x11);
 		state->xds_enable = enable;
@@ -427,7 +428,7 @@ static int saa7127_set_wss(struct v4l2_subdev *sd, const struct v4l2_sliced_vbi_
 	if (enable && (data->field != 0 || data->line != 23))
 		return -EINVAL;
 	if (state->wss_enable != enable) {
-		v4l2_dbg(1, debug, sd, "Turn WSS %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "Turn WSS %s\n", str_on_off(enable));
 		saa7127_write(sd, 0x27, enable << 7);
 		state->wss_enable = enable;
 	}
@@ -674,8 +675,8 @@ static int saa7127_log_status(struct v4l2_subdev *sd)
 			output_strs[state->output_type] : "disabled");
 	v4l2_info(sd, "WSS:      %s\n", state->wss_enable ?
 			wss_strs[state->wss_mode] : "disabled");
-	v4l2_info(sd, "VPS:      %s\n", state->vps_enable ? "enabled" : "disabled");
-	v4l2_info(sd, "CC:       %s\n", state->cc_enable ? "enabled" : "disabled");
+	v4l2_info(sd, "VPS:      %s\n", str_enabled_disabled(state->vps_enable));
+	v4l2_info(sd, "CC:       %s\n", str_enabled_disabled(state->cc_enable));
 	return 0;
 }
 
diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index b0793bb0c02a443f7cad2e12e6fe20b4abd0241e..f2a342a6d7c95d1777471e032cf25ed1e94ea644 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/string_choices.h>
 
 #include <linux/videodev2.h>
 #include <linux/i2c.h>
@@ -1088,7 +1089,7 @@ static int saa717x_s_stream(struct v4l2_subdev *sd, int enable)
 	struct saa717x_state *decoder = to_state(sd);
 
 	v4l2_dbg(1, debug, sd, "decoder %s output\n",
-			enable ? "enable" : "disable");
+		 str_enable_disable(enable));
 	decoder->enable = enable;
 	saa717x_write(sd, 0x193, enable ? 0xa6 : 0x26);
 	return 0;
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index c50d4e85dfd144bd6a8aee8622d59dbd03a143b0..828e575a4cf2705260351dac99b58e7fceecbd1d 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -22,6 +22,7 @@
 #include <linux/interrupt.h>
 #include <linux/timer.h>
 #include <linux/of_graph.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <linux/v4l2-dv-timings.h>
@@ -371,8 +372,7 @@ static void tc358743_delayed_work_enable_hotplug(struct work_struct *work)
 
 static void tc358743_set_hdmi_hdcp(struct v4l2_subdev *sd, bool enable)
 {
-	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, enable ?
-				"enable" : "disable");
+	v4l2_dbg(2, debug, sd, "%s: %s\n", __func__, str_enable_disable(enable));
 
 	if (enable) {
 		i2c_wr8_and_or(sd, HDCP_REG3, ~KEY_RD_CMD, KEY_RD_CMD);
@@ -1211,7 +1211,7 @@ static void tc358743_hdmi_sys_int_handler(struct v4l2_subdev *sd, bool *handled)
 		bool tx_5v = tx_5v_power_present(sd);
 
 		v4l2_dbg(1, debug, sd, "%s: Tx 5V power present: %s\n",
-				__func__, tx_5v ?  "yes" : "no");
+			 __func__, str_yes_no(tx_5v));
 
 		if (tx_5v) {
 			tc358743_enable_edid(sd);
@@ -1288,26 +1288,24 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 			!!(sysctl & MASK_CECRST),
 			!!(sysctl & MASK_CTXRST),
 			!!(sysctl & MASK_HDMIRST));
-	v4l2_info(sd, "Sleep mode: %s\n", sysctl & MASK_SLEEP ? "on" : "off");
+	v4l2_info(sd, "Sleep mode: %s\n", str_on_off(sysctl & MASK_SLEEP));
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-			hdmi_sys_status & MASK_S_DDC5V ? "yes" : "no");
+		  str_yes_no(hdmi_sys_status & MASK_S_DDC5V));
 	v4l2_info(sd, "DDC lines enabled: %s\n",
-			(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC) ?
-			"yes" : "no");
+		  str_yes_no(i2c_rd8(sd, EDID_MODE) & MASK_EDID_MODE_E_DDC));
 	v4l2_info(sd, "Hotplug enabled: %s\n",
-			(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0) ?
-			"yes" : "no");
+		  str_yes_no(i2c_rd8(sd, HPD_CTL) & MASK_HPD_OUT0));
 	v4l2_info(sd, "CEC enabled: %s\n",
-			(i2c_rd16(sd, CECEN) & MASK_CECEN) ?  "yes" : "no");
+		  str_yes_no(i2c_rd16(sd, CECEN) & MASK_CECEN));
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "TMDS signal detected: %s\n",
-			hdmi_sys_status & MASK_S_TMDS ? "yes" : "no");
+		  str_yes_no(hdmi_sys_status & MASK_S_TMDS));
 	v4l2_info(sd, "Stable sync signal: %s\n",
-			hdmi_sys_status & MASK_S_SYNC ? "yes" : "no");
+		  str_yes_no(hdmi_sys_status & MASK_S_SYNC));
 	v4l2_info(sd, "PHY PLL locked: %s\n",
-			hdmi_sys_status & MASK_S_PHY_PLL ? "yes" : "no");
+		  str_yes_no(hdmi_sys_status & MASK_S_PHY_PLL));
 	v4l2_info(sd, "PHY DE detected: %s\n",
-			hdmi_sys_status & MASK_S_PHY_SCDT ? "yes" : "no");
+		  str_yes_no(hdmi_sys_status & MASK_S_PHY_SCDT));
 
 	if (tc358743_get_detected_timings(sd, &timings)) {
 		v4l2_info(sd, "No video detected\n");
@@ -1324,17 +1322,13 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Lanes in use: %d\n",
 			state->csi_lanes_in_use);
 	v4l2_info(sd, "Waiting for particular sync signal: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC) ?
-			"yes" : "no");
+		  str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_WSYNC));
 	v4l2_info(sd, "Transmit mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT) ?
-			"yes" : "no");
+		  str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_TXACT));
 	v4l2_info(sd, "Receive mode: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT) ?
-			"yes" : "no");
+		  str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_RXACT));
 	v4l2_info(sd, "Stopped: %s\n",
-			(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
-			"yes" : "no");
+		  str_yes_no(i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT));
 	v4l2_info(sd, "Color space: %s\n",
 			state->mbus_fmt_code == MEDIA_BUS_FMT_UYVY8_1X16 ?
 			"YCbCr 422 16-bit" :
@@ -1343,14 +1337,13 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI" : "DVI-D");
 	v4l2_info(sd, "HDCP encrypted content: %s\n",
-			hdmi_sys_status & MASK_S_HDCP ? "yes" : "no");
+		  str_yes_no(hdmi_sys_status & MASK_S_HDCP));
 	v4l2_info(sd, "Input color space: %s %s range\n",
 			input_color_space[(vi_status3 & MASK_S_V_COLOR) >> 1],
 			(vi_status3 & MASK_LIMITED) ? "limited" : "full");
 	if (!is_hdmi(sd))
 		return 0;
-	v4l2_info(sd, "AV Mute: %s\n", hdmi_sys_status & MASK_S_AVMUTE ? "on" :
-			"off");
+	v4l2_info(sd, "AV Mute: %s\n", str_on_off(hdmi_sys_status & MASK_S_AVMUTE));
 	v4l2_info(sd, "Deep color mode: %d-bits per channel\n",
 			deep_color_mode[(i2c_rd8(sd, VI_STATUS1) &
 				MASK_S_DEEPCOLOR) >> 2]);
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 3b7e5ff5b010b5525dcc784c92dd0d5b7b544f64..ca4992b07f57a1f5c4603d67b44c190253ec81bd 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -12,6 +12,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <linux/v4l2-dv-timings.h>
 #include <linux/videodev2.h>
@@ -1969,13 +1970,13 @@ static int tda1997x_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Chip status-----\n");
 	v4l2_info(sd, "Chip: %s N%d\n", state->info->name,
 		  state->chip_revision + 1);
-	v4l2_info(sd, "EDID Enabled: %s\n", state->edid.present ? "yes" : "no");
+	v4l2_info(sd, "EDID Enabled: %s\n", str_yes_no(state->edid.present));
 
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-		  tda1997x_detect_tx_5v(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_5v(sd)));
 	v4l2_info(sd, "HPD detected: %s\n",
-		  tda1997x_detect_tx_hpd(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_hpd(sd)));
 
 	v4l2_info(sd, "-----Video Timings-----\n");
 	switch (tda1997x_detect_std(state, &timings)) {
diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
index b7cedc5b3e8ef4d992dd2bf8248f52be1f3ffaa2..8c3053251d92c655b4defc5bc6fe20ba47638fec 100644
--- a/drivers/media/i2c/ths7303.c
+++ b/drivers/media/i2c/ths7303.c
@@ -24,6 +24,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <media/i2c/ths7303.h>
 #include <media/v4l2-device.h>
@@ -281,7 +282,7 @@ static int ths7303_log_status(struct v4l2_subdev *sd)
 {
 	struct ths7303_state *state = to_state(sd);
 
-	v4l2_info(sd, "stream %s\n", state->stream_on ? "On" : "Off");
+	v4l2_info(sd, "stream %s\n", str_on_off(state->stream_on));
 
 	if (state->bt.pixelclock) {
 		struct v4l2_bt_timings *bt = &state->bt;
diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 686f10641c7a6a028abfb8579df8c34478d08089..12f6c54c14fd6ceb53423895a6f14f4cfbe8b555 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -20,6 +20,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/string_choices.h>
 #include <linux/v4l2-dv-timings.h>
 
 #include <media/v4l2-dv-timings.h>
@@ -127,10 +128,10 @@ static int ths8200_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "----- Chip status -----\n");
 	v4l2_info(sd, "version: %u\n", state->chip_version);
-	v4l2_info(sd, "power: %s\n", (reg_03 & 0x0c) ? "off" : "on");
-	v4l2_info(sd, "reset: %s\n", (reg_03 & 0x01) ? "off" : "on");
+	v4l2_info(sd, "power: %s\n", str_off_on(reg_03 & 0x0c));
+	v4l2_info(sd, "reset: %s\n", str_off_on(reg_03 & 0x01));
 	v4l2_info(sd, "test pattern: %s\n",
-		  (reg_03 & 0x20) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_03 & 0x20));
 	v4l2_info(sd, "format: %ux%u\n",
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_MSB) * 256 +
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_LSB),
@@ -146,7 +147,7 @@ static int ths8200_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct ths8200_state *state = to_state(sd);
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index c09a5bd71fd0bb4d2e7d5d26f6c3be74de1b7efa..753ae187dea2f90088caab873453fd8f24872101 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
+#include <linux/string_choices.h>
 #include <linux/v4l2-dv-timings.h>
 #include <media/i2c/tvp7002.h>
 #include <media/v4l2-async.h>
@@ -771,8 +772,7 @@ static int tvp7002_log_status(struct v4l2_subdev *sd)
 		v4l2_info(sd, "Detected DV Timings: %ux%u\n",
 				bt->width, bt->height);
 	}
-	v4l2_info(sd, "Streaming enabled: %s\n",
-					device->streaming ? "yes" : "no");
+	v4l2_info(sd, "Streaming enabled: %s\n", str_yes_no(device->streaming));
 
 	/* Print the current value of the gain control */
 	v4l2_ctrl_handler_log_status(&device->hdl, sd->name);
diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 5f1a22284168d4256e5fcd236f7a446505ca74ea..63a2b6444bd09b5bcfd72aa6212160e748cea10a 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/types.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/uaccess.h>
 #include <linux/i2c.h>
 #include <linux/videodev2.h>
@@ -401,7 +402,7 @@ static int vpx3220_s_routing(struct v4l2_subdev *sd,
 
 static int vpx3220_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	v4l2_dbg(1, debug, sd, "s_stream %s\n", enable ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "s_stream %s\n", str_on_off(enable));
 
 	vpx3220_write(sd, 0xf2, (enable ? 0x1b : 0x00));
 	return 0;

-- 
2.43.0


