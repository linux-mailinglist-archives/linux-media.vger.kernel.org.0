Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A68848407
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfFQNdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:33:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54198 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfFQNdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:33:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 28789282442
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Subject: [PATCH v3 2/2] media: docs: create vimc documentation
Date:   Mon, 17 Jun 2019 10:32:21 -0300
Message-Id: <20190617133221.21246-2-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617133221.21246-1-andrealmeid@collabora.com>
References: <20190617133221.21246-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create vimc documentation file to explain it basics features, it's
topology, how to configure it and to document vimc's subdevices.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Suggested-by: Helen Koike <helen.koike@collabora.com>
---
Changes in v3: none

Changes in v2:
- Fix typos
- Make clear what does means scale factor

 Documentation/media/v4l-drivers/index.rst |  1 +
 Documentation/media/v4l-drivers/vimc.dot  | 22 +++++
 Documentation/media/v4l-drivers/vimc.rst  | 98 +++++++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 Documentation/media/v4l-drivers/vimc.dot
 create mode 100644 Documentation/media/v4l-drivers/vimc.rst

diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 33a055907258..c4c78a28654c 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -64,5 +64,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	si476x
 	soc-camera
 	uvcvideo
+	vimc
 	vivid
 	zr364xx
diff --git a/Documentation/media/v4l-drivers/vimc.dot b/Documentation/media/v4l-drivers/vimc.dot
new file mode 100644
index 000000000000..57863a13fa39
--- /dev/null
+++ b/Documentation/media/v4l-drivers/vimc.dot
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port0 -> n00000005:port0 [style=bold]
+	n00000001:port0 -> n0000000b [style=bold]
+	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000003:port0 -> n00000008:port0 [style=bold]
+	n00000003:port0 -> n0000000f [style=bold]
+	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000005:port1 -> n00000017:port0
+	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000008:port1 -> n00000017:port0 [style=dashed]
+	n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000013 [label="RGB/YUV Input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000013 -> n00000017:port0 [style=dashed]
+	n00000017 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000017:port1 -> n0000001a [style=bold]
+	n0000001a [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
new file mode 100644
index 000000000000..e235f806e252
--- /dev/null
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The Virtual Media Controller Driver (vimc)
+==========================================
+
+The vimc driver emulates complex video hardware using the V4L2 API and the Media
+API. It has a capture device and three subdevices: sensor, debayer and scaler.
+
+Topology
+--------
+
+The topology is hardcoded, although you could modify it in vimc-core and
+recompile the driver to achieve your own topology. This is the default topology:
+
+.. _vimc_topology_graph:
+
+.. kernel-figure:: vimc.dot
+    :alt:   vimc.dot
+    :align: center
+
+    Media pipeline graph on vimc
+
+Configuring the topology
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+Each subdevice will come with its default configuration (pixelformat, height,
+width, ...). One needs to configure the topology in order to match the
+configuration on each linked subdevice to stream frames through the pipeline.
+If the configuration doesn't match, the stream will fail. The ``v4l2-utils``
+is a bundle of user-space applications, that comes with ``media-ctl`` and
+``v4l2-ctl`` that can be used to configure the vimc configuration. This sequence
+of commands fits for the default topology:
+
+.. code-block:: bash
+
+        media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
+        media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
+        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
+        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
+        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
+        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
+        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
+
+Subdevices
+----------
+
+Subdevices define the behavior of an entity in the topology. Depending on the
+subdevice, the entity can have multiple pads of type source or sink.
+
+vimc-sensor:
+	Generates images in several formats using video test pattern generator.
+	Exposes:
+
+	* 1 Pad source
+
+vimc-debayer:
+	Transforms images in bayer format into a non-bayer format.
+	Exposes:
+
+	* 1 Pad sink
+	* 1 Pad source
+
+vimc-scaler:
+	Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
+        1920x1440 image. (this value can be configured, see at
+        `Module options`_).
+	Exposes:
+
+	* 1 Pad sink
+	* 1 Pad source
+
+vimc-capture:
+	Exposes node /dev/videoX to allow userspace to capture the stream.
+	Exposes:
+
+	* 1 Pad sink
+	* 1 Pad source
+
+Module options
+---------------
+
+Vimc has a few module parameters to configure the driver. You should pass
+those arguments to each subdevice, not to the vimc module. For example::
+
+        vimc_subdevice.param=value
+
+* ``vimc_scaler.sca_mult=<unsigned int>``
+
+        Image size multiplier factor to be used to multiply both width and
+        height, so the image size will be ``sca_mult^2`` bigger than the
+        original one. Currently, only supports scaling up (the default value
+        is 3).
+
+* ``vimc_debayer.deb_mean_win_size=<unsigned int>``
+
+        Window size to calculate the mean. Note: the window size needs to be an
+        odd number, as the main pixel stays in the center of the window,
+        otherwise the next odd number is considered (the default value is 3).
-- 
2.22.0

