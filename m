Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39BF49ACB2
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 07:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359835AbiAYGtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 01:49:52 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:24971 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353675AbiAYGrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 01:47:01 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 20P6akpG078228;
        Tue, 25 Jan 2022 14:36:46 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 Jan
 2022 14:44:06 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/3] media: aspeed: Correct value for h-total-pixels
Date:   Tue, 25 Jan 2022 14:44:07 +0800
Message-ID: <20220125064409.5502-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125064409.5502-1-jammy_huang@aspeedtech.com>
References: <20220125064409.5502-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20P6akpG078228
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previous reg-field, 0x98[11:0], stands for the period of the detected
hsync signal.
Use the correct reg, 0xa0, to get h-total in pixels.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
v4:
 - no update
v3:
 - no update
v2:
 - no update
---
 drivers/media/platform/aspeed-video.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index b388bc56ce81..d5f77b205175 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -166,7 +166,7 @@
 #define  VE_SRC_TB_EDGE_DET_BOT		GENMASK(28, VE_SRC_TB_EDGE_DET_BOT_SHF)
 
 #define VE_MODE_DETECT_STATUS		0x098
-#define  VE_MODE_DETECT_H_PIXELS	GENMASK(11, 0)
+#define  VE_MODE_DETECT_H_PERIOD	GENMASK(11, 0)
 #define  VE_MODE_DETECT_V_LINES_SHF	16
 #define  VE_MODE_DETECT_V_LINES		GENMASK(27, VE_MODE_DETECT_V_LINES_SHF)
 #define  VE_MODE_DETECT_STATUS_VSYNC	BIT(28)
@@ -177,6 +177,8 @@
 #define  VE_SYNC_STATUS_VSYNC_SHF	16
 #define  VE_SYNC_STATUS_VSYNC		GENMASK(27, VE_SYNC_STATUS_VSYNC_SHF)
 
+#define VE_H_TOTAL_PIXELS		0x0A0
+
 #define VE_INTERRUPT_CTRL		0x304
 #define VE_INTERRUPT_STATUS		0x308
 #define  VE_INTERRUPT_MODE_DETECT_WD	BIT(0)
@@ -938,6 +940,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	u32 src_lr_edge;
 	u32 src_tb_edge;
 	u32 sync;
+	u32 htotal;
 	struct v4l2_bt_timings *det = &video->detected_timings;
 
 	det->width = MIN_WIDTH;
@@ -983,6 +986,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 		src_tb_edge = aspeed_video_read(video, VE_SRC_TB_EDGE_DET);
 		mds = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
 		sync = aspeed_video_read(video, VE_SYNC_STATUS);
+		htotal = aspeed_video_read(video, VE_H_TOTAL_PIXELS);
 
 		video->frame_bottom = (src_tb_edge & VE_SRC_TB_EDGE_DET_BOT) >>
 			VE_SRC_TB_EDGE_DET_BOT_SHF;
@@ -999,8 +1003,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 			VE_SRC_LR_EDGE_DET_RT_SHF;
 		video->frame_left = src_lr_edge & VE_SRC_LR_EDGE_DET_LEFT;
 		det->hfrontporch = video->frame_left;
-		det->hbackporch = (mds & VE_MODE_DETECT_H_PIXELS) -
-			video->frame_right;
+		det->hbackporch = htotal - video->frame_right;
 		det->hsync = sync & VE_SYNC_STATUS_HSYNC;
 		if (video->frame_left > video->frame_right)
 			continue;
-- 
2.25.1

