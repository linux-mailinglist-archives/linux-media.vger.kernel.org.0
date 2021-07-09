Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C373C1D71
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 04:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbhGIC05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 22:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhGIC05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 22:26:57 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DE7C061574
        for <linux-media@vger.kernel.org>; Thu,  8 Jul 2021 19:24:14 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ie21so4957234pjb.0
        for <linux-media@vger.kernel.org>; Thu, 08 Jul 2021 19:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rYIiMjbCmn43Rbsp7mN8fJ7VxPLz2wz8aV49oHF0Izc=;
        b=i1W29XOJ/AORywSkCdaZRa5IuPXvzW6EDR2EQaXxNIbVo5w1NppVS1U6RavsQXP2F2
         8LR9Y4VCXnsWgBpD+/+LpQgE0bkFZRUZA/zdKDYWVYN2EvnU6sFsDR/OE9bayH0FTliU
         91UAht22nwAHXs/rG+Z5brFgo0YnmEvUtpI4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rYIiMjbCmn43Rbsp7mN8fJ7VxPLz2wz8aV49oHF0Izc=;
        b=FfN3mQs/8oJhRiz4aQ9W7zHcsXSch4LFnXt8RilfHmU1ZbZSZINixd4+jPGSqmWBmV
         /Ercp4x98Ky/FQyhfSTOitTVLXjUHHbrbZ0SSAcaYiOJYsefihf3B2VHkmK4ILxu8Jce
         xdJCLDYddCO6xhfzYyHoqzYoAZfmbOZ0Oh/3wT0VHSgtLaLjV8/CfFfSvSVvBeQCRuDg
         myE895jjubroVhWjERumhw/PM+w8LUlJgQpk3KnymqRKi9AA/v9lMfaFWB5ay8BIElN5
         9+p7x6qVgzFocGrdBMTzPFHYww/Vm6eWMhnX5DOfiGUre3hzO5ubi9/4Sj1+cfluXMAd
         35Eg==
X-Gm-Message-State: AOAM530IPH+BAy/xg00fBon4O3Gv1Q1eXSUmNNqhFUwx25XKfVGHB3it
        Sw/nOJrqVsBX4qlL7LqvLamkww==
X-Google-Smtp-Source: ABdhPJxx+2zh5ok23idoYfWplSj2eD0UhpNEeZkKeWCpitflaqJX/xgHdimutf+wQ0oa/4kekFVOew==
X-Received: by 2002:a17:902:9006:b029:107:394a:387 with SMTP id a6-20020a1709029006b0290107394a0387mr28492430plp.35.1625797453759;
        Thu, 08 Jul 2021 19:24:13 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d956:2966:7910:2bd2])
        by smtp.gmail.com with UTF8SMTPSA id y17sm4046053pfl.189.2021.07.08.19.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 19:24:13 -0700 (PDT)
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
Subject: [PATCH v5 5/8] media: mtk-mdp: search for vpu node instead of linking it to a property
Date:   Fri,  9 Jul 2021 12:23:21 +1000
Message-Id: <20210709122040.v5.5.I0cbd6691d3edfa2757bd6f5de7acfce94b101480@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709022324.1607884-1-eizan@chromium.org>
References: <20210709022324.1607884-1-eizan@chromium.org>
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
index 0ee6c7d65664..8a9267d0da1e 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -127,12 +127,6 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
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
index 9af3dc0e204a..74ef37eb50bd 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -114,6 +114,7 @@ static void release_of(struct device *dev, void *data)
 static int mtk_mdp_master_bind(struct device *dev)
 {
 	int status;
+	struct device_node *vpu_node;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
 
 	status = component_bind_all(dev, mdp);
@@ -122,15 +123,24 @@ static int mtk_mdp_master_bind(struct device *dev)
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

