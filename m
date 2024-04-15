Return-Path: <linux-media+bounces-9361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 549878A4E5F
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 781C51C20D9E
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992BE6CDC0;
	Mon, 15 Apr 2024 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhPA9a7P"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57A6BFCF
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182579; cv=none; b=GBL/yIaaW1HeppwVtHXB01uYmYOl7+ZNpUdB0RoSf8ILDvmUuPNvcOBX05HTAS5xf19kjyUNzULrWpfDsW8ILOAc9Q7Yld3bmK8uW+MEXIxkqTIO/BAuCwaTaNFUZhQ5kwleRha3QNksP5xMzkLryOp5NflZ29RFcT2my1KJJI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182579; c=relaxed/simple;
	bh=ZmjCRhY0WWeoN4gXyHQRVvraqfld4aAO0Eqn20tvJ+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYScHPxVAhdQuX+m5SbnvE6lHanyrGvY90jGPmtDIlKeN5yM6FiwdYE8QEIbL+fyc4h3jW7oKkOxKwhD6vDXx1L0eEbKeHno+44ldx7je5FtSmcgYYDVCTZcCCkMGOPLcqDiM/GiVJvC55nMc84+OhUXt36bRemz/C2KqdXV/Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhPA9a7P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lgRDzoUyaZiE+36QlQkX2xaH6dDkt4MbFBOVs7lYKI=;
	b=hhPA9a7PftU9D4phTT5SZMpHWrLOi1iEVlyPi2rPwsbpKbssH8TVb8/iA/vCxwyNulZyEt
	4aU+rrhfjb5ZTTnKLo4Y38q57N5rm2M3zffulvHCLGoL0DOL0HtRMOgmg/b2PISBMbaxg5
	zPZNyCvSYmFP3o/FRpnugs+v3CphUfU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-6QbQ-ZbuNJmXw_tDon2UJw-1; Mon, 15 Apr 2024 08:02:50 -0400
X-MC-Unique: 6QbQ-ZbuNJmXw_tDon2UJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 294431049BC7;
	Mon, 15 Apr 2024 12:02:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA438C01595;
	Mon, 15 Apr 2024 12:02:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 11/23] media: atomisp: Remove test pattern generator (TPG) support
Date: Mon, 15 Apr 2024 14:02:08 +0200
Message-ID: <20240415120220.219480-12-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

The TPG support registers a v4l2-subdev for this, but this is not part of
the media-controller graph in any way. After manually selecting the TPG
as input using the s_input ioctl it does not work.

Several supported sensors have their own working TPG and using the sensor's
TPG means that the same data-flow is used as with actual sensors rather
then the quite different data-flow from the ISP's builtin TPG.

Remove the broken TPG support, when a test-pattern is needed for testing
a sensor's TPG can be used. Using a sensor's TPG is actually better for
testing since then the actual normal data-flow is being tested.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/Makefile        |   1 -
 .../atomisp/include/linux/atomisp_platform.h  |   1 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  36 ++--
 .../media/atomisp/pci/atomisp_compat_css20.c  |  31 +---
 .../media/atomisp/pci/atomisp_internal.h      |   2 -
 .../staging/media/atomisp/pci/atomisp_tpg.c   | 164 ------------------
 .../staging/media/atomisp/pci/atomisp_tpg.h   |  39 -----
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  27 ---
 .../hive_isp_css_common/host/input_system.c   |  38 ----
 drivers/staging/media/atomisp/pci/ia_css.h    |   1 -
 .../media/atomisp/pci/ia_css_stream_public.h  |   3 -
 .../staging/media/atomisp/pci/ia_css_tpg.h    |  79 ---------
 .../atomisp/pci/isp2400_input_system_global.h |   1 -
 .../atomisp/pci/isp2400_input_system_public.h |  15 --
 .../atomisp/pci/isp2401_input_system_global.h |   1 -
 .../pci/runtime/debug/src/ia_css_debug.c      |  17 --
 .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |  11 --
 .../pci/runtime/isys/src/virtual_isys.c       |  28 +--
 drivers/staging/media/atomisp/pci/sh_css.c    |  88 +---------
 .../media/atomisp/pci/sh_css_internal.h       |   1 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  14 --
 drivers/staging/media/atomisp/pci/sh_css_sp.h |   7 -
 22 files changed, 20 insertions(+), 585 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_tpg.h
 delete mode 100644 drivers/staging/media/atomisp/pci/ia_css_tpg.h

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index fcd3e51ae9ce..43116c74781d 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -21,7 +21,6 @@ atomisp-objs += \
 	pci/atomisp_fops.o \
 	pci/atomisp_ioctl.o \
 	pci/atomisp_subdev.o \
