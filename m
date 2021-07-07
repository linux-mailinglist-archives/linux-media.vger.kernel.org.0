Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1EE3BE3AC
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 09:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhGGHhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 03:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbhGGHhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 03:37:55 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76043C061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 00:35:15 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cs1-20020a17090af501b0290170856e1a8aso3161307pjb.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 00:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jErpp84GwQGNzBBNWcnsVoe6gUCqeLHOzonns3HylCY=;
        b=ndzMNQdwvoK07+UcIU4Chgpe5L5yVFSB+oBNoR+8gB1nIi50PYP0R+Cw2PYC8ZUHfy
         blfPHEiL0IJR1Tu2u8WjE+J8VIuIxIC+979xU+QCWa4gnOVXK5l+K1wPwPsO27RaVqVB
         rW9hTesQ8GAE3ZhqUho2TP2FqnSff7QNMI27Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jErpp84GwQGNzBBNWcnsVoe6gUCqeLHOzonns3HylCY=;
        b=Cd8lOINQ//dxIZ/zy3hCKabFkTT4uz/X9dkQuGqUzQvmvleplB8duHkZNGxY1q9j4j
         IapXiNgOULS/6z8aFRT920+nT/WxLIkHZkKKWlGY1on0VAT0xUiE6fWct9l1rmKjs1Mv
         TfhPwcHFqWhj/bGtn34NI74Xg2fQhcxT2F+cO69zJUFG8XO6er1NaRMI0kUyadODqLGO
         2KQTaNoVB8IVaL8Mu0F8I3DGHHh0ARgh6ANqxGRNRHKvYDPq12N5FI7c3c9Cu5eKtnfL
         J2MrlsxqPlXygjxbiG86M/rCrQBzzqK+gzQgVEB5iTDhw0zpVMpgcPtKZMgi07u0c6KI
         PcpQ==
X-Gm-Message-State: AOAM532ghn/6JTc5s+FjEbpv8LA0nQ05T4hX2bOchtOMnommU9Lj0isE
        w4TiQ3JhzDYFkWg9z+LK/+K12A==
X-Google-Smtp-Source: ABdhPJzoSWJTIbTakKznRm1MUPkZxH5kiu6c5qpT2NVWgUfoimWrcVYcTViVaTm9n6VVBd9nMLFG5w==
X-Received: by 2002:a17:902:f242:b029:129:9911:30e8 with SMTP id j2-20020a170902f242b0290129991130e8mr9444392plc.44.1625643315053;
        Wed, 07 Jul 2021 00:35:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:ccb9:d95f:4dac:dbc4])
        by smtp.gmail.com with UTF8SMTPSA id k19sm17072916pji.32.2021.07.07.00.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 00:35:14 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     houlong.wei@mediatek.com, enric.balletbo@collabora.com,
        wenst@chromium.org, yong.wu@mediatek.com, chunkuang.hu@kernel.org,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v4 6/8] media: mtk-mdp: propagate errors better in pm_suspend/resume
Date:   Wed,  7 Jul 2021 17:34:08 +1000
Message-Id: <20210707173108.v4.6.If7d6a147afd8880940c42d7998e47ed3869e8805@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210707073410.999625-1-eizan@chromium.org>
References: <20210707073410.999625-1-eizan@chromium.org>
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
2.32.0.93.g670b81a890-goog

