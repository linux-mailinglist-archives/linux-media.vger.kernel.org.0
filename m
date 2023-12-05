Return-Path: <linux-media+bounces-1649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45C804D33
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 10:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7AD1F21305
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0283DB89;
	Tue,  5 Dec 2023 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qameFIdc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0F3FA
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701767171; x=1733303171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=es27AnqpANSAaMAQn7TOHj7z8NYyeaLtmEP2QmW8qi8=;
  b=qameFIdcsM8RhOFFuCta00Ezq8IsEYM0oMokp6skyhL43jdqVatOI+5P
   F/Lp6KC0LNbtGlrN0eM1hJTgzDRF78sLzs5ud+jYrYKj6VTwHZ21k2cW5
   GyzXkKo6t+qp8ALzFJghn70K4wCNb5GnkxGAN+IByZJYT6ULSj5zQYesx
   w6ILunA9SpkJ+wjiZ9W/2v0YOofjk7w1kTgnId8gmhw5SpgOKqcJsWL9P
   3hcJZr5telXffO4iO9O5hoSUfIx3eLbvAn830Z543zq4HAlkfUMAouu0D
   UH/W+W5EV7/BdjvZNMxQhTqHDyVp99bPUL3fW7MJqOX+zRxsF/SbxcDR5
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,251,1695679200"; 
   d="scan'208";a="34328804"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Dec 2023 10:06:01 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A68BF280075;
	Tue,  5 Dec 2023 10:06:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: i2c: imx415: Add more supported modes
Date: Tue,  5 Dec 2023 10:05:57 +0100
Message-Id: <20231205090557.298680-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These modes are listed in section "All-pixel mode" of the datasheet
IMX415-AAQR-C (Rev. E19504, 2019/05/21).
hmax_pix and pixel_rate are taken from the comment above the mode list.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx415.c | 362 +++++++++++++++++++++++++++++++++++++
 1 file changed, 362 insertions(+)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index a222b9134aa2..48b8ae6d790d 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -445,6 +445,38 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 	},
 };
 
+/* all-pixel 2-lane 594 Mbps 10 Hz mode */
+static const struct cci_reg_sequence imx415_mode_2_594[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0CE4 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
+	{ IMX415_TCLKPOST, 0x0067 },
+	{ IMX415_TCLKPREPARE, 0x0027 },
+	{ IMX415_TCLKTRAIL, 0x0027 },
+	{ IMX415_TCLKZERO, 0x00B7 },
+	{ IMX415_THSPREPARE, 0x002F },
+	{ IMX415_THSZERO, 0x004F },
+	{ IMX415_THSTRAIL, 0x002F },
+	{ IMX415_THSEXIT, 0x0047 },
+	{ IMX415_TLPX, 0x0027 },
+};
+
+/* all-pixel 2-lane 891 Mbps 15 Hz mode */
+static const struct cci_reg_sequence imx415_mode_2_891[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0898 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
+	{ IMX415_TCLKPOST, 0x007F },
+	{ IMX415_TCLKPREPARE, 0x0037 },
+	{ IMX415_TCLKTRAIL, 0x0037 },
+	{ IMX415_TCLKZERO, 0x00F7 },
+	{ IMX415_THSPREPARE, 0x003F },
+	{ IMX415_THSZERO, 0x006F },
+	{ IMX415_THSTRAIL, 0x003F },
+	{ IMX415_THSEXIT, 0x005F },
+	{ IMX415_TLPX, 0x002F },
+};
+
 /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
 static const struct cci_reg_sequence imx415_mode_2_720[] = {
 	{ IMX415_VMAX, 0x08CA },
@@ -461,6 +493,38 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
 	{ IMX415_TLPX, 0x0027 },
 };
 
