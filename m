Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FB2368CD9
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 07:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240466AbhDWF7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 01:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhDWF7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 01:59:33 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBF2C061574
        for <linux-media@vger.kernel.org>; Thu, 22 Apr 2021 22:58:57 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id b17so34490718pgh.7
        for <linux-media@vger.kernel.org>; Thu, 22 Apr 2021 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fI0Niu7IrHlOnwIil8td55EgV+yfYj/c5fSqegS60WA=;
        b=XSiG2pEBy5cSlNHSAJJ98UroKmqXUZ4WBHn+y9l6feQQjb8S7yl/IhqNAi5m1I09no
         85L5iRfrYzlGk5G5PEF1fYS31NU+sF2m53s0sxwPIOKu3jtFvo3BlL+5RJYgG20KvUFL
         sBkCPtXgI2y3tLZJGGKmd8mYenyCkDY/hTqc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fI0Niu7IrHlOnwIil8td55EgV+yfYj/c5fSqegS60WA=;
        b=GJtXDoyfUA0rlfEDBns4UUCQgDzkxJikIvcmwk8hN0INanqzUa5u9IJjB7Qo6Usi83
         QzPUCI7+dAF2brchs3IAN2eyMxF8FPXxSk0IEnmpYkMQAxGPwzMZACoKZ7rCW4kb1DZt
         TOT6uhx2rfUtNtHlqJOPBKKGRaTnNx14NBHVLIzUyuYW60diN7DQvOWy/UKKgG39pInP
         1QGIV9WTWAz3fUdF5Pc+n/u4S+3jU6kLcz9sIAdh+B6YNsJwXwM6g40chSXGhKioPrJy
         Hnd3TYZPcDQJR0njDeYyvpKzjQAu2pMKOlxCjl7txde27brt9u9Fb093EBQqoEx+/0WH
         QW7g==
X-Gm-Message-State: AOAM531m2chaOdWkqqpdNBLHJIwfVK7GXirar503jscJaqZeFwkj0o/P
        Ub4hQw6xOdVw7uIDXZGfC6HEAg==
X-Google-Smtp-Source: ABdhPJwNIVaLacGjFjmlVC9L2iCQxwFcXGrnDORin+mYQgi2d9gjV4Sq+URO+J5R0z9lHFvpIl46ZA==
X-Received: by 2002:a65:480a:: with SMTP id h10mr2211536pgs.63.1619157537021;
        Thu, 22 Apr 2021 22:58:57 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:308c:235d:f7a2:53a1])
        by smtp.gmail.com with UTF8SMTPSA id a7sm3598474pfg.65.2021.04.22.22.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 22:58:56 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     enric.balletbo@collabora.com, chunkuang.hu@kernel.org,
        yong.wu@mediatek.com, Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/4] mtk-mdp: add driver to probe mdp components
Date:   Fri, 23 Apr 2021 15:58:38 +1000
Message-Id: <20210423155824.v1.1.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423055842.2490679-1-eizan@chromium.org>
References: <20210423055842.2490679-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Broadly, this patch (1) adds a driver for various MTK MDP components to
go alongside the main MTK MDP driver, and (2) hooks them all together
using the component framework.

(1) Up until now, the MTK MDP driver controls 8 devices in the device
tree on its own. When running tests for the hardware video decoder, we
found that the iommus and LARBs were not being properly configured. To
configure them, a driver for each be added to mtk_mdp_comp so that
mtk_iommu_add_device() can (eventually) be called from dma_configure()
inside really_probe().

(2) The integration into the component framework allows us to defer the
registration with the v4l2 subsystem until all the MDP-related devices
have been probed, so that the relevant device node does not become
available until initialization of all the components is complete.

Some notes about how the component framework has been integrated:

- The driver for the rdma0 component serves double duty as the "master"
  (aggregate) driver as well as a component driver. This is a non-ideal
  compromise until a better solution is developed. This device is
  differentiated from the rest by checking for a "mediatek,vpu" property
  in the device node.

