Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965213A3AA9
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 06:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhFKEEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 00:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbhFKEEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 00:04:40 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED76DC061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:26 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id l1so1420021pgm.1
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lACjQG1o0nJMw/qqdJI0121HB32Gd9hhUmo902ISutw=;
        b=V4v3zILAGo8uM5EF2tKjFX5ZJ4Azqxoq5NqTHSesXmA+4tyjd7EAbFL6Nh97Gt3Ehl
         GBsu/CYi60U6XAl/ZaK0Ypy3x01ygXhjkjY7laRKwUCQE3jXFh87v6VcMe/+qbjsKxBP
         hnBfhJhOPG9D2W5UYlBMjHAlag6//O4JuToco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lACjQG1o0nJMw/qqdJI0121HB32Gd9hhUmo902ISutw=;
        b=gogeq0DCCVkzOvJm7XoavTU9zIizqU9Z94+0UOdR7XVly7MMaoz9N0ghVmIceeiFLO
         1eshnzVdgFdmHKOD8jKqk9SvAeEQal5DbYS2lyVDJhNDhTbaWPNSfHD8RvIh9s/j0pRU
         Y1EaxmPmEjvKDAwIAAtRPvHp3CsN9pYEgkv9YuUZH/gfiBF1Xge/yZcD9P050GVhDoyZ
         eQv6SwAwhqEKIntB3CZjQ/5PVdsDZaCM+ASy5+0/aFDzu2htpyQ9bRUaJxmxAYr6YWrC
         BkFNYFzmElTKoGAhlIt4evoGEx4AX6VPgJqCJBCKoBPbD/5JeyRIBCKHT3xasPTJrLQ6
         8tow==
X-Gm-Message-State: AOAM5337tY9TenZiT6ecSuOxp7AI5nBkpN9k3pHwYfpn5NezHGwO60P9
        7AZdbufOQRTcHdI5jiuI7nm7aA==
X-Google-Smtp-Source: ABdhPJyJFDysdnds3wBb3vFk87p6X6o+30vn2vPBFv9XRZx3dxa+iFvVXnel3bVB3BJRGuQYZWg5qA==
X-Received: by 2002:a63:e952:: with SMTP id q18mr1615665pgj.430.1623384146513;
        Thu, 10 Jun 2021 21:02:26 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
        by smtp.gmail.com with UTF8SMTPSA id pi8sm3659848pjb.52.2021.06.10.21.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 21:02:26 -0700 (PDT)
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
Subject: [PATCH v2 3/8] media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
Date:   Fri, 11 Jun 2021 14:01:40 +1000
Message-Id: <20210611140124.v2.3.Ifd87681955689a08cce4c65e72ee5e8c6d09af95@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611040145.2085329-1-eizan@chromium.org>
References: <20210611040145.2085329-1-eizan@chromium.org>
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
2.32.0.272.g935e593368-goog

