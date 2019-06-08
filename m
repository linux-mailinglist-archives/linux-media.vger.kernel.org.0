Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E768439FBA
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 14:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfFHMxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 08:53:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39206 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbfFHMxu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jun 2019 08:53:50 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 002C05D;
        Sat,  8 Jun 2019 14:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559998429;
        bh=2tin5FNugJ1JEB3AB00VDlZs3fRZ9cSDSC8RDq1ctg8=;
        h=From:To:Cc:Subject:Date:From;
        b=deoBcyw6KZOAVvLza80cXC2th0OKMz86rA1ifXr7yaQl2HDKWeBukF/SFXKq0LCV0
         cBK6rPcVZA0tZfosJipfkndKnw3kEAaxqA/QKCyplr3myOyPhSn+fWY3nbiD/4xZPa
         +mYG9vBckPtawFo29gNfLNb8zCYZddlqrUAVj/jE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH] v4l: rcar-fcp: Read IP version register at probe time
Date:   Sat,  8 Jun 2019 15:53:31 +0300
Message-Id: <20190608125331.29146-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This helps identifying the IP core version, for debugging purpose only
for now.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-fcp.c | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 43c78620c9d8..e9b01965052d 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
@@ -21,11 +22,38 @@
 struct rcar_fcp_device {
 	struct list_head list;
 	struct device *dev;
+	void __iomem *iomem;
 };
 
 static LIST_HEAD(fcp_devices);
 static DEFINE_MUTEX(fcp_lock);
 
+#define FCP_VCR			0x0000
+#define FCP_VCR_CATEGORY_MASK	(0xff << 8)
+#define FCP_VCR_CATEGORY_SHIFT	8
+#define FCP_VCR_REVISION_MASK	(0xff << 0)
+#define FCP_VCR_REVISION_SHIFT	0
+
+#define FCP_CFG0		0x0004
+#define FCP_RST			0x0010
+#define FCP_STA			0x0018
+#define FCP_TL_CTRL		0x0070
+#define FCP_PICINFO1		0x00c4
+#define FCP_BA_ANC_Y0		0x0100
+#define FCP_BA_ANC_Y1		0x0104
+#define FCP_BA_ANC_Y2		0x0108
+#define FCP_BA_ANC_C		0x010c
+#define FCP_BA_REF_Y0		0x0110
+#define FCP_BA_REF_Y1		0x0114
+#define FCP_BA_REF_Y2		0x0118
+#define FCP_BA_REF_C		0x011c
+
+
+static inline u32 rcar_fcp_read(struct rcar_fcp_device *fcp, u32 reg)
+{
+	return ioread32(fcp->iomem + reg);
+}
+
 /* -----------------------------------------------------------------------------
  * Public API
  */
@@ -129,6 +157,8 @@ EXPORT_SYMBOL_GPL(rcar_fcp_disable);
 static int rcar_fcp_probe(struct platform_device *pdev)
 {
 	struct rcar_fcp_device *fcp;
+	struct resource *mem;
+	u32 version;
 
 	fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
 	if (fcp == NULL)
@@ -138,6 +168,19 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	fcp->iomem = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(fcp->iomem))
+		return PTR_ERR(fcp->iomem);
+
+	pm_runtime_get_sync(&pdev->dev);
+	version = rcar_fcp_read(fcp, FCP_VCR);
+	pm_runtime_put(&pdev->dev);
+
+	dev_dbg(&pdev->dev, "FCP category %u revision %u\n",
+		(version & FCP_VCR_CATEGORY_MASK) >> FCP_VCR_CATEGORY_SHIFT,
+		(version & FCP_VCR_REVISION_MASK) >> FCP_VCR_REVISION_SHIFT);
+
 	mutex_lock(&fcp_lock);
 	list_add_tail(&fcp->list, &fcp_devices);
 	mutex_unlock(&fcp_lock);
-- 
Regards,

Laurent Pinchart

