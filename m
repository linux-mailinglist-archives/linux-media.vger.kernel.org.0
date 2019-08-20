Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C44C96B49
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 23:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730910AbfHTVSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 17:18:52 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41153 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730833AbfHTVSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 17:18:48 -0400
Received: by mail-io1-f68.google.com with SMTP id j5so276700ioj.8
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2019 14:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FQksCeDm5HZnREQ00UKwreJAWVz+so5QZwyXtGxU4e4=;
        b=Me6t6RBn3ImHoU8bwzHGazTlQzdb2qQNcv2JjiilSJ2tTo2dRQL1ognJoy7ZOeBMww
         AvFn032n4IHdztjAaDHc6p6D872zCs9httwCnXsT82K7b5VLXcHQJTDcMyxWyLm54J1c
         ILdthSuHRluDuhWQucxhpNJrajB+NjvPUu2tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FQksCeDm5HZnREQ00UKwreJAWVz+so5QZwyXtGxU4e4=;
        b=U15KjBivCLKXj1jMT+i5zYdjgRC4658xDEoxxgHwhmsbgUcCkPqW5RfF9com1pLjRL
         QEs+yUHBoGCSMaomeT2T8bc3jR3LUCxKt7EskNKS9SBNWBb0Po4hpSE49cyDuIneLED2
         4q+cWDCo0W8tnVqjyzWDR8mJ9g4TJBYWxidx8q4MWP2zE0qAZTIbqhPEVUXM8BCMDwkn
         N0uPce1CNcG10ZmlDbuynAD/p8PrMplm6xDFAHiAuwaFBklHNzK3oKaQ1n9Il9kp6XaJ
         oktw8B+BBxqnrT59mA2I/EbPximY6QJD+QyFozkS+OQ5Ui9iShgwDQEVDc05Dw5nWTIl
         0lYg==
X-Gm-Message-State: APjAAAUcrwlDWbxHYAnGwcXTTRxbtLKWEHVcwQnKGYYL3bvY6SdlkUP/
        YqjYBySYdHhkhSvZHK6UQ+tKRg==
X-Google-Smtp-Source: APXvYqzjI91Y7mqWGhxibfefunG9DTkVp/m400Ssh+NUZO0rTW7Ifxl2kvCd3J0vwBuAWxmx7stftQ==
X-Received: by 2002:a5d:8788:: with SMTP id f8mr13696503ion.20.1566335927000;
        Tue, 20 Aug 2019 14:18:47 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e12sm38441135iob.66.2019.08.20.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 14:18:46 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, andrealmeid@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 1/2] media: vimc: Collapse component structure into a single monolithic driver
Date:   Tue, 20 Aug 2019 15:18:41 -0600
Message-Id: <a7b877c08d0885fe7e8bffc9b24ef0a2d6236147.1566334363.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1566334362.git.skhan@linuxfoundation.org>
References: <cover.1566334362.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vimc uses Component API to split the driver into functional components.
The real hardware resembles a monolith structure than component and
component structure added a level of complexity making it hard to
maintain without adding any real benefit.

The sensor is one vimc component that would makes sense to be a separate
module to closely align with the real hardware. It would be easier to
collapse vimc into single monolithic driver first and then split the
sensor off as a separate module.

Collapse it into a single monolithic driver removing the Component API.
This patch removes the component API and makes minimal changes to the
code base preserving the functional division of the code structure.
Preserving the functional structure allows us to split the sensor off
as a separate module in the future.

Major design elements in this change are:
- Use existing struct vimc_ent_config and struct vimc_pipeline_config
  to drive the initialization of the functional components.
- Make vimc_device and vimc_ent_config global by moving them to
  vimc-common.h
- Add two new hooks add and rm to initialize and register, unregister
  and free subdevs.
- All component API is now gone and bind and unbind hooks are modified
  to do "add" and "rm" with minimal changes to just add and rm subdevs.
