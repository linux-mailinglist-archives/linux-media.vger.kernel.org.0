Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5E34598D7
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhKWAD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232468AbhKWADm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:42 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712B6C06175B
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:34 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o13so818292wrs.12
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+8UFUy7ThCe4jhpBTOiwYDEJxRZU23B7iZjGG7ye0e4=;
        b=PuePU9lC/Gl+6pwA5uBClMSF3uGA/ZYwcD3VUjpdHYcOpnLL9nMDtJRz1lEy5AFy84
         0BtwUrQdlDpj/ZlstcWxJEu/WBng4lbvdV3j9ty7At4cawP6/O2b9IyNBn80wLRFok2B
         uMs31JzY9egue7LnVerWXGs3LnEaVM4L59BXBGKVGzYx20QFtS+T/g8VNbjC2VL6u3EY
         hY/z82BF3WM8jJjq23PeqZUo0JckJ3bqiB/4gN5ufn5CdaFwsbKGHCEbbkGr7ZseMynA
         Xq7COmt5xVC44l55Cguq3fEsHGfp+xEYiUuoKUb2eEJYgUiWYlbAERnvgnxgJGIgzv3f
         wNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+8UFUy7ThCe4jhpBTOiwYDEJxRZU23B7iZjGG7ye0e4=;
        b=qNWQW1jqU/N4+IvKldg+WxnWJP9NKDPRwWj9llpN3AYfjIKjs7sjKQvZMUoRibArTH
         lwpDw6CftE4coJOu/JBttaKBz+hfcVRnNSPDD1c8ZPYm5mJAOpaRx9Nvgn8qwO0G7ioH
         ibMpMSOLkuTLxLqN2qppEY1BCFNvxRqkKzTk7OmOAqspmOZaY7LPFGuzEg9V4nIsUdu5
         CCPr62bWkYdOJqDATE+hbN7cEsyUCbAn/DmJfbhZlvDHsnYrmdfsSQOnS2BzYLlCEsdV
         MHCs9F6NvKfoniSf0BITkwcnbgGXSKEz+OyVOD4+dUkRarTLoEZjUMsTYmrXA8vK9C/w
         1PDg==
X-Gm-Message-State: AOAM532szyDUGcsiwMZwyaJWHkZhHWwNg1ZV5a4iEU+1tB5H+Qw2f/o+
        LKM7JKFI1k+IFrep0CvT7pbDKY78cxI=
X-Google-Smtp-Source: ABdhPJzMi+UecxU1lxxQDG3cWvEFaS2sW5Hb/TkC0t1IVdpPOwMHSYO/rpS7jvuHlTtWfYPgs3MeAQ==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr1640629wrm.406.1637625633115;
        Mon, 22 Nov 2021 16:00:33 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:32 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 09/17] media: i2c: Add vblank control to ov8865
Date:   Tue, 23 Nov 2021 00:00:09 +0000
Message-Id: <20211123000017.43187-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_VBLANK control to the ov8865 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 2d5b7b8c2c9e..27043b9426a1 100644
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
@@ -675,6 +677,7 @@ struct ov8865_state {
 struct ov8865_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vblank;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2225,6 +2228,20 @@ static int ov8865_test_pattern_configure(struct ov8865_sensor *sensor,
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
@@ -2476,6 +2493,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEST_PATTERN:
 		index = (unsigned int)ctrl->val;
 		return ov8865_test_pattern_configure(sensor, index);
+	case V4L2_CID_VBLANK:
+		return ov8865_vts_configure(sensor, ctrl->val);
 	default:
 		return -EINVAL;
 	}
@@ -2492,6 +2511,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	struct ov8865_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *handler = &ctrls->handler;
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
+	const struct ov8865_mode *mode = &ov8865_modes[0];
+	unsigned int vblank_max, vblank_def;
 	int ret;
 
 	v4l2_ctrl_handler_init(handler, 32);
@@ -2528,6 +2549,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
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
@@ -2708,6 +2736,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 		 sensor->state.mbus_code != mbus_code)
 		ret = ov8865_state_configure(sensor, mode, mbus_code);
 
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV8865_TIMING_MIN_VTS,
+				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
+				 1, mode->vts - mode->output_size_y);
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

