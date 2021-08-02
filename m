Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BBE3DD564
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 14:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhHBMNQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 08:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbhHBMNP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 08:13:15 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34B1C0613D5
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 05:13:05 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j1so24887349pjv.3
        for <linux-media@vger.kernel.org>; Mon, 02 Aug 2021 05:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B785Zqy1TAAD5y33P7L0xAGDKCH9+Gd3Q5ZCXvE+Xgg=;
        b=nG9o5eHn7eElaBxQkWRS3Tmc3VEPaOALY8du5eobEwo3GIASWE6N5dX47QCyoVA01C
         dlak2htAr9QABwIL6tEfyNoELJXM7msE20VrgoF0359pN9Bs2Vph4HDnGHRRuNVYQLqO
         3jy1nqOPj2VAovCeyXd/OXYk+qhiA62jB+VEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B785Zqy1TAAD5y33P7L0xAGDKCH9+Gd3Q5ZCXvE+Xgg=;
        b=ZKe7uSYjgG72GEkFfE+rdMugZFn0TLE6eB2BqwOm56MBGpbg7XXMGL25NN5QUUEDQQ
         7p8CLDoGLhqQLjKdbi2bvK4hu0vqrzWCB2MmafM3cn/RtsNFa0a8Xl7FAdlZKPFqKYRh
         1o8TJ1l+58bZBi/EMGCxG6Ze1RIKd6YpBlERu4fJGZuSSjBPwcaAltf7zyKt0YkRJxxE
         M6plICsu3GuQi80Emf6PhdF6TgzDzvWm8S0DIgm4LP87LveMn6c6XhbmJ7T5xp+Bf5Qn
         /3/zQx6Ih9WtPm1StnSS9eC+k+mJyPUPhXMnOjmuzwBLDE4NL60BmPJaSAFJq9y20sVV
         J+qA==
X-Gm-Message-State: AOAM533nPCWJkl8ciFNt0GFFLgW6pyom0hBf2uTUCvONgSFZXqR/3vYR
        Kxv2aLQTIq6S/N/6iqf3P84ZRw==
X-Google-Smtp-Source: ABdhPJySSJn3ZEFSWk4L+Rk1m6eeyIpdv8Cc/Qz+rkyBGSQom6cOC2Bw7xMVq1jgKcdrA5kWR+w8NA==
X-Received: by 2002:a17:90b:153:: with SMTP id em19mr17770419pjb.158.1627906385400;
        Mon, 02 Aug 2021 05:13:05 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
        by smtp.gmail.com with UTF8SMTPSA id n33sm12980186pgm.55.2021.08.02.05.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 05:13:05 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        chunkuang.hu@kernel.org, Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v6 5/9] mtk-mdp: make mdp driver to be loadable by platform_device_register*()
Date:   Mon,  2 Aug 2021 22:12:11 +1000
Message-Id: <20210802220943.v6.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
References: <20210802121215.703023-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather than hanging the MDP master component driver off of the rdma0
device, make it possible too create a "virtual" device by registering
it with platform_device_register_*() to be probed by the mtk_mdp_core
driver.

Broadly, three interdependent things are done by this change:
- Make it is possible to search for MDP devices in the device tree
  through the grandparent device's of_node.
- v4l-related setup is moved into from the mtk_mdp_core driver to the
  mtk_mdp_comp driver.
- Presence of a mediatek,vpu property in an MDP component device node
  is used to determine what device to use when dispatching DMA ops from
  the relevant ioctl, and also do V4L2 initialization in this case.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

Changes in v6:
- Don't propagate errors from clock_on/off as an afterthought.
- Split apart modifying mdp driver to be loadable from mmsys from
  actually loading it from mmsys into two changs to make review easier.
- Update devicetree bindings to reflect no longer needing the
  mediatek,vpu property in the mdp_rdma0 device node.
- Some stylistic cleanups.

Changes in v5:
- rebase and test on 5.13-next @ e2f74b13dbe6

Changes in v4:
- rebase and test on 5.13
- don't depend on https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873

Changes in v3:
- get mdp master from aliases instead of strcmp against of_node->name

Changes in v2:
- rebased onto Linux 5.12
- 100 char line length allowance was utilized in a few places
- Removal of a redundant dev_err() print at the end of
  mtk_mdp_comp_init()
- Instead of printing errors and ignoring them, I've added a patch to
  correctly propagate them.
