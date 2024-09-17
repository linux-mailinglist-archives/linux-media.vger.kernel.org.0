Return-Path: <linux-media+bounces-18344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB997B1D2
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 17:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94507286DD1
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 15:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B62919F414;
	Tue, 17 Sep 2024 15:03:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD04919EEAB
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.185.170.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726585399; cv=none; b=YMGZfteCqfJjsjvx7btcglhzUEMKWNYYEgDLi3xM7s3YFuuexhRMLJ6E5H7/JjHmxeL+68Khi0PecrUssbkgcJs3xECcionHJugwkrp0ANQtiZisfXy5q2Bkcqyn9TaMck+FxBhzPIs9uNb5QhHl579JC/Hu4rX7A+yLevRHPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726585399; c=relaxed/simple;
	bh=IbiOK1ec9i99nHRLlAq9Ok8GIWL5KyFc0/vcuQ5xGP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HQINrOXyf6fZZWhjcRL2ocs5+vpQYX3ELOZSlaYxQi/kixXY9SuRqALFJfX6DaidKUoZ81D9HOBMJwQOsm1pLb+JOF+VqY6bfhtZO4UDaevlxKvpd6rhg1VRIAOgf5ZL0sfpgNw4Q4v2+DuN52QlWuOfVItLRSROqTDzmnqcnbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=iki.fi; arc=none smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X7Q4w5m5vz49Q16;
	Tue, 17 Sep 2024 18:02:56 +0300 (EEST)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id BD97F634C99;
	Tue, 17 Sep 2024 18:02:54 +0300 (EEST)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@iki.fi>)
	id 1sqZjC-0004aq-17;
	Tue, 17 Sep 2024 18:02:54 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	hverkuil@xs4all.nl
Subject: [PATCH v2 1/3] media: Documentation: Deprecate s_stream video op, update docs
Date: Tue, 17 Sep 2024 18:02:52 +0300
Message-Id: <20240917150254.17639-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
References: <20240917150254.17639-1-sakari.ailus@linux.intel.com>
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


