Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD118D6AB
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 16:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbfHNOy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 10:54:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50666 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfHNOy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 10:54:26 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35EB42B2;
        Wed, 14 Aug 2019 16:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565794464;
        bh=fMwkKQDP9tb51LzahulAvzJUA1ysJqumG8L71bWW+kg=;
        h=From:To:Cc:Subject:Date:From;
        b=BSMwRDTpoYFS9Y/Pee2id1AnmYSDkYOHODAPDuef8kECgSNkcV2sNjnHcgkJw4LQs
         +seMeELJbzkqm67D1mlwuz0qNY3UXLHZTUm6vaBbRzOWw5FTrBaqz3XhES2WzByMqg
         G+p2K87cU1GMN+KMwOBVuUCM6SRuDt/y0GIo1bZY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] v4l: rcar-fcp: Read IP version register at probe time
Date:   Wed, 14 Aug 2019 17:54:17 +0300
Message-Id: <20190814145417.30670-1-laurent.pinchart+renesas@ideasonboard.com>
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
Changes since v1:

- Use devm_platform_ioremap_resource()
---
 drivers/media/platform/rcar-fcp.c | 41 +++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 43c78620c9d8..6e0c0e7c0f8c 100644
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
@@ -129,6 +157,7 @@ EXPORT_SYMBOL_GPL(rcar_fcp_disable);
 static int rcar_fcp_probe(struct platform_device *pdev)
 {
 	struct rcar_fcp_device *fcp;
+	u32 version;
 
 	fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
 	if (fcp == NULL)
@@ -138,6 +167,18 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	fcp->iomem = devm_platform_ioremap_resource(pdev, 0);
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

