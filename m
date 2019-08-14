Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8507D8DEC4
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbfHNU1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:27:18 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51427 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729547AbfHNU1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:27:18 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.homenet.telecomitalia.it (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2636BFF804;
        Wed, 14 Aug 2019 20:27:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Subject: [RFC 3/5] media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
Date:   Wed, 14 Aug 2019 22:28:13 +0200
Message-Id: <20190814202815.32491-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814202815.32491-1-jacopo@jmondi.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the newly defined V4L2_CID_LOCATION read-only control
used to report the camera device mounting position.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 7 +++++++
 include/uapi/linux/v4l2-controls.h   | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 7d3a33258748..8ab0857df59a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -943,6 +943,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
 	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
 	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
+	case V4L2_CID_LOCATION:			return "Location";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1300,6 +1301,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
 		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
+	case V4L2_CID_LOCATION:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		*min = V4L2_LOCATION_FRONT;
+		*max = V4L2_LOCATION_BACK;
+		*step = 1;
 		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 37807f23231e..5c4c7b245921 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -889,6 +889,10 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
 #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
 
+#define V4L2_CID_LOCATION			(V4L2_CID_CAMERA_CLASS_BASE+34)
+#define V4L2_LOCATION_FRONT			(0 << 0)
+#define V4L2_LOCATION_BACK			(1 << 0)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.22.0

