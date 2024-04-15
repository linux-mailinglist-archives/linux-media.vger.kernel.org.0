Return-Path: <linux-media+bounces-9369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA38A4E67
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62668281C47
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB5D6E5FD;
	Mon, 15 Apr 2024 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="geOBsizW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963E6D1A7
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182589; cv=none; b=V+uXkc55GUh/sm3fnKQrkrMBQGi4MGsee7E7JmKe6MAa5bwbYGJm569IQoqaZREUJiBXX3AQehxkI0eIsAXEAcaTEQxD7A6k89RK4QvKsIc1Yd8XJJ2+GYy0Wfcpk8IgAVo6g5aIQVawLyLn626FqM98S3HzdDfjqAk1aoUIO+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182589; c=relaxed/simple;
	bh=TaB+/cqAPY2OKk4xB2AVQ7lJzMrfYJQAGsXq5ugtY1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ry9X4rMjG2IeGADuDyupHKtc8dvGMAIMvYpY4OqmTJ+TKwYdym0BVcRS2HVIVbWmOrBB+bGiPDkbr1XB9L4tP0aiDXcC8aGq5DuVOmaAf5PXtxvTv472fM+zJnIRhCGN5EfLApYqbqcLFx3hDINhsXtpPZqldKk2A6jLZYGl0Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=geOBsizW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m7NCgwC3XBVbL5XHa69mXFMIijUU/ioL2QzPflqh4FQ=;
	b=geOBsizW1HqfdqJqua0F5Thrh5ayGY4FS7Bu+tg/g2c+MV+fYMm+O5YsyITS4J3gNtUkho
	9WjWtEbsGyiE4i442LsUOrxHaA4CFSdrwQLKpocRmSq+cH6kpylkh4Jsd40MdVzHGmk0az
	+e+kCr1mKddmNjLQSD9BX636B6kdCLI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-_mCXweOaP_WuWwCc0icTFg-1; Mon, 15 Apr 2024 08:02:59 -0400
X-MC-Unique: _mCXweOaP_WuWwCc0icTFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C23CB1887313;
	Mon, 15 Apr 2024 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8941CC13FA1;
	Mon, 15 Apr 2024 12:02:57 +0000 (UTC)
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
Subject: [PATCH 17/23] media: atomisp: Remove gmin_platform VCM code.
Date: Mon, 15 Apr 2024 14:02:14 +0200
Message-ID: <20240415120220.219480-18-hdegoede@redhat.com>
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

VCM support has already been removed from the main atomisp driver
in commit 7473c97dd8d0 ("media: atomisp: Remove custom VCM handling")
remove the left-over dead VCM handling from the gmin platform code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../include/linux/atomisp_gmin_platform.h     |  3 --
 .../atomisp/include/linux/atomisp_platform.h  | 21 ---------
 .../media/atomisp/pci/atomisp_gmin_platform.c | 47 -------------------
 3 files changed, 71 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
index 711e8fb3464f..ecd82220f04a 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_gmin_platform.h
@@ -28,7 +28,4 @@ gmin_camera_platform_data(
     struct v4l2_subdev *subdev,
     enum atomisp_input_format csi_format,
     enum atomisp_bayer_order csi_bayer);
-
-int atomisp_gmin_register_vcm_control(struct camera_vcm_control *);
-
 #endif
diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 51e7b199e005..098859bde86f 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -147,25 +147,6 @@ struct atomisp_input_stream_info {
 	struct atomisp_isys_config_info isys_info[MAX_STREAMS_PER_CHANNEL];
 };
 
