Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55090549FC6
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 22:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241391AbiFMUpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 16:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242051AbiFMUob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 16:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8BA539FD8
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 12:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655149935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P7zo0tChuVtnSsJpLUn5XBAfQXRPtNGZLjGjs+pgIMQ=;
        b=W8vG6VEXYhkmbTpqrKa/W/FB7hxGJpkg1YtESd4VWGDi+9D48ar4QeehSdBr9kIqYW787Q
        wzI4ZYA8+b918R6tXBMMP6ANLfK5SgOuKHryPaYHPViANuLsYYDSEFH8LeiTNe++tbiYlt
        iwoP5lr9OnWTfnhzkhhVXsSkeIIY6wE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-mA402BZjNlW8KPh0Bf2Sqg-1; Mon, 13 Jun 2022 15:52:14 -0400
X-MC-Unique: mA402BZjNlW8KPh0Bf2Sqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA32D29AB44B;
        Mon, 13 Jun 2022 19:52:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3BBE82166B26;
        Mon, 13 Jun 2022 19:52:12 +0000 (UTC)
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
Subject: [PATCH 19/40] media: atomisp: remove atomisp_acc.c
Date:   Mon, 13 Jun 2022 21:51:16 +0200
Message-Id: <20220613195137.8117-20-hdegoede@redhat.com>
In-Reply-To: <20220613195137.8117-1-hdegoede@redhat.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the ACC ioctls removed sd->acc.fw is always empty turning
the atomisp_acc.c code into no-ops, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/Makefile        |   1 -
 .../staging/media/atomisp/pci/atomisp_acc.c   | 231 ------------------
 .../staging/media/atomisp/pci/atomisp_acc.h   |  62 -----
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  26 --
 .../media/atomisp/pci/atomisp_compat_css20.c  |   8 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |   4 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   9 +-
 .../media/atomisp/pci/atomisp_subdev.c        |   3 -
 .../media/atomisp/pci/atomisp_subdev.h        |   4 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   4 -
 10 files changed, 5 insertions(+), 347 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.h

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index dd4c2c0317ae..fb7b406f50bf 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -13,7 +13,6 @@ atomisp = $(srctree)/drivers/staging/media/atomisp/
 
 # SPDX-License-Identifier: GPL-2.0
 atomisp-objs += \
-	pci/atomisp_acc.o \
 	pci/atomisp_cmd.o \
 	pci/atomisp_compat_css20.o \
 	pci/atomisp_csi2.o \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp_acc.c
