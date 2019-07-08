Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F31861D8A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2019 13:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbfGHLF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jul 2019 07:05:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59983 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730245AbfGHLF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jul 2019 07:05:26 -0400
X-UUID: 26fdb437df8b42e99b9875a32bdeb66f-20190708
X-UUID: 26fdb437df8b42e99b9875a32bdeb66f-20190708
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1190052945; Mon, 08 Jul 2019 19:05:17 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 8 Jul 2019 19:05:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 8 Jul 2019 19:05:15 +0800
From:   <frederic.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <shik@chromium.org>, <suleiman@chromium.org>,
        <Allan.Yang@mediatek.com>
Subject: [RFC PATCH V2 5/6] remoteproc/mediatek: add SCP's shared dma pool support for mt8183
Date:   Mon, 8 Jul 2019 19:04:59 +0800
Message-ID: <20190708110500.7242-6-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190708110500.7242-1-frederic.chen@mediatek.com>
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Frederic Chen <frederic.chen@mediatek.com>

This patch uses of_reserved_mem_device_init_by_idx() to hook the
scp device to DMA mapping API to provide a shared dma pool of
SCP DMA buffers for SCP's client such as DIP and ISP Pass 1
drivers.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 54 ++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 4c093dec52b9..0cffe4b63dba 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -4,12 +4,14 @@
 
 #include <asm/barrier.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_data/mtk_scp.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
@@ -487,29 +489,29 @@ EXPORT_SYMBOL_GPL(scp_get_reserve_mem_size);
 
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
-	struct device_node *node;
-	struct resource r;
-	int ret;
+	int ret, id;
 
-	node = of_parse_phandle(scp->dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_err(scp->dev, "no memory-region specified\n");
-		return -EINVAL;
+	ret = of_reserved_mem_device_init_by_idx(scp->dev, scp->dev->of_node,
+						 0);
+	if (ret) {
+		dev_err(scp->dev,
+			"%s:of_reserved_mem_device_init_by_idx(0) failed:(%d)",
+			__func__, ret);
+		return -ENOMEM;
 	}
 
-	ret = of_address_to_resource(node, 0, &r);
-	if (ret)
-		return ret;
+	/* Pre-allocate the working buffers */
+	scp->dram_size = MAX_CODE_SIZE;
+	for (id = 0; id < SCP_NUMS_MEM_ID; id++)
+		scp->dram_size += scp_reserve_mblock[id].size;
 
-	scp->phys_addr = r.start;
-	scp->dram_size = resource_size(&r);
-	scp->cpu_addr =
-		devm_ioremap_wc(scp->dev, scp->phys_addr, scp->dram_size);
+	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
+					   &scp->phys_addr, GFP_KERNEL);
 
 	if (!scp->cpu_addr) {
-		dev_err(scp->dev, "unable to map memory region: %pa+%zx\n",
-			&r.start, scp->dram_size);
-		return -EBUSY;
+		dev_err(scp->dev, "unable to pre-allocate memory for SCP: %zx\n",
+			scp->dram_size);
+		return -ENOMEM;
 	}
 
 #if SCP_RESERVED_MEM
@@ -519,6 +521,13 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	return 0;
 }
 
+static void scp_unmap_memory_region(struct mtk_scp *scp)
+{
+	dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
+			  scp->phys_addr);
+	of_reserved_mem_device_release(scp->dev);
+}
+
 static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
 	.send_ipi = scp_ipi_send,
 	.register_ipi = scp_ipi_register,
@@ -594,20 +603,20 @@ static int scp_probe(struct platform_device *pdev)
 	if (IS_ERR(scp->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(scp->clk);
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	ret = clk_prepare_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	ret = scp_ipi_init(scp);
 	clk_disable_unprepare(scp->clk);
 	if (ret) {
 		dev_err(dev, "Failed to init ipi\n");
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	/* register SCP initialization IPI */
@@ -617,7 +626,7 @@ static int scp_probe(struct platform_device *pdev)
 			       scp);
 	if (ret) {
 		dev_err(dev, "Failed to register IPI_SCP_INIT\n");
-		goto free_rproc;
+		goto release_dev_mem;
 	}
 
 	mutex_init(&scp->lock);
@@ -645,6 +654,8 @@ static int scp_probe(struct platform_device *pdev)
 remove_subdev:
 	scp_remove_rpmsg_subdev(scp);
 	mutex_destroy(&scp->lock);
+release_dev_mem:
+	scp_unmap_memory_region(scp);
 free_rproc:
 	rproc_free(rproc);
 
@@ -658,6 +669,7 @@ static int scp_remove(struct platform_device *pdev)
 	scp_remove_rpmsg_subdev(scp);
 	rproc_del(scp->rproc);
 	rproc_free(scp->rproc);
+	scp_unmap_memory_region(scp);
 
 	return 0;
 }
-- 
2.18.0

