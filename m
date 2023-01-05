Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9F065EDC8
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 14:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbjAENsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 08:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233737AbjAENrr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 08:47:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64EB4BD6B
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 05:47:33 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQai-0003Qt-5e; Thu, 05 Jan 2023 14:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::48] (helo=litschi)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQah-0040Lg-Gz; Thu, 05 Jan 2023 14:47:31 +0100
Received: from mtr by litschi with local (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDQaf-000FVD-F4; Thu, 05 Jan 2023 14:47:29 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 2/8] media: imx-pxp: detect PXP version
Date:   Thu,  5 Jan 2023 14:47:23 +0100
Message-Id: <20230105134729.59542-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230105134729.59542-1-m.tretter@pengutronix.de>
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Different versions of the Pixel Pipeline have different blocks and their
routing may be different. Read the PXP_HW_VERSION register to determine
the version of the PXP and print it to the log for debugging purposes.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 689ae5e6ac62..05abe40558b0 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -10,6 +10,7 @@
  * Pawel Osciak, <pawel@osciak.com>
  * Marek Szyprowski, <m.szyprowski@samsung.com>
  */
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -52,6 +53,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
 #define MEM2MEM_HFLIP	(1 << 0)
 #define MEM2MEM_VFLIP	(1 << 1)
 
+#define PXP_VERSION_MAJOR(version) \
+	FIELD_GET(BM_PXP_VERSION_MAJOR, version)
+#define PXP_VERSION_MINOR(version) \
+	FIELD_GET(BM_PXP_VERSION_MINOR, version)
+
 #define dprintk(dev, fmt, arg...) \
 	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
 
@@ -192,6 +198,8 @@ struct pxp_dev {
 	struct clk		*clk;
 	void __iomem		*mmio;
 
+	u32			hw_version;
+
 	atomic_t		num_inst;
 	struct mutex		dev_mutex;
 	spinlock_t		irqlock;
@@ -1660,6 +1668,11 @@ static int pxp_soft_reset(struct pxp_dev *dev)
 	return 0;
 }
 
+static u32 pxp_read_version(struct pxp_dev *dev)
+{
+	return readl(dev->mmio + HW_PXP_VERSION);
+}
+
 static int pxp_probe(struct platform_device *pdev)
 {
 	struct pxp_dev *dev;
@@ -1705,6 +1718,11 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	dev->hw_version = pxp_read_version(dev);
+	dev_info(&pdev->dev, "PXP Version %d.%d\n",
+		 PXP_VERSION_MAJOR(dev->hw_version),
+		 PXP_VERSION_MINOR(dev->hw_version));
+
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret)
 		goto err_clk;
-- 
2.30.2