-	pci/atomisp_tpg.o \
 	pci/atomisp_v4l2.o \
 	pci/sh_css_firmware.o \
 	pci/sh_css_host_data.o \
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 2535402afd73..63dd7236e3a8 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -112,7 +112,6 @@ enum atomisp_input_format {
 enum intel_v4l2_subdev_type {
 	RAW_CAMERA = 1,
 	LED_FLASH = 2,
-	TEST_PATTERN = 3,
 };
 
 struct intel_v4l2_subdev_id {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index ecd521043021..4505261a563f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4143,28 +4143,26 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	if (!format)
 		return -EINVAL;
 
-	if (input->type != TEST_PATTERN) {
-		mipi_info = atomisp_to_sensor_mipi_info(input->camera);
+	mipi_info = atomisp_to_sensor_mipi_info(input->camera);
 
-		if (atomisp_set_sensor_mipi_to_isp(asd, ATOMISP_INPUT_STREAM_GENERAL,
-						   mipi_info))
-			return -EINVAL;
+	if (atomisp_set_sensor_mipi_to_isp(asd, ATOMISP_INPUT_STREAM_GENERAL,
+					   mipi_info))
+		return -EINVAL;
 
-		if (mipi_info)
-			fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(mipi_info->input_format);
+	if (mipi_info)
+		fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(mipi_info->input_format);
 
-		if (!fc)
-			fc = atomisp_find_in_fmt_conv(
-				 atomisp_subdev_get_ffmt(&asd->subdev,
-							 NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
-							 ATOMISP_SUBDEV_PAD_SINK)->code);
-		if (!fc)
-			return -EINVAL;
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
-		    raw_output_format_match_input(fc->atomisp_in_fmt,
-						  pix->pixelformat))
-			return -EINVAL;
-	}
+	if (!fc)
+		fc = atomisp_find_in_fmt_conv(
+			 atomisp_subdev_get_ffmt(&asd->subdev,
+						 NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
+						 ATOMISP_SUBDEV_PAD_SINK)->code);
+	if (!fc)
+		return -EINVAL;
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    raw_output_format_match_input(fc->atomisp_in_fmt,
+					  pix->pixelformat))
+		return -EINVAL;
 
 	/*
 	 * Configure viewfinder also when vfpp is disabled: the
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 6fe8b0b7467a..a62a5c0b3c00 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -302,21 +302,6 @@ static void __dump_stream_config(struct atomisp_sub_device *asd,
 			"stream_config.source.port.compression.uncompressed_bits_per_pixel=%d.\n",
 			s_config->source.port.compression.
 			uncompressed_bits_per_pixel);
-	} else if (s_config->mode == IA_CSS_INPUT_MODE_TPG) {
-		dev_dbg(isp->dev, "stream_config.source.tpg.id=%d.\n",
-			s_config->source.tpg.id);
-		dev_dbg(isp->dev, "stream_config.source.tpg.mode=%d.\n",
-			s_config->source.tpg.mode);
-		dev_dbg(isp->dev, "stream_config.source.tpg.x_mask=%d.\n",
-			s_config->source.tpg.x_mask);
-		dev_dbg(isp->dev, "stream_config.source.tpg.x_delta=%d.\n",
-			s_config->source.tpg.x_delta);
-		dev_dbg(isp->dev, "stream_config.source.tpg.y_mask=%d.\n",
-			s_config->source.tpg.y_mask);
-		dev_dbg(isp->dev, "stream_config.source.tpg.y_delta=%d.\n",
-			s_config->source.tpg.y_delta);
-		dev_dbg(isp->dev, "stream_config.source.tpg.xy_mask=%d.\n",
-			s_config->source.tpg.xy_mask);
 	} else if (s_config->mode == IA_CSS_INPUT_MODE_PRBS) {
 		dev_dbg(isp->dev, "stream_config.source.prbs.id=%d.\n",
 			s_config->source.prbs.id);
@@ -1672,26 +1657,12 @@ void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
 void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 				enum ia_css_input_mode mode)
 {
-	int i;
-	struct atomisp_device *isp = asd->isp;
 	unsigned int size_mem_words;
+	int i;
 
 	for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++)
 		asd->stream_env[i].stream_config.mode = mode;
 
-	if (isp->inputs[asd->input_curr].type == TEST_PATTERN) {
-		struct ia_css_stream_config *s_config =
-			    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_config;
-		s_config->mode = IA_CSS_INPUT_MODE_TPG;
-		s_config->source.tpg.mode = IA_CSS_TPG_MODE_CHECKERBOARD;
-		s_config->source.tpg.x_mask = (1 << 4) - 1;
-		s_config->source.tpg.x_delta = -2;
-		s_config->source.tpg.y_mask = (1 << 4) - 1;
-		s_config->source.tpg.y_delta = 3;
-		s_config->source.tpg.xy_mask = (1 << 8) - 1;
-		return;
-	}
-
 	if (mode != IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
 		return;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index c81a1c5f2864..54ab872b91ee 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -36,7 +36,6 @@
 
 #include "atomisp_csi2.h"
 #include "atomisp_subdev.h"
-#include "atomisp_tpg.h"
 #include "atomisp_compat.h"
 
 #include "gp_device.h"
@@ -188,7 +187,6 @@ struct atomisp_device {
 	bool pm_only;
 
 	struct atomisp_mipi_csi2_device csi2_port[ATOMISP_CAMERA_NR_PORTS];
-	struct atomisp_tpg_device tpg;
 
 	/* Purpose of mutex is to protect and serialize use of isp data
 	 * structures and css API calls. */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_tpg.c b/drivers/staging/media/atomisp/pci/atomisp_tpg.c
