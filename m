Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3C611E791
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfLMQEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:04:49 -0500
Received: from mailoutvs49.siol.net ([185.57.226.240]:56608 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728021AbfLMQEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:04:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 6C4A952455C;
        Fri, 13 Dec 2019 17:04:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Kfzlo29mUbBN; Fri, 13 Dec 2019 17:04:45 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 25E6C524558;
        Fri, 13 Dec 2019 17:04:45 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id D45B152455C;
        Fri, 13 Dec 2019 17:04:42 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] media: uapi: hevc: Add segment address field
Date:   Fri, 13 Dec 2019 17:04:27 +0100
Message-Id: <20191213160428.54303-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213160428.54303-1-jernej.skrabec@siol.net>
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If HEVC frame consists of multiple slices, segment address has to be
known in order to properly decode it.

Add segment address field to slice parameters.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 5 ++++-
 include/media/hevc-ctrls.h                       | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
index aab1451e54d4..5415d5babcc2 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -3975,6 +3975,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u32
       - ``data_bit_offset``
       - Offset (in bits) to the video data in the current slice data.
+    * - __u32
+      - ``slice_segment_addr``
+      -
     * - __u8
       - ``nal_unit_type``
       -
@@ -4052,7 +4055,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``num_rps_poc_lt_curr``
       - The number of reference pictures in the long-term set.
     * - __u8
-      - ``padding[7]``
+      - ``padding[5]``
       - Applications and drivers must set this to zero.
     * - struct :c:type:`v4l2_hevc_dpb_entry`
       - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 1592e52c3614..3e2e32098312 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -167,6 +167,9 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
 	__u32	data_bit_offset;
=20
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u32	slice_segment_addr;
+
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
 	__u8	nal_unit_type;
 	__u8	nuh_temporal_id_plus1;
@@ -200,7 +203,7 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u8	num_rps_poc_st_curr_after;
 	__u8	num_rps_poc_lt_curr;
=20
-	__u8	padding;
+	__u8	padding[5];
=20
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
 	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
--=20
2.24.0

