Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC388F4E3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 21:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733045AbfHOTmT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 15:42:19 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40813 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733037AbfHOTmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 15:42:18 -0400
Received: by mail-io1-f67.google.com with SMTP id t6so1536495ios.7
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AfATXmr/qTzwWyC4A+RMS20K5SPHvCfjtvj+0UjXEL8=;
        b=Xt6+dqU7NEyBqqR2oc2SLXqG6LVRiUJHETu5nvZ1vDYyDkigH97rJbH2+6GqfXd21h
         tiEs+Vb2JaSYvIH5c9M2e4gVXSz+yQZ7ip0ihtghuPb8lv7aHmojePCMoThHvW1IZFbT
         ez80RFnRAfm8XDU510Fphl14T8df3EDGtpplQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AfATXmr/qTzwWyC4A+RMS20K5SPHvCfjtvj+0UjXEL8=;
        b=ImabxOyz1uhMMwkbASCdaiiRJD6BK9H6O1vrQPRrj9deAjLHTP1PeEFE+keeYMXrpH
         5H/F8Z02SpKSzkdXuDL9F3KTcw2poDV6yUQR21ozF/YHFVloMTpK26EOOq84bZNU2JPj
         bIsquiKFMuvsqBJbpaqgxBXpNjAa33Yi1TTo+pmpeWHfsAMdKILX/m7ewUhR1q+tV88C
         FT8lMfhO+sRUvt1HZ5OyNqZEKj7Ia6gJsvtADnu2SpP+hgBp8gPNXxF1TTHqSa1zN7HK
         1tdJNCjNXtm2tf6AQ+bT0wDInte/+YtpA2g7XGbjIsMtbd4K0fcXQpKIuYBvssY/dPZa
         ye2g==
X-Gm-Message-State: APjAAAVWGGoqMPWUF2C8RhMHzZKRdBMwMyC4jY3JLsUHUTKWJRMj55Wf
        b8eLgYyNFt2noVOyJV71p3uQEg==
X-Google-Smtp-Source: APXvYqxV4wAPr25AoQB1A09uhZ3kaJsZdFF9MicdBPVIPOxRLFvSnu5wkj5L7MH7ur/FsJ5I1AvKAw==
X-Received: by 2002:a6b:4101:: with SMTP id n1mr7382193ioa.138.1565898136912;
        Thu, 15 Aug 2019 12:42:16 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j16sm3624268iok.34.2019.08.15.12.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 12:42:16 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, helen.koike@collabora.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, andrealmeid@collabora.com
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] media: vimc: Collapse component structure into a single monolithic driver
Date:   Thu, 15 Aug 2019 13:42:12 -0600
Message-Id: <9439500242e4ac54ff55aedf56df0216a96c0ce9.1565740213.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1565740213.git.skhan@linuxfoundation.org>
References: <cover.1565740213.git.skhan@linuxfoundation.org>
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
 drivers/media/platform/vimc/vimc-capture.c |  75 ++-------
 drivers/media/platform/vimc/vimc-common.h  |  54 ++++++
 drivers/media/platform/vimc/vimc-core.c    | 182 +++++++--------------
 drivers/media/platform/vimc/vimc-debayer.c |  68 ++------
 drivers/media/platform/vimc/vimc-scaler.c  |  68 ++------
 drivers/media/platform/vimc/vimc-sensor.c  |  69 ++------
 7 files changed, 157 insertions(+), 366 deletions(-)

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
index 664855708fdf..0b5cd38fbeb9 100644
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
 static const u32 vimc_cap_supported_pixfmt[] = {
 	V4L2_PIX_FMT_BGR24,
 	V4L2_PIX_FMT_RGB24,
@@ -367,11 +361,11 @@ static void vimc_cap_release(struct video_device *vdev)
 	kfree(vcap);
 }
 
-static void vimc_cap_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_cap_device *vcap = container_of(ved, struct vimc_cap_device,
+	struct vimc_ent_device *ved = vent->ved;
+	struct vimc_cap_device *vcap = container_of(ved,
+						    struct vimc_cap_device,
 						    ved);
 
 	vb2_queue_release(&vcap->queue);
@@ -418,11 +412,9 @@ static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
 	return NULL;
 }
 
-static int vimc_cap_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_cap_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_cap_device *vcap;
 	struct video_device *vdev;
 	struct vb2_queue *q;
@@ -442,7 +434,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	}
 
 	/* Initialize the media entity */
-	vcap->vdev.entity.name = pdata->entity_name;
+	vcap->vdev.entity.name = vent->name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
 	ret = media_entity_pads_init(&vcap->vdev.entity,
 				     1, vcap->ved.pads);
