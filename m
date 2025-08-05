Return-Path: <linux-media+bounces-38945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348AB1BB84
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 22:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FCDF185858
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 20:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BCA230278;
	Tue,  5 Aug 2025 20:47:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310F52F2E;
	Tue,  5 Aug 2025 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754426878; cv=none; b=D1KYQ99eed4dVPSJvF3nTSP9EeN1MrmjkEP6RMHjo6a1vEWef5MZPGq5Z2yieFRGZ2Dqw9lqBfbgqDd3iexsRhysXDCmWSN2dgttGOKpSaYCnvPJoZe9D0mTnRMDcgDbeuZNIoob9RfnCf5Lhb3e9JZa7v11MuzYjhqkI/lKOow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754426878; c=relaxed/simple;
	bh=amCV64pPxjnHkNFYTYcY55fRdYYPOsxAfjuR2zyZHXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWlBa/pv3fUfFv6esLQUks7Mh06GaDEiQRIJLpYy8vj7d7xvy0qhbel2P6pqD3rLX/9Vtxc9bXQVMv1vyQh7VdYajhekneUbKOkD5kIK5Fmie9CmLUJ6z//AERvFwiDWxciLmp/vtsRtcR5CCjTfkD0OpXEWG7qFoJYYsXhFHdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 3CE0A1F0003D;
	Tue,  5 Aug 2025 20:47:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B23E9B011F2; Tue,  5 Aug 2025 20:47:53 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 73B2BB011F2;
	Tue,  5 Aug 2025 20:47:19 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 2/2] media: uapi: Cleanup tab after define in headers