-struct camera_vcm_control;
-struct camera_vcm_ops {
-	int (*power_up)(struct v4l2_subdev *sd, struct camera_vcm_control *vcm);
-	int (*power_down)(struct v4l2_subdev *sd,
-			  struct camera_vcm_control *vcm);
-	int (*queryctrl)(struct v4l2_subdev *sd, struct v4l2_queryctrl *qc,
-			 struct camera_vcm_control *vcm);
-	int (*g_ctrl)(struct v4l2_subdev *sd, struct v4l2_control *ctrl,
-		      struct camera_vcm_control *vcm);
-	int (*s_ctrl)(struct v4l2_subdev *sd, struct v4l2_control *ctrl,
-		      struct camera_vcm_control *vcm);
-};
-
-struct camera_vcm_control {
-	char camera_module[CAMERA_MODULE_ID_LEN];
-	struct camera_vcm_ops *ops;
-	struct list_head list;
-};
-
 struct camera_sensor_platform_data {
 	int (*flisclk_ctrl)(struct v4l2_subdev *subdev, int flag);
 	int (*csi_cfg)(struct v4l2_subdev *subdev, int flag);
@@ -179,8 +160,6 @@ struct camera_sensor_platform_data {
 	int (*v1p8_ctrl)(struct v4l2_subdev *subdev, int on);
 	int (*v2p8_ctrl)(struct v4l2_subdev *subdev, int on);
 	int (*v1p2_ctrl)(struct v4l2_subdev *subdev, int on);
-	struct camera_vcm_control *(*get_vcm_ctrl)(struct v4l2_subdev *subdev,
-		char *module_id);
 };
 
 struct camera_mipi_info {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index aba69cf97785..e12354820a3a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -75,7 +75,6 @@ struct gmin_subdev {
 	struct regulator *v1p8_reg;
 	struct regulator *v2p8_reg;
 	struct regulator *v1p2_reg;
-	struct regulator *v2p8_vcm_reg;
 	enum atomisp_camera_port csi_port;
 	unsigned int csi_lanes;
 	enum atomisp_input_format csi_fmt;
@@ -85,7 +84,6 @@ struct gmin_subdev {
 	bool v1p8_on;
 	bool v2p8_on;
 	bool v1p2_on;
-	bool v2p8_vcm_on;
 
 	int v1p8_gpio;
 	int v2p8_gpio;
@@ -133,9 +131,6 @@ static const struct atomisp_platform_data pdata = {
 	.subdevs = pdata_subdevs,
 };
 
-static LIST_HEAD(vcm_devices);
-static DEFINE_MUTEX(vcm_lock);
-
 static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev);
 
 const struct atomisp_platform_data *atomisp_get_platform_data(void)
@@ -214,7 +209,6 @@ int atomisp_gmin_remove_subdev(struct v4l2_subdev *sd)
 				regulator_put(gmin_subdevs[i].v1p8_reg);
 				regulator_put(gmin_subdevs[i].v2p8_reg);
 				regulator_put(gmin_subdevs[i].v1p2_reg);
-				regulator_put(gmin_subdevs[i].v2p8_vcm_reg);
 			}
 			gmin_subdevs[i].subdev = NULL;
 		}
@@ -664,7 +658,6 @@ static int gmin_subdev_add(struct gmin_subdev *gs)
 		gs->v2p8_reg = regulator_get(dev, "V2P8SX");
 
 		gs->v1p2_reg = regulator_get(dev, "V1P2A");
-		gs->v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
 
 		/* Note: ideally we would initialize v[12]p8_on to the
 		 * output of regulator_is_enabled(), but sadly that
@@ -1167,31 +1160,6 @@ void atomisp_unregister_subdev(struct v4l2_subdev *subdev)
 }
 EXPORT_SYMBOL_GPL(atomisp_unregister_subdev);
 
-static struct camera_vcm_control *gmin_get_vcm_ctrl(struct v4l2_subdev *subdev,
-	char *camera_module)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	struct gmin_subdev *gs = find_gmin_subdev(subdev);
-	struct camera_vcm_control *vcm;
-
-	if (!client || !gs)
-		return NULL;
-
-	if (!camera_module)
-		return NULL;
-
-	mutex_lock(&vcm_lock);
-	list_for_each_entry(vcm, &vcm_devices, list) {
-		if (!strcmp(camera_module, vcm->camera_module)) {
-			mutex_unlock(&vcm_lock);
-			return vcm;
-		}
-	}
-
-	mutex_unlock(&vcm_lock);
-	return NULL;
-}
-
 static struct camera_sensor_platform_data pmic_gmin_plat = {
 	.gpio0_ctrl = gmin_gpio0_ctrl,
 	.gpio1_ctrl = gmin_gpio1_ctrl,
@@ -1200,7 +1168,6 @@ static struct camera_sensor_platform_data pmic_gmin_plat = {
 	.v1p2_ctrl = gmin_v1p2_ctrl,
 	.flisclk_ctrl = gmin_flisclk_ctrl,
 	.csi_cfg = gmin_csi_cfg,
-	.get_vcm_ctrl = gmin_get_vcm_ctrl,
 };
 
 static struct camera_sensor_platform_data acpi_gmin_plat = {
@@ -1211,7 +1178,6 @@ static struct camera_sensor_platform_data acpi_gmin_plat = {
 	.v1p2_ctrl = gmin_acpi_pm_ctrl,
 	.flisclk_ctrl = gmin_acpi_pm_ctrl,
 	.csi_cfg = gmin_csi_cfg,
-	.get_vcm_ctrl = gmin_get_vcm_ctrl,
 };
 
 struct camera_sensor_platform_data *
@@ -1236,19 +1202,6 @@ gmin_camera_platform_data(struct v4l2_subdev *subdev,
 }
 EXPORT_SYMBOL_GPL(gmin_camera_platform_data);
 
-int atomisp_gmin_register_vcm_control(struct camera_vcm_control *vcmCtrl)
-{
-	if (!vcmCtrl)
-		return -EINVAL;
-
-	mutex_lock(&vcm_lock);
-	list_add_tail(&vcmCtrl->list, &vcm_devices);
-	mutex_unlock(&vcm_lock);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(atomisp_gmin_register_vcm_control);
-
 static int gmin_get_hardcoded_var(struct device *dev,
 				  struct gmin_cfg_var *varlist,
 				  const char *var8, char *out, size_t *out_len)
-- 
2.44.0


