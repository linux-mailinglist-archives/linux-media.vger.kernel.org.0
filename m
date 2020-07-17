Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B3B223E98
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 16:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGQOuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 10:50:10 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34039 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgGQOuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 10:50:09 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5DB3124001B;
        Fri, 17 Jul 2020 14:50:05 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v8 01/10] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
Date:   Fri, 17 Jul 2020 16:53:15 +0200
Message-Id: <20200717145324.292820-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
References: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce two new pad operations to allow retrieving and configuring the
media bus parameters on a subdevice pad.

The newly introduced operations aims to replace the s/g_mbus_config video
operations, which have been on their way for deprecation since a long
time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 16 +++++++++++++++
 include/media/v4l2-subdev.h           | 28 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 6b989fe5a0a9..a7d508e74d6b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -309,6 +309,20 @@ static int call_enum_dv_timings(struct v4l2_subdev *sd,
 	       sd->ops->pad->enum_dv_timings(sd, dvt);
 }
 
+static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_config *config)
+{
+	return check_pad(sd, pad) ? :
+	       sd->ops->pad->get_mbus_config(sd, pad, config);
+}
+
+static int call_set_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_config *config)
+{
+	return check_pad(sd, pad) ? :
+	       sd->ops->pad->get_mbus_config(sd, pad, config);
+}
+
 static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.get_fmt		= call_get_fmt,
 	.set_fmt		= call_set_fmt,
@@ -321,6 +335,8 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.set_edid		= call_set_edid,
 	.dv_timings_cap		= call_dv_timings_cap,
 	.enum_dv_timings	= call_enum_dv_timings,
+	.get_mbus_config	= call_get_mbus_config,
+	.set_mbus_config	= call_set_mbus_config,
 };
 
 static const struct v4l2_subdev_video_ops v4l2_subdev_call_video_wrappers = {
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f7fe78a6f65a..57226e13ef91 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -670,6 +670,30 @@ struct v4l2_subdev_pad_config {
  *
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
+ *
+ * @get_mbus_config: get the media bus configuration of a remote sub-device.
+ *		     The media bus configuration is usually retrieved from the
+ *		     firmware interface at sub-device probe time, immediately
+ *		     applied to the hardware and eventually adjusted by the
+ *		     driver. Remote sub-devices (usually video receivers) shall
+ *		     use this operation to query the transmitting end bus
+ *		     configuration in order to adjust their own one accordingly.
+ *		     Callers should make sure they get the most up-to-date as
+ *		     possible configuration from the remote end, likely calling
+ *		     this operation as close as possible to stream on time. The
+ *		     operation shall fail if the pad index it has been called on
+ *		     is not valid or in case of unrecoverable failures.
+ *
+ * @set_mbus_config: set the media bus configuration of a remote sub-device.
+ *		     This operations is intended to allow, in combination with
+ *		     the get_mbus_config operation, the negotiation of media bus
+ *		     configuration parameters between media sub-devices. The
+ *		     operation shall not fail if the requested configuration is
+ *		     not supported, but the driver shall update the content of
+ *		     the %config argument to reflect what has been actually
+ *		     applied to the hardware. The operation shall fail if the
+ *		     pad index it has been called on is not valid or in case of
+ *		     unrecoverable failures.
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
@@ -710,6 +734,10 @@ struct v4l2_subdev_pad_ops {
 			      struct v4l2_mbus_frame_desc *fd);
 	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
 			      struct v4l2_mbus_frame_desc *fd);
+	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_config *config);
+	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
+			       struct v4l2_mbus_config *config);
 };
 
 /**
-- 
2.27.0

