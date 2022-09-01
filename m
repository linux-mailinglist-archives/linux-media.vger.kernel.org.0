Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5675A937E
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbiIAJrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbiIAJrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E48BFE073
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0BGSNT3iUEgLTGdhl1H+Tq57iKKxyGsBnzn753pgzwc=;
        b=iV8uljccnU4c+gwIq0O7vsm5Mb0Pevgi9ay59SD2MmT6fkAXI6RPdAGoZ1IHe1c3hlfAFP
        mDRBPhI1K0oTCuVBEzG6nAnPL0d9G1KZJEn3TFODVE1Mu2PGVIeLqestEDZ9FzR7udAse4
        98aGZriwAqVrYoNOgWzeJaOyscGUnXo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-AAhp2Zf5ODeY-UKcyZTjnA-1; Thu, 01 Sep 2022 05:46:53 -0400
X-MC-Unique: AAhp2Zf5ODeY-UKcyZTjnA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D53410AF7DD;
        Thu,  1 Sep 2022 09:46:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 056F9492C3B;
        Thu,  1 Sep 2022 09:46:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 02/14] media: atomisp: Remove file-injection support
Date:   Thu,  1 Sep 2022 11:46:14 +0200
Message-Id: <20220901094626.11513-3-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The file-injection support of the atomisp driver has not been tested
and is not necessary for camera support, remove it.

Note the main reason for removing this is because it depends on
the videobuf (version 1) outq and we want to remove or replace
all videobuf usage in the driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/Makefile        |   1 -
 .../staging/media/atomisp/pci/atomisp_file.c  | 229 ------------------
 .../staging/media/atomisp/pci/atomisp_file.h  |  44 ----
 .../staging/media/atomisp/pci/atomisp_fops.c  |   3 +-
 .../media/atomisp/pci/atomisp_internal.h      |   4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   3 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  40 +--
 .../media/atomisp/pci/atomisp_subdev.h        |   1 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  30 ---
 9 files changed, 8 insertions(+), 347 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.h

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index fb7b406f50bf..532e12ed72e6 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -17,7 +17,6 @@ atomisp-objs += \
 	pci/atomisp_compat_css20.o \
 	pci/atomisp_csi2.o \
 	pci/atomisp_drvfs.o \
-	pci/atomisp_file.o \
 	pci/atomisp_fops.o \
 	pci/atomisp_ioctl.o \
 	pci/atomisp_subdev.o \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_file.c b/drivers/staging/media/atomisp/pci/atomisp_file.c
