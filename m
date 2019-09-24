Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0774FBCA4C
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 16:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406364AbfIXOfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 10:35:36 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:35803 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2441382AbfIXOff (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 10:35:35 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2577:813c:89fd:7ccb:168c])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CluaiEzGfz6EACluei89sb; Tue, 24 Sep 2019 16:35:32 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv5 1/3] v4l2-core: correctly validate video and metadata ioctls
Date:   Tue, 24 Sep 2019 16:35:26 +0200
Message-Id: <20190924143528.121869-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190924143528.121869-1-hverkuil-cisco@xs4all.nl>
References: <20190924143528.121869-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFBqh5I03CZM/RXifRsM/uHUzImoFe052d3IrU98GZDW4xZz7TsvuZBng2b17A/i1QT2U7uJixHM0wbsWeRwdnxZ39AK9drQi1a979E4T6LDFCBA9xdf
 KptiI/A7EpVUIMereA5YSIFRjpSnC/OAnY30nBNG4fIfWQsO1R3aohPo18dCx5icZ7tgxUMGDyThVK4IZzhW6782f3uWc9tw02+AY/JBj1cJtw7sQcBcznNo
 n3LKeI8mLMWjRRG9Vcq9hGYhLgq6B2CMAyXFQUIPDQsIFIczG5dK0oRBhZJaHKHGLyevdA0vCaQrX22Roc8RJjRSmKO20sSpA8zbRntpV4BM9m+wHK4a6tUw
 B7f/pn4gGB/sy5y4dk1sZq6QZBd65ei8ibUtJwDoWeAcTTYD+oaytQCnE/NXsW58Sr0dxcVZ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vandana BN <bnvandana@gmail.com>

If the type is VFL_TYPE_GRABBER, then also check device_caps
to see if the video device supports video and/or metadata and
disable unneeded ioctls.

Without this change, format ioctls for both video and metadata devices
could be called on both device nodes. This is true for other ioctls as
well, even if the device supports only video or metadata.

Metadata devices act similar to VBI devices w.r.t. which ioctls should
be enabled. This makes sense since VBI *is* metadata.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
Co-Developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 65 +++++++++++++++++-----------
 drivers/media/v4l2-core/v4l2-ioctl.c | 16 +++++--
 2 files changed, 53 insertions(+), 28 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 4037689a945a..db1e3d5e0a44 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -533,13 +533,23 @@ static int get_index(struct video_device *vdev)
  */
 static void determine_valid_ioctls(struct video_device *vdev)
 {
+	const u32 vid_caps = V4L2_CAP_VIDEO_CAPTURE |
+			     V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			     V4L2_CAP_VIDEO_OUTPUT |
+			     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+			     V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE;
+	const u32 meta_caps = V4L2_CAP_META_CAPTURE |
+			      V4L2_CAP_META_OUTPUT;
 	DECLARE_BITMAP(valid_ioctls, BASE_VIDIOC_PRIVATE);
 	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
-	bool is_vid = vdev->vfl_type == VFL_TYPE_GRABBER;
+	bool is_vid = vdev->vfl_type == VFL_TYPE_GRABBER &&
+		      (vdev->device_caps & vid_caps);
 	bool is_vbi = vdev->vfl_type == VFL_TYPE_VBI;
 	bool is_radio = vdev->vfl_type == VFL_TYPE_RADIO;
 	bool is_sdr = vdev->vfl_type == VFL_TYPE_SDR;
 	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
+	bool is_meta = vdev->vfl_type == VFL_TYPE_GRABBER &&
+		       (vdev->device_caps & meta_caps);
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 
@@ -587,39 +597,31 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
 
 	if (is_vid || is_tch) {
-		/* video and metadata specific ioctls */
+		/* video and touch specific ioctls */
 		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
-			       ops->vidioc_enum_fmt_vid_overlay ||
-			       ops->vidioc_enum_fmt_meta_cap)) ||
-		    (is_tx && (ops->vidioc_enum_fmt_vid_out ||
-			       ops->vidioc_enum_fmt_meta_out)))
+			       ops->vidioc_enum_fmt_vid_overlay)) ||
+		    (is_tx && ops->vidioc_enum_fmt_vid_out))
 			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_g_fmt_vid_cap ||
 			       ops->vidioc_g_fmt_vid_cap_mplane ||
-			       ops->vidioc_g_fmt_vid_overlay ||
-			       ops->vidioc_g_fmt_meta_cap)) ||
+			       ops->vidioc_g_fmt_vid_overlay)) ||
 		    (is_tx && (ops->vidioc_g_fmt_vid_out ||
 			       ops->vidioc_g_fmt_vid_out_mplane ||
-			       ops->vidioc_g_fmt_vid_out_overlay ||
-			       ops->vidioc_g_fmt_meta_out)))
+			       ops->vidioc_g_fmt_vid_out_overlay)))
 			 set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_s_fmt_vid_cap ||
 			       ops->vidioc_s_fmt_vid_cap_mplane ||
