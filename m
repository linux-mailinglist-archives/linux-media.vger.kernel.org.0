Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A822B50F82E
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 11:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244581AbiDZJG4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 05:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347828AbiDZJGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 05:06:14 -0400
X-Greylist: delayed 521 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Apr 2022 01:46:08 PDT
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37AF163D2F;
        Tue, 26 Apr 2022 01:46:06 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 569F83C04C0;
        Tue, 26 Apr 2022 10:37:23 +0200 (CEST)
Received: from localhost.localdomain (10.72.94.34) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 26 Apr
 2022 10:37:22 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugen Friedrich <efriedrich@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [RFC] media: renesas: vsp1: Add VSPD underrun detection & tracing
Date:   Tue, 26 Apr 2022 10:37:07 +0200
Message-ID: <1650962227-14281-1-git-send-email-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.94.34]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A barely noticeable (especially if hardly reproducible) display flicker
may not be the biggest concern in the development environment. However,
an automotive OEM will not only notice it, but will also be haunted by
its phenomenon/nature till it is understood in the greatest detail and
ultimately eradicated, to avoid impairing user experience.

Troubleshooting the above without the right tools becomes a nightmare.

Since VSPD underruns may indeed cause [1] display flicker, we believe
that having a minimal/lightweight support for detecting and logging
such events would be extremely beneficial. Obviously, this only applies
to VSP2 modules having an interface to DU (i.e. not mem2mem).

This implementation is heavily inspired by Koji Matsuoka's work [2-3],
but has been refactored to hopefully become production/mainline-friendly
(the original feature is intended for the development environment only).

[1] https://lore.kernel.org/linux-renesas-soc/20220421161259.GA2660@lxhi-065
[2] https://github.com/renesas-rcar/linux-bsp/commit/3469001c3098
    ("v4l: vsp1: Add underrun hung-up workaround")
[3] https://github.com/renesas-rcar/linux-bsp/commit/12ea79975a10
    ("v4l: vsp1: Add underrun debug messege option")

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---

NOTES:

 - VSPD_MAX_NUM (4) is based on Table 32.4 in R-Car3 User's HW Manual.

 - The 'vspd_underrun' array is not fully populated, since plenty of
   SoCs have less than 4 VSPDs (3M/V3H 1 VSPD, H3N/D3/M3N/E3 2 VSPD).
   However, it is arguably the necessary trade-off to avoid:
    * unnecessarily complicated data structures
    * unnecessarily complicated user interfaces
    * kmemleak-prone dynamic allocation

 - The /sys/module/vsp1/parameters/vspd_underrun interface is chosen
   to avoid custom sysfs/debugfs interfaces (e.g. certain users may
   disable debugfs to achieve smallest possible image size).

   $ cat /sys/module/vsp1/parameters/vspd_underrun
   0,0,0,0

 - The 'vspd_underrun' module parameter is chosen as RO, to prevent
   users tampering with it and reporting inaccurate values to the
   developers/maintainers.

   $ ls -al /sys/module/vsp1/parameters/vspd_underrun
   -r--r--r-- 1 root root 4096 Apr 25 18:00 /sys/module/vsp1/parameters/vspd_underrun

 - The actual order of the 'vspd_underrun' elements reflects the VSPD
   order in 'renesas,vsps = <&vspdX 0>, <&vspdY 0>, <&vspdZ 0>';

 - dev_warn_ratelimited is chosen to prevent any potential printk storms
   (hence pollution of dmesg) from the interrupt context. If this does
   not address the concerns fully, dev_warn_once() could be used with
   guaranteed minimal impact (but also minimal logging unfortunately).

 - 100 chars per line since v5.7 commit
   bdc48fa11e46f8 ("checkpatch/coding-style: deprecate 80-column warning")

 - Any comments hugely appreciated. If possible, I kindly ask for some
   testing on R-Car Gen2 since I do not own any Gen2 boards.
   Alternatively, the feature could be easily disabled for Gen2 VSPDs.
