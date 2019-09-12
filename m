Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B410AB09DE
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 10:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729627AbfILIG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 04:06:28 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41147 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfILIG2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 04:06:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so11438037pls.8
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2019 01:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TR/LYQk8mVvayDum5wIiSX4PUmNBSbULXqy+pHNTG4I=;
        b=Cl4oFn/1ZOTd3BBswNI7RwRQCm8CoVAzKW6sa7UWXHgU2rrzqszDcnDVhXMWXoYir8
         ZoWcnJFeyp4sWzV3LUtjUqwKO2JMwPoojmfOOdNifj6kHYEXul1d4uDttPmSjpPGHx+K
         5d4M8/cpfsGu2lDCg/I3JD/XJHmjq1Iw8ULXcCpAbtsyv37kpFhKAbBwY00lZrcSpdu0
         sRNzUnaw16IvXCXt6ad9VlIemS2A+tJKlSDBj3lzzW7G8GrCf5cp0r5FWaPnoTPOmoLW
         Oy/JU9/X81h02ccqW+OXKX+nyln/X+G/Nz3h0IkHJ59LWJMhW6bGpkULDlNn5pyXESfm
         +xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TR/LYQk8mVvayDum5wIiSX4PUmNBSbULXqy+pHNTG4I=;
        b=MAFkLMxcXy/5mIVMwBLV2ko9nIxoom2lKAH5couibO3aXAwYhXmeQLOxuz12TKXoCt
         nNVLiOfhXtHrBGdSQrz5Nc6ei2Mqn7hGqKz/IVAzWjO3OMHcZ3biqOP/jmvZuZbPGOpC
         OECV89RAKMzvTFwcIGF5sK7U/r/K7S1LT87QoMAtRQ79gr8GBwYdDgIcQBDsQuVFgTDN
         K1LQOK2C5m5/kvtFeMLctvBqiM4gqtOnQlB1+q3TZligjkPr8XgbXl6iJOc9qiH5c9gn
         FRVnh/KnXvxX+kD0bg8Rm6zm6c+MOOFFAOXDMzf+h9e+B2pZGVcytbZP6KrYfDeJ1Fn8
         EAwQ==
X-Gm-Message-State: APjAAAVobalP9r5HgIBlzlzq/t2CjRDmhYTXC70mhjglfd05SuI3/EVa
        UTstLLqd4LqYL2+AfCHcQLeNrUBq5zk=
X-Google-Smtp-Source: APXvYqxSKvxvxR9bMvG8Kr9kI6oK2YPYDUNKe0Hf/OIYEekdcJUHIz4l1DM/LCiJcrUQ5fRwnD6l9g==
X-Received: by 2002:a17:902:bb91:: with SMTP id m17mr13635145pls.267.1568275587272;
        Thu, 12 Sep 2019 01:06:27 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.248.75.33])
        by smtp.gmail.com with ESMTPSA id r23sm3863760pjo.22.2019.09.12.01.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 01:06:26 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] v4l2-core: Add metadata type to vfl_devnode_type.
Date:   Thu, 12 Sep 2019 13:36:07 +0530
Message-Id: <20190912080607.4768-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5234da10-2d65-b050-69bf-abe26d50ebbf@xs4all.nl>
References: <5234da10-2d65-b050-69bf-abe26d50ebbf@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add VFL_TYPE_METADATA, to detect devices of type metadata and
to disable unneeded ioctls.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/v4l2-core/v4l2-dev.c   | 57 ++++++++++++++++++----------
 drivers/media/v4l2-core/v4l2-ioctl.c |  5 ++-
 include/media/v4l2-dev.h             |  2 +
 3 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 4037689a945a..5f2ead772c5f 100644
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
 
@@ -571,8 +575,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
 	if (vdev->ctrl_handler || ops->vidioc_querymenu)
 		set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
-	SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
-	SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
+	if (!is_meta) {
+		SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
+	}
 	SET_VALID_IOCTL(ops, VIDIOC_LOG_STATUS, vidioc_log_status);
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	set_bit(_IOC_NR(VIDIOC_DBG_G_CHIP_INFO), valid_ioctls);
@@ -589,37 +595,29 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	if (is_vid || is_tch) {
 		/* video and metadata specific ioctls */
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
@@ -679,9 +677,23 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
 		if (ops->vidioc_try_fmt_sdr_out)
 			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+	} else if (is_meta) {
+		/* metadata specific ioctls */
+		if ((is_rx && ops->vidioc_enum_fmt_meta_cap) ||
+		    (is_tx && ops->vidioc_enum_fmt_meta_out))
+			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
+		if ((is_rx && ops->vidioc_g_fmt_meta_cap) ||
+		    (is_tx && ops->vidioc_g_fmt_meta_out))
+			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
+		if ((is_rx && ops->vidioc_s_fmt_meta_cap) ||
+		    (is_tx && ops->vidioc_s_fmt_meta_out))
+			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
+		if ((is_rx && ops->vidioc_try_fmt_meta_cap) ||
+		    (is_tx && ops->vidioc_try_fmt_meta_out))
+			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
 	}
 
-	if (is_vid || is_vbi || is_sdr || is_tch) {
+	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
 		/* ioctls valid for video, metadata, vbi or sdr */
 		SET_VALID_IOCTL(ops, VIDIOC_REQBUFS, vidioc_reqbufs);
 		SET_VALID_IOCTL(ops, VIDIOC_QUERYBUF, vidioc_querybuf);
@@ -734,7 +746,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_MODULATOR, vidioc_g_modulator);
 		SET_VALID_IOCTL(ops, VIDIOC_S_MODULATOR, vidioc_s_modulator);
 	}
-	if (is_rx) {
+	if (is_rx && !is_meta) {
 		/* receiver only ioctls */
 		SET_VALID_IOCTL(ops, VIDIOC_G_TUNER, vidioc_g_tuner);
 		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
@@ -762,6 +774,7 @@ static int video_register_media_controller(struct video_device *vdev)
 
 	switch (vdev->vfl_type) {
 	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_METADATA:
 		intf_type = MEDIA_INTF_T_V4L_VIDEO;
 		vdev->entity.function = MEDIA_ENT_F_IO_V4L;
 		break;
@@ -870,6 +883,7 @@ int __video_register_device(struct video_device *vdev,
 	/* Part 1: check device type */
 	switch (type) {
 	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_METADATA:
 		name_base = "video";
 		break;
 	case VFL_TYPE_VBI:
@@ -914,6 +928,7 @@ int __video_register_device(struct video_device *vdev,
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
2.17.1