- The list of mdp components remains hard-coded as mtk_mdp_comp_dt_ids[]
  in mtk_mdp_core.c, and as mtk_mdp_comp_driver_dt_match[] in
  mtk_mdp_comp.c. This unfortunate duplication of information is
  addressed in a following patch in this series.

- The component driver calls component_add() for each device that is
  probed.

- In mtk_mdp_probe (the "master" device), we scan the device tree for
  any matching nodes against mtk_mdp_comp_dt_ids, and add component
  matches for them. The match criteria is a matching device node
  pointer.

- When the set of components devices that have been probed corresponds
  with the list that is generated by the "master", the callback to
  mtk_mdp_master_bind() is made, which then calls the component bind
  functions.

- Inside mtk_mdp_master_bind(), once all the component bind functions
  have been called, we can then register our device to the v4l2
  subsystem.

- The call to pm_runtime_enable() in the master device is called after
  all the components have been registered by their bind() functions
  called by mtk_mtp_master_bind(). As a result, the list of components
  will not change while power management callbacks mtk_mdp_suspend()/
  resume() are accessing the list of components.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 139 ++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  26 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 175 +++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
 4 files changed, 255 insertions(+), 86 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 1e3833f1c9ae..3fbbcf05440a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -5,13 +5,51 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/device.h>
-#include <linux/of.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
 #include "mtk_mdp_comp.h"
+#include "mtk_mdp_core.h"
+
+/**
+ * enum mtk_mdp_comp_type - the MDP component
+ * @MTK_MDP_RDMA:		Read DMA
+ * @MTK_MDP_RSZ:		Reszer
+ * @MTK_MDP_WDMA:		Write DMA
+ * @MTK_MDP_WROT:		Write DMA with rotation
+ * @MTK_MDP_COMP_TYPE_MAX:	Placeholder for num elems in this enum
+ */
+enum mtk_mdp_comp_type {
+	MTK_MDP_RDMA,
+	MTK_MDP_RSZ,
+	MTK_MDP_WDMA,
+	MTK_MDP_WROT,
+	MTK_MDP_COMP_TYPE_MAX,
+};
 
+static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
+	{
+		.compatible = "mediatek,mt8173-mdp-rdma",
+		.data = (void *)MTK_MDP_RDMA
+	}, {
+		.compatible = "mediatek,mt8173-mdp-rsz",
+		.data = (void *)MTK_MDP_RSZ
+	}, {
+		.compatible = "mediatek,mt8173-mdp-wdma",
+		.data = (void *)MTK_MDP_WDMA
+	}, {
+		.compatible = "mediatek,mt8173-mdp-wrot",
+		.data = (void *)MTK_MDP_WROT
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
 void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 {
@@ -23,8 +61,8 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 		err = clk_prepare_enable(comp->clk[i]);
 		if (err)
 			dev_err(dev,
-			"failed to enable clock, err %d. type:%d i:%d\n",
-				err, comp->type, i);
+				"failed to enable clock, err %d. i:%d\n",
+				err, i);
 	}
 }
 
@@ -39,15 +77,40 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
 	}
 }
 
-int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
-		      struct mtk_mdp_comp *comp,
-		      enum mtk_mdp_comp_type comp_type)
+static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
+			void *data)
+{
+	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
+	struct mtk_mdp_dev *mdp = data;
+
+	mtk_mdp_register_component(mdp, comp);
+
+	return 0;
+}
+
+static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
+			   void *data)
+{
+	struct mtk_mdp_dev *mdp = data;
+	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
+
+	mtk_mdp_unregister_component(mdp, comp);
+}
+
+static const struct component_ops mtk_mdp_component_ops = {
+	.bind   = mtk_mdp_comp_bind,
+	.unbind = mtk_mdp_comp_unbind,
+};
+
+int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 {
 	int ret;
 	int i;
+	struct device_node *node = dev->of_node;
+	enum mtk_mdp_comp_type comp_type =
+		 (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
 
-	comp->dev_node = of_node_get(node);
-	comp->type = comp_type;
+	INIT_LIST_HEAD(&comp->node);
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
@@ -55,23 +118,71 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clock\n");
 			ret = PTR_ERR(comp->clk[i]);
-			goto put_dev;
+			goto err;
 		}
 
 		/* Only RDMA needs two clocks */
-		if (comp->type != MTK_MDP_RDMA)
+		if (comp_type != MTK_MDP_RDMA)
 			break;
 	}
 
 	return 0;
 
