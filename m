Return-Path: <linux-media+bounces-60123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOgBLq559GmLBgIAu9opvQ
	(envelope-from <linux-media+bounces-60123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 12:00:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C644AB78C
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 12:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 798453040208
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 09:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305D7385523;
	Fri,  1 May 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtnPpSPh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C65382F07
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629465; cv=none; b=WV5PcxQmhs1xYmMV0B/vHB29iIxFdnI+KrB/3m/7EARz6ack6dREEAhPbpURBl/yzr/QarK8DODjAFyKHmhbb16gRbM4ZvEHl0QWzPo2mFExDtb/wjs9ncEPAOOiHjm6TP2VzjoT1NUuwLUgTa5CP7QS+UXJVYLtu9cb80juHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629465; c=relaxed/simple;
	bh=GYYm1WbFUMOA2zJHVwqVtBVm18ANWirY2AKzv459iyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFT92zhqwbNribBTcy0kWoBPlzj4BqhHeK5JS/84/I9kYMK4ClKNdmVHyw9Nj8JaVE2E7+RRIoOme1awbcdtYltAgUnhu0Rhvh4Vzty3IRR4+hpn+THDARS/oCwJELDlTn198o9LNGFpsDeNS6tMaMLuJxaO5x3VcotO/CojuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtnPpSPh; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c79662bbd2eso1062869a12.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629461; x=1778234261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3ob51ZJDmb5EvjSVaP9m9WkKZYm4JcxG03UmWgTm9Q=;
        b=EtnPpSPhE8G9g6U8Y33SUpT/DZqWaRm1NsA0L4tnrxNP7A8wrWChvZjEhMYjN5KQj8
         80yNsL4+e1IEQIJwvYfapMo534srf+L//p3FH+aE1DC3Ntqn7Qbdnk5i24RY/kd4Ziua
         dHdzY1muohg1jLChHKGmeASUpCQ8uQ2efJGEdY/UyFQpyxCaEH34ZyL5IcQQLVCZy9K1
         OsmUr557XHvn0fwUIVP3RdEa9gE2CBu6E+SoYrsGeKiaOa5uT2zMiAp0ZT6krYnqMPgB
         2nM4JTolASVcSPamshlyogE/CBfe5q6muY+9ua0YFcGxAjCbytw9hdjr8945JhaJWBAv
         JBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629461; x=1778234261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3ob51ZJDmb5EvjSVaP9m9WkKZYm4JcxG03UmWgTm9Q=;
        b=tJ/B+qY80f2ynZ2FEntOXSyh/tfDMtRzFKq3l3f8wJBWIgP3UrbxAcbnmGc2ClkcSY
         jOZcRs0QA+pAtpfXKKrkMuxGdmqw9Gf9WhBZa2/V/6d1HKPjj3JtNd09Jd4PtJbOj3IM
         0FLyjzqKdZkAj/1Sy1hNkOG7gYRcxwgTtsM03vCeuk5nuTlLL0SjUO3oYceRb/o+YrPi
         uEp/CVbiQ9q8hGzzk897WhXteGA4W77kptnbh43zWcum02paL+E5B1dBh9eS5/vug/Rb
         nwLh0683BbgAgI6jX28j8NGgFocgEh9RrBUbVzMTyJdteT181PA1kZDRJhthFiu1WIp6
         ETQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MInWTxPSzJphItZvGIT++Kpmo8YZXp7r54AWmARUW4R8N15r0UOzMBWNQf2Ik1giFEYE990tolJIVeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1OG+Jm1ccopyxmT6PLm+mX7U9zymZ/Qz/cL554IV2zQfn0I1
	wSvdMWp1TwV7CidH2OoylTD+mcbtpht5DjcP0QRckhhjPEDRkUOd/RkE
X-Gm-Gg: AeBDies4btQEOAQpQ04uwGi9NKOJzoI5fZTac3coJTM6pgyh0IAPj9+5lFgqucZdi0t
	HzeKxfTEKfj77mCE5ZeOTHDVp+YtbyEM1idaIF5I60WeoM4/ku8aO6I1dzFpOfWF0XZ7l6lHCJM
	Gs5mzgyej2/JRltMTHfSjTqO3M6UOHz8xEl3nZj7IM1Emkczd3hY8Gh7aHbROOhJGnzZKoMkzWh
	JrIKE0I2oW8zZPkKnaovDsKqeM3RbbFpmJkRQJOJZ6Dx9ffRkB2qFQ+U3Eyt0ytSetEKgrrygJn
	uLXUbfwG+CH33Qjft6QK8uo2/HTp4QW/hVy1zC3I0YxbkKTgHbYSbBhSlYs8wLIzflYuJ7nqxvp
	tjuYSTj9rvnRbeaPxK14aSVs+DnxRpo2BSYxFn3NtsPFblhINAVa35lJxvpPmLlXMfg2sNlsm7W
	p2GOI0HqeSIMWHAw==
X-Received: by 2002:a05:6a20:5493:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3a3cf5f759dmr7089603637.15.1777629460890;
        Fri, 01 May 2026 02:57:40 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:40 -0700 (PDT)
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
Subject: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
Date: Fri,  1 May 2026 17:54:32 +0800
Message-ID: <20260501095433.1609309-4-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 44C644AB78C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60123-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
mode for years. This patch adds 6MP and 8MP modes to maximize sensor
utilization.

Note that these modes require 4-lane MIPI CSI-2, as the downstream
driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
operation on the target device. The register sequences are extracted
from the downstream Windows driver.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
No changes in v2
---
 drivers/media/i2c/hi846.c | 152 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 151 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 3a0b1e124d9d..c786a54fc6f9 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1027,6 +1027,106 @@ static const struct hi846_reg mode_1632x1224_mipi_4lane[] = {
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
@@ -1127,7 +1227,57 @@ static const struct hi846_mode supported_modes[] = {
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
 
 struct hi846_datafmt {
-- 
2.54.0


