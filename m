Return-Path: <linux-media+bounces-61084-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB45CDOzAWppigEAu9opvQ
	(envelope-from <linux-media+bounces-61084-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:45:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE950C1B7
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09A8D3015842
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA73E3DA5A7;
	Mon, 11 May 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkqZwRGp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455D3D9DBD
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496191; cv=none; b=mbB65RPWm6bju2QL/NKCfcP7Nc3VUeUPp5X5MhPgs3Lt1Y4eVsxn9kXfEvYK2f5/5lNu3MS6vR0LvTX4JMz4kMNKvVfOyOx6nMQopGJF81YdefhwBbUXb77NCbO9IbfBFZiFoR4jW7GVjDVucy4sXvV1KY8IxgcLMOrZwal088Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496191; c=relaxed/simple;
	bh=86BVjg3fUi6L5l876V4g4U2aWxKi+IkwHNy/9JsGfvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvSJflLc/ydtbx2mvld3xObMfiP7ZnKuFmaabfEIi4LkdiLKUJTWvQegW36c8zW671fWB6HD+Uayzz2Ji9DkLqCtYsC3OQqZgVdGaHqE+hmVEs3Xfsre7UBfn787X8oVaalSUkhKkOwv61ga+RK+TleZ994FJGjMceyJ55jqvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkqZwRGp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3660b84347dso2486590a91.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496189; x=1779100989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvfPrv6bBoCwpgk/d8yLJl6+NN2EUVD+9grDz7Fp0E0=;
        b=TkqZwRGpzuq88rPxLDqRp3XI4s6s+gu11ulmTiymD8QUAn3hw85WiM9FWKAlgq6v6e
         KdTvHQkQYmyvW9nw7pddNtPCbvvh/Z58wVGMmCQVsc9FE1IE0odSOon2qMRqaIUXsa82
         5gbxM+QK1Hm6IqX+xJkSVwQDPm+b9AQlrDgqNsp8c2GqFGh45/Zs/XtccPzrmZKjCRXH
         9bSPjHztQ2ShNopMyz2LrDLy6d19oAbNwASnnn35ij0nnxp8a/l5jBbcEryTtAQx5CI/
         5e/E5AQJyhXlCa8TfG5024TOGQ1RdBlTrDSOPteqV4fygwsqI513B+a6Qs9ushnJAWQ3
         y8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496189; x=1779100989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvfPrv6bBoCwpgk/d8yLJl6+NN2EUVD+9grDz7Fp0E0=;
        b=cl1RxOGrmbb06ud4PT4VUeMjyTMg7tHSTeETmWc3mT431Pk7GI88qbJE1Y4Mq//aFr
         WFtWGERE9xW/94iuTKnyMmmjMgtGozLbtx6rhnt9mXH2JHVI6KT0x1f42I46yZ8i/dGs
         lr1NS9GdgJ/fhczZ6PCwpNqvpFElUFPJtHgJrAAsREy+rtWMgAe2A6ir8txId/KQ5b1L
         FpMPtLHCWpYbsmH1QGNhgmGNXsLWAcTqI+dy5lsf/BtqOOJ+xoMSaElR1QXtfCDufZHw
         miMDB2I1NWLz4GDI/TJxe0m1ohj/dz4KgVibJ3YxVTkAVs7uo7DnPtL5gpbTK+XeKe+I
         7r3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RT30Yf8jPAnlQVTdMX5ii5W+h4iWIvZB9xZH9vPuBHfqgEnFEwe6ZlrDRijvymvVNXQe8mnerfdztQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqJv29KRKxedebbex9/mALk/JgLXKfzRoSU2vvVooIBaFlZ6z
	QP+aRk6YY+yGkoqBeGtUc6LXJP+lYxjxo40NsN3yHwfNfy+V8Q4pRNnC
X-Gm-Gg: Acq92OFGvjxK5YofCFuVcGvjsHzWWU+fF+V7HT/EEf2r4k3ngn2U9dUxPe6O+ebGqF7
	kCBlgFLVr2qvWy67iAnNBHLKsOm8esNC5MaRYUqpLFzM5PoZsyTbD70b9NsPZWPaiWVKvsmTkiY
	2d4lllRa7JfFjRpDc850Zp0wwseSx8cSZ8X14so7eeQVLrkvEpeTMmvLVXnmm37UpKK4VkeWmBU
	vaM1Y2CzelvZqVA25T40+SZ0Sk7pUM44Rx/8M371W+k4lsN38EUufPzBqNqpXnwqtVzkIO5qLjI
	WYK9tePCJyVHV5BusIQ8dWRFuYZATqv0T3hV4Y3PMDsNSTm+De/F7Pe0Q0vqe/O9wGeAMDvp5hP
	OrntGnta0cwFqILGVyQcfiuATkEjrE77oJF/RwfaJVLMIdXdNf4I/9f5+MG0lH3rU186bA0j55O
	9s9nDk8UkjbNHNXcRMgw==
X-Received: by 2002:a17:90a:4ca7:b0:367:c367:7e19 with SMTP id 98e67ed59e1d1-367c3678e61mr7498225a91.21.1778496188786;
        Mon, 11 May 2026 03:43:08 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:08 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 2/5] media: hi846: fix link frequency handling
Date: Mon, 11 May 2026 18:39:24 +0800
Message-ID: <20260511103927.279550-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B8DE950C1B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61084-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

