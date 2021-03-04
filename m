Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35E032D4F6
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 15:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239990AbhCDOJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 09:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239716AbhCDOIw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 09:08:52 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACF3C061574;
        Thu,  4 Mar 2021 06:08:12 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2B0B21F46448
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 2/8] media: uapi: vp8: Rename v4l2_vp8_loopfilter to v4l2_vp8_loop_filter
Date:   Thu,  4 Mar 2021 11:07:49 -0300
Message-Id: <20210304140755.85581-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210304140755.85581-1-ezequiel@collabora.com>
References: <20210304140755.85581-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename to struct v4l2_vp8_loop_filter, which is closer to the
VP8 syntax. This change is only cosmetics, but since this API
is exposed to userspace, it's worth the trouble to get it consistent.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst      | 12 ++++++------
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c     |  2 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c |  2 +-
 include/media/vp8-ctrls.h                            |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c391ce4683e5..1795f079aca2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1809,7 +1809,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - struct :c:type:`v4l2_vp8_segment`
       - ``segment``
       - Structure with segment-based adjustments metadata.
-    * - struct :c:type:`v4l2_vp8_loopfilter`
+    * - struct :c:type:`v4l2_vp8_loop_filter`
       - ``lf``
       - Structure with loop filter level adjustments metadata.
     * - struct :c:type:`v4l2_vp8_quantization`
@@ -2007,13 +2007,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
     \normalsize
 
-.. c:type:: v4l2_vp8_loopfilter
+.. c:type:: v4l2_vp8_loop_filter
 
 .. cssclass:: longtable
 
 .. tabularcolumns:: |p{1.5cm}|p{3.9cm}|p{11.9cm}|
 
-.. flat-table:: struct v4l2_vp8_loopfilter
+.. flat-table:: struct v4l2_vp8_loop_filter
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
@@ -2035,11 +2035,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - Applications and drivers must set this to zero.
     * - __u32
       - ``flags``
-      - See :ref:`Loopfilter Flags <vp8_loopfilter_flags>`
+      - See :ref:`Loop Filter Flags <vp8_loop_filter_flags>`
 
-.. _vp8_loopfilter_flags:
+.. _vp8_loop_filter_flags:
 
-``Loopfilter Flags``
+``Loop Filter Flags``
 
 .. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
 
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 07acb4ea5dd0..cbe1d087f103 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -136,7 +136,7 @@ static void cfg_lf(struct hantro_ctx *ctx,
 		   const struct v4l2_ctrl_vp8_frame *hdr)
 {
 	const struct v4l2_vp8_segment *seg = &hdr->segment;
-	const struct v4l2_vp8_loopfilter *lf = &hdr->lf;
+	const struct v4l2_vp8_loop_filter *lf = &hdr->lf;
 	struct hantro_dev *vpu = ctx->dev;
 	unsigned int i;
 	u32 reg;
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index 4dfd4dddbcac..1a0d7fef4723 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -277,7 +277,7 @@ static void cfg_lf(struct hantro_ctx *ctx,
 		   const struct v4l2_ctrl_vp8_frame *hdr)
 {
 	const struct v4l2_vp8_segment *seg = &hdr->segment;
-	const struct v4l2_vp8_loopfilter *lf = &hdr->lf;
+	const struct v4l2_vp8_loop_filter *lf = &hdr->lf;
 	struct hantro_dev *vpu = ctx->dev;
 	unsigned int i;
 	u32 reg;
diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
index 3f74012e23ff..3afaf6ea4bc9 100644
--- a/include/media/vp8-ctrls.h
+++ b/include/media/vp8-ctrls.h
@@ -34,7 +34,7 @@ struct v4l2_vp8_segment {
 #define V4L2_VP8_LF_ADJ_ENABLE	0x01
 #define V4L2_VP8_LF_DELTA_UPDATE	0x02
 #define V4L2_VP8_LF_FILTER_TYPE_SIMPLE	0x04
-struct v4l2_vp8_loopfilter {
+struct v4l2_vp8_loop_filter {
 	__s8 ref_frm_delta[4];
 	__s8 mb_mode_delta[4];
 	__u8 sharpness_level;
@@ -82,7 +82,7 @@ struct v4l2_vp8_entropy_coder_state {
 
 struct v4l2_ctrl_vp8_frame {
 	struct v4l2_vp8_segment segment;
-	struct v4l2_vp8_loopfilter lf;
+	struct v4l2_vp8_loop_filter lf;
 	struct v4l2_vp8_quantization quant;
 	struct v4l2_vp8_entropy entropy;
 	struct v4l2_vp8_entropy_coder_state coder_state;
-- 
2.30.0

