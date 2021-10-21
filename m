Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8256E436CEC
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhJUVqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbhJUVqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:19 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12158C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:03 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 193-20020a1c01ca000000b00327775075f7so1105257wmb.5
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vqUWLx8DrSjUck5kly87/Hy7v743FYKVE6iviUutRY8=;
        b=IUygNOa+myxleGwG4iCk7KTNJPxJu2mc9EMfjdxpfcQUwSOhgbxm6K09CqTuiaXatL
         IQMTLyYTwmh0U6KBFeUO6cGsQ1FREfeU6N4BQpdnqtyHjCcoLqfXcUhHoT2JhgZwP5UK
         YCFLAgm76zCB17Mc7/yEgtzeZUOVFO2lnPm7kU0fF0C6eEKNekS4GOFVL7W7T56cSPZZ
         nxEtLUDS5T7xpvYK/fhsH4HHlmdGtXv7X7u5OSbUYsMRZQtcYQkz9ZV3JkIOmAgpIDit
         1T1uzvTxyV+O5i7om89gge8Wq1hXjy7v256s6Fj4j4VmzfrzNWa9g46SGAgOOc9BBr2q
         bVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqUWLx8DrSjUck5kly87/Hy7v743FYKVE6iviUutRY8=;
        b=e7ecSViKYeTYhEHEqbOwcOEmdqxtJlZzrf5ZBDipR4aXqmmvmGIUzC2cWQPKLxn1bx
         MfBtKOQQgJtEDzJ9Mw0SZl6OzYErzMIhWRwErjrti7TsbiWX5RMKAWinWQp+g1PQ7X/7
         DXquRbUkQNOmc1ryIC27d1qLgrvqzyFkH5EOavcrmgBX/iU3+CLVNQsyTUXk/bpKwRrc
         ArmHbGIJ/n5hz+yrBNAyTjSmtEoFRsZUtObe5MCFPKZ8BZ3UG/+oFQsmQYz2L7lZQOJT
         xIbijKEwwFeuuhai2JlsrSHAVV5APPclyER6ugm6nSCOO//ZWPGwie+UTd9yTgiE7m7E
         S0yA==
X-Gm-Message-State: AOAM532AA1WaurG1x2CNxGF9sn6yx/yXcs/qJ6JIlizJSmehwxcdy38G
        8M8uCbIEP8jgCi49VLSaYL16B2qUUQQ=
X-Google-Smtp-Source: ABdhPJzrjNtLWA+bPRc8I7UjpjxQK2UVXh1nVFqnaIpXF9TJvwo71PWfUUUYuIha4JCBHvj6CRkQ5Q==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr23856889wmb.142.1634852641747;
        Thu, 21 Oct 2021 14:44:01 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:01 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 07/16] media: i2c: Add vblank control to ov8865
Date:   Thu, 21 Oct 2021 22:43:22 +0100
Message-Id: <20211021214331.1188787-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2_CID_VBLANK control to the ov8865 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index ce7e7da6ae92..e1e23b3e4311 100644
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

