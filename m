Return-Path: <linux-media+bounces-60122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEckEJZ59GmLBgIAu9opvQ
	(envelope-from <linux-media+bounces-60122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:59:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C24AB784
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1856F303AB4A
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 09:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396DD38553B;
	Fri,  1 May 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr1DeRWJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20A38229E
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629459; cv=none; b=Y/41+FwjytKk7x1ihX4bzk0h9jEe3xy+t5j4i/b/3o/dAO2x7YC6YsLuz3ouOJjjRdNfEF0zsbsobASlv8zprNgNmEWrmwXGg+IsGoF6PvODLl2xSj4IiXMhNQkzkBcH76EKMLbJcKel5rzd5EofY3+xwjP/iXRw/47RpYCaLh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629459; c=relaxed/simple;
	bh=XGBLXAIDkYUbzl5baaOUU6KR6BYYFAzHPw0R+XSs704=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzvw9Iz0i4slX9YYf0IRhzYMh9F4fmcUWrVDyLnXYofn4BiVHvcbO4UQyDWMPDOF+EhpD/ZKKsmLIdWKF+RdzdYdDgmAXuMA9KJXGe+OAm9a5AdlJ+iaNbHX79l8GgbEBMOXMp6V+Ri3m1MQ27/keL2KCLAftER13IvdA2/gTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr1DeRWJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82418b0178cso966124b3a.1
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 02:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629454; x=1778234254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3ovUkWgYWEpqqlsycCJZaa2Pww05sUjyxsTGBfrzAA=;
        b=Mr1DeRWJF/DMQFtiwlZm21AdgJQgYlC7Qpwz71S4v6sKxzZdUXDiE7A9oOgU59J2Iu
         3zvdAIrbvfBFUPpf/9KIR1WQGmGVHRNefifZ0Z9Dv1dJySdp8D+gkQWa/E4QKEc4KWKL
         w1WkFtrAh1GwJUoO7vs+eOKNSfVAUVmhQa0YVWAJE9ejADRjTCLULzoRKox3weY6ny2H
         /+zyTRlCD6RKUXVSGBrfUBKgxND6y7QfFt4D28mbTgGt7tY3ae3cLbAeMCl2gMqH9TaN
         pjVmAVa6wQZSVFdD9C5DYriZWbegf8L9qw2fIeGE/EZim0nVZOFEAYAzeXrQaD3PKi+G
         osjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629454; x=1778234254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3ovUkWgYWEpqqlsycCJZaa2Pww05sUjyxsTGBfrzAA=;
        b=oI2oXzgyY6mypG3ht4+ICifFMfFTAKq3vsfvykfKARvKcA79Z8m+gMBlWH7xmB8Kzj
         l80DLnZ4dh7qFcj3PjcTlhgziVAorkjaBWmgkos1OOeIe7dxGG4vXn3149UdH4SG119j
         L82WL89jElh9wwlWtvhXiTHfp8cyd5djBHLUYWk3ZKpU1Kai6qQroqPqdxH0u5H1/pRg
         OwDHBdme2bifzu99UpQySe0u3tIfuomcw80wUJymnC3P47I0DpTt3BoR40EmbMR7VMRr
         wmEl7zciNR47U3iUyOxnSABSy3mj6qCxrC9wDYNYZ4RCU3ChgO5Zyjgrif8eQrdo3wP5
         SU9g==
X-Forwarded-Encrypted: i=1; AFNElJ94nIssbjTM+gwAHe6hI4kX4QxsRklVbXjC9BIOVHrQ4/hEnp6vApgZzMzihDlEfQFbUnKT/cEfyGGPuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDIUBtefcWXYMCl4DbB0jXO2R4cH6kjIo9ojBf40Vpue2AcaCL
	5q0BE5xIJzXVAjTe/g/QIZSBuIXmcnOq8ozKGSHMrr3N2A1Zhc1kjK/7
X-Gm-Gg: AeBDieu+ZvBTUx6fdGUmTo8mxA8OfEHvbeMA95vznneiywbdxmmezTgmEslZ/yNhXMc
	zOctRYMjAduW55UysT0NDWztZ9YvPyNitC1GgSHb9KbxjVy/jtKZYMAADD4gSF7+baaTk4P09wu
	tsxv0BmbwikYR2BAApJuzlX/s2G0uAbUfl5eQOmo5I1v8F2EeceZumGqGtgrbhv7Zz7ox6ItDOj
	u/DxBmIok3zw1rw5958yAo+7iWF0d3jx2wtLSqsI+RBjs8aWSHAlx9rwq+Q6mfg+CqUglybEd/u
	C26rJeI/HTzGDcI93YylQWSmNNoQfp2GhM8wWJYNT3pJ/c5a4DJ8kIFBWVrC5gvh+45WbxJgF1y
	muQ3OkfIF1Bwv++ZpOAqV446dLNaSH2pEuAOCn06C6rnyjO+Z/6H/8gfRrP8vgIOcYoNbRxPaSM
	SV5JZPRxuLS9OvlA==
X-Received: by 2002:a05:6a21:6d88:b0:39b:da83:91aa with SMTP id adf61e73a8af0-3a3cf8cbdc5mr7983611637.51.1777629453564;
        Fri, 01 May 2026 02:57:33 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:33 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 2/4] media: hi846: fix link frequency handling
