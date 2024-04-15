Return-Path: <linux-media+bounces-9350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA718A4E52
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27809B20AD5
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A5B67E69;
	Mon, 15 Apr 2024 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iqUZ2tKQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C094679E5
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182562; cv=none; b=ng7Cz5sFt8YEaqUvL9332ErmO84WDLNLhsuHvaNXNfY3zAufkd6rJfWsMMP01669iYQjEOBaOVMrPghq8SqAmtJJ/BwZPpDIJNLHTERclTR865r6NIw9e5iZUKLeO+Fxl0UYNDpv390Ad4kvAAL9id88Oxt3uoZ7jGv4r5r71WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182562; c=relaxed/simple;
	bh=0k3ZMAtsbbMabIJN5YnU1EDQMyp2UrIwP0aCSXI6i1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTGQyz8LtaL9SeFELEYtDuJa4HRXbh7ZYLUn5RqttTLsjTlTZ/hjefYoOiWYvJzPSueKJ4c434POdf0of8THdRaGJ0m3qjnG4JwGcY+eEPZgJvvWnJcn/W8nI6pgsjGzp5etNFqZErvfCVQgozdyvEDSKI+ANpM5Gee7A0MstCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iqUZ2tKQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OvhZXrdaj6kh6le8vlD4nY1MC+CIrAqAcC635JIIro=;
	b=iqUZ2tKQ96f7rOuykOuS6WqVlm1KRZz3aeMc98ERtOW3PMo2D8HumVZP1Qha7TExWGvTbF
	E170D5M22VLOoZzfaEJBwGKmuAn7Wt58zPIgm4tgSnt3cMrfQTHIbSehXhSoamqkkRsspc
	tRwBO5eDYDsAAWD9k0NpB9SsvaTGoCY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-256-IkbdprHGPtmLzYmcSQeyjA-1; Mon,
 15 Apr 2024 08:02:36 -0400
X-MC-Unique: IkbdprHGPtmLzYmcSQeyjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACA4A38143AE;
	Mon, 15 Apr 2024 12:02:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75F8AC01595;
	Mon, 15 Apr 2024 12:02:34 +0000 (UTC)
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
Subject: [PATCH 01/23] media: atomisp: Add atomisp_s_sensor_power() helper
Date: Mon, 15 Apr 2024 14:01:58 +0200
Message-ID: <20240415120220.219480-2-hdegoede@redhat.com>
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

Since the atomisp driver only supports 1 stream / only has 1 asd now,
there is no longer a need to track which stream owns the sensor.

So the asd owner-pointer of struct atomisp_input_subdev can be dropped,
replace this with a simple camera_on boolean and add a new
atomisp_s_sensor_power() helper which takes care of avoiding unbalanced
s_power() subdev calls as well as takes care of handling the special
-ENOIOCTLCMD return for subdevs which don't implement s_power().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 17 +++++++++++++++
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  3 +++
 .../staging/media/atomisp/pci/atomisp_fops.c  | 14 +------------
 .../media/atomisp/pci/atomisp_internal.h      |  6 +-----
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 21 ++++---------------
 5 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a56cf68b688..6b8ff9f1ae63 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3722,6 +3722,23 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	*padding_h = max_t(u32, *padding_h, min_pad_h);
 }
 
+int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on)
+{
+	int ret;
+
+	if (isp->inputs[input].camera_on == on)
+		return 0;
+
+	ret = v4l2_subdev_call(isp->inputs[input].camera, core, s_power, on);
+	if (ret && ret != -ENOIOCTLCMD) {
+		dev_err(isp->dev, "Error setting sensor power %d: %d\n", on, ret);
+		return ret;
+	}
+
+	isp->inputs[input].camera_on = on;
+	return 0;
+}
+
 static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 					   struct v4l2_mbus_framefmt *ffmt,
 					   int which)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index b8cd957eebdc..2676236ee015 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -241,6 +241,9 @@ int atomisp_compare_grid(struct atomisp_sub_device *asd,
 void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 			 u32 *padding_w, u32 *padding_h);
 
+/* Set sensor power (no-op if already on/off) */
+int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on);
+
 /* This function looks up the closest available resolution. */
 int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 4dba6120af39..b464a6bd0bad 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -445,12 +445,8 @@ const struct vb2_ops atomisp_vb2_ops = {
 
 static void atomisp_dev_init_struct(struct atomisp_device *isp)
 {
-	unsigned int i;
-
 	isp->isp_fatal_error = false;
 
-	for (i = 0; i < isp->input_cnt; i++)
-		isp->inputs[i].asd = NULL;
 	/*
 	 * For Merrifield, frequency is scalable.
 	 * After boot-up, the default frequency is 200MHz.
@@ -584,15 +580,7 @@ static int atomisp_release(struct file *file)
 	atomisp_css_free_stat_buffers(asd);
 	atomisp_free_internal_buffers(asd);
 
-	if (isp->inputs[asd->input_curr].asd == asd) {
-		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       core, s_power, 0);
-		if (ret && ret != -ENOIOCTLCMD)
-			dev_warn(isp->dev, "Failed to power-off sensor\n");
-
-		/* clear the asd field to show this camera is not used */
-		isp->inputs[asd->input_curr].asd = NULL;
-	}
+	atomisp_s_sensor_power(isp, asd->input_curr, 0);
 
 	atomisp_destroy_pipes_stream(asd);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index d6e86d013be9..02fffa7f65e1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -127,17 +127,13 @@ struct atomisp_input_subdev {
 	u32 code; /* MEDIA_BUS_FMT_* */
 	bool binning_support;
 	bool crop_support;
+	bool camera_on;
 	struct v4l2_subdev *camera;
 	/* Sensor rects for sensors which support crop */
 	struct v4l2_rect native_rect;
 	struct v4l2_rect active_rect;
 	/* Sensor state for which == V4L2_SUBDEV_FORMAT_TRY calls */
 	struct v4l2_subdev_state *try_sd_state;
-	/*
-	 * To show this resource is used by
-	 * which stream, in ISP multiple stream mode
-	 */
-	struct atomisp_sub_device *asd;
 };
 
 enum atomisp_dfs_mode {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d602bda134f9..be1f3f2ee63e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -469,28 +469,15 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	}
 
 	/* power off the current owned sensor, as it is not used this time */
-	if (isp->inputs[asd->input_curr].asd == asd &&
-	    asd->input_curr != input) {
-		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       core, s_power, 0);
-		if (ret && ret != -ENOIOCTLCMD)
-			dev_warn(isp->dev,
-				 "Failed to power-off sensor\n");
-		/* clear the asd field to show this camera is not used */
-		isp->inputs[asd->input_curr].asd = NULL;
-	}
+	if (input != isp->asd.input_curr)
+		atomisp_s_sensor_power(isp, isp->asd.input_curr, 0);
 
 	/* powe on the new sensor */
-	ret = v4l2_subdev_call(isp->inputs[input].camera, core, s_power, 1);
-	if (ret && ret != -ENOIOCTLCMD) {
-		dev_err(isp->dev, "Failed to power-on sensor\n");
+	ret = atomisp_s_sensor_power(isp, input, 1);
+	if (ret)
 		return ret;
-	}
 
 	asd->input_curr = input;
-	/* mark this camera is used by the current stream */
-	isp->inputs[input].asd = asd;
-
 	return 0;
 }
 
-- 
2.44.0


