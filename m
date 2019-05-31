Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87ED93170D
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 00:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfEaWQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 18:16:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:36039 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726762AbfEaWQD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 18:16:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 15:16:02 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2019 15:16:02 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v3 07/10] media: aspeed: refine interrupt handling logic
Date:   Fri, 31 May 2019 15:15:45 -0700
Message-Id: <20190531221548.14757-8-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
References: <20190531221548.14757-1-jae.hyun.yoo@linux.intel.com>
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
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
v2 -> v3:
 None.

v1 -> v2:
 None.

 drivers/media/platform/aspeed-video.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 1cba582918cc..c0b889141b8f 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -488,6 +488,7 @@ static void aspeed_video_off(struct aspeed_video *video)
 
 	/* Disable interrupts */
 	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
+	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
 
 	/* Turn off the relevant clocks */
 	clk_disable(video->vclk);
@@ -554,7 +555,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 					    VE_INTERRUPT_MODE_DETECT, 0);
 			aspeed_video_write(video, VE_INTERRUPT_STATUS,
 					   VE_INTERRUPT_MODE_DETECT);
-
+			sts &= ~VE_INTERRUPT_MODE_DETECT;
 			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
 			wake_up_interruptible_all(&video->wait);
 		} else {
@@ -599,12 +600,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
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

