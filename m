Return-Path: <linux-media+bounces-67393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L7vGJzSAU2q9bQMAu9opvQ
	(envelope-from <linux-media+bounces-67393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:53:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CD87448AB
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YEue1lSk;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67393-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67393-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C27302C199
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 11:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E305B3A7F57;
	Sun, 12 Jul 2026 11:52:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00FB3A3E60
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 11:52:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857133; cv=none; b=g+oE58IeKdudlCLZ3320lqQYuCvtLKc3P6/VmIN1SSInPuuM3mmKZhWTEYb6SyBWER3izR4AenQiuiIEsmIdsp8ts3NWhN+HBh9ZqoQZ1K/apj6E6hfn/jYQuIpoTtz6A3ByQtyzAE4AwN8bTnSxiPlp5gtsA8OGnmfeJNBcQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857133; c=relaxed/simple;
	bh=7Dkv2xFSnK5on2kNK4BJbKyG6nJGS/FKwg8wvyvmW04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzEgEebNkIziCCBh3bQPgzL6YnOcDnOP+uiTMYhVWsUfey+D5mvZ9hta4dJxvcYiUzI/7TYWX8SVme8msVAohOP9nFzSReW1QVNlaSy78NKb4NMugmaEG+ZaLiPmWBEaxwJxm3WiXRc9Jiwfk0iQSif17XS9pHTVnk8Avf6rCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEue1lSk; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso9151245ad.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857131; x=1784461931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhK9bfq2tOdFBvjORvoaYZUgl9YXotqdNA2XfoO3L1s=;
        b=YEue1lSk1yeP2FuWh4nYR9tBMRlJ+zwpzYEPuquB47U4nXtwEsIz+7UQk76DLC//KV
         9cNc0b37/QVhmLzkUUqEHvXWqTCqbAoQ6vE5CC8jB2qxNfn1nRKwNbhLM+NdLQUC8W3K
         982GVadd/YiSsTcq61BQwU3lf7Nn/QpuwfPe0XL0yt+0dVVxoReqbtdeJbtRF7ms+wcY
         Xfx4BS1fCOwcF/PQnWl1A4VZNUzSIKzFaYS82nKqKN1Is57ej8A4X7TF3TLYQAvHXiJQ
         gApqbJM/yneOXE2pzax7hbDdlV9OKG3SX/o7QNO/GPmWtRaYD6PA/ZqVG1hXEzaQdsu5
         ySCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857131; x=1784461931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhK9bfq2tOdFBvjORvoaYZUgl9YXotqdNA2XfoO3L1s=;
        b=XsSrlv6b4aeYpmBFSYuDyRyllzaT0MEbx04LDZhOVaoYFJsCbPe+GtszrgygCxe6JW
         OH70r6/M1l4fwfWJKzXL7SzJJGvvy6aiKkaCeb1be6gs3UEapeaqefWIgd8ntgmB7w3q
         Ucz3nVvikihxgf1iwXaoJAB6cqTuNtGzmw3ZhkSTTMuMcmcJRM9E/FBgzKbK+no8yPXB
         koE2Hm9ZuxYUzb4fyHM0hZauJC6wuTvEDqRMuRAyA/3jkAXxGhYviURnqlraAEFgkymH
         HSB8Em8R5/gVfUdQhq65Lm6pBpYaY6QzIHIIItDD4JTyMnPPavzOX7RRUYLBDRAWmTFZ
         UxnA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4CY8m2eAr571glNvvfsjU2a4xmqCGZeJCI3dKL6hzex1hibAl7LfEo8aYDqM23AW524o+HGUYJxmMDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNpEa4pE+7koQE6MZF7Hb4AyxEz3krcuNdC7IxrEyLADnFsTe
	elZn4hdwBusT8FuQfRi3fMXLBQtdgvNkqYGaf3JIr1UJvLf3etHIuZOA/Fd5BO87ifY=
X-Gm-Gg: AfdE7cmzz88ltTL3XCCgAcwxw/YyYW9CWf7DQfBAsvEJ4AzZeqgBZ1720vyNfGFeNlV
	WKNSKvTRk4CUqIoZC8UJT9pHMwvM3kqKzAQHAxQdBgeSs00BX2+6HyYhjzmkqMSAVbSyBkvnPco
	iMgLzcycm0D0DCeHr4PsodlnPHwgqZftqVg0cP4yD4h967UVwp4qMoCZxgoprPPXPw0mRepAn1t
	Z5xRjf2+YJ/jNgTFoBRkVADThSkobFZGWy1MmaCTLlC92euJ5K9ARxGMBGIHzU47Zii4MZJ0fPA
	HfQZoJdlXsEBWZrYekiLGRBvjUXt/KEUTHY0TFSawBFcFvtaT71oJliU4qsawQD4dVALEwy2dJr
	uTOzNynZdhPPpOvHchc3yZyf9ISBkYL/E8qtl0lkknR2AGg8k8Oey/xH40jJSJOTdng7J/JUSkw
	EF8K5U6iHGDwNylqdDijnN9KgBvXP0q4aDkZxm7B4=
X-Received: by 2002:a17:902:d987:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2ce9e9a7128mr62427285ad.4.1783857131361;
        Sun, 12 Jul 2026 04:52:11 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:11 -0700 (PDT)
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
Subject: [PATCH v5 2/5] media: hi846: Fix link frequency handling
Date: Sun, 12 Jul 2026 19:50:09 +0800
Message-ID: <20260712115012.91600-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67393-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:sakari.ailus@linux.intel.com,m:martink@posteo.de,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sebastian.krzyszkowiak@puri.sm,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1CD87448AB

Link frequency is tied to PLL configuration, lane count, and external
clock rate, so use runtime here instead of hardcoding for specific
configuration. To implement this, we do

1. Drop exposed link_freq as a v4l2_ctrl, it is inconvenient to expose
it as an int_menu when freq_links are varies between mclk rates, this
will not break v4l2_get_link_freq() since it can be calculated back
from pixel rate which is previously from the dynamic link frequency.

2. Attach mipi_clk_div_{2,4}lane to current mode, and use the div with
mclk clock, lane count to calculate link frequency.

3. Drop mclk clock rate check.

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Drop line break (Sakari)
---
Hi, Sakari. I did not follow to use v4l2_link_freq_to_bitmap(), which
you mentioned in v4, since we have no fixed int_menu for link_freq.
---
 drivers/media/i2c/hi846.c | 82 ++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 45 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 7f069aca0fce..6bcd862aee30 100644
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
+	u8 mipi_clk_div_2lane;
+	u8 mipi_clk_div_4lane;
 
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
@@ -1061,7 +1055,13 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
-		.link_freq_index = FREQ_INDEX_640,
+		.mipi_clk_div_2lane = 4,
+		/*
+		 * Dummy but necessary if we set this mode default, otherwise
+		 * hi846_calc_pixel_rate() will be broken in
+		 * hi846_init_controls()
+		 */
+		.mipi_clk_div_4lane = 8,
 		.fps = 120,
 		.frame_len = 631,
 		.llp = HI846_LINE_LENGTH,
@@ -1086,7 +1086,8 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.link_freq_index = FREQ_INDEX_1280,
+		.mipi_clk_div_2lane = 2,
+		.mipi_clk_div_4lane = 4,
 		.fps = 90,
 		.frame_len = 842,
 		.llp = HI846_LINE_LENGTH,
@@ -1112,7 +1113,8 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1632,
 		.height = 1224,
-		.link_freq_index = FREQ_INDEX_1280,
+		.mipi_clk_div_2lane = 2,
+		.mipi_clk_div_4lane = 4,
 		.fps = 30,
 		.frame_len = 2526,
 		.llp = HI846_LINE_LENGTH,
@@ -1161,7 +1163,6 @@ struct hi846 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	u8 nr_lanes;
 
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
@@ -1192,21 +1193,28 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
 	return NULL;
 }
 