-put_dev:
-	of_node_put(comp->dev_node);
+err:
+	dev_err(dev, "err %d\n", ret);
 
 	return ret;
 }
 
-void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp)
+static int mtk_mdp_comp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *vpu_node;
+	int status;
+	struct mtk_mdp_comp *comp;
+
+	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
+	if (vpu_node) {
+		of_node_put(vpu_node);
+		/*
+		 * The device tree node with a mediatek,vpu property is deemed
+		 * the MDP "master" device, we don't want to add a component
+		 * for it in this function because the initialization for the
+		 * master is done elsewhere.
+		 */
+		dev_info(dev, "vpu node found, not probing\n");
+		return -ENODEV;
+	}
+
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+	if (!comp)
+		return -ENOMEM;
+
+	status = mtk_mdp_comp_init(comp, dev);
+	if (status) {
+		dev_err(dev, "Failed to initialize component: %d\n", status);
+		return status;
+	}
+
+	dev_set_drvdata(dev, comp);
+
+	return component_add(dev, &mtk_mdp_component_ops);
+}
+
+static int mtk_mdp_comp_remove(struct platform_device *pdev)
 {
-	of_node_put(comp->dev_node);
+	struct device *dev = &pdev->dev;
+
+	component_del(dev, &mtk_mdp_component_ops);
+	return 0;
 }
+
+struct platform_driver mtk_mdp_component_driver = {
+	.probe          = mtk_mdp_comp_probe,
+	.remove         = mtk_mdp_comp_remove,
+	.driver         = {
+		.name   = "mediatek-mdp-comp",
+		.owner  = THIS_MODULE,
+		.of_match_table = mtk_mdp_comp_driver_dt_match,
+	},
+};
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 36bc1b8f6222..956d20c01e34 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -7,41 +7,21 @@
 #ifndef __MTK_MDP_COMP_H__
 #define __MTK_MDP_COMP_H__
 
-/**
- * enum mtk_mdp_comp_type - the MDP component
- * @MTK_MDP_RDMA:	Read DMA
- * @MTK_MDP_RSZ:	Riszer
- * @MTK_MDP_WDMA:	Write DMA
- * @MTK_MDP_WROT:	Write DMA with rotation
- */
-enum mtk_mdp_comp_type {
-	MTK_MDP_RDMA,
-	MTK_MDP_RSZ,
-	MTK_MDP_WDMA,
-	MTK_MDP_WROT,
-	MTK_MDP_COMP_TYPE_MAX,
-};
-
 /**
  * struct mtk_mdp_comp - the MDP's function component data
  * @node:	list node to track sibing MDP components
- * @dev_node:	component device node
  * @clk:	clocks required for component
- * @type:	component type
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
-	struct device_node	*dev_node;
 	struct clk		*clk[2];
-	enum mtk_mdp_comp_type	type;
 };
 
-int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
-		      struct mtk_mdp_comp *comp,
-		      enum mtk_mdp_comp_type comp_type);
-void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
+
 void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
 
+extern struct platform_driver mtk_mdp_component_driver;
 
 #endif /* __MTK_MDP_COMP_H__ */
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 70a8eab16863..d79bf7f0031a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -18,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
 
+#include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
 #include "mtk_mdp_m2m.h"
 #include "mtk_vpu.h"
