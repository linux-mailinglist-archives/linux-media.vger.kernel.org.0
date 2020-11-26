Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240EE2C516A
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389620AbgKZJhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:37:15 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39334 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389572AbgKZJhO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:37:14 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8C27F1F450FA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 08/14] media: controls: Add the stateless codec control class
Date:   Thu, 26 Nov 2020 06:36:12 -0300
Message-Id: <20201126093618.137292-9-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126093618.137292-1-ezequiel@collabora.com>
References: <20201126093618.137292-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new control class to hold the stateless codecs controls
that are ready to be moved out of staging.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst         | 4 ++++
 drivers/media/v4l2-core/v4l2-ctrls.c                       | 5 +++++
 include/uapi/linux/v4l2-controls.h                         | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 8b2029d1390b..0980190d6070 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -362,6 +362,10 @@ still cause this situation.
       - 0xa30000
       - The class containing motion or object detection controls. These controls
         are described in :ref:`detect-controls`.
+    * - ``V4L2_CTRL_CLASS_CODEC_STATELESS``
+      - 0xa40000
+      - The class containing stateless codec controls. These controls are
+	described in :ref:`codec-stateless-controls`.
 
 Return Value
 ============
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 6a17a7487459..fa96e6aa0a86 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1181,6 +1181,10 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_DETECT_MD_GLOBAL_THRESHOLD: return "MD Global Threshold";
 	case V4L2_CID_DETECT_MD_THRESHOLD_GRID:	return "MD Threshold Grid";
 	case V4L2_CID_DETECT_MD_REGION_GRID:	return "MD Region Grid";
+
+	/* Stateless Codec controls */
+	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
+	case V4L2_CID_CODEC_STATELESS_CLASS:	return "Stateless Codec Controls";
 	default:
 		return NULL;
 	}
@@ -1368,6 +1372,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FM_RX_CLASS:
 	case V4L2_CID_RF_TUNER_CLASS:
 	case V4L2_CID_DETECT_CLASS:
+	case V4L2_CID_CODEC_STATELESS_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
 		/* You can neither read not write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 75cf87b9a377..90478ecc2f81 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -65,6 +65,7 @@
 #define V4L2_CTRL_CLASS_FM_RX		0x00a10000	/* FM Receiver controls */
 #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
+#define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 
 /* User-class control IDs */
 
@@ -1177,6 +1178,12 @@ enum v4l2_detect_md_mode {
 #define V4L2_CID_DETECT_MD_THRESHOLD_GRID	(V4L2_CID_DETECT_CLASS_BASE + 3)
 #define V4L2_CID_DETECT_MD_REGION_GRID		(V4L2_CID_DETECT_CLASS_BASE + 4)
 
+
+/*  Stateless CODECs controls */
+#define V4L2_CID_CODEC_STATELESS_BASE          (V4L2_CTRL_CLASS_CODEC_STATELESS | 0x900)
+#define V4L2_CID_CODEC_STATELESS_CLASS         (V4L2_CTRL_CLASS_CODEC_STATELESS | 1)
+
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
2.27.0

