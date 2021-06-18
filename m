Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8233AC54E
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 09:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233492AbhFRHzB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 03:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbhFRHyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 03:54:54 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8ABC061760
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 00:52:46 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id m2so7126226pgk.7
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2TBvKyJlK7P3ijJk5dxGj1vYNvGN7FjI2WrlbeTQp8=;
        b=eMZu6wrUEM2H0nZIGcgrEyk1YXLO8EqaPDMOH9hJ3BXFw4Y9ljj22g0JfAFy8IHPB4
         HStLkEWieoih66ftzSo94nVRSju4Kycdmf6FdblYVoUHNLWk0+hThoHj0LvxrTMHcY4n
         06ZxxI1f4y382fa3AqLEkuZP4bGmyYIqk/BT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2TBvKyJlK7P3ijJk5dxGj1vYNvGN7FjI2WrlbeTQp8=;
        b=hJUtCBGwPe4vtOvbKxgGY5dOgPO9dEzO6UD/DLjICnvwtGCXT7R7Bv/jLHKhjt+Y3g
         xWrqi8u0sM0o4jpA9lPib26bk1UuH94P83xBUyKUkP3GRGvgv3ycuKVOwus6kzUWBa17
         Yx64RjXcD6aosfLdJCCiC1F8sJfTHXCsHFC65s3Hvs2iH1WQDaH9QdzpObruBvIlX61O
         zAAuMZNDv0eTkmtTHwlnXRFAJ0VkyqzXDh2WH9mqtGpWF3ilM8mP3V1WvCjm11tg/KTS
         I4cDasNBksCySy6Q4qNb1vC6aRQI0pAETVtSDZeTLQiPNNPUrKwbw0pIpHIJS4EvIMtJ
         tN9w==
X-Gm-Message-State: AOAM532qbM/dQ4hpLwAcXs6FDDmdNmRZRvUcfg8oIUXq1ndSYHdHojj+
        hVoDIFco5DmwrldPDzi+iLkDsQ==
X-Google-Smtp-Source: ABdhPJxx96d41sKjQw6hvoWs0E8mik5It2Ke92EOv9u55fbueLbCGo6bzy3/UVvH61VFdw04LT5SqQ==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr8673442pgh.429.1624002765670;
        Fri, 18 Jun 2021 00:52:45 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
        by smtp.gmail.com with UTF8SMTPSA id o16sm6718083pfu.75.2021.06.18.00.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 00:52:45 -0700 (PDT)
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
Subject: [PATCH v3 3/8] media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
Date:   Fri, 18 Jun 2021 17:52:04 +1000
Message-Id: <20210618175059.v3.3.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618075209.1157766-1-eizan@chromium.org>
References: <20210618075209.1157766-1-eizan@chromium.org>
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
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 28 ++++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  3 ++
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 23 ++++++++++-----
 3 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 8cebc3565826..9a12717ce416 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -53,15 +53,31 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
-	int i, err;
+	int err;
 
 	err = pm_runtime_get_sync(comp->dev);
 	if (err < 0)
-		dev_err(comp->dev,
-			"failed to runtime get, err %d.\n",
-			err);
+		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
+
+	mtk_mdp_comp_clock_on(comp);
+}
+
+void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp)
+{
+	int err;
+
+	mtk_mdp_comp_clock_off(comp);
+
+	err = pm_runtime_put_sync(comp->dev);
+	if (err < 0)
+		dev_err(comp->dev, "failed to runtime put, err %d.\n", err);
+}
+
+void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
+{
+	int i, err;
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		if (IS_ERR(comp->clk[i]))
@@ -81,8 +97,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
-
-	pm_runtime_put_sync(comp->dev);
 }
 
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 355e226d74fe..7ad9b06bb11b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -21,6 +21,9 @@ struct mtk_mdp_comp {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
 
+void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
+void mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
+
 void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index c55bcfe4cbb7..5e71496e2517 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -53,8 +53,15 @@ static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
 	struct mtk_mdp_comp *comp_node;
 
+	/*
+	 * The master / rdma0 component will have pm_runtime_get_sync called
+	 * on it through mtk_mdp_m2m_start_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_on called on it.
+	 */
+	mtk_mdp_comp_clock_on(&mdp->comp_self);
+
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_on(comp_node);
+		mtk_mdp_comp_power_on(comp_node);
 }
 
 static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
@@ -62,7 +69,14 @@ static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
 	struct mtk_mdp_comp *comp_node;
 
 	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_off(comp_node);
+		mtk_mdp_comp_power_off(comp_node);
+
+	/*
+	 * The master / rdma0 component will have pm_runtime_put called
+	 * on it through mtk_mdp_m2m_stop_streaming, making it unnecessary to
+	 * have mtk_mdp_comp_power_off called on it.
+	 */
+	mtk_mdp_comp_clock_off(&mdp->comp_self);
 }
 
 static void mtk_mdp_wdt_worker(struct work_struct *work)
@@ -101,8 +115,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	int status;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_register_component(mdp, &mdp->comp_self);
-
 	status = component_bind_all(dev, mdp);
 	if (status) {
 		dev_err(dev, "Failed to bind all components: %d\n", status);
@@ -124,8 +136,6 @@ static int mtk_mdp_master_bind(struct device *dev)
 	component_unbind_all(dev, mdp);
 
 err_component_bind_all:
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
-
 	return status;
 }
 
@@ -136,7 +146,6 @@ static void mtk_mdp_master_unbind(struct device *dev)
 	pm_runtime_disable(dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	component_unbind_all(dev, mdp);
-	mtk_mdp_unregister_component(mdp, &mdp->comp_self);
 }
 
 static const struct component_master_ops mtk_mdp_com_ops = {
-- 
2.32.0.288.g62a8d224e6-goog