- vimc-core's bind and unbind are now register and unregister.
- vimc-core invokes "add" hooks from its vimc_register_devices().
  The "add" hooks remain the same and register subdevs. They don't
  create platform devices of their own and use vimc's pdev.dev as
  their reference device. The "add" hooks save their vimc_ent_device(s)
  in the corresponding vimc_ent_config.
- vimc-core invokes "rm" hooks from its unregister to unregister subdevs
  and cleanup.
- vimc-core invokes "add" and "rm" hooks with pointer to struct vimc_device
  and the corresponding struct vimc_ent_config pointer.

The following configure and stream test works on all devices.

media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'

v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81

v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/media/platform/vimc/Makefile       |   7 +-
 drivers/media/platform/vimc/vimc-capture.c |  79 ++------
 drivers/media/platform/vimc/vimc-common.h  |  48 +++++
 drivers/media/platform/vimc/vimc-core.c    | 199 ++++++++-------------
 drivers/media/platform/vimc/vimc-debayer.c |  67 ++-----
 drivers/media/platform/vimc/vimc-scaler.c  |  71 ++------
 drivers/media/platform/vimc/vimc-sensor.c  |  71 ++------
 7 files changed, 176 insertions(+), 366 deletions(-)

diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
index 96d06f030c31..a53b2b532e9f 100644
--- a/drivers/media/platform/vimc/Makefile
+++ b/drivers/media/platform/vimc/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-vimc-y := vimc-core.o vimc-common.o vimc-streamer.o
+vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
+		vimc-debayer.o vimc-scaler.o vimc-sensor.o
+
+obj-$(CONFIG_VIDEO_VIMC) += vimc.o
 
-obj-$(CONFIG_VIDEO_VIMC) += vimc.o vimc-capture.o vimc-debayer.o \
-                vimc-scaler.o vimc-sensor.o
diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 1d56b91830ba..e04b60ec0738 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -5,10 +5,6 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
-#include <linux/component.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
@@ -16,8 +12,6 @@
 #include "vimc-common.h"
 #include "vimc-streamer.h"
 
-#define VIMC_CAP_DRV_NAME "vimc-capture"
-
 struct vimc_cap_device {
 	struct vimc_ent_device ved;
 	struct video_device vdev;
@@ -340,13 +334,15 @@ static void vimc_cap_release(struct video_device *vdev)
 	kfree(vcap);
 }
 
-static void vimc_cap_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
-						    ved);
+	struct vimc_ent_device *ved = vcfg->ved;
+	struct vimc_cap_device *vcap;
+
+	if (!ved)
+		return;
 
+	vcap = container_of(ved, struct vimc_cap_device, ved);
 	vb2_queue_release(&vcap->queue);
 	media_entity_cleanup(ved->ent);
 	video_unregister_device(&vcap->vdev);
@@ -391,11 +387,9 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 	return NULL;
 }
 
-static int vimc_cap_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_cap_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	const struct vimc_pix_map *vpix;
 	struct vimc_cap_device *vcap;
 	struct video_device *vdev;
@@ -416,7 +410,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	}
 
 	/* Initialize the media entity */
-	vcap->vdev.entity.name = pdata->entity_name;
+	vcap->vdev.entity.name = vcfg->name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
 	ret = media_entity_pads_init(&vcap->vdev.entity,
 				     1, vcap->ved.pads);
@@ -440,8 +434,8 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 
 	ret = vb2_queue_init(q);
 	if (ret) {
-		dev_err(comp, "%s: vb2 queue init failed (err=%d)\n",
-			pdata->entity_name, ret);
+		dev_err(&vimc->pdev.dev, "%s: vb2 queue init failed (err=%d)\n",
+			vcfg->name, ret);
 		goto err_clean_m_ent;
 	}
 
@@ -460,8 +454,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	vcap->ved.ent = &vcap->vdev.entity;
 	vcap->ved.process_frame = vimc_cap_process_frame;
 	vcap->ved.vdev_get_format = vimc_cap_get_format;