+/* all-pixel 2-lane 1782 Mbps 30 Hz mode */
+static const struct cci_reg_sequence imx415_mode_2_1782[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x044C },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
+	{ IMX415_TCLKPOST, 0x00B7 },
+	{ IMX415_TCLKPREPARE, 0x0067 },
+	{ IMX415_TCLKTRAIL, 0x006F },
+	{ IMX415_TCLKZERO, 0x01DF },
+	{ IMX415_THSPREPARE, 0x006F },
+	{ IMX415_THSZERO, 0x00CF },
+	{ IMX415_THSTRAIL, 0x006F },
+	{ IMX415_THSEXIT, 0x00B7 },
+	{ IMX415_TLPX, 0x005F },
+};
+
+/* all-pixel 2-lane 2079 Mbps 30 Hz mode */
+static const struct cci_reg_sequence imx415_mode_2_2079[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x044C },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
+	{ IMX415_TCLKPOST, 0x00D7 },
+	{ IMX415_TCLKPREPARE, 0x007F },
+	{ IMX415_TCLKTRAIL, 0x007F },
+	{ IMX415_TCLKZERO, 0x0237 },
+	{ IMX415_THSPREPARE, 0x0087 },
+	{ IMX415_THSZERO, 0x00EF },
+	{ IMX415_THSTRAIL, 0x0087 },
+	{ IMX415_THSEXIT, 0x00DF },
+	{ IMX415_TLPX, 0x006F },
+};
+
 /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
 static const struct cci_reg_sequence imx415_mode_2_1440[] = {
 	{ IMX415_VMAX, 0x08CA },
@@ -477,6 +541,70 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
 	{ IMX415_TLPX, 0x004F },
 };
 
