Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89143C25ED
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbhGIO3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIO3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:21 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24335C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:38 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id i94so12391808wri.4
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sc3iYBo2cLOjGZ/GY0qFgmETJpJ6IqjGAI8ogbEtmjo=;
        b=MO3WdUGNZkqS7J0OrXqM/al1Zr8pgZbxwvrv28Eh+iAUSSaHhRAZnMajOb4riSBN89
         bUONAKE9cwHPVJZxjORMM1xI990r2LJ0U+Y/xpc2NcPSSM7NLB7llbvy4qh8CN/q2HvT
         lTs8lOi1wzxrFrP+s//kaMjO4UA2+XtBt0AGULfTxezY1ydbbqufuNUg6zj0k30jFXyi
         9MdD9O2FGVbECZ36E6imrEcf4BuD3RBmsv6yIhIOcJMhnIOo7Zk/cMC0vG8zYEGKAfZ6
         lfu5lRh0ycSdZWznfDBRpIEN2c0ETjNOci5kSCDLWqs8y2wtVal9VGHJavtGV8hhW2h1
         tfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sc3iYBo2cLOjGZ/GY0qFgmETJpJ6IqjGAI8ogbEtmjo=;
        b=lJdJXS2d6X+viOJdm3cJ+R5HiEDPjbB7IrDPNVnNFFNMwmnkpApy7O5C7cb4sH1OLx
         56yT3Xc9kb0p4Rc2cXGcK0+vLmtxLpP1wdjOq6VpWTM+FcHHerUxCo27RbL9i2/L74Mz
         bTGCjMZWEY8TcPIK2+XLeviXuoCeY7U8f7ptd7OUy4yjIeDgaJnv5911HPuymLY17RGL
         2LcPPDGJz8DszSJz0HI8GnBSTViYZHgzK1Nx/6+Vk+4o64ch9Ge59mXBVBQyvPrEAmq+
         9AXE0ZjbFvGPEDjw5TQCCmWUSc60K5GNSbIQuqS3xbzocWutm1Em/HoawtrMnUDuYC0d
         WeJQ==
X-Gm-Message-State: AOAM533VbJ9Rwg82VPYtbo+BC014oji1GxxmwLniHvb6ofPPqCYNr09j
        ybklUUbQ2UNouj+SrWGdYByEyg==
X-Google-Smtp-Source: ABdhPJwW9I535ZzDXN/H1tSiW2VgOQApDV7D2MQMysRZ4rSec3F+l9ZHY55V0NmPbAYc4IGuJcxmrA==
X-Received: by 2002:a05:6000:1243:: with SMTP id j3mr4401214wrx.244.1625840796662;
        Fri, 09 Jul 2021 07:26:36 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:36 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 11/11] rcar-vin: Add r8a779a0 support
Date:   Fri,  9 Jul 2021 16:26:00 +0200
Message-Id: <20210709142600.651718-12-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the R-Car V3U (r8a779a0) to the driver. The V3U has the
VIN modules connected to a ISP instead of directly to the R-Car CSI-2
receivers. The reason being that the ISP performs channel selection
based on CSI-2 VC/DT pairs and routes the video data to different VIN
modules. In other SoC versions this filtering is done by the VIN modules
themself.

While the media graph is very different from other SoCs the only
difference in operating the VIN modules is that the VC/DT filtering
should be skipped as that is performed by the ISP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changes since v1
- Allow the link_setup() return an error.
- Fix spelling in commit message.
---
 drivers/media/platform/rcar-vin/rcar-core.c | 106 +++++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-dma.c  |  20 ++--
 drivers/media/platform/rcar-vin/rcar-vin.h  |  15 ++-
 3 files changed, 128 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 0653e1ce144860fe..690e3f7e5a1c68ca 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1007,6 +1007,91 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	return ret;
 }
 
