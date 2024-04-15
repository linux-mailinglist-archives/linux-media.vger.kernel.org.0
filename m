Return-Path: <linux-media+bounces-9363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1343F8A4E62
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B715B209DB
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D986BB20;
	Mon, 15 Apr 2024 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QcdJkvYO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032EF6A8A8
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182584; cv=none; b=WHgpggqBJnPqG/yv0V5QPqhk8xRjgvWAuzglaAG7ZodMddtVj642L/oYE4DQNcxjIJ/1wQwNGtuf3+ZLq/jfdu8WnOWDT1hfRAMOD9VMkUlt50+Pzrb/LvowotKd63glzGNypCZ1WrSfL60Vmj0gZrzQk7dJtCIDC0sYLKqlU8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182584; c=relaxed/simple;
	bh=io4p/xGKofzGg1VLrRaY16usZNLDtjF2Mp1dY4+N+SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epJOWmpJqqYtMi1XIvs+kdIsiRUUwnd9lpeBCHsSHvOBTYCc5kc8lsqTGgwkDBwbGKO1HxR8d3NqPGXooOKaVbROOMbgZL0pIstZ9TADWM++Cls4NHXKv5rwFfBNLCW4QymDtdMVtlzBntYBA6CUEwZcCLatZ+TY9IJm4fVl0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QcdJkvYO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YicPWuxNSGhGs8XNVS/NeHX9jQLt9CWfLI8HHlUtwRM=;
	b=QcdJkvYOiIclrYN2OjmyXMZOUmRCNnFKjf4d955+j9SKQp7B6OKJsY/uwSLqWyFBMtsz3L
	qhpsd8+Cx62dqC+4nDeU/4EW/LwyfcurgHqOMKTSTStNIRg8Uqasb0oLW98yqLydG3acYW
	QltFp8ESjy4j7PQxamsrGWqgCm8YDSU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-D7L_AS0gOkqnhpzeydiLag-1; Mon,
 15 Apr 2024 08:02:57 -0400
X-MC-Unique: D7L_AS0gOkqnhpzeydiLag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5715738143AF;
	Mon, 15 Apr 2024 12:02:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CBC7C13FA2;
	Mon, 15 Apr 2024 12:02:56 +0000 (UTC)
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
Subject: [PATCH 16/23] media: atomisp: Drop intel_v4l2_subdev_type
Date: Mon, 15 Apr 2024 14:02:13 +0200
Message-ID: <20240415120220.219480-17-hdegoede@redhat.com>
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

intel_v4l2_subdev_type / atomisp_input_subdev.type now always is
RAW_CAMERA, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc2235.c        |  2 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  2 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  2 +-
 .../include/linux/atomisp_gmin_platform.h     |  3 +-
 .../atomisp/include/linux/atomisp_platform.h  | 11 ------
 .../media/atomisp/pci/atomisp_gmin_platform.c | 16 +++------
 .../media/atomisp/pci/atomisp_internal.h      |  1 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  1 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 36 ++++++++-----------
 9 files changed, 23 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index bec4c5615864..994b8bceb4f5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -852,7 +852,7 @@ static int gc2235_probe(struct i2c_client *client)
 	if (ret)
 		gc2235_remove(client);
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev, RAW_CAMERA);
+	return atomisp_register_i2c_module(&dev->sd, gcpdev);
 
 out_free:
 	v4l2_device_unregister_subdev(&dev->sd);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 20f02d18a8de..03ebee976d5b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1552,7 +1552,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = atomisp_register_i2c_module(&dev->sd, pdata, RAW_CAMERA);
