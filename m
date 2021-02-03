Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C0730E01F
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 17:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhBCQw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 11:52:29 -0500
Received: from retiisi.eu ([95.216.213.190]:59984 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229970AbhBCQw0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Feb 2021 11:52:26 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 32422634C8F
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 18:50:30 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] Documentation: media: Improve camera sensor documentation
Date:   Wed,  3 Feb 2021 18:50:38 +0200
Message-Id: <20210203165038.4964-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Modernise the documentation to make it more precise and update the use of
pixel rate control. In particular:

- Use non-proportional font for file names, properties as well as
  controls.

- The unit of the HBLANK control is pixels, not lines.

- The unit of PIXEL_RATE control is pixels per second, not Hz.

- Separate CSI-2 and parallel documentation. CSI-2 already has its own
  section.

- Include all DT properties needed for assigned clocks.

- SMIA driver's new name is CCS driver.

- The PIXEL_RATE control denotes pixel rate on the pixel array on camera
  sensors. Do not suggest it is used to tell the maximum pixel rate on the
  bus anymore.

Fixes: e4cf8c58af75 ("media: Documentation: media: Document how to write camera sensor drivers")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
This replaces an earlier patch here:

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20210201093914.12994-1-sakari.ailus@linux.intel.com/>

 .../driver-api/media/camera-sensor.rst        | 47 +++++++++----------
 Documentation/driver-api/media/csi2.rst       | 36 +++++++-------
 2 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 3fc378b3b269..4e2efa6e8fa1 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -8,6 +8,15 @@ CSI-2
 
 Please see what is written on :ref:`MIPI_CSI_2`.
 
+Parallel (BT.601 and BT.656)
+----------------------------
+
+For camera sensors that are connected to a bus where transmitter and receiver
+require common configuration set by drivers, such as CSI-2 or parallel (BT.601
+or BT.656) bus, the ``V4L2_CID_LINK_FREQ`` control is mandatory on transmitter
+drivers. Receiver drivers can use the ``V4L2_CID_LINK_FREQ`` to query the
+frequency used on the bus.
+
 Handling clocks
 ---------------
 
@@ -26,15 +35,16 @@ user.
 ACPI
 ~~~~
 
-Read the "clock-frequency" _DSD property to denote the frequency. The driver can
-rely on this frequency being used.
+Read the ``clock-frequency`` _DSD property to denote the frequency. The driver
+can rely on this frequency being used.
 
 Devicetree
 ~~~~~~~~~~
 
-The currently preferred way to achieve this is using "assigned-clock-rates"
-property. See Documentation/devicetree/bindings/clock/clock-bindings.txt for
-more information. The driver then gets the frequency using clk_get_rate().
+The currently preferred way to achieve this is using ``assigned-clocks``,
+``assigned-clock-parents`` and ``assigned-clock-rates`` properties. See
+``Documentation/devicetree/bindings/clock/clock-bindings.txt`` for more
+information. The driver then gets the frequency using ``clk_get_rate()``.
 
 This approach has the drawback that there's no guarantee that the frequency
 hasn't been modified directly or indirectly by another driver, or supported by
@@ -55,7 +65,8 @@ processing pipeline as one or more sub-devices with different cropping and
 scaling configurations. The output size of the device is the result of a series
 of cropping and scaling operations from the device's pixel array's size.
 
-An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
+An example of such a driver is the CCS driver (see
+``drivers/media/i2c/ccs``).
 
 Register list based drivers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -67,7 +78,7 @@ level are independent. How a driver picks such configuration is based on the
 format set on a source pad at the end of the device's internal pipeline.
 
 Most sensor drivers are implemented this way, see e.g.
-drivers/media/i2c/imx319.c for an example.
+``drivers/media/i2c/imx319.c`` for an example.
 
 Frame interval configuration
 ----------------------------
@@ -94,9 +105,10 @@ large variety of devices beyond camera sensors. Devices that have no analogue
 crop, use the full source image size, i.e. pixel array size.
 
 Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