@@ -31,16 +33,12 @@ module_param(mtk_mdp_dbg_level, int, 0644);
 static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
 	{
 		.compatible = "mediatek,mt8173-mdp-rdma",
-		.data = (void *)MTK_MDP_RDMA
 	}, {
 		.compatible = "mediatek,mt8173-mdp-rsz",
-		.data = (void *)MTK_MDP_RSZ
 	}, {
 		.compatible = "mediatek,mt8173-mdp-wdma",
-		.data = (void *)MTK_MDP_WDMA
 	}, {
 		.compatible = "mediatek,mt8173-mdp-wrot",
-		.data = (void *)MTK_MDP_WROT
 	},
 	{ },
 };
@@ -90,6 +88,64 @@ static void mtk_mdp_reset_handler(void *priv)
 	queue_work(mdp->wdt_wq, &mdp->wdt_work);
 }
 
+static int compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static void release_of(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static int mtk_mdp_master_bind(struct device *dev)
+{
+	int status;
+	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
+
+	mtk_mdp_register_component(mdp, &mdp->comp_self);
+
+	status = component_bind_all(dev, mdp);
+	if (status) {
+		dev_err(dev, "Failed to bind all components: %d\n", status);
+		goto err_component_bind_all;
+	}
+
+	status = mtk_mdp_register_m2m_device(mdp);
+	if (status) {
+		dev_err(dev, "Failed to register m2m device: %d\n", status);
+		v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
+		goto err_mtk_mdp_register_m2m_device;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+
+err_mtk_mdp_register_m2m_device:
+	component_unbind_all(dev, mdp);
+
+err_component_bind_all:
+	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
+
+	return status;
+}
+
+static void mtk_mdp_master_unbind(struct device *dev)
+{
+	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
+
+	pm_runtime_disable(dev);
+	mtk_mdp_unregister_m2m_device(mdp);
+	component_unbind_all(dev, mdp);
+	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
+}
+
+static const struct component_master_ops mtk_mdp_com_ops = {
+	.bind		= mtk_mdp_master_bind,
+	.unbind		= mtk_mdp_master_unbind,
+};
+
 void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
 				struct mtk_mdp_comp *comp)
 {
@@ -107,8 +163,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	struct mtk_mdp_dev *mdp;
 	struct device *dev = &pdev->dev;
 	struct device_node *node, *parent;
-	struct mtk_mdp_comp *comp, *comp_temp;
-	int ret = 0;
+	int i, ret = 0;
+	struct component_match *match = NULL;
 
 	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
 	if (!mdp)
@@ -133,36 +189,43 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	/* Iterate over sibling MDP function blocks */
+	i = 0;
 	for_each_child_of_node(parent, node) {
-		const struct of_device_id *of_id;
-		enum mtk_mdp_comp_type comp_type;
+		struct platform_device *pdev;
 
-		of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
-		if (!of_id)
+		if (!of_match_node(mtk_mdp_comp_dt_ids, node))
 			continue;
 
-		if (!of_device_is_available(node)) {
-			dev_err(dev, "Skipping disabled component %pOF\n",
-				node);
+		if (!of_device_is_available(node))
 			continue;
-		}
 
-		comp_type = (enum mtk_mdp_comp_type)of_id->data;
-
-		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
-		if (!comp) {
-			ret = -ENOMEM;
-			of_node_put(node);
-			goto err_comp;
+		pdev = of_find_device_by_node(node);
+		if (!pdev) {
+			dev_warn(dev, "Unable to find comp device %s\n",
+				 node->full_name);
+			continue;
 		}
 
-		ret = mtk_mdp_comp_init(dev, node, comp, comp_type);
-		if (ret) {
-			of_node_put(node);
-			goto err_comp;
+		/*
+		 * Do not add a match for my own (rdma0) device node.
+		 * I will be managing it directly instead using comp_self.
+		 */
+		if (&pdev->dev != dev) {
+			dev_dbg(dev, "adding match %d for: %pOF\n", i++, node);
+			component_match_add_release(dev, &match, release_of,
+						    compare_of,
+						    of_node_get(node));
 		}
+	}
 
-		mtk_mdp_register_component(mdp, comp);
+	/*
+	 * Create a component for myself so that clocks can be toggled in
+	 * clock_on().
+	 */
+	ret = mtk_mdp_comp_init(&mdp->comp_self, dev);
+	if (ret) {
+		dev_err(dev, "Failed to initialize component\n");
+		goto err_comp;
 	}
 
 	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
@@ -187,18 +250,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		goto err_dev_register;
 	}
 
-	ret = mtk_mdp_register_m2m_device(mdp);
-	if (ret) {
-		v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
-		goto err_m2m_register;
-	}
-
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
 	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_wdt_reg;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,15 +263,25 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_set_max_seg_size;
+	}
+
+	ret = component_master_add_with_match(dev, &mtk_mdp_com_ops, match);
+	if (ret) {
+		dev_err(dev, "Component master add failed\n");
+		goto err_component_master_add;
 	}
 
-	pm_runtime_enable(dev);
 	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
 
 	return 0;
 
-err_m2m_register:
+err_component_master_add:
+	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+
+err_set_max_seg_size:
+
+err_wdt_reg:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
 err_dev_register:
@@ -226,11 +293,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 err_alloc_job_wq:
 
 err_comp:
-	list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
-		mtk_mdp_unregister_component(mdp, comp);
-		mtk_mdp_comp_deinit(dev, comp);
-	}
-
 	dev_dbg(dev, "err %d\n", ret);
 	return ret;
 }
