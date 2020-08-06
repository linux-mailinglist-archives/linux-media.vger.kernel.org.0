Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B145223DFDD
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgHFRyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgHFQay (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:30:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3004FC014CCB;
        Thu,  6 Aug 2020 08:13:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 359C1299596
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
Subject: [PATCH v2 07/14] media: uapi: h264: Increase size of DPB entry pic_num
Date:   Thu,  6 Aug 2020 12:13:03 -0300
Message-Id: <20200806151310.98624-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806151310.98624-1-ezequiel@collabora.com>
References: <20200806151310.98624-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DPB entry PicNum maximum value is 2*MaxFrameNum for interlaced
content (field_pic_flag=1).

As specified, MaxFrameNum is 2^(log2_max_frame_num_minus4 + 4)
and log2_max_frame_num_minus4 is in the range of 0 to 12,
which means pic_num should be a 32-bit field.

The v4l2_h264_dpb_entry struct needs to be padded to avoid a hole,
which might be also useful to allow future uAPI extensions.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst     |  5 ++++-
 drivers/media/v4l2-core/v4l2-ctrls.c                | 13 +++++++++++++
 include/media/h264-ctrls.h                          |  3 ++-
 include/media/v4l2-h264.h                           |  2 +-
 4 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 966b52ddcf4c..427fc5727ec0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2054,7 +2054,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u16
       - ``frame_num``
       -
-    * - __u16
+    * - __u8
+      - ``reserved[2]``
+      - Applications and drivers must set this to zero.
+    * - __u32
       - ``pic_num``
       -
     * - __s32
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 76c8dc8fb31c..b9457789fa55 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1725,6 +1725,8 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 
 #define zero_padding(s) \
 	memset(&(s).padding, 0, sizeof((s).padding))
+#define zero_reserved(s) \
+	memset(&(s).reserved, 0, sizeof((s).reserved))
 
 /*
  * Compound controls validation requires setting unused fields/flags to zero
@@ -1735,6 +1737,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
@@ -1796,7 +1799,17 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
 	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
+		break;
+
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
+		p_h264_dec_params = p;
+
+		for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
+			struct v4l2_h264_dpb_entry *dpb_entry =
+				&p_h264_dec_params->dpb[i];
+
+			zero_reserved(*dpb_entry);
+		}
 		break;
 
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 6a95d39f4d15..4f05ee265997 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -209,7 +209,8 @@ struct v4l2_ctrl_h264_slice_params {
 struct v4l2_h264_dpb_entry {
 	__u64 reference_ts;
 	__u16 frame_num;
-	__u16 pic_num;
+	__u8 reserved[2];
+	__u32 pic_num;
 	/* Note that field is indicated by v4l2_buffer.field */
 	__s32 top_field_order_cnt;
 	__s32 bottom_field_order_cnt;
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index bc9ebb560ccf..1a5f26fc2a9a 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -33,7 +33,7 @@ struct v4l2_h264_reflist_builder {
 	struct {
 		s32 pic_order_count;
 		int frame_num;
-		u16 pic_num;
+		u32 pic_num;
 		u16 longterm : 1;
 	} refs[V4L2_H264_NUM_DPB_ENTRIES];
 	s32 cur_pic_order_count;
-- 
2.27.0