deleted file mode 100644
index 4570a9ab100b..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp_file.c
+++ /dev/null
@@ -1,229 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Medifield PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-
-#include <media/v4l2-event.h>
-#include <media/v4l2-mediabus.h>
-
-#include <media/videobuf-vmalloc.h>
-#include <linux/delay.h>
-
-#include "ia_css.h"
-
-#include "atomisp_cmd.h"
-#include "atomisp_common.h"
-#include "atomisp_file.h"
-#include "atomisp_internal.h"
-#include "atomisp_ioctl.h"
-
-static void file_work(struct work_struct *work)
-{
-	struct atomisp_file_device *file_dev =
-	    container_of(work, struct atomisp_file_device, work);
-	struct atomisp_device *isp = file_dev->isp;
-	/* only support file injection on subdev0 */
-	struct atomisp_sub_device *asd = &isp->asd[0];
-	struct atomisp_video_pipe *out_pipe = &asd->video_in;
-	unsigned short *buf = videobuf_to_vmalloc(out_pipe->outq.bufs[0]);
-	struct v4l2_mbus_framefmt isp_sink_fmt;
-
-	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-		return;
-
-	dev_dbg(isp->dev, ">%s: ready to start streaming\n", __func__);
-	isp_sink_fmt = *atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-						V4L2_SUBDEV_FORMAT_ACTIVE,
-						ATOMISP_SUBDEV_PAD_SINK);
-
-	while (!ia_css_isp_has_started())
-		usleep_range(1000, 1500);
-
-	ia_css_stream_send_input_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
-				       buf, isp_sink_fmt.width,
-				       isp_sink_fmt.height);
-	dev_dbg(isp->dev, "<%s: streaming done\n", __func__);
-}
-
-static int file_input_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct atomisp_file_device *file_dev = v4l2_get_subdevdata(sd);
-	struct atomisp_device *isp = file_dev->isp;
-	/* only support file injection on subdev0 */
-	struct atomisp_sub_device *asd = &isp->asd[0];
-
-	dev_dbg(isp->dev, "%s: enable %d\n", __func__, enable);
-	if (enable) {
-		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
-			return 0;
-
-		queue_work(file_dev->work_queue, &file_dev->work);
-		return 0;
-	}
-	cancel_work_sync(&file_dev->work);
-	return 0;
-}
-
-static int file_input_get_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *format)
-{
-	struct v4l2_mbus_framefmt *fmt = &format->format;
-	struct atomisp_file_device *file_dev = v4l2_get_subdevdata(sd);
-	struct atomisp_device *isp = file_dev->isp;
-	/* only support file injection on subdev0 */
-	struct atomisp_sub_device *asd = &isp->asd[0];
-	struct v4l2_mbus_framefmt *isp_sink_fmt;
-
-	if (format->pad)
-		return -EINVAL;
-	isp_sink_fmt = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-					       V4L2_SUBDEV_FORMAT_ACTIVE,
-					       ATOMISP_SUBDEV_PAD_SINK);
-
-	fmt->width = isp_sink_fmt->width;
-	fmt->height = isp_sink_fmt->height;
-	fmt->code = isp_sink_fmt->code;
-
-	return 0;
-}
-
-static int file_input_set_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *format)
-{
-	struct v4l2_mbus_framefmt *fmt = &format->format;
-
-	if (format->pad)
-		return -EINVAL;
-	file_input_get_fmt(sd, sd_state, format);
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		sd_state->pads->try_fmt = *fmt;
-	return 0;
-}
-
-static int file_input_log_status(struct v4l2_subdev *sd)
-{
-	/*to fake*/
-	return 0;
-}
-
-static int file_input_s_power(struct v4l2_subdev *sd, int on)
-{
-	/* to fake */
-	return 0;
-}
-
-static int file_input_enum_mbus_code(struct v4l2_subdev *sd,
-				     struct v4l2_subdev_state *sd_state,
-				     struct v4l2_subdev_mbus_code_enum *code)
-{
-	/*to fake*/
-	return 0;
-}
-
-static int file_input_enum_frame_size(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_state *sd_state,
-				      struct v4l2_subdev_frame_size_enum *fse)
-{
-	/*to fake*/
-	return 0;
-}
-
-static int file_input_enum_frame_ival(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_state *sd_state,
-				      struct v4l2_subdev_frame_interval_enum
-				      *fie)
-{
-	/*to fake*/
-	return 0;
-}
-
-static const struct v4l2_subdev_video_ops file_input_video_ops = {
-	.s_stream = file_input_s_stream,
-};
-
-static const struct v4l2_subdev_core_ops file_input_core_ops = {
-	.log_status = file_input_log_status,
-	.s_power = file_input_s_power,
-};
-
-static const struct v4l2_subdev_pad_ops file_input_pad_ops = {
-	.enum_mbus_code = file_input_enum_mbus_code,
-	.enum_frame_size = file_input_enum_frame_size,
-	.enum_frame_interval = file_input_enum_frame_ival,
-	.get_fmt = file_input_get_fmt,
-	.set_fmt = file_input_set_fmt,
-};
-
-static const struct v4l2_subdev_ops file_input_ops = {
-	.core = &file_input_core_ops,
-	.video = &file_input_video_ops,
-	.pad = &file_input_pad_ops,
-};
-
-void
-atomisp_file_input_unregister_entities(struct atomisp_file_device *file_dev)
-{
-	media_entity_cleanup(&file_dev->sd.entity);
-	v4l2_device_unregister_subdev(&file_dev->sd);
-}
-
-int atomisp_file_input_register_entities(struct atomisp_file_device *file_dev,
-	struct v4l2_device *vdev)
-{
-	/* Register the subdev and video nodes. */
-	return  v4l2_device_register_subdev(vdev, &file_dev->sd);
-}
-
-void atomisp_file_input_cleanup(struct atomisp_device *isp)
-{
-	struct atomisp_file_device *file_dev = &isp->file_dev;
-
-	if (file_dev->work_queue) {
-		destroy_workqueue(file_dev->work_queue);
-		file_dev->work_queue = NULL;
-	}
-}
-
-int atomisp_file_input_init(struct atomisp_device *isp)
-{
-	struct atomisp_file_device *file_dev = &isp->file_dev;
-	struct v4l2_subdev *sd = &file_dev->sd;
-	struct media_pad *pads = file_dev->pads;
-	struct media_entity *me = &sd->entity;
-
-	file_dev->isp = isp;
-	file_dev->work_queue = alloc_workqueue(isp->v4l2_dev.name, 0, 1);
-	if (!file_dev->work_queue) {
-		dev_err(isp->dev, "Failed to initialize file inject workq\n");
-		return -ENOMEM;
-	}
-
-	INIT_WORK(&file_dev->work, file_work);
-
-	v4l2_subdev_init(sd, &file_input_ops);
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strscpy(sd->name, "file_input_subdev", sizeof(sd->name));
-	v4l2_set_subdevdata(sd, file_dev);
-
-	pads[0].flags = MEDIA_PAD_FL_SINK;
-	me->function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
-
-	return media_entity_pads_init(me, 1, pads);
-}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_file.h b/drivers/staging/media/atomisp/pci/atomisp_file.h
deleted file mode 100644
index f166a2aefff1..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp_file.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Medifield PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
- *
- * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-
-#ifndef __ATOMISP_FILE_H__
-#define __ATOMISP_FILE_H__
-
-#include <media/media-entity.h>
-#include <media/v4l2-subdev.h>
-
-struct atomisp_device;
-
-struct atomisp_file_device {
-	struct v4l2_subdev sd;
-	struct atomisp_device *isp;
-	struct media_pad pads[1];
-
-	struct workqueue_struct *work_queue;
-	struct work_struct work;
-};
-
-void atomisp_file_input_cleanup(struct atomisp_device *isp);
-int atomisp_file_input_init(struct atomisp_device *isp);
-void atomisp_file_input_unregister_entities(
-    struct atomisp_file_device *file_dev);
-int atomisp_file_input_register_entities(struct atomisp_file_device *file_dev,
-	struct v4l2_device *vdev);
-#endif /* __ATOMISP_FILE_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 77150e4ae144..9ff0bcc04307 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -742,8 +742,7 @@ static unsigned int atomisp_subdev_users(struct atomisp_sub_device *asd)
 	       asd->video_out_vf.users +
 	       asd->video_out_capture.users +
 	       asd->video_out_video_capture.users +