deleted file mode 100644
index 07693983dd52..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.c
+++ /dev/null
@@ -1,231 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for Clovertrail PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2012 Intel Corporation. All Rights Reserved.
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
-/*
- * This file implements loadable acceleration firmware API,
- * including ioctls to map and unmap acceleration parameters and buffers.
- */
-
-#include <linux/init.h>
-#include <media/v4l2-event.h>
-
-#include "hmm.h"
-
-#include "atomisp_acc.h"
-#include "atomisp_internal.h"
-#include "atomisp_compat.h"
-#include "atomisp_cmd.h"
-
-#include "ia_css.h"
-
-static const struct {
-	unsigned int flag;
-	enum ia_css_pipe_id pipe_id;
-} acc_flag_to_pipe[] = {
-	{ ATOMISP_ACC_FW_LOAD_FL_PREVIEW, IA_CSS_PIPE_ID_PREVIEW },
-	{ ATOMISP_ACC_FW_LOAD_FL_COPY, IA_CSS_PIPE_ID_COPY },
-	{ ATOMISP_ACC_FW_LOAD_FL_VIDEO, IA_CSS_PIPE_ID_VIDEO },
-	{ ATOMISP_ACC_FW_LOAD_FL_CAPTURE, IA_CSS_PIPE_ID_CAPTURE },
-	{ ATOMISP_ACC_FW_LOAD_FL_ACC, IA_CSS_PIPE_ID_ACC }
-};
-
-static void acc_free_fw(struct atomisp_acc_fw *acc_fw)
-{
-	vfree(acc_fw->fw);
-	kfree(acc_fw);
-}
-
-static int acc_stop_acceleration(struct atomisp_sub_device *asd)
-{
-	int ret;
-
-	ret = atomisp_css_stop_acc_pipe(asd);
-	atomisp_css_destroy_acc_pipe(asd);
-
-	return ret;
-}
-
-void atomisp_acc_cleanup(struct atomisp_device *isp)
-{
-	int i;
-
-	for (i = 0; i < isp->num_of_streams; i++)
-		ida_destroy(&isp->asd[i].acc.ida);
-}
-
-void atomisp_acc_release(struct atomisp_sub_device *asd)
-{
-	struct atomisp_acc_fw *acc_fw, *ta;
-	struct atomisp_map *atomisp_map, *tm;
-
-	/* Stop acceleration if already running */
-	if (asd->acc.pipeline)
-		acc_stop_acceleration(asd);
-
-	/* Unload all loaded acceleration binaries */
-	list_for_each_entry_safe(acc_fw, ta, &asd->acc.fw, list) {
-		list_del(&acc_fw->list);
-		ida_free(&asd->acc.ida, acc_fw->handle);
-		acc_free_fw(acc_fw);
-	}
-
-	/* Free all mapped memory blocks */
-	list_for_each_entry_safe(atomisp_map, tm, &asd->acc.memory_maps, list) {
-		list_del(&atomisp_map->list);
-		hmm_free(atomisp_map->ptr);
-		kfree(atomisp_map);
-	}
-}
-
-void atomisp_acc_done(struct atomisp_sub_device *asd, unsigned int handle)
-{
-	struct v4l2_event event = { 0 };
-
-	event.type = V4L2_EVENT_ATOMISP_ACC_COMPLETE;
-	event.u.frame_sync.frame_sequence = atomic_read(&asd->sequence);
-	event.id = handle;
-
-	v4l2_event_queue(asd->subdev.devnode, &event);
-}
-
-static void atomisp_acc_unload_some_extensions(struct atomisp_sub_device *asd,
-					      int i,
-					      struct atomisp_acc_fw *acc_fw)
-{
-	while (--i >= 0) {
-		if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
-			atomisp_css_unload_acc_extension(asd, acc_fw->fw,
-							 acc_flag_to_pipe[i].pipe_id);
-		}
-	}
-}
-
-/*
- * Appends the loaded acceleration binary extensions to the
- * current ISP mode. Must be called just before sh_css_start().
- */
-int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
-{
-	struct atomisp_acc_fw *acc_fw;
-	bool ext_loaded = false;
-	bool continuous = asd->continuous_mode->val &&
-			  asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW;
-	int ret = 0, i = -1;
-	struct atomisp_device *isp = asd->isp;
-
-	if (asd->acc.pipeline || asd->acc.extension_mode)
-		return -EBUSY;
-
-	/* Invalidate caches. FIXME: should flush only necessary buffers */
-	wbinvd();
-
-	list_for_each_entry(acc_fw, &asd->acc.fw, list) {
-		if (acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT &&
-		    acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER)
-			continue;
-
-		for (i = 0; i < ARRAY_SIZE(acc_flag_to_pipe); i++) {
-			/*
-			 * QoS (ACC pipe) acceleration stages are
-			 * currently allowed only in continuous mode.
-			 * Skip them for all other modes.
-			 */
-			if (!continuous &&
-			    acc_flag_to_pipe[i].flag ==
-			    ATOMISP_ACC_FW_LOAD_FL_ACC)
-				continue;
-
-			if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
-				ret = atomisp_css_load_acc_extension(asd,
-								     acc_fw->fw,
-								     acc_flag_to_pipe[i].pipe_id,
-								     acc_fw->type);
-				if (ret) {
-					atomisp_acc_unload_some_extensions(asd, i, acc_fw);
-					goto error;
-				}
-
-				ext_loaded = true;
-			}
-		}
-
-		ret = atomisp_css_set_acc_parameters(acc_fw);
-		if (ret < 0) {
-			atomisp_acc_unload_some_extensions(asd, i, acc_fw);
-			goto error;
-		}
-	}
-
-	if (!ext_loaded)
-		return ret;
-
-	ret = atomisp_css_update_stream(asd);
-	if (ret) {
-		dev_err(isp->dev, "%s: update stream failed.\n", __func__);
-		atomisp_acc_unload_extensions(asd);
-		goto error;
-	}
-
-	asd->acc.extension_mode = true;
-	return 0;
-
-error:
-	list_for_each_entry_continue_reverse(acc_fw, &asd->acc.fw, list) {
-		if (acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT &&
-		    acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER)
-			continue;
-
-		for (i = ARRAY_SIZE(acc_flag_to_pipe) - 1; i >= 0; i--) {
-			if (!continuous &&
-			    acc_flag_to_pipe[i].flag ==
-			    ATOMISP_ACC_FW_LOAD_FL_ACC)
-				continue;
-			if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
-				atomisp_css_unload_acc_extension(asd,
-								 acc_fw->fw,
-								 acc_flag_to_pipe[i].pipe_id);
-			}
-		}
-	}
-	return ret;
-}
-
-void atomisp_acc_unload_extensions(struct atomisp_sub_device *asd)
-{
-	struct atomisp_acc_fw *acc_fw;
-	int i;
-
-	if (!asd->acc.extension_mode)
-		return;
-
-	list_for_each_entry_reverse(acc_fw, &asd->acc.fw, list) {
-		if (acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT &&
-		    acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER)
-			continue;
-
-		for (i = ARRAY_SIZE(acc_flag_to_pipe) - 1; i >= 0; i--) {
-			if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
-				atomisp_css_unload_acc_extension(asd,
-								 acc_fw->fw,
-								 acc_flag_to_pipe[i].pipe_id);
-			}
-		}
-	}
-
-	asd->acc.extension_mode = false;
-}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_acc.h b/drivers/staging/media/atomisp/pci/atomisp_acc.h
deleted file mode 100644
index e0d15dd96829..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp_acc.h
+++ /dev/null
@@ -1,62 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Clovertrail PNW Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2012 Intel Corporation. All Rights Reserved.
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
-#ifndef __ATOMISP_ACC_H__
-#define __ATOMISP_ACC_H__
-
-#include "../../include/linux/atomisp.h"
-#include "atomisp_internal.h"
-
-#include "ia_css_types.h"
-
-/*
- * Interface functions for AtomISP driver acceleration API implementation.
- */
-
-struct atomisp_sub_device;
-
-void atomisp_acc_cleanup(struct atomisp_device *isp);
-
-/*
- * Free up any allocated resources.
- * Must be called each time when the device is closed.
- * Note that there isn't corresponding open() call;
- * this function may be called sequentially multiple times.
- * Must be called to free up resources before driver is unloaded.
- */
-void atomisp_acc_release(struct atomisp_sub_device *asd);
-
-/*
- * Used by ISR to notify ACC stage finished.
- * This is internally used and does not export as IOCTL.
- */
-void atomisp_acc_done(struct atomisp_sub_device *asd, unsigned int handle);
-
-/*
- * Appends the loaded acceleration binary extensions to the
- * current ISP mode. Must be called just before atomisp_css_start().
- */
-int atomisp_acc_load_extensions(struct atomisp_sub_device *asd);
-
-/*
- * Must be called after streaming is stopped:
- * unloads any loaded acceleration extensions.
- */
-void atomisp_acc_unload_extensions(struct atomisp_sub_device *asd);
-
-#endif /* __ATOMISP_ACC_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 97d5a528969b..18f063393433 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -42,7 +42,6 @@
 #include "atomisp_ioctl.h"
 #include "atomisp-regs.h"
 #include "atomisp_tables.h"