-	dev_set_drvdata(comp, &vcap->ved);
-	vcap->dev = comp;
+	vcap->dev = &vimc->pdev.dev;
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
@@ -474,17 +467,18 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	vdev->queue = q;
 	vdev->v4l2_dev = v4l2_dev;
 	vdev->vfl_dir = VFL_DIR_RX;
-	strscpy(vdev->name, pdata->entity_name, sizeof(vdev->name));
+	strscpy(vdev->name, vcfg->name, sizeof(vdev->name));
 	video_set_drvdata(vdev, &vcap->ved);
 
 	/* Register the video_device with the v4l2 and the media framework */
 	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
 	if (ret) {
-		dev_err(comp, "%s: video register failed (err=%d)\n",
+		dev_err(&vimc->pdev.dev, "%s: video register failed (err=%d)\n",
 			vcap->vdev.name, ret);
 		goto err_release_queue;
 	}
 
+	vcfg->ved = &vcap->ved;
 	return 0;
 
 err_release_queue:
@@ -498,44 +492,3 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 
 	return ret;
 }
-
-static const struct component_ops vimc_cap_comp_ops = {
-	.bind = vimc_cap_comp_bind,
-	.unbind = vimc_cap_comp_unbind,
-};
-
-static int vimc_cap_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &vimc_cap_comp_ops);
-}
-
-static int vimc_cap_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &vimc_cap_comp_ops);
-
-	return 0;
-}
-
-static const struct platform_device_id vimc_cap_driver_ids[] = {
-	{
-		.name           = VIMC_CAP_DRV_NAME,
-	},
-	{ }
-};
-
-static struct platform_driver vimc_cap_pdrv = {
-	.probe		= vimc_cap_probe,
-	.remove		= vimc_cap_remove,
-	.id_table	= vimc_cap_driver_ids,
-	.driver		= {
-		.name	= VIMC_CAP_DRV_NAME,
-	},
-};
-
-module_platform_driver(vimc_cap_pdrv);
-
-MODULE_DEVICE_TABLE(platform, vimc_cap_driver_ids);
-
-MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Capture");
-MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
-MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 9c2e0e216c6b..5b2282de395c 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -9,6 +9,7 @@
 #define _VIMC_COMMON_H_
 
 #include <linux/slab.h>
+#include <linux/platform_device.h>
 #include <media/media-device.h>
 #include <media/v4l2-device.h>
 
@@ -84,6 +85,21 @@ struct vimc_pix_map {
 	bool bayer;
 };
 