Date: Fri,  1 May 2026 17:54:31 +0800
Message-ID: <20260501095433.1609309-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 945C24AB784
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60122-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]

link frequency is tied to PLL configuration, lane count, and external
clock rate, so use runtime here instead of hardcoding for specific
configuration. To implement this, this commit did

1. dropped exposed link freqs as a v4l2_ctrl, since we are runtime
now, it is inconvenient and unnecessary to expose it, and
hi846_set_ctrl has nothing to do with it.

2. attached pll_cfg_2lane to current mode, and use it with clock, lane
count to calculate link frequency, we use 2-lane config as default,
but we can halve it easily for 4-lane case.

3. dropped mclk clock rate check.

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 72 +++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 7f069aca0fce..3a0b1e124d9d 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -219,8 +219,8 @@ struct hi846_mode {
 	/* Horizontal timing size */
 	u32 llp;
 
-	/* Link frequency needed for this resolution */
-	u8 link_freq_index;
+	/* PLL configuration for 4-lane link at this resolution */
+	u16 pll_cfg_4lane;
 
 	u16 fps;
 
@@ -1040,13 +1040,6 @@ static const char * const hi846_test_pattern_menu[] = {
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
@@ -1061,7 +1054,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
-		.link_freq_index = FREQ_INDEX_640,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 120,
 		.frame_len = 631,
 		.llp = HI846_LINE_LENGTH,
@@ -1086,7 +1079,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 90,
 		.frame_len = 842,
 		.llp = HI846_LINE_LENGTH,
@@ -1112,7 +1105,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1632,
 		.height = 1224,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 30,
 		.frame_len = 2526,
 		.llp = HI846_LINE_LENGTH,
@@ -1161,7 +1154,6 @@ struct hi846 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	u8 nr_lanes;
 
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
@@ -1192,21 +1184,37 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
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
+	/* NOTE: 6, 7 actually map to 8, 10, but the used won't be that big */
+	u8 post_div1 = 1 + FIELD_GET(GENMASK(10, 8), cfg);
+	u8 post_div2 = 1 << FIELD_GET(GENMASK(12, 11), cfg);
+
+	/*
+	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
+	 * [11:8]: 0x02 => pre_div = 3
+	 * [7:0]: 0x5a => multiplier = 90
+	 */
+	u64 link_freq = mclk / 3 * 90 / post_div1 / post_div2;
+	/*
+	 * for shared modes, since lane count is halved for 2-lane, then getting
+	 * link_freq doubled to match the same data rate. Since 720x480 is
+	 * 2-lane only(i.e. reg_list_4lane.num_of_regs == 0), no pll cfg for
+	 * 4-lane, the pll cfg is actually for 2-lane, so use the cfg as is.
+	 */
+	if (hi846->nr_lanes == 2 && cur_mode->reg_list_4lane.num_of_regs)
+		link_freq *= 2;
 
-	return hi846_link_freqs[index];
+	return link_freq;
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
@@ -1503,10 +1503,10 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
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
@@ -1749,7 +1749,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	mf->code = HI846_MEDIA_BUS_FORMAT;
 	mf->field = V4L2_FIELD_NONE;
 
-	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
 	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
 				 hi846_calc_pixel_rate(hi846));
 
@@ -1950,16 +1949,17 @@ static int hi846_identify_module(struct hi846 *hi846)
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


