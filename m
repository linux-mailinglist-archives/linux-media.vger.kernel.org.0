Return-Path: <linux-media+bounces-29011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B21A75CA5
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 403E0188280B
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492011EC006;
	Sun, 30 Mar 2025 21:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MToTT07m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770DD1EB5E0;
	Sun, 30 Mar 2025 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368910; cv=none; b=NaNcdfpSZF62LiAcZ9xZfPlIzlO8e8Uqw/x2xexnFkD4yMVejRc022ZDOwTJywe6CuXtOro9h2NWOz3quwkksaC+r3MKcxRTm5ecGKe2r/aGtwtcw0B3wmz7aaehJ9SLRyGmvzQ+oQuar+JydVerWVEWrLWrKeGnXgoZNOTXr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368910; c=relaxed/simple;
	bh=EOlXNzWhtfr9tAcWkH0F7AZwdis5Q+o4iJ7vXoW1Lks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HG5081A1WltPNNgL8A6O6hmHZJul6zc3XhkRNClSL8lmWW2VETtbZkuHhhfMmtqb8fMpTJgXwFVBuBv19L3pga0GI8H2YtCOBE42Hk1f1NDA0CQfyg6pTLmJNw0zUC+nCksLnaLK0tzZudWcpqZ3RxG3ZIljjNGuMCGyt6McWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MToTT07m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so38506845e9.3;
        Sun, 30 Mar 2025 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368907; x=1743973707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ59l6m6bxVI27Mf+5asUd1VDrpUuWbhL/i0GCBY5dQ=;
        b=MToTT07mHJ1LLayGZ5a/87S1KYW0pmYuqsDRQVGsa0/fc8imaQ50W9WIEYPNLtZ+Sy
         H6UC+8OY43TX3zYEqMsdnl9z+k3NjnM7UncvCQcV+3YADghRrWh2NuRd8maqDdSE6xBh
         2nA3CGckskNhnder0HAVY2Fh3FTLBUv4UysLdckfEYtUi8pkPI9v4CnVJs3Cnm1hLb7Q
         Qz+KyCgqlFENQ/llKIh32olkuVKUQGePcRp9Ewsn5RRkJBdDYVz7wL2HgdVVP6obwOJb
         Bbfi/vqnfmYq3yFTIfu1TugM8jJRskpQKPED9MZlYPTyqw42mb6lU2QZFHYVwTm80OaN
         8m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368907; x=1743973707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ59l6m6bxVI27Mf+5asUd1VDrpUuWbhL/i0GCBY5dQ=;
        b=QAOPxa/SXW1UgF30VrpV0qq7zOwuU+LqlxLj6VoE99JTsRtiJEem2Gu0IVBbNpBcmm
         +4TrSpemVn6xhCzY5FJGQ+13seWuORa+zlEELX78Gqju8muSeiofausStdDxnl1A4/mA
         sTTquzCsSdL9tICSqeYspp9m9eY6YYWcO5EYzzwQf+Goa2S6fKVCOYVxaFRJ37zpB4Gl
         JNF7NHz6gG+bi2sjYE677pSCdoHQ8iSnYEakn1FmO5XTZg2fIfKbKX5UyU4Xj4DI4KQ2
         8q7tW7qQJCwubWtSIFCtRa59uTjAlx4jd6K3PK1gPzqgByKJPURbOvxLub8Ty/BmaTSN
         G+/g==
