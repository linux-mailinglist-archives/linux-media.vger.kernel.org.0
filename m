Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8475648DA20
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 15:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbiAMOvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 09:51:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbiAMOvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 09:51:09 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2108C06161C
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 06:51:08 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 57627101C2F; Thu, 13 Jan 2022 14:51:07 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: lirc: simplify gap calculation
Date:   Thu, 13 Jan 2022 14:51:07 +0000
Message-Id: <20220113145107.181211-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a driver reports a timeout, no more IR activity will be reported
until the next pulse. A space is inserted between the timeout and the
next pulse, based on ktime.

The timeout reports already a duration, so this duration should not be
added to the gap. Otherwise there is no change to the functionality.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/lirc_dev.c | 19 ++++++-------------
 include/media/rc-core.h     |  6 +-----
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index c7c5157725f8..a080291c4b06 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -60,32 +60,25 @@ void lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 
 	/* Packet end */
 	} else if (ev.timeout) {
-		if (dev->gap)
-			return;
-
 		dev->gap_start = ktime_get();
-		dev->gap = true;
-		dev->gap_duration = ev.duration;
 
 		sample = LIRC_TIMEOUT(ev.duration);
 		dev_dbg(&dev->dev, "timeout report (duration: %d)\n", sample);
 
 	/* Normal sample */
 	} else {
-		if (dev->gap) {
-			dev->gap_duration += ktime_to_us(ktime_sub(ktime_get(),
-							 dev->gap_start));
+		if (dev->gap_start) {
+			u64 duration = ktime_us_delta(ktime_get(),
+						      dev->gap_start);
 
 			/* Cap by LIRC_VALUE_MASK */
-			dev->gap_duration = min_t(u64, dev->gap_duration,
-						  LIRC_VALUE_MASK);
+			duration = min_t(u64, duration, LIRC_VALUE_MASK);
 
 			spin_lock_irqsave(&dev->lirc_fh_lock, flags);
 			list_for_each_entry(fh, &dev->lirc_fh, list)
-				kfifo_put(&fh->rawir,
-					  LIRC_SPACE(dev->gap_duration));
+				kfifo_put(&fh->rawir, LIRC_SPACE(duration));
 			spin_unlock_irqrestore(&dev->lirc_fh_lock, flags);
-			dev->gap = false;
+			dev->gap_start = 0;
 		}
 
 		sample = ev.pulse ? LIRC_PULSE(ev.duration) :
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index ab9d3b7cd799..33b3f7fcf92e 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -130,9 +130,7 @@ struct lirc_fh {
  * @tx_resolution: resolution (in us) of output sampler
  * @lirc_dev: lirc device
  * @lirc_cdev: lirc char cdev
- * @gap_start: time when gap starts
- * @gap_duration: duration of initial gap
- * @gap: true if we're in a gap
+ * @gap_start: start time for gap after timeout if non-zero
  * @lirc_fh_lock: protects lirc_fh list
  * @lirc_fh: list of open files
  * @registered: set to true by rc_register_device(), false by
@@ -201,8 +199,6 @@ struct rc_dev {
 	struct device			lirc_dev;
 	struct cdev			lirc_cdev;
 	ktime_t				gap_start;
-	u64				gap_duration;
-	bool				gap;
 	spinlock_t			lirc_fh_lock;
 	struct list_head		lirc_fh;
 #endif
-- 
2.34.1

