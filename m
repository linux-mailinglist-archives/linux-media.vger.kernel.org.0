Return-Path: <linux-media+bounces-48-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129677E7F21
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE47E281B9A
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2CD3B7B1;
	Fri, 10 Nov 2023 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13B39843
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:47:00 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C049B7290;
	Thu,  9 Nov 2023 22:28:11 -0800 (PST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 731C9200AF3;
	Fri, 10 Nov 2023 07:28:10 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0DCC4201C42;
	Fri, 10 Nov 2023 07:28:10 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 18AB9183AD44;
	Fri, 10 Nov 2023 14:28:08 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 12/15] media: uapi: Declare interface types for Audio
Date: Fri, 10 Nov 2023 13:48:06 +0800
Message-Id: <1699595289-25773-13-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Declare the interface types that will be used by Audio.
The type is MEDIA_INTF_T_V4L_AUDIO.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/mediactl/media-types.rst    |  4 ++++
 drivers/media/v4l2-core/v4l2-dev.c                  |  4 ++++
 drivers/media/v4l2-core/v4l2-mem2mem.c              | 13 +++++++++----
 include/uapi/linux/media.h                          |  1 +
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 0ffeece1e0c8..3f0bcb18a5ca 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -322,6 +322,10 @@ Types and flags used to represent the media graph elements
        -  Device node interface for Touch device (V4L)
        -  typically, /dev/v4l-touch?
 
+    *  -  ``MEDIA_INTF_T_V4L_AUDIO``
+       -  Device node interface for Audio device (V4L)
+       -  typically, /dev/v4l-audio?
+
     *  -  ``MEDIA_INTF_T_ALSA_PCM_CAPTURE``
        -  Device node interface for ALSA PCM Capture
        -  typically, /dev/snd/pcmC?D?c
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b92c760b611a..c3a7d974db26 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -842,6 +842,10 @@ static int video_register_media_controller(struct video_device *vdev)
 		intf_type = MEDIA_INTF_T_V4L_SUBDEV;
 		/* Entity will be created via v4l2_device_register_subdev() */
 		break;
+	case VFL_TYPE_AUDIO:
+		intf_type = MEDIA_INTF_T_V4L_AUDIO;
+		/* Entity will be created via v4l2_device_register_subdev() */
+		break;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 0cc30397fbad..bf41d112b742 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1134,10 +1134,15 @@ int v4l2_m2m_register_media_controller(struct v4l2_m2m_dev *m2m_dev,
 	if (ret)
 		goto err_rm_links0;
 
-	/* Create video interface */
-	m2m_dev->intf_devnode = media_devnode_create(mdev,
-			MEDIA_INTF_T_V4L_VIDEO, 0,
-			VIDEO_MAJOR, vdev->minor);
+	if (vdev->vfl_type == VFL_TYPE_AUDIO)
+		m2m_dev->intf_devnode = media_devnode_create(mdev,
+				MEDIA_INTF_T_V4L_AUDIO, 0,
+				VIDEO_MAJOR, vdev->minor);
+	else
+		/* Create video interface */
+		m2m_dev->intf_devnode = media_devnode_create(mdev,
+				MEDIA_INTF_T_V4L_VIDEO, 0,
+				VIDEO_MAJOR, vdev->minor);
 	if (!m2m_dev->intf_devnode) {
 		ret = -ENOMEM;
 		goto err_rm_links1;
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..9ff6dec7393a 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -260,6 +260,7 @@ struct media_links_enum {
 #define MEDIA_INTF_T_V4L_SUBDEV			(MEDIA_INTF_T_V4L_BASE + 3)
 #define MEDIA_INTF_T_V4L_SWRADIO		(MEDIA_INTF_T_V4L_BASE + 4)
 #define MEDIA_INTF_T_V4L_TOUCH			(MEDIA_INTF_T_V4L_BASE + 5)
+#define MEDIA_INTF_T_V4L_AUDIO			(MEDIA_INTF_T_V4L_BASE + 6)
 
 #define MEDIA_INTF_T_ALSA_BASE			0x00000300
 #define MEDIA_INTF_T_ALSA_PCM_CAPTURE		(MEDIA_INTF_T_ALSA_BASE)
-- 
2.34.1