link frequency is tied to PLL configuration, lane count, and external
clock rate, so use runtime here instead of hardcoding for specific
configuration. To implement this, this commit did

1. dropped exposed link freqs as a v4l2_ctrl, since we are runtime
now, it is inconvenient and unnecessary to expose it, and
hi846_set_ctrl has nothing to do with it.

2. attached pll_cfg_4lane to current mode, and use it with clock, lane
count to calculate link frequency, we use 4-lane config as default,
but we can double it easily for 2-lane case.

3. dropped mclk clock rate check.

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 75 ++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 7f069aca0fce..61297ef66a0e 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2021 Purism SPC
 
-#include <linux/unaligned.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -11,6 +11,7 @@
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -219,8 +220,8 @@ struct hi846_mode {
 	/* Horizontal timing size */
 	u32 llp;
 
-	/* Link frequency needed for this resolution */
-	u8 link_freq_index;
+	/* PLL configuration for 4-lane link at this resolution */
+	u16 pll_cfg_4lane;
 
 	u16 fps;
 
@@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_menu[] = {
 	"Resolution Pattern",
 };
 
-#define FREQ_INDEX_640	0
-#define FREQ_INDEX_1280	1
-static const s64 hi846_link_freqs[] = {
-	[FREQ_INDEX_640] = 80000000,
-	[FREQ_INDEX_1280] = 200000000,
-};
-
 static const struct hi846_reg_list hi846_init_regs_list_2lane = {
 	.num_of_regs = ARRAY_SIZE(hi846_init_2lane),
 	.regs = hi846_init_2lane,
@@ -1061,7 +1055,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
-		.link_freq_index = FREQ_INDEX_640,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 120,
 		.frame_len = 631,
 		.llp = HI846_LINE_LENGTH,
@@ -1086,7 +1080,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 90,
 		.frame_len = 842,
 		.llp = HI846_LINE_LENGTH,
@@ -1112,7 +1106,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1632,
 		.height = 1224,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 30,
 		.frame_len = 2526,
 		.llp = HI846_LINE_LENGTH,
@@ -1161,7 +1155,6 @@ struct hi846 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	u8 nr_lanes;
 
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
@@ -1192,21 +1185,37 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
 	return NULL;
 }
 
-static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
+static u64
+hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *cur_mode)
 {
-	return hi846->cur_mode->link_freq_index;
-}
+	u16 cfg = cur_mode->pll_cfg_4lane;
+	u64 mclk = clk_get_rate(hi846->clock);
 
-static u64 hi846_get_link_freq(struct hi846 *hi846)
-{
-	u8 index = hi846_get_link_freq_index(hi846);
+	/* NOTE: 6, 7 actually map to 8, 10, but this won't be that big */
+	u8 post_div1 = 1 + FIELD_GET(GENMASK(10, 8), cfg);
+	u8 post_div2 = 1 << FIELD_GET(GENMASK(12, 11), cfg);
 
-	return hi846_link_freqs[index];
+	/*
+	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
+	 * [11:8]: 0x02 => pre_div = 3
+	 * [7:0]: 0x5a => multiplier = 90
+	 */
+	u64 link_freq = mclk / 3 * 90 / post_div1 / post_div2;
+	/*
+	 * for shared modes, since lane count is halved for 2-lane, then getting
+	 * link_freq doubled to match the same data rate. Since 720x480 is
+	 * 2-lane only(reg_list_4lane.num_of_regs == 0), no pll cfg for 4-lane,
+	 * the pll cfg is for 2-lane, so use the cfg as is.
+	 */
+	if (hi846->nr_lanes == 2 && cur_mode->reg_list_4lane.num_of_regs)
+		link_freq *= 2;
+
+	return link_freq;
 }
 
 static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
 {
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
 
 	do_div(pixel_rate, HI846_RGB_DEPTH);
@@ -1426,14 +1435,6 @@ static int hi846_init_controls(struct hi846 *hi846)
 
 	ctrl_hdlr->lock = &hi846->mutex;
 
-	hi846->link_freq =
-		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
-				       V4L2_CID_LINK_FREQ,
-				       ARRAY_SIZE(hi846_link_freqs) - 1,
-				       0, hi846_link_freqs);
-	if (hi846->link_freq)
-		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
 	hi846->pixel_rate =
 		v4l2_ctrl_new_std(ctrl_hdlr, &hi846_ctrl_ops,
 				  V4L2_CID_PIXEL_RATE, 0,
@@ -1503,10 +1504,10 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
 	u64 frame_length;
 	int ret = 0;
 	int dummy_lines;
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 
 	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
-		hi846_get_link_freq(hi846));
+		link_freq);
 
 	do_div(link_freq, fps);
 	frame_length = link_freq;
@@ -1749,7 +1750,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	mf->code = HI846_MEDIA_BUS_FORMAT;
 	mf->field = V4L2_FIELD_NONE;
 
-	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
 	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
 				 hi846_calc_pixel_rate(hi846));
 
@@ -1950,16 +1950,17 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	const s64 *freqs = hi846_link_freqs;
-	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
+	int freqs_count = ARRAY_SIZE(supported_modes);
+	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
+		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
-			if (freqs[i] == ep->link_frequencies[j])
+			if (link_freq == ep->link_frequencies[j])
 				break;
 		if (j == ep->nr_of_link_frequencies)
-			return freqs[i];
+			return link_freq;
 	}
 
 	return 0;
-- 
2.54.0


