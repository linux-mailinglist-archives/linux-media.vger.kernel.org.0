Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7041BD570
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 01:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411167AbfIXXWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 19:22:41 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44305 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389437AbfIXXWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 19:22:40 -0400
Received: by mail-qt1-f195.google.com with SMTP id u40so4297282qth.11;
        Tue, 24 Sep 2019 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=92QCBfq+PYEEOGn/i5MKdYP4+4zuR2w7mTVjlEHeqc8=;
        b=TR1Mb6os52IRCBhD1TB77gsvFjoco0ePFSXHzPcLJ5T/FqqT0YFN2MozusNg2H9oKP
         XwZx7pa31xFMkRuTuwNW6PYdwV+o8KP5uWpPMrb8lxjORPnKAdS3IjmJuSOrqXUzo/na
         QbZH45E2mszUeYeIpURxQpsdhM4ZlvJJ/DClJOAxXYlGAc6tMUqDzRgfuXssDuWbbNJv
         63cb3EBWvIn8FdnCPC7mARUTcqp/1gXqCmONc8kXNINxVXHTaYNhE+U1U7rL6o2KZtuc
         rpTr91ng9hFLsnG8Bbcwq7NhrFDBtIm1KOpFii9ZbfeqQZxRv9jDqPrgGdBG+wl/KD3a
         FGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=92QCBfq+PYEEOGn/i5MKdYP4+4zuR2w7mTVjlEHeqc8=;
        b=EgxONOiMNngRNGjQNZjEdpK0HMmWGbH710sgnHRe6SufCDJO0cjK72yQmNgn2PC7X2
         2yg/LbdcDVWDB/l53kE4wHfzNDHKQibEFAwDSfckw+Pan2chb4DRHxbzcNimguujvy8v
         awDnMxOM6o+awKF9d+uJQgdyOPxsu8q1SF7VLHw+ip06A7EEWFL4HmcUPoBfmt+jMQc9
         rZDdj/VUCu0zOxxpleZh7DgRb13TkkRVqyAzUcLnBrj5eqx/v9FsFklriVZmGDVa6YwT
         am8vLf0lpDT0NMZ9zMYCUJW+LXAo+HfePjmEAarjBjEHN+wOuAuIe6uEjbsU9O25TiND
         QxFw==
X-Gm-Message-State: APjAAAUdtnpOV0J95cYKvFF6gmnMquJoWk6BfSQ6St47zip61TdMY2mT
        T4YKjNNNmWtq1mGZ5Xi+GsBBAGhF+z7GiQ==
X-Google-Smtp-Source: APXvYqxTsbDE0I07Fj8M03z1XcS5wm6SapMVLtd+lVdeGRqZnqAKt/eYH8B8PZvTP1GLBXfdbT9cbw==
X-Received: by 2002:ac8:425a:: with SMTP id r26mr5411870qtm.332.1569367359071;
        Tue, 24 Sep 2019 16:22:39 -0700 (PDT)
Received: from taquaral.ic.unicamp.br (wifi-177-220-84-117.wifi.ic.unicamp.br. [177.220.84.117])
        by smtp.gmail.com with ESMTPSA id j25sm1539492qkk.93.2019.09.24.16.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 16:22:38 -0700 (PDT)
From:   Arthur Moraes do Lago <arthurmoraeslago@gmail.com>
To:     lkcamp@lists.libreplanetbr.org, mchehab@kernel.org,
        helen.koike@collabora.com, skhan@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, andrealmeid@collabora.com,
        laispc19@gmail.com, arthurmoraeslago@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: vimc: Implement debayer control for mean window size
Date:   Tue, 24 Sep 2019 20:21:27 -0300
Message-Id: <20190924232127.30570-1-arthurmoraeslago@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add mean window size parameter for debayer filter as a control in
vimc-debayer.

vimc-debayer was patched to allow changing mean windows parameter
of the filter without needing to reload the driver. The parameter
can now be set using a v4l2-ctl control(mean_window_size).

Co-developed-by: Laís Pessine do Carmo <laispc19@gmail.com>
Signed-off-by: Laís Pessine do Carmo <laispc19@gmail.com>
Signed-off-by: Arthur Moraes do Lago <arthurmoraeslago@gmail.com>
---
Changes in V3:
 - Renamed debayer control
 - Fixed typo in documentation
 - Freed control handler in vimc_deb_release

This commit is based on Shuah Khan's patch series 171283
("Collapse vimc single monolithic driver").

Thanks.
---
 Documentation/media/v4l-drivers/vimc.rst   | 10 +--
 drivers/media/platform/vimc/vimc-common.h  |  1 +
 drivers/media/platform/vimc/vimc-debayer.c | 89 +++++++++++++++++++---
 3 files changed, 79 insertions(+), 21 deletions(-)

diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index a582af0509ee..28646c76dad5 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -80,9 +80,7 @@ vimc-capture:
         Module options
 ---------------
 
-Vimc has a few module parameters to configure the driver.
-
-        param=value
+Vimc has a module parameter to configure the driver.
 
 * ``sca_mult=<unsigned int>``
 
@@ -91,12 +89,6 @@ Vimc has a few module parameters to configure the driver.
         original one. Currently, only supports scaling up (the default value
         is 3).
 
-* ``deb_mean_win_size=<unsigned int>``
-
-        Window size to calculate the mean. Note: the window size needs to be an
-        odd number, as the main pixel stays in the center of the window,
-        otherwise the next odd number is considered (the default value is 3).
-
 Source code documentation
 -------------------------
 
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index 236412ad7548..3a5102ddf794 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -19,6 +19,7 @@
 #define VIMC_CID_VIMC_BASE		(0x00f00000 | 0xf000)
 #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
 #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