X-Forwarded-Encrypted: i=1; AJvYcCUEIyrUIE21eh7Unsn+QSq0sGqfPa1TLPSLv4MvslngR8y5RsLLLFMQqFgUNvPXhQJiow0DHJ0MzHwEOxEY1D1iEWo=@vger.kernel.org, AJvYcCV+dcBSXxQvOR+iqP9rpLoRINBCMuWVxrn3izYgIUL+R/XUxtd47E/8avmgSDcIC3tEK+x9PkYXyOanaoQ/@vger.kernel.org, AJvYcCW0Psd2C6/6jp/+gvWSvU/tNOMjS6BMTj8rFZDEUQa808e2bsMJ9l+kwQHHK6TCB3xtHKYiYmM0qU89W9I=@vger.kernel.org, AJvYcCW48oFmrkU6EHz9HGklNzx/He50drxesEAp9H9jZhVcINiAhEm+OBO996sgoiNo2g8O7bzeMz6TkhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuv8whviQIU7+K1o2haaQ4mfupizbcZjsQCBfM+RkXeJfq3UTA
	s/3GT1tZmtjWI1yRkiipkHAMH32NACsou6Yp8eFuuj6HYqBvoZ31
X-Gm-Gg: ASbGnctuKNwo/fXFU2rsaMVdk2RowpCDTuwNlYocrKMaginmQkC63sRxKY9c9liOoPb
	X63RE8c6kUL09Tf99zIegmGj/dEbWOhKt4xvAP7BTo+ZFYx77PTN8bTUNps/WhzBDIqkZU/ocaI
	2CZJLQKsVIe1QJTyizfgI2R9Nskp53ckD/t/vXSV5BjaRadWHRPHVX1o+Fe9JbNEtQFoa4wEWVC
	w6JEKe05mq3Qysg0Sp4OQiPhIq3j5WF4T0N2zCHapmTPHjqsvz6rNiJxXXzyMX4SnF2yNcrTYNj
	PsD6UGanUCKyqRAmmkq0RCVyqi0VSdue0juLLpZSMJr5Fg7YHDTNKruZ9dc47gji6JHQow==
X-Google-Smtp-Source: AGHT+IGjVJQZz2HxzJy2yVEAVVveqTf//VEVqZTHpwQmKQoCMS/wVznctuwfhdYxAYIQgxUkqcaazw==
X-Received: by 2002:a05:600c:870c:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-43db624a3dbmr63640155e9.14.1743368906464;
        Sun, 30 Mar 2025 14:08:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 17/17] drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
Date: Sun, 30 Mar 2025 22:07:13 +0100
Message-ID: <20250330210717.46080-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add DSI support for Renesas RZ/V2H(P) SoC.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 450 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  40 ++
 2 files changed, 490 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 26ec0f5d065a..3a70f479d473 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Renesas Electronics Corporation
  */
 #include <linux/clk.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -30,6 +31,9 @@
 
 struct rzg2l_mipi_dsi;
 
+#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA	(80 * MEGA)
+#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA	(1500 * MEGA)
+
 #define RZ_MIPI_DSI_16BPP	BIT(0)
 #define RZ_MIPI_DSI_HASLPCLK	BIT(1)
 
@@ -41,6 +45,7 @@ struct rzg2l_mipi_dsi_hw_info {
 			      unsigned long long *hsfreq_mhz);
 	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
 					    unsigned long mode_freq);
+	const struct rzv2h_plldsi_div_limits *cpg_dsi_limits;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
 	u8 features;
 };
 
+struct rzv2h_dsi_mode_calc {
+	unsigned long mode_freq;
+	unsigned long long mode_freq_hz;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+
+	struct rzv2h_dsi_mode_calc mode_calc;
+	struct rzv2h_plldsi_parameters dsi_parameters;
+};
+
+static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits = {
+	.m = { .min = 64, .max = 1023 },
+	.p = { .min = 1, .max = 4 },
+	.s = { .min = 0, .max = 5 },
+	.k = { .min = -32768, .max = 32767 },
+	.csdiv = { .min = 1, .max = 1 },
+	.fvco = { .min = 1050 * MEGA, .max = 2100 * MEGA }
 };
 
 static inline struct rzg2l_mipi_dsi *
@@ -186,6 +208,249 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	},
 };
 