+/**
+ * struct vimc_device - main device for vimc driver
+ *
+ * @pdev	pointer to the platform device
+ * @pipe_cfg	pointer to the vimc pipeline configuration structure
+ * @mdev	the associated media_device parent
+ * @v4l2_dev	Internal v4l2 parent device
+ */
+struct vimc_device {
+	struct platform_device pdev;
+	const struct vimc_pipeline_config *pipe_cfg;
+	struct media_device mdev;
+	struct v4l2_device v4l2_dev;
+};
+
 /**
  * struct vimc_ent_device - core struct that represents a node in the topology
  *
@@ -111,6 +127,38 @@ struct vimc_ent_device {
 			      struct v4l2_pix_format *fmt);
 };
 
+/**
+ * struct vimc_ent_config	Structure which describes individual
+ *				configuration for each entity
+ *
+ * @name			entity name
+ * @ved				pointer to vimc_ent_device (a node in the
+ *					topology)
+ * @add				subdev add hook - initializes and registers
+ *					subdev called from vimc-core
+ * @rm				subdev rm hook - unregisters and frees
+ *					subdev called from vimc-core
+ */
+struct vimc_ent_config {
+	const char *name;
+	struct vimc_ent_device *ved;
+	int (*add)(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+	void (*rm)(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+};
+
+/* prototypes for vimc_ent_config add and rm hooks */
+int vimc_cap_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+
+int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+
+int vimc_sca_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+
+int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
+
 /**
  * vimc_pads_init - initialize pads
  *
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 571c55aa0e16..3749bfa88e40 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
-#include <linux/component.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -24,29 +23,6 @@
 	.flags = link_flags,					\
 }
 
-struct vimc_device {
-	/* The platform device */
-	struct platform_device pdev;
-
-	/* The pipeline configuration */
-	const struct vimc_pipeline_config *pipe_cfg;
-
-	/* The Associated media_device parent */
-	struct media_device mdev;
-
-	/* Internal v4l2 parent device*/
-	struct v4l2_device v4l2_dev;
-
-	/* Subdevices */
-	struct platform_device **subdevs;
-};
-
-/* Structure which describes individual configuration for each entity */
-struct vimc_ent_config {
-	const char *name;
-	const char *drv;
-};
-
 /* Structure which describes links between entities */
 struct vimc_ent_link {
 	unsigned int src_ent;
@@ -58,7 +34,7 @@ struct vimc_ent_link {
 
 /* Structure which describes the whole topology */
 struct vimc_pipeline_config {
-	const struct vimc_ent_config *ents;
+	struct vimc_ent_config *ents;
 	size_t num_ents;
 	const struct vimc_ent_link *links;
 	size_t num_links;
@@ -68,43 +44,61 @@ struct vimc_pipeline_config {
  * Topology Configuration
  */
 
-static const struct vimc_ent_config ent_config[] = {
+static struct vimc_ent_config ent_config[] = {
 	{
 		.name = "Sensor A",
-		.drv = "vimc-sensor",
+		.ved = NULL,
+		.add = vimc_sen_add,
+		.rm = vimc_sen_rm,
 	},
 	{
 		.name = "Sensor B",
-		.drv = "vimc-sensor",
+		.ved = NULL,
+		.add = vimc_sen_add,
+		.rm = vimc_sen_rm,
 	},
 	{
 		.name = "Debayer A",
-		.drv = "vimc-debayer",
+		.ved = NULL,
+		.add = vimc_deb_add,
+		.rm = vimc_deb_rm,
 	},
 	{
 		.name = "Debayer B",
-		.drv = "vimc-debayer",
+		.ved = NULL,
+		.add = vimc_deb_add,
+		.rm = vimc_deb_rm,
 	},
 	{
 		.name = "Raw Capture 0",
-		.drv = "vimc-capture",
+		.ved = NULL,
+		.add = vimc_cap_add,
+		.rm = vimc_cap_rm,
 	},
 	{
 		.name = "Raw Capture 1",
-		.drv = "vimc-capture",
+		.ved = NULL,
+		.add = vimc_cap_add,
+		.rm = vimc_cap_rm,
 	},
 	{
-		.name = "RGB/YUV Input",
 		/* TODO: change this to vimc-input when it is implemented */
-		.drv = "vimc-sensor",
+		.name = "RGB/YUV Input",
+		.ved = NULL,
+		.add = vimc_sen_add,
+		.rm = vimc_sen_rm,
 	},
 	{
 		.name = "Scaler",
-		.drv = "vimc-scaler",
+		.ved = NULL,
+		.add = vimc_sca_add,
+		.rm = vimc_sca_rm,
 	},
 	{
 		.name = "RGB/YUV Capture",
-		.drv = "vimc-capture",
+		.ved = NULL,
+		.add = vimc_cap_add,
+		.rm = vimc_cap_rm,
 	},
 };
 
@@ -127,7 +121,7 @@ static const struct vimc_ent_link ent_links[] = {
 	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
-static const struct vimc_pipeline_config pipe_cfg = {
+static struct vimc_pipeline_config pipe_cfg = {
 	.ents		= ent_config,
 	.num_ents	= ARRAY_SIZE(ent_config),
 	.links		= ent_links,
@@ -144,14 +138,11 @@ static int vimc_create_links(struct vimc_device *vimc)
 	/* Initialize the links between entities */
 	for (i = 0; i < vimc->pipe_cfg->num_links; i++) {
 		const struct vimc_ent_link *link = &vimc->pipe_cfg->links[i];
-		/*
-		 * TODO: Check another way of retrieving ved struct without
-		 * relying on platform_get_drvdata
-		 */
+
 		struct vimc_ent_device *ved_src =
-			platform_get_drvdata(vimc->subdevs[link->src_ent]);
+			vimc->pipe_cfg->ents[link->src_ent].ved;
 		struct vimc_ent_device *ved_sink =
-			platform_get_drvdata(vimc->subdevs[link->sink_ent]);
+			vimc->pipe_cfg->ents[link->sink_ent].ved;
 
 		ret = media_create_pad_link(ved_src->ent, link->src_pad,
 					    ved_sink->ent, link->sink_pad,
@@ -163,13 +154,36 @@ static int vimc_create_links(struct vimc_device *vimc)
 	return 0;
 }
 
-static int vimc_comp_bind(struct device *master)
+static int vimc_add_subdevs(struct vimc_device *vimc)
 {
-	struct vimc_device *vimc = container_of(to_platform_device(master),
-						struct vimc_device, pdev);
+	unsigned int i;
 	int ret;
 
-	dev_dbg(master, "bind");
+	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
+		dev_dbg(&vimc->pdev.dev, "new entity for %s\n",
+			vimc->pipe_cfg->ents[i].name);
+		ret = vimc->pipe_cfg->ents[i].add(vimc,
+				&vimc->pipe_cfg->ents[i]);
+		if (ret) {
+			dev_err(&vimc->pdev.dev, "add new entity for %s\n",
+				vimc->pipe_cfg->ents[i].name);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static void vimc_rm_subdevs(struct vimc_device *vimc)
+{
+	unsigned int i;
+
+	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
+		vimc->pipe_cfg->ents[i].rm(vimc, &vimc->pipe_cfg->ents[i]);
+}
+
+static int vimc_register_devices(struct vimc_device *vimc)
+{
+	int ret;
 
 	/* Register the v4l2 struct */
 	ret = v4l2_device_register(vimc->mdev.dev, &vimc->v4l2_dev);
@@ -179,22 +193,22 @@ static int vimc_comp_bind(struct device *master)
 		return ret;
 	}
 
-	/* Bind subdevices */
-	ret = component_bind_all(master, &vimc->v4l2_dev);
+	/* Invoke entity config hooks to initialize and register subdevs */
+	ret = vimc_add_subdevs(vimc);
 	if (ret)
-		goto err_v4l2_unregister;
+		goto err_add_subdevs;
 
 	/* Initialize links */
 	ret = vimc_create_links(vimc);
 	if (ret)
-		goto err_comp_unbind_all;
+		goto err_v4l2_unregister;
 
 	/* Register the media device */
 	ret = media_device_register(&vimc->mdev);
 	if (ret) {
 		dev_err(vimc->mdev.dev,
 			"media device register failed (err=%d)\n", ret);
-		goto err_comp_unbind_all;
+		goto err_v4l2_unregister;
 	}
 
 	/* Expose all subdev's nodes*/
@@ -211,98 +225,30 @@ static int vimc_comp_bind(struct device *master)
 err_mdev_unregister:
 	media_device_unregister(&vimc->mdev);
 	media_device_cleanup(&vimc->mdev);
-err_comp_unbind_all:
-	component_unbind_all(master, NULL);
 err_v4l2_unregister:
 	v4l2_device_unregister(&vimc->v4l2_dev);
+err_add_subdevs:
+	vimc_rm_subdevs(vimc);
 
 	return ret;
 }
 
-static void vimc_comp_unbind(struct device *master)
+static void vimc_unregister(struct vimc_device *vimc)
 {
-	struct vimc_device *vimc = container_of(to_platform_device(master),
-						struct vimc_device, pdev);
-
-	dev_dbg(master, "unbind");
-
 	media_device_unregister(&vimc->mdev);
 	media_device_cleanup(&vimc->mdev);
-	component_unbind_all(master, NULL);
 	v4l2_device_unregister(&vimc->v4l2_dev);
 }
 
-static int vimc_comp_compare(struct device *comp, void *data)
-{
-	return comp == data;
-}
-
-static struct component_match *vimc_add_subdevs(struct vimc_device *vimc)
-{
-	struct component_match *match = NULL;
-	struct vimc_platform_data pdata;
-	int i;
-
-	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
-		dev_dbg(&vimc->pdev.dev, "new pdev for %s\n",
-			vimc->pipe_cfg->ents[i].drv);
-
-		strscpy(pdata.entity_name, vimc->pipe_cfg->ents[i].name,
-			sizeof(pdata.entity_name));
-
-		vimc->subdevs[i] = platform_device_register_data(&vimc->pdev.dev,
-						vimc->pipe_cfg->ents[i].drv,
-						PLATFORM_DEVID_AUTO,
-						&pdata,
-						sizeof(pdata));
-		if (IS_ERR(vimc->subdevs[i])) {
-			match = ERR_CAST(vimc->subdevs[i]);
-			while (--i >= 0)
-				platform_device_unregister(vimc->subdevs[i]);
-
-			return match;
-		}
-
-		component_match_add(&vimc->pdev.dev, &match, vimc_comp_compare,
-				    &vimc->subdevs[i]->dev);
-	}
-
-	return match;
-}
-
-static void vimc_rm_subdevs(struct vimc_device *vimc)
-{
-	unsigned int i;
-
-	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
-		platform_device_unregister(vimc->subdevs[i]);
-}
-
-static const struct component_master_ops vimc_comp_ops = {
-	.bind = vimc_comp_bind,
-	.unbind = vimc_comp_unbind,
-};
-
 static int vimc_probe(struct platform_device *pdev)
 {
 	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
-	struct component_match *match = NULL;
 	int ret;
 
 	dev_dbg(&pdev->dev, "probe");
 
 	memset(&vimc->mdev, 0, sizeof(vimc->mdev));
 
-	/* Create platform_device for each entity in the topology*/
-	vimc->subdevs = devm_kcalloc(&vimc->pdev.dev, vimc->pipe_cfg->num_ents,
-				     sizeof(*vimc->subdevs), GFP_KERNEL);
-	if (!vimc->subdevs)
-		return -ENOMEM;
-
-	match = vimc_add_subdevs(vimc);
-	if (IS_ERR(match))
-		return PTR_ERR(match);
-
 	/* Link the media device within the v4l2_device */
 	vimc->v4l2_dev.mdev = &vimc->mdev;
 
@@ -314,12 +260,9 @@ static int vimc_probe(struct platform_device *pdev)
 	vimc->mdev.dev = &pdev->dev;
 	media_device_init(&vimc->mdev);
 
-	/* Add self to the component system */
-	ret = component_master_add_with_match(&pdev->dev, &vimc_comp_ops,
-					      match);
+	ret = vimc_register_devices(vimc);
 	if (ret) {
 		media_device_cleanup(&vimc->mdev);
-		vimc_rm_subdevs(vimc);
 		return ret;
 	}
 
@@ -332,8 +275,8 @@ static int vimc_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "remove");
 
-	component_master_del(&pdev->dev, &vimc_comp_ops);
 	vimc_rm_subdevs(vimc);
+	vimc_unregister(vimc);
 
 	return 0;
 }
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index b72b8385067b..73dc17f0d990 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -15,8 +15,6 @@
 
 #include "vimc-common.h"
 
-#define VIMC_DEB_DRV_NAME "vimc-debayer"
-
 static unsigned int deb_mean_win_size = 3;
 module_param(deb_mean_win_size, uint, 0000);
 MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the mean.\n"
@@ -491,21 +489,21 @@ static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
 	.release = vimc_deb_release,
 };
 
-static void vimc_deb_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
-						    ved);
+	struct vimc_ent_device *ved = vcfg->ved;
+	struct vimc_deb_device *vdeb;
 
+	if (!ved)
+		return;
+
+	vdeb = container_of(ved, struct vimc_deb_device, ved);
 	vimc_ent_sd_unregister(ved, &vdeb->sd);
 }
 
-static int vimc_deb_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_deb_device *vdeb;
 	int ret;
 
@@ -516,7 +514,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
 
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
-				   pdata->entity_name,
+				   vcfg->name,
 				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
 				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
 				   MEDIA_PAD_FL_SOURCE},
@@ -527,8 +525,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
 	}
 
 	vdeb->ved.process_frame = vimc_deb_process_frame;
-	dev_set_drvdata(comp, &vdeb->ved);
-	vdeb->dev = comp;
+	vdeb->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
 	vdeb->sink_fmt = sink_fmt_default;
@@ -541,46 +538,6 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
 	vdeb->src_code = MEDIA_BUS_FMT_RGB888_1X24;
 	vdeb->set_rgb_src = vimc_deb_set_rgb_mbus_fmt_rgb888_1x24;
 
+	vcfg->ved = &vdeb->ved;
 	return 0;
 }
-
-static const struct component_ops vimc_deb_comp_ops = {
-	.bind = vimc_deb_comp_bind,
-	.unbind = vimc_deb_comp_unbind,
-};
-
-static int vimc_deb_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &vimc_deb_comp_ops);
-}
-
-static int vimc_deb_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &vimc_deb_comp_ops);
-
-	return 0;
-}
-
-static const struct platform_device_id vimc_deb_driver_ids[] = {
-	{
-		.name           = VIMC_DEB_DRV_NAME,
-	},
-	{ }
-};
-
-static struct platform_driver vimc_deb_pdrv = {
-	.probe		= vimc_deb_probe,
-	.remove		= vimc_deb_remove,
-	.id_table	= vimc_deb_driver_ids,
-	.driver		= {
-		.name	= VIMC_DEB_DRV_NAME,
-	},
-};
-
-module_platform_driver(vimc_deb_pdrv);
-
-MODULE_DEVICE_TABLE(platform, vimc_deb_driver_ids);
-
-MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Debayer");
-MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
-MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 49ab8d9dd9c9..17da47a103ef 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -5,18 +5,13 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
-#include <linux/component.h>
 #include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
 #include <linux/vmalloc.h>
 #include <linux/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
 #include "vimc-common.h"
 
