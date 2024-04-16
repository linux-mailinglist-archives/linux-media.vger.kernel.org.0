Return-Path: <linux-media+bounces-9575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7D8A74EC
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA4F81F214BE
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B578D13AA44;
	Tue, 16 Apr 2024 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mnk4MDme"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B871413AA37
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296042; cv=none; b=foW84nNgfUApBg5sQ46A3i+pdikq+oireBwhNrZ46AIytAsVw4QQjNRbObXq6qwJgz/r0gK/BAYRECwLpDO4RAH8k4Z5GuoSe4r8Ljfg+DwFKTnzh/YVluon2NDBk1sAGVD8gKvEapEDMAnWHs4qDzy9Y/ReqySmhdgoyH/YYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296042; c=relaxed/simple;
	bh=QSJ1LQOD0lt5C8Pm35OMX5ziCl+kIGPXL7WFHyuuAjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mJ1AXjLLXCjmKgmEKYWXVfdlpx2UarnB4vGWn1cdznSIlIX3BjMh5q1gFu6jJ06LkEtpu9FMxmj7A4c70JgXf9XtZhbqqAkG7J8UCfoF4QT+BqXTmX4iX9RA4sK9RKARQ2W/I0TEuATb6ihJWvJzGTacB3ZLfXNk9ymsQDkAp+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mnk4MDme; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296041; x=1744832041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QSJ1LQOD0lt5C8Pm35OMX5ziCl+kIGPXL7WFHyuuAjU=;
  b=Mnk4MDmezte9e070+PdUQUfGdQ5WuqZ1jUzBuzXaw/l4ykd2voXcm0QI
   lWNvEmup5wjmdzHkEnlIsFugOkyGg/QBeUO9XZ8U7B7+v+gsp1y8XP1cJ
   S7LbvFX+IJRqkcvmzVaDNhVUko0pIt/3HgHNE1YFVW3QwBD5NNCiDIdSH
   Mh+/Hu+sgKV+prRfnmsRshE2wKyCQqew1jTP+7clxqNmkNGX8NPTCc2Y2
   4Dor58Mh3V5K/P4ViVUw+YuJINi+xkVr4Q3f2kum0gOaH4ui9mP3HGRKu
   0SCbiOJYvulUWLJEpq/nwPyXga3MD0gpTZAyvkqtdz3tO+Bl4dWBKl5EW
   Q==;
X-CSE-ConnectionGUID: ZfFf0XMLSpyEgE4gnnG9aQ==
X-CSE-MsgGUID: Zuk7y0p7Qlu6Gs4oqLJDdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929814"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929814"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:00 -0700
X-CSE-ConnectionGUID: o2NHsa2zT1yrVSD5FWNOhw==
X-CSE-MsgGUID: 31MWJHH2T56fJr1wBqa5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380195"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:58 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A781711F879;
	Tue, 16 Apr 2024 22:33:54 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 24/46] media: ccs: Support frame descriptors
Date: Tue, 16 Apr 2024 22:32:57 +0300
Message-Id: <20240416193319.778192-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide information on the frame layout using frame descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 57 ++++++++++++++++++++++++++++++++
 drivers/media/i2c/ccs/ccs.h      |  4 +++
 2 files changed, 61 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a711233f6fbf..3ca2415fca3b 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/smiapp.h>
 #include <linux/v4l2-mediabus.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -245,6 +246,33 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 	return ret;
 }
 
+static u8 ccs_mipi_csi2_data_type(unsigned int bpp)
+{
+	switch (bpp) {
+	case 6:
+		return MIPI_CSI2_DT_RAW6;
+	case 7:
+		return MIPI_CSI2_DT_RAW7;
+	case 8:
+		return MIPI_CSI2_DT_RAW8;
+	case 10:
+		return MIPI_CSI2_DT_RAW10;
+	case 12:
+		return MIPI_CSI2_DT_RAW12;
+	case 14:
+		return MIPI_CSI2_DT_RAW14;
+	case 16:
+		return MIPI_CSI2_DT_RAW16;
+	case 20:
+		return MIPI_CSI2_DT_RAW20;
+	case 24:
+		return MIPI_CSI2_DT_RAW24;
+	default:
+		WARN_ON(1);
+		return 0;
+	}
+}
+
 static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -2633,6 +2661,34 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	return ret;
 }
 
+static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *desc)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
+
+	switch (sensor->hwcfg.csi_signalling_mode) {
+	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
+	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
+		desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		break;
+	default:
+		/* FIXME: CCP2 support */
+		return -EINVAL;
+	}
+
+	entry->pixelcode = sensor->csi_format->code;
+	entry->stream = CCS_STREAM_PIXEL;
+	entry->bus.csi2.dt =
+		sensor->csi_format->width == sensor->csi_format->compressed ?
+		ccs_mipi_csi2_data_type(sensor->csi_format->width) :
+		CCS_DEFAULT_COMPRESSED_DT;
+	entry++;
+	desc->num_entries++;
+
+	return 0;
+}
+
 static int ccs_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
 {
 	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
@@ -3055,6 +3111,7 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_selection = ccs_set_selection,
 	.enable_streams = ccs_enable_streams,
 	.disable_streams = ccs_disable_streams,
+	.get_frame_desc = ccs_get_frame_desc,
 };
 
 static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 4725e6eca8d0..90b442a3d53e 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -46,6 +46,8 @@
 
 #define CCS_COLOUR_COMPONENTS		4
 
+#define CCS_DEFAULT_COMPRESSED_DT	MIPI_CSI2_DT_USER_DEFINED(0)
+
 #define SMIAPP_NAME			"smiapp"
 #define CCS_NAME			"ccs"
 
@@ -175,6 +177,8 @@ struct ccs_csi_data_format {
 #define CCS_PAD_SRC			1
 #define CCS_PADS			2
 
+#define CCS_STREAM_PIXEL		0
+
 struct ccs_binning_subtype {
 	u8 horizontal:4;
 	u8 vertical:4;
-- 
2.39.2