@@ -466,8 +458,8 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 
 	ret = vb2_queue_init(q);
 	if (ret) {
-		dev_err(comp, "%s: vb2 queue init failed (err=%d)\n",
-			pdata->entity_name, ret);
+		dev_err(&vimc->pdev.dev, "%s: vb2 queue init failed (err=%d)\n",
+			vent->name, ret);
 		goto err_clean_m_ent;
 	}
 
@@ -484,8 +476,7 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	vcap->ved.ent = &vcap->vdev.entity;
 	vcap->ved.process_frame = vimc_cap_process_frame;
 	vcap->ved.vdev_get_format = vimc_cap_get_format;
-	dev_set_drvdata(comp, &vcap->ved);
-	vcap->dev = comp;
+	vcap->dev = &vimc->pdev.dev;
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
@@ -498,17 +489,18 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 	vdev->queue = q;
 	vdev->v4l2_dev = v4l2_dev;
 	vdev->vfl_dir = VFL_DIR_RX;
-	strscpy(vdev->name, pdata->entity_name, sizeof(vdev->name));
+	strscpy(vdev->name, vent->name, sizeof(vdev->name));
 	video_set_drvdata(vdev, &vcap->ved);
 
 	/* Register the video_device with the v4l2 and the media framework */
 	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
 	if (ret) {
-		dev_err(comp, "%s: video register failed (err=%d)\n",
+		dev_err(&vimc->pdev.dev, "%s: video register failed (err=%d)\n",
 			vcap->vdev.name, ret);
 		goto err_release_queue;
 	}
 
+	vent->ved = &vcap->ved;
 	return 0;
 
 err_release_queue:
@@ -522,44 +514,3 @@ static int vimc_cap_comp_bind(struct device *comp, struct device *master,
 
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
index 7b4d988b208b..cfc9143686b0 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -9,6 +9,7 @@
 #define _VIMC_COMMON_H_
 
 #include <linux/slab.h>
+#include <linux/platform_device.h>
 #include <media/media-device.h>
 #include <media/v4l2-device.h>
 
@@ -69,6 +70,28 @@ struct vimc_platform_data {
 	char entity_name[32];
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
+	/* The platform device */
+	struct platform_device pdev;
+
+	/* The pipeline configuration */
+	const struct vimc_pipeline_config *pipe_cfg;
+
+	/* The Associated media_device parent */
+	struct media_device mdev;
+
+	/* Internal v4l2 parent device */
+	struct v4l2_device v4l2_dev;
+};
+
 /**
  * struct vimc_ent_device - core struct that represents a node in the topology
  *
@@ -97,6 +120,37 @@ struct vimc_ent_device {
 			      struct v4l2_pix_format *fmt);
 };
 
+/**
+ * struct vimc_ent_config	Structure which describes individual
+ *				configuration for each entity
+ *
+ * @name		entity name
+ * @ved		pointer to vimc_ent_device (a node in the topology)
+ * @add		subdev add hook - initializes and registers subdev
+ *			called from vimc-core
+ * @rm			subdev rm hook - unregisters and frees subdev
+ *			called from vimc-core
+ */
+struct vimc_ent_config {
+	const char *name;
+	struct vimc_ent_device *ved;
+	int (*add)(struct vimc_device *vimc, struct vimc_ent_config *vent);
+	void (*rm)(struct vimc_device *vimc, struct vimc_ent_config *vent);
+};
+
+/* prototypes for vimc_ent_config add and rm hooks */
+int vimc_cap_add(struct vimc_device *vimc, struct vimc_ent_config *vent);
+void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_config *vent);
+
+int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vent);
+void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_config *vent);
+
+int vimc_sca_add(struct vimc_device *vimc, struct vimc_ent_config *vent);
+void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vent);
+
+int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vent);
+void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vent);
+
 /**
  * vimc_mbus_code_supported - helper to check supported mbus codes
  *
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 571c55aa0e16..334f60468d06 100644
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
@@ -68,43 +44,52 @@ struct vimc_pipeline_config {
  * Topology Configuration
  */
 