@@ -238,11 +300,10 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 static int mtk_mdp_remove(struct platform_device *pdev)
 {
 	struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
-	struct mtk_mdp_comp *comp, *comp_temp;
 
-	pm_runtime_disable(&pdev->dev);
+	component_master_del(&pdev->dev, &mtk_mdp_com_ops);
+
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
-	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
 	flush_workqueue(mdp->wdt_wq);
@@ -251,10 +312,8 @@ static int mtk_mdp_remove(struct platform_device *pdev)
 	flush_workqueue(mdp->job_wq);
 	destroy_workqueue(mdp->job_wq);
 
-	list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
-		mtk_mdp_unregister_component(mdp, comp);
-		mtk_mdp_comp_deinit(&pdev->dev, comp);
-	}
+	if (!list_empty(&mdp->comp_list))
+		dev_err(&pdev->dev, "not all components removed\n");
 
 	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
 	return 0;
@@ -309,7 +368,25 @@ static struct platform_driver mtk_mdp_driver = {
 	}
 };
 
-module_platform_driver(mtk_mdp_driver);
+static struct platform_driver * const mtk_mdp_drivers[] = {
+	&mtk_mdp_driver,
+	&mtk_mdp_component_driver,
+};
+
+static int __init mtk_mdp_init(void)
+{
+	return platform_register_drivers(mtk_mdp_drivers,
+					 ARRAY_SIZE(mtk_mdp_drivers));
+}
+
+static void __exit mtk_mdp_exit(void)
+{
+	platform_unregister_drivers(mtk_mdp_drivers,
+				    ARRAY_SIZE(mtk_mdp_drivers));
+}
+
+module_init(mtk_mdp_init);
+module_exit(mtk_mdp_exit);
 
 MODULE_AUTHOR("Houlong Wei <houlong.wei@mediatek.com>");
 MODULE_DESCRIPTION("Mediatek image processor driver");
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
index a7da14b97077..230f531400ca 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
@@ -155,6 +155,7 @@ struct mtk_mdp_dev {
 	struct mtk_mdp_variant		*variant;
 	u16				id;
 	struct list_head		comp_list;
+	struct mtk_mdp_comp		comp_self;
 	struct v4l2_m2m_dev		*m2m_dev;
 	struct list_head		ctx_list;
 	struct video_device		*vdev;
-- 
2.31.1.498.g6c1eba8ee3d-goog

