Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F063345FF72
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 15:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhK0Ov7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 09:51:59 -0500
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:52926 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbhK0Ot6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 09:49:58 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id qyyOmWY9jUujjqyyOmVo8k; Sat, 27 Nov 2021 15:46:43 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 27 Nov 2021 15:46:43 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, lijian@yulong.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: v4l2-dev: Use non-atomic bitmap API when applicable
Date:   Sat, 27 Nov 2021 15:46:39 +0100
Message-Id: <0938dd274a6d8cb3fbc0167a8696b527328a2104.1638024310.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No concurrent access is possible when a bitmap is local to a function.
So prefer the non-atomic '__[set|clear]_bit()' functions to save a few
cycles.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/v4l2-core/v4l2-dev.c | 68 +++++++++++++++---------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index d03ace324db0..d00237ee4cae 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -511,7 +511,7 @@ static int get_index(struct video_device *vdev)
 	for (i = 0; i < VIDEO_NUM_DEVICES; i++) {
 		if (video_devices[i] != NULL &&
 		    video_devices[i]->v4l2_dev == vdev->v4l2_dev) {
-			set_bit(video_devices[i]->index, used);
+			__set_bit(video_devices[i]->index, used);
 		}
 	}
 
@@ -519,7 +519,7 @@ static int get_index(struct video_device *vdev)
 }
 
 #define SET_VALID_IOCTL(ops, cmd, op) \
-	do { if ((ops)->op) set_bit(_IOC_NR(cmd), valid_ioctls); } while (0)
+	do { if ((ops)->op) __set_bit(_IOC_NR(cmd), valid_ioctls); } while (0)
 
 /* This determines which ioctls are actually implemented in the driver.
    It's a one-time thing which simplifies video_ioctl2 as it can just do
@@ -562,73 +562,73 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	/* vfl_type and vfl_dir independent ioctls */
 
 	SET_VALID_IOCTL(ops, VIDIOC_QUERYCAP, vidioc_querycap);
-	set_bit(_IOC_NR(VIDIOC_G_PRIORITY), valid_ioctls);
-	set_bit(_IOC_NR(VIDIOC_S_PRIORITY), valid_ioctls);
+	__set_bit(_IOC_NR(VIDIOC_G_PRIORITY), valid_ioctls);
+	__set_bit(_IOC_NR(VIDIOC_S_PRIORITY), valid_ioctls);
 
 	/* Note: the control handler can also be passed through the filehandle,
 	   and that can't be tested here. If the bit for these control ioctls
 	   is set, then the ioctl is valid. But if it is 0, then it can still
 	   be valid if the filehandle passed the control handler. */
 	if (vdev->ctrl_handler || ops->vidioc_queryctrl)
-		set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_QUERYCTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_query_ext_ctrl)
-		set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_QUERY_EXT_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_g_ctrl || ops->vidioc_g_ext_ctrls)
-		set_bit(_IOC_NR(VIDIOC_G_CTRL), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_G_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_s_ctrl || ops->vidioc_s_ext_ctrls)
-		set_bit(_IOC_NR(VIDIOC_S_CTRL), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_S_CTRL), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_g_ext_ctrls)
-		set_bit(_IOC_NR(VIDIOC_G_EXT_CTRLS), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_G_EXT_CTRLS), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_s_ext_ctrls)
-		set_bit(_IOC_NR(VIDIOC_S_EXT_CTRLS), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_S_EXT_CTRLS), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_try_ext_ctrls)
-		set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_querymenu)
-		set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
 	if (!is_tch) {
 		SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
 	}
 	SET_VALID_IOCTL(ops, VIDIOC_LOG_STATUS, vidioc_log_status);
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-	set_bit(_IOC_NR(VIDIOC_DBG_G_CHIP_INFO), valid_ioctls);
-	set_bit(_IOC_NR(VIDIOC_DBG_G_REGISTER), valid_ioctls);
-	set_bit(_IOC_NR(VIDIOC_DBG_S_REGISTER), valid_ioctls);
+	__set_bit(_IOC_NR(VIDIOC_DBG_G_CHIP_INFO), valid_ioctls);
+	__set_bit(_IOC_NR(VIDIOC_DBG_G_REGISTER), valid_ioctls);
+	__set_bit(_IOC_NR(VIDIOC_DBG_S_REGISTER), valid_ioctls);
 #endif
 	/* yes, really vidioc_subscribe_event */
 	SET_VALID_IOCTL(ops, VIDIOC_DQEVENT, vidioc_subscribe_event);
 	SET_VALID_IOCTL(ops, VIDIOC_SUBSCRIBE_EVENT, vidioc_subscribe_event);
 	SET_VALID_IOCTL(ops, VIDIOC_UNSUBSCRIBE_EVENT, vidioc_unsubscribe_event);
 	if (ops->vidioc_enum_freq_bands || ops->vidioc_g_tuner || ops->vidioc_g_modulator)
