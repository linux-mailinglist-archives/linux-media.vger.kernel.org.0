Return-Path: <linux-media+bounces-36229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78202AED201
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 02:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3904189223C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 00:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BED6BFCE;
	Mon, 30 Jun 2025 00:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ngXeuiYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1DB29B0
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 00:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751244393; cv=none; b=ejCCq4pc4uHSgLFCRzU7HIxbWQZqDYy2v1WyX5bWwYt+wCCTCUHcP9kzmIGA4XC5oJUFs41kyuK5+1V2UGqBglJkpHZSPGI5Z2Hi3AB496tYlRI7GPD3zdT1vofcqNoUf3BM/KMUlQpiBautJfD30wi9491NVCDaPtZpFQ2euYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751244393; c=relaxed/simple;
	bh=gLMNpRP05MX1WGOLRc48zrRDvntmjtakdsiRTBsViHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s073Ud/DbUrQjiD+OE1ait36VBpgSV8gJYm+mVsYvDDImFpVvnXPXH01fCvrotcAYa7WJQFmT6DwI8GESSWcAMmSj44wsbyemh/OgMBMTVLlCiWKnN5w6bUif6/PIcpSYMeOQhmtnBQyah5HZqZC51V/N2HeMpRJepvKEHgiyHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ngXeuiYQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02B88C6A;
	Mon, 30 Jun 2025 02:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751244368;
	bh=gLMNpRP05MX1WGOLRc48zrRDvntmjtakdsiRTBsViHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ngXeuiYQ61s2Y3O0Zv5YTJZ1V2TRYx/usX54WwMxbrb8O165i9uBeMhlabqjKmMy7
	 nuRTInxYbtVWpP36gN8xsezyWH0tYm7nmL6lVOtBHo+wO7qAo+FJgpogBAu464HzPv
	 ezy1PAXC94tXmWtwT2F2JM+46oWDMC3ahmpysnQk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: [PATCH 2/2] media: v4l2-subdev: Make struct v4l2_subdev_stream_config private
Date: Mon, 30 Jun 2025 03:46:02 +0300
Message-ID: <20250630004602.23075-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>
References: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_subdev_stream_config structure holds configuration data for a
stream. It was meant to be used internally only, but already found its
way into the ds90ub913 driver. Now that the driver has been fixed, make
the structure private to v4l2-subdev.c to avoid using it by accident.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 25 +------------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a3074f469b15..bc813f25c0d2 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -26,6 +26,30 @@
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
 
+/**
+ * struct v4l2_subdev_stream_config - Used for storing stream configuration.
+ *
+ * @pad: pad number
+ * @stream: stream number
+ * @enabled: has the stream been enabled with v4l2_subdev_enable_streams()
+ * @fmt: &struct v4l2_mbus_framefmt
+ * @crop: &struct v4l2_rect to be used for crop
+ * @compose: &struct v4l2_rect to be used for compose
+ * @interval: frame interval
+ *
+ * This structure stores configuration for a stream.
+ */
+struct v4l2_subdev_stream_config {
+	u32 pad;
+	u32 stream;
+	bool enabled;
+
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
+	struct v4l2_fract interval;
+};
+
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 /*
  * The Streams API is an experimental feature. To use the Streams API, set
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 57f2bcb4eb16..b867d3a96a51 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -36,6 +36,7 @@ struct v4l2_event_subscription;
 struct v4l2_fh;
 struct v4l2_subdev;
 struct v4l2_subdev_fh;
+struct v4l2_subdev_stream_config;
 struct tuner_setup;
 struct v4l2_mbus_frame_desc;
 struct led_classdev;
@@ -686,30 +687,6 @@ struct v4l2_subdev_pad_config {
 	struct v4l2_fract interval;
 };
 
-/**
- * struct v4l2_subdev_stream_config - Used for storing stream configuration.
- *
- * @pad: pad number
- * @stream: stream number
- * @enabled: has the stream been enabled with v4l2_subdev_enable_streams()
- * @fmt: &struct v4l2_mbus_framefmt
- * @crop: &struct v4l2_rect to be used for crop
- * @compose: &struct v4l2_rect to be used for compose
- * @interval: frame interval
- *
- * This structure stores configuration for a stream.
- */
-struct v4l2_subdev_stream_config {
-	u32 pad;
-	u32 stream;
-	bool enabled;
-
-	struct v4l2_mbus_framefmt fmt;
-	struct v4l2_rect crop;
-	struct v4l2_rect compose;
-	struct v4l2_fract interval;
-};
-
 /**
  * struct v4l2_subdev_stream_configs - A collection of stream configs.
  *
-- 
Regards,

Laurent Pinchart


