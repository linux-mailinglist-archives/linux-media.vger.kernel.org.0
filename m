Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A5A21F311
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 15:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGNNyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 09:54:55 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45125 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgGNNyz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 09:54:55 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6EBE61C0005;
        Tue, 14 Jul 2020 13:54:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 1/9] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
Date:   Tue, 14 Jul 2020 15:58:04 +0200
Message-Id: <20200714135812.55158-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
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
 include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f7fe78a6f65a..d8b9d5735307 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
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
+ *		     is not valid.
+ *
+ * @set_mbus_config: set the media bus configuration of a remote sub-device.
+ *		     This operations is intended to allow, in combination with
+ *		     the get_mbus_config operation, the negotiation of media bus
+ *		     configuration parameters between media sub-devices. The
+ *		     operation shall not fail if the requested configuration is
+ *		     not supported, but the driver shall update the content of
+ *		     the %config argument to reflect what has been actually
+ *		     applied to the hardware. The operation shall fail if the
+ *		     pad index it has been called on is not valid.
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
@@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
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

