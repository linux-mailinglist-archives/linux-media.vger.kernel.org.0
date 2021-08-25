Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C8A3F6F99
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 08:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239232AbhHYGf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 02:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239241AbhHYGfZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 02:35:25 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895B7C061757
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:40 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id r2so22087077pgl.10
        for <linux-media@vger.kernel.org>; Tue, 24 Aug 2021 23:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4XCVzr5iz0QopfEgURb1CQv1P9/gHJdLhnjxwl27c/s=;
        b=OSCABazIpuHyd7hIDQTR8xjHANpAJY8mVw/lMwMZAwBneWnPcgnttkDh2iZ/60ivoL
         pTrwGGLw7RTpT3FYMjCxF8x3hpVJaHrw9keEA77PxIv/Gbb49+gBlsptb8sCQ6GrBd4D
         5qW6Kz21+aJnzT9z/MTpPBeMpeORXzsfr1FEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4XCVzr5iz0QopfEgURb1CQv1P9/gHJdLhnjxwl27c/s=;
        b=MaB9iyfQBviyLgeow3d0HrYO1YiplruG5AAJg/CPE2i4Jsu/9cntE0VhLROH0GtstJ
         VMHgmDgSrblJKjx7SszzZkcIsmK8tiEKVXAnwc9Wame9xbSiekv+MUfTUGJ9OQcORxSa
         JHgdYUZ/YlnbPZXxJS6VoIVdcVJ8Q1W1YqVxfKP/LBHQQOadAiJ3qsTeo9Xydpyp5NX8
         Yv9L8QCM41Vc7+F9tj9p5SGkT+XahjjtfVomARZ/683GkdydpCbU/XyQrkuuZl7iH5B2
         16zH2BoEeHRbznTihJ9X9hlhYa614C/WeJXpKUL2GnX5aJ/VZDnL/VCIcbxf/NEi5tzn
         X9Hw==
X-Gm-Message-State: AOAM532S+2KvJPtFWv3XJfShdlEIp6HRtk9GHpEI3mZnMPjvh1VnbZaA
        5Sox4kIKFGD5zNs3ItWIlT33TQ==
X-Google-Smtp-Source: ABdhPJy8M9Dz53jmqObH291x1MiXUcil2JzrRsRDjBq8VrwikvxUeuGojJOB0BY4rvcum4kLxMQzsg==
X-Received: by 2002:a63:8f4a:: with SMTP id r10mr39177630pgn.337.1629873280107;
        Tue, 24 Aug 2021 23:34:40 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3f2f:9e23:8a5:952])
        by smtp.gmail.com with UTF8SMTPSA id v1sm23681435pgj.40.2021.08.24.23.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 23:34:39 -0700 (PDT)
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
Subject: [PATCH v7 7/7] media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
Date:   Wed, 25 Aug 2021 16:33:23 +1000
Message-Id: <20210825163247.v7.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210825063323.3607738-1-eizan@chromium.org>
References: <20210825063323.3607738-1-eizan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

... Instead of depending on the presence of a mediatek,vpu property in
the device node.

That property was originally added to link to the vpu node so that the
mtk_mdp_core driver could pass the right device to
vpu_wdt_reg_handler(). However in a previous patch in this series,
the driver has been modified to search the device tree for that node
instead.

That property was also used to indicate the primary MDP device, so that
it can be passed to the V4L2 subsystem as well as register it to be
used when setting up queues in the open() callback for the filesystem
device node that is created. In this case, assuming that the primary
MDP device is the one with a specific alias seems useable because the
alternative is to add a property to the device tree which doesn't
actually represent any facet of hardware (i.e., this being the primary
MDP device is a software decision). In other words, this solution is
equally as arbitrary, but at least it doesn't add a property to a
device node where said property is unrelated to the hardware present.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 56 +++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 36 ++++++++----
 2 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 85ef274841a3..9527649de98e 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -151,29 +151,50 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 		mtk_smi_larb_put(comp->larb_dev);
 }
 
-static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *data)
+/*
+ * The MDP master device node is identified by the device tree alias
+ * "mdp-rdma0".
+ */
+static bool is_mdp_master(struct device *dev)
+{
+	struct device_node *aliases, *mdp_rdma0_node;
+	const char *mdp_rdma0_path;
+
+	if (!dev->of_node)
+		return false;
+
+	aliases = of_find_node_by_path("/aliases");
+	if (!aliases) {
+		dev_err(dev, "no aliases found for mdp-rdma0");
+		return false;
+	}
+
+	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
+	if (!mdp_rdma0_path) {
+		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
+		return false;
+	}
+
+	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
+	if (!mdp_rdma0_node) {
+		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
+		return false;
+	}
+
+	return dev->of_node == mdp_rdma0_node;
+}
+
+static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
+			void *data)
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
+	if (is_mdp_master(dev)) {
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
@@ -187,9 +208,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master, void *da
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
index 50eafcc9993d..6a775463399c 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -150,8 +150,9 @@ static void release_of(struct device *dev, void *data)
 
 static int mtk_mdp_master_bind(struct device *dev)
 {
-	int status;
 	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
+	struct device_node *vpu_node;
+	int status;
 
 	status = component_bind_all(dev, mdp);
 	if (status) {
@@ -159,15 +160,30 @@ static int mtk_mdp_master_bind(struct device *dev)
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
+	if (mdp->rdma_dev == NULL) {
+		dev_err(dev, "Primary MDP device not found");
+		status = -ENODEV;
+		goto err_component_bind_all;
+	}
+
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
2.33.0.rc2.250.ged5fa647cd-goog

