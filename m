Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9826B8F96D
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 05:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfHPDZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 23:25:36 -0400
Received: from mga01.intel.com ([192.55.52.88]:58419 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfHPDZf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 23:25:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 20:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="184800513"
Received: from ipu5-build.bj.intel.com ([10.238.232.193])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2019 20:25:33 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, tfiga@chromium.org,
        andy.yeh@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com
Subject: [PATCH] media: staging: imgu: make imgu work on low frequency for low input
Date:   Fri, 16 Aug 2019 11:33:39 +0800
Message-Id: <1565926419-2228-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Currently, imgu is working on 450MHz for all cases, however
in some cases (input frame less than 2.3MP), the imgu
did not need work in high frequency.
This patch make imgu work on 200MHz if the imgu input
frame is less than 2.3MP to save power.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu3/ipu3-css.c  | 7 ++++---
 drivers/staging/media/ipu3/ipu3-css.h  | 3 ++-
 drivers/staging/media/ipu3/ipu3-v4l2.c | 6 ++++++
 drivers/staging/media/ipu3/ipu3.c      | 6 ++++--
 drivers/staging/media/ipu3/ipu3.h      | 1 +
 5 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index fd1ed84c400c..590ed7e182a6 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -210,12 +210,13 @@ static int imgu_hw_wait(void __iomem *base, int reg, u32 mask, u32 cmp)
 
 /* Initialize the IPU3 CSS hardware and associated h/w blocks */
 
-int imgu_css_set_powerup(struct device *dev, void __iomem *base)
+int imgu_css_set_powerup(struct device *dev, void __iomem *base, bool low_power)
 {
-	static const unsigned int freq = 450;
+	unsigned int freq;
 	u32 pm_ctrl, state, val;
 
-	dev_dbg(dev, "%s\n", __func__);
+	freq = low_power ? 200 : 450;
+	dev_dbg(dev, "%s with freq %u\n", __func__, freq);
 	/* Clear the CSS busy signal */
 	readl(base + IMGU_REG_GP_BUSY);
 	writel(0, base + IMGU_REG_GP_BUSY);
diff --git a/drivers/staging/media/ipu3/ipu3-css.h b/drivers/staging/media/ipu3/ipu3-css.h
index 6b8bab27ab1f..882936a9dae9 100644
--- a/drivers/staging/media/ipu3/ipu3-css.h
+++ b/drivers/staging/media/ipu3/ipu3-css.h
@@ -187,7 +187,8 @@ bool imgu_css_is_streaming(struct imgu_css *css);
 bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe);
 
 /******************* css hw *******************/
-int imgu_css_set_powerup(struct device *dev, void __iomem *base);
+int imgu_css_set_powerup(struct device *dev, void __iomem *base,
+			 bool low_power);
 void imgu_css_set_powerdown(struct device *dev, void __iomem *base);
 int imgu_css_irq_ack(struct imgu_css *css);
 
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3c7ad1eed434..dcc2a0476e49 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -182,6 +182,12 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
 		fmt->format.height = clamp(fmt->format.height,
 					   IPU3_INPUT_MIN_HEIGHT,
 					   IPU3_INPUT_MAX_HEIGHT);
+
+		/* input less than 2.3MP, ask imgu to work with low freq */
+		if ((fmt->format.width * fmt->format.height) < (2048 * 1152))
+			imgu->low_power = true;
+		else
+			imgu->low_power = false;
 	}
 
 	*mf = fmt->format;
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 06a61f31ca50..d67fc0ea1ec5 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -346,7 +346,8 @@ static int imgu_powerup(struct imgu_device *imgu)
 {
 	int r;
 
-	r = imgu_css_set_powerup(&imgu->pci_dev->dev, imgu->base);
+	r = imgu_css_set_powerup(&imgu->pci_dev->dev, imgu->base,
+				 imgu->low_power);
 	if (r)
 		return r;
 
@@ -666,7 +667,8 @@ static int imgu_pci_probe(struct pci_dev *pci_dev,
 	atomic_set(&imgu->qbuf_barrier, 0);
 	init_waitqueue_head(&imgu->buf_drain_wq);
 
-	r = imgu_css_set_powerup(&pci_dev->dev, imgu->base);
+	imgu->low_power = false;
+	r = imgu_css_set_powerup(&pci_dev->dev, imgu->base, imgu->low_power);
 	if (r) {
 		dev_err(&pci_dev->dev,
 			"failed to power up CSS (%d)\n", r);
diff --git a/drivers/staging/media/ipu3/ipu3.h b/drivers/staging/media/ipu3/ipu3.h
index 73b123b2b8a2..6846a6f19ef2 100644
--- a/drivers/staging/media/ipu3/ipu3.h
+++ b/drivers/staging/media/ipu3/ipu3.h
@@ -152,6 +152,7 @@ struct imgu_device {
 	bool suspend_in_stream;
 	/* Used to wait for FW buffer queue drain. */
 	wait_queue_head_t buf_drain_wq;
+	bool low_power;
 };
 
 unsigned int imgu_node_to_queue(unsigned int node);
-- 
2.7.4

