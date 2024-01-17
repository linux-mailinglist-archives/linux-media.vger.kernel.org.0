Return-Path: <linux-media+bounces-3781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4BD83009F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 08:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E8C1C231BE
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 07:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21D4C148;
	Wed, 17 Jan 2024 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gMapvP0s"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3865BA53
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705477187; cv=none; b=IEAc0eYMLn1c38scIup8Du1o5B6nDM3SP4iCI0D8BSAIcp0tO7+4Zi+mhIBWN8MCg0fV2hDC+pD6azz//KaxUdkbuyxqMuSSGqtJzkmjTsHHzxqikBaFlUmjtT9d/c0NxTbPIdaYpjtc5r08Bo7CowJKKuvGDgKuqiEdtdkOhTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705477187; c=relaxed/simple;
	bh=sVwlcoD3DF1PDQHo7iSos0BBDbntwlvCuRIGoUmb3Gk=;
	h=DKIM-Signature:X-IronPort-AV:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=P3OA1Jyk2+Mv0M84AUUYe3FP7EORfz6Rnt2Pby9wVHIi5iWUk4f9rCaOHd+1BAw9lxW03UPstnyqfM2QPvnnlZAcTyXMOzdSkfxS4Xi4MOEo1KgRuvr8sLJ52/etutjltfDSFJetCMxg6Xf50a26IjnT02rGxacKQwxFEUPen68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gMapvP0s; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705477184; x=1737013184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wORuh+fI9bOOI07gaVrvvMbYQh2JjT35RHvdCMKv0+c=;
  b=gMapvP0sDftdn1kz3w/YsU7bp6ICuwuq7Xq7w4g3li8AlWXcNYxK4oqe
   ru+hmx1EXPsyzOVilzL38F3Shv9TDRSwFFXOcdkLWFzPGebYbac7nqFCB
   OdKyrUUhZZK5s3NZznyP2ni20rWLL/1v8LlAThv6VSLF0ETrNui0wSn/m
   /c4nhq0S1oRyKr/BhPWru2MbXNmK3L6b3Aw77bzuD4Ymrj3Br9RYkZ7ag
   VJZ9pRwlMUKIcnXpMTFCfJ2/MoFXfumItipS4t17MHHsi4YVgF6K9jytn
   8hHsPLVy53Xe83kiWdyalEeO0Jvkx5LP08sdANthcOSvXfxD/Zn/8DC/f
   g==;
X-IronPort-AV: E=Sophos;i="6.05,200,1701126000"; 
   d="scan'208";a="34931178"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Jan 2024 08:39:38 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6C74B280084;
	Wed, 17 Jan 2024 08:39:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 1/2] media: i2c: imx415: Convert to new CCI register access helpers
Date: Wed, 17 Jan 2024 08:39:35 +0100
Message-Id: <20240117073936.2812336-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117073936.2812336-1-alexander.stein@ew.tq-group.com>
References: <20240117073936.2812336-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new common CCI register access helpers to replace the private
register access helpers in the imx415 driver.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx415.c | 407 +++++++++++++++----------------------
 2 files changed, 170 insertions(+), 238 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index f6b3d26afa9f0..e1197435227bf 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -224,6 +224,7 @@ config VIDEO_IMX412
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
 	depends on OF_GPIO
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX415 camera.
diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 1e5f20c3ed824..e52437fb5087f 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
@@ -28,76 +29,65 @@
 
 #define IMX415_NUM_CLK_PARAM_REGS 11
 
-#define IMX415_REG_8BIT(n)	  ((1 << 16) | (n))
-#define IMX415_REG_16BIT(n)	  ((2 << 16) | (n))
-#define IMX415_REG_24BIT(n)	  ((3 << 16) | (n))
-#define IMX415_REG_SIZE_SHIFT	  16
-#define IMX415_REG_ADDR_MASK	  0xffff
-
-#define IMX415_MODE		  IMX415_REG_8BIT(0x3000)
+#define IMX415_MODE		  CCI_REG8(0x3000)
 #define IMX415_MODE_OPERATING	  (0)
 #define IMX415_MODE_STANDBY	  BIT(0)
-#define IMX415_REGHOLD		  IMX415_REG_8BIT(0x3001)
+#define IMX415_REGHOLD		  CCI_REG8(0x3001)
 #define IMX415_REGHOLD_INVALID	  (0)
 #define IMX415_REGHOLD_VALID	  BIT(0)
