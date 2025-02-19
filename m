Return-Path: <linux-media+bounces-26341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D862A3BACF
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F09C0188C906
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88EA1DBB3A;
	Wed, 19 Feb 2025 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcrVvyON"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499701CAA9E
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958420; cv=none; b=MhtizHF+D0SCujgA/w6Ka/Ws0tvPdUhetniKaweZCjtOSW90cJUqL0jArjVu1FnloZEY4tvgsnQ27IqxgstveLafQT7tza8mxS3WyQ/BYC+R4nYayuM7l9hzzWrR0Dg5wbzhxyFlv1pdzXwp49tXBNOVvvrEYi7LeTuHL0OexxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958420; c=relaxed/simple;
	bh=HuoG0pD0aRPuyTiCCela6aZHU5vNELwP+TsQwNkpwNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WrlDIFJr7vUQYVH7MB+vvHfTGLSBYPX6VLEB9CprK0I1IIS4msY8r3vUImQqpsb1UapvIU0j2f3POVYwk7NO/l5nOgGsPWv5CRdKRAkk1RKXQVQQtmSl1MUQW9gSipEj7a7qaYlF1AKsAv+2iBGubI8x/UpWbb2s/Glp2VNziZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcrVvyON; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a2f240156so31824701fa.3
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 01:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958416; x=1740563216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2F8TpMMCQLreKrgJmh9vSe09BpdK/XNLqOfMNu8CL0=;
        b=OcrVvyONDhJ8GjsO18NM7mmDiYe2iyN7Tz1qAldOHTdYr0UWGwwUeW7c9DHFrBrqYo
         S4ys3B26h0YNjmlBZOivqLRLHhE/vNa/Bas8BRre8oQihkcKjphPUjRnGrW/deHdvWYQ
         R96t0hE7IIe3K76//V5CfWNEaalNUz5sPHv7n+QrT6lNVOz6YkI9ifkBYkyEK0prar7p
         NZe4l9He6P0V579d4ttgYfaPqhL9/FKJd2r7mFog9h60k+YNTrfVsC+xU0BqSQBayvhA
         SGIHk0YI+LvMYgPfufpJQopBQhfjGv75mCU53aocbVKLCpGXgtLxZTI5icJuceUBVQdd
         2l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958416; x=1740563216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2F8TpMMCQLreKrgJmh9vSe09BpdK/XNLqOfMNu8CL0=;
        b=p78Teqtt9JVl80c9nIpBAFb1n11sMfHmGL63rIQKqSnDH4zjFrJE8A5q8kPG9MXeUr
         jDS0Dnw9Zsl8cO73wJNNuyS4BHbr2vOO87Adt58U2yEZ13Ca1XQGB44fw9xgXO/IcX1l
         mwQMi8L4mloRb3mUMKczEE8E4V1khRoRqW5jlHKfaUdSzp+n1Pg2yM2DzHs8trYThFl2
         XvBxkIwPqlSuF94qw3dk8JH3EYFqn3Eb+wBBLsSqHXfpiMBde3oOvEQQT4FdyPm/hRXM
         PHjCROv6PFV9tV8g/Yj3Hyygxb+u/Yvctf5ENlM7zh/MJ378QIe9ejTwgJzWopmqtBJB
         mJnQ==
X-Gm-Message-State: AOJu0YyFERmYs6vyLCr9EP7+8qCqfDHRN9Fw3RLkbaNdFg5DOiwc43q9
	QGCtE+NLPBJQQ0zGPPspK9euHdVy5cCC2xrR5GLJDbKMkQRnz9GfVt3TCg==
X-Gm-Gg: ASbGncvuEb5Q4KN5euSjRJD1iV64AwR3LOgDoKWBpQ8yP1YR/tbjW/gbzddjTWtVBR2
	7qAqYHIWfUp0nLHu60bFCZoLWoeHcBGf9fxYbyciLO33YZaXhl1Q0L0BLJkCYb5QaGjLMMH3eML
	zbrQGiArr0JIz0mAhMbqukxTuGw3KJbVyOvLuo5OQK2b3u3zupoc9uKzSfxMn105FIoLCkDjWQu
	E5Y+GwqScT2MjCPPLlDbzw4a0qcBRWfDcq7uNNNs7MuinjNinD1bsTgyGH9y7+XE0frM9Cljjf5
	oHsarfwNLQ0gmqd7OHgsMbvQkEHin8zuudZJRw==
X-Google-Smtp-Source: AGHT+IFdTCiZ04YmfjYiGFUj148O6xPw4dnZbr5lOeIGgaDlEMRt8yeWyqponvLSSkkY6RTRmNEXmg==
X-Received: by 2002:a05:6512:10d6:b0:545:1104:616a with SMTP id 2adb3069b0e04-5462eed85d5mr1022282e87.2.1739958415680;
        Wed, 19 Feb 2025 01:46:55 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105fe5sm2095131e87.138.2025.02.19.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:46:53 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 3/4] media: i2c: imx415: Add missing CSI configurations
