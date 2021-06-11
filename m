Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C193A3AAD
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 06:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhFKEFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 00:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbhFKEFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 00:05:07 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F030DC0617AD
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:56 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id v13so2159111ple.9
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8XFKmXX+Z8zBE+LvKxlcbsoweak/MaB5nJN3HXAfDUI=;
        b=TjO2rbze6Hl1C/ma0Cxmypa4hqczGAiGrDGeahbZ8pF58o9czM7knR42g1jTT3WYfW
         5T3rnHte+PlaVAmU9+BSjRwleCx7bY6Ti5WZv/JWrQnPuFSsjOSBtGZ+ZlC4HDYL9w8W
         4B1ZPHiXZRyxGxo9l5zn7GsnlhoPgFKQgxEEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8XFKmXX+Z8zBE+LvKxlcbsoweak/MaB5nJN3HXAfDUI=;
        b=A6/CYAyQ76ZS6c1JRHuwqg7i8Lp/pTaWPl2NO8mrTLWjTJ9OvUGLTA8EqEmJ8PEfCP
         MIGfd/fkM3aTwjkCzKrDnSKpvhGNWj+OKEHJPH0Mqo6tF8lK0NqI5MFe6LTbkZmQAVKi
         JMIHteThwUyr6tawLQA3qAg4ZC+BqaLl5YyHRLCO1emA3PjnirvLlQjd43r54riIpiYF
         pHWV+ac1+tF+2lDndw3C8rfhjnKjSY3skl71AalpbG9Hgr3k/P/ovFHlLhkzxjOwhoRH
         E+ttfs9ZSJ1k+zWr+Rob9jw0BBR8Net6UQwL3lBeUGeiGUnZDyNhITmrZWvRdrD8YiG5
         yD+g==
X-Gm-Message-State: AOAM532ZuazjtigIBdD8OnQZk8JrM3JNKRmcwLNXt6g+7AZJ0ZA+MOXi
        5PSVPWK9es1xfqTVuqPbhX2rvQ==
X-Google-Smtp-Source: ABdhPJw6JBRfw+XnBfj0SsNQjSFAjC9f3KJYRasmUse4UZLoDYVydM7J7wSRvsMMDZcHIslDqOI+hg==
X-Received: by 2002:a17:90b:d81:: with SMTP id bg1mr1055411pjb.112.1623384176460;
        Thu, 10 Jun 2021 21:02:56 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:db52:e918:e5f9:9e14])
        by smtp.gmail.com with UTF8SMTPSA id o9sm3945251pfh.217.2021.06.10.21.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 21:02:56 -0700 (PDT)
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
Subject: [PATCH v2 7/8] media: mtk-mdp: treat rdma@14001000 specially when probing
Date:   Fri, 11 Jun 2021 14:01:44 +1000
Message-Id: <20210611140124.v2.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611040145.2085329-1-eizan@chromium.org>
References: <20210611040145.2085329-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

... Instead of depending on the presence of a mediatek,vpu property in
the device node.

This property was originally added to link to the vpu node so that the
mtk_mdp_core driver could pass the right device to
vpu_wdt_reg_handler(). However in a previous patch in this series,
the driver has been modified to search the device tree for that node
instead.

This property was also used to indicate the primary MDP device, so that
it can be passed to the V4L2 subsystem as well as register it to be
used when setting up queues in the open() callback for the filesystem
device node that is created. In this case, assuming that the primary
MDP device is the one with a specific name at a specific address seems
useable because the alternative is to add a property to the device tree
which doesn't actually represent any facet of hardware (i.e., this
being the primary MDP device is a software decision). In other words,
this solution is equally as arbitrary, but doesn't add a property to
a device node which is unrelated to the hardware present.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 15 ++++-----------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 59911ee063c1..77ddc18c90e2 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -146,17 +146,11 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 {
 	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
 	struct mtk_mdp_dev *mdp = data;
-	struct device_node *vpu_node;
 
 	mtk_mdp_register_component(mdp, comp);
 
-	/*
-	 * If this component has a "mediatek-vpu" property, it is responsible for
-	 * notifying the mdp master driver about it so it can be further initialized
-	 * later.
-	 */
-	vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
-	if (vpu_node) {
+	if (strcmp(dev->of_node->full_name, "rdma@14001000") == 0) {
+		/* This is the primary MDP device node. */
 		int ret;
 
 		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
@@ -172,9 +166,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 		}
 
 		/*
-		 * presence of the "mediatek,vpu" property in a device node
-		 * indicates that it is the primary MDP rdma device and MDP DMA
-		 * ops should be handled by its DMA callbacks.
+		 * MDP DMA ops will be handled by the DMA callbacks associated with this
+		 * device;
 		 */
 		mdp->rdma_dev = dev;
 	}
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 523e3c2798e1..be7d35b3e3ff 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -157,6 +157,12 @@ static int mtk_mdp_master_bind(struct device *dev)
 		goto err_component_bind_all;
 	}
 
+	if (mdp->rdma_dev == NULL) {
+		dev_err(dev, "Primary MDP device not found");
+		status = -ENODEV;
+		goto err_component_bind_all;
+	}
+
 	vpu_node = of_find_node_by_name(NULL, "vpu");
 	if (!vpu_node) {
 		dev_err(dev, "unable to find vpu node");
-- 
2.32.0.272.g935e593368-goog

