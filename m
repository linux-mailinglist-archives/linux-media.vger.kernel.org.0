Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E61C1C86A0
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 12:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgEGKZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 06:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726218AbgEGKZJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 06:25:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE00C061A10
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 03:25:09 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x10so1902636plr.4
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8cJsBp+EOXNRCmgk1ug3bfc2/ttTB2kMHJOkU+Y+o8w=;
        b=H7j39yb2k+XzcTJ6ncmva9Oe4ssQ47Z5wYyQS0/DnmAGms7PhCqbCH6niF7jW/W274
         tU4PHWbVunVxDfKxT2ms9w9sL8Nc0qzCujiLi2rYkgAlCOLOZSUxglIh3lsPvmWLbeeQ
         zKMgALmUvPZWJw1CuKp75LwMIA/DRKBK52Jxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cJsBp+EOXNRCmgk1ug3bfc2/ttTB2kMHJOkU+Y+o8w=;
        b=Z2+yGz/UfOKFPIPfTxKQ0td0DVNhHIeiYcY37sh4ppl1z0eKJnuN8Usq3ixBGpZnI4
         41HVcnrm/Vw8yFkBaGAyJzUUxpQ92PU3gS9B6hNeEIB99i8WGvdsFsqFcJv3IuE8zmeD
         wbHDBY7bjlr+sjEwPcjw52RZlrvtshyaikBr61yTWSAPgn56GhJJo38zH/rQ2lm81ou+
         kOHTwwWmI68bYZnNC+Aw90u3Ha+mxwUzo3pw1zlEu0bIF3DglWcnc+eHKbEOrD2Or9sh
         b43CLzdyy9AxWnEKpif9kFGToL6IAs6XG0D8vw31rHM1HdN3+x+QMw++BFx74M0VD1SX
         rJ/w==
X-Gm-Message-State: AGi0PuYZMKnO2iQk/iYv5OLaDVC6+T1OAKbY+z/ymgxph9TwVYelySWQ
        OlD3M/O1ULBpgZtCW0I/Bf8BBA==
X-Google-Smtp-Source: APiQypKVroCJHaGCjBiL6U8KsbIvrlrx4Udr2zwOYfB1N8nXUOGsewudXLu4qjQ/SI19VwYVg9KMdQ==
X-Received: by 2002:a17:902:40a:: with SMTP id 10mr12231101ple.183.1588847109077;
        Thu, 07 May 2020 03:25:09 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
        by smtp.gmail.com with ESMTPSA id g14sm4458765pfh.49.2020.05.07.03.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 03:25:08 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Eizan Miyamoto <eizan@chromium.org>,
        Enric Balletbo I Serra <enric.balletbo@collabora.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/5] [media] mtk-mdp: convert mtk_mdp_dev.comp array to list
Date:   Thu,  7 May 2020 20:23:48 +1000
Message-Id: <20200507202337.v3.4.I22b7dfc5e6977f5c149f82594832b5bd1d978af9@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200507102345.81849-1-eizan@chromium.org>
References: <20200507102345.81849-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The functions mtk_mdp_register/unregister_component have been created to
add / remove items from the list of components.

This will eventually enable us to specify a list of components in the
device tree instead of hardcoding them into this driver.

The list is modified by a single thread at driver probe time, and will
not be traversed by another thread until the call to pm_runtime_enable
at the end of probing.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2: None

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  1 +
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 46 +++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 +++-
 4 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index c76cd61fb178..da2bdad7a8d1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -103,6 +103,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 		return -EINVAL;
 	}
 
+	INIT_LIST_HEAD(&comp->node);
 	comp->dev_node = of_node_get(node);
 	comp->id = comp_id;
 	comp->type = mtk_mdp_matches[comp_id].type;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 3b83bd6e0d8b..1f745891c6c3 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -36,6 +36,7 @@ enum mtk_mdp_comp_id {
 
 /**
  * struct mtk_mdp_comp - the MDP's function component data
+ * @node:	list node to track sibing MDP components
  * @dev_node:	component device node
  * @clk:	clocks required for component
  * @larb_dev:	SMI device required for component
@@ -43,6 +44,7 @@ enum mtk_mdp_comp_id {
  * @id:		component ID
  */
 struct mtk_mdp_comp {
+	struct list_head	node;
 	struct device_node	*dev_node;
 	struct clk		*clk[2];
 	struct device		*larb_dev;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 17d155219ba2..40b9fda8b03b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -55,19 +55,19 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
-	int i;
+	struct mtk_mdp_comp *comp_node;
 
-	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
-		mtk_mdp_comp_clock_on(dev, mdp->comp[i]);
+	list_for_each_entry(comp_node, &mdp->comp_list, node)
+		mtk_mdp_comp_clock_on(dev, comp_node);
 }
 
 static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
-	int i;
+	struct mtk_mdp_comp *comp_node;
 
-	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
-		mtk_mdp_comp_clock_off(dev, mdp->comp[i]);
+	list_for_each_entry(comp_node, &mdp->comp_list, node)
+		mtk_mdp_comp_clock_off(dev, comp_node);
 }
 
 static void mtk_mdp_wdt_worker(struct work_struct *work)
