Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D62B1CBF7C
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 11:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgEIJCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 05:02:11 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39997 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgEIJCK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 05:02:10 -0400
X-Originating-IP: 212.216.150.148
Received: from uno.homenet.telecomitalia.it (a-ur1-85.tin.it [212.216.150.148])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2C65F1C0004;
        Sat,  9 May 2020 09:02:06 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@google.com, pavel@ucw.cz
Subject: [PATCH v11 05/13] media: v4l2-ctrls: Add camera orientation and rotation
Date:   Sat,  9 May 2020 11:04:48 +0200
Message-Id: <20200509090456.3496481-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200509090456.3496481-1-jacopo@jmondi.org>
References: <20200509090456.3496481-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the newly defined V4L2_CID_CAMERA_ORIENTATION
and V4L2_CID_CAMERA_SENSOR_ROTATION read-only controls used to report
the camera device mounting position and orientation respectively.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 13 +++++++++++++
 include/uapi/linux/v4l2-controls.h   |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1c617b42a944d..92c3e39efc28f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -583,6 +583,12 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"Annex B Start Code",
 		NULL,
 	};
+	static const char * const camera_orientation[] = {
+		"Front",
+		"Back",
+		"External",
+		NULL,
+	};
 
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
@@ -708,6 +714,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return hevc_decode_mode;
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
 		return hevc_start_code;
+	case V4L2_CID_CAMERA_ORIENTATION:
+		return camera_orientation;
 	default:
 		return NULL;
 	}
@@ -1020,6 +1028,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
 	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
 	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
+	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
+	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1293,6 +1303,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
+	case V4L2_CID_CAMERA_ORIENTATION:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
 	case V4L2_CID_LINK_FREQ:
@@ -1482,6 +1493,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
 	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
 	case V4L2_CID_RDS_RX_MUSIC_SPEECH:
+	case V4L2_CID_CAMERA_ORIENTATION:
+	case V4L2_CID_CAMERA_SENSOR_ROTATION:
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
 	case V4L2_CID_RF_TUNER_PLL_LOCK:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 0ba1005c96519..62271418c1bea 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -923,6 +923,13 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
 #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
 
+#define V4L2_CID_CAMERA_ORIENTATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
+#define V4L2_CAMERA_ORIENTATION_FRONT		0
+#define V4L2_CAMERA_ORIENTATION_BACK		1
+#define V4L2_CAMERA_ORIENTATION_EXTERNAL	2
+
+#define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.26.1

