Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918F7223EA2
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 16:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgGQOuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 10:50:23 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:32989 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgGQOuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 10:50:23 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id EE39624001B;
        Fri, 17 Jul 2020 14:50:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 06/10] media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
Date:   Fri, 17 Jul 2020 16:53:20 +0200
Message-Id: <20200717145324.292820-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
References: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the removal of the legacy g_mbus_config and s_mbus_config video
operations, the sole users of V4L2_MBUS_* flags are now the newly
introduced get_mbus_config and set_mbus_config pad operations.

As the semantic of the new operations differs from the semantic of
the legacy ones, add a usage note in the v4l2-mediabus.h header to
specify how to use the flags.

Also add a TODO note to record that we intend to replace the existing
flags with fields, to prevent users from mixing conflicting values
in a single operation call.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-mediabus.h | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 45f88f0248c4..14818901e713 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -11,9 +11,34 @@
 #include <linux/v4l2-mediabus.h>
 #include <linux/bitops.h>

+/*
+ * How to use the V4L2_MBUS_* flags:
+ * Flags are defined for each of the possible states and values of a media
+ * bus configuration parameter. One and only one bit of each group of flags
+ * shall be set by the users of the v4l2_subdev_pad_ops.get_mbus_config and
+ * v4l2_subdev_pad_ops.set_mbus_config operations to ensure that no
+ * conflicting settings are specified when reporting and setting the media bus
+ * configuration with the two operations respectively. For example, it is
+ * invalid to set or clear both the V4L2_MBUS_HSYNC_ACTIVE_HIGH and the
+ * V4L2_MBUS_HSYNC_ACTIVE_LOW flag at the same time. Instead either flag
+ * V4L2_MBUS_HSYNC_ACTIVE_HIGH or flag V4L2_MBUS_HSYNC_ACTIVE_LOW shall be
+ * set. The same is true for the V4L2_MBUS_CSI2_1/2/3/4_LANE flags group: only
+ * one of these four bits shall be set.
+ *
+ * TODO: replace the existing V4L2_MBUS_* flags with structures of fields
+ * to avoid conflicting settings.
+ *
+ * In example:
+ *     #define V4L2_MBUS_HSYNC_ACTIVE_HIGH             BIT(2)
+ *     #define V4L2_MBUS_HSYNC_ACTIVE_LOW              BIT(3)
+ * will be replaced by a field whose value reports the intended active state of
+ * the signal:
+ *     unsigned int v4l2_mbus_hsync_active : 1;
+ */
+
 /* Parallel flags */
 /*
- * Can the client run in master or in slave mode. By "Master mode" an operation
+ * The client runs in master or in slave mode. By "Master mode" an operation
  * mode is meant, when the client (e.g., a camera sensor) is producing
  * horizontal and vertical synchronisation. In "Slave mode" the host is
  * providing these signals to the slave.
@@ -45,17 +70,17 @@
 #define V4L2_MBUS_DATA_ENABLE_LOW		BIT(15)

 /* Serial flags */
-/* How many lanes the client can use */
+/* CSI-2 D-PHY number of data lanes. */
 #define V4L2_MBUS_CSI2_1_LANE			BIT(0)
 #define V4L2_MBUS_CSI2_2_LANE			BIT(1)
 #define V4L2_MBUS_CSI2_3_LANE			BIT(2)
 #define V4L2_MBUS_CSI2_4_LANE			BIT(3)
-/* On which channels it can send video data */
+/* CSI-2 Virtual Channel identifiers. */
 #define V4L2_MBUS_CSI2_CHANNEL_0		BIT(4)
 #define V4L2_MBUS_CSI2_CHANNEL_1		BIT(5)
 #define V4L2_MBUS_CSI2_CHANNEL_2		BIT(6)
 #define V4L2_MBUS_CSI2_CHANNEL_3		BIT(7)
-/* Does it support only continuous or also non-continuous clock mode */
+/* Clock non-continuous mode support. */
 #define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
 #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)

--
2.27.0

