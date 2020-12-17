Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3CB2DD9CE
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 21:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730860AbgLQUXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 15:23:22 -0500
Received: from retiisi.eu ([95.216.213.190]:34536 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730836AbgLQUXW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 15:23:22 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D1208634C89;
        Thu, 17 Dec 2020 22:20:48 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/1] media: uapi: Add an entity type for Image Signal Processors
Date:   Thu, 17 Dec 2020 22:15:05 +0200
Message-Id: <20201217201505.30584-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add and document a media entity type for Image Signal Processor devices.
Surprisingly we didn't have one, so add one now. More or less all ISP
drivers should use this type instead of what they currently are using (or
not using anything).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/media/mediactl/media-types.rst | 7 +++++++
 include/uapi/linux/media.h                                 | 1 +
 2 files changed, 8 insertions(+)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 7b24a213cae7..e1e4043b3b1c 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -39,6 +39,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-ENT-F-PROC-VIDEO-STATISTICS:
 .. _MEDIA-ENT-F-PROC-VIDEO-ENCODER:
 .. _MEDIA-ENT-F-PROC-VIDEO-DECODER:
+.. _MEDIA-ENT-F-PROC-VIDEO-ISP:
 .. _MEDIA-ENT-F-VID-MUX:
 .. _MEDIA-ENT-F-VID-IF-BRIDGE:
 .. _MEDIA-ENT-F-DV-DECODER:
@@ -201,6 +202,12 @@ Types and flags used to represent the media graph elements
           decompressing a compressed video stream into uncompressed video
 	  frames. Must have one sink pad and at least one source pad.
 
+    *  -  ``MEDIA_ENT_F_PROC_VIDEO_ISP``
+       -  An Image Signal Processor (ISP) device. ISPs generally are one of a
+	  kind devices that have their specific control interfaces using a
+	  combination of custom V4L2 controls and IOCTLs, and parameters
+	  supplied in a metadata buffer.
+
     *  -  ``MEDIA_ENT_F_VID_MUX``
        - Video multiplexer. An entity capable of multiplexing must have at
          least two sink pads and one source pad, and must pass the video
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 383ac7b7d8f0..200fa8462b90 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -127,6 +127,7 @@ struct media_device_info {
 #define MEDIA_ENT_F_PROC_VIDEO_STATISTICS	(MEDIA_ENT_F_BASE + 0x4006)
 #define MEDIA_ENT_F_PROC_VIDEO_ENCODER		(MEDIA_ENT_F_BASE + 0x4007)
 #define MEDIA_ENT_F_PROC_VIDEO_DECODER		(MEDIA_ENT_F_BASE + 0x4008)
+#define MEDIA_ENT_F_PROC_VIDEO_ISP		(MEDIA_ENT_F_BASE + 0x4009)
 
 /*
  * Switch and bridge entity functions
-- 
2.29.2

