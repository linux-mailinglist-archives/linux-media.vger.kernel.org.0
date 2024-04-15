Return-Path: <linux-media+bounces-9352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622E8A4E56
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 956CC1F21CB7
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C131B6AFB5;
	Mon, 15 Apr 2024 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NaoRV8uv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571A67A0E
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182565; cv=none; b=HKXq4Lv6VfggfaYlocvRg0CfZR1NQO+eoR59hQSMgjpWdq6HE2K9TPfiKmTilXfTl57DMjl18OqRem/4mXxBEh/hWg8uLR0zE8jR+MCUUoQrYFhfAPblaWG+j5zvLwLeh4hL3e6hhd8AZZUavtigrktsFzjnOHqJcP68jF7iQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182565; c=relaxed/simple;
	bh=bn4C09QgbWnHKaxNqGOnx0SAwLHERIaTJJ8HSQp6oZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2iM2Wiiq12UtRKmgZy6lRo5dxgwsaGTdbhEh1QsXNM2rWkaoXXmhKGampsodbf3i4OgMZJhIA7D157iZ+aoy4nXPSbDS36s4z5pBraUMvxr/c1G2W1i+5r+2bYl/Yh3eWoAkI6jdWgwStmj4oLMazVexQ7UqChPICvvyOTANVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NaoRV8uv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fHI36XDZDyeTaj+0SBGseJViDF1Wc/0ZCb60c8D7L5A=;
	b=NaoRV8uvHh7Kli0LEM2uWHBGgWOwVC3OGd8xaWMbqILJoW2I9b+JHRfUpWP/kNz9Vt2qP+
	xKrUA5H8IHb8cTEQDFMvesOxWltStJ2dGw/3EbIIG+VoxY1ZQZeLeA1MVQft4SjdqdYglx
	xdkFHh2c5gbhOhd9oBoVTKocD3CaZzM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-KhA95-ruNmCjqxCbLRPb3w-1; Mon, 15 Apr 2024 08:02:39 -0400
X-MC-Unique: KhA95-ruNmCjqxCbLRPb3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AED7805918;
	Mon, 15 Apr 2024 12:02:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51FC4C13FA1;
	Mon, 15 Apr 2024 12:02:37 +0000 (UTC)
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
Subject: [PATCH 03/23] media: atomisp: Add atomisp_select_input() helper
Date: Mon, 15 Apr 2024 14:02:00 +0200
Message-ID: <20240415120220.219480-4-hdegoede@redhat.com>
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

When switching input/sensor the s_power() callback must be called
for old sensor drivers to power on the new sensor and power off
the previous sensor.

atomisp_s_input() already does this but atomisp_link_setup()
did not do this.

Add a new atomisp_select_input() helper which does this and use this
in both atomisp_s_input() and atomisp_link_setup() for consistent
behavior.

Also make atomisp_link_setup() turn the sensor back off when
a link gets disabled.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 19 +++++++++++++++++++
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  3 +++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 13 +------------
 .../media/atomisp/pci/atomisp_subdev.c        | 15 +++++++++------
 4 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 83a15a2d358e..6c93bab17955 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3739,6 +3739,25 @@ int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool
 	return 0;
 }
 
+int atomisp_select_input(struct atomisp_device *isp, unsigned int input)
+{
+	unsigned int input_orig = isp->asd.input_curr;
+	int ret;
+
+	/* Power on new sensor */
+	ret = atomisp_s_sensor_power(isp, input, 1);
+	if (ret)
+		return ret;
+
+	isp->asd.input_curr = input;
+
+	/* Power off previous sensor */
+	if (input != input_orig)
+		atomisp_s_sensor_power(isp, input_orig, 0);
+
+	return 0;
+}
+
 static int atomisp_set_sensor_crop_and_fmt(struct atomisp_device *isp,
 					   struct v4l2_mbus_framefmt *ffmt,
 					   int which)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 2676236ee015..f302763b7b2f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -244,6 +244,9 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 /* Set sensor power (no-op if already on/off) */
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on);
 
+/* Select which sensor to use, must be called with a valid input */
+int atomisp_select_input(struct atomisp_device *isp, unsigned int input);
+
 /* This function looks up the closest available resolution. */
 int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index be1f3f2ee63e..b3ad53449cb8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -449,7 +449,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct atomisp_sub_device *asd = pipe->asd;
 	struct v4l2_subdev *camera = NULL;
 	int ret;
 
@@ -468,17 +467,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		return -EINVAL;
 	}
 
-	/* power off the current owned sensor, as it is not used this time */
-	if (input != isp->asd.input_curr)
-		atomisp_s_sensor_power(isp, isp->asd.input_curr, 0);
-
-	/* powe on the new sensor */
-	ret = atomisp_s_sensor_power(isp, input, 1);
-	if (ret)
-		return ret;
-
-	asd->input_curr = input;
-	return 0;
+	return atomisp_select_input(isp, input);
 }
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index c36aae69d6f7..aabffd6a424d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -663,9 +663,6 @@ static int atomisp_link_setup(struct media_entity *entity,
 		return -EINVAL;
 	}
 
-	/* Ignore disables, input_curr should only be updated on enables */
-	if (!(flags & MEDIA_LNK_FL_ENABLED))
-		return 0;
 
 	for (i = 0; i < isp->input_cnt; i++) {
 		if (isp->inputs[i].camera == isp->sensor_subdevs[csi_idx])
@@ -679,11 +676,17 @@ static int atomisp_link_setup(struct media_entity *entity,
 
 	mutex_lock(&isp->mutex);
 	ret = atomisp_pipe_check(&asd->video_out, true);
-	if (ret == 0)
-		asd->input_curr = i;
 	mutex_unlock(&isp->mutex);
+	if (ret)
+		return ret;
 
-	return ret;
+	/* Turn off the sensor on link disable */
+	if (!(flags & MEDIA_LNK_FL_ENABLED)) {
+		atomisp_s_sensor_power(isp, i, 0);
+		return 0;
+	}
+
+	return atomisp_select_input(isp, i);
 }
 
 static const struct media_entity_operations isp_subdev_media_ops = {
-- 
2.44.0


