Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF6D55B6DD
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbfGAIcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:32:22 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:44382 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbfGAIcW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jul 2019 04:32:22 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
        by Forcepoint Email with ESMTPS id 1EE92B6253C01713E467;
        Mon,  1 Jul 2019 16:32:20 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl1.zte.com.cn with ESMTP id x618VHUq005456;
        Mon, 1 Jul 2019 16:31:17 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019070116312262-1999000 ;
          Mon, 1 Jul 2019 16:31:22 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn,
        cheng.shengyu@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Patrice Chotard <patrice.chotard@st.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: xilinx: fix leaked of_node references
Date:   Mon, 1 Jul 2019 16:29:51 +0800
Message-Id: <1561969791-34369-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-07-01 16:31:22,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-01 16:31:19,
        Serialize complete at 2019-07-01 16:31:19
X-MAIL: mse-fl1.zte.com.cn x618VHUq005456
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
drivers/media/platform/xilinx/xilinx-tpg.c:732:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 717, but without a corresponding object release within this function.
drivers/media/platform/xilinx/xilinx-tpg.c:741:3-9: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 717, but without a corresponding object release within this function.
drivers/media/platform/xilinx/xilinx-tpg.c:757:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 717, but without a corresponding object release within this function.
drivers/media/platform/xilinx/xilinx-tpg.c:764:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 717, but without a corresponding object release within this function.

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
v2: fix Comparison to NULL

 drivers/media/platform/xilinx/xilinx-tpg.c  | 18 +++++++++++++-----
 drivers/media/platform/xilinx/xilinx-vipp.c |  8 +++++---
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index ed01bed..e71d022 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -713,10 +713,13 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 	struct device_node *port;
 	unsigned int nports = 0;
 	bool has_endpoint = false;
+	int ret = 0;
 
 	ports = of_get_child_by_name(node, "ports");
-	if (ports == NULL)
+	if (!ports) {
 		ports = node;
+		of_node_get(ports);
+	}
 
 	for_each_child_of_node(ports, port) {
 		const struct xvip_video_format *format;
@@ -729,7 +732,8 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		if (IS_ERR(format)) {
 			dev_err(dev, "invalid format in DT");
 			of_node_put(port);
-			return PTR_ERR(format);
+			ret = PTR_ERR(format);
+			goto out_put_node;
 		}
 
 		/* Get and check the format description */
@@ -738,7 +742,8 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		} else if (xtpg->vip_format != format) {
 			dev_err(dev, "in/out format mismatch in DT");
 			of_node_put(port);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_put_node;
 		}
 
 		if (nports == 0) {
@@ -754,14 +759,17 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 
 	if (nports != 1 && nports != 2) {
 		dev_err(dev, "invalid number of ports %u\n", nports);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_put_node;
 	}
 
 	xtpg->npads = nports;
 	if (nports == 2 && has_endpoint)
 		xtpg->has_input = true;
 
-	return 0;
+out_put_node:
+	of_node_put(ports);
+	return ret;
 }
 
 static int xtpg_probe(struct platform_device *pdev)
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