-		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
+		__set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
 
 	if (is_vid) {
 		/* video specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
 			       ops->vidioc_enum_fmt_vid_overlay)) ||
 		    (is_tx && ops->vidioc_enum_fmt_vid_out))
-			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
 			       ops->vidioc_g_fmt_vid_cap_mplane ||
 			       ops->vidioc_g_fmt_vid_overlay)) ||
 		    (is_tx && (ops->vidioc_g_fmt_vid_out ||
 			       ops->vidioc_g_fmt_vid_out_mplane ||
 			       ops->vidioc_g_fmt_vid_out_overlay)))
-			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_s_fmt_vid_cap ||
 			       ops->vidioc_s_fmt_vid_cap_mplane ||
 			       ops->vidioc_s_fmt_vid_overlay)) ||
 		    (is_tx && (ops->vidioc_s_fmt_vid_out ||
 			       ops->vidioc_s_fmt_vid_out_mplane ||
 			       ops->vidioc_s_fmt_vid_out_overlay)))
-			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_try_fmt_vid_cap ||
 			       ops->vidioc_try_fmt_vid_cap_mplane ||
 			       ops->vidioc_try_fmt_vid_overlay)) ||
 		    (is_tx && (ops->vidioc_try_fmt_vid_out ||
 			       ops->vidioc_try_fmt_vid_out_mplane ||
 			       ops->vidioc_try_fmt_vid_out_overlay)))
-			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_OVERLAY, vidioc_overlay);
 		SET_VALID_IOCTL(ops, VIDIOC_G_FBUF, vidioc_g_fbuf);
 		SET_VALID_IOCTL(ops, VIDIOC_S_FBUF, vidioc_s_fbuf);
@@ -642,11 +642,11 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMESIZES, vidioc_enum_framesizes);
 		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMEINTERVALS, vidioc_enum_frameintervals);
 		if (ops->vidioc_g_selection) {
-			set_bit(_IOC_NR(VIDIOC_G_CROP), valid_ioctls);
-			set_bit(_IOC_NR(VIDIOC_CROPCAP), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_G_CROP), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_CROPCAP), valid_ioctls);
 		}
 		if (ops->vidioc_s_selection)
-			set_bit(_IOC_NR(VIDIOC_S_CROP), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_S_CROP), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_G_SELECTION, vidioc_g_selection);
 		SET_VALID_IOCTL(ops, VIDIOC_S_SELECTION, vidioc_s_selection);
 	}
@@ -669,17 +669,17 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			       ops->vidioc_g_fmt_sliced_vbi_cap)) ||
 		    (is_tx && (ops->vidioc_g_fmt_vbi_out ||
 			       ops->vidioc_g_fmt_sliced_vbi_out)))
-			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_s_fmt_vbi_cap ||
 			       ops->vidioc_s_fmt_sliced_vbi_cap)) ||
 		    (is_tx && (ops->vidioc_s_fmt_vbi_out ||
 			       ops->vidioc_s_fmt_sliced_vbi_out)))
-			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_try_fmt_vbi_cap ||
 			       ops->vidioc_try_fmt_sliced_vbi_cap)) ||
 		    (is_tx && (ops->vidioc_try_fmt_vbi_out ||
 			       ops->vidioc_try_fmt_sliced_vbi_out)))
-			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_G_SLICED_VBI_CAP, vidioc_g_sliced_vbi_cap);
 	} else if (is_tch) {
 		/* touch specific ioctls */
@@ -724,15 +724,15 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	if (is_vid || is_vbi || is_meta) {
 		/* ioctls valid for video, vbi and metadata */
 		if (ops->vidioc_s_std)
-			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_STD, vidioc_s_std);
 		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
 		if (is_rx) {
 			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
 			if (is_io_mc) {
-				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
-				set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
-				set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
+				__set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
+				__set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
+				__set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
 			} else {
 				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
 				SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
@@ -746,9 +746,9 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		}
 		if (is_tx) {
 			if (is_io_mc) {
-				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
-				set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
-				set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
+				__set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
+				__set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
+				__set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
 			} else {
 				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
 				SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
@@ -759,7 +759,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
 		}
 		if (ops->vidioc_g_parm || ops->vidioc_g_std)
-			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
+			__set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
 		SET_VALID_IOCTL(ops, VIDIOC_S_DV_TIMINGS, vidioc_s_dv_timings);
 		SET_VALID_IOCTL(ops, VIDIOC_G_DV_TIMINGS, vidioc_g_dv_timings);
-- 
2.30.2

