Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EE63DD55D
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 14:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbhHBMNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 08:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhHBMNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 08:13:02 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7338C06179C
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 05:12:50 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso24380344pjo.1
        for <linux-media@vger.kernel.org>; Mon, 02 Aug 2021 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=okgNoCKW32CSCXrXrpg4NQCsqYV2tcQ4nicTugm8UgE=;
        b=lIJ8Dn8WhpZzBYunBjVvxEr04KAFSLRuuuN5OtW5cXqrLMN+EOJkra86vU1D9c8Mrb
         imdAnf8EjITVKF6JspUGD5aI3IIjDUXvtaTRX2KxtJ/zkWc/j0p655Ae4x26Z6mWfx/g
         WmDdf/xaon1QDLjEov2xyerP1kyVHtxkwa0e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=okgNoCKW32CSCXrXrpg4NQCsqYV2tcQ4nicTugm8UgE=;
        b=Z40fmE56P6HV24m1eX3hWWI+6QtJIqIblhLU1idzzduJtK9AkG8bgFED+bSMBybWqG
         ZVuE/keV2i3Acun1Zl/P6NQAh5szDP2+pr6/UAqu0StJN4jkAkMb3jbD3zGxJzOdvFgl
         lFOmorcOg+mpOkJOMN+WlrvMEcozUcVxHwuhT9F31vbKYQk6lD5T62utG+MYBQXYm9Fl
         0/FJsZwDU5VO+/Be7rgodAIVcDIEja+2Brknn5dFbSA7coPtTX0PFdttxBrCuNYTCYKM
         4dyguIjKx7999BVqP+Xx+PEhZWFO/Xlhihw/x6DfLj72C5wkLv1oZw7II8OSqUXbs/kT
         8r+g==
X-Gm-Message-State: AOAM533C/wgxa0N9mzLZjpdcDuQKDq6RID65pyeud1GbaFpJpU4UjSbe
        EAxsAPwQZ3SNTfRrqznXl8U4SA==
X-Google-Smtp-Source: ABdhPJy8xnwtZ9BF77lQKBzrnTUwfooI+Onr4HXjQemH2mTi0/N2oS0DDwHLErURv9b5uS4o8Eq4mg==
X-Received: by 2002:a65:6a0b:: with SMTP id m11mr299972pgu.380.1627906370479;
        Mon, 02 Aug 2021 05:12:50 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
        by smtp.gmail.com with UTF8SMTPSA id w18sm11311942pjg.50.2021.08.02.05.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 05:12:50 -0700 (PDT)
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
Subject: [PATCH v6 3/9] mtk-mdp: use pm_runtime in MDP component driver
Date:   Mon,  2 Aug 2021 22:12:09 +1000
Message-Id: <20210802220943.v6.3.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
References: <20210802121215.703023-1-eizan@chromium.org>
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
2.32.0.554.ge1b32706d8-goog

