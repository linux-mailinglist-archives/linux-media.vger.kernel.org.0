Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 557633170F
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 00:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfEaWQF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 18:16:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:36052 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbfEaWQD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 18:16:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 15:16:03 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2019 15:16:03 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 08/10] media: aspeed: remove source buffer allocation before mode detection
Date:   Fri, 31 May 2019 15:15:46 -0700
Message-Id: <20190531221548.14757-9-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mode detection doesn't require source buffer allocation so this
commit removes that.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
v2 -> v3:
 Corrected re-allocation logic of source buffers.

v1 -> v2:
 New.

 drivers/media/platform/aspeed-video.c | 37 ++++-----------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index c0b889141b8f..d6708ddb0391 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -731,27 +731,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	det->height = MIN_HEIGHT;
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 
-	/*
-	 * Since we need max buffer size for detection, free the second source
-	 * buffer first.
-	 */
-	if (video->srcs[1].size)
-		aspeed_video_free_buf(video, &video->srcs[1]);
-
-	if (video->srcs[0].size < VE_MAX_SRC_BUFFER_SIZE) {
-		if (video->srcs[0].size)
-			aspeed_video_free_buf(video, &video->srcs[0]);
-
-		if (!aspeed_video_alloc_buf(video, &video->srcs[0],
-					    VE_MAX_SRC_BUFFER_SIZE)) {
-			dev_err(video->dev,
-				"Failed to allocate source buffers\n");
-			return;
-		}
-	}
-
-	aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
-
 	do {
 		if (tries) {
 			set_current_state(TASK_INTERRUPTIBLE);
@@ -871,20 +850,14 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 
 	size *= 4;
 
-	if (size == video->srcs[0].size / 2) {
-		aspeed_video_write(video, VE_SRC1_ADDR,
-				   video->srcs[0].dma + size);
-	} else if (size == video->srcs[0].size) {
-		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
-			goto err_mem;
-
-		aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
-	} else {
-		aspeed_video_free_buf(video, &video->srcs[0]);
+	if (size != video->srcs[0].size) {
+		if (video->srcs[0].size)
+			aspeed_video_free_buf(video, &video->srcs[0]);
+		if (video->srcs[1].size)
+			aspeed_video_free_buf(video, &video->srcs[1]);
 
 		if (!aspeed_video_alloc_buf(video, &video->srcs[0], size))
 			goto err_mem;
-
 		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
 			goto err_mem;
 
-- 
2.21.0

