Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71161B24DF
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 20:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388882AbfIMSLI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 14:11:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:60772 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387802AbfIMSLI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 14:11:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 11:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,501,1559545200"; 
   d="scan'208";a="210442626"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2019 11:11:08 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next v2 1/2] media: aspeed: refine hsync/vsync polarity setting logic
Date:   Fri, 13 Sep 2019 11:11:04 -0700
Message-Id: <20190913181105.11836-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913181105.11836-1-jae.hyun.yoo@linux.intel.com>
References: <20190913181105.11836-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prevent inaccurate detections of resolution, this commit enables
clearing of hsync/vsync polarity bits based on probed sync state.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v1:
 * Updated commit message.

 drivers/media/platform/aspeed-video.c | 43 +++++++++++++--------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..8f77079da55a 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -614,7 +614,7 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
 	int i;
 	int hsync_counter = 0;
 	int vsync_counter = 0;
-	u32 sts;
+	u32 sts, ctrl;
 
 	for (i = 0; i < NUM_POLARITY_CHECKS; ++i) {
 		sts = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
@@ -629,30 +629,29 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
 			hsync_counter++;
 	}
 
-	if (hsync_counter < 0 || vsync_counter < 0) {
-		u32 ctrl = 0;
+	ctrl = aspeed_video_read(video, VE_CTRL);
 
-		if (hsync_counter < 0) {
-			ctrl = VE_CTRL_HSYNC_POL;
-			video->detected_timings.polarities &=
-				~V4L2_DV_HSYNC_POS_POL;
-		} else {
-			video->detected_timings.polarities |=
-				V4L2_DV_HSYNC_POS_POL;
-		}
-
-		if (vsync_counter < 0) {
-			ctrl = VE_CTRL_VSYNC_POL;
-			video->detected_timings.polarities &=
-				~V4L2_DV_VSYNC_POS_POL;
-		} else {
-			video->detected_timings.polarities |=
-				V4L2_DV_VSYNC_POS_POL;
-		}
+	if (hsync_counter < 0) {
+		ctrl |= VE_CTRL_HSYNC_POL;
+		video->detected_timings.polarities &=
+			~V4L2_DV_HSYNC_POS_POL;
+	} else {
+		ctrl &= ~VE_CTRL_HSYNC_POL;
+		video->detected_timings.polarities |=
+			V4L2_DV_HSYNC_POS_POL;
+	}
 
-		if (ctrl)
-			aspeed_video_update(video, VE_CTRL, 0, ctrl);
+	if (vsync_counter < 0) {
+		ctrl |= VE_CTRL_VSYNC_POL;
+		video->detected_timings.polarities &=
+			~V4L2_DV_VSYNC_POS_POL;
+	} else {
+		ctrl &= ~VE_CTRL_VSYNC_POL;
+		video->detected_timings.polarities |=
+			V4L2_DV_VSYNC_POS_POL;
 	}
+
+	aspeed_video_write(video, VE_CTRL, ctrl);
 }
 
 static bool aspeed_video_alloc_buf(struct aspeed_video *video,
-- 
2.23.0