deleted file mode 100644
index 92e61ee90993..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp_tpg.c
+++ /dev/null
@@ -1,164 +0,0 @@
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
-#include "atomisp_internal.h"
-#include "atomisp_tpg.h"
-
-static int tpg_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	return 0;
-}
-
-static int tpg_get_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_state *sd_state,
-		       struct v4l2_subdev_format *format)
-{
-	/*to fake*/
-	return 0;
-}
-
-static int tpg_set_fmt(struct v4l2_subdev *sd,
-		       struct v4l2_subdev_state *sd_state,
-		       struct v4l2_subdev_format *format)
-{
-	struct v4l2_mbus_framefmt *fmt = &format->format;
-
-	if (format->pad)
-		return -EINVAL;
-	/* only raw8 grbg is supported by TPG */
-	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_state_get_format(sd_state, 0) = *fmt;
-		return 0;
-	}
-	return 0;
-}
-
-static int tpg_log_status(struct v4l2_subdev *sd)
-{
-	/*to fake*/
-	return 0;
-}
-
-static int tpg_s_power(struct v4l2_subdev *sd, int on)
-{
-	return 0;
-}
-
-static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_mbus_code_enum *code)
-{
-	/*to fake*/
-	return 0;
-}
-
-static int tpg_enum_frame_size(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_frame_size_enum *fse)
-{
-	/*to fake*/
-	return 0;
-}
-
-static int tpg_enum_frame_ival(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state,
-			       struct v4l2_subdev_frame_interval_enum *fie)
-{
-	/*to fake*/
-	return 0;
-}
-
-static const struct v4l2_subdev_video_ops tpg_video_ops = {
-	.s_stream = tpg_s_stream,
-};
-
-static const struct v4l2_subdev_core_ops tpg_core_ops = {
-	.log_status = tpg_log_status,
-	.s_power = tpg_s_power,
-};
-
-static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
-	.enum_mbus_code = tpg_enum_mbus_code,
-	.enum_frame_size = tpg_enum_frame_size,
-	.enum_frame_interval = tpg_enum_frame_ival,
-	.get_fmt = tpg_get_fmt,
-	.set_fmt = tpg_set_fmt,
-};
-
-static const struct v4l2_subdev_ops tpg_ops = {
-	.core = &tpg_core_ops,
-	.video = &tpg_video_ops,
-	.pad = &tpg_pad_ops,
-};
-
-void atomisp_tpg_unregister_entities(struct atomisp_tpg_device *tpg)
-{
-	media_entity_cleanup(&tpg->sd.entity);
-	v4l2_device_unregister_subdev(&tpg->sd);
-}
-
-int atomisp_tpg_register_entities(struct atomisp_tpg_device *tpg,
-				  struct v4l2_device *vdev)
-{
-	int ret;
-	/* Register the subdev and video nodes. */
-	ret = v4l2_device_register_subdev(vdev, &tpg->sd);
-	if (ret < 0)
-		goto error;
-
-	return 0;
-
-error:
-	atomisp_tpg_unregister_entities(tpg);
-	return ret;
-}
-
-void atomisp_tpg_cleanup(struct atomisp_device *isp)
-{
-}
-
-int atomisp_tpg_init(struct atomisp_device *isp)
-{
-	struct atomisp_tpg_device *tpg = &isp->tpg;
-	struct v4l2_subdev *sd = &tpg->sd;
-	struct media_pad *pads = tpg->pads;
-	struct media_entity *me = &sd->entity;
-	int ret;
-
-	tpg->isp = isp;
-	v4l2_subdev_init(sd, &tpg_ops);
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strscpy(sd->name, "tpg_subdev", sizeof(sd->name));
-	v4l2_set_subdevdata(sd, tpg);
-
-	pads[0].flags = MEDIA_PAD_FL_SINK;
-	me->function = MEDIA_ENT_F_PROC_VIDEO_ISP;
-
-	ret = media_entity_pads_init(me, 1, pads);
-	if (ret < 0)
-		goto fail;
-	return 0;
-fail:
-	atomisp_tpg_cleanup(isp);
-	return ret;
-}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_tpg.h b/drivers/staging/media/atomisp/pci/atomisp_tpg.h
deleted file mode 100644
index 4176e076f63d..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp_tpg.h
+++ /dev/null
@@ -1,39 +0,0 @@
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
-#ifndef __ATOMISP_TPG_H__
-#define __ATOMISP_TPG_H__
-
-#include <media/media-entity.h>
-#include <media/v4l2-subdev.h>
-
-struct atomisp_tpg_device {
-	struct v4l2_subdev sd;
-	struct atomisp_device *isp;
-	struct media_pad pads[1];
-};
-
-void atomisp_tpg_cleanup(struct atomisp_device *isp);
-int atomisp_tpg_init(struct atomisp_device *isp);
-void atomisp_tpg_unregister_entities(struct atomisp_tpg_device *tpg);
-int atomisp_tpg_register_entities(struct atomisp_tpg_device *tpg,
-				  struct v4l2_device *vdev);
-
-#endif /* __ATOMISP_TPG_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 809b9c4e7a92..0069b547754d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -847,7 +847,6 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 	struct v4l2_subdev *sd, *next;
 
 	atomisp_subdev_unregister_entities(&isp->asd);