- Use of C style comments.
- Three additional patches were added to eliminate dependency on the
  mediatek,vpu property inside the mdp_rdma0 device node.

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 51 ++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++-------------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |  2 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  4 +-
 4 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 7b6c8a3f3455..85ef274841a3 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -155,8 +155,45 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *da
 {
 	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
 	struct mtk_mdp_dev *mdp = data;
+	struct device_node *vpu_node;
 
 	mtk_mdp_register_component(mdp, comp);
+
+	/*
+	 * If this component has a "mediatek-vpu" property, it is responsible for
+	 * notifying the mdp master driver about it so it can be further initialized
+	 * later.
+	 */
+	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
+	if (vpu_node) {
+		int ret;
+
+		mdp->vpu_dev = of_find_device_by_node(vpu_node);
+		if (WARN_ON(!mdp->vpu_dev)) {
+			dev_err(dev, "vpu pdev failed\n");
+			of_node_put(vpu_node);
+		}
+
+		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
+		if (ret) {
+			dev_err(dev, "Failed to register v4l2 device\n");
+			return -EINVAL;
+		}
+
+		ret = vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err(dev, "Failed to set vb2 dma mag seg size\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * presence of the "mediatek,vpu" property in a device node
+		 * indicates that it is the primary MDP rdma device and MDP DMA
+		 * ops should be handled by its DMA callbacks.
+		 */
+		mdp->rdma_dev = dev;
+	}
+
 	pm_runtime_enable(dev);
 
 	return 0;
@@ -237,23 +274,9 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 static int mtk_mdp_comp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *vpu_node;
 	int status;
 	struct mtk_mdp_comp *comp;
 
-	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
-	if (vpu_node) {
-		of_node_put(vpu_node);
-		/*
-		 * The device tree node with a mediatek,vpu property is deemed
-		 * the MDP "master" device, we don't want to add a component
-		 * for it in this function because the initialization for the
-		 * master is done elsewhere.
-		 */
-		dev_info(dev, "vpu node found, not probing\n");
-		return -ENODEV;
-	}
-
 	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index a72a9ba41ea6..50eafcc9993d 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -159,6 +159,17 @@ static int mtk_mdp_master_bind(struct device *dev)
 		goto err_component_bind_all;
 	}
 
+	if (mdp->vpu_dev) {
+		int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
+					  VPU_RST_MDP);
+		if (ret) {
+			dev_err(dev, "Failed to register reset handler\n");
+			goto err_wdt_reg;
+		}
+	} else {
+		dev_err(dev, "no vpu_dev found\n");
+	}
+
 	status = mtk_mdp_register_m2m_device(mdp);
 	if (status) {
 		dev_err(dev, "Failed to register m2m device: %d\n", status);
@@ -170,6 +181,8 @@ static int mtk_mdp_master_bind(struct device *dev)
 	return 0;
 
 err_mtk_mdp_register_m2m_device:
+
+err_wdt_reg:
 	component_unbind_all(dev, mdp);
 
 err_component_bind_all:
@@ -228,8 +241,13 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		of_node_put(node);
 		parent = dev->of_node;
 		dev_warn(dev, "device tree is out of date\n");
-	} else {
+	} else if (dev->of_node) {
 		parent = dev->of_node->parent;
+	} else if (dev->parent) {
+		/* maybe we were created from a call to platform_device_register_data() */
+		parent = dev->parent->parent->of_node;
+	} else {
+		return -ENODEV;
 	}
 
 	/* Iterate over sibling MDP function blocks */
@@ -262,16 +280,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		}
 	}
 
-	/*
-	 * Create a component for myself so that clocks can be toggled in
-	 * clock_on().
-	 */
-	ret = mtk_mdp_comp_init(&mdp->comp_self, dev);
-	if (ret) {
-		dev_err(dev, "Failed to initialize component\n");
-		goto err_comp;
-	}
-
 	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
 	if (!mdp->job_wq) {
 		dev_err(&pdev->dev, "unable to alloc job workqueue\n");
@@ -287,29 +295,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 	INIT_WORK(&mdp->wdt_work, mtk_mdp_wdt_worker);
 
-	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register v4l2 device\n");
-		ret = -EINVAL;
-		goto err_dev_register;
-	}
-
-	mdp->vpu_dev = vpu_get_plat_device(pdev);
-	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
-				  VPU_RST_MDP);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_wdt_reg;
-	}
-
 	platform_set_drvdata(pdev, mdp);
 
-	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_set_max_seg_size;
-	}
-
 	ret = component_master_add_with_match(dev, &mtk_mdp_com_ops, match);
 	if (ret) {
 		dev_err(dev, "Component master add failed\n");
@@ -321,22 +308,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	return 0;
 
 err_component_master_add:
-	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
-
-err_set_max_seg_size:
-
-err_wdt_reg:
-	v4l2_device_unregister(&mdp->v4l2_dev);
-
-err_dev_register:
 	destroy_workqueue(mdp->wdt_wq);
 
 err_alloc_wdt_wq:
 	destroy_workqueue(mdp->job_wq);
 
 err_alloc_job_wq:
-
-err_comp:
 	dev_dbg(dev, "err %d\n", ret);
 	return ret;
 }
@@ -404,7 +381,6 @@ static struct platform_driver mtk_mdp_driver = {
 	.driver = {
 		.name	= MTK_MDP_MODULE_NAME,
 		.pm	= &mtk_mdp_pm_ops,
-		.of_match_table = mtk_mdp_of_ids,
 	}
 };
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
index 8a52539b15d4..9fcd8b8e7c25 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
@@ -133,6 +133,7 @@ struct mtk_mdp_variant {
  * struct mtk_mdp_dev - abstraction for image processor entity
  * @lock:	the mutex protecting this data structure
  * @vpulock:	the mutex protecting the communication with VPU
+ * @rdma_dev:  device pointer to rdma device for MDP
  * @pdev:	pointer to the image processor platform device
  * @variant:	the IP variant information
  * @id:		image processor device index (0..MTK_MDP_MAX_DEVS)
@@ -151,6 +152,7 @@ struct mtk_mdp_variant {
 struct mtk_mdp_dev {
 	struct mutex			lock;
 	struct mutex			vpulock;
+	struct device			*rdma_dev;
 	struct platform_device		*pdev;
 	struct mtk_mdp_variant		*variant;
 	u16				id;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index f14779e7596e..9834d3bbe851 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -929,7 +929,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
-	src_vq->dev = &ctx->mdp_dev->pdev->dev;
+	src_vq->dev = ctx->mdp_dev->rdma_dev;
 	src_vq->lock = &ctx->mdp_dev->lock;
 
 	ret = vb2_queue_init(src_vq);
@@ -944,7 +944,7 @@ static int mtk_mdp_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
-	dst_vq->dev = &ctx->mdp_dev->pdev->dev;
+	dst_vq->dev = ctx->mdp_dev->rdma_dev;
 	dst_vq->lock = &ctx->mdp_dev->lock;
 
 	return vb2_queue_init(dst_vq);
-- 
2.32.0.554.ge1b32706d8-goog

