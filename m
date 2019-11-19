Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5AD102334
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 12:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbfKSLfC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 06:35:02 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47053 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728033AbfKSLfA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 06:35:00 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X1mbiD68Hcs92X1mdiz4Sy; Tue, 19 Nov 2019 12:34:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574163299; bh=L0hyTpq0XQ9K6Y83XUf3xue75BrjWO04JtCr4SS+YD8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Ps2BPSYmx3VzLPHimjYhvdRXuerX35iQTdF8/M18Tfd4PBNGSOPPEkte/5BVmN9Ee
         EFSJI+Be9MTOUt8GEZ0IPqQdrhep3bnZV77fgU1mkv8K34FdzDnMK+j8BCzuAatraS
         vVoeD7ufGXehMsLvhAGmw/SuncW7fl9qnI6P+89Dq/NJ2sCgu1O0d9+IrGsOYNFb79
         cYqE4KF8eAWvd8BQyFjK+ReeYjHonSnYdLDl2oci7v/uOoSjRVWVFpg78Q3rscBOv8
         wqFbFkoW9X/fwlKjxeaARvKKwsHQwEmGrCI1NUWfZrU7Ciz/Y/N1pO/pTWrte+eehJ
         1m7VjXxe1aB9A==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/5] v4l2-controls.h: add V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
Date:   Tue, 19 Nov 2019 12:34:55 +0100
Message-Id: <20191119113457.57833-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
References: <20191119113457.57833-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfI3Y7RpXC/Wtf53twy38gnVrmrCf/NxR/mfk5WuOJGz6yvR4rJaOru7QsBt0gc21ygyDJ44w6zvd7OpHENeWMom0uyt5K8y3Vs0NwCrvfM0oB02g0VYV
 lLoX1MSSe/JZ+jXSUHM+DPkUXVtXG9IXkgelmJVvZ1rQrfwMTjkPJfDvHGug6W+diFRvHrFkX2KGnW3jdDRdlbHDIwPFG3YFfKyU/zWDiXliri8tsyFV2T/b
 EvYh774a3AWXTOZpI2S452Uo8/RiYj0KTaKKpHhZVRHsyAWaJDLNaCr1U0F226NFPScRVlvYjtJxZUI6VQCP0g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new control to specify the frame rate that a HW encoder
should assume. This is one of the parameters that determines the
compression ratio.

In the past drivers used G/S_PARM for this, but that should be
used to set the speed at which userspace sends frames to the encoder
and it can be used to schedule encoding hardware if there are
multiple encoder cores.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 8 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c             | 4 ++++
 include/uapi/linux/v4l2-controls.h               | 1 +
 3 files changed, 13 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index 28313c0f4e7c..3bf11f45e20f 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -592,6 +592,14 @@ enum v4l2_mpeg_video_bitrate_mode -
     the average video bitrate. It is ignored if the video bitrate mode
     is set to constant bitrate.
 
+``V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE (struct)``
+    The frame rate of the to-be-encoded frames. This information is needed
+    by hardware encoders in order to compress the video stream correctly.
+
+    This control is in frames per second and is represented as a fraction.
+    The struct :c:type:`v4l2_fract` provides the numerator and the denominator
+    of the frame rate.
+
 ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
     For every captured frame, skip this many subsequent frames (default
     0).
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index af74609dce0a..863a8fdce99d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -904,6 +904,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
+	case V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE:		return "Encoder Frame Rate";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
@@ -1411,6 +1412,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE:
+		*type = V4L2_CTRL_TYPE_FRACT;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5a7bedee2b0e..e4a42e4e293e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -408,6 +408,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
+#define V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE		(V4L2_CID_MPEG_BASE+230)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
-- 
2.23.0

