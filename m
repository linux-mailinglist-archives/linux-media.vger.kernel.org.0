Return-Path: <linux-media+bounces-38602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B9B14506
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 01:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ECB21AA0ACD
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 23:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6831A316E;
	Mon, 28 Jul 2025 23:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L38kL6Zb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8C1DD0D4
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753746634; cv=none; b=fxbeprEDWyzxDJqx4jJajILn9kcdWyf/q+uYcZ0Nd8GrFkjWlJlJP5ROcZbw0mZd4Sa01OeIUvMLuHbx+GhU/ADi9AMjf5OFEl4DED4NxGwQbSClzxb90mOAzmHWHskjCu7VfS5+VZK2wFtLRLbZIjPR5Tk4QFsASmjc8A3PlNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753746634; c=relaxed/simple;
	bh=1oV53as3egdPY6dj4sabeyWGyRsnRJJ/nbDULK4+sZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vz1wsVrgbDWZW2BrJtjlU8XzEAmdb/dS+nUsymNy08Bu8AIklPG6GFZpCiBq8HsbyQxA1ycGrCRF+EzS2h2FKduvAAUduod8w3OWZsi3Pi30Ck/Q6kzpHJwRgf/XRrQePIKbX/TnV3apBljnyLNZQpHCsOtFxAr2XMej02CSngQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L38kL6Zb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F1FF19C9;
	Tue, 29 Jul 2025 01:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753746580;
	bh=1oV53as3egdPY6dj4sabeyWGyRsnRJJ/nbDULK4+sZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L38kL6ZbpfzXSfqumrg53c0vXQkygg+hOEChur9Ypsv/VM4vfsfgykhC6SlMDtZg6
	 UsNxJvtpnofGWMl9p+JXk3Zsiw9eQSBbHQ6X+1xHH2j7FDXorhHtJsku8pHwktEs3q
	 egEOWZeDvHJuCBwHYQ273TWIHajxI73Q/SqvG4BU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 3/3] media: v4l2-subdev: Make struct v4l2_subdev_stream_config private
Date: Tue, 29 Jul 2025 02:50:10 +0300
Message-ID: <20250728235010.2926-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
References: <20250728235010.2926-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 25 +------------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4fd25fea3b58..7be28e573d3f 100644
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
index 5dcf4065708f..8f54fd0d90ad 100644
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
@@ -683,30 +684,6 @@ struct v4l2_subdev_pad_config {
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


