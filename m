Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033D03A3AAB
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 06:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhFKEEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 00:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbhFKEEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 00:04:54 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743DEC0617AE
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:41 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id x10so2163662plg.3
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zpuuyZX5Ieel/toEhqaynm1+cB0UGivDIT7WkJ9Wrbs=;
        b=UJOx/qDoUCJiQuVKW4HhgE64kdIaaBumhGmNb/IqxFb/8RJTE/PmuFechrbRkxYw4s
         FurmOw8/eGeyXX6TrsU/oXeEIN/6gZUKv2Ay63XGTzLlehG13PC7eHEzTBN5EkJhqrBt
         oSendpq5KOfCmQd6HXd/iwDdXcawHA3yfHC+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zpuuyZX5Ieel/toEhqaynm1+cB0UGivDIT7WkJ9Wrbs=;
        b=EQ4+wsFA3OmiymldPAmuHwYzezHxI2dl07gTerJd/ode88G9yhylbZl7JRnjp1Edkd
         HuALTLg6PyUFFGDbx9ppo06BiwS0Yf2phSK7QCWEt0JUdFwwYmjhTKCLq5JoX7L/vAll
         ksq/NBqQ3f/xymtC4DC6nGmj1dzyPoNTLRpKk5o/iqNntLf2iwZ0BR9RZs3hCw+gpxqI
         yhAEOLiH5wpzOu/HlHuOs8PzLTcxXoq4fzBoRo4c9euB5HjNUHWr+zUC1joM8B2a+/yO
         0OZA2hBS+/67+GDTyvqcnlYfRZYlCe6wWrbBB4v09lUQSdYRpsWFhp7LiqoxaA7ZEIJ1
         ttdg==
X-Gm-Message-State: AOAM532+PB4uWCa1OYOby9oWBaAnOD7tTPWWc2PTDvZH5WBYeduNnzsJ
        Sp/9ZzjBRfof9hbZbPz7YpFg5A==
X-Google-Smtp-Source: ABdhPJz9UGkfR/m5Tcy+qUD1mlxKWaupak7n44yapumthpB/XHCSLVasmdM/x73NiTdzhzOkN6Q7OQ==
X-Received: by 2002:a17:902:b181:b029:fc:c069:865c with SMTP id s1-20020a170902b181b02900fcc069865cmr2061779plr.28.1623384161010;
        Thu, 10 Jun 2021 21:02:41 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
        by smtp.gmail.com with UTF8SMTPSA id v18sm3752881pff.90.2021.06.10.21.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 21:02:40 -0700 (PDT)
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
Subject: [PATCH v2 5/8] media: mtk-mdp: search for vpu node instead of linking it to a property
Date:   Fri, 11 Jun 2021 14:01:42 +1000
Message-Id: <20210611140124.v2.5.I0cbd6691d3edfa2757bd6f5de7acfce94b101480@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611040145.2085329-1-eizan@chromium.org>
References: <20210611040145.2085329-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since there is only one vpu node, it suffices to search for it instead
of having a link coded into the primary mdp device node.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  6 ----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 28 +++++++++++++------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index fdbb46a5330a..3d9bb7265159 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -117,12 +117,6 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 	if (vpu_node) {
 		int ret;
 
-		mdp->vpu_dev = of_find_device_by_node(vpu_node);
-		if (WARN_ON(!mdp->vpu_dev)) {
-			dev_err(dev, "vpu pdev failed\n");
-			of_node_put(vpu_node);
-		}
-
 		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
 		if (ret) {
 			dev_err(dev, "Failed to register v4l2 device\n");
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 267e4cb4bf32..48e9a557c446 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -113,6 +113,7 @@ static void release_of(struct device *dev, void *data)
 static int mtk_mdp_master_bind(struct device *dev)
 {
 	int status;
+	struct device_node *vpu_node;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
 	status = component_bind_all(dev, mdp);
@@ -121,15 +122,24 @@ static int mtk_mdp_master_bind(struct device *dev)
 		goto err_component_bind_all;
 	}
 
-	if (mdp->vpu_dev) {
-		int ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
-					  VPU_RST_MDP);
-		if (ret) {
-			dev_err(dev, "Failed to register reset handler\n");
-			goto err_wdt_reg;
-		}
-	} else {
-		dev_err(dev, "no vpu_dev found\n");
+	vpu_node = of_find_node_by_name(NULL, "vpu");
+	if (!vpu_node) {
+		dev_err(dev, "unable to find vpu node");
+		status = -ENODEV;
+		goto err_wdt_reg;
+	}
+
+	mdp->vpu_dev = of_find_device_by_node(vpu_node);
+	if (!mdp->vpu_dev) {
+		dev_err(dev, "unable to find vpu device");
+		status = -ENODEV;
+		goto err_wdt_reg;
+	}
+
+	status = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp, VPU_RST_MDP);
+	if (status) {
+		dev_err(dev, "Failed to register reset handler\n");
+		goto err_wdt_reg;
 	}
 
 	status = mtk_mdp_register_m2m_device(mdp);
-- 
2.32.0.272.g935e593368-goog