-#define VIMC_SCA_DRV_NAME "vimc-scaler"
-
 static unsigned int sca_mult = 3;
 module_param(sca_mult, uint, 0000);
 MODULE_PARM_DESC(sca_mult, " the image size multiplier");
@@ -350,22 +345,22 @@ static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
 	.release = vimc_sca_release,
 };
 
-static void vimc_sca_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
-						    ved);
+	struct vimc_ent_device *ved = vcfg->ved;
+	struct vimc_sca_device *vsca;
+
+	if (!ved)
+		return;
 
+	vsca = container_of(ved, struct vimc_sca_device, ved);
 	vimc_ent_sd_unregister(ved, &vsca->sd);
 }
 
 
-static int vimc_sca_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_sca_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_sca_device *vsca;
 	int ret;
 
@@ -376,7 +371,7 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
 
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
-				   pdata->entity_name,
+				   vcfg->name,
 				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
 				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
 				   MEDIA_PAD_FL_SOURCE},
@@ -387,52 +382,12 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
 	}
 
 	vsca->ved.process_frame = vimc_sca_process_frame;
-	dev_set_drvdata(comp, &vsca->ved);
-	vsca->dev = comp;
+	vsca->dev = &vimc->pdev.dev;
+
+	vcfg->ved = &vsca->ved;
 
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
 
 	return 0;
 }
