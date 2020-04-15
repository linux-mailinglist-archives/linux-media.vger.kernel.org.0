Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21CB1A9B53
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896626AbgDOKro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:47:44 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52429 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896623AbgDOKre (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:47:34 -0400
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7BCAD240002;
        Wed, 15 Apr 2020 10:47:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/6] media: v4l2-subdv: Introduce get_mbus_config pad op
Date:   Wed, 15 Apr 2020 12:49:58 +0200
Message-Id: <20200415105004.2497356-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
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
 include/media/v4l2-subdev.h | 69 +++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a4848de59852..fc16af578471 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -350,6 +350,71 @@ struct v4l2_mbus_frame_desc {
 	unsigned short num_entries;
 };
 
+/**
+ * struct v4l2_mbus_parallel_config - parallel mbus configuration
+ * @hsync_active: hsync active state: 1 for high, 0 for low
+ * @vsync_active: vsync active state: 1 for high, 0 for low
+ * @pclk_rising: pixel clock active edge: 1 for rising, 0 for falling
+ * @data_active: data lines active state: 1 for high, 0 for low
+ */
+struct v4l2_mbus_parallel_config {
+	unsigned int hsync_active : 1;
+	unsigned int vsync_active : 1;
+	unsigned int pclk_rising : 1;
+	unsigned int data_active : 1;
+};
+
+/**
+ * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
+ * @data_lanes: number of data lanes in use
+ * @clock_noncontinuous: non continuous clock enable flag: 1 for non
+ *			 continuous clock, 0 for continuous clock.
+ */
+struct v4l2_mbus_csi2_dphy_config {
+	unsigned int data_lanes : 3;
+	unsigned int clock_noncontinuous : 1;
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
@@ -670,6 +735,8 @@ struct v4l2_subdev_pad_config {
  *
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
+ *
+ * @get_mbus_config: get the current mbus configuration
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
@@ -710,6 +777,8 @@ struct v4l2_subdev_pad_ops {
 			      struct v4l2_mbus_frame_desc *fd);
 	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
 			      struct v4l2_mbus_frame_desc *fd);
+	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_pad_config *config);
 };
 
 /**
-- 
2.26.0