-``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
-pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
-unit of that control is Hz.
+``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
+is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
+the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
+sub-device. The unit of that control is pixels per second.
 
 Register list based drivers need to implement read-only sub-device nodes for the
 purpose. Devices that are not register list based need these to configure the
@@ -132,7 +144,7 @@ runtime PM support to the sensor driver you are using. Likewise, new drivers
 should not use s_power.
 
 Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
-``drivers/media/i2c/smiapp/smiapp-core.c``. The two drivers work in both ACPI
+``drivers/media/i2c/ccs/ccs-core.c``. The two drivers work in both ACPI
 and DT based systems.
 
 Control framework
@@ -150,16 +162,3 @@ used to obtain device's power state after the power state transition:
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
 access the device.
-
-Controls
---------
-
-For camera sensors that are connected to a bus where transmitter and receiver
-require common configuration set by drivers, such as CSI-2 or parallel (BT.601
-or BT.656) bus, the ``V4L2_CID_LINK_FREQ`` control is mandatory on transmitter
-drivers. Receiver drivers can use the ``V4L2_CID_LINK_FREQ`` to query the
-frequency used on the bus.
-
-The transmitter drivers should also implement ``V4L2_CID_PIXEL_RATE`` control in
-order to tell the maximum pixel rate to the receiver. This is required on raw
-camera sensors.
diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
index 11c52b0be8b8..c79df33bdeaa 100644
--- a/Documentation/driver-api/media/csi2.rst
+++ b/Documentation/driver-api/media/csi2.rst
@@ -19,21 +19,18 @@ be used for CSI-2 interfaces.
 Transmitter drivers
 -------------------
 
-CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to
-provide the CSI-2 receiver with information on the CSI-2 bus
-configuration. These include the V4L2_CID_LINK_FREQ and
-V4L2_CID_PIXEL_RATE controls and
-(:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These
-interface elements must be present on the sub-device represents the
-CSI-2 transmitter.
-
-The V4L2_CID_LINK_FREQ control is used to tell the receiver driver the
-frequency (and not the symbol rate) of the link. The V4L2_CID_PIXEL_RATE
-control may be used by the receiver to obtain the pixel rate the transmitter
-uses. The :c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an
-ability to start and stop the stream.
-
-The value of the V4L2_CID_PIXEL_RATE is calculated as follows::
+CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to provide the
+CSI-2 receiver with information on the CSI-2 bus configuration. These include
+the ``V4L2_CID_LINK_FREQ`` control and
+(:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These interface elements
+must be present on the sub-device representing the CSI-2 transmitter.
+
+The ``V4L2_CID_LINK_FREQ`` control is used to tell the receiver driver the
+frequency (and not the symbol rate) of the link. The
+:c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an ability to
+start and stop the stream.
+
+The pixel rate on the bus is calculated as follows::
 
 	pixel_rate = link_freq * 2 * nr_of_lanes * 16 / k / bits_per_sample
 
@@ -45,7 +42,7 @@ where
    * - variable or constant
      - description
    * - link_freq
-     - The value of the V4L2_CID_LINK_FREQ integer64 menu item.
+     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
    * - nr_of_lanes
      - Number of data lanes used on the CSI-2 link. This can
        be obtained from the OF endpoint configuration.
@@ -56,6 +53,13 @@ where
    * - k
      - 16 for D-PHY and 7 for C-PHY
 
+.. note::
+
+	The pixel rate calculated this way is **not** the same as the pixel rate
+	on the camera sensor's pixel array, and should not be used as the value
+	of the control (unless the value also matches the rate on the pixel
+	array).
+
 The transmitter drivers must, if possible, configure the CSI-2
 transmitter to *LP-11 mode* whenever the transmitter is powered on but
 not active, and maintain *LP-11 mode* until stream on. Only at stream
-- 
2.29.2