+	ret = atomisp_register_i2c_module(&dev->sd, pdata);
 	if (ret) {
 		v4l2_device_unregister_subdev(&dev->sd);
 		kfree(dev);
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index d60630ea16df..c31a81d64950 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -992,7 +992,7 @@ static int ov2722_probe(struct i2c_client *client)
 	if (ret)
 		ov2722_remove(client);
 
-	return atomisp_register_i2c_module(&dev->sd, ovpdev, RAW_CAMERA);
+	return atomisp_register_i2c_module(&dev->sd, ovpdev);
 
 out_ctrl_handler_free:
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 64bd54835c32..711e8fb3464f 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -19,8 +19,7 @@
 #include "atomisp_platform.h"
 
 int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
-				struct camera_sensor_platform_data *plat_data,
-				enum intel_v4l2_subdev_type type);
+				struct camera_sensor_platform_data *plat_data);
 int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd);
 int gmin_get_var_int(struct device *dev, bool is_gmin,
 		     const char *var, int def);
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 8060db0e0c5f..51e7b199e005 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -109,18 +109,7 @@ enum atomisp_input_format {
 
 #define N_ATOMISP_INPUT_FORMAT (ATOMISP_INPUT_FORMAT_USER_DEF8 + 1)
 
-enum intel_v4l2_subdev_type {
-	RAW_CAMERA = 1,
-};
-
-struct intel_v4l2_subdev_id {
-	char name[17];
-	enum intel_v4l2_subdev_type type;
-	enum atomisp_camera_port    port;
-};
-
 struct intel_v4l2_subdev_table {
-	enum intel_v4l2_subdev_type type;
 	enum atomisp_camera_port port;
 	unsigned int lanes;
 	struct v4l2_subdev *subdev;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a5e68b2cac50..aba69cf97785 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -126,7 +126,7 @@ static DEFINE_MUTEX(gmin_regulator_mutex);
 static int gmin_v1p8_enable_count;
 static int gmin_v2p8_enable_count;
 
-/* The atomisp uses type==0 for the end-of-list marker, so leave space. */
+/* The atomisp uses subdev==NULL for the end-of-list marker, so leave space. */
 static struct intel_v4l2_subdev_table pdata_subdevs[MAX_SUBDEVS + 1];
 
 static const struct atomisp_platform_data pdata = {
@@ -145,16 +145,13 @@ const struct atomisp_platform_data *atomisp_get_platform_data(void)
 EXPORT_SYMBOL_GPL(atomisp_get_platform_data);
 
 int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
-				struct camera_sensor_platform_data *plat_data,
-				enum intel_v4l2_subdev_type type)
+				struct camera_sensor_platform_data *plat_data)
 {
 	int i;
 	struct gmin_subdev *gs;
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 
-	dev_info(&client->dev, "register atomisp i2c module type %d\n", type);
-
 	/* The windows driver model (and thus most BIOSes by default)
 	 * uses ACPI runtime power management for camera devices, but
 	 * we don't.  Disable it, or else the rails will be needlessly
@@ -172,10 +169,10 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 	adev->power.flags.power_resources = 0;
 
 	for (i = 0; i < MAX_SUBDEVS; i++)
-		if (!pdata.subdevs[i].type)
+		if (!pdata.subdevs[i].subdev)
 			break;
 
-	if (pdata.subdevs[i].type)
+	if (i == MAX_SUBDEVS)
 		return -ENOMEM;
 
 	/* Note subtlety of initialization order: at the point where
@@ -187,7 +184,6 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 	if (!gs)
 		return -ENODEV;
 
-	pdata.subdevs[i].type = type;
 	pdata.subdevs[i].port = gs->csi_port;
 	pdata.subdevs[i].lanes = gs->csi_lanes;
 	pdata.subdevs[i].subdev = subdev;
@@ -1136,7 +1132,7 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 	}
 
 	for (i = 0; i < MAX_SUBDEVS; i++)
-		if (!pdata.subdevs[i].type)
+		if (!pdata.subdevs[i].subdev)
 			break;
 
 	if (i >= MAX_SUBDEVS) {
@@ -1148,7 +1144,6 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 	if (ret)
 		return ret;
 
-	pdata.subdevs[i].type = RAW_CAMERA;
 	pdata.subdevs[i].port = port;
 	pdata.subdevs[i].lanes = lanes;
 	pdata.subdevs[i].subdev = subdev;
@@ -1166,7 +1161,6 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev)
 
 		camera_sensor_csi_free(subdev);
 		pdata.subdevs[i].subdev = NULL;
-		pdata.subdevs[i].type = 0;
 		pdata.subdevs[i].port = 0;
 		break;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index d021c26aacd7..9227399502b9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -121,7 +121,6 @@
 	round_down((2 * (n) + (d) * (step)) / (2 * (d)), (step))
 
 struct atomisp_input_subdev {
-	unsigned int type;
 	enum atomisp_camera_port port;
 	u32 code; /* MEDIA_BUS_FMT_* */
 	bool binning_support;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d7c842997139..effc71b5a439 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -406,7 +406,6 @@ static int atomisp_enum_input(struct file *file, void *fh,
 
 	input->type = V4L2_INPUT_TYPE_CAMERA;
 	input->index = index;
-	input->reserved[0] = isp->inputs[index].type;
 	input->reserved[1] = isp->inputs[index].port;
 
 	return 0;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 4c3d55301089..470c123256a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -803,32 +803,25 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 	 * converting them to standard v4l2 sensor drivers using runtime-pm +
 	 * ACPI for pm and v4l2_async_register_subdev_sensor() registration.
 	 */
-	for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
+	for (subdevs = pdata->subdevs; subdevs->subdev; ++subdevs) {
 		ret = v4l2_device_register_subdev(&isp->v4l2_dev, subdevs->subdev);
 		if (ret)
 			continue;
 
-		switch (subdevs->type) {
-		case RAW_CAMERA:
-			if (subdevs->port >= ATOMISP_CAMERA_NR_PORTS) {
-				dev_err(isp->dev, "port %d not supported\n", subdevs->port);
-				break;
-			}
-
-			if (isp->sensor_subdevs[subdevs->port]) {
-				dev_err(isp->dev, "port %d already has a sensor attached\n",
-					subdevs->port);
-				break;
-			}
-
-			mipi_port = atomisp_port_to_mipi_port(isp, subdevs->port);
-			isp->sensor_lanes[mipi_port] = subdevs->lanes;
-			isp->sensor_subdevs[subdevs->port] = subdevs->subdev;
-			break;
-		default:
-			dev_dbg(isp->dev, "unknown subdev probed\n");
-			break;
+		if (subdevs->port >= ATOMISP_CAMERA_NR_PORTS) {
+			dev_err(isp->dev, "port %d not supported\n", subdevs->port);
+			continue;
 		}
+
+		if (isp->sensor_subdevs[subdevs->port]) {
+			dev_err(isp->dev, "port %d already has a sensor attached\n",
+				subdevs->port);
+			continue;
+		}
+
+		mipi_port = atomisp_port_to_mipi_port(isp, subdevs->port);
+		isp->sensor_lanes[mipi_port] = subdevs->lanes;
+		isp->sensor_subdevs[subdevs->port] = subdevs->subdev;
 	}
 
 	return atomisp_csi_lane_config(isp);
@@ -1039,7 +1032,6 @@ int atomisp_register_device_nodes(struct atomisp_device *isp)
 
 		input = &isp->inputs[isp->input_cnt];
 
-		input->type = RAW_CAMERA;
 		input->port = i;
 		input->camera = isp->sensor_subdevs[i];
 		input->csi_port = &isp->csi2_port[i].subdev;
-- 
2.44.0


