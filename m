Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA596144EA
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 09:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfEFHDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 03:03:43 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:50302 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfEFHDj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 03:03:39 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
        by Forcepoint Email with ESMTPS id AC99646E20D2C3CA686D;
        Mon,  6 May 2019 15:03:36 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl2.zte.com.cn with ESMTP id x4673RgY076284;
        Mon, 6 May 2019 15:03:27 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019050615033117-10027951 ;
          Mon, 6 May 2019 15:03:31 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Patrice Chotard <patrice.chotard@st.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] media: xilinx: fix leaked of_node references
Date:   Mon, 6 May 2019 15:05:18 +0800
Message-Id: <1557126318-21487-5-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
References: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-05-06 15:03:31,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-05-06 15:03:25,
        Serialize complete at 2019-05-06 15:03:25
X-MAIL: mse-fl2.zte.com.cn x4673RgY076284
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to of_get_child_by_name returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/xilinx/xilinx-vipp.c:487:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 477, but without a corresponding object release within this function.
drivers/media/platform/xilinx/xilinx-vipp.c:491:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 477, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/exynos4-is/fimc-is.c   | 1 +
 drivers/media/platform/exynos4-is/media-dev.c | 1 +
 drivers/media/platform/xilinx/xilinx-vipp.c   | 8 +++++---
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 02da0b0..25df4c6 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -809,6 +809,7 @@ static int fimc_is_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	is->pmu_regs = of_iomap(node, 0);
+	of_node_put(node);
 	if (!is->pmu_regs)
 		return -ENOMEM;
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 463f2d8..a31dacf 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -450,6 +450,7 @@ static int fimc_md_parse_port_node(struct fimc_md *fmd,
 	else
 		pd->fimc_bus_type = pd->sensor_bus_type;
 
+	of_node_put(np);
 	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
 		of_node_put(rem);
 		return -EINVAL;
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index edce040..307717c 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -472,7 +472,7 @@ static int xvip_graph_dma_init(struct xvip_composite_device *xdev)
 {
 	struct device_node *ports;
 	struct device_node *port;
-	int ret;
+	int ret = 0;
 
 	ports = of_get_child_by_name(xdev->dev->of_node, "ports");
 	if (ports == NULL) {
@@ -484,11 +484,13 @@ static int xvip_graph_dma_init(struct xvip_composite_device *xdev)
 		ret = xvip_graph_dma_init_one(xdev, port);
 		if (ret < 0) {
 			of_node_put(port);
-			return ret;
+			goto out_put_node;
 		}
 	}
 
-	return 0;
+out_put_node:
+	of_node_put(ports);
+	return ret;
 }
 
 static void xvip_graph_cleanup(struct xvip_composite_device *xdev)
-- 
2.9.5