-	atomisp_tpg_unregister_entities(&isp->tpg);
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 
@@ -902,12 +901,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		goto csi_and_subdev_probe_failed;
 	}
 
-	ret = atomisp_tpg_register_entities(&isp->tpg, &isp->v4l2_dev);
-	if (ret < 0) {
-		dev_err(isp->dev, "atomisp_tpg_register_entities\n");
-		goto tpg_register_failed;
-	}
-
 	ret = atomisp_subdev_register_subdev(&isp->asd, &isp->v4l2_dev);
 	if (ret < 0) {
 		dev_err(isp->dev, "atomisp_subdev_register_subdev fail\n");
@@ -917,8 +910,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	return 0;
 
 subdev_register_failed:
-	atomisp_tpg_unregister_entities(&isp->tpg);
-tpg_register_failed:
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 csi_and_subdev_probe_failed:
@@ -1077,15 +1068,6 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 	else
 		dev_info(isp->dev, "detected %d camera sensors\n", isp->input_cnt);
 
-	if (isp->input_cnt < ATOM_ISP_MAX_INPUTS) {
-		dev_dbg(isp->dev, "TPG detected, camera_cnt: %d\n", isp->input_cnt);
-		isp->inputs[isp->input_cnt].type = TEST_PATTERN;
-		isp->inputs[isp->input_cnt].port = -1;
-		isp->inputs[isp->input_cnt++].camera = &isp->tpg.sd;
-	} else {
-		dev_warn(isp->dev, "too many atomisp inputs, TPG ignored.\n");
-	}
-
 	mutex_lock(&isp->media_dev.graph_mutex);
 	atomisp_setup_input_links(isp);
 	mutex_unlock(&isp->media_dev.graph_mutex);
@@ -1119,12 +1101,6 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 		goto error_mipi_csi2;
 	}
 
