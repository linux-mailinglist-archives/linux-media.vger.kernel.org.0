Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 866BD12272
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 21:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfEBTN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 15:13:28 -0400
Received: from mga06.intel.com ([134.134.136.31]:21537 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbfEBTN2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 15:13:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 May 2019 12:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; 
   d="scan'208";a="154234042"
Received: from maru.jf.intel.com ([10.54.51.75])
  by FMSMGA003.fm.intel.com with ESMTP; 02 May 2019 12:13:27 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 7/7] media: aspeed: refine interrupt handling logic
Date:   Thu,  2 May 2019 12:13:17 -0700
Message-Id: <20190502191317.29698-8-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are cases that interrupt bits are cleared by a 500ms delayed
work which causes unnecessary irq calls. Also, the current
interrupt handler returns IRQ_HANDLED always but it should return
IRQ_NONE if there is any unhandled interrupt. So this commit
refines the interrupt handling logic to fix these issues.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/media/platform/aspeed-video.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 8d0bb395e46d..98944a911998 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -488,6 +488,7 @@ static void aspeed_video_off(struct aspeed_video *video)
 
 	/* Disable interrupts */
 	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
+	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
 
 	/* Turn off the relevant clocks */
 	clk_disable(video->vclk);
@@ -556,7 +557,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 					    VE_INTERRUPT_MODE_DETECT, 0);
 			aspeed_video_write(video, VE_INTERRUPT_STATUS,
 					   VE_INTERRUPT_MODE_DETECT);
-
+			sts &= ~VE_INTERRUPT_MODE_DETECT;
 			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
 			wake_up_interruptible_all(&video->wait);
 		} else {
@@ -601,12 +602,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 				    VE_INTERRUPT_COMP_COMPLETE, 0);
 		aspeed_video_write(video, VE_INTERRUPT_STATUS,
 				   VE_INTERRUPT_COMP_COMPLETE);
-
+		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
 		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
 			aspeed_video_start_frame(video);
 	}
 
-	return IRQ_HANDLED;
+	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
 static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
-- 
2.21.0