+/* all-pixel 4-lane 594 Mbps 20 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_594_20fps[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0672 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x0067 },
+	{ IMX415_TCLKPREPARE, 0x0027 },
+	{ IMX415_TCLKTRAIL, 0x0027 },
+	{ IMX415_TCLKZERO, 0x00B7 },
+	{ IMX415_THSPREPARE, 0x002F },
+	{ IMX415_THSZERO, 0x004F },
+	{ IMX415_THSTRAIL, 0x002F },
+	{ IMX415_THSEXIT, 0x0047 },
+	{ IMX415_TLPX, 0x0027 },
+};
+
+/* all-pixel 4-lane 594 Mbps 25 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_594_25fps[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0528 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x0067 },
+	{ IMX415_TCLKPREPARE, 0x0027 },
+	{ IMX415_TCLKTRAIL, 0x0027 },
+	{ IMX415_TCLKZERO, 0x00B7 },
+	{ IMX415_THSPREPARE, 0x002F },
+	{ IMX415_THSZERO, 0x004F },
+	{ IMX415_THSTRAIL, 0x002F },
+	{ IMX415_THSEXIT, 0x0047 },
+	{ IMX415_TLPX, 0x0027 },
+};
+
+/* all-pixel 4-lane 720 Mbps 25 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_720_25fps[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0500 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x006F },
+	{ IMX415_TCLKPREPARE, 0x002F },
+	{ IMX415_TCLKTRAIL, 0x002F },
+	{ IMX415_TCLKZERO, 0x00BF },
+	{ IMX415_THSPREPARE, 0x002F },
+	{ IMX415_THSZERO, 0x0057 },
+	{ IMX415_THSTRAIL, 0x002F },
+	{ IMX415_THSEXIT, 0x004F },
+	{ IMX415_TLPX, 0x0027 },
+};
+
+/* all-pixel 4-lane 720 Mbps 30.01 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_720_30fps[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x042A },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x006F },
+	{ IMX415_TCLKPREPARE, 0x002F },
+	{ IMX415_TCLKTRAIL, 0x002F },
+	{ IMX415_TCLKZERO, 0x00BF },
+	{ IMX415_THSPREPARE, 0x002F },
+	{ IMX415_THSZERO, 0x0057 },
+	{ IMX415_THSTRAIL, 0x002F },
+	{ IMX415_THSEXIT, 0x004F },
+	{ IMX415_TLPX, 0x0027 },
+};
+
 /* all-pixel 4-lane 891 Mbps 30 Hz mode */
 static const struct cci_reg_sequence imx415_mode_4_891[] = {
 	{ IMX415_VMAX, 0x08CA },
@@ -493,6 +621,102 @@ static const struct cci_reg_sequence imx415_mode_4_891[] = {
 	{ IMX415_TLPX, 0x002F },
 };
 
+/* all-pixel 4-lane 1440 Mbps 30.01 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_1440_30fps[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x042A },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x009F },
+	{ IMX415_TCLKPREPARE, 0x0057 },
+	{ IMX415_TCLKTRAIL, 0x0057 },
+	{ IMX415_TCLKZERO, 0x0187 },
+	{ IMX415_THSPREPARE, 0x005F },
+	{ IMX415_THSZERO, 0x00A7 },
+	{ IMX415_THSTRAIL, 0x005F },
+	{ IMX415_THSEXIT, 0x0097 },
+	{ IMX415_TLPX, 0x004F },
+};
+
+/* all-pixel 4-lane 1440 Mbps 60.03 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_1440_60fps[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0215 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x009F },
+	{ IMX415_TCLKPREPARE, 0x0057 },
+	{ IMX415_TCLKTRAIL, 0x0057 },
+	{ IMX415_TCLKZERO, 0x0187 },
+	{ IMX415_THSPREPARE, 0x005F },
+	{ IMX415_THSZERO, 0x00A7 },
+	{ IMX415_THSTRAIL, 0x005F },
+	{ IMX415_THSEXIT, 0x0097 },
+	{ IMX415_TLPX, 0x004F },
+};
+
+/* all-pixel 4-lane 1485 Mbps 60 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_1485[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0226 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x00A7 },
+	{ IMX415_TCLKPREPARE, 0x0057 },
+	{ IMX415_TCLKTRAIL, 0x005F },
+	{ IMX415_TCLKZERO, 0x0197 },
+	{ IMX415_THSPREPARE, 0x005F },
+	{ IMX415_THSZERO, 0x00AF },
+	{ IMX415_THSTRAIL, 0x005F },
+	{ IMX415_THSEXIT, 0x009F },
+	{ IMX415_TLPX, 0x004F },
+};
+
+/* all-pixel 4-lane 1782 Mbps 60 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_1782[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0226 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x00B7 },
+	{ IMX415_TCLKPREPARE, 0x0067 },
+	{ IMX415_TCLKTRAIL, 0x006F },
+	{ IMX415_TCLKZERO, 0x01DF },
+	{ IMX415_THSPREPARE, 0x006F },
+	{ IMX415_THSZERO, 0x00CF },
+	{ IMX415_THSTRAIL, 0x006F },
+	{ IMX415_THSEXIT, 0x00B7 },
+	{ IMX415_TLPX, 0x005F },
+};
+
+/* all-pixel 4-lane 2079 Mbps 60 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_2079[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x0226 },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x00D7 },
+	{ IMX415_TCLKPREPARE, 0x007F },
+	{ IMX415_TCLKTRAIL, 0x007F },
+	{ IMX415_TCLKZERO, 0x0237 },
+	{ IMX415_THSPREPARE, 0x0087 },
+	{ IMX415_THSZERO, 0x00EF },
+	{ IMX415_THSTRAIL, 0x0087 },
+	{ IMX415_THSEXIT, 0x00DF },
+	{ IMX415_TLPX, 0x006F },
+};
+
+/* all-pixel 4-lane 2376 Mbps 60 Hz mode */
+static const struct cci_reg_sequence imx415_mode_4_2376[] = {
+	{ IMX415_VMAX, 0x08CA },
+	{ IMX415_HMAX, 0x016E },
+	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+	{ IMX415_TCLKPOST, 0x00E7 },
+	{ IMX415_TCLKPREPARE, 0x008F },
+	{ IMX415_TCLKTRAIL, 0x008F },
+	{ IMX415_TCLKZERO, 0x027F },
+	{ IMX415_THSPREPARE, 0x0097 },
+	{ IMX415_THSZERO, 0x010F },
+	{ IMX415_THSTRAIL, 0x0097 },
+	{ IMX415_THSEXIT, 0x00F7 },
+	{ IMX415_TLPX, 0x007F },
+};
+
 struct imx415_mode_reg_list {
 	u32 num_of_regs;
 	const struct cci_reg_sequence *regs;
@@ -536,6 +760,26 @@ struct imx415_mode {
 
 /* mode configs */
 static const struct imx415_mode supported_modes[] = {
+	{
+		.lane_rate = 594000000,
+		.lanes = 2,
+		.hmax_pix = 4400,
+		.pixel_rate = 99000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_2_594),
+			.regs = imx415_mode_2_594,
+		},
+	},
+	{
+		.lane_rate = 891000000,
+		.lanes = 2,
+		.hmax_pix = 4400,
+		.pixel_rate = 148500000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_2_891),
+			.regs = imx415_mode_2_891,
+		},
+	},
 	{
 		.lane_rate = 720000000,
 		.lanes = 2,
@@ -547,6 +791,24 @@ static const struct imx415_mode supported_modes[] = {
 		},
 	},
 	{
+		.lane_rate = 1782000000,
+		.lanes = 2,
+		.hmax_pix = 4400,
+		.pixel_rate = 297000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_2_1782),
+			.regs = imx415_mode_2_1782,
+		},
+	},	{
+		.lane_rate = 2079000000,
+		.lanes = 2,
+		.hmax_pix = 4400,
+		.pixel_rate = 304615385,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_2_2079),
+			.regs = imx415_mode_2_2079,
+		},
+	},	{
 		.lane_rate = 1440000000,
 		.lanes = 2,
 		.hmax_pix = 4510,
@@ -556,6 +818,46 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_mode_2_1440,
 		},
 	},
