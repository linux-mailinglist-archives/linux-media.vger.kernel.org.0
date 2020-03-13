Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D104118498B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 15:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgCMOiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 10:38:01 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50923 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMOiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 10:38:00 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F2720FF80E;
        Fri, 13 Mar 2020 14:37:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
Date:   Fri, 13 Mar 2020 15:40:33 +0100
Message-Id: <20200313144035.401430-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce a new pad operation to allow retrieving the media bus
configuration on a subdevice pad.

The newly introduced operation reassembles the s/g_mbus_config video
operation, which have been on their way to be deprecated since a long
time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 761aa83a3f3c..3a1afc00e094 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
 	unsigned short num_entries;
 };
 
+/**
+ * struct v4l2_mbus_parallel_config - parallel mbus configuration
+ * @hsync_active: hsync active state: true for high, false for low
+ * @vsync_active: vsync active state: true for high, false for low
+ * @pclk_rising: pixel clock active edge: true for rising, false for falling
+ * @data_active: data lines active state: true for high, false for low
+ */
+struct v4l2_mbus_parallel_config {
+	bool hsync_active : 1;
+	bool vsync_active : 1;
+	bool pclk_rising : 1;
+	bool data_active : 1;
+};
+
+/**
+ * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
+ * @data_lanes: number of data lanes in use
+ * @clock_noncontinuous: non continuous clock enable flag
+ */
+struct v4l2_mbus_csi2_dphy_config {
+	unsigned int data_lanes : 3;
+	bool clock_noncontinuous : 1;
+};
+
+/**
+ * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
+ *
+ * TODO
+ */
+struct v4l2_mbus_csi2_cphy_config {
+	/* TODO */
+};
+
+/**
+ * struct v4l2_mbus_pad_config - media bus configuration
+ *
+ * Report the subdevice media bus information to inform the caller of the
+ * current bus configuration. The structure describes bus configuration
+ * parameters that might change in-between streaming sessions, in order to allow
+ * the caller to adjust its media bus configuration to match what is reported
+ * here.
+ *
+ * TODO: add '_pad_' to the name to distinguish this from the structure
+ * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
+ * video operations. Reuse the there defined enum v4l2_mbus_type to define
+ * the bus type.
+ *
+ * @type: mbus type. See &enum v4l2_mbus_type
+ * @parallel: parallel bus configuration parameters.
+ *	      See &struct v4l2_mbus_parallel_config
+ * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
+ *	       See &struct v4l2_mbus_csi2_dphy_config
+ * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
+ *	       See &struct v4l2_mbus_csi2_cphy_config
+ */
+struct v4l2_mbus_pad_config {
+	enum v4l2_mbus_type type;
+	union {
+		struct v4l2_mbus_parallel_config parallel;
+		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
+		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
+	};
+};
+
 /**
  * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
  *				  in video mode.
@@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
  *
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
+ * @get_mbus_config: get the current mbus configuration
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
@@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
 			      struct v4l2_mbus_frame_desc *fd);
 	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
 			      struct v4l2_mbus_frame_desc *fd);
+	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_pad_config *config);
 };
 
 /**
-- 
2.25.1

