Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83CF41D36C1
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgENQmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:42:45 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50689 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgENQmo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:42:44 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 365701C0002;
        Thu, 14 May 2020 16:42:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/8] media: v4l2-subdv: Introduce [s|g]et_mbus_config pad ops
Date:   Thu, 14 May 2020 18:45:33 +0200
Message-Id: <20200514164540.507233-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514164540.507233-1-jacopo+renesas@jmondi.org>
References: <20200514164540.507233-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce two new pad operations to allow retrieving and configuring the
media bus configuration on a subdevice pad.

The newly introduced operations aims to replace the s/g_mbus_config video
operations, which have been on their way to be deprecated since a long
time.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a4848de59852..8d5f4a255b87 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -670,6 +670,32 @@ struct v4l2_subdev_pad_config {
  *
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
+ *
+ * @get_mbus_config: get the current media bus configuration. This operation is
+ *		     intended to be used to synchronize the media bus
+ *		     configuration parameters between receivers and
+ *		     transmitters. The static bus configuration is usually
+ *		     received from the firmware interface, and updated
+ *		     dynamically using this operation to retrieve bus
+ *		     configuration parameters which could change at run-time.
+ *		     Callers should make sure they get the most up-to-date as
+ *		     possible configuration from the connected sub-device,
+ *		     likely calling this operation as close as possible to
+ *		     stream on time. The operation is allowed to fail if the
+ *		     pad index it has been called on is unsupported.
+ *
+ * @set_mbus_config: set the media bus configuration. This operations is
+ *		     intended to allow, in combination with the
+ *		     get_mbus_format operation, the negotiation of media bus
+ *		     configuration parameters between media subdevices.
+ *		     The initial media bus configuration is retrieved from
+ *		     the firmware interface and later updated through this
+ *		     operation if the sub-device allows changing it.
+ *		     The operation shall not fail if the requested configuration
+ *		     is not supported, but the driver shall update the received
+ *		     %config argument to reflect what has been actually applied
+ *		     to the hardware. The operation is allowed to fail if the
+ *		     pad index it has been called on is unsupported.
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
@@ -710,6 +736,10 @@ struct v4l2_subdev_pad_ops {
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
2.26.2

