Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7335E44D47C
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 10:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbhKKKAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 05:00:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:45260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229649AbhKKKAM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 05:00:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1BDA61075;
        Thu, 11 Nov 2021 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636624643;
        bh=MUiRPrAO4mVo4miSJUVrU5TVK8DibltKkYTxim9absg=;
        h=From:To:Cc:Subject:Date:From;
        b=fdB/yBUh0ywl2Tr+HZVqcK4ijBPUMMetXO4QyVe+fZTz/xLCZ4N5SmMsDD82oboSB
         FrhZVHRwVy+wDAwOExsd3oZKtceln8xCHwx52wn0cB7Zoa2PDs3nNKbrwGFK3ZtduI
         N3RlPfzfElTkjgxs5gUSIU3Y6IIhspuMbQdQCpvrFSULIGd+a2tWXrtFIZPdmpjZ4m
         pWo1xOY49201D+NKxgm2JPLnAI8gPcvOm1Ni9ttUKCnLIU1SsWOZ0DOnWcd0lgQTkA
         /HcFT7nEAP5/m//GS+iZo+zh1ihOSKF1jSibPjJ58JOdeMi462zuntA7ny34420rwD
         3eQgIJUcB638A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ml6pc-004vRY-Q7; Thu, 11 Nov 2021 09:57:20 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/2] media: atomisp-ov2680: uncomment other resolutions
Date:   Thu, 11 Nov 2021 09:57:18 +0000
Message-Id: <440a1ecd3e1ef3a58bff40cde2ae57a32e5b0f60.1636624633.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several resolutions defined for this sensor, but just
two are currently uncommented. Change the driver to allow other
resolutions to also be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 159 ++++++++++++++++++++-
 1 file changed, 153 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index e53be612a1e4..ed68510bb0b9 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -282,7 +282,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
 	{}
 };
 
-#if 0 /* None of the definitions below are used currently */
 /*
  * 176x144 30fps  VBlanking 1lane 10Bit (binning)
  */
@@ -442,7 +441,7 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
 };
 
 /*
- * 800x600 30fps  VBlanking 1lane 10Bit (binning)
+ * 720x592 30fps  VBlanking 1lane 10Bit (binning)
  */
 static struct ov2680_reg const ov2680_720x592_30fps[] = {
 	{0x3086, 0x01},
@@ -637,7 +636,6 @@ static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 	// {0x5090, 0x0c},
 	{}
 };
-#endif
 
 /*
  *1616x916  30fps  VBlanking 1lane 10bit
@@ -680,9 +678,8 @@ static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 };
 
 /*
- * 1612x1212 30fps VBlanking 1lane 10Bit
+ * 1616x1082 30fps VBlanking 1lane 10Bit
  */
-#if 0
 static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
 	{0x3086, 0x00},
 	{0x370a, 0x21},
@@ -718,7 +715,7 @@ static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
 	{0x5081, 0x41},
 	{}
 };
-#endif
+
 /*
  * 1616x1216 30fps VBlanking 1lane 10Bit
  */
@@ -774,6 +771,21 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.skip_frames = 3,
 		.regs = ov2680_1616x1216_30fps,
 	},
+	{
+		.desc = "ov2680_1616x1082_30fps",
+		.width = 1616,
+		.height = 1082,
+		.pix_clk_freq = 66,
+		.fps = 30,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_1616x1082_30fps,
+	},
 	{
 		.desc = "ov2680_1616x916_30fps",
 		.width = 1616,
@@ -789,6 +801,141 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 		.skip_frames = 3,
 		.regs = ov2680_1616x916_30fps,
 	},
+	{
+		.desc = "ov2680_1456x1096_30fps",
+		.width = 1456,
+		.height = 1096,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_1456x1096_30fps,
+	},
+	{
+		.desc = "ov2680_1296x976_30fps",
+		.width = 1296,
+		.height = 976,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_1296x976_30fps,
+	},
+	{
+		.desc = "ov2680_720p_30fps",
+		.width = 1280,
+		.height = 720,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_720p_30fps,
+	},
+	{
+		.desc = "ov2680_800x600_30fps",
+		.width = 800,
+		.height = 600,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_800x600_30fps,
+	},
+	{
+		.desc = "ov2680_720x592_30fps",
+		.width = 720,
+		.height = 592,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_720x592_30fps,
+	},
+	{
+		.desc = "ov2680_656x496_30fps",
+		.width = 656,
+		.height = 496,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_656x496_30fps,
+	},
+	{
+		.desc = "ov2680_QVGA_30fps",
+		.width = 336,
+		.height = 256,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_QVGA_30fps,
+	},
+	{
+		.desc = "ov2680_CIF_30fps",
+		.width = 352,
+		.height = 288,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_CIF_30fps,
+	},
+	{
+		.desc = "ov2680_QCIF_30fps",
+		.width = 176,
+		.height = 144,
+		.fps = 30,
+		.pix_clk_freq = 66,
+		.used = 0,
+		.pixels_per_line = 1698,//1704,
+		.lines_per_frame = 1294,
+		.bin_factor_x = 0,
+		.bin_factor_y = 0,
+		.bin_mode = 0,
+		.skip_frames = 3,
+		.regs = ov2680_QCIF_30fps,
+	},
 };
 
 #define N_RES_PREVIEW (ARRAY_SIZE(ov2680_res_preview))
-- 
2.33.1

