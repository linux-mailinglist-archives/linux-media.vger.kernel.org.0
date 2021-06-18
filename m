Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B343AC54F
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 09:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhFRHzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 03:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbhFRHzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 03:55:02 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9D7C06175F
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 00:52:53 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x16so7043320pfa.13
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 00:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L8OKyprPY2rDRqkqLmM7d7WYdlS5t72c+nsxNHtoU2E=;
        b=iyzQ3QQwM0R7ZeqEnegewwLjDYcDYOEH2bXGWWM3zne3XkEYPfXtWFxCJmeBKxh+6F
         v5+QuZck+gF4q6rV5w+wuCKnQGDSmrKj5B8vSTV5Kr7/FO3DkGmG5T0WWYmmxPoXbIm1
         RlHUUyoOn3sp10iUOhfSG0tZWNeM3k0FEDjww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L8OKyprPY2rDRqkqLmM7d7WYdlS5t72c+nsxNHtoU2E=;
        b=fV1dZ9SVOS4vwhprekspdaDKfqiQC97AN8BQurriBS8BNJLAHBhzin7p/Fxj2DtKz3
         0Sxds2/ZoRYAYkAIj6IxhCgaHF4Vbx6QEyA7zDIW/VumfCRRob+WAZW5h5ylgFy8q9py
         S1ZP/czkEXaBEhYUahUkE+dVbLtQ+wY7jdYv2aZ6UbJXkkOdHyYAPMpySgn+HDZYEoxF
         yKQ/MIlL7vAvmJbLXl22H3mVoaQCT70jrqU1RyDXhY4wMZX+cbAB8SpArR4p04dJR7Ar
         CPEePXeOZlfJQSQI6CazQFg584ioZy6dTXQv9FEcALHNcTJN8X5PNkgWU7f4hF44BbNP
         xbhA==
X-Gm-Message-State: AOAM5314xN2m+MKY8gDEgqdC/0ySdRsUl8adANH6wjiLPgXMqdafRdBh
        gPBIpm/tFhlKPeHxz7QhSLi5yQ==
X-Google-Smtp-Source: ABdhPJx53XMVqGMgoUjueP0KEUl61V76I4GK2OfAUIShXER+0Jjv5ntmNXqfV26D6KRNE/rhqocVjA==
X-Received: by 2002:a05:6a00:24c1:b029:300:5de4:5907 with SMTP id d1-20020a056a0024c1b02903005de45907mr917987pfv.56.1624002772810;
        Fri, 18 Jun 2021 00:52:52 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
        by smtp.gmail.com with UTF8SMTPSA id t1sm6924233pfe.61.2021.06.18.00.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 00:52:52 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     yong.wu@mediatek.com, houlong.wei@mediatek.com,
        enric.balletbo@collabora.com, chunkuang.hu@kernel.org,
        wenst@chromium.org, Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/8] mtk-mdp: soc: mediatek: register mdp from mmsys
Date:   Fri, 18 Jun 2021 17:52:05 +1000
Message-Id: <20210618175059.v3.4.I1245257d5a940967f51caaaee30259bfc034c786@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618075209.1157766-1-eizan@chromium.org>
References: <20210618075209.1157766-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather than hanging the MDP master component driver off of the rdma0
device, create a "virtual" device by the mmsys driver instead which is
probed by the mtk_mdp_core driver.

Broadly, four interdependent things are done by this change:
- A virtual device that is probed by the mtk_mdp_core driver is
  instantiated by the mtk_mmsys driver.
- Presence of a mediatek,vpu property in a child node to the mmsys
  device node is used to determine what device to use when dispatching
  dma ops from the relevant ioctl.
- v4l-related setup is moved into from the mtk_mdp_core driver to the
  mtk_mdp_comp driver.

(am from https://patchwork.kernel.org/patch/12195523/)
(also found at https://lore.kernel.org/r/20210410091128.31823-15-yong.wu@mediatek.com)

Conflicts:
   drivers/memory/mtk-smi.c

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

(am from https://patchwork.kernel.org/patch/12195507/)
(also found at https://lore.kernel.org/r/20210410091128.31823-13-yong.wu@mediatek.com)

(am from https://patchwork.kernel.org/patch/12195485/)
(also found at https://lore.kernel.org/r/20210410091128.31823-5-yong.wu@mediatek.com)

Conflicts:
   drivers/memory/mtk-smi.c

(am from https://patchwork.kernel.org/patch/12195481/)
(also found at https://lore.kernel.org/r/20210410091128.31823-3-yong.wu@mediatek.com)

(am from https://patchwork.kernel.org/patch/12195479/)
(also found at https://lore.kernel.org/r/20210410091128.31823-2-yong.wu@mediatek.com)

(am from https://patchwork.kernel.org/patch/12195479/)
(also found at https://lore.kernel.org/r/20210410091128.31823-2-yong.wu@mediatek.com)

---

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
 drivers/soc/mediatek/mtk-mmsys.c              | 20 +++++-
 5 files changed, 79 insertions(+), 60 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 9a12717ce416..fdbb46a5330a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -104,8 +104,45 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
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
@@ -160,23 +197,9 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
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
index 5e71496e2517..267e4cb4bf32 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -121,6 +121,17 @@ static int mtk_mdp_master_bind(struct device *dev)
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
@@ -133,6 +144,8 @@ static int mtk_mdp_master_bind(struct device *dev)
 	return 0;
 
 err_mtk_mdp_register_m2m_device:
+
+err_wdt_reg:
 	component_unbind_all(dev, mdp);
 
 err_component_bind_all:
@@ -191,8 +204,13 @@ static int mtk_mdp_probe(struct platform_device *pdev)
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
@@ -225,16 +243,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
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
@@ -250,29 +258,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
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
@@ -284,22 +271,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
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
@@ -371,7 +348,6 @@ static struct platform_driver mtk_mdp_driver = {
 	.driver = {
 		.name	= MTK_MDP_MODULE_NAME,
 		.pm	= &mtk_mdp_pm_ops,
-		.of_match_table = mtk_mdp_of_ids,
 	}
 };
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
index 230f531400ca..78c3c77cd226 100644
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
index 93c9df15084a..a7051d48ea32 100644
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
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 79e55150210e..e518ea5d0694 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -90,6 +90,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct platform_device *clks;
 	struct platform_device *drm;
 	struct mtk_mmsys *mmsys;
+	struct platform_device *mdp;
 	int ret;
 
 	mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
@@ -115,10 +116,27 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 					    PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(drm)) {
 		platform_device_unregister(clks);
-		return PTR_ERR(drm);
+		ret = PTR_ERR(drm);
+		goto err_drm;
+	}
+
+	mdp = platform_device_register_data(&pdev->dev, "mtk-mdp",
+					    PLATFORM_DEVID_AUTO, NULL, 0);
+	if (IS_ERR(mdp)) {
+		ret = PTR_ERR(mdp);
+		dev_err(dev, "Failed to register mdp: %d\n", ret);
+		goto err_mdp;
 	}
 
 	return 0;
+
+err_mdp:
+	platform_device_unregister(drm);
+
+err_drm:
+	platform_device_unregister(clks);
+
+	return ret;
 }
 
 static const struct of_device_id of_match_mtk_mmsys[] = {
-- 
2.32.0.288.g62a8d224e6-goog

