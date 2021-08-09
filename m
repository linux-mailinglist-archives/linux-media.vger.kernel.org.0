Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFD83E4FA2
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236954AbhHIW72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhHIW71 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:27 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80055C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:06 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m12so23477234wru.12
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AulG+7uf/LMgd2a1nsscaaOUSbzjsdDvDLyf58LSVQY=;
        b=kdLoBHTMTXdCEtxqstX0Vc4LqOTJrtIVk2Z3WkSGHHNhPcrOMqNJTmZMM3q1hJsShL
         Obi/McLC3VPlr5Nxowv4mfm+hhtC/+qkDeA6HjFcpVSngrS+bLpZcmjEtnm6iBcUDV57
         v89/25y2ulVNrUV5pK0szA0w9puu5p4b84WFy4Z9RYySzIQtP8NuXCAPnnedqoMrsq4b
         rE3nSV3lyDGDB3Ww/TsdTzP82ZEtQMxUG5lzyw8wtPY41eYsbzX9UJZsI31wUUFlQu1E
         XgQ+FJIZmIRTZm+bmL0M8LznsDhPzJKBuC044KKFpFemdxyCgmX85kKPOflETAjRSKg4
         nT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AulG+7uf/LMgd2a1nsscaaOUSbzjsdDvDLyf58LSVQY=;
        b=dfOlZ++/yY//NLbJsRDN/5FKaMD8arNakPgiVqmXfta58GAaKbu1EWDAEAjWh0ZmoP
         iYkwKDFz5UggRpa5+0L9NT82JmkYvh7rsOP/4D3IwJryzIEXipk9nYwB3khHoStVoJFH
         sBZKGPvUrCycMW6O5/894eyQQW1xAJBBj5q3yMKYg6cdkROHXRcfGSOvXhXg8/KHvc6e
         38g2YBMauzovlrSuktgg59JVQ4t13Ny56oPuubzDYtbptiyLt9YDFCuMp9k4Wfqj9oTy
         KMRTV441XRwCpSrhGMMA2FHRFzYIzUEC6bnF+FfnllBX8nxNmRaTOnWlTYxamAHY7rsa
         My9A==
X-Gm-Message-State: AOAM530JMGfuLQcee9sEm+IzO9EH+9OAUQOLUe1UWIcuN2O6tUKsbvdS
        QxV4gHliXblVCALxEJqKbNiKSJKTC9c=
X-Google-Smtp-Source: ABdhPJyHOJggXfNmPD16gN2ztCKzI1eGW20RWQSSxLDV5eJjvRKwxmiLhyYMJViNzT/XP6XQBryPZw==
X-Received: by 2002:a05:6000:10c6:: with SMTP id b6mr27883000wrx.110.1628549945151;
        Mon, 09 Aug 2021 15:59:05 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:04 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 07/12] media: i2c: Add vblank control to ov8865
Date:   Mon,  9 Aug 2021 23:58:40 +0100
Message-Id: <20210809225845.916430-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_VBLANK control to the ov8865 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index a97e355c1e07..810047c247b4 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -183,6 +183,8 @@
 #define OV8865_VTS_H(v)				(((v) & GENMASK(11, 8)) >> 8)
 #define OV8865_VTS_L_REG			0x380f
 #define OV8865_VTS_L(v)				((v) & GENMASK(7, 0))
+#define OV8865_TIMING_MAX_VTS			0xffff
+#define OV8865_TIMING_MIN_VTS			0x04
 #define OV8865_OFFSET_X_H_REG			0x3810
 #define OV8865_OFFSET_X_H(v)			(((v) & GENMASK(15, 8)) >> 8)
 #define OV8865_OFFSET_X_L_REG			0x3811
@@ -671,6 +673,7 @@ struct ov8865_state {
 struct ov8865_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vblank;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2218,6 +2221,20 @@ static int ov8865_test_pattern_configure(struct ov8865_sensor *sensor,
 			    ov8865_test_pattern_bits[index]);
 }
 
+/* Blanking */
+
+static int ov8865_vts_configure(struct ov8865_sensor *sensor, u32 vblank)
+{
+	u16 vts = sensor->state.mode->output_size_y + vblank;
+	int ret;
+
+	ret = ov8865_write(sensor, OV8865_VTS_H_REG, OV8865_VTS_H(vts));
+	if (ret)
+		return ret;
+
+	return ov8865_write(sensor, OV8865_VTS_L_REG, OV8865_VTS_L(vts));
+}
+
 /* State */
 
 static int ov8865_state_mipi_configure(struct ov8865_sensor *sensor,
@@ -2469,6 +2486,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEST_PATTERN:
 		index = (unsigned int)ctrl->val;
 		return ov8865_test_pattern_configure(sensor, index);
+	case V4L2_CID_VBLANK:
+		return ov8865_vts_configure(sensor, ctrl->val);
 	default:
 		return -EINVAL;
 	}
@@ -2485,6 +2504,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	struct ov8865_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *handler = &ctrls->handler;
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
+	const struct ov8865_mode *mode = sensor->state.mode;
+	unsigned int vblank_max, vblank_def;
 	int ret;
 
 	v4l2_ctrl_handler_init(handler, 32);
@@ -2520,6 +2541,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 				     ARRAY_SIZE(ov8865_test_pattern_menu) - 1,
 				     0, 0, ov8865_test_pattern_menu);
 
+	/* Blanking */
+	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
+	vblank_def = mode->vts - mode->output_size_y;
+	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,
+					  OV8865_TIMING_MIN_VTS, vblank_max, 1,
+					  vblank_def);
+
 	/* MIPI CSI-2 */
 
 	ctrls->link_freq =
@@ -2700,6 +2728,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 		 sensor->state.mbus_code != mbus_code)
 		ret = ov8865_state_configure(sensor, mode, mbus_code);
 
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV8865_TIMING_MIN_VTS,
+				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
+				 1, mode->vts - mode->output_size_y);
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
@@ -3025,6 +3057,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* Sensor */
 
+	sensor->state.mode =  &ov8865_modes[0];
+
 	ret = ov8865_ctrls_init(sensor);
 	if (ret)
 		goto error_mutex;
-- 
2.25.1

