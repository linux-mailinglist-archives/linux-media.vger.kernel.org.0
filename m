Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14031A9B57
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896430AbgDOKsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:48:08 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:47853 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896623AbgDOKrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:47:53 -0400
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 74885240002;
        Wed, 15 Apr 2020 10:47:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/6] media: v4l2-subdev: Expand get_mbus_config doc
Date:   Wed, 15 Apr 2020 12:50:00 +0200
Message-Id: <20200415105004.2497356-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Expand documentation of the newly introduced get_mbus_config() pad
operation.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

Providing this as separate patch to ease review/discussion.
Can be likely squashed in 1/6

---
 include/media/v4l2-subdev.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9bf14c41626d..e95f44e778a6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -737,7 +737,17 @@ struct v4l2_subdev_pad_config {
  * @set_frame_desc: set the low level media bus frame parameters, @fd array
  *                  may be adjusted by the subdev driver to device capabilities.
  *
- * @get_mbus_config: get the current mbus configuration
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
+ *		     stream on time.
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
--
2.26.0

