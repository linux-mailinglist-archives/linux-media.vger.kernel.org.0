Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71DD6F0123
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 16:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389781AbfKEPVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 10:21:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49070 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389689AbfKEPVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 10:21:18 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id DC2A028ED26
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com
Subject: [PATCH v2 2/3] media: vimc: use configfs instead of having hardcoded configuration
Date:   Tue,  5 Nov 2019 16:20:58 +0100
Message-Id: <20191105152059.9994-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191105152059.9994-1-dafna.hirschfeld@collabora.com>
References: <20191105152059.9994-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use configfs in order to create a device and set its topology
and remove the hardcoded device.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
[refactored for upstream]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 Documentation/ABI/testing/configfs-vimc    |   6 +
 Documentation/media/v4l-drivers/vimc.dot   |  28 +-
 Documentation/media/v4l-drivers/vimc.rst   | 296 +++++++++++++----
 drivers/media/platform/vimc/Kconfig        |   8 +-
 drivers/media/platform/vimc/vimc-capture.c |  21 +-
 drivers/media/platform/vimc/vimc-common.h  |  45 ++-
 drivers/media/platform/vimc/vimc-core.c    | 356 ++++++++++-----------
 drivers/media/platform/vimc/vimc-debayer.c |  12 +-
 drivers/media/platform/vimc/vimc-scaler.c  |  11 +-
 drivers/media/platform/vimc/vimc-sensor.c  |  10 +-
 10 files changed, 475 insertions(+), 318 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-vimc

