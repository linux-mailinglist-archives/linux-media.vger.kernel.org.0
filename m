Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32549233694
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 18:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbgG3QVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 12:21:37 -0400
Received: from retiisi.org.uk ([95.216.213.190]:41226 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728368AbgG3QVf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 12:21:35 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id E7CD7634C87;
        Thu, 30 Jul 2020 19:20:35 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v3 1/1] Documentation: media: Document how to write camera sensor drivers
Date:   Thu, 30 Jul 2020 19:20:40 +0300
Message-Id: <20200730162040.15560-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While we have had some example drivers, there has been up to date no
formal documentation on how camera sensor drivers should be written; what
are the practices, why, and where they apply.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- More verbose explanation on sensor driver's responsibilities.

- Reword the explanation on power state vs. v4l2_ctrl_handler_setup.

 .../driver-api/media/camera-sensor.rst        | 134 ++++++++++++++++++
 Documentation/driver-api/media/csi2.rst       |   2 +
 Documentation/driver-api/media/index.rst      |   1 +
 3 files changed, 137 insertions(+)
 create mode 100644 Documentation/driver-api/media/camera-sensor.rst

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
new file mode 100644
index 000000000000..2121586e8ede
--- /dev/null
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -0,0 +1,134 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Writing camera sensor drivers
+=============================
+
+CSI-2
+-----
+
+Please see what is written on :ref:`MIPI_CSI_2`.
+
+Handling clocks
+---------------
+
+Camera sensors have an internal clock tree including a PLL and a number of
+divisors. The clock tree is generally configured by the driver based on a few
+input parameters that are specific to the hardware:: the external clock frequency
+and the link frequency. The two parameters generally are obtained from system
+firmware. No other frequencies should be used in any circumstances.
+
+The reason why the clock frequencies are so important is that the clock signals
+come out of the SoC, and in many cases a specific frequency is designed to be
+used in the system. Using another frequency may cause harmful effects
+elsewhere. Therefore only the pre-determined frequencies are configurable by the
+user.
+
+Frame size
+----------
+
+There are two distinct ways to configure the frame size produced by camera
+sensors.
+
+Freely configurable camera sensor drivers
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Freely configurable camera sensor drivers expose the device's internal
+processing pipeline as one or more sub-devices with different cropping and
+scaling configurations. The output size of the device is the result of a series
+of cropping and scaling operations from the device's pixel array's size.
+
+An example of such a driver is the smiapp driver (see drivers/media/i2c/smiapp).
+
+Register list based drivers
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Register list based drivers generally, instead of able to configure the device
+they control based on user requests, are limited to a number of preset
+configurations that combine a number of different parameters that on hardware
+level are independent. How a driver picks such configuration is based on the
+format set on a source pad at the end of the device's internal pipeline.
+
+Most sensor drivers are implemented this way, see e.g.
+drivers/media/i2c/imx319.c for an example.
+
+Frame interval configuration
+----------------------------
+
+There are two different methods for obtaining possibilities for different frame
+intervals as well as configuring the frame interval. Which one to implement
+depends on the type of the device.
+
+Raw camera sensors
+~~~~~~~~~~~~~~~~~~
+
+Instead of a high level parameter such as frame interval, the frame interval is
+a result of the configuration of a number of camera sensor implementation
+specific parameters. Luckily, these parameters tend to be the same for more or
+less all modern raw camera sensors.
+
+The frame interval is calculated using the following equation::
+
+	frame interval = (analogue crop width + horizontal blanking) *
+			 (analogue crop height + vertical blanking) / pixel rate
+
+The formula is bus independent and is applicable for raw timing parameters on
+large variety of devices beyond camera sensors. Devices that have no analogue
+crop, use the full source image size, i.e. pixel array size.
+
+Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
+``V4L2_CID_VBLANK``, respectively. The unit of these controls are lines. The
+pixel rate is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device. The
+unit of that control is Hz.
+
+Register list based drivers need to implement read-only sub-device nodes for the
+purpose. Devices that are not register list based need these to configure the
+device's internal processing pipeline.
+
+The first entity in the linear pipeline is the pixel array. The pixel array may
+be followed by other entities that are there to allow configuring binning,
+skipping, scaling or digital crop :ref:`v4l2-subdev-selections`.
+
+USB cameras etc. devices
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+USB video class hardware, as well as many cameras offering a higher level
+control interface, generally use the concept of frame interval (or frame rate)
+on the level of device hardware interface. This means lower level controls
+exposed by raw cameras may not be used as an interface to control the frame
+interval on these devices.
+
+Power management
+----------------
+
+Always use runtime PM to manage the power states of your device. Camera sensor
+drivers are in no way special in this respect: they are responsible for
+controlling the power state of the device they otherwise control as well. In
+general, the device must be powered on at least when its registers are being
+accessed and when it is streaming.
+
+Existing camera sensor drivers may rely on the old
+:c:type:`v4l2_subdev_core_ops`->s_power() callback for bridge or ISP drivers to
+manage their power state. This is however **deprecated**. If you feel you need
+to begin calling an s_power from an ISP or a bridge driver, instead please add
+runtime PM support to the sensor driver you are using. Likewise, new drivers
+should not use s_power.
+
+Please see examples in e.g. ``drivers/media/i2c/ov8856.c`` and
+``drivers/media/i2c/smiapp/smiapp-core.c``. The two drivers work in both ACPI
+and DT based systems.
+
+Control framework
+~~~~~~~~~~~~~~~~~
+
+``v4l2_ctrl_handler_setup()`` function may not be used in the device's runtime
+PM ``runtime_resume`` callback, as it has no way to figure out the power state
+of the device. This is because the power state of the device is only changed
+after the power state transition has taken place. The ``s_ctrl``callback can be
+used to obtain device's power state after the power state transition:
+
+.. c:function::
+	int pm_runtime_get_if_in_use(struct device *dev);
+
+The function returns a non-zero value if it succeeded getting the power count or
+runtime PM was disabled, in either of which cases the driver may proceed to
+access the device.
diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
index 17cad435f1a0..e1b838014906 100644
--- a/Documentation/driver-api/media/csi2.rst
+++ b/Documentation/driver-api/media/csi2.rst
@@ -1,5 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _MIPI_CSI_2:
+
 MIPI CSI-2
 ==========
 
diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index 328350924853..c140692454b1 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -34,6 +34,7 @@ Please see:
     mc-core
     cec-core
     csi2
+    camera-sensor
 
     drivers/index
 
-- 
2.27.0