-static const struct vimc_ent_config ent_config[] = {
+static struct vimc_ent_config ent_config[] = {
 	{
 		.name = "Sensor A",
-		.drv = "vimc-sensor",
+		.add = vimc_sen_add,
+		.rm = vimc_sen_rm,
 	},
 	{
 		.name = "Sensor B",
-		.drv = "vimc-sensor",
+		.add = vimc_sen_add,
+		.rm = vimc_sen_rm,
 	},
 	{
 		.name = "Debayer A",
-		.drv = "vimc-debayer",
+		.add = vimc_deb_add,
+		.rm = vimc_deb_rm,
 	},
 	{
 		.name = "Debayer B",
-		.drv = "vimc-debayer",
+		.add = vimc_deb_add,
+		.rm = vimc_deb_rm,
 	},
 	{
 		.name = "Raw Capture 0",
-		.drv = "vimc-capture",
+		.add = vimc_cap_add,
+		.rm = vimc_cap_rm,
 	},
 	{
 		.name = "Raw Capture 1",
-		.drv = "vimc-capture",
+		.add = vimc_cap_add,
+		.rm = vimc_cap_rm,
 	},
 	{
-		.name = "RGB/YUV Input",
 		/* TODO: change this to vimc-input when it is implemented */
-		.drv = "vimc-sensor",
+		.name = "RGB/YUV Input",
+		.add = vimc_sen_add,
+		.rm = vimc_sen_rm,
 	},
 	{
 		.name = "Scaler",
-		.drv = "vimc-scaler",
+		.add = vimc_sca_add,
+		.rm = vimc_sca_rm,
 	},
 	{
 		.name = "RGB/YUV Capture",
-		.drv = "vimc-capture",
+		.add = vimc_cap_add,
+		.rm = vimc_cap_rm,
 	},
 };
 
@@ -127,7 +112,7 @@ static const struct vimc_ent_link ent_links[] = {
 	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
-static const struct vimc_pipeline_config pipe_cfg = {
+static struct vimc_pipeline_config pipe_cfg = {
 	.ents		= ent_config,
 	.num_ents	= ARRAY_SIZE(ent_config),
 	.links		= ent_links,
@@ -144,14 +129,11 @@ static int vimc_create_links(struct vimc_device *vimc)
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
@@ -163,13 +145,28 @@ static int vimc_create_links(struct vimc_device *vimc)
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
+static int vimc_register_devices(struct vimc_device *vimc)
+{
+	int ret;
 
 	/* Register the v4l2 struct */
 	ret = v4l2_device_register(vimc->mdev.dev, &vimc->v4l2_dev);
@@ -179,22 +176,20 @@ static int vimc_comp_bind(struct device *master)
 		return ret;
 	}
 
-	/* Bind subdevices */
-	ret = component_bind_all(master, &vimc->v4l2_dev);
-	if (ret)
-		goto err_v4l2_unregister;
+	/* Invoke entity config hooks to initialize and register subdevs */
+	vimc_add_subdevs(vimc);
 
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
@@ -211,98 +206,36 @@ static int vimc_comp_bind(struct device *master)
 err_mdev_unregister:
 	media_device_unregister(&vimc->mdev);
 	media_device_cleanup(&vimc->mdev);
-err_comp_unbind_all:
-	component_unbind_all(master, NULL);
 err_v4l2_unregister:
 	v4l2_device_unregister(&vimc->v4l2_dev);
 
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
 static void vimc_rm_subdevs(struct vimc_device *vimc)
 {
 	unsigned int i;
 
 	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
-		platform_device_unregister(vimc->subdevs[i]);
+		vimc->pipe_cfg->ents[i].rm(vimc, &vimc->pipe_cfg->ents[i]);
 }
 
-static const struct component_master_ops vimc_comp_ops = {
-	.bind = vimc_comp_bind,
-	.unbind = vimc_comp_unbind,
-};
-
 static int vimc_probe(struct platform_device *pdev)
 {
 	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
-	struct component_match *match = NULL;
-	int ret;
+	int ret = 0;
 
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
 
@@ -314,16 +247,11 @@ static int vimc_probe(struct platform_device *pdev)
 	vimc->mdev.dev = &pdev->dev;
 	media_device_init(&vimc->mdev);
 
-	/* Add self to the component system */
-	ret = component_master_add_with_match(&pdev->dev, &vimc_comp_ops,
-					      match);
-	if (ret) {
+	ret = vimc_register_devices(vimc);
+	if (ret)
 		media_device_cleanup(&vimc->mdev);
-		vimc_rm_subdevs(vimc);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static int vimc_remove(struct platform_device *pdev)
@@ -332,8 +260,8 @@ static int vimc_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "remove");
 
-	component_master_del(&pdev->dev, &vimc_comp_ops);
 	vimc_rm_subdevs(vimc);
+	vimc_unregister(vimc);
 
 	return 0;
 }
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 00598fbf3cba..3b4e73c10a03 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -5,19 +5,14 @@
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
 
-#define VIMC_DEB_DRV_NAME "vimc-debayer"
-/* This module only supports transforming a bayer format
- * to V4L2_PIX_FMT_RGB24
+/* Supports transforming a bayer format to V4L2_PIX_FMT_RGB24
  */
 #define VIMC_DEB_SRC_PIXFMT V4L2_PIX_FMT_RGB24
 #define VIMC_DEB_SRC_MBUS_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
@@ -513,21 +508,19 @@ static const struct v4l2_subdev_internal_ops vimc_deb_int_ops = {
 	.release = vimc_deb_release,
 };
 
-static void vimc_deb_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_deb_device *vdeb = container_of(ved, struct vimc_deb_device,
+	struct vimc_ent_device *ved = vent->ved;
+	struct vimc_deb_device *vdeb = container_of(ved,
+						    struct vimc_deb_device,
 						    ved);
 
 	vimc_ent_sd_unregister(ved, &vdeb->sd);
 }
 
-static int vimc_deb_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_deb_device *vdeb;
 	int ret;
 
@@ -538,7 +531,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
 
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
-				   pdata->entity_name,
+				   vent->name,
 				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
 				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
 				   MEDIA_PAD_FL_SOURCE},
@@ -549,8 +542,7 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
 	}
 
 	vdeb->ved.process_frame = vimc_deb_process_frame;
-	dev_set_drvdata(comp, &vdeb->ved);
-	vdeb->dev = comp;
+	vdeb->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
 	vdeb->sink_fmt = sink_fmt_default;
@@ -563,46 +555,6 @@ static int vimc_deb_comp_bind(struct device *comp, struct device *master,
 	 */
 	vdeb->set_rgb_src = vimc_deb_set_rgb_pix_rgb24;
 
+	vent->ved = &vdeb->ved;
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
index c7123a45c55b..cb5eb42de69d 100644
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
@@ -344,22 +339,21 @@ static const struct v4l2_subdev_internal_ops vimc_sca_int_ops = {
 	.release = vimc_sca_release,
 };
 
-static void vimc_sca_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_sca_device *vsca = container_of(ved, struct vimc_sca_device,
+	struct vimc_ent_device *ved = vent->ved;
+	struct vimc_sca_device *vsca = container_of(ved,
+						    struct vimc_sca_device,
 						    ved);
 
+
 	vimc_ent_sd_unregister(ved, &vsca->sd);
 }
 
 
-static int vimc_sca_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_sca_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_sca_device *vsca;
 	int ret;
 
@@ -370,7 +364,7 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
 
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
-				   pdata->entity_name,
+				   vent->name,
 				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
 				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
 				   MEDIA_PAD_FL_SOURCE},
@@ -381,52 +375,12 @@ static int vimc_sca_comp_bind(struct device *comp, struct device *master,
 	}
 
 	vsca->ved.process_frame = vimc_sca_process_frame;
-	dev_set_drvdata(comp, &vsca->ved);
-	vsca->dev = comp;
+	vsca->dev = &vimc->pdev.dev;
+
+	vent->ved = &vsca->ved;
 
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
index 51359472eef2..70b195b817a4 100644
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
@@ -279,12 +273,12 @@ static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
 	.release = vimc_sen_release,
 };
 
-static void vimc_sen_comp_unbind(struct device *comp, struct device *master,
-				 void *master_data)
+void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct vimc_ent_device *ved = dev_get_drvdata(comp);
-	struct vimc_sen_device *vsen =
-				container_of(ved, struct vimc_sen_device, ved);
+	struct vimc_ent_device *ved = vent->ved;
+	struct vimc_sen_device *vsen = container_of(ved,
+						    struct vimc_sen_device,
+						    ved);
 
 	vimc_ent_sd_unregister(ved, &vsen->sd);
 }
