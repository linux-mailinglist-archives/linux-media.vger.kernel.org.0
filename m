Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1400312066
	for <lists+linux-media@lfdr.de>; Sun,  7 Feb 2021 00:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhBFXH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 18:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBFXHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Feb 2021 18:07:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4990C061786
        for <linux-media@vger.kernel.org>; Sat,  6 Feb 2021 15:06:45 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1975B33D;
        Sun,  7 Feb 2021 00:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612652803;
        bh=EEv7BzUJrz0H3AM0QmwWw3TJu4pf9iJeyqYm51t6ucI=;
        h=From:To:Cc:Subject:Date:From;
        b=edEf5JFOqy/CUG/LRNykDPzTkUIh5DOAQkcoZd4IN80MjLkNh1Rkz2O1UzNItBgKR
         6znA0KF071rk1XrZXUl5kYGzj8ph3WbCvEGO/5CAFLXQYYAYDJ2VGhmUkBwGot2ViU
         a4Nr8UqCJgUCeIEj0DTxiggU6pN5+yAUD8u7xbFI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH/RFC] media: Add ISP entity function
Date:   Sun,  7 Feb 2021 01:06:16 +0200
Message-Id: <20210206230616.20403-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a media entity function to describe ISPs. ISPs overlap with existing
functions such as MEDIA_ENT_F_PROC_VIDEO_SCALER (when they include a
scaler). The new function should be used when the whole ISP is exposed
as a single entity, or for the central "catch all" entity of an ISP that
exposes additional entities for the scaler or other specific processing
blocks.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/media/uapi/mediactl/media-types.rst | 11 +++++++++++
 include/uapi/linux/media.h                        |  1 +
 2 files changed, 12 insertions(+)

diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
index 3af6a414b501..bbf1b7745d23 100644
--- a/Documentation/media/uapi/mediactl/media-types.rst
+++ b/Documentation/media/uapi/mediactl/media-types.rst
@@ -208,6 +208,17 @@ Types and flags used to represent the media graph elements
           decompressing a compressed video stream into uncompressed video
 	  frames. Must have one sink pad and at least one source pad.
 
+    *  -  ``MEDIA_ENT_F_PROC_ISP``
+       -  Image Signal Processor. An entity capable processing images from a
+          raw sensor to apply demosaicing, a wide range of color correction
+          algorithms, and optional processing such as scaling or noise
+          reduction to produce images suitable for consumption by general
+          purpose applications (often in YUV format). This function should be
+          used when the whole ISP is exposed as a single entity, or for the
+          central "catch all" entity of an ISP that exposes additional entities
+          for the scaler or other specific processing blocks. Must have at
+          least one sink pad and at least one source pad.
+
     *  -  ``MEDIA_ENT_F_VID_MUX``
        - Video multiplexer. An entity capable of multiplexing must have at
          least two sink pads and one source pad, and must pass the video
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 383ac7b7d8f0..a5977f7a729a 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -127,6 +127,7 @@ struct media_device_info {
 #define MEDIA_ENT_F_PROC_VIDEO_STATISTICS	(MEDIA_ENT_F_BASE + 0x4006)
 #define MEDIA_ENT_F_PROC_VIDEO_ENCODER		(MEDIA_ENT_F_BASE + 0x4007)
 #define MEDIA_ENT_F_PROC_VIDEO_DECODER		(MEDIA_ENT_F_BASE + 0x4008)
+#define MEDIA_ENT_F_PROC_ISP			(MEDIA_ENT_F_BASE + 0x4009)
 
 /*
  * Switch and bridge entity functions
-- 
Regards,

Laurent Pinchart

