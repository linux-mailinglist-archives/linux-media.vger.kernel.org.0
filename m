Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E9436BFEF
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 09:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhD0HQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 03:16:47 -0400
Received: from mailoutvs4.siol.net ([185.57.226.195]:52826 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229988AbhD0HQq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 03:16:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id C89C9522CEF;
        Tue, 27 Apr 2021 09:16:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id CxEoLfVWkIxP; Tue, 27 Apr 2021 09:16:01 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 43406524694;
        Tue, 27 Apr 2021 09:16:01 +0200 (CEST)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 45BCD522CEF;
        Tue, 27 Apr 2021 09:16:00 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        ezequiel@collabora.com, benjamin.gaignard@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] media: hevc: Fix dependent slice segment flags
Date:   Tue, 27 Apr 2021 09:15:54 +0200
Message-Id: <20210427071554.2222625-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dependent slice segment flag for PPS control is misnamed. It should have
"enabled" at the end. It only tells if this flag is present in slice
header or not and not the actual value.

Fix this by renaming the PPS flag and introduce another flag for slice
control which tells actual value.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 ++++-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 4 ++--
 include/media/hevc-ctrls.h                                | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/=
Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 7b90cb939e9d..5ed343ddd1ea 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3059,7 +3059,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
=20
-    * - ``V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT``
+    * - ``V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED``
       - 0x00000001
       -
     * - ``V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT``
@@ -3274,6 +3274,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_EN=
ABLED``
       - 0x00000100
       -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT``
+      - 0x00000200
+      -
=20
 .. raw:: latex
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
index 397a4ba5df4c..6821e3d05d34 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -479,8 +479,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 				slice_params->flags);
=20
 	reg |=3D VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_DEPENDEN=
T_SLICE_SEGMENT,
-				V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT,
-				pps->flags);
+				V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT,
+				slice_params->flags);
=20
 	/* FIXME: For multi-slice support. */
 	reg |=3D VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PI=
C;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index b713eeed1915..dc964ff7cd29 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -83,7 +83,7 @@ struct v4l2_ctrl_hevc_sps {
 	__u64	flags;
 };
=20
-#define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT		(1ULL << 0)
+#define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED	(1ULL << 0)
 #define V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT			(1ULL << 1)
 #define V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED		(1ULL << 2)
 #define V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT			(1ULL << 3)
@@ -166,6 +166,7 @@ struct v4l2_hevc_pred_weight_table {
 #define V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV		(1ULL << 6)
 #define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED (1U=
LL << 7)
 #define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENAB=
LED (1ULL << 8)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT	(1ULL << 9)
=20
 struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
--=20
2.31.1

