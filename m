Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825F93C1D74
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 04:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhGIC1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 22:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhGIC1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 22:27:04 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706B8C061574
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 19:24:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id oj11-20020a17090b4d8bb029017338c124dcso2526516pjb.0
        for <linux-media@vger.kernel.org>; Thu, 08 Jul 2021 19:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hjFPIGSoMHpNul4BO6Tr5Qp0GpDDoCJp2zkjn1+wsBo=;
        b=d2fxoZbBqqTMwaZNhJeriW1/TriG5cxrOGUtPBhbJhPVTo73SJDiSVtePPgW2j2RfU
         tKdXTS6AArgd6yKsq7ORJnYD18TESJ55juDCbC9virBT30sX8Q2hgmOcUoVd02Y7dX0k
         LY+sCfUTMAQPluSbYnecT9XAuSm0DuX0/vFOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hjFPIGSoMHpNul4BO6Tr5Qp0GpDDoCJp2zkjn1+wsBo=;
        b=lGFTZEX09cW1v2kAAnkAa5zpZLKuvpULWvDGDtcefyX0XVyyqE8DcP1hdmTw/82m4z
         eXLnOmwV9P8+O0oYQ2cDjJBWbZvNKBd01ma3tzMDfhQYTPPeRTdjPK1fI0c15RmA1rcX
         PPrxDC1hTrg0sE0l4NzrtR8DJMjbyE42fnTh2iCk2+UJeSYgXlYbFnmHnsJxRZb75Vhg
         4m6tqW2erbmPBWM3UZz1NCsSzCx0zrjTPiDmbJe9NfJVPGOVoD5wzn84sNl9Y2k2qSz1
         EIg1RJszaa+6ZV3HRwbluZDu66Nd90CjN29sY+/CcqxKXMz24sflr+SRJHySHDSxpohn
         +N8w==
X-Gm-Message-State: AOAM532hsETvhTiriNRF3SMCH/oTQ/JTZiaAzJvghttyTrnEwSXnLXbn
        qajofGM9+rpuScIK0Sa0yuVMUw==
X-Google-Smtp-Source: ABdhPJxSKXmREBIm5buYZ1ygEBxNpjj0P7/SBGNJWMnot7OoYHhTxW5aJEWjfqDHbRnPKzlHtknnlA==
X-Received: by 2002:a17:90b:4a90:: with SMTP id lp16mr35011298pjb.137.1625797461011;
        Thu, 08 Jul 2021 19:24:21 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d956:2966:7910:2bd2])
        by smtp.gmail.com with UTF8SMTPSA id m18sm170914pfd.42.2021.07.08.19.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 19:24:20 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
        enric.balletbo@collabora.com, houlong.wei@mediatek.com,
        Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v5 6/8] media: mtk-mdp: propagate errors better in pm_suspend/resume
Date:   Fri,  9 Jul 2021 12:23:22 +1000
Message-Id: <20210709122040.v5.6.If7d6a147afd8880940c42d7998e47ed3869e8805@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709022324.1607884-1-eizan@chromium.org>
References: <20210709022324.1607884-1-eizan@chromium.org>
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
index 8a9267d0da1e..87e3f72ff02b 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -53,9 +53,9 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
 
-void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
-	int err;
+	int status, err;
 
 	if (comp->larb_dev) {
 		err = mtk_smi_larb_get(comp->larb_dev);
@@ -65,34 +65,76 @@ void mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 	}
 
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
index 15ef9539a5a7..5201c47f7baa 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -23,10 +23,10 @@ struct mtk_mdp_comp {
 
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
index 74ef37eb50bd..b45d588d2659 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -50,8 +50,9 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 
-static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
+	int err, status;
 	struct mtk_mdp_comp *comp_node;
 
 	/*
@@ -59,18 +60,41 @@ static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
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
@@ -78,6 +102,17 @@ static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
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
@@ -318,18 +353,14 @@ static int __maybe_unused mtk_mdp_pm_suspend(struct device *dev)
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