---
 drivers/media/platform/renesas/vsp1/vsp1.h    |  1 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 34 ++++++++++++++++++-
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  2 ++
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  2 +-
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 37cf33c7e6ca..df8154267e10 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -75,6 +75,7 @@ struct vsp1_device {
 	struct device *dev;
 	const struct vsp1_device_info *info;
 	u32 version;
+	int vspd_id;
 
 	void __iomem *mmio;
 	struct rcar_fcp_device *fcp;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 502c7d9d6890..0dba9c5437f8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -38,13 +38,19 @@
 #include "vsp1_uif.h"
 #include "vsp1_video.h"
 
+#define VSPD_MAX_NUM	4
+
+static int vspd_underrun[VSPD_MAX_NUM];
+module_param_array(vspd_underrun, int, NULL, 0444);
+MODULE_PARM_DESC(vspd_underrun, "VSPD underrun counter");
+
 /* -----------------------------------------------------------------------------
  * Interrupt Handling
  */
 
 static irqreturn_t vsp1_irq_handler(int irq, void *data)
 {
-	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
+	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE | VI6_WPF_IRQ_STA_UND;
 	struct vsp1_device *vsp1 = data;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i;
@@ -63,6 +69,17 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 			vsp1_pipeline_frame_end(wpf->entity.pipe);
 			ret = IRQ_HANDLED;
 		}
+
+		if (status & VI6_WPF_IRQ_STA_UND) {
+			int id = vsp1->vspd_id;
+
+			if (id >= 0 && id < VSPD_MAX_NUM) {
+				++vspd_underrun[id];
+				dev_warn_ratelimited(vsp1->dev, "Underrun %d at VSPD%d LIF%d\n",
+						     vspd_underrun[id], id, i);
+			}
+			ret = IRQ_HANDLED;
+		}
 	}
 
 	return ret;
@@ -804,6 +821,7 @@ static int vsp1_probe(struct platform_device *pdev)
 {
 	struct vsp1_device *vsp1;
 	struct device_node *fcp_node;
+	static int vspd_id;
 	unsigned int i;
 	int ret;
 	int irq;
@@ -900,6 +918,20 @@ static int vsp1_probe(struct platform_device *pdev)
 		goto done;
 	}
 
+	switch (vsp1->version & VI6_IP_VERSION_MODEL_MASK) {
+	case VI6_IP_VERSION_MODEL_VSPD_GEN2:
+	case VI6_IP_VERSION_MODEL_VSPD_V2H:
+	case VI6_IP_VERSION_MODEL_VSPD_GEN3:
+	case VI6_IP_VERSION_MODEL_VSPD_V3:
+	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
+	case VI6_IP_VERSION_MODEL_VSPD_V3U:
+		vsp1->vspd_id = vspd_id++;
+		break;
+	default:
+		vsp1->vspd_id = -1;
+		break;
+	}
+
 done:
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index fae7286eb01e..632c43bb4cbd 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -32,10 +32,12 @@
 #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
 
 #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
+#define VI6_WPF_IRQ_ENB_UNDE		BIT(16)
 #define VI6_WPF_IRQ_ENB_DFEE		BIT(1)
 #define VI6_WPF_IRQ_ENB_FREE		BIT(0)
 
 #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
+#define VI6_WPF_IRQ_STA_UND		BIT(16)
 #define VI6_WPF_IRQ_STA_DFE		BIT(1)
 #define VI6_WPF_IRQ_STA_FRE		BIT(0)
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index 94e91d7bb56c..28f01f98fd6b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -342,7 +342,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	/* Enable interrupts. */
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
-			   VI6_WPF_IRQ_ENB_DFEE);
+			   VI6_WPF_IRQ_ENB_DFEE | VI6_WPF_IRQ_ENB_UNDE);
 
 	/*
 	 * Configure writeback for display pipelines (the wpf writeback flag is
-- 
2.36.0

