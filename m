Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0AD43F6F93
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 08:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239116AbhHYGfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 02:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239111AbhHYGfD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 02:35:03 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE1BC0613D9
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso3431459pjh.5
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wU84M23F8XbuzFZjl6FoNSg9wYVt/dBsUxZeJ8oFat8=;
        b=bYEDw0RxGgcZlrM13Ceata/7fdhbDHYjyV8zsCp4r4mM08ie0cMqU9hi456Dhol3U6
         DuQqEoWjxBeDfYQldWNp/cGAH4pW/vfvjisacm1pN/WCiGgIwOMDAltbpssL83NAD1ci
         7EEefWctmRBDeBYTdR1n9qekhpmDgyv723KaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wU84M23F8XbuzFZjl6FoNSg9wYVt/dBsUxZeJ8oFat8=;
        b=Y9HrZVvBNs45pFxgigq7FJbwRWHtPI1QElDb4IPam8I2JMKkjFW5xfX/669r8UHlrQ
         3x+eoT2ncQjN7DJgCsIxm2XFBe9sHDs3wBr6eJG+M3aa8Ns2Rwu3A9FmEmDEAj0bFSgs
         F7UDcnAfTJmpGWHXus5FUKRPVsTBgb4t4LATcyITmzjvFBFdSSxX43JZAJBL0/YzXeKR
         dpAJPFOf11e2oH72PawuLNrfgXI/6EpGzXgGDmDEYZi5hXvEDX8tAXlHJXfGMC1VFQel
         bMGYcVNGZr8uaM1Z4e/ptRfulPMabYP1Hc5sL+p/h+xe2xgjc/hoVh7juLI6SQ2S+/Q5
         iITg==
X-Gm-Message-State: AOAM532viwZa+NeQKbReALKN4Fj4xq9O/bPDsLRNJt+4T1UrxyDFiwkc
        CSMyAINHpe55oJ+/kWdkJa1AVQ==
X-Google-Smtp-Source: ABdhPJyQtmmIsrwa9pHU6jG08kEdbztCytln3wA+zf/Te2Uc+eDHVuhe7jDW/F194QiNRnTLYYu+gA==
X-Received: by 2002:a17:90a:c88:: with SMTP id v8mr8905665pja.197.1629873257982;
        Tue, 24 Aug 2021 23:34:17 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
        by smtp.gmail.com with UTF8SMTPSA id r14sm21068943pff.106.2021.08.24.23.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 23:34:17 -0700 (PDT)
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
Subject: [PATCH v7 4/7] media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
Date:   Wed, 25 Aug 2021 16:33:20 +1000
Message-Id: <20210825163247.v7.4.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The original intent of commit 86698b9505bbc ("media: mtk-mdp: convert
mtk_mdp_dev.comp array to list") was to create a list to track all the
MDP components that needed to have their clocks enabled/disabled when
calling mtk_mdp_comp_clock_on/off. However, there was a bug inside
mtk_mdp_register_component where the args to a call to list_add were
swapped. The result is that only one component was added to
mtk_mdp_dev.comp_list because comp_list was instead being
repeatedly added to the single element lists headed by each
mtk_mdp_comp.

The order of the args to list_add in mtk_mdp_register_component was
fixed in https://patchwork.kernel.org/patch/11742895/ (Fix Null pointer
dereference when calling list_add).

Then, as a result of https://patchwork.kernel.org/patch/11530769/
(mtk-mdp: use pm_runtime in MDP component driver) if all the components
are added to the component list, the mdp "master" / rdma0 component
ends up having pm_runtime_get_sync() called on it twice recursively:

    rpm_resume+0x694/0x8f8
    __pm_runtime_resume+0x7c/0xa0 ***NOTE***
    mtk_mdp_comp_clock_on+0x48/0x104 [mtk_mdp]
    mtk_mdp_pm_resume+0x2c/0x44 [mtk_mdp]
    pm_generic_runtime_resume+0x34/0x48
    __genpd_runtime_resume+0x6c/0x80
    genpd_runtime_resume+0x104/0x1ac
    __rpm_callback+0x120/0x238
    rpm_callback+0x34/0x8c
    rpm_resume+0x7a0/0x8f8
    __pm_runtime_resume+0x7c/0xa0 ***NOTE***
    mtk_mdp_m2m_start_streaming+0x2c/0x3c [mtk_mdp]

(The calls to pm_runtime_get_sync are inlined and correspond to the
calls to __pm_runtime_resume). It is not correct to have
pm_runtime_get_sync called recursively and the second call will block
indefinitely.

As a result of all that, this change factors mtk_mdp_comp_clock_on/off
into mtk_mdp_comp_power_on/off and moves the calls to
pm_runtime_get/put into the power_on/off functions.