+/* -----------------------------------------------------------------------------
+ * ISP
+ */
+
+static int rvin_isp_setup_links(struct rvin_dev *vin)
+{
+	unsigned int i;
+	int ret = -EINVAL;
+
+	/* Create all media device links between VINs and ISP's. */
+	mutex_lock(&vin->group->lock);
+	for (i = 0; i < RCAR_VIN_NUM; i++) {
+		struct media_pad *source_pad, *sink_pad;
+		struct media_entity *source, *sink;
+		unsigned int source_slot = i / 8;
+		unsigned int source_idx = i % 8 + 1;
+
+		if (!vin->group->vin[i])
+			continue;
+
+		/* Check that ISP is part of the group. */
+		if (!vin->group->remotes[source_slot].subdev)
+			continue;
+
+		source = &vin->group->remotes[source_slot].subdev->entity;
+		source_pad = &source->pads[source_idx];
+
+		sink = &vin->group->vin[i]->vdev.entity;
+		sink_pad = &sink->pads[0];
+
+		/* Skip if link already exists. */
+		if (media_entity_find_link(source_pad, sink_pad))
+			continue;
+
+		ret = media_create_pad_link(source, source_idx, sink, 0,
+					    MEDIA_LNK_FL_ENABLED |
+					    MEDIA_LNK_FL_IMMUTABLE);
+		if (ret) {
+			vin_err(vin, "Error adding link from %s to %s\n",
+				source->name, sink->name);
+			break;
+		}
+	}
+	mutex_unlock(&vin->group->lock);
+
+	return ret;
+}
+
+static void rvin_isp_cleanup(struct rvin_dev *vin)
+{
+	rvin_group_notifier_cleanup(vin);
+	rvin_group_put(vin);
+	rvin_free_controls(vin);
+}
+
+static int rvin_isp_init(struct rvin_dev *vin)
+{
+	int ret;
+
+	vin->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
+	if (ret)
+		return ret;
+
+	ret = rvin_create_controls(vin, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = rvin_group_get(vin, rvin_isp_setup_links, NULL);
+	if (ret)
+		goto err_controls;
+
+	ret = rvin_group_notifier_init(vin, 2, RVIN_ISP_MAX);
+	if (ret)
+		goto err_group;
+
+	return 0;
+err_group:
+	rvin_group_put(vin);
+err_controls:
+	rvin_free_controls(vin);
+
+	return ret;
+}
+
 /* -----------------------------------------------------------------------------
  * Suspend / Resume
  */
@@ -1379,6 +1464,15 @@ static const struct rvin_info rcar_info_r8a77995 = {
 	.routes = rcar_info_r8a77995_routes,
 };
 
+static const struct rvin_info rcar_info_r8a779a0 = {
+	.model = RCAR_GEN3,
+	.use_mc = true,
+	.use_isp = true,
+	.nv12 = true,
+	.max_width = 4096,
+	.max_height = 4096,
+};
+
 static const struct of_device_id rvin_of_id_table[] = {
 	{
 		.compatible = "renesas,vin-r8a774a1",
@@ -1440,6 +1534,10 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a77995",
 		.data = &rcar_info_r8a77995,
 	},
+	{
+		.compatible = "renesas,vin-r8a779a0",
+		.data = &rcar_info_r8a779a0,
+	},
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rvin_of_id_table);
@@ -1488,7 +1586,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
-	if (vin->info->use_mc)
+	if (vin->info->use_isp)
+		ret = rvin_isp_init(vin);
+	else if (vin->info->use_mc)
 		ret = rvin_csi2_init(vin);
 	else
 		ret = rvin_parallel_init(vin);
@@ -1512,7 +1612,9 @@ static int rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	if (vin->info->use_mc)
+	if (vin->info->use_isp)
+		rvin_isp_cleanup(vin);
+	else if (vin->info->use_mc)
 		rvin_csi2_cleanup(vin);
 	else
 		rvin_parallel_cleanup(vin);
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f5f722ab1d4e8461..58718e52ae541a87 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -783,16 +783,18 @@ static int rvin_setup(struct rvin_dev *vin)
 	/* Always update on field change */
 	vnmc |= VNMC_VUP;
 
-	/* If input and output use the same colorspace, use bypass mode */
-	if (input_is_yuv == output_is_yuv)
-		vnmc |= VNMC_BPS;
+	if (!vin->info->use_isp) {
+		/* If input and output use the same colorspace, use bypass mode */
+		if (input_is_yuv == output_is_yuv)
+			vnmc |= VNMC_BPS;
 
-	if (vin->info->model == RCAR_GEN3) {
-		/* Select between CSI-2 and parallel input */
-		if (vin->is_csi)
-			vnmc &= ~VNMC_DPINE;
-		else
-			vnmc |= VNMC_DPINE;
+		if (vin->info->model == RCAR_GEN3) {
+			/* Select between CSI-2 and parallel input */
+			if (vin->is_csi)
+				vnmc &= ~VNMC_DPINE;
+			else
+				vnmc |= VNMC_DPINE;
+		}
 	}
 
 	/* Progressive or interlaced mode */
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 49c148c40ea52b79..36a229c9bb35c3c1 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -29,7 +29,7 @@
 #define HW_BUFFER_MASK 0x7f
 
 /* Max number on VIN instances that can be in a system */
-#define RCAR_VIN_NUM 8
+#define RCAR_VIN_NUM 32
 
 struct rvin_group;
 
@@ -48,7 +48,17 @@ enum rvin_csi_id {
 	RVIN_CSI_MAX,
 };
 
-#define RVIN_REMOTES_MAX RVIN_CSI_MAX
+enum rvin_isp_id {
+	RVIN_ISP0,
+	RVIN_ISP1,
+	RVIN_ISP2,
+	RVIN_ISP4,
+	RVIN_ISP_MAX,
+};
+
+#define RVIN_REMOTES_MAX \
+	(((unsigned int)RVIN_CSI_MAX) > ((unsigned int)RVIN_ISP_MAX) ? \
+	 RVIN_CSI_MAX : RVIN_ISP_MAX)
 
 /**
  * enum rvin_dma_state - DMA states
@@ -158,6 +168,7 @@ struct rvin_group_route {
 struct rvin_info {
 	enum model_id model;
 	bool use_mc;
+	bool use_isp;
 	bool nv12;
 
 	unsigned int max_width;
-- 
2.32.0