Date: Wed, 19 Feb 2025 12:46:36 +0300
Message-Id: <20250219094637.607615-3-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250219094637.607615-1-eagle.alexander923@gmail.com>
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, not all variants for different lane rates are handled in the driver.
This patch fills in the remaining possible CSI configurations for 2-lane mode.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 97 +++++++++++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index c5beba4da18b..83b7929455b2 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -109,8 +109,8 @@ static const char *const imx415_supply_names[] = {
  * and converts them to link frequencies by a factor of two when needed.
  */
 static const s64 link_freq_menu_items[] = {
-	594000000 / 2,	720000000 / 2,	891000000 / 2,
-	1440000000 / 2, 1485000000 / 2,
+	594000000 / 2,	720000000 / 2,	891000000 / 2,	1440000000 / 2,
+	1485000000 / 2,	1782000000 / 2,	2079000000 / 2,	2376000000 / 2,
 };
 
 struct imx415_clk_params {
@@ -453,6 +453,19 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 	},
 };
 
+/* 594 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_594mbps[] = {
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
 /* 720 Mbps CSI configuration */
 static const struct cci_reg_sequence imx415_linkrate_720mbps[] = {
 	{ IMX415_TCLKPOST, 0x006F },
@@ -466,6 +479,19 @@ static const struct cci_reg_sequence imx415_linkrate_720mbps[] = {
 	{ IMX415_TLPX, 0x0027 },
 };
 
+/* 891 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_891mbps[] = {
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
 /* 1440 Mbps CSI configuration */
 static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
 	{ IMX415_TCLKPOST, 0x009F },
@@ -479,17 +505,30 @@ static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
 	{ IMX415_TLPX, 0x004F },
 };
 
-/* 891 Mbps CSI configuration */
-static const struct cci_reg_sequence imx415_linkrate_891mbps[] = {
-	{ IMX415_TCLKPOST, 0x007F },
-	{ IMX415_TCLKPREPARE, 0x0037 },
-	{ IMX415_TCLKTRAIL, 0x0037 },
-	{ IMX415_TCLKZERO, 0x00F7 },
-	{ IMX415_THSPREPARE, 0x003F },
-	{ IMX415_THSZERO, 0x006F },
-	{ IMX415_THSTRAIL, 0x003F },
-	{ IMX415_THSEXIT, 0x005F },
-	{ IMX415_TLPX, 0x002F },
+/* 1782 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_1782mbps[] = {
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
+/* 2079 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_2079mbps[] = {
+	{ IMX415_TCLKPOST, 0x00D7 },
+	{ IMX415_TCLKPREPARE, 0x007F },
+	{ IMX415_TCLKTRAIL, 0x007F },
+	{ IMX415_TCLKZERO, 0x0237 },
+	{ IMX415_THSPREPARE, 0x0087 },
+	{ IMX415_THSZERO, 0x00EF },
+	{ IMX415_THSTRAIL, 0x0087 },
+	{ IMX415_THSEXIT, 0x00DF },
+	{ IMX415_TLPX, 0x006F },
 };
 
 struct imx415_mode_reg_list {
@@ -505,6 +544,14 @@ struct imx415_mode {
 
 /* mode configs */
 static const struct imx415_mode supported_modes[] = {
+	{
+		.lane_rate = 594000000,
+		.hmax_min = { 3300, 1320 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_594mbps),
+			.regs = imx415_linkrate_594mbps,
+		},
+	},
 	{
 		.lane_rate = 720000000,
 		.hmax_min = { 2032, 1066 },
@@ -513,6 +560,14 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_linkrate_720mbps,
 		},
 	},
+	{
+		.lane_rate = 891000000,
+		.hmax_min = { 2200, 1100 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
+			.regs = imx415_linkrate_891mbps,
+		},
+	},
 	{
 		.lane_rate = 1440000000,
 		.hmax_min = { 1066, 533 },
@@ -522,11 +577,19 @@ static const struct imx415_mode supported_modes[] = {
 		},
 	},
 	{
-		.lane_rate = 891000000,
-		.hmax_min = { 2200, 1100 },
+		.lane_rate = 1782000000,
+		.hmax_min = { 1100, 550 },
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
-			.regs = imx415_linkrate_891mbps,
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_1782mbps),
+			.regs = imx415_linkrate_1782mbps,
+		},
+	},
+	{
+		.lane_rate = 2079000000,
+		.hmax_min = { 1100, 550 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_2079mbps),
+			.regs = imx415_linkrate_2079mbps,
 		},
 	},
 };
-- 
2.39.1


