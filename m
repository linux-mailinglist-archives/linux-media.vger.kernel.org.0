Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AD339A018
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 13:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFCLwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 07:52:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48230 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFCLwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 07:52:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id CB4901F42FDD
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v13 1/9] media: hevc: Add fields and flags for hevc PPS
Date:   Thu,  3 Jun 2021 13:49:56 +0200
Message-Id: <20210603115004.915294-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603115004.915294-1-benjamin.gaignard@collabora.com>
References: <20210603115004.915294-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add fields and flags as they are defined in
7.4.3.3.1 "General picture parameter set RBSP semantics of the
H.265 ITU specification.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 14 ++++++++++++++
 include/media/hevc-ctrls.h                         |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 0b8061666c57..9cfb471fc6be 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2783,6 +2783,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``num_extra_slice_header_bits``
       -
+    * - __u8
+      - ``num_ref_idx_l0_default_active_minus1``
+      - Specifies the inferred value of num_ref_idx_l0_active_minus1
+    * - __u8
+      - ``num_ref_idx_l1_default_active_minus1``
+      - Specifies the inferred value of num_ref_idx_l1_active_minus1
     * - __s8
       - ``init_qp_minus26``
       -
@@ -2893,6 +2899,14 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - ``V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT``
       - 0x00040000
       -
+    * - ``V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
+      - 0x00080000
+      - Specifies the presence of deblocking filter control syntax elements in
+        the PPS
+    * - ``V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING``
+      - 0x00100000
+      - Specifies that tile column boundaries and likewise tile row boundaries
+        are distributed uniformly across the picture
 
 .. raw:: latex
 
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 226fcfa0e026..245052c15864 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -100,10 +100,14 @@ struct v4l2_ctrl_hevc_sps {
 #define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER	(1ULL << 16)
 #define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT		(1ULL << 17)
 #define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1ULL << 18)
+#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT	(1ULL << 19)
+#define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING			(1ULL << 20)
 
 struct v4l2_ctrl_hevc_pps {
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
 	__u8	num_extra_slice_header_bits;
+	__u8	num_ref_idx_l0_default_active_minus1;
+	__u8	num_ref_idx_l1_default_active_minus1;
 	__s8	init_qp_minus26;
 	__u8	diff_cu_qp_delta_depth;
 	__s8	pps_cb_qp_offset;
-- 
2.25.1