+	{
+		.lane_rate = 594000000,
+		.lanes = 4,
+		.hmax_pix = 5500,
+		.pixel_rate = 247500000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_594_20fps),
+			.regs = imx415_mode_4_594_20fps,
+		},
+	},
+	{
+		.lane_rate = 594000000,
+		.lanes = 4,
+		.hmax_pix = 4400,
+		.pixel_rate = 247500000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_594_25fps),
+			.regs = imx415_mode_4_594_25fps,
+		},
+	},
+	{
+		.lane_rate = 720000000,
+		.lanes = 4,
+		.hmax_pix = 4400,
+		.pixel_rate = 247500000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_720_25fps),
+			.regs = imx415_mode_4_720_25fps,
+		},
+	},
+	{
+		.lane_rate = 720000000,
+		.lanes = 4,
+		.hmax_pix = 4510,
+		.pixel_rate = 304615385,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_720_30fps),
+			.regs = imx415_mode_4_720_30fps,
+		},
+	},
 	{
 		.lane_rate = 891000000,
 		.lanes = 4,
@@ -566,6 +868,66 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_mode_4_891,
 		},
 	},
+	{
+		.lane_rate = 1440000000,
+		.lanes = 4,
+		.hmax_pix = 4510,
+		.pixel_rate = 304615385,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1440_30fps),
+			.regs = imx415_mode_4_1440_30fps,
+		},
+	},
+	{
+		.lane_rate = 1440000000,
+		.lanes = 4,
+		.hmax_pix = 4510,
+		.pixel_rate = 609230769,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1440_60fps),
+			.regs = imx415_mode_4_1440_60fps,
+		},
+	},
+	{
+		.lane_rate = 1485000000,
+		.lanes = 4,
+		.hmax_pix = 4400,
+		.pixel_rate = 594000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1485),
+			.regs = imx415_mode_4_1485,
+		},
+	},
+	{
+		.lane_rate = 1782000000,
+		.lanes = 4,
+		.hmax_pix = 4400,
+		.pixel_rate = 594000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1782),
+			.regs = imx415_mode_4_1782,
+		},
+	},
+	{
+		.lane_rate = 2079000000,
+		.lanes = 4,
+		.hmax_pix = 4400,
+		.pixel_rate = 594000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2079),
+			.regs = imx415_mode_4_2079,
+		},
+	},
+	{
+		.lane_rate = 12376000000,
+		.lanes = 4,
+		.hmax_pix = 4392,
+		.pixel_rate = 891000000,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2376),
+			.regs = imx415_mode_4_2376,
+		},
+	},
 };
 
 static const char *const imx415_test_pattern_menu[] = {
-- 
2.34.1