-#include "atomisp_acc.h"
 #include "atomisp_compat.h"
 #include "atomisp_subdev.h"
 #include "atomisp_dfs_tables.h"
@@ -1302,34 +1301,11 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 
 	for (i = 0; i < isp->num_of_streams; i++) {
 		struct atomisp_sub_device *asd = &isp->asd[i];
-		struct ia_css_pipeline *acc_pipeline;
-		struct ia_css_pipe *acc_pipe = NULL;
 
 		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED &&
 		    !asd->stream_prepared)
 			continue;
 
-		/*
-		* AtomISP::waitStageUpdate is blocked when WDT happens.
-		* By calling acc_done() for all loaded fw_handles,
-		* HAL will be unblocked.
-		*/
-		acc_pipe = asd->stream_env[i].pipes[IA_CSS_PIPE_ID_ACC];
-		if (acc_pipe) {
-			acc_pipeline = ia_css_pipe_get_pipeline(acc_pipe);
-			if (acc_pipeline) {
-				struct ia_css_pipeline_stage *stage;
-
-				for (stage = acc_pipeline->stages; stage;
-				     stage = stage->next) {
-					const struct ia_css_fw_info *fw;
-
-					fw = stage->firmware;
-					atomisp_acc_done(asd, fw->handle);
-				}
-			}
-		}
-
 		depth_cnt++;
 
 		if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED)
@@ -1350,8 +1326,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 			dev_warn(isp->dev,
 				 "can't stop streaming on sensor!\n");
 
-		atomisp_acc_unload_extensions(asd);
-
 		atomisp_clear_css_buffer_counters(asd);
 
 		css_pipe_id = atomisp_get_css_pipe_id(asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 781a11cca599..89002df530b3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -31,7 +31,6 @@
 #include "atomisp-regs.h"
 #include "atomisp_fops.h"
 #include "atomisp_ioctl.h"
-#include "atomisp_acc.h"
 
 #include "ia_css_debug.h"
 #include "ia_css_isp_param.h"
@@ -1118,8 +1117,8 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 			ret = -EINVAL;
 			goto stream_err;
 		}
