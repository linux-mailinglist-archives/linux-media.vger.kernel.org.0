Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1275F375DAE
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 01:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233141AbhEFXuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 19:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbhEFXuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 19:50:06 -0400
X-Greylist: delayed 484 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 06 May 2021 16:49:07 PDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5363BC061574
        for <linux-media@vger.kernel.org>; Thu,  6 May 2021 16:49:07 -0700 (PDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 74A9D57F;
        Thu,  6 May 2021 16:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1620344462;
        bh=jIaZvfkenQf1rh57M8vcem0GlDIo6IbnDC4FoRVlbJo=;
        h=From:To:Cc:Subject:Date:From;
        b=R7rM3llmUGP+0fYa8CpKS0+1h0hUeNv1FOm3hdT2UH2YTOQGi4WDA1S3gnMG7guDn
         cle+gZkQjVvE0xZGiRncJVc8oIYs4D1hvZ826qUBSCHBiBrjUaf37nNmmUpixLXF8A
         OiJYoB/0iSCorwoO77FIu3VtyXSaOxQziJji1lq8=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Zev Weiss <zev@bewilderbeest.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2] media: aspeed-video: ignore interrupts that aren't enabled
Date:   Thu,  6 May 2021 18:40:48 -0500
Message-Id: <20210506234048.3214-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As partially addressed in commit 65d270acb2d6, the ASpeed video engine
sometimes asserts interrupts that the driver hasn't enabled.  In
addition to the CAPTURE_COMPLETE and FRAME_COMPLETE interrupts
addressed in that patch, COMP_READY has also been observed.  Instead
of playing whack-a-mole with each one individually, we can instead
just blanket ignore everything we haven't explicitly enabled.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Changes since v1 [0]:
 - dropped error message
 - switched to a blanket-ignore approach as suggested by Ryan

[0] https://lore.kernel.org/linux-arm-kernel/20201215024542.18888-1-zev@bewilderbeest.net/

 drivers/media/platform/aspeed-video.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7bb6babdcade..77611c296a25 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -563,6 +563,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
 
+	/*
+	 * Hardware sometimes asserts interrupts that we haven't actually
+	 * enabled; ignore them if so.
+	 */
+	sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
+
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
 	 * re-initialize
@@ -629,16 +635,6 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 			aspeed_video_start_frame(video);
 	}
 
-	/*
-	 * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
-	 * are disabled in the VE_INTERRUPT_CTRL register so clear them to
-	 * prevent unnecessary interrupt calls.
-	 */
-	if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
-		sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
-	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
-		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
-
 	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.31.1