-#define IMX415_XMSTA		  IMX415_REG_8BIT(0x3002)
+#define IMX415_XMSTA		  CCI_REG8(0x3002)
 #define IMX415_XMSTA_START	  (0)
 #define IMX415_XMSTA_STOP	  BIT(0)
-#define IMX415_BCWAIT_TIME	  IMX415_REG_16BIT(0x3008)
-#define IMX415_CPWAIT_TIME	  IMX415_REG_16BIT(0x300A)
-#define IMX415_WINMODE		  IMX415_REG_8BIT(0x301C)
-#define IMX415_ADDMODE		  IMX415_REG_8BIT(0x3022)
-#define IMX415_REVERSE		  IMX415_REG_8BIT(0x3030)
+#define IMX415_BCWAIT_TIME	  CCI_REG16_LE(0x3008)
+#define IMX415_CPWAIT_TIME	  CCI_REG16_LE(0x300a)
+#define IMX415_WINMODE		  CCI_REG8(0x301c)
+#define IMX415_ADDMODE		  CCI_REG8(0x3022)
+#define IMX415_REVERSE		  CCI_REG8(0x3030)
 #define IMX415_HREVERSE_SHIFT	  (0)
 #define IMX415_VREVERSE_SHIFT	  BIT(0)
-#define IMX415_ADBIT		  IMX415_REG_8BIT(0x3031)
-#define IMX415_MDBIT		  IMX415_REG_8BIT(0x3032)
-#define IMX415_SYS_MODE		  IMX415_REG_8BIT(0x3033)
-#define IMX415_OUTSEL		  IMX415_REG_8BIT(0x30C0)
-#define IMX415_DRV		  IMX415_REG_8BIT(0x30C1)
-#define IMX415_VMAX		  IMX415_REG_24BIT(0x3024)
-#define IMX415_HMAX		  IMX415_REG_16BIT(0x3028)
-#define IMX415_SHR0		  IMX415_REG_24BIT(0x3050)
-#define IMX415_GAIN_PCG_0	  IMX415_REG_16BIT(0x3090)
+#define IMX415_ADBIT		  CCI_REG8(0x3031)
+#define IMX415_MDBIT		  CCI_REG8(0x3032)
+#define IMX415_SYS_MODE		  CCI_REG8(0x3033)
+#define IMX415_OUTSEL		  CCI_REG8(0x30c0)
+#define IMX415_DRV		  CCI_REG8(0x30c1)
+#define IMX415_VMAX		  CCI_REG24_LE(0x3024)
+#define IMX415_HMAX		  CCI_REG16_LE(0x3028)
+#define IMX415_SHR0		  CCI_REG24_LE(0x3050)
+#define IMX415_GAIN_PCG_0	  CCI_REG16_LE(0x3090)
 #define IMX415_AGAIN_MIN	  0
 #define IMX415_AGAIN_MAX	  100
 #define IMX415_AGAIN_STEP	  1
-#define IMX415_BLKLEVEL		  IMX415_REG_16BIT(0x30E2)
+#define IMX415_BLKLEVEL		  CCI_REG16_LE(0x30e2)
 #define IMX415_BLKLEVEL_DEFAULT	  50
-#define IMX415_TPG_EN_DUOUT	  IMX415_REG_8BIT(0x30E4)
-#define IMX415_TPG_PATSEL_DUOUT	  IMX415_REG_8BIT(0x30E6)
-#define IMX415_TPG_COLORWIDTH	  IMX415_REG_8BIT(0x30E8)
-#define IMX415_TESTCLKEN_MIPI	  IMX415_REG_8BIT(0x3110)
-#define IMX415_INCKSEL1		  IMX415_REG_8BIT(0x3115)
-#define IMX415_INCKSEL2		  IMX415_REG_8BIT(0x3116)
-#define IMX415_INCKSEL3		  IMX415_REG_16BIT(0x3118)
-#define IMX415_INCKSEL4		  IMX415_REG_16BIT(0x311A)
-#define IMX415_INCKSEL5		  IMX415_REG_8BIT(0x311E)
-#define IMX415_DIG_CLP_MODE	  IMX415_REG_8BIT(0x32C8)
-#define IMX415_WRJ_OPEN		  IMX415_REG_8BIT(0x3390)
-#define IMX415_SENSOR_INFO	  IMX415_REG_16BIT(0x3F12)
-#define IMX415_SENSOR_INFO_MASK	  0xFFF
+#define IMX415_TPG_EN_DUOUT	  CCI_REG8(0x30e4)
+#define IMX415_TPG_PATSEL_DUOUT	  CCI_REG8(0x30e6)
+#define IMX415_TPG_COLORWIDTH	  CCI_REG8(0x30e8)
+#define IMX415_TESTCLKEN_MIPI	  CCI_REG8(0x3110)
+#define IMX415_INCKSEL1		  CCI_REG8(0x3115)
+#define IMX415_INCKSEL2		  CCI_REG8(0x3116)
+#define IMX415_INCKSEL3		  CCI_REG16_LE(0x3118)
+#define IMX415_INCKSEL4		  CCI_REG16_LE(0x311a)
+#define IMX415_INCKSEL5		  CCI_REG8(0x311e)
+#define IMX415_DIG_CLP_MODE	  CCI_REG8(0x32c8)
+#define IMX415_WRJ_OPEN		  CCI_REG8(0x3390)
+#define IMX415_SENSOR_INFO	  CCI_REG16_LE(0x3f12)
+#define IMX415_SENSOR_INFO_MASK	  0xfff
 #define IMX415_CHIP_ID		  0x514