-		/* in_reset == true, extension firmwares are reloaded after the recovery */
-		atomisp_acc_load_extensions(asd);
+		/* Invalidate caches. FIXME: should flush only necessary buffers */
+		wbinvd();
 	}
 
 	/*
@@ -4211,8 +4210,7 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
 			css_pipe_done[asd->index] = true;
 			break;
 		case IA_CSS_EVENT_TYPE_ACC_STAGE_COMPLETE:
-			dev_dbg(isp->dev, "event: acc stage done");
-			atomisp_acc_done(asd, current_event.event.fw_handle);
+			dev_warn(isp->dev, "unexpected event: acc stage done");
 			break;
 		default:
 			dev_dbg(isp->dev, "unhandled css stored event: 0x%x\n",
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index e78d9364feb7..77150e4ae144 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -38,8 +38,6 @@
 #include "type_support.h"
 #include "device_access/device_access.h"
 
-#include "atomisp_acc.h"
-
 #define ISP_LEFT_PAD			128	/* equal to 2*NWAY */
 
 /*
@@ -1014,8 +1012,6 @@ static int atomisp_release(struct file *file)
 	if (atomisp_dev_users(isp))
 		goto done;
 
-	atomisp_acc_release(asd);
-
 	atomisp_destroy_pipes_stream_force(asd);
 	atomisp_css_uninit(isp);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index ea38f05b3233..69deeb55613f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -25,7 +25,6 @@
 #include <media/v4l2-event.h>
 #include <media/videobuf-vmalloc.h>
 
-#include "atomisp_acc.h"
 #include "atomisp_cmd.h"
 #include "atomisp_common.h"
 #include "atomisp_fops.h"
@@ -1913,11 +1912,8 @@ static int atomisp_streamon(struct file *file, void *fh,
 
 	css_pipe_id = atomisp_get_css_pipe_id(asd);
 
-	ret = atomisp_acc_load_extensions(asd);
-	if (ret < 0) {
-		dev_err(isp->dev, "acc extension failed to load\n");
-		goto out;
-	}
+	/* Invalidate caches. FIXME: should flush only necessary buffers */
+	wbinvd();
 
 	if (asd->params.css_update_params_needed) {
 		atomisp_apply_css_parameters(asd, &asd->params.css_param);
@@ -2154,7 +2150,6 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 					 video, s_stream, 0);
 
 		rt_mutex_lock(&isp->mutex);
-		atomisp_acc_unload_extensions(asd);
 	}
 
 	spin_lock_irqsave(&isp->lock, flags);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 1807cfa786a7..394fe6959033 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1081,9 +1081,6 @@ static void atomisp_init_acc_pipe(struct atomisp_sub_device *asd,
 {
 	pipe->asd = asd;
 	pipe->isp = asd->isp;
-	INIT_LIST_HEAD(&asd->acc.fw);
-	INIT_LIST_HEAD(&asd->acc.memory_maps);
-	ida_init(&asd->acc.ida);
 }
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 7d731f1fee72..c2f3ea2c5076 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -323,11 +323,7 @@ struct atomisp_sub_device {
 	struct v4l2_ctrl *disable_dz;
 
 	struct {
-		struct list_head fw;
-		struct list_head memory_maps;
 		struct ia_css_pipe *pipeline;
-		bool extension_mode;
-		struct ida ida;
 		struct completion acc_done;
 		void *acc_stages;
 	} acc;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 88d8dd6ff0c4..643ba981601b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -37,7 +37,6 @@
 #include "atomisp_file.h"
 #include "atomisp_ioctl.h"
 #include "atomisp_internal.h"
-#include "atomisp_acc.h"
 #include "atomisp-regs.h"
 #include "atomisp_dfs_tables.h"
 #include "atomisp_drvfs.h"
@@ -1792,7 +1791,6 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	pm_runtime_get_noresume(&pdev->dev);
 	destroy_workqueue(isp->wdt_work_queue);
 wdt_work_queue_fail:
-	atomisp_acc_cleanup(isp);
 	atomisp_unregister_entities(isp);
 register_entities_fail:
 	atomisp_uninitialize_modules(isp);
@@ -1843,8 +1841,6 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 
 	atomisp_drvfs_exit();
 
-	atomisp_acc_cleanup(isp);
-
 	ia_css_unload_firmware();
 	hmm_cleanup();
 
-- 
2.36.0

