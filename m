Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5857044119A
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhKAAOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhKAAOF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:05 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3DBC061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t30so947354wra.10
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dMlcJbJVuEU779Zc7PeprkSxRDWo4sAfwzQpoKqyDy0=;
        b=kiYBmckvNYT/8/u320/xQPiaSs7OB/KN5vUzfxDQS7etLUl5ai/JPsiK/ZpySXDbLs
         Fs1svMTYLjExyA+6CpivMBryh45pO3Ondvb2tHHx/ca5kdaENYjc76Sn20C+wUtuVREQ
         //zYvq13Z80bVZpDNbygBj51R5VhXgyaEKi6m0XBdtGaVumpR2T3d0AqNYOg1i8tnBhM
         uoe05zfEhUGTJQ8ZbxvJsJ1QFs5g2obnXHz66KPCtp7ECh5ubmwEGqsMnGxy4Rx8s4iQ
         xjxLjzIPuiy5G9A2Sfqq/FXDvq6WKL0TWto/Aan8gh8FDvK+q6z55p3mqlkA2HfQrl6r
         cmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dMlcJbJVuEU779Zc7PeprkSxRDWo4sAfwzQpoKqyDy0=;
        b=o1eYULI8OO/KE+/KyE9lfY2J7JHQDXgB4TiI9WBVm45dunRltTDEGIk3gtelCt6m/G
         9iVgN6vs3VQ7lwKmVzrxAMxx0SU33ubHq1hZFAirIkjIvqKTQXu1y/rJU3/9AWmJff3/
         SGSciPvj5zv6WaRciGLwwHMWp/uiFm4Cz9EIsihySbs7keAPDpcqEZFMctl0TRZuLsAD
         LzwTNPcMP/T2XEu0iZPbAon5d6wG7mIt/wRpUG+tfNwMRAUH346ZU4elHtbv2BoQ70J7
         mpu1x5jvNz6f+OFZR9XQSb/+QqUuprbRTkWgSXttUBUpXovATuI4Pk0U4a1stbf0e2aE
         ZAzg==
X-Gm-Message-State: AOAM532O1WUT1iDCQypt5mzUa+cWF64eg8hghQ2QM7S9yT0I5XQDjmDn
        fyk7qS8PX/zVpucxxE5QbdU=
X-Google-Smtp-Source: ABdhPJxQm/Z+yQbFYcBOV2vXww84U+zRLZ4Qlr/tVj6QPno7/u0fA8VHrskV5JXdayXhp6ndVA1k+w==
X-Received: by 2002:a05:6000:18ce:: with SMTP id w14mr33758343wrq.230.1635725491797;
        Sun, 31 Oct 2021 17:11:31 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:31 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 07/16] media: i2c: Add vblank control to ov8865
Date:   Mon,  1 Nov 2021 00:11:10 +0000
Message-Id: <20211101001119.46056-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_VBLANK control to the ov8865 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index a832938c33b6..f741c0713ca4 100644
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
+	const struct ov8865_mode *mode = sensor->state.mode;
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
 
@@ -3035,6 +3067,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* Sensor */
 
+	sensor->state.mode =  &ov8865_modes[0];
+
 	ret = ov8865_ctrls_init(sensor);
 	if (ret)
 		goto error_mutex;
-- 
2.25.1