-#define IMX415_LANEMODE		  IMX415_REG_16BIT(0x4001)
+#define IMX415_LANEMODE		  CCI_REG16_LE(0x4001)
 #define IMX415_LANEMODE_2	  1
 #define IMX415_LANEMODE_4	  3
-#define IMX415_TXCLKESC_FREQ	  IMX415_REG_16BIT(0x4004)
-#define IMX415_INCKSEL6		  IMX415_REG_8BIT(0x400C)
-#define IMX415_TCLKPOST		  IMX415_REG_16BIT(0x4018)
-#define IMX415_TCLKPREPARE	  IMX415_REG_16BIT(0x401A)
-#define IMX415_TCLKTRAIL	  IMX415_REG_16BIT(0x401C)
-#define IMX415_TCLKZERO		  IMX415_REG_16BIT(0x401E)
-#define IMX415_THSPREPARE	  IMX415_REG_16BIT(0x4020)
-#define IMX415_THSZERO		  IMX415_REG_16BIT(0x4022)
-#define IMX415_THSTRAIL		  IMX415_REG_16BIT(0x4024)
-#define IMX415_THSEXIT		  IMX415_REG_16BIT(0x4026)
-#define IMX415_TLPX		  IMX415_REG_16BIT(0x4028)
-#define IMX415_INCKSEL7		  IMX415_REG_8BIT(0x4074)
-
-struct imx415_reg {
-	u32 address;
-	u32 val;
-};
+#define IMX415_TXCLKESC_FREQ	  CCI_REG16_LE(0x4004)
+#define IMX415_INCKSEL6		  CCI_REG8(0x400c)
+#define IMX415_TCLKPOST		  CCI_REG16_LE(0x4018)
+#define IMX415_TCLKPREPARE	  CCI_REG16_LE(0x401a)
+#define IMX415_TCLKTRAIL	  CCI_REG16_LE(0x401c)
+#define IMX415_TCLKZERO		  CCI_REG16_LE(0x401e)
+#define IMX415_THSPREPARE	  CCI_REG16_LE(0x4020)
+#define IMX415_THSZERO		  CCI_REG16_LE(0x4022)
+#define IMX415_THSTRAIL		  CCI_REG16_LE(0x4024)
+#define IMX415_THSEXIT		  CCI_REG16_LE(0x4026)
+#define IMX415_TLPX		  CCI_REG16_LE(0x4028)
+#define IMX415_INCKSEL7		  CCI_REG8(0x4074)
 
 static const char *const imx415_supply_names[] = {
 	"dvdd",
@@ -118,7 +108,7 @@ static const s64 link_freq_menu_items[] = {
 struct imx415_clk_params {
 	u64 lane_rate;
 	u64 inck;
-	struct imx415_reg regs[IMX415_NUM_CLK_PARAM_REGS];
+	struct cci_reg_sequence regs[IMX415_NUM_CLK_PARAM_REGS];
 };
 
 /* INCK Settings - includes all lane rate and INCK dependent registers */
@@ -201,7 +191,7 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 };
 
 /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
-static const struct imx415_reg imx415_mode_2_720[] = {
+static const struct cci_reg_sequence imx415_mode_2_720[] = {
 	{ IMX415_VMAX, 0x08CA },
 	{ IMX415_HMAX, 0x07F0 },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
@@ -217,7 +207,7 @@ static const struct imx415_reg imx415_mode_2_720[] = {
 };
 
 /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
-static const struct imx415_reg imx415_mode_2_1440[] = {
+static const struct cci_reg_sequence imx415_mode_2_1440[] = {
 	{ IMX415_VMAX, 0x08CA },
 	{ IMX415_HMAX, 0x042A },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
@@ -233,7 +223,7 @@ static const struct imx415_reg imx415_mode_2_1440[] = {
 };
 
 /* all-pixel 4-lane 891 Mbps 30 Hz mode */
-static const struct imx415_reg imx415_mode_4_891[] = {
+static const struct cci_reg_sequence imx415_mode_4_891[] = {
 	{ IMX415_VMAX, 0x08CA },
 	{ IMX415_HMAX, 0x044C },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
@@ -250,7 +240,7 @@ static const struct imx415_reg imx415_mode_4_891[] = {
 
 struct imx415_mode_reg_list {
 	u32 num_of_regs;
-	const struct imx415_reg *regs;
+	const struct cci_reg_sequence *regs;
 };
 
 /*
@@ -323,11 +313,6 @@ static const struct imx415_mode supported_modes[] = {
 	},
 };
 
-static const struct regmap_config imx415_regmap_config = {
-	.reg_bits = 16,
-	.val_bits = 8,
-};
-
 static const char *const imx415_test_pattern_menu[] = {
 	"disabled",
 	"solid black",
@@ -369,7 +354,7 @@ struct imx415 {
  * This table includes fixed register settings and a bunch of undocumented
  * registers that have to be set to another value than default.
  */
-static const struct imx415_reg imx415_init_table[] = {
+static const struct cci_reg_sequence imx415_init_table[] = {
 	/* use all-pixel readout mode, no flip */
 	{ IMX415_WINMODE, 0x00 },
 	{ IMX415_ADDMODE, 0x00 },
@@ -382,77 +367,77 @@ static const struct imx415_reg imx415_init_table[] = {
 	{ IMX415_DRV, 0x00 },
 
 	/* SONY magic registers */
-	{ IMX415_REG_8BIT(0x32D4), 0x21 },
-	{ IMX415_REG_8BIT(0x32EC), 0xA1 },
-	{ IMX415_REG_8BIT(0x3452), 0x7F },
-	{ IMX415_REG_8BIT(0x3453), 0x03 },
-	{ IMX415_REG_8BIT(0x358A), 0x04 },
-	{ IMX415_REG_8BIT(0x35A1), 0x02 },
-	{ IMX415_REG_8BIT(0x36BC), 0x0C },
-	{ IMX415_REG_8BIT(0x36CC), 0x53 },
-	{ IMX415_REG_8BIT(0x36CD), 0x00 },
-	{ IMX415_REG_8BIT(0x36CE), 0x3C },
-	{ IMX415_REG_8BIT(0x36D0), 0x8C },
-	{ IMX415_REG_8BIT(0x36D1), 0x00 },
-	{ IMX415_REG_8BIT(0x36D2), 0x71 },
-	{ IMX415_REG_8BIT(0x36D4), 0x3C },
-	{ IMX415_REG_8BIT(0x36D6), 0x53 },
-	{ IMX415_REG_8BIT(0x36D7), 0x00 },
-	{ IMX415_REG_8BIT(0x36D8), 0x71 },
-	{ IMX415_REG_8BIT(0x36DA), 0x8C },
-	{ IMX415_REG_8BIT(0x36DB), 0x00 },
-	{ IMX415_REG_8BIT(0x3724), 0x02 },
-	{ IMX415_REG_8BIT(0x3726), 0x02 },
-	{ IMX415_REG_8BIT(0x3732), 0x02 },
-	{ IMX415_REG_8BIT(0x3734), 0x03 },
-	{ IMX415_REG_8BIT(0x3736), 0x03 },
-	{ IMX415_REG_8BIT(0x3742), 0x03 },
-	{ IMX415_REG_8BIT(0x3862), 0xE0 },
-	{ IMX415_REG_8BIT(0x38CC), 0x30 },
-	{ IMX415_REG_8BIT(0x38CD), 0x2F },
-	{ IMX415_REG_8BIT(0x395C), 0x0C },
-	{ IMX415_REG_8BIT(0x3A42), 0xD1 },
-	{ IMX415_REG_8BIT(0x3A4C), 0x77 },
-	{ IMX415_REG_8BIT(0x3AE0), 0x02 },
-	{ IMX415_REG_8BIT(0x3AEC), 0x0C },
-	{ IMX415_REG_8BIT(0x3B00), 0x2E },
-	{ IMX415_REG_8BIT(0x3B06), 0x29 },
-	{ IMX415_REG_8BIT(0x3B98), 0x25 },
-	{ IMX415_REG_8BIT(0x3B99), 0x21 },
-	{ IMX415_REG_8BIT(0x3B9B), 0x13 },
-	{ IMX415_REG_8BIT(0x3B9C), 0x13 },
-	{ IMX415_REG_8BIT(0x3B9D), 0x13 },
-	{ IMX415_REG_8BIT(0x3B9E), 0x13 },
-	{ IMX415_REG_8BIT(0x3BA1), 0x00 },
-	{ IMX415_REG_8BIT(0x3BA2), 0x06 },
-	{ IMX415_REG_8BIT(0x3BA3), 0x0B },
-	{ IMX415_REG_8BIT(0x3BA4), 0x10 },
-	{ IMX415_REG_8BIT(0x3BA5), 0x14 },
-	{ IMX415_REG_8BIT(0x3BA6), 0x18 },
-	{ IMX415_REG_8BIT(0x3BA7), 0x1A },
-	{ IMX415_REG_8BIT(0x3BA8), 0x1A },
-	{ IMX415_REG_8BIT(0x3BA9), 0x1A },
-	{ IMX415_REG_8BIT(0x3BAC), 0xED },
-	{ IMX415_REG_8BIT(0x3BAD), 0x01 },
-	{ IMX415_REG_8BIT(0x3BAE), 0xF6 },
-	{ IMX415_REG_8BIT(0x3BAF), 0x02 },
-	{ IMX415_REG_8BIT(0x3BB0), 0xA2 },
-	{ IMX415_REG_8BIT(0x3BB1), 0x03 },
-	{ IMX415_REG_8BIT(0x3BB2), 0xE0 },
-	{ IMX415_REG_8BIT(0x3BB3), 0x03 },
-	{ IMX415_REG_8BIT(0x3BB4), 0xE0 },
-	{ IMX415_REG_8BIT(0x3BB5), 0x03 },
-	{ IMX415_REG_8BIT(0x3BB6), 0xE0 },
-	{ IMX415_REG_8BIT(0x3BB7), 0x03 },
-	{ IMX415_REG_8BIT(0x3BB8), 0xE0 },
-	{ IMX415_REG_8BIT(0x3BBA), 0xE0 },
-	{ IMX415_REG_8BIT(0x3BBC), 0xDA },
-	{ IMX415_REG_8BIT(0x3BBE), 0x88 },
-	{ IMX415_REG_8BIT(0x3BC0), 0x44 },
-	{ IMX415_REG_8BIT(0x3BC2), 0x7B },
-	{ IMX415_REG_8BIT(0x3BC4), 0xA2 },
-	{ IMX415_REG_8BIT(0x3BC8), 0xBD },
-	{ IMX415_REG_8BIT(0x3BCA), 0xBD },
+	{ CCI_REG8(0x32D4), 0x21 },
+	{ CCI_REG8(0x32EC), 0xA1 },
+	{ CCI_REG8(0x3452), 0x7F },
+	{ CCI_REG8(0x3453), 0x03 },
+	{ CCI_REG8(0x358A), 0x04 },
+	{ CCI_REG8(0x35A1), 0x02 },
+	{ CCI_REG8(0x36BC), 0x0C },
+	{ CCI_REG8(0x36CC), 0x53 },
+	{ CCI_REG8(0x36CD), 0x00 },
+	{ CCI_REG8(0x36CE), 0x3C },
+	{ CCI_REG8(0x36D0), 0x8C },
+	{ CCI_REG8(0x36D1), 0x00 },
+	{ CCI_REG8(0x36D2), 0x71 },
+	{ CCI_REG8(0x36D4), 0x3C },
+	{ CCI_REG8(0x36D6), 0x53 },
+	{ CCI_REG8(0x36D7), 0x00 },
+	{ CCI_REG8(0x36D8), 0x71 },
+	{ CCI_REG8(0x36DA), 0x8C },
+	{ CCI_REG8(0x36DB), 0x00 },
+	{ CCI_REG8(0x3724), 0x02 },
+	{ CCI_REG8(0x3726), 0x02 },
+	{ CCI_REG8(0x3732), 0x02 },
+	{ CCI_REG8(0x3734), 0x03 },
+	{ CCI_REG8(0x3736), 0x03 },
+	{ CCI_REG8(0x3742), 0x03 },
+	{ CCI_REG8(0x3862), 0xE0 },
+	{ CCI_REG8(0x38CC), 0x30 },
+	{ CCI_REG8(0x38CD), 0x2F },
+	{ CCI_REG8(0x395C), 0x0C },
+	{ CCI_REG8(0x3A42), 0xD1 },
+	{ CCI_REG8(0x3A4C), 0x77 },
+	{ CCI_REG8(0x3AE0), 0x02 },
+	{ CCI_REG8(0x3AEC), 0x0C },
+	{ CCI_REG8(0x3B00), 0x2E },
+	{ CCI_REG8(0x3B06), 0x29 },
+	{ CCI_REG8(0x3B98), 0x25 },
+	{ CCI_REG8(0x3B99), 0x21 },
+	{ CCI_REG8(0x3B9B), 0x13 },
+	{ CCI_REG8(0x3B9C), 0x13 },
+	{ CCI_REG8(0x3B9D), 0x13 },
+	{ CCI_REG8(0x3B9E), 0x13 },
+	{ CCI_REG8(0x3BA1), 0x00 },
+	{ CCI_REG8(0x3BA2), 0x06 },
+	{ CCI_REG8(0x3BA3), 0x0B },
+	{ CCI_REG8(0x3BA4), 0x10 },
+	{ CCI_REG8(0x3BA5), 0x14 },
+	{ CCI_REG8(0x3BA6), 0x18 },
+	{ CCI_REG8(0x3BA7), 0x1A },
+	{ CCI_REG8(0x3BA8), 0x1A },
+	{ CCI_REG8(0x3BA9), 0x1A },
+	{ CCI_REG8(0x3BAC), 0xED },
+	{ CCI_REG8(0x3BAD), 0x01 },
+	{ CCI_REG8(0x3BAE), 0xF6 },
+	{ CCI_REG8(0x3BAF), 0x02 },
+	{ CCI_REG8(0x3BB0), 0xA2 },
+	{ CCI_REG8(0x3BB1), 0x03 },
+	{ CCI_REG8(0x3BB2), 0xE0 },
+	{ CCI_REG8(0x3BB3), 0x03 },
+	{ CCI_REG8(0x3BB4), 0xE0 },
+	{ CCI_REG8(0x3BB5), 0x03 },
+	{ CCI_REG8(0x3BB6), 0xE0 },
+	{ CCI_REG8(0x3BB7), 0x03 },
+	{ CCI_REG8(0x3BB8), 0xE0 },
+	{ CCI_REG8(0x3BBA), 0xE0 },
+	{ CCI_REG8(0x3BBC), 0xDA },
+	{ CCI_REG8(0x3BBE), 0x88 },
+	{ CCI_REG8(0x3BC0), 0x44 },
+	{ CCI_REG8(0x3BC2), 0x7B },
+	{ CCI_REG8(0x3BC4), 0xA2 },
+	{ CCI_REG8(0x3BC8), 0xBD },
+	{ CCI_REG8(0x3BCA), 0xBD },
 };
 
 static inline struct imx415 *to_imx415(struct v4l2_subdev *sd)
@@ -460,74 +445,26 @@ static inline struct imx415 *to_imx415(struct v4l2_subdev *sd)
 	return container_of(sd, struct imx415, subdev);
 }
 
-static int imx415_read(struct imx415 *sensor, u32 addr)
-{
-	u8 data[3] = { 0 };
-	int ret;
-
-	ret = regmap_raw_read(sensor->regmap, addr & IMX415_REG_ADDR_MASK, data,
-			      (addr >> IMX415_REG_SIZE_SHIFT) & 3);
-	if (ret < 0)
-		return ret;
-
-	return (data[2] << 16) | (data[1] << 8) | data[0];
-}
-
-static int imx415_write(struct imx415 *sensor, u32 addr, u32 value)
-{
-	u8 data[3] = { value & 0xff, (value >> 8) & 0xff, value >> 16 };
-	int ret;
-
-	ret = regmap_raw_write(sensor->regmap, addr & IMX415_REG_ADDR_MASK,
-			       data, (addr >> IMX415_REG_SIZE_SHIFT) & 3);
-	if (ret < 0)
-		dev_err_ratelimited(sensor->dev,
-				    "%u-bit write to 0x%04x failed: %d\n",
-				    ((addr >> IMX415_REG_SIZE_SHIFT) & 3) * 8,
-				    addr & IMX415_REG_ADDR_MASK, ret);
-
-	return 0;
-}
-
 static int imx415_set_testpattern(struct imx415 *sensor, int val)
 {
-	int ret;
+	int ret = 0;
 
 	if (val) {
-		ret = imx415_write(sensor, IMX415_BLKLEVEL, 0x00);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_TPG_EN_DUOUT, 0x01);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_TPG_PATSEL_DUOUT, val - 1);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_TPG_COLORWIDTH, 0x01);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_TESTCLKEN_MIPI, 0x20);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_DIG_CLP_MODE, 0x00);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_WRJ_OPEN, 0x00);
+		cci_write(sensor->regmap, IMX415_BLKLEVEL, 0x00, &ret);
+		cci_write(sensor->regmap, IMX415_TPG_EN_DUOUT, 0x01, &ret);
+		cci_write(sensor->regmap, IMX415_TPG_PATSEL_DUOUT,
+			  val - 1, &ret);
+		cci_write(sensor->regmap, IMX415_TPG_COLORWIDTH, 0x01, &ret);
+		cci_write(sensor->regmap, IMX415_TESTCLKEN_MIPI, 0x20, &ret);
+		cci_write(sensor->regmap, IMX415_DIG_CLP_MODE, 0x00, &ret);
+		cci_write(sensor->regmap, IMX415_WRJ_OPEN, 0x00, &ret);
 	} else {
-		ret = imx415_write(sensor, IMX415_BLKLEVEL,
-				   IMX415_BLKLEVEL_DEFAULT);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_TPG_EN_DUOUT, 0x00);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_TESTCLKEN_MIPI, 0x00);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_DIG_CLP_MODE, 0x01);
-		if (ret)
-			return ret;
-		ret = imx415_write(sensor, IMX415_WRJ_OPEN, 0x01);
+		cci_write(sensor->regmap, IMX415_BLKLEVEL,
+			  IMX415_BLKLEVEL_DEFAULT, &ret);
+		cci_write(sensor->regmap, IMX415_TPG_EN_DUOUT, 0x00, &ret);
+		cci_write(sensor->regmap, IMX415_TESTCLKEN_MIPI, 0x00, &ret);
+		cci_write(sensor->regmap, IMX415_DIG_CLP_MODE, 0x01, &ret);
+		cci_write(sensor->regmap, IMX415_WRJ_OPEN, 0x01, &ret);
 	}
 	return 0;
 }
