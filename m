Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64503F6F96
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 08:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239245AbhHYGfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 02:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239110AbhHYGfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 02:35:11 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6700AC0613D9
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:26 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j4-20020a17090a734400b0018f6dd1ec97so4014361pjs.3
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bc1vFqHjzCK7JAt5HQQU7hmm2RPaPxlOEZFwyTbvTwg=;
        b=JidHSnvUqdOyo3NycPJUiVSsgk9ui7s5dR3TxQMYh5OKmHtvE9T25ZD1TGv7fENtvy
         vDQQltD484BJ1S2QuAS6lmeh0ksv9NTxNE+I4Eh9Jdf86m4+qd1vSy6mYiXjqxLCLH7O
         7AuoOqTKAtxFUNOThJBlx46894O35WSCz7VBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bc1vFqHjzCK7JAt5HQQU7hmm2RPaPxlOEZFwyTbvTwg=;
        b=SiLb1hgw8QTJhrjlpEDAndt55K7T0poPqxv/vIRa616YRNF54A3J9JGw5iY0aCnT7U
         m7hdhYd6wdb5bJFUi1j6S+d9M/TolPyrNk/rXFL8Y0yubGVuMV9RpTMhkcH+90cVF41r
         ZklNkuFZnu9RuNm16N6vCq8QKh3184DhTde1KsAdiVjkZp5tbFajqyLExU5tJTW1S+Cp
         pR4NxrOk+rFPgij8MWrhBv3devPAFSARj1G3853kZTlllu1lJfMeS6z1qiG84sXZsPG+
         U04SMXOOvp5bDllVNJEG+tVyvxwsMcWw82s0/aEOVqg/7pNxjjPqVUMapylvOOPSJGvX
         9JNw==
X-Gm-Message-State: AOAM532iiOvVuoVZwHQHM3Hkcotf8nVV5j5sSWa3jYNr0bI8yUNZnGWO
        wQN2LJj7ktcaS/RoTeMu1ld8oA==
X-Google-Smtp-Source: ABdhPJzN26eiCrVV2PD3nFZJsJ55bLdIFAP+JTAb9z7owSI8OFnrr5SmkWobmLV8e4rvrj3oL1kC0g==
X-Received: by 2002:a17:902:7c15:b029:12c:78ec:bb61 with SMTP id x21-20020a1709027c15b029012c78ecbb61mr36982899pll.61.1629873265910;
        Tue, 24 Aug 2021 23:34:25 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
        by smtp.gmail.com with UTF8SMTPSA id pj14sm3987939pjb.35.2021.08.24.23.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 23:34:25 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     chunkuang.hu@kernel.org, yong.wu@mediatek.com, wenst@chromium.org,
        ck.hu@mediatek.com, houlong.wei@mediatek.com,
        enric.balletbo@collabora.com, yongqiang.niu@mediatek.com,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v7 5/7] mtk-mdp: make mdp driver to be loadable by platform_device_register*()
Date:   Wed, 25 Aug 2021 16:33:21 +1000
Message-Id: <20210825163247.v7.5.Iedb6b4f47788548b0cf7bfffae85cac917344c2f@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
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
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
---

Changes in v7:
- Drop last two changes from this series related to removing the vpu
  property from the mdp_rdma0 device node

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
2.33.0.rc2.250.ged5fa647cd-goog

