Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D5E3DD558
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 14:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhHBMMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 08:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233621AbhHBMMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 08:12:46 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06B9C06179A
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 05:12:35 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id t3so17261012plg.9
        for <linux-media@vger.kernel.org>; Mon, 02 Aug 2021 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZviZKKS5zt5VRJZud/1hXXwMNiDi17ry2eyhIG3EEHA=;
        b=eLK7SeiVe0xtM1i3VwFTzL+lvc07HgEwOf/UxdpuKGWXrPufUHub2C+iAvFg3iAAaj
         e48gy8OAJo/pPUK6JNmRbtBYLqUq+3FvM7sNw4jmDslD8Wt0n/3HVANJTy8Zgzt3mmKH
         SuHWI4FX6sgetm8GJSOkmvYZWpjGJdcpK/TD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZviZKKS5zt5VRJZud/1hXXwMNiDi17ry2eyhIG3EEHA=;
        b=lK4q3s6ljpWX9fFfHwtt/AA2+rTvo8t+I4O7tnNH++dH+/cBbKyQKU8XTAVCznJJnq
         tBH0cngPn22NUV19W+UEEpzcqJh/dMGpgZCa+DsU+uyjrQ1O+OphkMmKQ1wtCdyHBB9N
         6skQ2e4jTEXP4Q5XWDm7eO9A5eIRI37gSg3WvxeFsNb5o2FhsLW45Zv/9qIMaBsEPbtw
         /3rapyrHSaK3AJFznYlD439cUrymYVCa5d1wadix23TR4pKQNnxlnRXmdiDgNoEV88AD
         xve4U8fTJ7qA86hY5iv82ApUtqYEyeszAOStZF+DLQvDxNmffx0sHMPnepUfL6+GScID
         SevQ==
X-Gm-Message-State: AOAM532T4t3rJJWrgj1jn76lxDt1u7yrhHcoeKDAunCcZ6XjYw9Zxk10
        0Kk3N4Wej/GZ1S7VIZtCd4/6iQ==
X-Google-Smtp-Source: ABdhPJzufei59mRMqQWISJty4OzpCb27BEq+4Hyc8ne/YBqVK51kUqGp4k9uK7LYhl4yBPjLoUVu5w==
X-Received: by 2002:a65:6243:: with SMTP id q3mr681044pgv.297.1627906355381;
        Mon, 02 Aug 2021 05:12:35 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:cd34:e942:c094:baef])
        by smtp.gmail.com with UTF8SMTPSA id j5sm7603827pjv.56.2021.08.02.05.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 05:12:35 -0700 (PDT)
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
Subject: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
Date:   Mon,  2 Aug 2021 22:12:07 +1000
Message-Id: <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
References: <20210802121215.703023-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Up until this change, many errors were logged but ignored when powering
on clocks inside mtk_mdp_core. This change tries to do a better job at
propagating errors back to the power management framework.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 25 ++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 27 ++++++++++++++-----
 3 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index b3426a551bea..76e295c8d9bc 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -13,10 +13,9 @@
 
 #include "mtk_mdp_comp.h"
 
-
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
+int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 {
-	int i, err;
+	int i, err, status;
 
 	if (comp->larb_dev) {
 		err = mtk_smi_larb_get(comp->larb_dev);
@@ -30,11 +29,23 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
 		if (IS_ERR(comp->clk[i]))
 			continue;
 		err = clk_prepare_enable(comp->clk[i]);
-		if (err)
-			dev_err(dev,
-			"failed to enable clock, err %d. type:%d i:%d\n",
-				err, comp->type, i);
+		if (err) {
+			status = err;
+			dev_err(dev, "failed to enable clock, err %d. i:%d\n", err, i);
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
 
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 7897766c96bb..92ab5249bcad 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -41,7 +41,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 		      struct mtk_mdp_comp *comp,
 		      enum mtk_mdp_comp_type comp_type);
 void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
-void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
+int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
 
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 976aa1f4829b..412bbec0f735 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -52,13 +52,28 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
 
-static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
+static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
 {
-	struct device *dev = &mdp->pdev->dev;
 	struct mtk_mdp_comp *comp_node;
+	int status;
+	struct device *dev = &mdp->pdev->dev;
+	int err;
 
-	list_for_each_entry(comp_node, &mdp->comp_list, node)
-		mtk_mdp_comp_clock_on(dev, comp_node);
+	list_for_each_entry(comp_node, &mdp->comp_list, node) {
+		err = mtk_mdp_comp_clock_on(dev, comp_node);
+		if (err) {
+			status = err;
+			goto err_mtk_mdp_comp_clock_on;
+		}
+	}
+
+	return 0;
+
+err_mtk_mdp_comp_clock_on:
+	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node)
+		mtk_mdp_comp_clock_off(dev, comp_node);
+
+	return status;
 }
 
 static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
@@ -274,9 +289,7 @@ static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
 {
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
-	mtk_mdp_clock_on(mdp);
-
-	return 0;
+	return mtk_mdp_clock_on(mdp);
 }
 
 static int __maybe_unused mtk_mdp_suspend(struct device *dev)
-- 
2.32.0.554.ge1b32706d8-goog