+struct rzv2h_mipi_dsi_timings {
+	unsigned long hsfreq;
+	u16 value;
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKPRPRCTL[] = {
+	{150000000UL, 0},
+	{260000000UL, 1},
+	{370000000UL, 2},
+	{470000000UL, 3},
+	{580000000UL, 4},
+	{690000000UL, 5},
+	{790000000UL, 6},
+	{900000000UL, 7},
+	{1010000000UL, 8},
+	{1110000000UL, 9},
+	{1220000000UL, 10},
+	{1330000000UL, 11},
+	{1430000000UL, 12},
+	{1500000000UL, 13},
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKZEROCTL[] = {
+	{90000000UL, 2},
+	{110000000UL, 3},
+	{130000000UL, 4},
+	{150000000UL, 5},
+	{180000000UL, 6},
+	{210000000UL, 7},
+	{230000000UL, 8},
+	{240000000UL, 9},
+	{250000000UL, 10},
+	{270000000UL, 11},
+	{290000000UL, 12},
+	{310000000UL, 13},
+	{340000000UL, 14},
+	{360000000UL, 15},
+	{380000000UL, 16},
+	{410000000UL, 17},
+	{430000000UL, 18},
+	{450000000UL, 19},
+	{470000000UL, 20},
+	{500000000UL, 21},
+	{520000000UL, 22},
+	{540000000UL, 23},
+	{570000000UL, 24},
+	{590000000UL, 25},
+	{610000000UL, 26},
+	{630000000UL, 27},
+	{660000000UL, 28},
+	{680000000UL, 29},
+	{700000000UL, 30},
+	{730000000UL, 31},
+	{750000000UL, 32},
+	{770000000UL, 33},
+	{790000000UL, 34},
+	{820000000UL, 35},
+	{840000000UL, 36},
+	{860000000UL, 37},
+	{890000000UL, 38},
+	{910000000UL, 39},
+	{930000000UL, 40},
+	{950000000UL, 41},
+	{980000000UL, 42},
+	{1000000000UL, 43},
+	{1020000000UL, 44},
+	{1050000000UL, 45},
+	{1070000000UL, 46},
+	{1090000000UL, 47},
+	{1110000000UL, 48},
+	{1140000000UL, 49},
+	{1160000000UL, 50},
+	{1180000000UL, 51},
+	{1210000000UL, 52},
+	{1230000000UL, 53},
+	{1250000000UL, 54},
+	{1270000000UL, 55},
+	{1300000000UL, 56},
+	{1320000000UL, 57},
+	{1340000000UL, 58},
+	{1370000000UL, 59},
+	{1390000000UL, 60},
+	{1410000000UL, 61},
+	{1430000000UL, 62},
+	{1460000000UL, 63},
+	{1480000000UL, 64},
+	{1500000000UL, 65},
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKPOSTCTL[] = {
+	{80000000UL, 6},
+	{210000000UL, 7},
+	{340000000UL, 8},
+	{480000000UL, 9},
+	{610000000UL, 10},
+	{740000000UL, 11},
+	{880000000UL, 12},
+	{1010000000UL, 13},
+	{1140000000UL, 14},
+	{1280000000UL, 15},
+	{1410000000UL, 16},
+	{1500000000UL, 17},
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKTRAILCTL[] = {
+	{140000000UL, 1},
+	{250000000UL, 2},
+	{370000000UL, 3},
+	{480000000UL, 4},
+	{590000000UL, 5},
+	{710000000UL, 6},
+	{820000000UL, 7},
+	{940000000UL, 8},
+	{1050000000UL, 9},
+	{1170000000UL, 10},
+	{1280000000UL, 11},
+	{1390000000UL, 12},
+	{1500000000UL, 13},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSPRPRCTL[] = {
+	{110000000UL, 0},
+	{190000000UL, 1},
+	{290000000UL, 2},
+	{400000000UL, 3},
+	{500000000UL, 4},
+	{610000000UL, 5},
+	{720000000UL, 6},
+	{820000000UL, 7},
+	{930000000UL, 8},
+	{1030000000UL, 9},
+	{1140000000UL, 10},
+	{1250000000UL, 11},
+	{1350000000UL, 12},
+	{1460000000UL, 13},
+	{1500000000UL, 14},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSZEROCTL[] = {
+	{180000000UL, 0},
+	{240000000UL, 1},
+	{290000000UL, 2},
+	{350000000UL, 3},
+	{400000000UL, 4},
+	{460000000UL, 5},
+	{510000000UL, 6},
+	{570000000UL, 7},
+	{620000000UL, 8},
+	{680000000UL, 9},
+	{730000000UL, 10},
+	{790000000UL, 11},
+	{840000000UL, 12},
+	{900000000UL, 13},
+	{950000000UL, 14},
+	{1010000000UL, 15},
+	{1060000000UL, 16},
+	{1120000000UL, 17},
+	{1170000000UL, 18},
+	{1230000000UL, 19},
+	{1280000000UL, 20},
+	{1340000000UL, 21},
+	{1390000000UL, 22},
+	{1450000000UL, 23},
+	{1500000000UL, 24},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSTRAILCTL[] = {
+	{100000000UL, 3},
+	{210000000UL, 4},
+	{320000000UL, 5},
+	{420000000UL, 6},
+	{530000000UL, 7},
+	{640000000UL, 8},
+	{750000000UL, 9},
+	{850000000UL, 10},
+	{960000000UL, 11},
+	{1070000000UL, 12},
+	{1180000000UL, 13},
+	{1280000000UL, 14},
+	{1390000000UL, 15},
+	{1500000000UL, 16},
+};
+
+static const struct rzv2h_mipi_dsi_timings TLPXCTL[] = {
+	{130000000UL, 0},
+	{260000000UL, 1},
+	{390000000UL, 2},
+	{530000000UL, 3},
+	{660000000UL, 4},
+	{790000000UL, 5},
+	{930000000UL, 6},
+	{1060000000UL, 7},
+	{1190000000UL, 8},
+	{1330000000UL, 9},
+	{1460000000UL, 10},
+	{1500000000UL, 11},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSEXITCTL[] = {
+	{150000000UL, 1},
+	{230000000UL, 2},
+	{310000000UL, 3},
+	{390000000UL, 4},
+	{470000000UL, 5},
+	{550000000UL, 6},
+	{630000000UL, 7},
+	{710000000UL, 8},
+	{790000000UL, 9},
+	{870000000UL, 10},
+	{950000000UL, 11},
+	{1030000000UL, 12},
+	{1110000000UL, 13},
+	{1190000000UL, 14},
+	{1270000000UL, 15},
+	{1350000000UL, 16},
+	{1430000000UL, 17},
+	{1500000000UL, 18},
+};
+
+static const struct rzv2h_mipi_dsi_timings ULPSEXIT[] = {
+	{1953125UL, 49},
+	{3906250UL, 98},
+	{7812500UL, 195},
+	{15625000UL, 391},
+};
+
+static int rzv2h_dphy_find_timings_val(unsigned long freq,
+				       const struct rzv2h_mipi_dsi_timings timings[],
+				       unsigned int size)
+{
+	unsigned int i;
+
+	for (i = 0; i < size; i++) {
+		if (freq <= timings[i].hsfreq)
+			break;
+	}
+
+	if (i == size)
+		i -= 1;
+
+	return timings[i].value;
+};
+
 static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
 	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
@@ -307,6 +572,168 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
+static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long long hsfreq_mhz, mode_freq_hz, mode_freq_mhz;
+	struct rzv2h_plldsi_parameters cpg_dsi_parameters;
+	unsigned int bpp, i;
+
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+
+	for (i = 0; i < 10; i += 1) {
+		unsigned long hsfreq;
+		bool parameters_found;
+
+		mode_freq_hz = mode_freq * KILO + i;
+		mode_freq_mhz = mode_freq_hz * KILO * 1ULL;
+		parameters_found = rzv2h_dsi_get_pll_parameters_values(dsi->info->cpg_dsi_limits,
+								       &cpg_dsi_parameters,
+								       mode_freq_mhz);
+		if (!parameters_found)
+			continue;
+
+		hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_mhz * bpp, dsi->lanes);
+		parameters_found = rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
+								       dsi_parameters,
+								       hsfreq_mhz);
+		if (!parameters_found)
+			continue;
+
+		if (abs(dsi_parameters->error_mhz) >= 500)
+			continue;
+
+		hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
+		if (hsfreq >= RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
+		    hsfreq <= RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
+			dsi->mode_calc.mode_freq_hz = mode_freq_hz;
+			dsi->mode_calc.mode_freq = mode_freq;
+			return MODE_OK;
+		}
+	}
+
+	return MODE_CLOCK_RANGE;
+}
+
+static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				unsigned long long *hsfreq_mhz)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long status;
+
+	if (dsi->mode_calc.mode_freq != mode_freq) {
+		status = rzv2h_dphy_mode_clk_check(dsi, mode_freq);
+		if (status != MODE_OK) {
+			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
+				mode_freq);
+			return -EINVAL;
+		}
+	}
+
+	clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
+	*hsfreq_mhz = dsi_parameters->freq_mhz;
+
+	return 0;
+}
+
+static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
+				    unsigned long long hsfreq_mhz)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long lpclk_rate = clk_get_rate(dsi->lpclk);
+	u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
+	struct rzg2l_mipi_dsi_timings dphy_timings;
+	unsigned long long hsfreq;
+	u32 ulpsexit;
+
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
+
+	if (dsi_parameters->freq_mhz == hsfreq_mhz)
+		goto parameters_found;
+
+	if (rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
+						dsi_parameters, hsfreq_mhz))
+		goto parameters_found;
+
+	dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", hsfreq);
+	return -EINVAL;
+
+parameters_found:
+	dphy_timings.tclk_trail =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL,
+					    ARRAY_SIZE(TCLKTRAILCTL));
+	dphy_timings.tclk_post =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL,
+					    ARRAY_SIZE(TCLKPOSTCTL));
+	dphy_timings.tclk_zero =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL,
+					    ARRAY_SIZE(TCLKZEROCTL));
+	dphy_timings.tclk_prepare =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL,
+					    ARRAY_SIZE(TCLKPRPRCTL));
+	dphy_timings.ths_exit =
+		rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL,
+					    ARRAY_SIZE(THSEXITCTL));
+	dphy_timings.ths_trail =
+		rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL,
+					    ARRAY_SIZE(THSTRAILCTL));
+	dphy_timings.ths_zero =
+		rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL,
+					    ARRAY_SIZE(THSZEROCTL));
+	dphy_timings.ths_prepare =
+		rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL,
+					    ARRAY_SIZE(THSPRPRCTL));
+	dphy_timings.tlpx =
+		rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL,
+					    ARRAY_SIZE(TLPXCTL));
+	ulpsexit =
+		rzv2h_dphy_find_timings_val(lpclk_rate, ULPSEXIT,
+					    ARRAY_SIZE(ULPSEXIT));
+
+	phytclksetr = PHYTCLKSETR_TCLKTRAILCTL(dphy_timings.tclk_trail) |
+		      PHYTCLKSETR_TCLKPOSTCTL(dphy_timings.tclk_post) |
+		      PHYTCLKSETR_TCLKZEROCTL(dphy_timings.tclk_zero) |
+		      PHYTCLKSETR_TCLKPRPRCTL(dphy_timings.tclk_prepare);
+	phythssetr = PHYTHSSETR_THSEXITCTL(dphy_timings.ths_exit) |
+		     PHYTHSSETR_THSTRAILCTL(dphy_timings.ths_trail) |
+		     PHYTHSSETR_THSZEROCTL(dphy_timings.ths_zero) |
+		     PHYTHSSETR_THSPRPRCTL(dphy_timings.ths_prepare);
+	phytlpxsetr = rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~GENMASK(7, 0);
+	phytlpxsetr |= PHYTLPXSETR_TLPXCTL(dphy_timings.tlpx);
+	phycr = rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
+	phycr |= PHYCR_ULPSEXIT(ulpsexit);
+
+	/* Setting all D-PHY Timings Registers */
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
+				 PLLCLKSET0R_PLL_S(dsi_parameters->s) |
+				 PLLCLKSET0R_PLL_P(dsi_parameters->p) |
+				 PLLCLKSET0R_PLL_M(dsi_parameters->m));
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R, PLLCLKSET1R_PLL_K(dsi_parameters->k));
+	udelay(20);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
+	udelay(500);
+
+	return 0;
+}
+
+static void rzv2h_mipi_dsi_dphy_late_init(struct rzg2l_mipi_dsi *dsi)
+{
+	udelay(220);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN);
+}
+
+static void rzv2h_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
+{
+	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, 0);
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
@@ -409,6 +836,9 @@ static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
 	case 18:
 		vich1ppsetr = VICH1PPSETR_DT_RGB18;
 		break;