@@ -553,19 +490,21 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 		/* clamp the exposure value to VMAX. */
 		vmax = format->height + sensor->vblank->cur.val;
 		ctrl->val = min_t(int, ctrl->val, vmax);
-		ret = imx415_write(sensor, IMX415_SHR0, vmax - ctrl->val);
+		ret = cci_write(sensor->regmap, IMX415_SHR0,
+				vmax - ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_ANALOGUE_GAIN:
 		/* analogue gain in 0.3 dB step size */
-		ret = imx415_write(sensor, IMX415_GAIN_PCG_0, ctrl->val);
+		ret = cci_write(sensor->regmap, IMX415_GAIN_PCG_0,
+				ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_HFLIP:
 	case V4L2_CID_VFLIP:
 		flip = (sensor->hflip->val << IMX415_HREVERSE_SHIFT) |
 		       (sensor->vflip->val << IMX415_VREVERSE_SHIFT);
-		ret = imx415_write(sensor, IMX415_REVERSE, flip);
+		ret = cci_write(sensor->regmap, IMX415_REVERSE, flip, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -679,8 +618,6 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 
 static int imx415_set_mode(struct imx415 *sensor, int mode)
 {
-	const struct imx415_reg *reg;
-	unsigned int i;
 	int ret = 0;
 
 	if (mode >= ARRAY_SIZE(supported_modes)) {
@@ -688,34 +625,29 @@ static int imx415_set_mode(struct imx415 *sensor, int mode)
 		return -EINVAL;
 	}
 
-	for (i = 0; i < supported_modes[mode].reg_list.num_of_regs; ++i) {
-		reg = &supported_modes[mode].reg_list.regs[i];
-		ret = imx415_write(sensor, reg->address, reg->val);
-		if (ret)
-			return ret;
-	}
+	cci_multi_reg_write(sensor->regmap,
+			    supported_modes[mode].reg_list.regs,
+			    supported_modes[mode].reg_list.num_of_regs,
+			    &ret);
 
-	for (i = 0; i < IMX415_NUM_CLK_PARAM_REGS; ++i) {
-		reg = &sensor->clk_params->regs[i];
-		ret = imx415_write(sensor, reg->address, reg->val);
-		if (ret)
-			return ret;
-	}
+	cci_multi_reg_write(sensor->regmap,
+			    sensor->clk_params->regs,
+			    IMX415_NUM_CLK_PARAM_REGS,
+			    &ret);
 
 	return 0;
 }
 
 static int imx415_setup(struct imx415 *sensor, struct v4l2_subdev_state *state)
 {
-	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(imx415_init_table); ++i) {
-		ret = imx415_write(sensor, imx415_init_table[i].address,
-				   imx415_init_table[i].val);
-		if (ret)
-			return ret;
-	}
+	ret = cci_multi_reg_write(sensor->regmap,
+				  imx415_init_table,
+				  ARRAY_SIZE(imx415_init_table),
+				  NULL);
+	if (ret)
+		return ret;
 
 	return imx415_set_mode(sensor, sensor->cur_mode);
 }
@@ -724,7 +656,8 @@ static int imx415_wakeup(struct imx415 *sensor)
 {
 	int ret;
 
-	ret = imx415_write(sensor, IMX415_MODE, IMX415_MODE_OPERATING);
+	ret = cci_write(sensor->regmap, IMX415_MODE,
+			IMX415_MODE_OPERATING, NULL);
 	if (ret)
 		return ret;
 
@@ -743,21 +676,18 @@ static int imx415_stream_on(struct imx415 *sensor)
 	int ret;
 
 	ret = imx415_wakeup(sensor);
-	if (ret)
-		return ret;
-
-	return imx415_write(sensor, IMX415_XMSTA, IMX415_XMSTA_START);
+	return cci_write(sensor->regmap, IMX415_XMSTA,
+			 IMX415_XMSTA_START, &ret);
 }
 
 static int imx415_stream_off(struct imx415 *sensor)
 {
 	int ret;
 
-	ret = imx415_write(sensor, IMX415_XMSTA, IMX415_XMSTA_STOP);
-	if (ret)
-		return ret;
-
-	return imx415_write(sensor, IMX415_MODE, IMX415_MODE_STANDBY);
+	ret = cci_write(sensor->regmap, IMX415_XMSTA,
+			IMX415_XMSTA_STOP, NULL);
+	return cci_write(sensor->regmap, IMX415_MODE,
+			 IMX415_MODE_STANDBY, &ret);
 }
 
 static int imx415_s_stream(struct v4l2_subdev *sd, int enable)
@@ -992,6 +922,7 @@ static void imx415_power_off(struct imx415 *sensor)
 static int imx415_identify_model(struct imx415 *sensor)
 {
 	int model, ret;
+	u64 chip_id;
 
 	/*
 	 * While most registers can be read when the sensor is in standby, this
@@ -1002,14 +933,14 @@ static int imx415_identify_model(struct imx415 *sensor)
 		return dev_err_probe(sensor->dev, ret,
 				     "failed to get sensor out of standby\n");
 
-	ret = imx415_read(sensor, IMX415_SENSOR_INFO);
+	ret = cci_read(sensor->regmap, IMX415_SENSOR_INFO, &chip_id, NULL);
 	if (ret < 0) {
 		dev_err_probe(sensor->dev, ret,
 			      "failed to read sensor information\n");
 		goto done;
 	}
 
-	model = ret & IMX415_SENSOR_INFO_MASK;
+	model = chip_id & IMX415_SENSOR_INFO_MASK;
 
 	switch (model) {
 	case IMX415_CHIP_ID:
@@ -1024,7 +955,7 @@ static int imx415_identify_model(struct imx415 *sensor)
 	ret = 0;
 
 done:
-	imx415_write(sensor, IMX415_MODE, IMX415_MODE_STANDBY);
+	cci_write(sensor->regmap, IMX415_MODE, IMX415_MODE_STANDBY, &ret);
 	return ret;
 }
 
@@ -1173,7 +1104,7 @@ static int imx415_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	sensor->regmap = devm_regmap_init_i2c(client, &imx415_regmap_config);
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(sensor->regmap))
 		return PTR_ERR(sensor->regmap);
 
-- 
2.34.1


