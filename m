Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC622E5E46
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 19:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfJZRrZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 13:47:25 -0400
Received: from mailoutvs12.siol.net ([185.57.226.203]:35658 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726326AbfJZRrY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 13:47:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id CCB19523931;
        Sat, 26 Oct 2019 19:47:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id TUmN3ZUjD4aE; Sat, 26 Oct 2019 19:47:21 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 6F288520606;
        Sat, 26 Oct 2019 19:47:21 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id F3C30523931;
        Sat, 26 Oct 2019 19:47:18 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 3/4] media: uapi: hevc: Add segment address field
Date:   Sat, 26 Oct 2019 19:47:02 +0200
Message-Id: <20191026174703.1120023-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191026174703.1120023-1-jernej.skrabec@siol.net>
References: <20191026174703.1120023-1-jernej.skrabec@siol.net>
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
index 382e85e16444..99e4a7099614 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -3971,6 +3971,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u32
       - ``data_bit_offset``
       - Offset (in bits) to the video data in the current slice data.
+    * - __u32
+      - ``slice_segment_addr``
+      -
     * - __u8
       - ``nal_unit_type``
       -
@@ -4048,7 +4051,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
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
2.23.0

