Return-Path: <linux-media+bounces-13085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63631905B04
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 027D8B269FD
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFAA8289E;
	Wed, 12 Jun 2024 18:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE18003F;
	Wed, 12 Jun 2024 18:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217096; cv=none; b=e7iIsLgJxHFfers0YrZy8qaOG2vCsvwM7MJTZngJUy4wo3dOtfI27d3zE31hg4XoAUp3Y6fijnv3G/TMhGv5pTJrEGiCP4IobHI34TT87VWh1GbjeO0cYx7Tft7XZdg4Hm8Qiq8uVNgD/cq62YsevOTbIehW8LspHFi0FqjexKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217096; c=relaxed/simple;
	bh=KJpri+IbVnAoZKMxYgYMeN+Mhz/Vw1rvPuNwlL7jfN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EqJs1Orl74d3AdKOwtCvwc3TGHW9boZ5lYNHKZ4xZXRl7tnVM0l/1vPjjm/o4KLAR8D9NW5M1NbF5uQFu1Q2kbyv/BcZWBHZ4PEvMlIyKTmpVxXBXme+Y74Ub8D/RIBlKt4cvoN21nmhxTgFZg5A6MEeeLO6LJnDNofeUQYjpE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (c3e47615.dsl.pool.telekom.hu [::ffff:195.228.118.21])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070662.000000006669E981.0016B242; Wed, 12 Jun 2024 20:31:28 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 1/2] media: v4l2: ctrls: Add ROLL_ABSOLUTE control
Date: Wed, 12 Jun 2024 20:31:13 +0200
Message-ID: <d4d606920a2e08fa468eb6c98f7f2f387ed58e16.1718216718.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718216718.git.soyer@irl.hu>
References: <cover.1718216718.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Add V4L2_CID_ROLL_ABSOLUTE as an integer control to
retrieve and set the camera roll in degrees, and its
documentation.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst | 5 +++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                  | 1 +
 include/uapi/linux/v4l2-controls.h                         | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index cdc515c60468..81bc31a4bf79 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -672,3 +672,8 @@ enum v4l2_scene_mode -
 
     As modes differ for each sensor, menu items are not standardized by this
     control and are left to the programmer.
+
+``V4L2_CID_ROLL_ABSOLUTE (integer)``
+    This control describes the camera rotation along the image viewing axis in
+    degrees. Values range from -180 to +180, the default is zero. Positive
+    values rotate the camera clockwise, negative values counter-clockwise.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..0e8af56cb2a2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1086,6 +1086,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
+	case V4L2_CID_ROLL_ABSOLUTE:		return "Roll, Absolute";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 99c3f5e99da7..a6d28e54bbc0 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1087,6 +1087,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
 
+#define V4L2_CID_ROLL_ABSOLUTE			(V4L2_CID_CAMERA_CLASS_BASE+37)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.45.2