-
-static const struct component_ops vimc_sca_comp_ops = {
-	.bind = vimc_sca_comp_bind,
-	.unbind = vimc_sca_comp_unbind,
-};
-
-static int vimc_sca_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &vimc_sca_comp_ops);
-}
-
-static int vimc_sca_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &vimc_sca_comp_ops);
-
-	return 0;
-}
-
-static const struct platform_device_id vimc_sca_driver_ids[] = {
-	{
-		.name           = VIMC_SCA_DRV_NAME,
-	},
-	{ }
-};
-
-static struct platform_driver vimc_sca_pdrv = {
-	.probe		= vimc_sca_probe,
-	.remove		= vimc_sca_remove,
-	.id_table	= vimc_sca_driver_ids,
-	.driver		= {
-		.name	= VIMC_SCA_DRV_NAME,
-	},
-};
-
-module_platform_driver(vimc_sca_pdrv);
-
-MODULE_DEVICE_TABLE(platform, vimc_sca_driver_ids);
-
-MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Scaler");
-MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
-MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 6c53b9fc1617..f6aea32175a2 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -5,10 +5,6 @@
  * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
  */
 
-#include <linux/component.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/platform_device.h>
 #include <linux/v4l2-mediabus.h>
 #include <linux/vmalloc.h>
 #include <media/v4l2-ctrls.h>