+#define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
 
 #define VIMC_FRAME_MAX_WIDTH 4096
 #define VIMC_FRAME_MAX_HEIGHT 2160
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 37f3767db469..f1fa7aa023a3 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -11,17 +11,12 @@
 #include <linux/platform_device.h>
 #include <linux/vmalloc.h>
 #include <linux/v4l2-mediabus.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
 
 #include "vimc-common.h"
 
-static unsigned int deb_mean_win_size = 3;
-module_param(deb_mean_win_size, uint, 0000);
-MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the mean.\n"
-	"NOTE: the window size needs to be an odd number, as the main pixel "
-	"stays in the center of the window, otherwise the next odd number "
-	"is considered");
-
 enum vimc_deb_rgb_colors {
 	VIMC_DEB_RED = 0,
 	VIMC_DEB_GREEN = 1,
@@ -46,6 +41,8 @@ struct vimc_deb_device {
 	u8 *src_frame;
 	const struct vimc_deb_pix_map *sink_pix_map;
 	unsigned int sink_bpp;
+	unsigned int mean_win_size;
+	struct v4l2_ctrl_handler hdl;
 };
 
 static const struct v4l2_mbus_framefmt sink_fmt_default = {
@@ -346,11 +343,18 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
+static const struct v4l2_subdev_core_ops vimc_deb_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_video_ops vimc_deb_video_ops = {
 	.s_stream = vimc_deb_s_stream,
 };
 
 static const struct v4l2_subdev_ops vimc_deb_ops = {
+	.core = &vimc_deb_core_ops,
 	.pad = &vimc_deb_pad_ops,
 	.video = &vimc_deb_video_ops,
 };
@@ -384,7 +388,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
 	 * the top left corner of the mean window (considering the current
 	 * pixel as the center)
 	 */
-	seek = deb_mean_win_size / 2;
+	seek = vdeb->mean_win_size / 2;
 
 	/* Sum the values of the colors in the mean window */
 
@@ -471,14 +475,41 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
 		}
 
 	return vdeb->src_frame;
+}
+
+static inline void vimc_deb_s_mean_win_size(struct vimc_deb_device *vdeb,
+					    unsigned int mean_win_size)
+{
+	if (vdeb->mean_win_size == mean_win_size)
+		return;
+	vdeb->mean_win_size = mean_win_size;
+}
 
+static int vimc_deb_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vimc_deb_device *vdeb =
+		container_of(ctrl->handler, struct vimc_deb_device, hdl);
+
+	switch (ctrl->id) {
+	case VIMC_CID_MEAN_WIN_SIZE:
+		vimc_deb_s_mean_win_size(vdeb, ctrl->val);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
 }
 
+static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
+	.s_ctrl = vimc_deb_s_ctrl,
+};
+
 static void vimc_deb_release(struct v4l2_subdev *sd)
 {
 	struct vimc_deb_device *vdeb =
 				container_of(sd, struct vimc_deb_device, sd);
 
+	v4l2_ctrl_handler_free(&vdeb->hdl);
 	vimc_pads_cleanup(vdeb->ved.pads);
 	kfree(vdeb);
 }
@@ -495,6 +526,24 @@ void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
 	vimc_ent_sd_unregister(ved, &vdeb->sd);
 }
 
+static const struct v4l2_ctrl_config vimc_deb_ctrl_class = {
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
+	.id = VIMC_CID_VIMC_CLASS,
+	.name = "VIMC Controls",
+	.type = V4L2_CTRL_TYPE_CTRL_CLASS,
+};
+
+static const struct v4l2_ctrl_config vimc_deb_ctrl_mean_win_size = {
+	.ops = &vimc_deb_ctrl_ops,
+	.id = VIMC_CID_MEAN_WIN_SIZE,
+	.name = "Debayer Mean Window Size",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 1,
+	.max = 25,
+	.step = 2,
+	.def = 3,
+};
+
 struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 				     const char *vcfg_name)
 {
@@ -507,6 +556,16 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	if (!vdeb)
 		return NULL;
 
+	/* Create controls: */
+	v4l2_ctrl_handler_init(&vdeb->hdl, 2);
+	v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_class, NULL);
+	v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_mean_win_size, NULL);
+	vdeb->sd.ctrl_handler = &vdeb->hdl;
+	if (vdeb->hdl.error) {
+		ret = vdeb->hdl.error;
+		goto err_free_vdeb;
+	}
+
 	/* Initialize ved and sd */
 	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
 				   vcfg_name,
@@ -514,13 +573,12 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
 				   MEDIA_PAD_FL_SOURCE},
 				   &vimc_deb_int_ops, &vimc_deb_ops);
-	if (ret) {
-		kfree(vdeb);
-		return NULL;
-	}
+	if (ret)
+		goto err_free_hdl;
 
 	vdeb->ved.process_frame = vimc_deb_process_frame;
 	vdeb->dev = &vimc->pdev.dev;
+	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
 
 	/* Initialize the frame format */
 	vdeb->sink_fmt = sink_fmt_default;
@@ -534,4 +592,11 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	vdeb->set_rgb_src = vimc_deb_set_rgb_mbus_fmt_rgb888_1x24;
 
 	return &vdeb->ved;
+
+err_free_hdl:
+	v4l2_ctrl_handler_free(&vdeb->hdl);
+err_free_vdeb:
+	kfree(vdeb);
+
+	return NULL;
 }
-- 
2.23.0

