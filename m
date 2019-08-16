Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB3618FFCC
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 12:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfHPKMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 06:12:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:49163 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbfHPKMo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 06:12:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Aug 2019 03:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="261075209"
Received: from ipu5-build.bj.intel.com ([10.238.232.193])
  by orsmga001.jf.intel.com with ESMTP; 16 Aug 2019 03:12:42 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, tfiga@chromium.org,
        andy.yeh@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: staging: imgu: make imgu work on low frequency for low input
Date:   Fri, 16 Aug 2019 18:20:48 +0800
Message-Id: <1565950848-10076-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Currently, imgu is working on 450MHz for all cases, however
in some cases (input frame less than 2048x1152), the imgu
did not need work in high frequency.
This patch make imgu work on 200MHz if the imgu input
frame is less than 2048x1152 to save power.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu3/ipu3-css.c |  6 +++---
 drivers/staging/media/ipu3/ipu3-css.h |  3 ++-
 drivers/staging/media/ipu3/ipu3.c     | 16 ++++++++++++++--
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index fd1ed84c400c..a0002ccadbfc 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -210,12 +210,12 @@ static int imgu_hw_wait(void __iomem *base, int reg, u32 mask, u32 cmp)
 
 /* Initialize the IPU3 CSS hardware and associated h/w blocks */
 
-int imgu_css_set_powerup(struct device *dev, void __iomem *base)
+int imgu_css_set_powerup(struct device *dev, void __iomem *base,
+			 unsigned int freq)
 {
-	static const unsigned int freq = 450;
 	u32 pm_ctrl, state, val;
 
-	dev_dbg(dev, "%s\n", __func__);
+	dev_dbg(dev, "%s with freq %u\n", __func__, freq);
 	/* Clear the CSS busy signal */
 	readl(base + IMGU_REG_GP_BUSY);
 	writel(0, base + IMGU_REG_GP_BUSY);
diff --git a/drivers/staging/media/ipu3/ipu3-css.h b/drivers/staging/media/ipu3/ipu3-css.h
index 6b8bab27ab1f..6108a068b228 100644
--- a/drivers/staging/media/ipu3/ipu3-css.h
+++ b/drivers/staging/media/ipu3/ipu3-css.h
@@ -187,7 +187,8 @@ bool imgu_css_is_streaming(struct imgu_css *css);
 bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe);
 
 /******************* css hw *******************/
-int imgu_css_set_powerup(struct device *dev, void __iomem *base);
+int imgu_css_set_powerup(struct device *dev, void __iomem *base,
+			 unsigned int freq);
 void imgu_css_set_powerdown(struct device *dev, void __iomem *base);
 int imgu_css_irq_ack(struct imgu_css *css);
 
diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 06a61f31ca50..4d53aad31483 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -345,8 +345,20 @@ int imgu_queue_buffers(struct imgu_device *imgu, bool initial, unsigned int pipe
 static int imgu_powerup(struct imgu_device *imgu)
 {
 	int r;
+	unsigned int pipe;
+	unsigned int freq = 200;
+	struct v4l2_mbus_framefmt *fmt;
+
+	/* input larger than 2048*1152, ask imgu to work on high freq */
+	for_each_set_bit(pipe, imgu->css.enabled_pipes, IMGU_MAX_PIPE_NUM) {
+		fmt = &imgu->imgu_pipe[pipe].nodes[IMGU_NODE_IN].pad_fmt;
+		dev_dbg(&imgu->pci_dev->dev, "pipe %u input format = %ux%u",
+			pipe, fmt->width, fmt->height);
+		if ((fmt->width * fmt->height) >= (2048 * 1152))
+			freq = 450;
+	}
 
-	r = imgu_css_set_powerup(&imgu->pci_dev->dev, imgu->base);
+	r = imgu_css_set_powerup(&imgu->pci_dev->dev, imgu->base, freq);
 	if (r)
 		return r;
 
@@ -666,7 +678,7 @@ static int imgu_pci_probe(struct pci_dev *pci_dev,
 	atomic_set(&imgu->qbuf_barrier, 0);
 	init_waitqueue_head(&imgu->buf_drain_wq);
 
-	r = imgu_css_set_powerup(&pci_dev->dev, imgu->base);
+	r = imgu_css_set_powerup(&pci_dev->dev, imgu->base, 200);
 	if (r) {
 		dev_err(&pci_dev->dev,
 			"failed to power up CSS (%d)\n", r);
-- 
2.7.4