@@ -18,8 +14,6 @@
 
 #include "vimc-common.h"
 
-#define VIMC_SEN_DRV_NAME "vimc-sensor"
-
 struct vimc_sen_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
@@ -304,13 +298,15 @@ static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
 	.release = vimc_sen_release,
 };
 
-static void vimc_sen_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_sen_device *vsen =
-				container_of(ved, struct vimc_sen_device, ved);
+	struct vimc_ent_device *ved = vcfg->ved;
+	struct vimc_sen_device *vsen;
 
+	if (!ved)
+		return;
+
+	vsen = container_of(ved, struct vimc_sen_device, ved);
 	vimc_ent_sd_unregister(ved, &vsen->sd);
 }
 
@@ -331,11 +327,9 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
 	.qmenu = tpg_pattern_strings,
 };
 
-static int vimc_sen_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_sen_device *vsen;
 	int ret;
 
@@ -368,7 +362,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
-				   pdata->entity_name,
+				   vcfg->name,
 				   MEDIA_ENT_F_CAM_SENSOR, 1,
 				   (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE},
 				   &vimc_sen_int_ops, &vimc_sen_ops);
@@ -376,8 +370,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 		goto err_free_hdl;
 
 	vsen->ved.process_frame = vimc_sen_process_frame;
-	dev_set_drvdata(comp, &vsen->ved);
-	vsen->dev = comp;
+	vsen->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
@@ -389,6 +382,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 	if (ret)
 		goto err_unregister_ent_sd;
 