Date: Tue,  5 Aug 2025 22:47:18 +0200
Message-ID: <20250805204718.6893-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805204718.6893-1-paulk@sys-base.io>
References: <20250805204718.6893-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some definitions use a tab after the define keyword instead of the
usual single space. Replace it for better consistency.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 include/uapi/linux/v4l2-controls.h | 30 +++++++++++++++---------------
 include/uapi/linux/videodev2.h     | 18 +++++++++---------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index e52cdf48d652..5b7dd8c990f6 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1193,7 +1193,7 @@ enum v4l2_flash_strobe_source {
 #define V4L2_CID_JPEG_CLASS_BASE		(V4L2_CTRL_CLASS_JPEG | 0x900)
 #define V4L2_CID_JPEG_CLASS			(V4L2_CTRL_CLASS_JPEG | 1)
 
-#define	V4L2_CID_JPEG_CHROMA_SUBSAMPLING	(V4L2_CID_JPEG_CLASS_BASE + 1)
+#define V4L2_CID_JPEG_CHROMA_SUBSAMPLING	(V4L2_CID_JPEG_CLASS_BASE + 1)
 enum v4l2_jpeg_chroma_subsampling {
 	V4L2_JPEG_CHROMA_SUBSAMPLING_444	= 0,
 	V4L2_JPEG_CHROMA_SUBSAMPLING_422	= 1,
@@ -1202,15 +1202,15 @@ enum v4l2_jpeg_chroma_subsampling {
 	V4L2_JPEG_CHROMA_SUBSAMPLING_410	= 4,
 	V4L2_JPEG_CHROMA_SUBSAMPLING_GRAY	= 5,
 };
-#define	V4L2_CID_JPEG_RESTART_INTERVAL		(V4L2_CID_JPEG_CLASS_BASE + 2)
-#define	V4L2_CID_JPEG_COMPRESSION_QUALITY	(V4L2_CID_JPEG_CLASS_BASE + 3)
+#define V4L2_CID_JPEG_RESTART_INTERVAL		(V4L2_CID_JPEG_CLASS_BASE + 2)
+#define V4L2_CID_JPEG_COMPRESSION_QUALITY	(V4L2_CID_JPEG_CLASS_BASE + 3)
 
-#define	V4L2_CID_JPEG_ACTIVE_MARKER		(V4L2_CID_JPEG_CLASS_BASE + 4)
-#define	V4L2_JPEG_ACTIVE_MARKER_APP0		(1 << 0)
-#define	V4L2_JPEG_ACTIVE_MARKER_APP1		(1 << 1)
-#define	V4L2_JPEG_ACTIVE_MARKER_COM		(1 << 16)
-#define	V4L2_JPEG_ACTIVE_MARKER_DQT		(1 << 17)
-#define	V4L2_JPEG_ACTIVE_MARKER_DHT		(1 << 18)
+#define V4L2_CID_JPEG_ACTIVE_MARKER		(V4L2_CID_JPEG_CLASS_BASE + 4)
+#define V4L2_JPEG_ACTIVE_MARKER_APP0		(1 << 0)
+#define V4L2_JPEG_ACTIVE_MARKER_APP1		(1 << 1)
+#define V4L2_JPEG_ACTIVE_MARKER_COM		(1 << 16)
+#define V4L2_JPEG_ACTIVE_MARKER_DQT		(1 << 17)
+#define V4L2_JPEG_ACTIVE_MARKER_DHT		(1 << 18)
 
 
 /* Image source controls */
@@ -1243,10 +1243,10 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
 #define V4L2_CID_DV_CLASS			(V4L2_CTRL_CLASS_DV | 1)
 
-#define	V4L2_CID_DV_TX_HOTPLUG			(V4L2_CID_DV_CLASS_BASE + 1)
-#define	V4L2_CID_DV_TX_RXSENSE			(V4L2_CID_DV_CLASS_BASE + 2)
-#define	V4L2_CID_DV_TX_EDID_PRESENT		(V4L2_CID_DV_CLASS_BASE + 3)
-#define	V4L2_CID_DV_TX_MODE			(V4L2_CID_DV_CLASS_BASE + 4)
+#define V4L2_CID_DV_TX_HOTPLUG			(V4L2_CID_DV_CLASS_BASE + 1)
+#define V4L2_CID_DV_TX_RXSENSE			(V4L2_CID_DV_CLASS_BASE + 2)
+#define V4L2_CID_DV_TX_EDID_PRESENT		(V4L2_CID_DV_CLASS_BASE + 3)
+#define V4L2_CID_DV_TX_MODE			(V4L2_CID_DV_CLASS_BASE + 4)
 enum v4l2_dv_tx_mode {
 	V4L2_DV_TX_MODE_DVI_D	= 0,
 	V4L2_DV_TX_MODE_HDMI	= 1,
@@ -1267,7 +1267,7 @@ enum v4l2_dv_it_content_type {
 	V4L2_DV_IT_CONTENT_TYPE_NO_ITC	  = 4,
 };
 
-#define	V4L2_CID_DV_RX_POWER_PRESENT		(V4L2_CID_DV_CLASS_BASE + 100)
+#define V4L2_CID_DV_RX_POWER_PRESENT		(V4L2_CID_DV_CLASS_BASE + 100)
 #define V4L2_CID_DV_RX_RGB_RANGE		(V4L2_CID_DV_CLASS_BASE + 101)
 #define V4L2_CID_DV_RX_IT_CONTENT_TYPE		(V4L2_CID_DV_CLASS_BASE + 102)
 
@@ -2667,7 +2667,7 @@ struct v4l2_ctrl_hevc_scaling_matrix {
 /* Stateless VP9 controls */
 
 #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
-#define	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE	0x2
+#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE	0x2
 
 /**
  * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 8e26c0485234..a65a4ee61d7c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1607,8 +1607,8 @@ struct v4l2_bt_timings {
 } __attribute__ ((packed));
 
 /* Interlaced or progressive format */
-#define	V4L2_DV_PROGRESSIVE	0
-#define	V4L2_DV_INTERLACED	1
+#define V4L2_DV_PROGRESSIVE	0
+#define V4L2_DV_INTERLACED	1
 
 /* Polarities. If bit is not set, it is assumed to be negative polarity */
 #define V4L2_DV_VSYNC_POS_POL	0x00000001
@@ -2791,15 +2791,15 @@ struct v4l2_remove_buffers {
  * Only implemented if CONFIG_VIDEO_ADV_DEBUG is defined.
  * You must be root to use these ioctls. Never use these in applications!
  */
-#define	VIDIOC_DBG_S_REGISTER	 _IOW('V', 79, struct v4l2_dbg_register)
-#define	VIDIOC_DBG_G_REGISTER	_IOWR('V', 80, struct v4l2_dbg_register)
+#define VIDIOC_DBG_S_REGISTER	 _IOW('V', 79, struct v4l2_dbg_register)
+#define VIDIOC_DBG_G_REGISTER	_IOWR('V', 80, struct v4l2_dbg_register)
 
 #define VIDIOC_S_HW_FREQ_SEEK	 _IOW('V', 82, struct v4l2_hw_freq_seek)
-#define	VIDIOC_S_DV_TIMINGS	_IOWR('V', 87, struct v4l2_dv_timings)
-#define	VIDIOC_G_DV_TIMINGS	_IOWR('V', 88, struct v4l2_dv_timings)
-#define	VIDIOC_DQEVENT		 _IOR('V', 89, struct v4l2_event)
-#define	VIDIOC_SUBSCRIBE_EVENT	 _IOW('V', 90, struct v4l2_event_subscription)
-#define	VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct v4l2_event_subscription)
+#define VIDIOC_S_DV_TIMINGS	_IOWR('V', 87, struct v4l2_dv_timings)
+#define VIDIOC_G_DV_TIMINGS	_IOWR('V', 88, struct v4l2_dv_timings)
+#define VIDIOC_DQEVENT		 _IOR('V', 89, struct v4l2_event)
+#define VIDIOC_SUBSCRIBE_EVENT	 _IOW('V', 90, struct v4l2_event_subscription)
+#define VIDIOC_UNSUBSCRIBE_EVENT _IOW('V', 91, struct v4l2_event_subscription)
 #define VIDIOC_CREATE_BUFS	_IOWR('V', 92, struct v4l2_create_buffers)
 #define VIDIOC_PREPARE_BUF	_IOWR('V', 93, struct v4l2_buffer)
 #define VIDIOC_G_SELECTION	_IOWR('V', 94, struct v4l2_selection)
-- 
2.50.1