@@ -306,11 +300,9 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
 	.qmenu = tpg_pattern_strings,
 };
 
-static int vimc_sen_comp_bind(struct device *comp, struct device *master,
-			      void *master_data)
+int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vent)
 {
-	struct v4l2_device *v4l2_dev = master_data;
-	struct vimc_platform_data *pdata = comp->platform_data;
+	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
 	struct vimc_sen_device *vsen;
 	int ret;
 
@@ -343,7 +335,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vsen->ved, &vsen->sd, v4l2_dev,
-				   pdata->entity_name,
+				   vent->name,
 				   MEDIA_ENT_F_CAM_SENSOR, 1,
 				   (const unsigned long[1]) {MEDIA_PAD_FL_SOURCE},
 				   &vimc_sen_int_ops, &vimc_sen_ops);
@@ -351,8 +343,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 		goto err_free_hdl;
 
 	vsen->ved.process_frame = vimc_sen_process_frame;
-	dev_set_drvdata(comp, &vsen->ved);
-	vsen->dev = comp;
+	vsen->dev = &vimc->pdev.dev;
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
@@ -364,6 +355,7 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 	if (ret)
 		goto err_unregister_ent_sd;
 
+	vent->ved = &vsen->ved;
 	return 0;
 
 err_unregister_ent_sd:
@@ -375,44 +367,3 @@ static int vimc_sen_comp_bind(struct device *comp, struct device *master,
 
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
2.17.1