-	ret = atomisp_tpg_init(isp);
-	if (ret < 0) {
-		dev_err(isp->dev, "tpg initialization failed\n");
-		goto error_tpg;
-	}
-
 	ret = atomisp_subdev_init(isp);
 	if (ret < 0) {
 		dev_err(isp->dev, "ISP subdev initialization failed\n");
@@ -1134,8 +1110,6 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 	return 0;
 
 error_isp_subdev:
-error_tpg:
-	atomisp_tpg_cleanup(isp);
 error_mipi_csi2:
 	atomisp_mipi_csi2_cleanup(isp);
 	return ret;
@@ -1143,7 +1117,6 @@ static int atomisp_initialize_modules(struct atomisp_device *isp)
 
 static void atomisp_uninitialize_modules(struct atomisp_device *isp)
 {
-	atomisp_tpg_cleanup(isp);
 	atomisp_mipi_csi2_cleanup(isp);
 }
 
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index ca1ce6689034..8f2f4e8eddd9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -426,7 +426,6 @@ static input_system_err_t input_system_configure_channel(
 		case INPUT_SYSTEM_SOURCE_SENSOR:
 			error = input_system_configure_channel_sensor(channel);
 			break;
-		case INPUT_SYSTEM_SOURCE_TPG:
 		case INPUT_SYSTEM_SOURCE_PRBS:
 		case INPUT_SYSTEM_SOURCE_FIFO:
 		default:
@@ -814,7 +813,6 @@ static input_system_err_t configuration_to_registers(void)
 		//...
 		break;
 
-	case INPUT_SYSTEM_SOURCE_TPG:
 	case INPUT_SYSTEM_SOURCE_PRBS:
 	case INPUT_SYSTEM_SOURCE_FIFO:
 		break;
@@ -1065,42 +1063,6 @@ input_system_err_t	input_system_prbs_channel_cfg(
 	return input_system_configure_channel(channel);
 }
 
-input_system_err_t	input_system_tpg_channel_cfg(
-    u32		ch_id,
-    u32		nof_frames,//not used yet
-    u32		x_mask,
-    u32		y_mask,
-    u32		x_delta,
-    u32		y_delta,
-    u32		xy_mask,
-    u32		sync_gen_width,
-    u32		sync_gen_height,
-    u32		sync_gen_hblank_cycles,
-    u32		sync_gen_vblank_cycles,
-    target_cfg2400_t	target
-)
-{
-	channel_cfg_t channel;
-
-	(void)nof_frames;
-
-	channel.ch_id	= ch_id;
-	channel.source_type		= INPUT_SYSTEM_SOURCE_TPG;
-
-	channel.source_cfg.tpg_cfg.x_mask	= x_mask;
-	channel.source_cfg.tpg_cfg.y_mask	= y_mask;
-	channel.source_cfg.tpg_cfg.x_delta	= x_delta;
-	channel.source_cfg.tpg_cfg.y_delta	= y_delta;
-	channel.source_cfg.tpg_cfg.xy_mask	= xy_mask;
-	channel.source_cfg.tpg_cfg.sync_gen_cfg.width		= sync_gen_width;
-	channel.source_cfg.tpg_cfg.sync_gen_cfg.height		= sync_gen_height;
-	channel.source_cfg.tpg_cfg.sync_gen_cfg.hblank_cycles	= sync_gen_hblank_cycles;
-	channel.source_cfg.tpg_cfg.sync_gen_cfg.vblank_cycles	= sync_gen_vblank_cycles;
-
-	channel.target_cfg	= target;
-	return input_system_configure_channel(channel);
-}
-
 // MW: Don't use system specific names, (even in system specific files) "cfg2400" -> cfg
 input_system_err_t	input_system_gpfifo_channel_cfg(
     u32		ch_id,
diff --git a/drivers/staging/media/atomisp/pci/ia_css.h b/drivers/staging/media/atomisp/pci/ia_css.h
index d83e1ae5b0b3..421056287853 100644
--- a/drivers/staging/media/atomisp/pci/ia_css.h
+++ b/drivers/staging/media/atomisp/pci/ia_css.h
@@ -42,7 +42,6 @@
 #include "ia_css_properties.h"
 #include "ia_css_stream_format.h"
 #include "ia_css_stream_public.h"
-#include "ia_css_tpg.h"
 #include "ia_css_version.h"
 #include "ia_css_mmu.h"
 #include "ia_css_morph.h"
diff --git a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
index 47846ece8d64..888f54d8495e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_stream_public.h
@@ -24,7 +24,6 @@
 #include "ia_css_types.h"
 #include "ia_css_pipe_public.h"
 #include "ia_css_metadata.h"
-#include "ia_css_tpg.h"
 #include "ia_css_prbs.h"
 #include "ia_css_input_port.h"
 
@@ -34,7 +33,6 @@
 enum ia_css_input_mode {
 	IA_CSS_INPUT_MODE_SENSOR, /** data from sensor */
 	IA_CSS_INPUT_MODE_FIFO,   /** data from input-fifo */
-	IA_CSS_INPUT_MODE_TPG,    /** data from test-pattern generator */
 	IA_CSS_INPUT_MODE_PRBS,   /** data from pseudo-random bit stream */
 	IA_CSS_INPUT_MODE_MEMORY, /** data from a frame in memory */
 	IA_CSS_INPUT_MODE_BUFFERED_SENSOR /** data is sent through mipi buffer */
@@ -91,7 +89,6 @@ struct ia_css_stream_config {
 	enum ia_css_input_mode    mode; /** Input mode */
 	union {
 		struct ia_css_input_port  port; /** Port, for sensor only. */
-		struct ia_css_tpg_config  tpg;  /** TPG configuration */
 		struct ia_css_prbs_config prbs; /** PRBS configuration */
 	} source; /** Source of input data */
 	unsigned int	      channel_id; /** Channel on which input data
diff --git a/drivers/staging/media/atomisp/pci/ia_css_tpg.h b/drivers/staging/media/atomisp/pci/ia_css_tpg.h
deleted file mode 100644
index 8c744bedb0a6..000000000000
--- a/drivers/staging/media/atomisp/pci/ia_css_tpg.h
+++ /dev/null
@@ -1,79 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- * Copyright (c) 2015, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- */
-
-#ifndef __IA_CSS_TPG_H
-#define __IA_CSS_TPG_H
-
-/* @file
- * This file contains support for the test pattern generator (TPG)
- */
-
-/* Enumerate the TPG IDs.
- */
-enum ia_css_tpg_id {
-	IA_CSS_TPG_ID0,
-	IA_CSS_TPG_ID1,
-	IA_CSS_TPG_ID2
-};
-
-/**
- * Maximum number of TPG IDs.
- *
- * Make sure the value of this define gets changed to reflect the correct
- * number of ia_css_tpg_id enum if you add/delete an item in the enum.
- */
-#define N_CSS_TPG_IDS (IA_CSS_TPG_ID2 + 1)
-
-/* Enumerate the TPG modes.
- */
-enum ia_css_tpg_mode {
-	IA_CSS_TPG_MODE_RAMP,
-	IA_CSS_TPG_MODE_CHECKERBOARD,
-	IA_CSS_TPG_MODE_FRAME_BASED_COLOR,
-	IA_CSS_TPG_MODE_MONO
-};
-
-/* @brief Configure the test pattern generator.
- *
- * Configure the Test Pattern Generator, the way these values are used to
- * generate the pattern can be seen in the HRT extension for the test pattern
- * generator:
- * devices/test_pat_gen/hrt/include/test_pat_gen.h: hrt_calc_tpg_data().
- *
- * This interface is deprecated, it is not portable -> move to input system API
- *
-@code
-unsigned int test_pattern_value(unsigned int x, unsigned int y)
-{
- unsigned int x_val, y_val;
- if (x_delta > 0) (x_val = (x << x_delta) & x_mask;
- else (x_val = (x >> -x_delta) & x_mask;
- if (y_delta > 0) (y_val = (y << y_delta) & y_mask;
- else (y_val = (y >> -y_delta) & x_mask;
- return (x_val + y_val) & xy_mask;
-}
-@endcode
- */
-struct ia_css_tpg_config {
-	enum ia_css_tpg_id   id;
-	enum ia_css_tpg_mode mode;
-	unsigned int         x_mask;
-	int                  x_delta;
-	unsigned int         y_mask;
-	int                  y_delta;
-	unsigned int         xy_mask;
-};
-
-#endif /* __IA_CSS_TPG_H */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
index 3ff61faf0621..c00acf764b93 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_global.h
@@ -35,7 +35,6 @@ typedef enum {
 typedef enum {
 	INPUT_SYSTEM_SOURCE_SENSOR = 0,
 	INPUT_SYSTEM_SOURCE_FIFO,
-	INPUT_SYSTEM_SOURCE_TPG,
 	INPUT_SYSTEM_SOURCE_PRBS,
 	INPUT_SYSTEM_SOURCE_MEMORY,
 	N_INPUT_SYSTEM_SOURCE
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index 523c948923f3..03b7ab7a70d9 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -308,21 +308,6 @@ input_system_err_t	input_system_prbs_channel_cfg(
     target_cfg2400_t	target
 );
 
-input_system_err_t	input_system_tpg_channel_cfg(
-    u32		ch_id,
-    u32		nof_frames,//not used yet
-    u32		x_mask,
-    u32		y_mask,
-    u32		x_delta,
-    u32		y_delta,
-    u32		xy_mask,
-    u32		sync_gen_width,
-    u32		sync_gen_height,
-    u32		sync_gen_hblank_cycles,
-    u32		sync_gen_vblank_cycles,
-    target_cfg2400_t	target
-);
-
 input_system_err_t	input_system_gpfifo_channel_cfg(
     u32		ch_id,
     u32		nof_frames,
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index e3c86069b390..b116be415074 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -39,7 +39,6 @@
 typedef enum {
 	INPUT_SYSTEM_SOURCE_TYPE_UNDEFINED = 0,
 	INPUT_SYSTEM_SOURCE_TYPE_SENSOR,
-	INPUT_SYSTEM_SOURCE_TYPE_TPG,
 	INPUT_SYSTEM_SOURCE_TYPE_PRBS,
 	N_INPUT_SYSTEM_SOURCE_TYPE
 } input_system_source_type_t;
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 3807b31bb98f..9982e77716a7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1549,23 +1549,6 @@ ia_css_debug_dump_stream_config_source(
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "compression: %d\n",
 				    config->source.port.compression.type);
 		break;
-	case IA_CSS_INPUT_MODE_TPG:
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "source.tpg\n");
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "id: %d\n",
-				    config->source.tpg.id);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "mode: %d\n",
-				    config->source.tpg.mode);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "x_mask: 0x%x\n",
-				    config->source.tpg.x_mask);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "x_delta: %d\n",
-				    config->source.tpg.x_delta);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "y_mask: 0x%x\n",
-				    config->source.tpg.y_mask);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "y_delta: %d\n",
-				    config->source.tpg.y_delta);
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "xy_mask: 0x%x\n",
-				    config->source.tpg.xy_mask);
-		break;
 	case IA_CSS_INPUT_MODE_PRBS:
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "source.prbs\n");
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "id: %d\n",
diff --git a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
index 86254888f676..7b5603e4e173 100644
--- a/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/ifmtr/src/ifmtr.c
@@ -382,17 +382,6 @@ int ia_css_ifmtr_configure(struct ia_css_stream_config *config,
 
 	vectors_per_buffer = buffer_height * buffer_width / ISP_VEC_NELEMS;
 
-	if (config->mode == IA_CSS_INPUT_MODE_TPG &&
-	    ((binary && binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_VIDEO) ||
-	     (!binary))) {
-		/* !binary -> sp raw copy pipe */
-		/* workaround for TPG in video mode */
-		start_line = 0;
-		start_column = 0;
-		cropped_height -= start_line;
-		width_a -= start_column;
-	}
-
 	if_a_config.start_line = start_line;
 	if_a_config.start_column = start_column;
 	if_a_config.left_padding = left_padding / deinterleaving;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 269a81190577..52483498239d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -96,12 +96,6 @@ static void release_be_lut_entry(
     csi_mipi_packet_type_t		packet_type,
     csi_rx_backend_lut_entry_t	*entry);
 
-static bool calculate_tpg_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
-    isp2401_input_system_cfg_t		*isys_cfg,
-    pixelgen_tpg_cfg_t		*cfg);
-
 static bool calculate_prbs_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
