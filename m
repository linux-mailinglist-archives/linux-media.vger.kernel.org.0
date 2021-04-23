Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DC7368CDC
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240661AbhDWF7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 01:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240610AbhDWF7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 01:59:41 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C3DC06174A
        for <linux-media@vger.kernel.org>; Thu, 22 Apr 2021 22:59:04 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id cu16so20546507pjb.4
        for <linux-media@vger.kernel.org>; Thu, 22 Apr 2021 22:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yiAcF7/EwGsVTnm/KaKw4OR9M6sL1Co2VCdZKQI4p/0=;
        b=Zjglmk7B7C3da6aWjzL2ebSM1WB1jlSPt927qLqbJ+/9q+L9IsbnMK/Pz/6SW7LxHE
         GQL5wmlG0bzs7Ooesq0mHdrODpUF65y7dVPLpRrni1O9xPc7qCB17nz9nLb6iYZRv2Ln
         dAtE+qwiCn4d1gTK4co7+mESQy5U6dBG6dksI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yiAcF7/EwGsVTnm/KaKw4OR9M6sL1Co2VCdZKQI4p/0=;
        b=lP/SpqbkRejFQFM6PgqVFvK5cXL9atDFXDwiv/rPewBzJGCxoPOk5Iv9d/1mQn02yi
         uzxqc3HB8fjEMs1dlt4jqlaEoPFK1jjNq+wtf8GQXRaKvWCkv/B9kM84YnkElj4AHUYh
         4KwipUe3hKXMaO7qVX/op5s1XLLhMAjGeTYat08tXSWsa5BLOmqnbKw+7xxRmAPLJS7/
         mzZe6KPyhqpwRYMruf+pmxON3SrNARVimOJLo+m9dbNxWRz5r9lx+WvEkvktMFxdZ/A3
         PxfAn3wpU8ZdhiSwS2mgFoDIWov6ki83tPrTtrh/6AYekEBnVZvxk9zWYFyTBg44SglI
         zh9A==
X-Gm-Message-State: AOAM530FIRhzg+yejHmiQXHtMWFAApgh3+EGEDJMElxp5FoI1jgyJnxt
        jFOL7YSb1AH3NLNsLBGZODnL4A==
X-Google-Smtp-Source: ABdhPJyZDeeqBMLrYrovs9jwIPtJnn0qpnzmHzSKWb84On4ThfdJXfv1HZfAPSSnZ2F0GYiCc4r0mA==
X-Received: by 2002:a17:90a:de17:: with SMTP id m23mr2698590pjv.16.1619157543910;
        Thu, 22 Apr 2021 22:59:03 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:308c:235d:f7a2:53a1])
        by smtp.gmail.com with UTF8SMTPSA id a1sm3681575pfi.161.2021.04.22.22.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 22:59:03 -0700 (PDT)
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
Subject: [PATCH v1 2/4] mtk-mdp: use pm_runtime in MDP component driver
Date:   Fri, 23 Apr 2021 15:58:39 +1000
Message-Id: <20210423155824.v1.2.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423055842.2490679-1-eizan@chromium.org>
References: <20210423055842.2490679-1-eizan@chromium.org>
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

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 19 ++++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 ++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++----
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 3fbbcf05440a..84f9c529d74a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -13,6 +13,8 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <soc/mediatek/smi.h>
+#include <linux/pm_runtime.h>
 
 #include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
@@ -51,22 +53,28 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 {
 	int i, err;
 
+	err = pm_runtime_get_sync(comp->dev);
+	if (err < 0)
+		dev_err(comp->dev,
+			"failed to runtime get, err %d.\n",
+			err);
+
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
 			continue;
 		err = clk_prepare_enable(comp->clk[i]);
 		if (err)
-			dev_err(dev,
+			dev_err(comp->dev,
 				"failed to enable clock, err %d. i:%d\n",
 				err, i);
 	}
 }
 
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 {
 	int i;
 
@@ -75,6 +83,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
+
+	pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
@@ -84,6 +94,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 	struct mtk_mdp_dev *mdp = data;
 
 	mtk_mdp_register_component(mdp, comp);
+	pm_runtime_enable(dev);
 
 	return 0;
 }
@@ -94,6 +105,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
 	struct mtk_mdp_dev *mdp = data;
 	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
 
+	pm_runtime_disable(dev);
 	mtk_mdp_unregister_component(mdp, comp);
 }
 
@@ -111,6 +123,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 		 (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
 
 	INIT_LIST_HEAD(&comp->node);
+	comp->dev = dev;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 956d20c01e34..355e226d74fe 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -11,16 +11,18 @@
  * struct mtk_mdp_comp - the MDP's function component data
  * @node:	list node to track sibing MDP components
  * @clk:	clocks required for component
+ * @dev:	component's device
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
 	struct clk		*clk[2];
+	struct device		*dev;
 };
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index d79bf7f0031a..c55bcfe4cbb7 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -51,20 +51,18 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 
 static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
-	struct device *dev = &mdp->pdev->dev;
 	struct mtk_mdp_comp *comp_node;
 
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_on(dev, comp_node);
+		mtk_mdp_comp_clock_on(comp_node);
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
2.31.1.498.g6c1eba8ee3d-goog

