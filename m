Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BDB3D2DC2
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhGVTyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhGVTyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:54:00 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CA2C061575;
        Thu, 22 Jul 2021 13:34:34 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id j2so30632wrx.9;
        Thu, 22 Jul 2021 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F7F7FKEX65DVemwtWBC2EFzoLsG6Afm2QAYRv7Pr9qg=;
        b=jqKXdRAR6BoiR2UVwS0BCE+Xitmr2/W6tlRHgt5tRMduYhQwYnS/SHhZ0Q6oWEAPj/
         gqIb0SDFUW3H8GDPzPYfy9TPJ6xmHlF2GpIVMi4rR3ZSn9aTpkoo3k+yUtMl80e5MpzE
         zFzInKt4guP/C+nbpzq7jAyl3KRy9oPM7RGiseAr8sRSUsMGEo/QKem+uYxz1WnfXz4N
         hSTLKLPE0aHKDMFpbW5yxvVWPYuuE8ac6kcF5B66UajM9wChzngvZ8HiqSnFpffwYtSv
         IifR4sSRAiijdLbP8FCO2vpG//9aqSklKhY2GjIaTlMcfGKSPO8hAqSb2Sp3YFbpbyg4
         O8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F7F7FKEX65DVemwtWBC2EFzoLsG6Afm2QAYRv7Pr9qg=;
        b=hPKMRr5pSreMjIYcBCNhKP9xIpiCqXsDuLQy/QxEm+A3QzkdN2lxePRaDgpnGlCo55
         i/edY0GeS9F9Q7Y4KpAuNkW4Hjq8DW0q9kEu44YksGxZDh2eJgFGaaGiBAqUtNiELGGv
         mjqMliedcco/VNRNuTsNHy5bmzXkRXB9g0bhf3s9eKorMuHig/ulLkI6exyr0i4UsXKX
         6cjlrBpSl9z4Ktpye7j+c5c6M0zgsfWsXMUVZMoLBDI0G9CD1NBL6blng147PerSewiM
         O1hih7Idyn6mCKMdVy/lyxoFdRXcG4OQ0otXr5n8DuPVUSH2q9V9+cjy41HqYRqVqUWh
         4rbg==
X-Gm-Message-State: AOAM5327Ysa7atWlL914osetX9tsRFC+5o8q5rxoueoWF30vHov33R6M
        TDcDH+KSEzJcn3gFPSA6DNw=
X-Google-Smtp-Source: ABdhPJzCyn1ajcevaV10ig+70Fap+aRpr2tkOBi+Ow/jmZRa058/aGNFaBMZe1qDsSBf5Bgpe9ZfzQ==
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr1776715wrt.224.1626986073023;
        Thu, 22 Jul 2021 13:34:33 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:32 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 07/13] media: i2c: Add vblank control to ov8865
Date:   Thu, 22 Jul 2021 21:34:01 +0100
Message-Id: <20210722203407.3588046-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
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
index 09558a3342dd..daead1fc9314 100644
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
@@ -658,6 +660,7 @@ struct ov8865_state {
 struct ov8865_ctrls {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vblank;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2212,6 +2215,20 @@ static int ov8865_test_pattern_configure(struct ov8865_sensor *sensor,
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
@@ -2463,6 +2480,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_TEST_PATTERN:
 		index = (unsigned int)ctrl->val;
 		return ov8865_test_pattern_configure(sensor, index);
+	case V4L2_CID_VBLANK:
+		return ov8865_vts_configure(sensor, ctrl->val);
 	default:
 		return -EINVAL;
 	}
@@ -2479,6 +2498,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	struct ov8865_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *handler = &ctrls->handler;
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
+	const struct ov8865_mode *mode = sensor->state.mode;
+	unsigned int vblank_max, vblank_def;
 	int ret;
 
 	v4l2_ctrl_handler_init(handler, 32);
@@ -2514,6 +2535,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
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
@@ -2694,6 +2722,10 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 		 sensor->state.mbus_code != mbus_code)
 		ret = ov8865_state_configure(sensor, mode, mbus_code);
 
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV8865_TIMING_MIN_VTS,
+				 OV8865_TIMING_MAX_VTS - mode->output_size_y,
+				 1, mode->vts - mode->output_size_y);
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
@@ -3019,6 +3051,8 @@ static int ov8865_probe(struct i2c_client *client)
 
 	/* Sensor */
 
+	sensor->state.mode =  &ov8865_modes[0];
+
 	ret = ov8865_ctrls_init(sensor);
 	if (ret)
 		goto error_mutex;
-- 
2.25.1