diff --git a/Documentation/ABI/testing/configfs-vimc b/Documentation/ABI/testing/configfs-vimc
new file mode 100644
index 000000000000..101af83eb249
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-vimc
@@ -0,0 +1,6 @@
+What:		/config/vimc
+Date:		November 2019
+KernelVersion:	//TODO
+Contact:	linux-media@vger.kernel.org
+Description:
+		Allow userspace to configure a vimc device
diff --git a/Documentation/media/v4l-drivers/vimc.dot b/Documentation/media/v4l-drivers/vimc.dot
index 57863a13fa39..e3b41ac2bc46 100644
--- a/Documentation/media/v4l-drivers/vimc.dot
+++ b/Documentation/media/v4l-drivers/vimc.dot
@@ -2,21 +2,15 @@
 
 digraph board {
 	rankdir=TB
-	n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000001:port0 -> n00000005:port0 [style=bold]
-	n00000001:port0 -> n0000000b [style=bold]
-	n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000003:port0 -> n00000008:port0 [style=bold]
-	n00000003:port0 -> n0000000f [style=bold]
-	n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000005:port1 -> n00000017:port0
-	n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000008:port1 -> n00000017:port0 [style=dashed]
-	n0000000b [label="Raw Capture 0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
-	n0000000f [label="Raw Capture 1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
-	n00000013 [label="RGB/YUV Input\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
-	n00000013 -> n00000017:port0 [style=dashed]
-	n00000017 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000017:port1 -> n0000001a [style=bold]
-	n0000001a [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000001 [label="cap-deb\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n00000005 [label="cap-sen\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000009 [label="cap-sca\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n0000000d [label="{{<port0> 0} | sca\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000000d:port1 -> n00000009 [style=bold]
+	n00000010 [label="{{<port0> 0} | deb\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000010:port1 -> n00000001 [style=bold]
+	n00000010:port1 -> n0000000d:port0 [style=bold]
+	n00000013 [label="{{} | sen\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000013:port0 -> n00000005 [style=bold]
+	n00000013:port0 -> n00000010:port0 [style=bold]
 }
diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
index 8f5d7f8d83bb..159362ffc995 100644
--- a/Documentation/media/v4l-drivers/vimc.rst
+++ b/Documentation/media/v4l-drivers/vimc.rst
@@ -1,99 +1,277 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+==========================================
 The Virtual Media Controller Driver (vimc)
 ==========================================
 
-The vimc driver emulates complex video hardware using the V4L2 API and the Media
-API. It has a capture device and three subdevices: sensor, debayer and scaler.
-
-Topology
---------
-
-The topology is hardcoded, although you could modify it in vimc-core and
-recompile the driver to achieve your own topology. This is the default topology:
-
-.. _vimc_topology_graph:
-
-.. kernel-figure:: vimc.dot
-    :alt:   Diagram of the default media pipeline topology
-    :align: center
-
-    Media pipeline graph on vimc
+The vimc driver emulates complex video hardware topologies using the V4L2 API
+and the Media API. It has a capture device and three subdevices:
 
-Configuring the topology
-~~~~~~~~~~~~~~~~~~~~~~~~
+sensor, debayer and scaler. It exposes media devices through /dev/mediaX nodes,
+video capture devices through /dev/videoX and sub-devices through /dev/v4l-subdevX.
 
-Each subdevice will come with its default configuration (pixelformat, height,
-width, ...). One needs to configure the topology in order to match the
-configuration on each linked subdevice to stream frames through the pipeline.
-If the configuration doesn't match, the stream will fail. The ``v4l-utils``
-package is a bundle of user-space applications, that comes with ``media-ctl`` and
-``v4l2-ctl`` that can be used to configure the vimc configuration. This sequence
-of commands fits for the default topology:
-
-.. code-block:: bash
 
-        media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
-        media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
-        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
-        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
-        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
-        v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
-        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
+ConfigFS API is used to dynamically configure a media device
+and its topology which can then be used for specific testing needs.
 
 Subdevices
-----------
+==========
 
 Subdevices define the behavior of an entity in the topology. Depending on the
 subdevice, the entity can have multiple pads of type source or sink.
 
 vimc-sensor:
-	Generates images in several formats using video test pattern generator.
-	Exposes:
+Generates images in several formats using video test pattern generator.
+Exposes:
 
-	* 1 Pad source
+* 1 Pad source
 
 vimc-debayer:
-	Transforms images in bayer format into a non-bayer format.
-	Exposes:
+Transforms images in bayer format into a non-bayer format.
+Exposes:
 
-	* 1 Pad sink
-	* 1 Pad source
+* 1 Pad sink
+* 1 Pad source
 
 vimc-scaler:
-	Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
-        1920x1440 image. (this value can be configured, see at
-        `Module options`_).
-	Exposes:
+Scales up the image by a factor of 3. E.g.: a 640x480 image becomes a
+1920x1440 image. (this value can be configured, see
+`Module options`_).
+Exposes:
 
-	* 1 Pad sink
-	* 1 Pad source
+* 1 Pad sink
+* 1 Pad source
 
 vimc-capture:
-	Exposes node /dev/videoX to allow userspace to capture the stream.
-	Exposes:
+Exposes node /dev/videoX to allow userspace to capture the stream.
+Exposes:
 
-	* 1 Pad sink
-	* 1 Pad source
+* 1 Pad sink
+* 1 Pad source
 
 
 Module options
---------------
+==============
 
 Vimc has a module parameter to configure the driver.
 
 * ``sca_mult=<unsigned int>``
 
-        Image size multiplier factor to be used to multiply both width and
-        height, so the image size will be ``sca_mult^2`` bigger than the
-        original one. Currently, only supports scaling up (the default value
-        is 3).
+Image size multiplier factor to be used to multiply both width and
+height, so the image size will be ``sca_mult^2`` bigger than the
+original one. Currently, only supports scaling up (the default value
+is 3).
+
+
+Configuring a topology through ConfigFS (Experimental)
+======================================================
+
+.. note:: This API is under development and might change in the future.
+
+Mount configfs:
+::
+
+	CONFIGFS_ROOT=/sys/kernel/config
+	$ mkdir $CONFIGFS_ROOT
+	$ mount -t configfs none $CONFIGFS_ROOT
+
+When loading the module, you will see a folder named vimc
+::
+
+	$ tree $CONFIGFS_ROOT
+	/sys/kernel/config
+	`-- vimc
+
+Creating a media device
+-----------------------
+
+Create a folder under ``$CONFIGFS_ROOT/vimc/`` in order to create media device.
+
+Example:
+::
+
+	$ mkdir $CONFIGFS_ROOT/vimc/mdev
+	$ tree $CONFIGFS_ROOT/vimc/mdev
+	/sys/kernel/config/
+	`-- vimc
+	    `-- mdev
+	        `-- hotplug
+
+Creating entities
+-----------------
+
+In order to create an entity in the media device's topology,
+create a folder under ``$CONFIGFS_ROOT/vimc/<mdev-name>/``
+with the following format:
+
+	<entity-type>:<entity-name>
+
+Where ``<entity-type>`` is one of the following:
+
+- vimc-sensor
+- vimc-scaler
+- vimc-debayer
+- vimc-capture
+
+Example:
+::
+
+	$ mkdir $CONFIGFS_ROOT/vimc/mdev/vimc-sensor:sen
+	$ mkdir $CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen
+	$ tree $CONFIGFS_ROOT/
+	/sys/kernel/config/
+	`-- vimc
+	    `-- mdev
+		|-- hotplug
+		|-- vimc-capture:cap-sen
+		|   `-- sink:0
+		`-- vimc-sensor:sen
+                    `-- source:0
+
+Default folders are created under the entity directory for each pad of the entity.
+It is not possible to create two entities of different types with the same name.
+
+Creating links
+--------------
+
+In order to create a link between two entities, you should create a directory
+under the sink pad of the link and then create a symbolic link to it from the source pad:
+
+Example:
+::
+
+	$ mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen/sink:0/sen-to-cap"
+	$ ln -s "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen/sink:0/sen-to-cap" "$CONFIGFS_ROOT/vimc/mdev/vimc-sensor:sen/source:0/sen-to-cap"
+	$ tree $CONFIGFS_ROOT
+	/sys/kernel/config
+	`-- vimc
+	    `-- mdev
+        	|-- hotplug
+	        |-- vimc-capture:cap-sen
+        	|   `-- sink:0
+	        |       `-- sen-to-cap
+        	|           `-- type
+	        `-- vimc-sensor:sen
+        	    `-- source:0
+                	`-- sen-to-cap -> ../../../../../vimc/mdev/cap-sen/sink:0/sen-to-cap
+
+The ``type`` file is used to set the type of the link. It's values correspond to setting/unsetting
+the flags ``MEDIA_LNK_FL_ENABLED`` and ``MEDIA_LNK_FL_IMMUTABLE`` that are described
+in :ref:`Documentation/media/uapi/mediactl/media-types.rst <media-link-flag>`
+( seek for ``MEDIA_LNK_FL_*``)
+
+The possible values are:
+
+- "on", "enabled", "1" - to set ``MEDIA_LNK_FL_ENABLED`` and unset ``MEDIA_LNK_FL_IMMUTABLE``.
+- "off", "disabled", "0" - to unset both ``MEDIA_LNK_FL_ENABLED`` and  ``MEDIA_LNK_FL_IMMUTABLE``.
+- "immutable" - to set both ``MEDIA_LNK_FL_ENABLED`` and ``MEDIA_LNK_FL_IMMUTABLE``
+
+Example:
+::
+
+	$ echo on > $CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen/sink:0/sen-to-cap/type
+	$ cat $CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen/sink:0/sen-to-cap/type
+	enabled
+
+Activating/Deactivating device
+------------------------------
+
+You can activate the device by writing one of "plugged", "plug" or "1" to the file
+``$CONFIGFS_ROOT/vimc/<mdev-name>/hotplug``
+
+Example:
+::
+
+	$ echo 1 > $CONFIGFS_ROOT/vimc/mdev/hotplug
+
+You should see a new node ``/dev/mediaX`` in your devfs.
+
+You can deactivate the device by writing one of "unplugged", "unplug" or "0" to the file
+``$CONFIGFS_ROOT/vimc/<mdev-name>/hotplug``
+
+Example:
+::
+
+	$ echo unplugged > $CONFIGFS_ROOT/vimc/mdev/hotplug
+
+Topology Configuration - Full Example
+-------------------------------------
+
+Here is a full example of a simple topology configuration:
+
+.. code-block:: bash
+
+    # Creating the entities
+    mkdir "$CONFIGFS_ROOT/vimc/mdev"
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-sensor:sen"
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-debayer:deb"
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-scaler:sca"
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sca" #/dev/video2
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen" #/dev/video1
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-deb" #/dev/video0
+
+    # Creating the links
+    #sen -> deb
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-debayer:deb/sink:0/sen-to-deb"
+    ln -s "$CONFIGFS_ROOT/vimc/mdev/vimc-debayer:deb/sink:0/sen-to-deb" "$CONFIGFS_ROOT/vimc/mdev/vimc-sensor:sen/source:0/sen-to-deb"
+    echo immutable > "$CONFIGFS_ROOT/vimc/mdev/vimc-debayer:deb/sink:0/sen-to-deb/type"
+
+    #deb -> sca
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-scaler:sca/sink:0/deb-to-sca"
+    ln -s "$CONFIGFS_ROOT/vimc/mdev/vimc-scaler:sca/sink:0/deb-to-sca" "$CONFIGFS_ROOT/vimc/mdev/vimc-debayer:deb/source:1/deb-to-sca"
+    echo immutable > "$CONFIGFS_ROOT/vimc/mdev/vimc-scaler:sca/sink:0/deb-to-sca/type"
+
+    #sca -> cap-sca
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sca/sink:0/sca-to-cap"
+    ln -s "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sca/sink:0/sca-to-cap" "$CONFIGFS_ROOT/vimc/mdev/vimc-scaler:sca/source:1/sca-to-cap"
+    echo immutable > "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sca/sink:0/sca-to-cap/type"
+
+    #sen -> cap-sen
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen/sink:0/sen-to-cap"
+    ln -s "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen/sink:0/sen-to-cap" "$CONFIGFS_ROOT/vimc/mdev/vimc-sensor:sen/source:0/sen-to-cap"
+    echo immutable > "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-sen/sink:0/sen-to-cap/type"
+
+    #deb -> cap-deb
+    mkdir "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-deb/sink:0/deb-to-cap"
+    ln -s "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-deb/sink:0/deb-to-cap" "$CONFIGFS_ROOT/vimc/mdev/vimc-debayer:deb/source:1/deb-to-cap"
+    echo immutable > "$CONFIGFS_ROOT/vimc/mdev/vimc-capture:cap-deb/sink:0/deb-to-cap/type"
+
+.. _vimc_topology_graph:
+
+.. kernel-figure:: vimc.dot
+    :alt:   Diagram of the configured simple topology in the example
+    :align: center
+
+    Simple Media pipeline graph on vimc configured through configfs
+
+Configuring the pipeline formats
+================================
+
+Each subdevice has a default format configuration (pixelformat, height,
+width, ...). You should configure the formats in order to match the
+configuration on each linked subdevice to stream frames through the pipeline.
+If the configuration doesn't match, streaming will fail. The ``v4l-utils``
+package is a bundle of user-space applications, which includes ``media-ctl`` and
+``v4l2-ctl`` that can be used to configure the formats of the entities. This sequence
+of commands fits the simple topology created in the full example of topology configuration:
+
+.. code-block:: bash
+
+	media-ctl -d platform:vimc-000 -V '"sen":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d platform:vimc-000 -V '"deb":0[fmt:SBGGR8_1X8/640x480]'
+	media-ctl -d platform:vimc-000 -V '"deb":1[fmt:RGB888_1X24/640x480]'
+	media-ctl -d platform:vimc-000 -V '"sca":0[fmt:RGB888_1X24/640x480]'
+	media-ctl -d platform:vimc-000 -V '"sca":1[fmt:RGB888_1X24/640x480]'
+	v4l2-ctl -z platform:vimc-000 -d "cap-sen" -v pixelformat=BA81
+	v4l2-ctl -z platform:vimc-000 -d "cap-deb" -v pixelformat=RGB3
+	# The default scaling value of the scaler is 3, so need to set its capture accordingly
+	v4l2-ctl -z platform:vimc-000 -d "cap-sca" -v pixelformat=RGB3,width=1920,height=1440
 
 Source code documentation
--------------------------
+=========================
 
 vimc-streamer
-~~~~~~~~~~~~~
+-------------
 
 .. kernel-doc:: drivers/media/platform/vimc/vimc-streamer.h
    :internal:
diff --git a/drivers/media/platform/vimc/Kconfig b/drivers/media/platform/vimc/Kconfig
index 6e292f19e859..24eb5d661f4f 100644
--- a/drivers/media/platform/vimc/Kconfig
+++ b/drivers/media/platform/vimc/Kconfig
@@ -5,11 +5,9 @@ config VIDEO_VIMC
 	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_TPG
 	help
-	  Skeleton driver for Virtual Media Controller
+	  Virtual Media Controller Driver
 
-	  This driver can be compared to the vivid driver for emulating
-	  a media node that exposes a complex media topology. The topology
-	  is hard coded for now but is meant to be highly configurable in
-	  the future.
+	  This driver emulates a media node that exposes a complex media topology.
+	  The topology is configurable through the configfs API.
 
 	  When in doubt, say N.
diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index a0873cb12b62..72577b85619d 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -346,11 +346,12 @@ static const struct media_entity_operations vimc_cap_mops = {
 	.link_validate		= vimc_link_validate,
 };
 
-void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_cap_rm(struct vimc_ent_device *ved)
 {
-	struct vimc_cap_device *vcap;
+	struct vimc_cap_device *vcap = container_of(ved,
+						    struct vimc_cap_device,
+						    ved);
 
-	vcap = container_of(ved, struct vimc_cap_device, ved);
 	vb2_queue_release(&vcap->queue);
 	video_unregister_device(&vcap->vdev);
 }
@@ -407,10 +408,12 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Allocate the vimc_cap_device struct */
 	vcap = kzalloc(sizeof(*vcap), GFP_KERNEL);
 	if (!vcap)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
+
+	strscpy(vcap->ved.data.name, vcfg_name, sizeof(vcap->ved.data.name));
 
 	/* Initialize the media entity */
-	vcap->vdev.entity.name = vcfg_name;
+	vcap->vdev.entity.name = vcap->ved.data.name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
 	vcap->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vcap->vdev.entity,
@@ -435,7 +438,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	ret = vb2_queue_init(q);
 	if (ret) {
-		dev_err(&vimc->pdev.dev, "%s: vb2 queue init failed (err=%d)\n",
+		dev_err(vimc->mdev.dev, "%s: vb2 queue init failed (%d)\n",
 			vcfg_name, ret);
 		goto err_clean_m_ent;
 	}
@@ -455,7 +458,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	vcap->ved.ent = &vcap->vdev.entity;
 	vcap->ved.process_frame = vimc_cap_process_frame;
 	vcap->ved.vdev_get_format = vimc_cap_get_format;
-	vcap->ved.dev = &vimc->pdev.dev;
+	vcap->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
@@ -474,7 +477,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	/* Register the video_device with the v4l2 and the media framework */
 	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
 	if (ret) {
-		dev_err(&vimc->pdev.dev, "%s: video register failed (err=%d)\n",
+		dev_err(vimc->mdev.dev, "%s: video register failed (%d)\n",
 			vcap->vdev.name, ret);
 		goto err_release_queue;
 	}
@@ -489,7 +492,7 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 err_free_vcap:
 	kfree(vcap);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static void vimc_cap_create_cfs_pads(struct config_group *ent_group)
diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
index d677b0d1c990..17576d60a99c 100644
--- a/drivers/media/platform/vimc/vimc-common.h
+++ b/drivers/media/platform/vimc/vimc-common.h
@@ -159,42 +159,39 @@ struct vimc_ent_device {
 	void (*vdev_get_format)(struct vimc_ent_device *ved,
 			      struct v4l2_pix_format *fmt);
 	struct kref ref;
+	struct vimc_entity_data data;
 };
 
 /**
  * struct vimc_device - main device for vimc driver
  *
- * @pdev	pointer to the platform device
- * @pipe_cfg	pointer to the vimc pipeline configuration structure
- * @ent_devs	array of vimc_ent_device pointers
  * @mdev	the associated media_device parent
  * @v4l2_dev	Internal v4l2 parent device
+ * @ents	list of vimc_ent_device objects
  */
 struct vimc_device {
-	struct platform_device pdev;
-	const struct vimc_pipeline_config *pipe_cfg;
-	struct vimc_ent_device **ent_devs;
 	struct media_device mdev;
 	struct v4l2_device v4l2_dev;
+
+	struct list_head ents;
 };
 
 /**
- * struct vimc_ent_config	Structure which describes individual
- *				configuration for each entity
- *
- * @name			entity name
- * @ved				pointer to vimc_ent_device (a node in the
- *					topology)
- * @add				subdev add hook - initializes and registers
- *					subdev called from vimc-core
- * @rm				subdev rm hook - unregisters and frees
- *					subdev called from vimc-core
+ * struct ent_type		Structure for callbacks of entity type
+ * @name			entity type name
+ * @add				initializes and registers vimc entity
+ * @rm				unregisters vimc entity
+ * @init			called on driver init, used to register to configfs
+ * @exit			called on driver exit, used to unregister from configfs
  */
-struct vimc_ent_config {
-	const char *name;
-	struct vimc_ent_device *(*add)(struct vimc_device *vimc,
+
+struct vimc_ent_type {
+	const char name[VIMC_MAX_NAME_LEN];
+	struct vimc_ent_device*	(*add)(struct vimc_device *vimc,
 				       const char *vcfg_name);
-	void (*rm)(struct vimc_device *vimc, struct vimc_ent_device *ved);
+	void (*rm)(struct vimc_ent_device *ent);
+	void (*init)(void);
+	void (*exit)(void);
 };
 
 /**
@@ -208,25 +205,25 @@ bool vimc_is_source(struct media_entity *ent);
 /* prototypes for vimc_ent_config add and rm hooks */
 struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_cap_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_cap_rm(struct vimc_ent_device *ent);
 void vimc_cap_init(void);
 void vimc_cap_exit(void);
 
 struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_deb_rm(struct vimc_ent_device *ent);
 void vimc_deb_init(void);
 void vimc_deb_exit(void);
 
 struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_sca_rm(struct vimc_ent_device *ent);
 void vimc_sca_init(void);
 void vimc_sca_exit(void);
 
 struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 				     const char *vcfg_name);
-void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
+void vimc_sen_rm(struct vimc_ent_device *ent);
 void vimc_sen_init(void);
 void vimc_sen_exit(void);
 
diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
index 97a272f3350a..c8612bfd8a2c 100644
--- a/drivers/media/platform/vimc/vimc-core.c
+++ b/drivers/media/platform/vimc/vimc-core.c
@@ -15,176 +15,175 @@
 
 #define VIMC_MDEV_MODEL_NAME "VIMC MDEV"
 
-#define VIMC_ENT_LINK(src, srcpad, sink, sinkpad, link_flags) {	\
-	.src_ent = src,						\
-	.src_pad = srcpad,					\
-	.sink_ent = sink,					\
-	.sink_pad = sinkpad,					\
-	.flags = link_flags,					\
-}
-
-/* Structure which describes links between entities */
-struct vimc_ent_link {
-	unsigned int src_ent;
-	u16 src_pad;
-	unsigned int sink_ent;
-	u16 sink_pad;
-	u32 flags;
-};
-
-/* Structure which describes the whole topology */
-struct vimc_pipeline_config {
-	const struct vimc_ent_config *ents;
-	size_t num_ents;
-	const struct vimc_ent_link *links;
-	size_t num_links;
-};
-
-/* --------------------------------------------------------------------------
- * Topology Configuration
- */
+#include "vimc-configfs.h"
 
-static struct vimc_ent_config ent_config[] = {
+static const struct vimc_ent_type ent_types[] = {
 	{
-		.name = "Sensor A",
+		.name = VIMC_SEN_NAME,
 		.add = vimc_sen_add,
 		.rm = vimc_sen_rm,
+		.init = vimc_sen_init,
+		.exit = vimc_sen_exit,
 	},
 	{
-		.name = "Sensor B",
-		.add = vimc_sen_add,
-		.rm = vimc_sen_rm,
-	},
-	{
-		.name = "Debayer A",
+		.name = VIMC_DEB_NAME,
 		.add = vimc_deb_add,
 		.rm = vimc_deb_rm,
+		.init = vimc_deb_init,
+		.exit = vimc_deb_exit,
 	},
 	{
-		.name = "Debayer B",
-		.add = vimc_deb_add,
-		.rm = vimc_deb_rm,
-	},
-	{
-		.name = "Raw Capture 0",
-		.add = vimc_cap_add,
-		.rm = vimc_cap_rm,
-	},
-	{
-		.name = "Raw Capture 1",
+		.name = VIMC_CAP_NAME,
 		.add = vimc_cap_add,
 		.rm = vimc_cap_rm,
+		.init = vimc_cap_init,
+		.exit = vimc_cap_exit,
 	},
 	{
-		/* TODO: change this to vimc-input when it is implemented */
-		.name = "RGB/YUV Input",
-		.add = vimc_sen_add,
-		.rm = vimc_sen_rm,
-	},
-	{
-		.name = "Scaler",
+		.name = VIMC_SCA_NAME,
 		.add = vimc_sca_add,
 		.rm = vimc_sca_rm,
+		.init = vimc_sca_init,
+		.exit = vimc_sca_exit,
 	},
-	{
-		.name = "RGB/YUV Capture",
-		.add = vimc_cap_add,
-		.rm = vimc_cap_rm,
-	},
-};
-
-static const struct vimc_ent_link ent_links[] = {
-	/* Link: Sensor A (Pad 0)->(Pad 0) Debayer A */
-	VIMC_ENT_LINK(0, 0, 2, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
-	/* Link: Sensor A (Pad 0)->(Pad 0) Raw Capture 0 */
-	VIMC_ENT_LINK(0, 0, 4, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
-	/* Link: Sensor B (Pad 0)->(Pad 0) Debayer B */
-	VIMC_ENT_LINK(1, 0, 3, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
-	/* Link: Sensor B (Pad 0)->(Pad 0) Raw Capture 1 */
-	VIMC_ENT_LINK(1, 0, 5, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
-	/* Link: Debayer A (Pad 1)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(2, 1, 7, 0, MEDIA_LNK_FL_ENABLED),
-	/* Link: Debayer B (Pad 1)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(3, 1, 7, 0, 0),
-	/* Link: RGB/YUV Input (Pad 0)->(Pad 0) Scaler */
-	VIMC_ENT_LINK(6, 0, 7, 0, 0),
-	/* Link: Scaler (Pad 1)->(Pad 0) RGB/YUV Capture */
-	VIMC_ENT_LINK(7, 1, 8, 0, MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
-static struct vimc_pipeline_config pipe_cfg = {
-	.ents		= ent_config,
-	.num_ents	= ARRAY_SIZE(ent_config),
-	.links		= ent_links,
-	.num_links	= ARRAY_SIZE(ent_links)
-};
+static const struct vimc_ent_type *vimc_get_ent_type(const char *ent_type_name)
+{
+	int i;
 
-/* -------------------------------------------------------------------------- */
+	for (i = 0; i < ARRAY_SIZE(ent_types); i++)
+		if (!strcmp(ent_type_name, ent_types[i].name))
+			return &ent_types[i];
+	return NULL;
+}
 
-static void vimc_rm_links(struct vimc_device *vimc)
+struct vimc_ent_device *vimc_get_ent_dev(const struct vimc_device *vimc,
+					 const char *const name)
 {
-	unsigned int i;
+	struct vimc_ent_device *ent;
 
-	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
-		media_entity_remove_links(vimc->ent_devs[i]->ent);
+	list_for_each_entry(ent, &vimc->ents, data.entry) {
+		if (!strcmp(ent->data.name, name))
+			return ent;
+	}
+	return NULL;
 }
 
-static int vimc_create_links(struct vimc_device *vimc)
+static int vimc_core_links_create(const struct vimc_device *vimc,
+				  const struct vimc_platform_data *pdata)
 {
-	unsigned int i;
-	int ret;
+	struct vimc_link_data *link;
+
+	list_for_each_entry(link, &pdata->links, entry) {
+		struct vimc_ent_device *source = vimc_get_ent_dev(vimc,
+						 link->source->name);
+		struct vimc_ent_device *sink = vimc_get_ent_dev(vimc,
+					       link->sink->name);
+		int ret;
+
+		ret = media_create_pad_link(source->ent,
+					    link->source_pad,
+					    sink->ent,
+					    link->sink_pad,
+					    link->flags);
 
-	/* Initialize the links between entities */
-	for (i = 0; i < vimc->pipe_cfg->num_links; i++) {
-		const struct vimc_ent_link *link = &vimc->pipe_cfg->links[i];
+		if (ret) {
+			dev_err(vimc->mdev.dev, "failed creating link %s:%u->%s:%u\n",
+				link->source->name,
+				link->source_pad,
+				link->sink->name,
+				link->sink_pad);
+			return ret;
+		}
+		dev_dbg(vimc->mdev.dev, "created link %s:%u->%s:%u\n",
+			link->source->name,
+			link->source_pad,
+			link->sink->name,
+			link->sink_pad);
+	}
+	return 0;
+}
 
-		struct vimc_ent_device *ved_src =
-			vimc->ent_devs[link->src_ent];
-		struct vimc_ent_device *ved_sink =
-			vimc->ent_devs[link->sink_ent];
+static void vimc_rm_subdevs(struct vimc_device *vimc)
+{
+	struct vimc_ent_device *ent;
+	struct vimc_ent_device *ent_tmp;
 
-		ret = media_create_pad_link(ved_src->ent, link->src_pad,
-					    ved_sink->ent, link->sink_pad,
-					    link->flags);
-		if (ret)
-			goto err_rm_links;
-	}
+	list_for_each_entry_safe(ent, ent_tmp, &vimc->ents, data.entry) {
 
-	return 0;
+		const struct vimc_ent_type *ent_type =
+			vimc_get_ent_type(ent->data.type_name);
 
-err_rm_links:
-	vimc_rm_links(vimc);
-	return ret;
+		WARN_ON(!ent_type);
+		dev_dbg(vimc->mdev.dev, "removing entity %s:%s\n",
+			ent->data.type_name, ent->data.name);
+		list_del(&ent->data.entry);
+		ent_type->rm(ent);
+	}
 }
 
-static int vimc_add_subdevs(struct vimc_device *vimc)
+static int vimc_add_subdevs(struct vimc_device *vimc,
+			    const struct vimc_platform_data *pdata)
 {
-	unsigned int i;
-
-	for (i = 0; i < vimc->pipe_cfg->num_ents; i++) {
-		dev_dbg(&vimc->pdev.dev, "new entity for %s\n",
-			vimc->pipe_cfg->ents[i].name);
-		vimc->ent_devs[i] = vimc->pipe_cfg->ents[i].add(vimc,
-					vimc->pipe_cfg->ents[i].name);
-		if (!vimc->ent_devs[i]) {
-			dev_err(&vimc->pdev.dev, "add new entity for %s\n",
-				vimc->pipe_cfg->ents[i].name);
-			return -EINVAL;
+	struct vimc_entity_data *ent_data;
+	int ret;
+
+	list_for_each_entry(ent_data, &pdata->ents, entry) {
+
+		const struct vimc_ent_type *ent_type =
+			vimc_get_ent_type(ent_data->type_name);
+		struct vimc_ent_device *ent_dev;
+
+		WARN_ON(!ent_type);
+
+		ent_dev = ent_type->add(vimc, ent_data->name);
+		if (IS_ERR(ent_dev)) {
+			ret = PTR_ERR(ent_dev);
+			dev_err(vimc->mdev.dev, "failed to add entity %s:%s\n",
+				ent_data->type_name, ent_data->name);
+			goto err;
 		}
+
+		strscpy(ent_dev->data.name, ent_data->name,
+			sizeof(ent_dev->data.name));
+		ent_dev->data.type_name = ent_data->type_name;
+		list_add(&ent_dev->data.entry, &vimc->ents);
+
+		dev_dbg(vimc->mdev.dev, "entity %s:%s added\n",
+				ent_dev->data.type_name, ent_dev->data.name);
 	}
 	return 0;
+err:
+	vimc_rm_subdevs(vimc);
+	return ret;
 }
 
-static void vimc_rm_subdevs(struct vimc_device *vimc)
+static int vimc_core_add_topology(struct vimc_device *vimc,
+		struct vimc_platform_data *pdata)
 {
-	unsigned int i;
+	int ret;
 
-	for (i = 0; i < vimc->pipe_cfg->num_ents; i++)
-		if (vimc->ent_devs[i])
-			vimc->pipe_cfg->ents[i].rm(vimc, vimc->ent_devs[i]);
+	mutex_lock(&pdata->topology_mutex);
+	ret = vimc_add_subdevs(vimc, pdata);
+	if (ret) {
+		mutex_unlock(&pdata->topology_mutex);
+		return ret;
+	}
+
+	ret = vimc_core_links_create(vimc, pdata);
+	if (ret) {
+		mutex_unlock(&pdata->topology_mutex);
+		vimc_rm_subdevs(vimc);
+		return ret;
+	}
+
+	mutex_unlock(&pdata->topology_mutex);
+	return 0;
 }
 
-static int vimc_register_devices(struct vimc_device *vimc)
+static int vimc_register_devices(struct vimc_device *vimc,
+				 struct vimc_platform_data *pdata)
 {
 	int ret;
 
@@ -192,43 +191,30 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	ret = v4l2_device_register(vimc->mdev.dev, &vimc->v4l2_dev);
 	if (ret) {
 		dev_err(vimc->mdev.dev,
-			"v4l2 device register failed (err=%d)\n", ret);
+			"v4l2 device register failed (%d)\n", ret);
 		return ret;
 	}
 
-	/* allocate ent_devs */
-	vimc->ent_devs = kcalloc(vimc->pipe_cfg->num_ents,
-				 sizeof(*vimc->ent_devs), GFP_KERNEL);
-	if (!vimc->ent_devs) {
-		ret = -ENOMEM;
+	ret = vimc_core_add_topology(vimc, pdata);
+	if (ret) {
+		dev_err(vimc->mdev.dev,
+			"adding topology failed (%d)\n", ret);
 		goto err_v4l2_unregister;
 	}
 
-	/* Invoke entity config hooks to initialize and register subdevs */
-	ret = vimc_add_subdevs(vimc);
-	if (ret)
-		/* remove sundevs that got added */
-		goto err_rm_subdevs;
-
-	/* Initialize links */
-	ret = vimc_create_links(vimc);
-	if (ret)
-		goto err_rm_subdevs;
-
 	/* Register the media device */
 	ret = media_device_register(&vimc->mdev);
 	if (ret) {
 		dev_err(vimc->mdev.dev,
-			"media device register failed (err=%d)\n", ret);
+			"media device register failed (%d)\n", ret);
 		goto err_rm_subdevs;
 	}
 
-	/* Expose all subdev's nodes*/
+	/* Expose all subdev's nodes */
 	ret = v4l2_device_register_subdev_nodes(&vimc->v4l2_dev);
 	if (ret) {
 		dev_err(vimc->mdev.dev,
-			"vimc subdev nodes registration failed (err=%d)\n",
-			ret);
+			"vimc subdev nodes registration failed (%d)\n", ret);
 		goto err_mdev_unregister;
 	}
 
@@ -239,29 +225,28 @@ static int vimc_register_devices(struct vimc_device *vimc)
 	media_device_cleanup(&vimc->mdev);
 err_rm_subdevs:
 	vimc_rm_subdevs(vimc);
-	kfree(vimc->ent_devs);
 err_v4l2_unregister:
 	v4l2_device_unregister(&vimc->v4l2_dev);
 
 	return ret;
 }
 
-static void vimc_unregister(struct vimc_device *vimc)
-{
-	media_device_unregister(&vimc->mdev);
-	media_device_cleanup(&vimc->mdev);
-	v4l2_device_unregister(&vimc->v4l2_dev);
-	kfree(vimc->ent_devs);
-}
-
 static int vimc_probe(struct platform_device *pdev)
 {
-	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
+	struct vimc_platform_data *pdata = (struct vimc_platform_data *)
+						pdev->dev.platform_data;
+	struct vimc_device *vimc;
 	int ret;
 
-	dev_dbg(&pdev->dev, "probe");
+	dev_dbg(&pdev->dev, "probe\n");
+
+	vimc = devm_kzalloc(&pdev->dev, sizeof(*vimc),
+			GFP_KERNEL);
+	if (!vimc)
+		return -ENOMEM;
 
 	memset(&vimc->mdev, 0, sizeof(vimc->mdev));
+	INIT_LIST_HEAD(&vimc->ents);
 
 	/* Link the media device within the v4l2_device */
 	vimc->v4l2_dev.mdev = &vimc->mdev;
@@ -274,74 +259,67 @@ static int vimc_probe(struct platform_device *pdev)
 	vimc->mdev.dev = &pdev->dev;
 	media_device_init(&vimc->mdev);
 
-	ret = vimc_register_devices(vimc);
-	if (ret) {
-		media_device_cleanup(&vimc->mdev);
+	ret = vimc_register_devices(vimc, pdata);
+	if (ret)
 		return ret;
-	}
-
+	platform_set_drvdata(pdev, vimc);
 	return 0;
 }
 
 static int vimc_remove(struct platform_device *pdev)
 {
-	struct vimc_device *vimc = container_of(pdev, struct vimc_device, pdev);
+	struct vimc_device *vimc = platform_get_drvdata(pdev);
 
-	dev_dbg(&pdev->dev, "remove");
+	dev_dbg(&pdev->dev, "remove\n");
 
 	vimc_rm_subdevs(vimc);
-	vimc_unregister(vimc);
+	media_device_unregister(&vimc->mdev);
+	media_device_cleanup(&vimc->mdev);
+	v4l2_device_unregister(&vimc->v4l2_dev);
 
 	return 0;
 }
 
-static void vimc_dev_release(struct device *dev)
-{
-}
-
-static struct vimc_device vimc_dev = {
-	.pipe_cfg = &pipe_cfg,
-	.pdev = {
-		.name = VIMC_PDEV_NAME,
-		.dev.release = vimc_dev_release,
-	}
-};
-
 static struct platform_driver vimc_pdrv = {
 	.probe		= vimc_probe,
 	.remove		= vimc_remove,
 	.driver		= {
-		.name	= VIMC_PDEV_NAME,
+		.name	= "vimc-core",
 	},
 };
 
 static int __init vimc_init(void)
 {
-	int ret;
+	int ret, i;
 
-	ret = platform_device_register(&vimc_dev.pdev);
+	ret = platform_driver_register(&vimc_pdrv);
 	if (ret) {
-		dev_err(&vimc_dev.pdev.dev,
-			"platform device registration failed (err=%d)\n", ret);
+		pr_err("vimc init: platform driver register failed (%d)\n", ret);
 		return ret;
 	}
 
-	ret = platform_driver_register(&vimc_pdrv);
+	ret = vimc_cfs_subsys_register();
 	if (ret) {
-		dev_err(&vimc_dev.pdev.dev,
-			"platform driver registration failed (err=%d)\n", ret);
+		pr_err("%s: configfs subsys registration failed (%d)\n",
+		       __func__, ret);
 		platform_driver_unregister(&vimc_pdrv);
 		return ret;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(ent_types); i++)
+		ent_types[i].init();
 	return 0;
 }
 
 static void __exit vimc_exit(void)
 {
-	platform_driver_unregister(&vimc_pdrv);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ent_types); i++)
+		ent_types[i].exit();
 
-	platform_device_unregister(&vimc_dev.pdev);
+	vimc_cfs_subsys_unregister();
+	platform_driver_unregister(&vimc_pdrv);
 }
 
 module_init(vimc_init);
diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
index 715de945e3a2..524365410a23 100644
--- a/drivers/media/platform/vimc/vimc-debayer.c
+++ b/drivers/media/platform/vimc/vimc-debayer.c
@@ -521,9 +521,11 @@ static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
 	.s_ctrl = vimc_deb_s_ctrl,
 };
 
-void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_deb_rm(struct vimc_ent_device *ved)
 {
-	struct vimc_deb_device *vdeb;
+	struct vimc_deb_device *vdeb = container_of(ved,
+						    struct vimc_deb_device,
+						    ved);
 
 	vdeb = container_of(ved, struct vimc_deb_device, ved);
 	v4l2_device_unregister_subdev(&vdeb->sd);
@@ -557,7 +559,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 	/* Allocate the vdeb struct */
 	vdeb = kzalloc(sizeof(*vdeb), GFP_KERNEL);
 	if (!vdeb)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Create controls: */
 	v4l2_ctrl_handler_init(&vdeb->hdl, 2);
@@ -582,7 +584,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 		goto err_free_hdl;
 
 	vdeb->ved.process_frame = vimc_deb_process_frame;
-	vdeb->ved.dev = &vimc->pdev.dev;
+	vdeb->ved.dev = vimc->mdev.dev;
 	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
 
 	/* Initialize the frame format */
@@ -603,7 +605,7 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
 err_free_vdeb:
 	kfree(vdeb);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static void vimc_deb_create_cfs_pads(struct config_group *ent_group)
diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index d4d20c579bc8..271558fee50c 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -357,9 +357,11 @@ static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
 	return vsca->src_frame;
 };
 
-void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_sca_rm(struct vimc_ent_device *ved)
 {
-	struct vimc_sca_device *vsca;
+	struct vimc_sca_device *vsca = container_of(ved,
+						    struct vimc_sca_device,
+						    ved);
 
 	vsca = container_of(ved, struct vimc_sca_device, ved);
 	v4l2_device_unregister_subdev(&vsca->sd);
@@ -375,7 +377,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	/* Allocate the vsca struct */
 	vsca = kzalloc(sizeof(*vsca), GFP_KERNEL);
 	if (!vsca)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	/* Initialize ved and sd */
 	vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
@@ -392,8 +394,7 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	}
 
 	vsca->ved.process_frame = vimc_sca_process_frame;
-	vsca->ved.dev = &vimc->pdev.dev;
-
+	vsca->ved.dev = vimc->mdev.dev;
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
 
diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index 4ea831c834df..1bb53743ccee 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -310,11 +310,11 @@ static const struct v4l2_subdev_internal_ops vimc_sen_int_ops = {
 	.release = vimc_sen_release,
 };
 
-void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
+void vimc_sen_rm(struct vimc_ent_device *ent)
 {
 	struct vimc_sen_device *vsen;
 
-	vsen = container_of(ved, struct vimc_sen_device, ved);
+	vsen = container_of(ent, struct vimc_sen_device, ved);
 	v4l2_device_unregister_subdev(&vsen->sd);
 }
 
@@ -345,7 +345,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 	/* Allocate the vsen struct */
 	vsen = kzalloc(sizeof(*vsen), GFP_KERNEL);
 	if (!vsen)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	v4l2_ctrl_handler_init(&vsen->hdl, 4);
 
@@ -386,7 +386,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 		goto err_free_tpg;
 
 	vsen->ved.process_frame = vimc_sen_process_frame;
-	vsen->ved.dev = &vimc->pdev.dev;
+	vsen->ved.dev = vimc->mdev.dev;
 
 	/* Initialize the frame format */
 	vsen->mbus_format = fmt_default;
@@ -400,7 +400,7 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
 err_free_vsen:
 	kfree(vsen);
 
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static void vimc_sen_create_cfs_pads(struct config_group *ent_group)
-- 
2.20.1

