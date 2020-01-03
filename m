Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 748D012F4B3
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2020 07:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgACGpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 01:45:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:37644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgACGpm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jan 2020 01:45:42 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC72B2084D;
        Fri,  3 Jan 2020 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578033940;
        bh=uTSF6E4wwyqWFXkFFslDg6+jXPOT+pfOXx94ZxAaOqo=;
        h=From:To:Cc:Subject:Date:From;
        b=Yb3/TzPTWyYXoQM41bfm2ZRmCBK65n3C29E8EUgXMauc7zHjjQn3jeQoXPaAPktG2
         bnOU0GR+9Ic/PS1Ki/5+TrwlczvGcH+RjGIHVytZvcykRn1CTu7GdLrvlh7XYl4Z2+
         dIoU00t/wPvEqH0qHuS0T4MDaHxPJeiAHxlPOj88=
Received: by wens.tw (Postfix, from userid 1000)
        id 6447B5FC7C; Fri,  3 Jan 2020 14:45:38 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: sun4i-csi: Add support for A10 CSI1 camera sensor interface
Date:   Fri,  3 Jan 2020 14:45:33 +0800
Message-Id: <20200103064533.14864-1-wens@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The A10/A20 Allwinner SoCs have two camera sensor interface blocks,
named CSI0 and CSI1. The two have the same register layouts with
slightly different features:

  - CSI0 has an image signal processor (ISP); CSI1 doesn't

  - CSI0 can support up to four separate channels under CCIR656;
    CSI1 can only support one

  - CSI0 can support up to 16-bit wide bus with YUV422;
    CSI1 can support up to 24-bit wide bus with YUV444

For now the driver doesn't support wide busses, nor CCIR656. So the
only relevant difference is whether a clock needs to be taken and
enabled for the ISP.

Add structs to record the differences, tie them to the compatible
strings, and deal with the ISP clock. Support for the new CSI1
hardware block is added as well.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Hi Sakari,

As requested, v2 of patch 6 from the "media: sun4i-csi: A10/A20 CSI1
and R40 CSI0 support" patch series.

Changes since v1:

   - make traits structures static const

Thanks
---
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 35 ++++++++++++++++---
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  2 ++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index b8b07c1de2a8..eff34ded6305 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -29,6 +29,12 @@
 
 #include "sun4i_csi.h"
 
+struct sun4i_csi_traits {
+	unsigned int channels;
+	unsigned int max_width;
+	bool has_isp;
+};
+
 static const struct media_entity_operations sun4i_csi_video_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
@@ -156,6 +162,10 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	subdev = &csi->subdev;
 	vdev = &csi->vdev;
 
+	csi->traits = of_device_get_match_data(&pdev->dev);
+	if (!csi->traits)
+		return -EINVAL;
+
 	/*
 	 * On Allwinner SoCs, some high memory bandwidth devices do DMA
 	 * directly over the memory bus (called MBUS), instead of the
@@ -199,10 +209,12 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 		return PTR_ERR(csi->bus_clk);
 	}
 
-	csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
-	if (IS_ERR(csi->isp_clk)) {
-		dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
-		return PTR_ERR(csi->isp_clk);
+	if (csi->traits->has_isp) {
+		csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
+		if (IS_ERR(csi->isp_clk)) {
+			dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
+			return PTR_ERR(csi->isp_clk);
+		}
 	}
 
 	csi->ram_clk = devm_clk_get(&pdev->dev, "ram");
@@ -280,8 +292,21 @@ static int sun4i_csi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sun4i_csi_traits sun4i_a10_csi1_traits = {
+	.channels = 1,
+	.max_width = 24,
+	.has_isp = false,
+};
+
+static const struct sun4i_csi_traits sun7i_a20_csi0_traits = {
+	.channels = 4,
+	.max_width = 16,
+	.has_isp = true,
+};
+
 static const struct of_device_id sun4i_csi_of_match[] = {
-	{ .compatible = "allwinner,sun7i-a20-csi0" },
+	{ .compatible = "allwinner,sun4i-a10-csi1", .data = &sun4i_a10_csi1_traits },
+	{ .compatible = "allwinner,sun7i-a20-csi0", .data = &sun7i_a20_csi0_traits },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_csi_of_match);
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index 88d39b3554c4..0f67ff652c2e 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -108,6 +108,8 @@ struct sun4i_csi {
 	/* Device resources */
 	struct device			*dev;
 
+	const struct sun4i_csi_traits	*traits;
+
 	void __iomem			*regs;
 	struct clk			*bus_clk;
 	struct clk			*isp_clk;
-- 
2.24.1