-	       asd->video_acc.users +
-	       asd->video_in.users;
+	       asd->video_acc.users;
 }
 
 unsigned int atomisp_dev_users(struct atomisp_device *isp)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index f71ab1ee6e19..ce1746e7ab9f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -34,7 +34,6 @@
 #include "sh_css_legacy.h"
 
 #include "atomisp_csi2.h"
-#include "atomisp_file.h"
 #include "atomisp_subdev.h"
 #include "atomisp_tpg.h"
 #include "atomisp_compat.h"
@@ -86,7 +85,7 @@
 #define ATOM_ISP_POWER_DOWN	0
 #define ATOM_ISP_POWER_UP	1
 
-#define ATOM_ISP_MAX_INPUTS	4
+#define ATOM_ISP_MAX_INPUTS	3
 
 #define ATOMISP_SC_TYPE_SIZE	2
 
@@ -241,7 +240,6 @@ struct atomisp_device {
 
 	struct atomisp_mipi_csi2_device csi2_port[ATOMISP_CAMERA_NR_PORTS];
 	struct atomisp_tpg_device tpg;
-	struct atomisp_file_device file_dev;
 
 	/* Purpose of mutex is to protect and serialize use of isp data
 	 * structures and css API calls. */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d0b5dacbb20a..571a2df75238 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -609,8 +609,7 @@ atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 	return asd->video_out_preview.capq.streaming
 	       + asd->video_out_capture.capq.streaming
 	       + asd->video_out_video_capture.capq.streaming
-	       + asd->video_out_vf.capq.streaming
-	       + asd->video_in.capq.streaming;
+	       + asd->video_out_vf.capq.streaming;
 }
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 6d533919d466..1509543924d2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1126,9 +1126,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret < 0)
 		return ret;
 
