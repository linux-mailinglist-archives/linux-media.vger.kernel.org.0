Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBE37B0A72
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 18:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjI0Qfx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 12:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjI0Qfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 12:35:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE12DE
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695832551; x=1727368551;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DShqXV3QqzKMvvTdeYU8hktGykVZ00oco9+xHj+X/OU=;
  b=R/5+fC74gjEnAwszz+x3uv4ob3E7cMYe2cWiwZM+jiO4SduWTKYijMr3
   v5pcJwAQnZcSnegilEvpgz6jjvo+GMb0k576cFVGbqEuI8pBNnyqS0dq2
   PA6XVZ0o0+816+vq7AHEXsw3AdqzowgzGQaN2/KTDQMR08zv3JiPiiGjc
   xtKiv42x3OsWAJEIbzUSR8GpUcOQ2t2SWJu3/Qk6rWt33fExoPeiKtOW/
   3y8Zyg+i6CwKzWzEAfqZ5BvNQD4FyA3NlTzWDDej5c5IPOIvXC+39mK7N
   EzJ5Zsipu0gcUYYhYP5598rAQrzFA8cAwQ45i4V29cW8nNKig6zIXar4S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448363225"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448363225"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="872955400"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="872955400"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:33:30 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5CA7111F967;
        Wed, 27 Sep 2023 19:33:25 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v5 22/26] media: ccs: Support frame descriptors
Date:   Wed, 27 Sep 2023 19:32:08 +0300
Message-Id: <20230927163212.402025-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
References: <20230927163212.402025-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide information on the frame layout using frame descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c  | 60 +++++++++++++++++++++++++++++++
 drivers/media/i2c/ccs/ccs-quirk.h |  7 ++++
 drivers/media/i2c/ccs/ccs.h       |  4 +++
 3 files changed, 71 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5bb2e9a03d20..d94a1bd66969 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -25,6 +25,7 @@
 #include <linux/slab.h>
 #include <linux/smiapp.h>
 #include <linux/v4l2-mediabus.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-device.h>
 #include <uapi/linux/ccs.h>
@@ -235,6 +236,33 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
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
@@ -2625,6 +2653,37 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
 	return ret;
 }
 
+static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *desc)
+{
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
+
+	if (ccs_has_quirk(sensor, frame_desc))
+		return ccs_call_quirk(sensor, frame_desc, desc);
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
+		ccs_mipi_csi2_data_type(sensor->csi_format->compressed) :
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
@@ -3049,6 +3108,7 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
 	.set_fmt = ccs_set_format,
 	.get_selection = ccs_get_selection,
 	.set_selection = ccs_set_selection,
+	.get_frame_desc = ccs_get_frame_desc,
 };
 
 static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 0b1a64958d71..13f334fe0ac8 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -36,6 +36,7 @@ struct ccs_sensor;
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
  * @flags: Quirk flags
+ * @frame_desc: Obtain the frame descriptor
  */
 struct ccs_quirk {
 	int (*limits)(struct ccs_sensor *sensor);
@@ -46,6 +47,8 @@ struct ccs_quirk {
 	int (*init)(struct ccs_sensor *sensor);
 	int (*reg_access)(struct ccs_sensor *sensor, bool write, u32 *reg,
 			  u32 *val);
+	int (*frame_desc)(struct ccs_sensor *sensor,
+			  struct v4l2_mbus_frame_desc *desc);
 	unsigned long flags;
 };
 
@@ -62,6 +65,10 @@ struct ccs_reg_8 {
 		.val = _val,		\
 	}
 
+#define ccs_has_quirk(sensor, _quirk)					\
+	((sensor)->minfo.quirk &&					\
+	 (sensor)->minfo.quirk->_quirk)
+
 #define ccs_call_quirk(sensor, _quirk, ...)				\
 	((sensor)->minfo.quirk &&					\
 	 (sensor)->minfo.quirk->_quirk ?				\
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 9c3587b2fbe7..d1099f6a36db 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -45,6 +45,8 @@
 
 #define CCS_COLOUR_COMPONENTS		4
 
+#define CCS_DEFAULT_COMPRESSED_DT	0x30
+
 #define SMIAPP_NAME			"smiapp"
 #define CCS_NAME			"ccs"
 
@@ -174,6 +176,8 @@ struct ccs_csi_data_format {
 #define CCS_PAD_SRC			1
 #define CCS_PADS			2
 
+#define CCS_STREAM_PIXEL		0
+
 struct ccs_binning_subtype {
 	u8 horizontal:4;
 	u8 vertical:4;
-- 
2.39.2