-			       ops->vidioc_s_fmt_vid_overlay ||
-			       ops->vidioc_s_fmt_meta_cap)) ||
+			       ops->vidioc_s_fmt_vid_overlay)) ||
 		    (is_tx && (ops->vidioc_s_fmt_vid_out ||
 			       ops->vidioc_s_fmt_vid_out_mplane ||
-			       ops->vidioc_s_fmt_vid_out_overlay ||
-			       ops->vidioc_s_fmt_meta_out)))
+			       ops->vidioc_s_fmt_vid_out_overlay)))
 			 set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
 		if ((is_rx && (ops->vidioc_try_fmt_vid_cap ||
 			       ops->vidioc_try_fmt_vid_cap_mplane ||
-			       ops->vidioc_try_fmt_vid_overlay ||
-			       ops->vidioc_try_fmt_meta_cap)) ||
+			       ops->vidioc_try_fmt_vid_overlay)) ||
 		    (is_tx && (ops->vidioc_try_fmt_vid_out ||
 			       ops->vidioc_try_fmt_vid_out_mplane ||
-			       ops->vidioc_try_fmt_vid_out_overlay ||
-			       ops->vidioc_try_fmt_meta_out)))
+			       ops->vidioc_try_fmt_vid_out_overlay)))
 			 set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_OVERLAY, vidioc_overlay);
 		SET_VALID_IOCTL(ops, VIDIOC_G_FBUF, vidioc_g_fbuf);
@@ -641,7 +643,21 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			set_bit(_IOC_NR(VIDIOC_S_CROP), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_G_SELECTION, vidioc_g_selection);
 		SET_VALID_IOCTL(ops, VIDIOC_S_SELECTION, vidioc_s_selection);
-	} else if (is_vbi) {
+	}
+	if (is_meta && is_rx) {
+		/* metadata capture specific ioctls */
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_cap);
+	} else if (is_meta && is_tx) {
+		/* metadata output specific ioctls */
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_meta_out);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_meta_out);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
+	}
+	if (is_vbi) {
 		/* vbi specific ioctls */
 		if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
 			       ops->vidioc_g_fmt_sliced_vbi_cap)) ||
@@ -681,8 +697,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
 	}
 
-	if (is_vid || is_vbi || is_sdr || is_tch) {
-		/* ioctls valid for video, metadata, vbi or sdr */
+	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
+		/* ioctls valid for video, vbi, sdr, touch and metadata */
 		SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
 		SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
 		SET_VALID_IOCTL(ops, VIDIOC_QBUF, vidioc_qbuf);
@@ -694,8 +710,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
 	}
 
-	if (is_vid || is_vbi || is_tch) {
-		/* ioctls valid for video or vbi */
+	if (is_vid || is_vbi || is_tch || is_meta) {
+		/* ioctls valid for video, vbi, touch and metadata */
 		if (ops->vidioc_s_std)
 			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_STD, vidioc_s_std);
@@ -719,8 +735,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
 		}
-		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_GRABBER &&
-					ops->vidioc_g_std))
+		if (ops->vidioc_g_parm || ops->vidioc_g_std)
 			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
 		SET_VALID_IOCTL(ops, VIDIOC_S_DV_TIMINGS, vidioc_s_dv_timings);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f..20b3107dd4e8 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -932,12 +932,22 @@ static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
 
 static int check_fmt(struct file *file, enum v4l2_buf_type type)
 {
+	const u32 vid_caps = V4L2_CAP_VIDEO_CAPTURE |
+			     V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			     V4L2_CAP_VIDEO_OUTPUT |
+			     V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+			     V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE;
+	const u32 meta_caps = V4L2_CAP_META_CAPTURE |
+			      V4L2_CAP_META_OUTPUT;
 	struct video_device *vfd = video_devdata(file);
 	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
-	bool is_vid = vfd->vfl_type == VFL_TYPE_GRABBER;
+	bool is_vid = vfd->vfl_type == VFL_TYPE_GRABBER &&
+		      (vfd->device_caps & vid_caps);
 	bool is_vbi = vfd->vfl_type == VFL_TYPE_VBI;
 	bool is_sdr = vfd->vfl_type == VFL_TYPE_SDR;
 	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
+	bool is_meta = vfd->vfl_type == VFL_TYPE_GRABBER &&
+		       (vfd->device_caps & meta_caps);
 	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
 
@@ -996,11 +1006,11 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
-		if (is_vid && is_rx && ops->vidioc_g_fmt_meta_cap)
+		if (is_meta && is_rx && ops->vidioc_g_fmt_meta_cap)
 			return 0;
 		break;
 	case V4L2_BUF_TYPE_META_OUTPUT:
-		if (is_vid && is_tx && ops->vidioc_g_fmt_meta_out)
+		if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
 			return 0;
 		break;
 	default:
-- 
2.23.0.rc1