@@ -91,12 +91,25 @@ static void mtk_mdp_reset_handler(void *priv)
 	queue_work(mdp->wdt_wq, &mdp->wdt_work);
 }
 
+void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
+				struct mtk_mdp_comp *comp)
+{
+	list_add(&mdp->comp_list, &comp->node);
+}
+
+void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
+				  struct mtk_mdp_comp *comp)
+{
+	list_del(&comp->node);
+}
+
 static int mtk_mdp_probe(struct platform_device *pdev)
 {
 	struct mtk_mdp_dev *mdp;
 	struct device *dev = &pdev->dev;
 	struct device_node *node, *parent;
-	int i, ret = 0;
+	struct mtk_mdp_comp *comp, *comp_temp;
+	int ret = 0;
 
 	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
 	if (!mdp)
@@ -104,6 +117,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	mdp->id = pdev->id;
 	mdp->pdev = pdev;
+	INIT_LIST_HEAD(&mdp->comp_list);
 	INIT_LIST_HEAD(&mdp->ctx_list);
 
 	mutex_init(&mdp->lock);
@@ -124,7 +138,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		const struct of_device_id *of_id;
 		enum mtk_mdp_comp_type comp_type;
 		int comp_id;
-		struct mtk_mdp_comp *comp;
 
 		of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
 		if (!of_id)
@@ -150,13 +163,14 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 			of_node_put(node);
 			goto err_comp;
 		}
-		mdp->comp[comp_id] = comp;
 
 		ret = mtk_mdp_comp_init(dev, node, comp, comp_id);
 		if (ret) {
 			of_node_put(node);
 			goto err_comp;
 		}
+
+		mtk_mdp_register_component(mdp, comp);
 	}
 
 	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
@@ -220,8 +234,10 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 err_alloc_job_wq:
 
 err_comp:
-	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
-		mtk_mdp_comp_deinit(dev, mdp->comp[i]);
+	list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
+		mtk_mdp_unregister_component(mdp, comp);
+		mtk_mdp_comp_deinit(dev, comp);
+	}
 
 	dev_dbg(dev, "err %d\n", ret);
 	return ret;
@@ -230,7 +246,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 static int mtk_mdp_remove(struct platform_device *pdev)
 {
 	struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
-	int i;
+	struct mtk_mdp_comp *comp, *comp_temp;
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
@@ -243,8 +259,10 @@ static int mtk_mdp_remove(struct platform_device *pdev)
 	flush_workqueue(mdp->job_wq);
 	destroy_workqueue(mdp->job_wq);
 
-	for (i = 0; i < ARRAY_SIZE(mdp->comp); i++)
-		mtk_mdp_comp_deinit(&pdev->dev, mdp->comp[i]);
+	list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
+		mtk_mdp_unregister_component(mdp, comp);
+		mtk_mdp_comp_deinit(&pdev->dev, comp);
+	}
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 	return 0;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
index bafcccd71f31..1de825386da7 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
@@ -138,7 +138,7 @@ struct mtk_mdp_variant {
  * @pdev:	pointer to the image processor platform device
  * @variant:	the IP variant information
  * @id:		image processor device index (0..MTK_MDP_MAX_DEVS)
- * @comp:	MDP function components
+ * @comp_list:	list of MDP function components
  * @m2m_dev:	v4l2 memory-to-memory device data
  * @ctx_list:	list of struct mtk_mdp_ctx
  * @vdev:	video device for image processor driver
@@ -156,7 +156,7 @@ struct mtk_mdp_dev {
 	struct platform_device		*pdev;
 	struct mtk_mdp_variant		*variant;
 	u16				id;
-	struct mtk_mdp_comp		*comp[MTK_MDP_COMP_ID_MAX];
+	struct list_head		comp_list;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct list_head		ctx_list;
 	struct video_device		*vdev;
@@ -223,6 +223,12 @@ struct mtk_mdp_ctx {
 
 extern int mtk_mdp_dbg_level;
 
+void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
+				struct mtk_mdp_comp *comp);
+
+void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
+				  struct mtk_mdp_comp *comp);
+
 #if defined(DEBUG)
 
 #define mtk_mdp_dbg(level, fmt, args...)				 \
-- 
2.26.2.526.g744177e7f7-goog