@@ -517,13 +511,6 @@ static bool calculate_input_system_input_port_cfg(
 			rc &= calculate_be_cfg(input_port, isys_cfg, true,
 					       &input_port_cfg->csi_rx_cfg.md_backend_cfg);
 		break;
-	case INPUT_SYSTEM_SOURCE_TYPE_TPG:
-		rc = calculate_tpg_cfg(
-			 channel,
-			 input_port,
-			 isys_cfg,
-			 &input_port_cfg->pixelgen_cfg.tpg_cfg);
-		break;
 	case INPUT_SYSTEM_SOURCE_TYPE_PRBS:
 		rc = calculate_prbs_cfg(
 			 channel,
@@ -633,17 +620,6 @@ static void release_be_lut_entry(
 	ia_css_isys_csi_rx_lut_rmgr_release(backend, packet_type, entry);
 }
 
-static bool calculate_tpg_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
-    isp2401_input_system_cfg_t		*isys_cfg,
-    pixelgen_tpg_cfg_t		*cfg)
-{
-	memcpy(cfg, &isys_cfg->tpg_port_attr, sizeof(pixelgen_tpg_cfg_t));
-
-	return true;
-}
-
 static bool calculate_prbs_cfg(
     input_system_channel_t		*channel,
     input_system_input_port_t	*input_port,
@@ -703,9 +679,7 @@ static bool calculate_stream2mmio_cfg(
 	cfg->bits_per_pixel = metadata ? isys_cfg->metadata.bits_per_pixel :
 			      isys_cfg->input_port_resolution.bits_per_pixel;
 
-	cfg->enable_blocking =
-	    ((isys_cfg->mode == INPUT_SYSTEM_SOURCE_TYPE_TPG) ||
-	     (isys_cfg->mode == INPUT_SYSTEM_SOURCE_TYPE_PRBS));
+	cfg->enable_blocking = isys_cfg->mode == INPUT_SYSTEM_SOURCE_TYPE_PRBS;
 
 	return true;
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 8c30191b21a7..22c8cdcb2eb8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -462,9 +462,6 @@ ia_css_stream_input_format_bits_per_pixel(struct ia_css_stream *stream)
 	return bpp;
 }
 
-/* TODO: move define to proper file in tools */
-#define GP_ISEL_TPG_MODE 0x90058
-
 static int
 sh_css_config_input_network_2400(struct ia_css_stream *stream)
 {
@@ -500,8 +497,7 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 			return err;
 	}
 
-	if (stream->config.mode == IA_CSS_INPUT_MODE_TPG ||
-	    stream->config.mode == IA_CSS_INPUT_MODE_PRBS) {
+	if (stream->config.mode == IA_CSS_INPUT_MODE_PRBS) {
 		unsigned int hblank_cycles = 100,
 		vblank_lines = 6,
 		width,
@@ -513,8 +509,6 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 		vblank_cycles = vblank_lines * (width + hblank_cycles);
 		sh_css_sp_configure_sync_gen(width, height, hblank_cycles,
 					     vblank_cycles);
-		if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG)
-			ia_css_device_store_uint32(GP_ISEL_TPG_MODE, 0);
 	}
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "sh_css_config_input_network() leave:\n");
@@ -654,16 +648,6 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
 
 	rc = true;
 	switch (stream_cfg->mode) {
-	case IA_CSS_INPUT_MODE_TPG:
-
-		if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID0)
-			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT0_ID;
-		else if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID1)
-			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT1_ID;
-		else if (stream_cfg->source.tpg.id == IA_CSS_TPG_ID2)
-			isys_stream_descr->input_port_id = INPUT_SYSTEM_PIXELGEN_PORT2_ID;
-
-		break;
 	case IA_CSS_INPUT_MODE_PRBS:
 
 		if (stream_cfg->source.prbs.id == IA_CSS_PRBS_ID0)
