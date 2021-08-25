Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3850D3F6F91
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 08:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239148AbhHYGfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 02:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239155AbhHYGfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 02:35:00 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6CFC06179A
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:10 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q68so4996236pga.9
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixHDKmGeCSJesMZEO8bPyQxduA9beIl1G8W4ggeif3s=;
        b=UFzNWstWEwqoHlxwHZq/zy8fqaXQhERaHgnYtMR1h6V02joaZGi/jbck/ainAk6p5f
         rsgMbI9Ratz7wC90swfqUq3bXI49E7KkGUSx0Q8S8shmkbiOH/cXqkbeFdX17r2tq8p+
         uZvYs4oN56Jz+dMs/8c+nnWQNpYJzyVUfGcwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixHDKmGeCSJesMZEO8bPyQxduA9beIl1G8W4ggeif3s=;
        b=pwQVw6Xx8RO1u5hMAYpnPxpigdCMK6m0B9ySs9SaQBzZETWmGpND8PA0n4rtq8PRFB
         zD6VIVXd2NQamyt5JyEW3uwQWQzN1VXA7Y6Vl4bAd/Y+i1UwGRE8aOEUb7Wgmt9RrKyj
         07mTkARfaGNkA0QfHFGjaOO/1yf37hkvoltCeKKOb6w3i+XFQXkpUpryeFDRa9X60I4u
         QYDXSnxljwdAeJAICiJFy4QlpF4UUPN82+uyNegz9Okjyz6VbnRYNKLzVLhXcIeytpOE
         9Z7gB1nNqL3ICJ0cYVbN2A2XIXxl4Xg+F0vDnAF3EAi7xGrlUgLpJ3fG5F56XAEMPBzh
         qowg==
X-Gm-Message-State: AOAM5329glslDacduQJITaS8Qcpw+aEbAXYcy2xZA+W2/nI0Dag6jRV7
        2Gs1forhhzikMN9xeofkqjfGJQ==
X-Google-Smtp-Source: ABdhPJyvVJDYGki03jdnj1yD9Qgmb/mevVghNumzF5IhoCieZdHTK0zUdGzBKTAiwgcinJxJgjJRwg==
X-Received: by 2002:a62:be04:0:b029:3e0:3fca:2a8f with SMTP id l4-20020a62be040000b02903e03fca2a8fmr42638513pff.12.1629873250337;
        Tue, 24 Aug 2021 23:34:10 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
        by smtp.gmail.com with UTF8SMTPSA id v3sm3984882pjd.27.2021.08.24.23.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 23:34:10 -0700 (PDT)
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
Subject: [PATCH v7 3/7] mtk-mdp: use pm_runtime in MDP component driver
Date:   Wed, 25 Aug 2021 16:33:19 +1000
Message-Id: <20210825163247.v7.3.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without this change, the MDP components are not fully integrated into
the runtime power management subsystem, and the MDP driver does not
work.

For each of the component device drivers to be able to call
pm_runtime_get/put_sync() a pointer to the component's device struct
had to be added to struct mtk_mdp_comp, set by mtk_mdp_comp_init().

Note that the dev argument to mtk_mdp_comp_clock_on/off() has been
removed. Those functions used to be called from the "master" mdp driver
in mtk_mdp_core.c, but the component's device pointer no longer
corresponds to the mdp master device pointer, which is not the right
device to pass to pm_runtime_put/get_sync() which we had to add to get
the driver to work properly.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 24 +++++++++++++++----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +++--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  7 +++---
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 7a0e3acffab9..472c261b01e8 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -12,6 +12,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <soc/mediatek/smi.h>
+#include <linux/pm_runtime.h>
 
 #include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
@@ -50,14 +51,22 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 {
 	int i, err, status;
 
 	if (comp->larb_dev) {
 		err = mtk_smi_larb_get(comp->larb_dev);
 		if (err)
-			dev_err(dev, "failed to get larb, err %d.\n", err);
+			dev_err(comp->dev, "failed to get larb, err %d.\n", err);
+	}
+
+	err = pm_runtime_get_sync(comp->dev);
+	if (err < 0) {
+		dev_err(comp->dev,
+			"failed to runtime get, err %d.\n",
+			err);
+		return err;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
@@ -66,7 +75,7 @@ int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 		err = clk_prepare_enable(comp->clk[i]);
 		if (err) {
 			status = err;
-			dev_err(dev, "failed to enable clock, err %d. i:%d\n", err, i);
+			dev_err(comp->dev, "failed to enable clock, err %d. i:%d\n", err, i);
 			goto err_clk_prepare_enable;
 		}
 	}
@@ -80,10 +89,12 @@ int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 		clk_disable_unprepare(comp->clk[i]);
 	}
 
+	pm_runtime_put_sync(comp->dev);
+
 	return status;
 }
 
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 {
 	int i;
 
@@ -95,6 +106,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
 
 	if (comp->larb_dev)
 		mtk_smi_larb_put(comp->larb_dev);
+
+	return pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *data)
@@ -103,6 +116,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *da
 	struct mtk_mdp_dev *mdp = data;
 
 	mtk_mdp_register_component(mdp, comp);
+	pm_runtime_enable(dev);
 
 	return 0;
 }
@@ -113,6 +127,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
 	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
 	struct mtk_mdp_dev *mdp = data;
 
+	pm_runtime_disable(dev);
 	mtk_mdp_unregister_component(mdp, comp);
 }
 
@@ -132,6 +147,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 		 (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
 
 	INIT_LIST_HEAD(&comp->node);
+	comp->dev = dev;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index df5fc4c94f90..f2e22e7e7c45 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -12,17 +12,19 @@
  * @node:	list node to track sibing MDP components
  * @clk:	clocks required for component
  * @larb_dev:	SMI device required for component
+ * @dev:	component's device
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
 	struct clk		*clk[2];
+	struct device		*dev;
 	struct device		*larb_dev;
 };
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
-int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index b813a822439a..714154450981 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -58,7 +58,7 @@ static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 	int err;
 
 	list_for_each_entry(comp_node, &mdp->comp_list, node) {
-		err = mtk_mdp_comp_clock_on(dev, comp_node);
+		err = mtk_mdp_comp_clock_on(comp_node);
 		if (err) {
 			status = err;
 			goto err_mtk_mdp_comp_clock_on;
@@ -69,18 +69,17 @@ static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 
 err_mtk_mdp_comp_clock_on:
 	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(dev, comp_node);
+		mtk_mdp_comp_clock_off(comp_node);
 
 	return status;
 }
 
 static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 {
-	struct device *dev = &mdp->pdev->dev;
 	struct mtk_mdp_comp *comp_node;
 
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(dev, comp_node);
+		mtk_mdp_comp_clock_off(comp_node);
 }
 
 static void mtk_mdp_wdt_worker(struct work_struct *work)
-- 
2.33.0.rc2.250.ged5fa647cd-goog