-	atomisp_init_subdev_pipe(asd, &asd->video_in,
-				 V4L2_BUF_TYPE_VIDEO_OUTPUT);
-
 	atomisp_init_subdev_pipe(asd, &asd->video_out_preview,
 				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
@@ -1143,11 +1140,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 
 	atomisp_init_acc_pipe(asd, &asd->video_acc);
 
-	ret = atomisp_video_init(&asd->video_in, "MEMORY",
-				 ATOMISP_RUN_MODE_SDV);
-	if (ret < 0)
-		return ret;
-
 	ret = atomisp_video_init(&asd->video_out_capture, "CAPTURE",
 				 ATOMISP_RUN_MODE_STILL_CAPTURE);
 	if (ret < 0)
@@ -1226,7 +1218,11 @@ int atomisp_create_pads_links(struct atomisp_device *isp)
 				return ret;
 		}
 	}
-	for (i = 0; i < isp->input_cnt - 2; i++) {
+	for (i = 0; i < isp->input_cnt; i++) {
+		/* Don't create links for the test-pattern-generator */
+		if (isp->inputs[i].type == TEST_PATTERN)
+			continue;
+
 		ret = media_create_pad_link(&isp->inputs[i].camera->entity, 0,
 					    &isp->csi2_port[isp->inputs[i].
 						    port].subdev.entity,
@@ -1262,17 +1258,6 @@ int atomisp_create_pads_links(struct atomisp_device *isp)
 					    entity, 0, 0);
 		if (ret < 0)
 			return ret;
-		/*
-		 * file input only supported on subdev0
-		 * so do not create pad link for subdevs other then subdev0
-		 */
-		if (asd->index)
-			return 0;
-		ret = media_create_pad_link(&asd->video_in.vdev.entity,
-					    0, &asd->subdev.entity,
-					    ATOMISP_SUBDEV_PAD_SINK, 0);
-		if (ret < 0)
-			return ret;
 	}
 	return 0;
 }
