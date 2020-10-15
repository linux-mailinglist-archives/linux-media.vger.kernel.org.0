Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B811F28FB82
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 01:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387422AbgJOXOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 19:14:36 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:46490 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731189AbgJOXOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 19:14:31 -0400
X-Halon-ID: 25deee0c-0f3c-11eb-9f83-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2fef.dip0.t-ipconnect.de [79.202.47.239])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 25deee0c-0f3c-11eb-9f83-005056917a89;
        Fri, 16 Oct 2020 01:14:17 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/5] rcar-vin: Add support for suspend and resume
Date:   Fri, 16 Oct 2020 01:14:08 +0200
Message-Id: <20201015231408.2399933-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for suspend and resume by stopping and starting the video
pipeline while still retaining all buffers given to the driver by
user-space and internally allocated ones, this gives the application a
seamless experience.

Buffers are never returned to user-space unprocessed so user-space don't
notice when suspending. When resuming the driver restarts the capture
session using the internal scratch buffer, this happens before
user-space is unfrozen, this leads to speedy response times once the
application resumes its execution.

As the entire pipeline is stopped on suspend all subdevices in use are
also stopped, and if they enter a shutdown state when not streaming
(such as the R-Car CSI-2 driver) they too will be suspended and resumed
in sync with the VIN driver.

To be able to do keep track of which VINs should be resumed a new
internal state SUSPENDED is added to recode this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 51 +++++++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-vin.h  | 10 ++--
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 34d003e0e9b9c25a..4adf4ce518f79c93 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -918,6 +918,54 @@ static int rvin_mc_init(struct rvin_dev *vin)
 	return ret;
 }
 
+/* -----------------------------------------------------------------------------
+ * Suspend / Resume
+ */
+
+static int __maybe_unused rvin_suspend(struct device *dev)
+{
+	struct rvin_dev *vin = dev_get_drvdata(dev);
+
+	if (vin->state != RUNNING)
+		return 0;
+
+	rvin_stop_streaming(vin);
+
+	vin->state = SUSPENDED;
+
+	return 0;
+}
+
+static int __maybe_unused rvin_resume(struct device *dev)
+{
+	struct rvin_dev *vin = dev_get_drvdata(dev);
+
+	if (vin->state != SUSPENDED)
+		return 0;
+
+	/*
+	 * Restore group master CHSEL setting.
+	 *
+	 * This needs to be by every VIN resuming not only the master
+	 * as we don't know if and in which order the master VINs will
+	 * be resumed.
+	 */
+	if (vin->info->use_mc) {
+		unsigned int master_id = rvin_group_id_to_master(vin->id);
+		struct rvin_dev *master = vin->group->vin[master_id];
+		int ret;
+
+		if (WARN_ON(!master))
+			return -ENODEV;
+
+		ret = rvin_set_channel_routing(master, master->chsel);
+		if (ret)
+			return ret;
+	}
+
+	return rvin_start_streaming(vin);
+}
+
 /* -----------------------------------------------------------------------------
  * Platform Device Driver
  */
@@ -1421,9 +1469,12 @@ static int rcar_vin_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
+
 static struct platform_driver rcar_vin_driver = {
 	.driver = {
 		.name = "rcar-vin",
+		.pm = &rvin_pm_ops,
 		.of_match_table = rvin_of_id_table,
 	},
 	.probe = rcar_vin_probe,
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 4ec8584709c847a9..4539bd53d9d41e9c 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -49,16 +49,18 @@ enum rvin_csi_id {
 };
 
 /**
- * STOPPED  - No operation in progress
- * STARTING - Capture starting up
- * RUNNING  - Operation in progress have buffers
- * STOPPING - Stopping operation
+ * STOPPED   - No operation in progress
+ * STARTING  - Capture starting up
+ * RUNNING   - Operation in progress have buffers
+ * STOPPING  - Stopping operation
+ * SUSPENDED - Capture is suspended
  */
 enum rvin_dma_state {
 	STOPPED = 0,
 	STARTING,
 	RUNNING,
 	STOPPING,
+	SUSPENDED,
 };
 
 /**
-- 
2.28.0