This change then special-cases the master/rdma0 MDP component and does
these things:
- the master/rdma0 component is not added to mtk_mdp_dev.comp_list
- the master/rdma0 component has its clocks (*but not power*) toggled
  by mtk_mpd_comp_clock_on/off inside mtk_mdp_clock_on/off.
- the other components have their clocks *and* power toggled with
  mtk_mdp_comp_power_on/off.

This change introduces the assumption that mtk_mdp_pm_resume will
always be called though a callback from pm_runtime_get_sync made on the
master / rdma0 component.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 57 ++++++++++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  5 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 62 ++++++++++++++-----
 3 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 472c261b01e8..7b6c8a3f3455 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -51,9 +51,9 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
-	int i, err, status;
+	int status, err;
 
 	if (comp->larb_dev) {
 		err = mtk_smi_larb_get(comp->larb_dev);
@@ -63,12 +63,54 @@ int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 
 	err = pm_runtime_get_sync(comp->dev);
 	if (err < 0) {
-		dev_err(comp->dev,
-			"failed to runtime get, err %d.\n",
-			err);
+		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
 		return err;
 	}
 
+	err = mtk_mdp_comp_clock_on(comp);
+	if (err) {
+		dev_err(comp->dev, "failed to turn on clock. err=%d", err);
+		status = err;
+		goto err_mtk_mdp_comp_clock_on;
+	}
+
+	return 0;
+
+err_mtk_mdp_comp_clock_on:
+	err = pm_runtime_put_sync(comp->dev);
+	if (err)
+		dev_err(comp->dev, "failed to runtime put in cleanup. err=%d", err);
+
+	return status;
+}
+
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
+{
+	int status, err;
+
+	mtk_mdp_comp_clock_off(comp);
+
+	err = pm_runtime_put_sync(comp->dev);
+	if (err < 0) {
+		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
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
+}
+
+int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+{
+	int i, err, status;
+
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
 			continue;
@@ -94,7 +136,8 @@ int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
 	return status;
 }
 
-int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
+
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 {
 	int i;
 
@@ -106,8 +149,6 @@ int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 
 	if (comp->larb_dev)
 		mtk_smi_larb_put(comp->larb_dev);
-
-	return pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index f2e22e7e7c45..e3d6aef52869 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -23,8 +23,11 @@ struct mtk_mdp_comp {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
+
 int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
-int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
 extern struct platform_driver mtk_mdp_component_driver;
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 714154450981..a72a9ba41ea6 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -57,29 +57,64 @@ static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 	struct device *dev = &mdp->pdev->dev;
 	int err;
 
+	/*
+	 * The master / rdma0 component will have pm_runtime_get_sync called
+	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_on called on it.
+	 */
+	err = mtk_mdp_comp_clock_on(&mdp->comp_self);
+	if (err)
+		return err;
+
 	list_for_each_entry(comp_node, &mdp->comp_list, node) {
-		err = mtk_mdp_comp_clock_on(comp_node);
+		err = mtk_mdp_comp_power_on(comp_node);
 		if (err) {
 			status = err;
-			goto err_mtk_mdp_comp_clock_on;
+			goto err_mtk_mdp_comp_power_on;
 		}
 	}
 
 	return 0;
 
-err_mtk_mdp_comp_clock_on:
-	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(comp_node);
-
+err_mtk_mdp_comp_power_on:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err)
+			dev_err(&mdp->pdev->dev, "failed to power off after error. err=%d", err);
+	}
 	return status;
 }
 
-static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 {
 	struct mtk_mdp_comp *comp_node;
+	int status, err;
+
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_power_off(comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_power_off;
+		}
+	}
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(comp_node);
+	/*
+	 * The master / rdma0 component will have pm_runtime_put called
+	 * on it through mtk_mdp_m2m_stop_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_off called on it.
+	 */
+	mtk_mdp_comp_clock_off(&mdp->comp_self);
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
@@ -118,8 +153,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	int status;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_register_component(mdp, &mdp->comp_self);
-
 	status = component_bind_all(dev, mdp);
 	if (status) {
 		dev_err(dev, "Failed to bind all components: %d\n", status);
@@ -140,8 +173,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	component_unbind_all(dev, mdp);
 
 err_component_bind_all:
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
-
 	return status;
 }
 
@@ -152,7 +183,6 @@ static void mtk_mdp_master_unbind(struct device *dev)
 	pm_runtime_disable(dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	component_unbind_all(dev, mdp);
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
 }
 
 static const struct component_master_ops mtk_mdp_com_ops = {
@@ -337,9 +367,7 @@ static int __maybe_unused mtk_mdp_pm_suspend(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_off(mdp);
-
-	return 0;
+	return mtk_mdp_clock_off(mdp);
 }
 
 static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
-- 
2.33.0.rc2.250.ged5fa647cd-goog