@@ -700,11 +684,6 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
 
 	rc = true;
 	switch (stream_cfg->mode) {
-	case IA_CSS_INPUT_MODE_TPG:
-
-		isys_stream_descr->mode = INPUT_SYSTEM_SOURCE_TYPE_TPG;
-
-		break;
 	case IA_CSS_INPUT_MODE_PRBS:
 
 		isys_stream_descr->mode = INPUT_SYSTEM_SOURCE_TYPE_PRBS;
@@ -733,54 +712,6 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 
 	rc = true;
 	switch (stream_cfg->mode) {
-	case IA_CSS_INPUT_MODE_TPG:
-		if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_RAMP)
-			isys_stream_descr->tpg_port_attr.mode = PIXELGEN_TPG_MODE_RAMP;
-		else if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_CHECKERBOARD)
-			isys_stream_descr->tpg_port_attr.mode = PIXELGEN_TPG_MODE_CHBO;
-		else if (stream_cfg->source.tpg.mode == IA_CSS_TPG_MODE_MONO)
-			isys_stream_descr->tpg_port_attr.mode = PIXELGEN_TPG_MODE_MONO;
-		else
-			rc = false;
-
-		/*
-		 * TODO
-		 * - Make "color_cfg" as part of "ia_css_tpg_config".
-		 */
-		isys_stream_descr->tpg_port_attr.color_cfg.R1 = 51;
-		isys_stream_descr->tpg_port_attr.color_cfg.G1 = 102;
-		isys_stream_descr->tpg_port_attr.color_cfg.B1 = 255;
-		isys_stream_descr->tpg_port_attr.color_cfg.R2 = 0;
-		isys_stream_descr->tpg_port_attr.color_cfg.G2 = 100;
-		isys_stream_descr->tpg_port_attr.color_cfg.B2 = 160;
-
-		isys_stream_descr->tpg_port_attr.mask_cfg.h_mask =
-		    stream_cfg->source.tpg.x_mask;
-		isys_stream_descr->tpg_port_attr.mask_cfg.v_mask =
-		    stream_cfg->source.tpg.y_mask;
-		isys_stream_descr->tpg_port_attr.mask_cfg.hv_mask =
-		    stream_cfg->source.tpg.xy_mask;
-
-		isys_stream_descr->tpg_port_attr.delta_cfg.h_delta =
-		    stream_cfg->source.tpg.x_delta;
-		isys_stream_descr->tpg_port_attr.delta_cfg.v_delta =
-		    stream_cfg->source.tpg.y_delta;
-
-		/*
-		 * TODO
-		 * - Make "sync_gen_cfg" as part of "ia_css_tpg_config".
-		 */
-		isys_stream_descr->tpg_port_attr.sync_gen_cfg.hblank_cycles = 100;
-		isys_stream_descr->tpg_port_attr.sync_gen_cfg.vblank_cycles = 100;
-		isys_stream_descr->tpg_port_attr.sync_gen_cfg.pixels_per_clock =
-		    stream_cfg->pixels_per_clock;
-		isys_stream_descr->tpg_port_attr.sync_gen_cfg.nr_of_frames = (uint32_t)~(0x0);
-		isys_stream_descr->tpg_port_attr.sync_gen_cfg.pixels_per_line =
-		    stream_cfg->isys_config[IA_CSS_STREAM_DEFAULT_ISYS_STREAM_IDX].input_res.width;
-		isys_stream_descr->tpg_port_attr.sync_gen_cfg.lines_per_frame =
-		    stream_cfg->isys_config[IA_CSS_STREAM_DEFAULT_ISYS_STREAM_IDX].input_res.height;
-
-		break;
 	case IA_CSS_INPUT_MODE_PRBS:
 
 		isys_stream_descr->prbs_port_attr.seed0 = stream_cfg->source.prbs.seed;
