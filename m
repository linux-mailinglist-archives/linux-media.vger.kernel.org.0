Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68417A0C7D
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241412AbjINSRq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241334AbjINSRp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342CD1FD7
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31DA42B62;
        Thu, 14 Sep 2023 20:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715367;
        bh=/tQhEf41YxmAZlvRY6/TU/KmcBltbwhjxz1dAz2TpjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iAQ7nhhXh3ms+GN9mRhcheAOXeAUM6/3hnIk3vPe6j/f98cNTKPyhsRF7nrmBuzjC
         dL/2yT7T/NQbfVhgU+XBkU1Gs6mqm8IJfcZf6YF4jWgXGBrBF8+0K0bW6IHxB7VE8J
         ajiygp4+/P33D9rJmM0YhAvT6a3tBa3/9GYU07Og=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Martin Kepplinger <martink@posteo.de>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Jason Chen <jason.z.chen@intel.com>,
        Arec Kao <arec.kao@intel.com>
Subject: [PATCH 34/57] Documentation: media: camera-sensor: Improve power management documentation
Date:   Thu, 14 Sep 2023 21:16:41 +0300
Message-ID: <20230914181704.4811-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Camera sensor drivers are highly subject to cargo cult programming, with
back practices being copied from old to new drivers. In particular, many
drivers implement system and runtime PM incorrectly. As a first step
towards fixing this situation, refactor and expand the power management
documentation to detail correct usage of system and runtime PM.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../driver-api/media/camera-sensor.rst        | 54 ++++++++++++++-----
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 8ab166a2138d..2acc08142a1a 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -46,22 +46,48 @@ are required to ensure reliability.
 Power management
 ----------------
 
-Always use runtime PM to manage the power states of your device. Camera sensor
-drivers are in no way special in this respect: they are responsible for
-controlling the power state of the device they otherwise control as well. In
-general, the device shall be powered on at least when its registers are being
-accessed and when it is streaming.
+Camera sensors are used in conjunction with other devices to form a camera
+pipeline. They must obey the rules listed herein to ensure coherent power
+management over the pipeline.
 
-Existing camera sensor drivers may rely on the old
-struct v4l2_subdev_core_ops->s_power() callback for bridge or ISP drivers to
-manage their power state. This is however **deprecated**. If you feel you need
-to begin calling an s_power from an ISP or a bridge driver, instead please add
-runtime PM support to the sensor driver you are using. Likewise, new drivers
-should not use s_power.
+Camera sensor drivers are responsible for controlling the power state of the
+device they otherwise control as well. They shall use runtime PM to manage
+power states. Runtime PM shall be enabled at probe time and disabled at remove
+time. Drivers should enable runtime PM autosuspend.
 
-Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
-``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI
-and DT based systems.
+The runtime PM handlers shall handle clocks, regulators, GPIOs, and other
+system resources required to power the sensor up and down. For drivers that
+don't use any of those resources (such as drivers that support ACPI systems
+only), the runtime PM handlers may be left unimplemented.
+
+In general, the device shall be powered on at least when its registers are
+being accessed and when it is streaming. Drivers should use
+``pm_runtime_resume_and_get()`` when starting streaming and
+``pm_runtime_put()`` or ``pm_runtime_put_autosuspend()`` when stopping
+streaming. They may power the device up at probe time (for example to read
+identification registers), but should not keep it powered unconditionally after
+probe.
+
+At system suspend time, the whole camera pipeline must stop streaming, and
+restart when the system is resumed. This requires coordination between the
+camera sensor and the rest of the camera pipeline. Bridge drivers are
+responsible for this coordination, and instruct camera sensors to stop and
+restart streaming by calling the appropriate subdev operations
+(``.s_stream()``, ``.enable_streams()`` or ``.disable_streams()``). Camera
+sensor drivers shall therefore **not** keep track of the streaming state to
+stop streaming in the PM suspend handler and restart it in the resume handler.
+Drivers should in general not implement the system PM handlers.
+
+Camera sensor drivers shall **not** implement the subdev ``.s_power()``
+operation, as it is deprecated. While this operation is implemented in some
+existing drivers as they predate the deprecation, new drivers shall use runtime
+PM instead. If you feel you need to begin calling ``.s_power()`` from an ISP or
+a bridge driver, instead add runtime PM support to the sensor driver you are
+using and drop its ``.s_power()`` handler.
+
+See examples of runtime PM handling in e.g. ``drivers/media/i2c/ov8856.c`` and
+``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI and DT
+based systems.
 
 Control framework
 ~~~~~~~~~~~~~~~~~
-- 
Regards,

Laurent Pinchart

