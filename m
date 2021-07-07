Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771783BE3A8
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 09:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhGGHht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 03:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhGGHhs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 03:37:48 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B3BC061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 00:35:08 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so844848pju.4
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cz5Yf26hS0mQEs4OKDDFPHwtGleZDBuXb5hOWYwdOV4=;
        b=cf/lds2uXZML++gxAnlsKaNN9m0W9hvYqI8NMIfH7HW/ri1D+YjOSJ8H8329TEDwCM
         f0EPCHqhkbD0TD/R7ETL+mS9V0EUq/8uJQM59sU8wqqG9ZB2lWxEA8Aqi++WraUAKdh/
         1DwfBbbfvdpYzYXxTAZeEhSDFBGaFTP6Zwq6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cz5Yf26hS0mQEs4OKDDFPHwtGleZDBuXb5hOWYwdOV4=;
        b=BtDCxd+e+FrzniAWdTnPrlE8DqKahuCileoCmsvxiedD8YR5czDWA1BkAev2roswA2
         hKsFn34CWpLYdMxAzkgrc207noQ690zPfNU89g7RHxpC7Y4fxlFoONmxTj49bPtFtl3N
         +mPsg95I8+SZI3lD2nFz9h0QndMBSb4F4USJZnbl43kC0Vw3jTf3AVbhMTEyEPZZPvOv
         SccazBT1dsqps9ShsrjixJqB0Hxnr0jl4TChGiEiLGEGmmzHagzpbyHTRfwpW2xv56M3
         /5nzZhv1DEg34vBLsj4AliUnzeM/kqumMpCUmCkUtcE4WXoUd67YPKn7RCKx5WPnzQGg
         uFyw==
X-Gm-Message-State: AOAM532wLSFh9ZRLUSJ1fXfjYsgvP8skA5d2aqabFoJWuOziVEF9+vz+
        IpPE3IghEGGfwiDucNCTDmpx5Q==
X-Google-Smtp-Source: ABdhPJwgYAgzSOqCb9aR3c1XJWh5okmVPcJwiT7+q7wrJLwi8pWgTbku9wDoDhB2jXjVxJc29ywabw==
X-Received: by 2002:a17:90b:4b82:: with SMTP id lr2mr16752540pjb.111.1625643307806;
        Wed, 07 Jul 2021 00:35:07 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:ccb9:d95f:4dac:dbc4])
        by smtp.gmail.com with UTF8SMTPSA id m10sm19087343pff.215.2021.07.07.00.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 00:35:07 -0700 (PDT)
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
Subject: [PATCH v4 5/8] media: mtk-mdp: search for vpu node instead of linking it to a property
Date:   Wed,  7 Jul 2021 17:34:07 +1000
Message-Id: <20210707173108.v4.5.I0cbd6691d3edfa2757bd6f5de7acfce94b101480@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210707073410.999625-1-eizan@chromium.org>
References: <20210707073410.999625-1-eizan@chromium.org>
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
2.32.0.93.g670b81a890-goog

