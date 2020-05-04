Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9331D1C3591
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgEDJ0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgEDJ0d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:33 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C30DF11FC;
        Mon,  4 May 2020 11:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584389;
        bh=CyOI4WTR4plAUuSDgiW+zcvB3c4nvfTrbn2gr+jBzLo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eH2orPfInAW/oSMDLsD/zefRcPac48EbC/B9OnhpNdkM0tFIZssWWFa63SWX2RT+5
         3PEDls/we330pNn++Fiq+ZZ/zvq880tRO24xWnzUri905pqM/MQ0mSBJijbbqMCUrO
         MlkX5PAPGppAKxFt3yNT1ByUbCfWxNVH9rO7poWg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 07/34] staging: bcm2835: Break MMAL support out from camera
Date:   Mon,  4 May 2020 12:25:44 +0300
Message-Id: <20200504092611.9798-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

The BCM2835 camera host is currently the only component that uses the
VCHIQ MMAL interface. This will soon change with the upporting of
BCM2835 ISP, which make use of the same interface.

Break VCHIQ MMAL interface support out from camera host directory to
make it possible for the ISP driver to use it as well.

The only modification to the existing mmal code is the introduction of
EXPORT_SYMBOL() for symbols required by bcm2835-camera and the addition
of the module author and licenses.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/staging/vc04_services/Kconfig         |  2 ++
 drivers/staging/vc04_services/Makefile        |  7 +++---
 .../vc04_services/bcm2835-camera/Kconfig      |  1 +
 .../vc04_services/bcm2835-camera/Makefile     |  4 ++--
 .../staging/vc04_services/vchiq-mmal/Kconfig  |  8 +++++++
 .../staging/vc04_services/vchiq-mmal/Makefile |  8 +++++++
 .../mmal-common.h                             |  0
 .../mmal-encodings.h                          |  0
 .../mmal-msg-common.h                         |  0
 .../mmal-msg-format.h                         |  0
 .../mmal-msg-port.h                           |  0
 .../{bcm2835-camera => vchiq-mmal}/mmal-msg.h |  0
 .../mmal-parameters.h                         |  0
 .../mmal-vchiq.c                              | 22 +++++++++++++++++++
 .../mmal-vchiq.h                              |  0
 15 files changed, 47 insertions(+), 5 deletions(-)
 create mode 100644 drivers/staging/vc04_services/vchiq-mmal/Kconfig
 create mode 100644 drivers/staging/vc04_services/vchiq-mmal/Makefile
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-common.h (100%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-encodings.h (100%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-msg-common.h (100%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-msg-format.h (100%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-msg-port.h (100%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-msg.h (100%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-parameters.h (100%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-vchiq.c (98%)
 rename drivers/staging/vc04_services/{bcm2835-camera => vchiq-mmal}/mmal-vchiq.h (100%)

diff --git a/drivers/staging/vc04_services/Kconfig b/drivers/staging/vc04_services/Kconfig
index b9f1f019ebd8..7ae21d7f359b 100644
--- a/drivers/staging/vc04_services/Kconfig
+++ b/drivers/staging/vc04_services/Kconfig
@@ -25,5 +25,7 @@ source "drivers/staging/vc04_services/bcm2835-camera/Kconfig"
 
 source "drivers/staging/vc04_services/vc-sm-cma/Kconfig"
 
+source "drivers/staging/vc04_services/vchiq-mmal/Kconfig"
+
 endif
 
diff --git a/drivers/staging/vc04_services/Makefile b/drivers/staging/vc04_services/Makefile
index 6e1abf494c1a..296aff05b9ab 100644
--- a/drivers/staging/vc04_services/Makefile
+++ b/drivers/staging/vc04_services/Makefile
@@ -10,9 +10,10 @@ vchiq-objs := \
    interface/vchiq_arm/vchiq_util.o \
    interface/vchiq_arm/vchiq_connected.o \
 
-obj-$(CONFIG_SND_BCM2835)	+= bcm2835-audio/
-obj-$(CONFIG_VIDEO_BCM2835)	+= bcm2835-camera/
-obj-$(CONFIG_BCM_VC_SM_CMA) 	+= vc-sm-cma/
+obj-$(CONFIG_SND_BCM2835)		+= bcm2835-audio/
+obj-$(CONFIG_VIDEO_BCM2835)		+= bcm2835-camera/
+obj-$(CONFIG_BCM_VC_SM_CMA) 		+= vc-sm-cma/
+obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+= vchiq-mmal/
 
 ccflags-y += -D__VCCOREVER__=0x04000000
 
diff --git a/drivers/staging/vc04_services/bcm2835-camera/Kconfig b/drivers/staging/vc04_services/bcm2835-camera/Kconfig
index c81baf2c111e..d0653d1ed3c7 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/Kconfig
+++ b/drivers/staging/vc04_services/bcm2835-camera/Kconfig
@@ -4,6 +4,7 @@ config VIDEO_BCM2835
 	depends on MEDIA_SUPPORT
 	depends on VIDEO_V4L2 && (ARCH_BCM2835 || COMPILE_TEST)
 	select BCM2835_VCHIQ
+	select BCM2835_VCHIQ_MMAL
 	select VIDEOBUF2_VMALLOC
 	select BTREE
 	help
diff --git a/drivers/staging/vc04_services/bcm2835-camera/Makefile b/drivers/staging/vc04_services/bcm2835-camera/Makefile
index 472f21e1f2a1..3a76d6ade428 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/Makefile
+++ b/drivers/staging/vc04_services/bcm2835-camera/Makefile
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 bcm2835-v4l2-$(CONFIG_VIDEO_BCM2835) := \
 	bcm2835-camera.o \
-	controls.o \
-	mmal-vchiq.o
+	controls.o
 
 obj-$(CONFIG_VIDEO_BCM2835) += bcm2835-v4l2.o
 
 ccflags-y += \
 	-I $(srctree)/$(src)/.. \
+	-I $(srctree)/$(src)/../vchiq-mmal/ \
 	-D__VCCOREVER__=0x04000000
diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
new file mode 100644
index 000000000000..106f71e709df
--- /dev/null
+++ b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
@@ -0,0 +1,8 @@
+config BCM2835_VCHIQ_MMAL
+	tristate "BCM2835 MMAL VCHIQ service"
+	depends on (ARCH_BCM2835 || COMPILE_TEST)
+	select BCM_VC_SM_CMA
+	help
+	  Enables the MMAL API over VCHIQ interface as used for the
+	  majority of the multimedia services on VideoCore.
+	  Defaults to Y when the Broadcomd BCM2835 camera host is selected.
diff --git a/drivers/staging/vc04_services/vchiq-mmal/Makefile b/drivers/staging/vc04_services/vchiq-mmal/Makefile
new file mode 100644
index 000000000000..f8164c33aec3
--- /dev/null
+++ b/drivers/staging/vc04_services/vchiq-mmal/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+bcm2835-mmal-vchiq-objs := mmal-vchiq.o
+
+obj-$(CONFIG_BCM2835_VCHIQ_MMAL) += bcm2835-mmal-vchiq.o
+
+ccflags-y += \
+	-I$(srctree)/$(src)/.. \
+	-D__VCCOREVER__=0x04000000
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-encodings.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-encodings.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-encodings.h
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-common.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-common.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-msg-common.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-msg-common.h
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-format.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-msg-format.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-msg-format.h
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg-port.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg-port.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-msg-port.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-msg-port.h
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
similarity index 98%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index de03b90021a8..cb3ffebb9ace 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -17,6 +17,7 @@
 
 #include <linux/errno.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
@@ -1396,6 +1397,7 @@ int vchiq_mmal_port_set_format(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_port_set_format);
 
 int vchiq_mmal_port_parameter_set(struct vchiq_mmal_instance *instance,
 				  struct vchiq_mmal_port *port,
@@ -1412,6 +1414,7 @@ int vchiq_mmal_port_parameter_set(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_port_parameter_set);
 
 int vchiq_mmal_port_parameter_get(struct vchiq_mmal_instance *instance,
 				  struct vchiq_mmal_port *port,
@@ -1428,6 +1431,7 @@ int vchiq_mmal_port_parameter_get(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_port_parameter_get);
 
 /* enable a port
  *
@@ -1458,6 +1462,7 @@ int vchiq_mmal_port_enable(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_port_enable);
 
 int vchiq_mmal_port_disable(struct vchiq_mmal_instance *instance,
 			    struct vchiq_mmal_port *port)
@@ -1478,6 +1483,7 @@ int vchiq_mmal_port_disable(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_port_disable);
 
 /* ports will be connected in a tunneled manner so data buffers
  * are not handled by client.
@@ -1565,6 +1571,7 @@ int vchiq_mmal_port_connect_tunnel(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_port_connect_tunnel);
 
 int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
 			     struct vchiq_mmal_port *port,
@@ -1583,6 +1590,7 @@ int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_submit_buffer);
 
 int mmal_vchi_buffer_init(struct vchiq_mmal_instance *instance,
 			  struct mmal_buffer *buf)
@@ -1595,6 +1603,7 @@ int mmal_vchi_buffer_init(struct vchiq_mmal_instance *instance,
 	buf->msg_context = msg_context;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mmal_vchi_buffer_init);
 
 int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 {
@@ -1606,6 +1615,7 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
 
 /* Initialise a mmal component and its ports
  *
@@ -1693,6 +1703,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
 
 /*
  * cause a mmal component to be destroyed
@@ -1714,6 +1725,7 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_component_finalise);
 
 /*
  * cause a mmal component to be enabled
@@ -1739,6 +1751,7 @@ int vchiq_mmal_component_enable(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_component_enable);
 
 /*
  * cause a mmal component to be enabled
@@ -1764,6 +1777,7 @@ int vchiq_mmal_component_disable(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_component_disable);
 
 int vchiq_mmal_version(struct vchiq_mmal_instance *instance,
 		       u32 *major_out, u32 *minor_out)
@@ -1779,6 +1793,7 @@ int vchiq_mmal_version(struct vchiq_mmal_instance *instance,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_version);
 
 int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 {
@@ -1809,6 +1824,7 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance)
 
 	return status;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_finalise);
 
 int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 {
@@ -1889,3 +1905,9 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out_instance)
 	kfree(instance);
 	return -ENODEV;
 }
+EXPORT_SYMBOL_GPL(vchiq_mmal_init);
+
+MODULE_DESCRIPTION("BCM2835 MMAL VCHIQ interface");
+MODULE_AUTHOR("Dave Stevenson, <dave.stevenson@raspberrypi.org>");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("0.0.1");
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
similarity index 100%
rename from drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h
rename to drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
-- 
Regards,

Laurent Pinchart

