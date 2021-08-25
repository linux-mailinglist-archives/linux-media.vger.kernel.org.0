Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A6C3F6F8E
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 08:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239115AbhHYGen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 02:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239034AbhHYGek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 02:34:40 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47931C061757
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:33:55 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id q21so4730425plq.3
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=19laOyRbxi7dNQIHLVJQGG2qtMrhfAARdoeRSPPs6wk=;
        b=nDYrBNEmM/es46/uYQl/3rYZlfTcpxxYP6vnYd2xDkOqUT/fq7z6pG7X2RMioSmq7o
         9R/sGspY+FJdy/JciwBzERjPkueL137nZVW6E9JM0ZLHCScOOfu99+4hVgduEFh5F4yE
         hogeetDjJ9jmbNqmXiUJDcTpz3kmfoU3DqjW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19laOyRbxi7dNQIHLVJQGG2qtMrhfAARdoeRSPPs6wk=;
        b=O7bjYbB6mZCgBllS9cBwcRUABXcNOLgAufIhphkBGsbvYHKeBYd5JH1NGwVYb01mCa
         dtBh541RReWLMBYUlulU3pCHPmxS4/b2MDjmvhmghqXFgN+yEbkiV1HY1UwmEE5CQn7y
         KOY4HFRjnz+6fMw9fUP8fc2huxzId3tYT52C7QHxTJm9oSXUAQ/O+7KLjqJPhjVssphT
         BjfVwjC+MROWJntEt4GtGOHC6ouwhxATW2g6Cka/kPu4c++233WQfHyRzNG1Twb8DRLD
         ez9A/l37J/pLBNlgm71leh/BXn31LJuIIj+5PcRjk9Wv7K27yudH0w/Ib6YNnkkJQToI
         RYWw==
X-Gm-Message-State: AOAM532htOX0wGUZyr0Dd/0+XOBfcNEDyBApOLmXbPFOKZwyUxBX2G0S
        vxMOaK4rVemXDeJqlbtdP55eDA==
X-Google-Smtp-Source: ABdhPJyrxFL/qej64mhKdVLkwKxzB+fMwg3yrEloSGDFTMIWcN1QlDmlEtDyecQyZUswOV1dYkg8eQ==
X-Received: by 2002:a17:902:8f97:b0:12f:fff9:bad4 with SMTP id z23-20020a1709028f9700b0012ffff9bad4mr26689750plo.65.1629873234821;
        Tue, 24 Aug 2021 23:33:54 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
        by smtp.gmail.com with UTF8SMTPSA id c15sm20830615pfl.181.2021.08.24.23.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 23:33:54 -0700 (PDT)
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
Subject: [PATCH v7 1/7] mtk-mdp: propagate errors from clock_on
Date:   Wed, 25 Aug 2021 16:33:17 +1000
Message-Id: <20210825163247.v7.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Up until this change, many errors were logged but ignored when powering
on clocks inside mtk_mdp_core. This change tries to do a better job at
propagating errors back to the power management framework.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
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
2.33.0.rc2.250.ged5fa647cd-goog

