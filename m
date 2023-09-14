Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A65997A0C7C
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241383AbjINSRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241351AbjINSRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40FF2101
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2B4E8808;
        Thu, 14 Sep 2023 20:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715366;
        bh=857Fu3imASjy2BLogJYVVv58QsY/VcGCL7KNoqkoPd0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xnjy6jiUnSk3/OrEHcQtzRZ9h/sDQ31Ww4uHakPX8VIFeHwUvdHwNallPpVkxmTnZ
         0cfW9WP3nOrXaSY1P4pHgcxrrYzErrGs6i7SaFfYt8H9Yflglm8Gg3hagn5OaZZ+Oq
         zxaiHb7ewDQ2PO5Ct1qE/VfGNEXj9NJ5CliXWXXM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 33/57] Documentation: media: camera-sensor: Move power management section
Date:   Thu, 14 Sep 2023 21:16:40 +0300
Message-ID: <20230914181704.4811-34-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the power management section up, just after clocks, as it relates
to internal system resources and not features exposed to applications.
The text itself is otherwise unchanged.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../driver-api/media/camera-sensor.rst        | 70 +++++++++----------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 3510a57ecb9a..8ab166a2138d 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -43,6 +43,41 @@ hasn't been modified directly or indirectly by another driver, or supported by
 the board's clock tree to begin with. Changes to the Common Clock Framework API
 are required to ensure reliability.
 
+Power management
+----------------
+
+Always use runtime PM to manage the power states of your device. Camera sensor
+drivers are in no way special in this respect: they are responsible for
+controlling the power state of the device they otherwise control as well. In
+general, the device shall be powered on at least when its registers are being
+accessed and when it is streaming.
+
+Existing camera sensor drivers may rely on the old
+struct v4l2_subdev_core_ops->s_power() callback for bridge or ISP drivers to
+manage their power state. This is however **deprecated**. If you feel you need
+to begin calling an s_power from an ISP or a bridge driver, instead please add
+runtime PM support to the sensor driver you are using. Likewise, new drivers
+should not use s_power.
+
+Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
+``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI
+and DT based systems.
+
+Control framework
+~~~~~~~~~~~~~~~~~
+
+``v4l2_ctrl_handler_setup()`` function may not be used in the device's runtime
+PM ``runtime_resume`` callback, as it has no way to figure out the power state
+of the device. This is because the power state of the device is only changed
+after the power state transition has taken place. The ``s_ctrl`` callback can be
+used to obtain device's power state after the power state transition:
+
+.. c:function:: int pm_runtime_get_if_in_use(struct device *dev);
+
+The function returns a non-zero value if it succeeded getting the power count or
+runtime PM was disabled, in either of which cases the driver may proceed to
+access the device.
+
 Frame size
 ----------
 
@@ -118,41 +153,6 @@ rate) on device level in firmware or hardware. This means lower level controls
 implemented by raw cameras may not be used on uAPI (or even kAPI) to control the
 frame interval on these devices.
 
-Power management
-----------------
-
-Always use runtime PM to manage the power states of your device. Camera sensor
-drivers are in no way special in this respect: they are responsible for
-controlling the power state of the device they otherwise control as well. In
-general, the device shall be powered on at least when its registers are being
-accessed and when it is streaming.
-
-Existing camera sensor drivers may rely on the old
-struct v4l2_subdev_core_ops->s_power() callback for bridge or ISP drivers to
-manage their power state. This is however **deprecated**. If you feel you need
-to begin calling an s_power from an ISP or a bridge driver, instead please add
-runtime PM support to the sensor driver you are using. Likewise, new drivers
-should not use s_power.
-
-Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
-``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI
-and DT based systems.
-
-Control framework
-~~~~~~~~~~~~~~~~~
-
-``v4l2_ctrl_handler_setup()`` function may not be used in the device's runtime
-PM ``runtime_resume`` callback, as it has no way to figure out the power state
-of the device. This is because the power state of the device is only changed
-after the power state transition has taken place. The ``s_ctrl`` callback can be
-used to obtain device's power state after the power state transition:
-
-.. c:function:: int pm_runtime_get_if_in_use(struct device *dev);
-
-The function returns a non-zero value if it succeeded getting the power count or
-runtime PM was disabled, in either of which cases the driver may proceed to
-access the device.
-
 Rotation, orientation and flipping
 ----------------------------------
 
-- 
Regards,

Laurent Pinchart

