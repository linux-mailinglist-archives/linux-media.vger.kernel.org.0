Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BC63D0B20
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 11:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236423AbhGUITE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 04:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237458AbhGUIOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 04:14:25 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E40BC061574
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 01:54:57 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d2so1354981wrn.0
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=STmv1ZJBg4gYStBqLUUrSRjgB24KVzvnk4PwaEwxfLI=;
        b=qFbArx372SoWusZtJpim5Pp1ezwyVzwrK75Ox+vjGqefP+toJrsNpcUXa7c9E2fQMY
         ePEYhJKzpPmzq39dozs55yC21LaoUyslHDNMSPBEJamGg6nhbKdw9SI0IYBC3ldbo5Eh
         VQJyzA7cpP7lHsDIQ8Ggv+MujlpQujHTmdDU2Hdf6jTuyrvsUmctb/eJ65XBm8KQd2h2
         +ZPWWKgEvqRm3ers8VcUU0xJSGj7RDofWpMbBh+HYBbZ5SshTfK9GzvCGlkR5Ev9awf2
         s6tIY3LNIlGoFmELnXISV6bu+rDzrk3xCeX4Y1dv3vFR/VcNK4bqLDqoQ+cWSFmTW3sX
         N7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=STmv1ZJBg4gYStBqLUUrSRjgB24KVzvnk4PwaEwxfLI=;
        b=TP7ZEdnHFGoZSZJidxr9OfY6n5uPoWrKoARxqR2LeDMY3wdxhlCRCgnCXZXSlGpUDB
         53hDoVWLz1r004sc8dx2uTua2bCJNfeu+OyT4sMI3JeEkLmD1nIGOxBBsqjD8kVWVe1r
         zV1gut5SGP4tyKBnv9VzuG2O+cf9lwnzeRE9520xD8QUIO5If0+zE93EJm2Unr3q1ky2
         8kUCe6v24K+d22k3qxukfvX1dqMQEOz6Qq+4jRoVUcF8haJOdFQgDIafl9Hpkw0WBOO5
         liSGFqcdeYF5zBpQS+1WccIicJcTb6y+EJPI4bgDGjMBtlU/qrGOQiJDJAny1hdy+n0U
         ufrg==
X-Gm-Message-State: AOAM530TeLKeeD80IamygGh9G+VNSchqpUF/C2D6yo7tKRIRGj3d/h4r
        bTaegNJkI37lWS0k3HNUQJEfHzb2n0ng5Q==
X-Google-Smtp-Source: ABdhPJzf4hDZSFB+fewqwv5oeYUTpkuopT/tcgUy+hhMJJGmBawA35+h0nliGfeYP1f1vmbg9htQRQ==
X-Received: by 2002:a5d:4a4c:: with SMTP id v12mr40803394wrs.256.1626857696179;
        Wed, 21 Jul 2021 01:54:56 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id x9sm26614577wrm.82.2021.07.21.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 01:54:55 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2.1 11/11] rcar-vin: Add r8a779a0 support
Date:   Wed, 21 Jul 2021 10:53:57 +0200
Message-Id: <20210721085357.4181098-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <3b15cc12-2c3c-c622-fcbb-3aed583f09d1@xs4all.nl>
References: <3b15cc12-2c3c-c622-fcbb-3aed583f09d1@xs4all.nl>
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

* Changes since v2
- Add documentation for the use_isp struct member.
---
 drivers/media/platform/rcar-vin/rcar-core.c | 106 +++++++++++++++++++-
 drivers/media/platform/rcar-vin/rcar-dma.c  |  20 ++--
 drivers/media/platform/rcar-vin/rcar-vin.h  |  16 ++-
 3 files changed, 129 insertions(+), 13 deletions(-)

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
index 49c148c40ea52b79..6c06320174a2ed96 100644
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
@@ -149,6 +159,7 @@ struct rvin_group_route {
  * struct rvin_info - Information about the particular VIN implementation
  * @model:		VIN model
  * @use_mc:		use media controller instead of controlling subdevice
+ * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
  * @nv12:		support outputing NV12 pixel format
  * @max_width:		max input width the VIN supports
  * @max_height:		max input height the VIN supports
@@ -158,6 +169,7 @@ struct rvin_group_route {
 struct rvin_info {
 	enum model_id model;
 	bool use_mc;
+	bool use_isp;
 	bool nv12;
 
 	unsigned int max_width;
-- 
2.32.0

