Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4452E205A9B
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387457AbgFWS3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:29:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbgFWS3H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:29:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0C53C2A37E7
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
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [RFC 2/7] fixup! media: uapi: h264: update reference lists
Date:   Tue, 23 Jun 2020 15:28:04 -0300
Message-Id: <20200623182809.1375-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200623182809.1375-1-ezequiel@collabora.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Align v4l2_h264_reference to 32-bits, giving some room
for future extensions.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst  |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls.c             | 16 ++++++++++++++++
 include/media/h264-ctrls.h                       |  7 +++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 6c36d298db20..7af12447a5b0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1943,6 +1943,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u8
       - ``index``
       -
+    * - __u32
+      - ``reserved``
+      - Applications and drivers must set this to zero.
 
 .. _h264_reference_flags:
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd60cc6..6abd023f10c7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1721,6 +1721,8 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 
 #define zero_padding(s) \
 	memset(&(s).padding, 0, sizeof((s).padding))
+#define zero_reserved(s) \
+	memset(&(s).reserved, 0, sizeof((s).reserved))
 
 /*
  * Compound controls validation requires setting unused fields/flags to zero
@@ -1731,6 +1733,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
@@ -1790,7 +1793,20 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_H264_SPS:
 	case V4L2_CTRL_TYPE_H264_PPS:
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
+		break;
 	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
+		p_h264_slice_params = p;
+
+		for (i = 0; i < V4L2_H264_REF_PIC_LIST_LEN; i++) {
+			struct v4l2_h264_reference *ref0 =
+				&p_h264_slice_params->ref_pic_list0[i];
+			struct v4l2_h264_reference *ref1 =
+				&p_h264_slice_params->ref_pic_list1[i];
+
+			zero_reserved(*ref0);
+			zero_reserved(*ref1);
+		}
+		break;
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
 		break;
 
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 9b1cbc9bc38e..c6cbf178c1c9 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -19,6 +19,8 @@
  */
 #define V4L2_H264_NUM_DPB_ENTRIES 16
 
+#define V4L2_H264_REF_PIC_LIST_LEN 32
+
 /* Our pixel format isn't stable at the moment */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 
@@ -146,6 +148,7 @@ struct v4l2_h264_pred_weight_table {
 struct v4l2_h264_reference {
 	__u8 flags;
 	__u8 index;
+	__u16 reserved;
 };
 
 struct v4l2_ctrl_h264_slice_params {
@@ -190,8 +193,8 @@ struct v4l2_ctrl_h264_slice_params {
 	 * Entries on each list are indices into
 	 * v4l2_ctrl_h264_decode_params.dpb[].
 	 */
-	struct v4l2_h264_reference ref_pic_list0[32];
-	struct v4l2_h264_reference ref_pic_list1[32];
+	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_PIC_LIST_LEN];
+	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_PIC_LIST_LEN];
 
 	__u32 flags;
 };
-- 
2.26.0.rc2