@@ -8153,23 +8084,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		if (!IS_ISP2401)
 			ia_css_stream_configure_rx(curr_stream);
 		break;
-	case IA_CSS_INPUT_MODE_TPG:
-		if (!IS_ISP2401) {
-			IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",
-				   curr_stream->config.source.tpg.x_mask,
-				   curr_stream->config.source.tpg.y_mask,
-				   curr_stream->config.source.tpg.x_delta,
-				   curr_stream->config.source.tpg.y_delta,
-				   curr_stream->config.source.tpg.xy_mask);
-
-			sh_css_sp_configure_tpg(
-			    curr_stream->config.source.tpg.x_mask,
-			    curr_stream->config.source.tpg.y_mask,
-			    curr_stream->config.source.tpg.x_delta,
-			    curr_stream->config.source.tpg.y_delta,
-			    curr_stream->config.source.tpg.xy_mask);
-		}
-		break;
 	case IA_CSS_INPUT_MODE_PRBS:
 		if (!IS_ISP2401) {
 			IA_CSS_LOG("mode prbs");
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 2349eb4d3767..bef2b8c5132b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -360,7 +360,6 @@ struct sh_css_sp_config {
 	} input_formatter;
 
 	sync_generator_cfg_t	sync_gen;
-	tpg_cfg_t		tpg;
 	prbs_cfg_t		prbs;
 	input_system_cfg_t	input_circuit;
 	u8			input_circuit_cfg_changed;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 55f9c89c6932..29e5bee78c20 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -669,20 +669,6 @@ sh_css_sp_configure_sync_gen(int width, int height,
 	sh_css_sp_group.config.sync_gen.vblank_cycles = vblank_cycles;
 }
 
-void
-sh_css_sp_configure_tpg(int x_mask,
-			int y_mask,
-			int x_delta,
-			int y_delta,
-			int xy_mask)
-{
-	sh_css_sp_group.config.tpg.x_mask  = x_mask;
-	sh_css_sp_group.config.tpg.y_mask  = y_mask;
-	sh_css_sp_group.config.tpg.x_delta = x_delta;
-	sh_css_sp_group.config.tpg.y_delta = y_delta;
-	sh_css_sp_group.config.tpg.xy_mask = xy_mask;
-}
-
 void
 sh_css_sp_configure_prbs(int seed)
 {
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.h b/drivers/staging/media/atomisp/pci/sh_css_sp.h
index 36b693bd916a..c12f57f5befc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.h
@@ -164,13 +164,6 @@ sh_css_sp_configure_sync_gen(int width,
 			     int hblank_cycles,
 			     int vblank_cycles);
 
-void
-sh_css_sp_configure_tpg(int x_mask,
-			int y_mask,
-			int x_delta,
-			int y_delta,
-			int xy_mask);
-
 void
 sh_css_sp_configure_prbs(int seed);
 
-- 
2.44.0


