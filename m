Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB94F339EA8
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhCMOnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:53 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38955 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234049AbhCMOnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UKlV5gG; Sat, 13 Mar 2021 15:43:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646612; bh=rsrtkcUOWdqi6o1JV6lvGU5iGNo+VdAi4yqyPxRzHf4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ESf6f/+bCQg80rSHr90XOqi+BDG7RyG1YbdcJQ0q8bWVzpi1d7/YXNtH/Vndt2mh1
         PjN4BEOJy/NseclIJmeSUDHGO1Vj22dVGc1Cj47SfLZhb/8o/nIs7AGBrOlRgU4W+b
         lIGaWBNBo8xC3xXbUmTqvctjAzoseoMwHVChLl7RW62V09fXP27EQGbnAHeAHcS7/L
         4oDbsic5Dgxde7sjesplxrW8FXtkmROCVsGG7z+iWs/HFSoO1gN166aItoZyjbdzQF
         6cLkUNDDKwPxd4j4oC5MglO9qP/fbYbSkfhDmzfGz+/b+Prq4Ih8C/UWYWb8hJN0f5
         b6JZQRkDb+90w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 15/15] v4l2-controls.h: place all MPEG aliases under #ifndef __KERNEL__
Date:   Sat, 13 Mar 2021 15:43:23 +0100
Message-Id: <20210313144323.143600-16-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMsn8vxVIxOwfk1HBWm1Tn7DGMcFBFbrL2w9e7B7pn4zh+SRP2Jqi17Q8et5l39XyCF1q6dYvMVynpi6jD8GJZbtOnePYAy+v8vxRtTsu+FlLMzjey/I
 6Yf2reWeEQBe+OBiEXPcSX3xOiLByNfrsU33zfghVRd3mwxeQLH9Gq4GWugIjL4dJLGCBXrWgwo58BS8Sxu/56+i36P9vJr0RkaTCnESq9F/NQlsCuDMX4h3
 10pkzvNLw0uYhvnm1xXbFfx1pKTTozHVj9bmvjRoFUvRhpkEKQbLP/gkdVKcDKlCZifRrbV1VJpdbsMQnKHRrjJDCr7QxehVtEcM0E51Kv/9SHktNQQ5z8K1
 67fFE2fVamSR0HzbTdI6X+c/qRm4Xw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prevent kernel code from accidentally using the old MPEG aliases
by placing them all under #ifndef __KERNEL__.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/uapi/linux/v4l2-controls.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 2e8d450495fa..a70c39f191f4 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1652,16 +1652,10 @@ struct v4l2_ctrl_fwht_params {
 	__u32 quantization;
 };
 
-/* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
-#define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-#define V4L2_CID_MPEG_CLASS             V4L2_CID_CODEC_CLASS
-#define V4L2_CID_MPEG_BASE              V4L2_CID_CODEC_BASE
-#define V4L2_CID_MPEG_CX2341X_BASE      V4L2_CID_CODEC_CX2341X_BASE
-#define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
-#endif
-
 /*
+ * MPEG-compression definitions kept for backwards compatibility.
+ *
  * Originally all these controls and data structures where all called
  * MPEG, regardless for which codec they actually applied to. This was
  * due to historical reasons: the MPEG codec was the first added to V4L2,
@@ -1671,6 +1665,13 @@ struct v4l2_ctrl_fwht_params {
  * Now that MPEG has been replaced with CODEC, we still need to keep
  * the old names around to avoid breaking the ABI, hence these defines.
  */
+
+#define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
+#define V4L2_CID_MPEG_CLASS             V4L2_CID_CODEC_CLASS
+#define V4L2_CID_MPEG_BASE              V4L2_CID_CODEC_BASE
+#define V4L2_CID_MPEG_CX2341X_BASE      V4L2_CID_CODEC_CX2341X_BASE
+#define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
+
 #define v4l2_mpeg_stream_type v4l2_codec_stream_type
 #define V4L2_MPEG_STREAM_TYPE_MPEG2_PS V4L2_CODEC_STREAM_TYPE_MPEG2_PS
 #define V4L2_MPEG_STREAM_TYPE_MPEG2_TS V4L2_CODEC_STREAM_TYPE_MPEG2_TS
@@ -2230,3 +2231,5 @@ struct v4l2_ctrl_fwht_params {
 #define v4l2_cid_mpeg_video_hevc_size_of_length_field v4l2_codec_video_hevc_size_of_length_field
 
 #endif
+
+#endif
-- 
2.30.1

