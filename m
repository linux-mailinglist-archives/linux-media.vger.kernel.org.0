Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D552B4F66
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 15:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfIQNgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 09:36:54 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:48259 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728294AbfIQNgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 09:36:53 -0400
Received: from test-nl.fritz.box ([80.101.105.217])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ADexixpvVV17OADf1iLHkn; Tue, 17 Sep 2019 15:36:51 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv4 1/3] v4l2-core: Add metadata type to vfl_devnode_type
Date:   Tue, 17 Sep 2019 15:36:45 +0200
Message-Id: <20190917133647.17533-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
References: <20190917133647.17533-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLFjHL/S3/dDsbzzbdvSIj6EpMuVP+Cvx1Mprec3OGrqLkTRiInL6Vf9WxQms4SW8rleTTrx/IbnCN8s7svlqPy123KEmJU7noyeQOuyrXNEqrG8iw3+
 AHEdDHg+nHheZBB5XiExIfTJzBo8UyHNIjvjd2IWDhuyYn7mr+4Z2oJJtIE63sO8hMsQbS537e8I7F+OUmsE1vvH+D2aae3W0l4J/lI/tyCQtjGdgBu2+KCH
 3jcPFjunr9g3ilkNXHy/xSIF4Q+egyibNrMGeaDJDza6g+jNExdckao/mWPD5c4SswDvwLbNMpQ+Gjx7bWAKUoYWPjEPJdBwuFQC//lr33txec+WOgB/jtXO
 /18qFi7O
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vandana BN <bnvandana@gmail.com>

Add VFL_TYPE_METADATA, to detect devices of type metadata and
to disable unneeded ioctls.

Without this change, format ioctls for both video and metadata devices
could be called on both device nodes. This is true for other ioctls as
well.

Metadata devices act similar to VBI devices w.r.t. which ioctls should
be enabled. This makes sense since VBI *is* metadata.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
Co-Developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 58 ++++++++++++++++------------
 drivers/media/v4l2-core/v4l2-ioctl.c |  5 ++-
 include/media/v4l2-dev.h             |  2 +
 3 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 4037689a945a..27b93280d342 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -112,6 +112,7 @@ static inline unsigned long *devnode_bits(enum vfl_devnode_type vfl_type)
 	   one single bitmap for the purposes of finding a free node number
 	   since all those unassigned types use the same minor range. */
 	int idx = (vfl_type > VFL_TYPE_RADIO) ? VFL_TYPE_MAX - 1 : vfl_type;
+	idx = (vfl_type == VFL_TYPE_METADATA) ? VFL_TYPE_GRABBER : vfl_type;
 
 	return devnode_nums[idx];
 }
@@ -119,7 +120,9 @@ static inline unsigned long *devnode_bits(enum vfl_devnode_type vfl_type)
 /* Return the bitmap corresponding to vfl_type. */
 static inline unsigned long *devnode_bits(enum vfl_devnode_type vfl_type)
 {
-	return devnode_nums[vfl_type];
+	int idx = (vfl_type == VFL_TYPE_METADATA) ? VFL_TYPE_GRABBER : vfl_type;
+
+	return devnode_nums[idx];
 }
 #endif
 
@@ -540,6 +543,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	bool is_radio = vdev->vfl_type == VFL_TYPE_RADIO;
 	bool is_sdr = vdev->vfl_type == VFL_TYPE_SDR;
 	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
+	bool is_meta = vdev->vfl_type == VFL_TYPE_METADATA;
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 
@@ -587,39 +591,31 @@ static void determine_valid_ioctls(struct video_device *vdev)
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
@@ -679,10 +675,22 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
 		if (ops->vidioc_try_fmt_sdr_out)
 			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+	} else if (is_meta && is_rx) {
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
 	}
 
-	if (is_vid || is_vbi || is_sdr || is_tch) {
-		/* ioctls valid for video, metadata, vbi or sdr */
+	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
+		/* ioctls valid for video, vbi, sdr, touch and metadata */
 		SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
 		SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
 		SET_VALID_IOCTL(ops, VIDIOC_QBUF, vidioc_qbuf);
@@ -694,8 +702,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
 	}
 
-	if (is_vid || is_vbi || is_tch) {
-		/* ioctls valid for video or vbi */
+	if (is_vid || is_vbi || is_tch || is_meta) {
+		/* ioctls valid for video, vbi, touch and metadata */
 		if (ops->vidioc_s_std)
 			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_STD, vidioc_s_std);
@@ -719,8 +727,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
 		}
-		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_GRABBER &&
-					ops->vidioc_g_std))
+		if (ops->vidioc_g_parm || ops->vidioc_g_std)
 			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
 		SET_VALID_IOCTL(ops, VIDIOC_S_DV_TIMINGS, vidioc_s_dv_timings);
@@ -762,6 +769,7 @@ static int video_register_media_controller(struct video_device *vdev)
 
 	switch (vdev->vfl_type) {
 	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_METADATA:
 		intf_type = MEDIA_INTF_T_V4L_VIDEO;
 		vdev->entity.function = MEDIA_ENT_F_IO_V4L;
 		break;
@@ -870,6 +878,7 @@ int __video_register_device(struct video_device *vdev,
 	/* Part 1: check device type */
 	switch (type) {
 	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_METADATA:
 		name_base = "video";
 		break;
 	case VFL_TYPE_VBI:
@@ -914,6 +923,7 @@ int __video_register_device(struct video_device *vdev,
 	 * (new style). */
 	switch (type) {
 	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_METADATA:
 		minor_offset = 0;
 		minor_cnt = 64;
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f..0d71c06c82cf 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -938,6 +938,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 	bool is_vbi = vfd->vfl_type == VFL_TYPE_VBI;
 	bool is_sdr = vfd->vfl_type == VFL_TYPE_SDR;
 	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
+	bool is_meta = vfd->vfl_type == VFL_TYPE_METADATA;
 	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
 
@@ -996,11 +997,11 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
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
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 48531e57cc5a..2da91d454c10 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -30,6 +30,7 @@
  * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
  * @VFL_TYPE_SDR:	for Software Defined Radio tuners
  * @VFL_TYPE_TOUCH:	for touch sensors
+ * @VFL_TYPE_METADATA:	for Metadata device
  * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
  */
 enum vfl_devnode_type {
@@ -39,6 +40,7 @@ enum vfl_devnode_type {
 	VFL_TYPE_SUBDEV,
 	VFL_TYPE_SDR,
 	VFL_TYPE_TOUCH,
+	VFL_TYPE_METADATA,
 	VFL_TYPE_MAX /* Shall be the last one */
 };
 
-- 
2.20.1

