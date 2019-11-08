Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD59F505A
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 16:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKHP6G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 10:58:06 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:45263 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfKHP6G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 10:58:06 -0500
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 31B2C10000C;
        Fri,  8 Nov 2019 15:58:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB))
Subject: [PATCH v5 05/11] media: v4l2-ctrls: Add camera location and rotation
Date:   Fri,  8 Nov 2019 16:59:38 +0100
Message-Id: <20191108155944.1040883-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108155944.1040883-1-jacopo@jmondi.org>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the newly defined V4L2_CID_CAMERA_SENSOR_LOCATION
and V4L2_CID_CAMERA_SENSOR_ROTATION read-only controls used to report
the camera device mounting position and orientation respectively.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 4 ++++
 include/uapi/linux/v4l2-controls.h   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index a565ae3ba7e4..0293135833d8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1015,6 +1015,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
 	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
 	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
+	case V4L2_CID_CAMERA_SENSOR_LOCATION:	return "Camera Sensor Location";
+	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1341,6 +1343,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
+	case V4L2_CID_CAMERA_SENSOR_LOCATION:
+	case V4L2_CID_CAMERA_SENSOR_ROTATION:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5a7bedee2b0e..2517d2f63d2f 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -912,6 +912,13 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
 #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
 
+#define V4L2_CID_CAMERA_SENSOR_LOCATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
+#define V4L2_LOCATION_FRONT			0
+#define V4L2_LOCATION_BACK			1
+#define V4L2_LOCATION_EXTERNAL			2
+
+#define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.23.0

