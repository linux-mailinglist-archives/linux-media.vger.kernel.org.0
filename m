Return-Path: <linux-media+bounces-61086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN5nEtezAWppigEAu9opvQ
	(envelope-from <linux-media+bounces-61086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:47:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4650C2C5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B465B3026CA3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8513D9DBF;
	Mon, 11 May 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxOCTtMf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34603D812D
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496215; cv=none; b=pgxS6DoL5Or4n634ceoJQEg6RMby6ABNULuMiJHRMKMs3rvnYX8k737ukpPg4KIimv+8eAwVHYT+2vnbQuOPegWHOpdMeejCz+/JPcOafRoH2OxFoFIV6mGKRvfD9jH7fy5YktH1zJHkvC00GQN3pG/GmnlD5Q4cSRgAQ5QWaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496215; c=relaxed/simple;
	bh=c5lr+YwyxmPJh4k5BNE+uOrKJBYoOBD+XzseEfCJKKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMSALIYSWj40K9PLXHNYOzEAiHRePC+YngjiX2VEhCD/jhF9d2AKk/F8ovos2xxjfVRVwYrwSmi5abi4x2KLuE/ViPOIsrAHnpsrbLS8Kx+zGNiQG4K/rUljKNwA9MxzPnD1D9nZYtD5jjpZHV7dlV65fD0p5qPLZCYrrg7Oo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxOCTtMf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-367d88b9940so1073148a91.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496213; x=1779101013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqfIJWhfpQINNVwmdgP9tbjnCKPgaaqu67uO9dQrqdM=;
        b=QxOCTtMfkUBa8Oedr48XzqaFUpy5dX9xUjUsIYSSVx/V5jBReB0EmRxdx2QoYTBREQ
         M8Cl2D5wgJPIq5X9+0D62jp1pWKGh8qc6I/tv3DyfgF+Cqy1y8w2ohDYVcv89MyrFNHa
         hTT3oDuqnIL8uT3S7hZ3MwUAERhDz/LCj5F4ZD0MdTW/mXOLcKcEhzh5dt4ul/eoSnjx
         lURGd6jqgALH/9JB2fNpClAEo3IfQH2FFj8ByKaGAO8hSxXYl53DAjV5Bd2srSxynh/X
         gtg5WueJpAgwbtZfwg2iQJg0ddN2+tMTmYuOX4qu+0g/ZZxQVx6qEdm4f39A6EqmAmwj
         fobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496213; x=1779101013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DqfIJWhfpQINNVwmdgP9tbjnCKPgaaqu67uO9dQrqdM=;
        b=V05FWkS9VGmeM4xC03zneWXx25Z76KPWFZsZOc5zGtC2FHAfSfFtwmcJ6ag7MaUN8B
         XYGfxradBGoiDBPD18G0nAfRDT0W9LhlEibJUjbH1Q3tJq/fLyhOQzfHO0EIOxpC7bAL
         njKtuaFvxBowAGBouTcRZVBqIjAW/4DcCiRXDnzc7iU+e1T7amojPQoOyRiHfjHtlqCB
         AnVFrRUsHdyyAjc3v7PD7+0C4Peb7YIO1ae9Anzf7RRU3SKJHcwGgFslz+UEuCvQlpqi
         vSDeFOFTJIcC/Na0rNpgESzpG1GJTQafecTqn4MHh6QYHRoDn6gjiVLV/Fj0IYD+h0YI
         Izdw==
X-Forwarded-Encrypted: i=1; AFNElJ/fBkSuQzIbSeR+D8wl073eOS1/GxhdL0d8gPmyTwxzjdv/OXA0pJUOC00v4dbP6dhREG7aDlEzK7IUtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhlfExjMidLIOC1uBszqeJLH3ORv2sibSXEDnxHPxGS9kv0Wdl
	Aipl5+rp97D7wdIqo0B2mAlgtz0u2gPaDmD4J0o+BpkdhtMNLJc1H5lo2aAwIdvkqLQ=
X-Gm-Gg: Acq92OGbCMeuF54ymcLyZJ9cgLc0LuZwJxE64AccoQb9CA58DsVLHYiFPxyZxTZgykO
	hbAJsMWI/nUhDGI2sVrZUbSlJVBsMTm3TN1OHQFRQ8JJjQXPdwgxyBuqcVS7kXprh7Cw88iudAX
	GYduzVix5GXjmKiI2It7I0P/ZQptmcFxwqNbKnHmEN9MSMrHt7RYcCEtfmhs088MdWDFZM0UpFQ
	GQnGLkKWndwP3p3QhMK65KUTzh4wcS7n6WWzfLrcGpSEw48tPekuAe2j+7hsD2IeJDRYEqczez/
	Wx1ihmbEhI0Jc5FbuC800nOkeb/HkZ3pj/V7LIEAb1EJtyF5DcE4XImcIhLhe/tKRFodRpnMnb2
	TFs5zknO2vkoVSJHUUnk8DZ7YNUi44zYJo+bKZVX6U8utx7SO9vmlwlzEL1Rq7aBAIvR7K7YTUV
	WvtT3lYl+Husnnpf6cyZ2sixMaN1n+
X-Received: by 2002:a17:90b:1347:b0:366:10f2:8eae with SMTP id 98e67ed59e1d1-3664cd2492cmr13967723a91.23.1778496213228;
        Mon, 11 May 2026 03:43:33 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:32 -0700 (PDT)
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
Subject: [PATCH v4 4/5] media: hi846: Add 6MP and 8MP modes support
Date: Mon, 11 May 2026 18:39:26 +0800
Message-ID: <20260511103927.279550-5-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 02F4650C2C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61086-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
mode for years. This patch adds 6MP and 8MP modes to maximize sensor
utilization.

Note that these modes require 4-lane MIPI CSI-2, as the downstream
driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
operation on the target device. The register sequences are extracted
from the downstream Windows driver.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 154 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index c77b34a5e166..12df1dc96163 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1028,6 +1028,106 @@ static const struct hi846_reg mode_1632x1224_mipi_4lane[] = {
 	{HI846_REG_TG_ENABLE,			0x0100},
 };
 
+static const struct hi846_reg mode_3264x1836_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0172},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x089d},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x072c},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x023e},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+};
+
+static const struct hi846_reg mode_3264x1836_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
+static const struct hi846_reg mode_3264x2448_config[] = {
+	{HI846_REG_MODE_SELECT,			0x0000},
+	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
+	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
+	{HI846_REG_Y_ADDR_START_VACT_H,		0x0040},
+	{HI846_REG_Y_ADDR_END_VACT_H,		0x09cf},
+	{HI846_REG_UNKNOWN_005C,		0x2101},
+	{HI846_REG_FLL,				0x09de},
+	{HI846_REG_LLP,				0x0ed8},
+	{HI846_REG_BINNING_MODE,		0x0022},
+	{HI846_REG_HBIN_MODE,			0x0000},
+	{HI846_REG_UNKNOWN_0A24,		0x0000},
+	{HI846_REG_X_START_H,			0x0000},
+	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
+	{HI846_REG_Y_OUTPUT_SIZE_H,		0x0990},
+	{HI846_REG_EXPOSURE,			0x09d8},
+
+	/* For OTP */
+	{HI846_REG_UNKNOWN_021C,		0x0001},
+	{HI846_REG_UNKNOWN_021E,		0x0235},
+
+	{HI846_REG_ISP_EN_H,			0x014a},
+	{HI846_REG_UNKNOWN_0418,		0x0000},
+	{HI846_REG_UNKNOWN_0B02,		0xe04d},
+	{HI846_REG_UNKNOWN_0B10,		0x6821},
+	{HI846_REG_UNKNOWN_0B12,		0x0120},
+	{HI846_REG_UNKNOWN_0B14,		0x0001},
+	{HI846_REG_UNKNOWN_2008,		0x38fd},
+	{HI846_REG_UNKNOWN_326E,		0x0000},
+};
+
+static const struct hi846_reg mode_3264x2448_mipi_4lane[] = {
+	{HI846_REG_UNKNOWN_0900,		0x0300},
+	{HI846_REG_MIPI_TX_OP_MODE,		0xc319},
+	{HI846_REG_UNKNOWN_0914,		0xc109},
+	{HI846_REG_TCLK_PREPARE,		0x061a},
+	{HI846_REG_UNKNOWN_0918,		0x0407},
+	{HI846_REG_THS_ZERO,			0x0a0b},
+	{HI846_REG_TCLK_POST,			0x0e08},
+	{HI846_REG_UNKNOWN_091E,		0x0a00},
+	{HI846_REG_UNKNOWN_090C,		0x0427},
+	{HI846_REG_UNKNOWN_090E,		0x0059},
+	{HI846_REG_UNKNOWN_0954,		0x0089},
+	{HI846_REG_UNKNOWN_0956,		0x0000},
+	{HI846_REG_UNKNOWN_0958,		0xca80},
+	{HI846_REG_UNKNOWN_095A,		0x9240},
+	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},
+	{HI846_REG_TG_ENABLE,			0x0100},
+};
+
 static const char * const hi846_test_pattern_menu[] = {
 	"Disabled",
 	"Solid Colour",
@@ -1128,9 +1228,59 @@ static const struct hi846_mode supported_modes[] = {
 			.width = 1632 * 2,
 			.height = 1224 * 2,
 		},
-	}
+	},
+	{
+		.width = 3264,
+		.height = 1836,
+		.pll_cfg_4lane = 0x4124, /* HI846_REG_PLL_CFG_MIPI2_H */
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_config),
+			.regs = mode_3264x1836_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x1836_mipi_4lane),
+			.regs = mode_3264x1836_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x172,
+			.width = 3264,
+			.height = 1836,
+		},
+	},
+	{
+		.width = 3264,
+		.height = 2448,
+		.pll_cfg_4lane = 0x4124, /* HI846_REG_PLL_CFG_MIPI2_H */
+		.fps = 30,
+		.frame_len = 2526,
+		.llp = HI846_LINE_LENGTH,
+		.reg_list_config = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_config),
+			.regs = mode_3264x2448_config,
+		},
+		.reg_list_2lane = {
+			.num_of_regs = 0,
+		},
+		.reg_list_4lane = {
+			.num_of_regs = ARRAY_SIZE(mode_3264x2448_mipi_4lane),
+			.regs = mode_3264x2448_mipi_4lane,
+		},
+		.crop = {
+			.left = 0x46,
+			.top = 0x40,
+			.width = 3264,
+			.height = 2448,
+		},
+	},
 };
-#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_2LANE		(ARRAY_SIZE(supported_modes) - 2)
 #define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
-- 
2.54.0