-static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
+static u64
+hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *mode)
 {
-	return hi846->cur_mode->link_freq_index;
-}
+	u64 mclk = clk_get_rate(hi846->clock);
+	u8 mipi_clk_div;
 
-static u64 hi846_get_link_freq(struct hi846 *hi846)
-{
-	u8 index = hi846_get_link_freq_index(hi846);
+	if (hi846->nr_lanes == 2)
+		mipi_clk_div = mode->mipi_clk_div_2lane;
+	else
+		mipi_clk_div = mode->mipi_clk_div_4lane;
 
-	return hi846_link_freqs[index];
+	/*
+	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
+	 * [11:8]: 0x02 => pre_div = 3
+	 * [7:0]: 0x5a => multiplier = 90
+	 */
+	return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
 }
 
 static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
 {
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
 
 	do_div(pixel_rate, HI846_RGB_DEPTH);
@@ -1426,14 +1434,6 @@ static int hi846_init_controls(struct hi846 *hi846)
 
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
@@ -1503,10 +1503,9 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
 	u64 frame_length;
 	int ret = 0;
 	int dummy_lines;
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 
-	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
-		hi846_get_link_freq(hi846));
+	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__, link_freq);
 
 	do_div(link_freq, fps);
 	frame_length = link_freq;
@@ -1749,7 +1748,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	mf->code = HI846_MEDIA_BUS_FORMAT;
 	mf->field = V4L2_FIELD_NONE;
 
-	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
 	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
 				 hi846_calc_pixel_rate(hi846));
 
@@ -1950,16 +1948,17 @@ static int hi846_identify_module(struct hi846 *hi846)
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
@@ -2041,7 +2040,6 @@ static int hi846_probe(struct i2c_client *client)
 	struct hi846 *hi846;
 	int ret;
 	int i;
-	u32 mclk_freq;
 
 	hi846 = devm_kzalloc(&client->dev, sizeof(*hi846), GFP_KERNEL);
 	if (!hi846)
@@ -2060,12 +2058,6 @@ static int hi846_probe(struct i2c_client *client)
 				     "failed to get clock: %pe\n",
 				     hi846->clock);
 
-	mclk_freq = clk_get_rate(hi846->clock);
-	if (mclk_freq != 25000000)
-		dev_warn(&client->dev,
-			 "External clock freq should be 25000000, not %u.\n",
-			 mclk_freq);
-
 	for (i = 0; i < HI846_NUM_SUPPLIES; i++)
 		hi846->supplies[i].supply = hi846_supply_names[i];
 
-- 
2.54.0