+	case 16:
+		vich1ppsetr = VICH1PPSETR_DT_RGB16;
+		break;
 	}
 
 	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
@@ -439,6 +869,9 @@ static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
 	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
 	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	/*
 	 * Configuration for Delay Value
 	 * Delay value based on 2 ranges of video clock.
@@ -868,6 +1301,22 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+
+static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_late_init = rzv2h_mipi_dsi_dphy_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_dsi_limits = &rzv2h_cpg_pll_dsi_limits,
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.max_dclk = 187500,
+	.min_dclk = 5440,
+	.features = RZ_MIPI_DSI_16BPP,
+};
+
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
@@ -879,6 +1328,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 16efe4dc59f4..81ce0c37aacb 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -40,6 +40,45 @@
 #define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
 #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
 
+/* RZ/V2H DPHY Registers */
+#define PLLENR				0x000
+#define PLLENR_PLLEN			BIT(0)
+
+#define PHYRSTR				0x004
+#define PHYRSTR_PHYMRSTN		BIT(0)
+
+#define PLLCLKSET0R			0x010
+#define PLLCLKSET0R_PLL_S(x)		((x) << 0)
+#define PLLCLKSET0R_PLL_P(x)		((x) << 8)
+#define PLLCLKSET0R_PLL_M(x)		((x) << 16)
+
+#define PLLCLKSET1R			0x014
+#define PLLCLKSET1R_PLL_K(x)		((x) << 0)
+
+#define PHYTCLKSETR			0x020
+#define PHYTCLKSETR_TCLKTRAILCTL(x)	((x) << 0)
+#define PHYTCLKSETR_TCLKPOSTCTL(x)	((x) << 8)
+#define PHYTCLKSETR_TCLKZEROCTL(x)	((x) << 16)
+#define PHYTCLKSETR_TCLKPRPRCTL(x)	((x) << 24)
+
+#define PHYTHSSETR			0x024
+#define PHYTHSSETR_THSEXITCTL(x)	((x) << 0)
+#define PHYTHSSETR_THSTRAILCTL(x)	((x) << 8)
+#define PHYTHSSETR_THSZEROCTL(x)	((x) << 16)
+#define PHYTHSSETR_THSPRPRCTL(x)	((x) << 24)
+
+#define PHYTLPXSETR			0x028
+#define PHYTLPXSETR_TLPXCTL(x)		((x) << 0)
+
+#define PHYCR				0x030
+#define PHYCR_ULPSEXIT(x)		((x) << 0)
+
+#define PHYC1R				0x034
+
+#define PHYC2R				0x038
+
+#define PHYC3R				0x03c
+
 /* --------------------------------------------------------*/
 
 /* Link Status Register */
@@ -116,6 +155,7 @@
 
 /* Video-Input Channel 1 Pixel Packet Set Register */
 #define VICH1PPSETR			0x420
+#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
 #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
 #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
 #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
-- 
2.49.0


