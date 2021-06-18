Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94503AC556
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 09:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbhFRHz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 03:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbhFRHzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 03:55:24 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDEEC061760
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 00:53:15 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q15so7097874pgg.12
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 00:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fuQHQTUFu0ITvsFzkeR6cqKiaBR9rEE8G0yVPHcvTZQ=;
        b=HYeWOMVAjk9vA6oXy4YeoHfzm9VgoY1EfBNkbUzeZ1bi+CcyhYhCdz5nch//gJ0AT5
         ygxHHJ0SVJo9HH9vfAUjMTPEgel4viwiBhuGmWSanIzFyap7epHiin/riZFeFJpFxENn
         RjlWRYbNCwSFQgMHbQ6b32ddNzP4zp9KdqlxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fuQHQTUFu0ITvsFzkeR6cqKiaBR9rEE8G0yVPHcvTZQ=;
        b=U7TiG4THh7PQuptNPv0mIEvCJ4S3cx/mrf2YN8/afqDtBD/n9JzZdIjSfQV5RiOiPR
         IvxKojZh3oGVgJMeTSQfqyzD2lkObzSdZOKC7CmR6J5yUfo3eWRWWCJQ2C6MOKIdB7/b
         EQav82nJSpEfN1tn+8ftNk1Ixlc6bUIVD0EXJqKEyuUUp34Fvte/JNXdhGdYX4wLcPls
         hle+gCYVrjsAwhNAFmUfzw7r/FvU4IMa0gt3d9dSXElBpyu5YFWH7y9VqdqX4KlCdHgV
         o1NHpNlm04aUQoEtu9dhDZeWlWbHen82FYU4fJ6E0oevWL2M96I20UqaIOwIWRB97+ZL
         GJqw==
X-Gm-Message-State: AOAM530an0h1ety5tffMpBiXA+HVWbkk29gsganRnocAwcDA37lQ8vnI
        cFBwvR2CfXFcpXmThH6Rc0QhTw==
X-Google-Smtp-Source: ABdhPJyBeVVeweGBr4QQORF7SlgVzJMdMAcqnaFfn77opkCAqoRSj12QI9zWicniMiWzgqn0gNu/Og==
X-Received: by 2002:a63:2151:: with SMTP id s17mr8686226pgm.432.1624002795102;
        Fri, 18 Jun 2021 00:53:15 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:3e8:19ca:3d8a:e112])
        by smtp.gmail.com with UTF8SMTPSA id 201sm2777642pfz.150.2021.06.18.00.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 00:53:14 -0700 (PDT)
From:   Eizan Miyamoto <eizan@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     yong.wu@mediatek.com, houlong.wei@mediatek.com,
        enric.balletbo@collabora.com, chunkuang.hu@kernel.org,
        wenst@chromium.org, Eizan Miyamoto <eizan@chromium.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 7/8] media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
Date:   Fri, 18 Jun 2021 17:52:08 +1000
Message-Id: <20210618175059.v3.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210618075209.1157766-1-eizan@chromium.org>
References: <20210618075209.1157766-1-eizan@chromium.org>
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
---

(no changes since v1)

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 47 ++++++++++++++-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 +++
 2 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 59911ee063c1..2a71c582d8b1 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -141,22 +141,48 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 	}
 }
 
+/*
+ * The MDP master device node is identified by the device tree alias
+ * "mdp-rdma0".
+ */
+static int is_mdp_master(struct device *dev)
+{
+	struct device_node *aliases, *mdp_rdma0_node;
+	const char *mdp_rdma0_path;
+
+	if (!dev->of_node)
+		return 0;
+
+	aliases = of_find_node_by_path("/aliases");
+	if (!aliases) {
+		dev_err(dev, "no aliases found for mdp-rdma0");
+		return 0;
+	}
+
+	mdp_rdma0_path = of_get_property(aliases, "mdp-rdma0", NULL);
+	if (!mdp_rdma0_path) {
+		dev_err(dev, "get mdp-rdma0 property of /aliases failed");
+		return 0;
+	}
+
+	mdp_rdma0_node = of_find_node_by_path(mdp_rdma0_path);
+	if (!mdp_rdma0_node) {
+		dev_err(dev, "path resolution failed for %s", mdp_rdma0_path);
+		return 0;
+	}
+
+	return dev->of_node == mdp_rdma0_node;
+}
+
 static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
 			void *data)
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
 
 		ret = v4l2_device_register(dev, &mdp->v4l2_dev);
@@ -172,9 +198,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
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
2.32.0.288.g62a8d224e6-goog

