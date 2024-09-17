Return-Path: <linux-media+bounces-18329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7856D97B047
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A9421F22C49
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 12:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDD5174EF0;
	Tue, 17 Sep 2024 12:43:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA0170A20
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.185.170.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577037; cv=none; b=gNic1lXb9m16C+JTvznnJliHz2/PCx/pYB5o13eElbANFDtPO7b1bMVRKrl2BtBwESCwuI26VuYGGgvV4Eo+SfCSgNsjg7ktrjxmefAuVs6dZhd3WW0wj1Y25o/oVnRlpsn687T2CaoEUAD0aGFWtnzRCRYS20z0OJ1DzgH5qX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577037; c=relaxed/simple;
	bh=Wyb+mNcj5vmeR9iK9Xo4xGPVhyu10EEkyG8ENFOntjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i2EOkhduMea+1s/5VXItuTQX92uhNW6h/JPcvrWAuXBPnIkF0s8QrmSnQWbTPT64jh98jD3IGFkAV+TfFR2ek1Jhqsa3fXhGYMF/9JaZz5oDYJKIu+y9z3UmXNPqveQS+q0n6TlxWfkeLoJtuKlQObwAhogtMW/NTp7ouGXmGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X7M0K6jHfz49PyM;
	Tue, 17 Sep 2024 15:43:45 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id 75F0D634C96;
	Tue, 17 Sep 2024 15:43:45 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1sqXYX-0004LH-13;
	Tue, 17 Sep 2024 15:43:45 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH 1/2] media: Documentation: Deprecate s_stream video op, update docs
Date: Tue, 17 Sep 2024 15:43:44 +0300
Message-Id: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scope of the s_stream video operation is now fully supported by
{enable,disable}_straems. Explicitly document the s_stream() op as
deprecated and update the related documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst |  8 ++++----
 Documentation/driver-api/media/tx-rx.rst         | 11 ++++++-----
 include/media/v4l2-subdev.h                      |  5 +++--
 3 files changed, 13 insertions(+), 11 deletions(-)

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
index 29d66a47b56e..a339df61fca8 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,11 +49,12 @@ Link frequency
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
+to control the transmitter driver's streaming state.
 
 
 CSI-2 transmitter drivers
@@ -127,7 +128,7 @@ Stopping the transmitter
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


