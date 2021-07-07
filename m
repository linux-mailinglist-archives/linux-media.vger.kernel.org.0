Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E88A3BE3AE
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 09:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhGGHiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 03:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhGGHiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 03:38:02 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80198C061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 00:35:22 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so845243pju.4
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 00:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o+DOXYaLhuexH0DTEP+mN+AuQ2RorTj6+9m3uAihWSo=;
        b=EcdqyIk2NW70w0Z7UNj55PxSMt/fdYXmWaot0zjGUXjAP+tMifFgMDAfSgvNUXZCUZ
         5pS7ykBRJErpdLwUilHQDJlpNf7l9k9LuHZabTtlkmwrCxdyU3YFylwPzlMfmuZJ0mAd
         rmB0B08++4xpfg98vEmkMCe9PJXo+FaESLaZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+DOXYaLhuexH0DTEP+mN+AuQ2RorTj6+9m3uAihWSo=;
        b=qTqd6tRJXCOiv0Dq0tlbFhIrZpAP1eB2xaXf9Y6O76fchwh9le3Qa7D6d5NSwP9Lj8
         GEMxgiGajm2xLUiiFCxxnUdgL8G2/oodgmLhD+LADH5F9YKFO9FGrGQZ4dYmBfRr1+4e
         0YZMLr6cjgC72E8+cQhcV9XdRyTjtQzlTrl30eCPK1jyM0AYcqd0mF980RTt0ZP8/lX1
         dq8KpUCYr9icOR7v2RUT4us1wFu6HP/ZpOSot8ABsDETs2Wo498yzleIsAdjiDbOzl9C
         t8mvagVlE5w0zFPIz2N3RKhPoAoXhtreHPoYtlo4tkGSedjMugHsUBE0dwY2Dowu7ZZe
         mBLQ==
X-Gm-Message-State: AOAM533xOC2jS4BDxZiTxn1t4ZSKXmZBDpWIOq2rNhfVLqALmLflmvhq
        OfoezYq54nAZwq3Zi2BbsS6xcg==
X-Google-Smtp-Source: ABdhPJzPseLgE/hsVWQam/QaixoVt6a5aaza7/qtRRMngOoyhV2y0dipT8IFkbbtDCrsRuX/YM0jQA==
X-Received: by 2002:a17:902:8601:b029:11c:4b4:e967 with SMTP id f1-20020a1709028601b029011c04b4e967mr20390465plo.75.1625643322093;
        Wed, 07 Jul 2021 00:35:22 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:ccb9:d95f:4dac:dbc4])
        by smtp.gmail.com with UTF8SMTPSA id d2sm21506853pgh.59.2021.07.07.00.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 00:35:21 -0700 (PDT)
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
Subject: [PATCH v4 7/8] media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
Date:   Wed,  7 Jul 2021 17:34:09 +1000
Message-Id: <20210707173108.v4.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210707073410.999625-1-eizan@chromium.org>
References: <20210707073410.999625-1-eizan@chromium.org>
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
2.32.0.93.g670b81a890-goog

