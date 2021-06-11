Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CE73A3AAC
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 06:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhFKEFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 00:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFKEE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 00:04:59 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D9AC061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:49 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id l1so1420700pgm.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+3+Gndgp0/tMOoNPMocbbgZOkKhwbWpoRPVA8+JYgko=;
        b=TcBorTOMlysmNHNu0MlyOQGrbwtJvS25dVRY+79aHZmpMnytbVQ9ZX54picFRWzu0p
         ZvTxUDL9rCJeG57HWN/4LgCYV73QIiuQ6bwARtiwx2DcJPOGYmShBPj3tvZCRQ1lK8WU
         gG2DhG0uUVjXOqpRhspcj6PgFDX8y3WSiBJHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+3+Gndgp0/tMOoNPMocbbgZOkKhwbWpoRPVA8+JYgko=;
        b=Ze041FT12Bw/i5viAtELPao30XWMzDbrEV1etP7CqQymMbAb+PF+S8RUnvt4wvKH/m
         wQG65E4ZWevL7Wm8VtJljr9c43447hkvB4qQeht9lhCq/yvoab+zKrSw/BWNbMNlGbpo
         kKRJviiYhJzwdCvyoE2fnXCKDv9gf19L3r/yDPoDAE43efAZK20wjgwd1rrpgAmeMDBR
         19XSPrGOAHUndxp3DQ5gROfteZ/W0ce+ui1ST9Wyd6EZkCXc17TUW6PaL7AaUmUVhOGP
         zAK0qbeylDbKozq6YYnJ7VmwKiq/unz4X+Jh7kYvlhdfwb6qG0WPt6hVM1ZJM+F7ex1D
         MXbw==
X-Gm-Message-State: AOAM530o5B77X1pCtslGq+OA4ZJOnHOWKpZG3wLTEWp0qj3rLoJNywk2
        T3l9HZKO7zGvFLS7YgMB2W1Edg==
X-Google-Smtp-Source: ABdhPJwUgd/OVu7HjwJFfkEE9/lZ3KdsX0zaThKC2qQKvW8hKd4qf4vgwRVb3qWRbdjOMQ/xPVdOYQ==
X-Received: by 2002:a63:1453:: with SMTP id 19mr1627162pgu.270.1623384168646;
        Thu, 10 Jun 2021 21:02:48 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
        by smtp.gmail.com with UTF8SMTPSA id s24sm9196478pju.9.2021.06.10.21.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 21:02:47 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     houlong.wei@mediatek.com, enric.balletbo@collabora.com,
        yong.wu@mediatek.com, chunkuang.hu@kernel.org,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/8] media: mtk-mdp: propagate errors better in pm_suspend/resume
Date:   Fri, 11 Jun 2021 14:01:43 +1000
Message-Id: <20210611140124.v2.6.If7d6a147afd8880940c42d7998e47ed3869e8805@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611040145.2085329-1-eizan@chromium.org>
References: <20210611040145.2085329-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Up until this change, many errors were logged but ignored when powering
on clocks and calling pm_runtime_get/put() inside mtk_mdp_core. This
change tries to do a better job at propagating errors back to the power
management framework.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 62 ++++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 57 +++++++++++++----
 3 files changed, 99 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 3d9bb7265159..59911ee063c1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -53,39 +53,81 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
-	int err;
+	int status, err;
 
 	err = pm_runtime_get_sync(comp->dev);
-	if (err < 0)
+	if (err < 0) {
 		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
+		return err;
+	}
+
+	err = mtk_mdp_comp_clock_on(comp);
+	if (err) {
+		dev_err(comp->dev, "failed to turn on clock. err=%d", err);
+		status = err;
+		goto err_mtk_mdp_comp_clock_on;
+	}
+
+	return err;
+
+err_mtk_mdp_comp_clock_on:
+	err = pm_runtime_put_sync(comp->dev);
+	if (err)
+		dev_err(comp->dev, "failed to runtime put in cleanup. err=%d", err);
 
-	mtk_mdp_comp_clock_on(comp);
+	return status;
 }
 
-void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
 {
-	int err;
+	int status, err;
 
 	mtk_mdp_comp_clock_off(comp);
 
 	err = pm_runtime_put_sync(comp->dev);
-	if (err < 0)
+	if (err < 0) {
 		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
+		status = err;
+		goto err_pm_runtime_put_sync;
+	}
+
+	return 0;
+
+err_pm_runtime_put_sync:
+	err = mtk_mdp_comp_clock_on(comp);
+	if (err)
+		dev_err(comp->dev, "failed to turn on clock in cleanup. err=%d", err);
+
+	return status;
 }
 
-void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 {
-	int i, err;
+	int i, err, status;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
 			continue;
 		err = clk_prepare_enable(comp->clk[i]);
-		if (err)
+		if (err) {
+			status = err;
 			dev_err(comp->dev, "failed to enable clock, err %d. i:%d\n", err, i);
+			goto err_clk_prepare_enable;
+		}
+	}
+
+	return 0;
+
+err_clk_prepare_enable:
+	for (--i; i >= 0; i--) {
+		if (IS_ERR(comp->clk[i]))
+			continue;
+		clk_disable_unprepare(comp->clk[i]);
 	}
+
+	return status;
 }
 
 void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 7ad9b06bb11b..2bd229cc7eae 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -21,10 +21,10 @@ struct mtk_mdp_comp {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
-void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
 
-void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 48e9a557c446..523e3c2798e1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -49,8 +49,9 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 
-static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
+	int err, status;
 	struct mtk_mdp_comp *comp_node;
 
 	/*
@@ -58,18 +59,41 @@ static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
 	 * have mtk_mdp_comp_power_on called on it.
 	 */
-	mtk_mdp_comp_clock_on(&mdp->comp_self);
+	err = mtk_mdp_comp_clock_on(&mdp->comp_self);
+	if (err)
+		return err;
+
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_on(comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_power_on;
+		}
+	}
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_power_on(comp_node);
+	return 0;
+
+err_mtk_mdp_comp_power_on:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err)
+			dev_err(&mdp->pdev->dev, "failed to power off after error. err=%d", err);
+	}
+	return status;
 }
 
-static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 {
+	int status, err;
 	struct mtk_mdp_comp *comp_node;
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_power_off(comp_node);
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_power_off;
+		}
+	}
 
 	/*
 	 * The master / rdma0 component will have pm_runtime_put called
@@ -77,6 +101,17 @@ static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 	 * have mtk_mdp_comp_power_off called on it.
 	 */
 	mtk_mdp_comp_clock_off(&mdp->comp_self);
+
+	return 0;
+
+err_mtk_mdp_comp_power_off:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_on(comp_node);
+		if (err)
+			dev_err(&mdp->pdev->dev, "failed to power on after error. err=%d", err);
+	}
+
+	return status;
 }
 
 static void mtk_mdp_wdt_worker(struct work_struct *work)
@@ -317,18 +352,14 @@ static int __maybe_unused mtk_mdp_pm_suspend(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_off(mdp);
-
-	return 0;
+	return mtk_mdp_clock_off(mdp);
 }
 
 static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_on(mdp);
-
-	return 0;
+	return mtk_mdp_clock_on(mdp);
 }
 
 static int __maybe_unused mtk_mdp_suspend(struct device *dev)
-- 
2.32.0.272.g935e593368-goog