+	vcfg->ved = &vsen->ved;
 	return 0;
 
 err_unregister_ent_sd:
@@ -400,44 +394,3 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 
 	return ret;
 }
-
-static const struct component_ops vimc_sen_comp_ops = {
-	.bind = vimc_sen_comp_bind,
-	.unbind = vimc_sen_comp_unbind,
-};
-
-static int vimc_sen_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &vimc_sen_comp_ops);
-}
-
-static int vimc_sen_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &vimc_sen_comp_ops);
-
-	return 0;
-}
-
-static const struct platform_device_id vimc_sen_driver_ids[] = {
-	{
-		.name           = VIMC_SEN_DRV_NAME,
-	},
-	{ }
-};
-
-static struct platform_driver vimc_sen_pdrv = {
-	.probe		= vimc_sen_probe,
-	.remove		= vimc_sen_remove,
-	.id_table	= vimc_sen_driver_ids,
-	.driver		= {
-		.name	= VIMC_SEN_DRV_NAME,
-	},
-};
-
-module_platform_driver(vimc_sen_pdrv);
-
-MODULE_DEVICE_TABLE(platform, vimc_sen_driver_ids);
-
-MODULE_DESCRIPTION("Virtual Media Controller Driver (VIMC) Sensor");
-MODULE_AUTHOR("Helen Mae Koike Fornazier <helen.fornazier@gmail.com>");
-MODULE_LICENSE("GPL");
-- 
2.20.1

