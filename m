Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 892BB376162
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 09:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235674AbhEGHrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 03:47:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50355 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235644AbhEGHrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 03:47:18 -0400
X-UUID: 62706ea722014782a04f4311e7cc5cf4-20210507
X-UUID: 62706ea722014782a04f4311e7cc5cf4-20210507
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 902719970; Fri, 07 May 2021 15:46:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 15:46:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 May 2021 15:46:11 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
        <arnd@arndb.de>, <louis.kuo@mediatek.com>,
        <sergey.senozhatsky@gmail.com>, <helen.koike@collabora.com>,
        <niklas.soderlund+renesas@ragnatech.se>, <yepeilin.cs@gmail.com>
CC:     <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [RESENT PATCH V0 1/4] media: v4l2-core: extend the v4l2 format to support request
Date:   Fri, 7 May 2021 15:46:01 +0800
Message-ID: <20210507074604.15079-2-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210507074604.15079-1-louis.kuo@mediatek.com>
References: <20210507074604.15079-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1590EAC639185F97FF7E7A490355A9923F682F90A2528AD627AE965E692FF2B72000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is to extend the related interface to support the request-based
operations. We added request fd to the parameters of MEDIA_IOC_SETUP_LINK,
VIDIOC_S_FMT, VIDIOC_SUBDEV_S_SELECTION, VIDIOC_SUBDEV_S_FMT.
The driver uses media_request_get_by_fd() to retrieve the media request and
save the pending change in it, so that we can apply the pending change in
req_queue() callback then.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 drivers/media/mc/mc-device.c         | 7 ++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
 include/media/media-entity.h         | 3 +++
 include/uapi/linux/media.h           | 3 ++-
 include/uapi/linux/v4l2-subdev.h     | 3 ++-
 include/uapi/linux/videodev2.h       | 8 ++++++--
 6 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 9e56d2ad6b94..f46ae4c38102 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -203,6 +203,7 @@ static long media_device_setup_link(struct media_device *mdev, void *arg)
 	struct media_link *link = NULL;
 	struct media_entity *source;
 	struct media_entity *sink;
+	int ret;
 
 	/* Find the source and sink entities and link.
 	 */
@@ -221,10 +222,14 @@ static long media_device_setup_link(struct media_device *mdev, void *arg)
 	if (link == NULL)
 		return -EINVAL;
 
+	link->request_fd = linkd->request_fd;
 	memset(linkd->reserved, 0, sizeof(linkd->reserved));
 
 	/* Setup the link on both entities. */
-	return __media_entity_setup_link(link, linkd->flags);
+	ret = __media_entity_setup_link(link, linkd->flags);
+	link->request_fd = 0;
+
+	return ret;
 }
 
 static long media_device_get_topology(struct media_device *mdev, void *arg)
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2673f51aafa4..823ebd175f3a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1634,7 +1634,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (unlikely(!ops->vidioc_s_fmt_vid_cap_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
@@ -1665,7 +1665,7 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (unlikely(!ops->vidioc_s_fmt_vid_out_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
@@ -1736,7 +1736,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (unlikely(!ops->vidioc_try_fmt_vid_cap_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
@@ -1767,7 +1767,7 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (unlikely(!ops->vidioc_try_fmt_vid_out_mplane))
 			break;
-		CLEAR_AFTER_FIELD(p, fmt.pix_mp.xfer_func);
+		CLEAR_AFTER_FIELD(p, fmt.pix_mp.request_fd);
 		for (i = 0; i < p->fmt.pix_mp.num_planes; i++)
 			CLEAR_AFTER_FIELD(&p->fmt.pix_mp.plane_fmt[i],
 					  bytesperline);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 09737b47881f..30ad665c4413 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -128,6 +128,8 @@ struct media_pipeline {
  *		link.
  * @flags:	Link flags, as defined in uapi/media.h (MEDIA_LNK_FL_*)
  * @is_backlink: Indicate if the link is a backlink.
+ * @request_fd: The media request triggered the media link change, it is only
+ *		meaningful in media_device_setup_link()
  */
 struct media_link {
 	struct media_gobj graph_obj;
@@ -145,6 +147,7 @@ struct media_link {
 	struct media_link *reverse;
 	unsigned long flags;
 	bool is_backlink;
+	int request_fd;
 };
 
 /**
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 200fa8462b90..a331f80afe2d 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -231,7 +231,8 @@ struct media_link_desc {
 	struct media_pad_desc source;
 	struct media_pad_desc sink;
 	__u32 flags;
-	__u32 reserved[2];
+	__s32 request_fd;
+	__u32 reserved[1];
 };
 
 struct media_links_enum {
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 658106f5b5dc..d6ffd5981c68 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -50,7 +50,8 @@ struct v4l2_subdev_format {
 	__u32 which;
 	__u32 pad;
 	struct v4l2_mbus_framefmt format;
-	__u32 reserved[8];
+	__s32 request_fd;
+	__u32 reserved[7];
 };
 
 /**
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 311a01cc5775..6641194b3fab 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1246,6 +1246,7 @@ struct v4l2_crop {
  *		defined in v4l2-common.h; V4L2_SEL_TGT_* .
  * @flags:	constraints flags, defined in v4l2-common.h; V4L2_SEL_FLAG_*.
  * @r:		coordinates of selection window
+ * @request_fd: fd of the request that trigger the set selection operation
  * @reserved:	for future use, rounds structure size to 64 bytes, set to zero
  *
  * Hardware may use multiple helper windows to process a video stream.
@@ -1257,7 +1258,8 @@ struct v4l2_selection {
 	__u32			target;
 	__u32                   flags;
 	struct v4l2_rect        r;
-	__u32                   reserved[9];
+	__s32			request_fd;
+	__u32                   reserved[8];
 };
 
 
@@ -2266,6 +2268,7 @@ struct v4l2_plane_pix_format {
  * @hsv_enc:		enum v4l2_hsv_encoding, HSV encoding
  * @quantization:	enum v4l2_quantization, colorspace quantization
  * @xfer_func:		enum v4l2_xfer_func, colorspace transfer function
+ * @request_fd:	fd of the request that trigger the set format operation
  * @reserved:		drivers and applications must zero this array
  */
 struct v4l2_pix_format_mplane {
@@ -2284,7 +2287,8 @@ struct v4l2_pix_format_mplane {
 	};
 	__u8				quantization;
 	__u8				xfer_func;
-	__u8				reserved[7];
+	__s32				request_fd;
+	__u8				reserved[3];
 } __attribute__ ((packed));
 
 /**
-- 
2.18.0