@@ -1302,7 +1287,6 @@ void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd)
 {
 	atomisp_subdev_cleanup_entities(asd);
 	v4l2_device_unregister_subdev(&asd->subdev);
-	atomisp_video_unregister(&asd->video_in);
 	atomisp_video_unregister(&asd->video_out_preview);
 	atomisp_video_unregister(&asd->video_out_vf);
 	atomisp_video_unregister(&asd->video_out_capture);
@@ -1360,20 +1344,6 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 	if (ret < 0)
 		goto error;
 
-	/*
-	 * file input only supported on subdev0
-	 * so do not create video node for subdevs other then subdev0
-	 */
-	if (asd->index)
-		return 0;
-
-	asd->video_in.vdev.v4l2_dev = vdev;
-	asd->video_in.vdev.device_caps = V4L2_CAP_VIDEO_OUT | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_in.vdev,
-				    VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
-
 	return 0;
 
 error:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 798a93793a9a..938d427bede8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -297,7 +297,6 @@ struct atomisp_sub_device {
 
 	enum atomisp_subdev_input_entity input;
 	unsigned int output;
-	struct atomisp_video_pipe video_in;
 	struct atomisp_video_pipe video_out_capture; /* capture output */
 	struct atomisp_video_pipe video_out_vf;      /* viewfinder output */
 	struct atomisp_video_pipe video_out_preview; /* preview output */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 643ba981601b..5488a02200ed 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -34,7 +34,6 @@
 #include "atomisp_cmd.h"
 #include "atomisp_common.h"
 #include "atomisp_fops.h"
-#include "atomisp_file.h"
 #include "atomisp_ioctl.h"
 #include "atomisp_internal.h"
 #include "atomisp-regs.h"
@@ -1158,7 +1157,6 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 	for (i = 0; i < isp->num_of_streams; i++)
 		atomisp_subdev_unregister_entities(&isp->asd[i]);
 	atomisp_tpg_unregister_entities(&isp->tpg);
-	atomisp_file_input_unregister_entities(&isp->file_dev);
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 
@@ -1210,13 +1208,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		goto csi_and_subdev_probe_failed;
 	}
 
-	ret =
-	    atomisp_file_input_register_entities(&isp->file_dev, &isp->v4l2_dev);
-	if (ret < 0) {
-		dev_err(isp->dev, "atomisp_file_input_register_entities\n");
-		goto file_input_register_failed;
-	}
-
 	ret = atomisp_tpg_register_entities(&isp->tpg, &isp->v4l2_dev);
 	if (ret < 0) {
 		dev_err(isp->dev, "atomisp_tpg_register_entities\n");
@@ -1267,14 +1258,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		}
 	}
 
-	dev_dbg(isp->dev,
-		"FILE_INPUT enable, camera_cnt: %d\n", isp->input_cnt);
-	isp->inputs[isp->input_cnt].type = FILE_INPUT;
-	isp->inputs[isp->input_cnt].port = -1;
-	isp->inputs[isp->input_cnt].camera_caps =
-	    atomisp_get_default_camera_caps();
-	isp->inputs[isp->input_cnt++].camera = &isp->file_dev.sd;
-
 	if (isp->input_cnt < ATOM_ISP_MAX_INPUTS) {
 		dev_dbg(isp->dev,
 			"TPG detected, camera_cnt: %d\n", isp->input_cnt);
@@ -1304,8 +1287,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 subdev_register_failed:
 	atomisp_tpg_unregister_entities(&isp->tpg);
 tpg_register_failed:
-	atomisp_file_input_unregister_entities(&isp->file_dev);
-file_input_register_failed:
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 csi_and_subdev_probe_failed:
@@ -1326,13 +1307,6 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 		goto error_mipi_csi2;
 	}
 
-	ret = atomisp_file_input_init(isp);
-	if (ret < 0) {
-		dev_err(isp->dev,
-			"file input device initialization failed\n");
-		goto error_file_input;
-	}
-
 	ret = atomisp_tpg_init(isp);
 	if (ret < 0) {
 		dev_err(isp->dev, "tpg initialization failed\n");
@@ -1350,8 +1324,6 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 error_isp_subdev:
 error_tpg:
 	atomisp_tpg_cleanup(isp);
-error_file_input:
-	atomisp_file_input_cleanup(isp);
 error_mipi_csi2:
 	atomisp_mipi_csi2_cleanup(isp);
 	return ret;
@@ -1360,7 +1332,6 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 static void atomisp_uninitialize_modules(struct atomisp_device *isp)
 {
 	atomisp_tpg_cleanup(isp);
-	atomisp_file_input_cleanup(isp);
 	atomisp_mipi_csi2_cleanup(isp);
 }
 
@@ -1852,7 +1823,6 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 	atomisp_unregister_entities(isp);
 
 	destroy_workqueue(isp->wdt_work_queue);
-	atomisp_file_input_cleanup(isp);
 
 	release_firmware(isp->firmware);
 }
-- 
2.37.2

