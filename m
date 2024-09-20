Return-Path: <linux-media+bounces-18410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECE97D1CB
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 09:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5921C217C1
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 07:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53958558BA;
	Fri, 20 Sep 2024 07:35:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE1433CF
	for <linux-media@vger.kernel.org>; Fri, 20 Sep 2024 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.185.170.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726817716; cv=none; b=XjsxN6vuxEhfX+yP+Eul2f/igOf9qV2gZWG0mC5CHV6oWsSNBf7tqSEImJCnFzgbwnzBsSxazI19Kc4Dzbyq/bucilXL+vToCDZBIqP8wy/KXNZeIhG3q6v8dWuG8p9E8KdOQSTOuRizT1h/awap9oXZ0VAIXChQ25F0ie9vblY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726817716; c=relaxed/simple;
	bh=7Aa+VJ+t4CkCprfOvJ6iqSsoMb+v7iTedb3/isDi3ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Chr9zBAtD6q3DhmUOGytOUy2Tnn/4x9/m3EiWWgE7lb442XEGmiwzx0t4BX6fMApDbiy2eaxGwDJ/raSYHp5GduoKhFi115hZ1A2LTucXTqlXuDT52gwjyia0V0kF37/2/cCQmCHxg9GE/Cscw146Yp27q8YUVfxyOYsXGkHgmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X940l6pSRz49Q3Y;
	Fri, 20 Sep 2024 10:35:03 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id 58F6E634C97;
	Fri, 20 Sep 2024 10:35:03 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1srYAR-0005rp-0R;
	Fri, 20 Sep 2024 10:35:03 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH v3 1/3] media: Documentation: Deprecate s_stream video op, update docs
Date: Fri, 20 Sep 2024 10:35:01 +0300
Message-Id: <20240920073503.22536-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
References: <20240920073503.22536-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scope of the s_stream video operation is now fully supported by
{enable,disable}_streams. Explicitly document the s_stream() op as
deprecated and update the related documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/driver-api/media/camera-sensor.rst |  8 ++++----
 Documentation/driver-api/media/tx-rx.rst         | 13 ++++++++-----
 include/media/v4l2-subdev.h                      |  5 +++--
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index b4920b34cebc..c290833165e6 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -81,10 +81,10 @@ restart when the system is resumed. This requires coordination between the
 camera sensor and the rest of the camera pipeline. Bridge drivers are
 responsible for this coordination, and instruct camera sensors to stop and
 restart streaming by calling the appropriate subdev operations
-(``.s_stream()``, ``.enable_streams()`` or ``.disable_streams()``). Camera
-sensor drivers shall therefore **not** keep track of the streaming state to
-stop streaming in the PM suspend handler and restart it in the resume handler.
-Drivers should in general not implement the system PM handlers.
+(``.enable_streams()`` or ``.disable_streams()``). Camera sensor drivers shall
+therefore **not** keep track of the streaming state to stop streaming in the PM
+suspend handler and restart it in the resume handler. Drivers should in general
+not implement the system PM handlers.
 
 Camera sensor drivers shall **not** implement the subdev ``.s_power()``
 operation, as it is deprecated. While this operation is implemented in some
diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 29d66a47b56e..dd09484df1d3 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,11 +49,14 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
-``.s_stream()`` callback
-^^^^^^^^^^^^^^^^^^^^^^^^
+``.enable_streams()`` and ``.disable_streams()`` callbacks
+^^^^^^^^^^^^^^^^^^^^^^^^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The struct struct v4l2_subdev_video_ops->s_stream() callback is used by the
-receiver driver to control the transmitter driver's streaming state.
+The struct v4l2_subdev_pad_ops->enable_streams() and struct
+v4l2_subdev_pad_ops->disable_streams() callbacks are used by the receiver driver
+to control the transmitter driver's streaming state. These callbacks may not be
+called directly, but by using ``v4l2_subdev_enable_streams()`` and
+``v4l2_subdev_disable_streams()``.
 
 
 CSI-2 transmitter drivers
@@ -127,7 +130,7 @@ Stopping the transmitter
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
 A transmitter stops sending the stream of images as a result of
-calling the ``.s_stream()`` callback. Some transmitters may stop the
+calling the ``.disable_streams()`` callback. Some transmitters may stop the
 stream at a frame boundary whereas others stop immediately,
 effectively leaving the current frame unfinished. The receiver driver
 should not make assumptions either way, but function properly in both
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8daa0929865c..3cc6b4a5935f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -450,8 +450,9 @@ enum v4l2_subdev_pre_streamon_flags {
  *	already started or stopped subdev. Also see call_s_stream wrapper in
  *	v4l2-subdev.c.
  *
- *	New drivers should instead implement &v4l2_subdev_pad_ops.enable_streams
- *	and &v4l2_subdev_pad_ops.disable_streams operations, and use
+ *	This callback is DEPRECATED. New drivers should instead implement
+ *	&v4l2_subdev_pad_ops.enable_streams and
+ *	&v4l2_subdev_pad_ops.disable_streams operations, and use
  *	v4l2_subdev_s_stream_helper for the &v4l2_subdev_video_ops.s_stream
  *	operation to support legacy users.
  *
-- 
2.39.5


