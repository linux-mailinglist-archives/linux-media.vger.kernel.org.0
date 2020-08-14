Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC56244A9F
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbgHNNhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:37:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43328 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbgHNNhf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:37:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1BE2529A83F
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 11/19] media: uapi: h264: Rename and clarify PPS_FLAG_SCALING_MATRIX_PRESENT
Date:   Fri, 14 Aug 2020 10:36:26 -0300
Message-Id: <20200814133634.95665-12-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applications are expected to fill V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX
if a non-flat scaling matrix applies to the picture. This is the case if
SPS scaling_matrix_present_flag or PPS pic_scaling_matrix_present_flag
are set, and should be handled by applications.

On one hand, the PPS bitstream syntax element signals the presence of a
Picture scaling matrix modifying the Sequence (SPS) scaling matrix.
On the other hand, our flag should indicate if the scaling matrix
V4L2 control is applicable to this request.

Rename the flag from PPS_FLAG_PIC_SCALING_MATRIX_PRESENT to
PPS_FLAG_SCALING_MATRIX_PRESENT, to avoid mixing this flag with
bitstream syntax element pic_scaling_matrix_present_flag,
and clarify the meaning of our flag.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++--
 include/media/h264-ctrls.h                                | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 69dd3961b99b..03ce87aa5488 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1695,9 +1695,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - ``V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE``
       - 0x00000040
       -
-    * - ``V4L2_H264_PPS_FLAG_PIC_SCALING_MATRIX_PRESENT``
+    * - ``V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT``
       - 0x00000080
-      -
+      - Indicates that ``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX``
+        must be used for this picture.
 
 ``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX (struct)``
     Specifies the scaling matrix (as extracted from the bitstream) for
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 1217b706128e..070b9499d7bc 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -99,7 +99,7 @@ struct v4l2_ctrl_h264_sps {
 #define V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED			0x0010
 #define V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT			0x0020
 #define V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE				0x0040
-#define V4L2_H264_PPS_FLAG_PIC_SCALING_MATRIX_PRESENT			0x0080
+#define V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT			0x0080
 
 struct v4l2_ctrl_h264_pps {
 	__u8 pic_parameter_set_id;
-- 
2.27.0

