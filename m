Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7655530486A
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388581AbhAZFpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:07 -0500
Received: from retiisi.eu ([95.216.213.190]:37540 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728904AbhAYNbo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:31:44 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 79833634CCF;
        Mon, 25 Jan 2021 15:25:59 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 11/14] media: v4l2-async: Fix incorrect comment
Date:   Mon, 25 Jan 2021 15:22:27 +0200
Message-Id: <20210125132230.6600-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The v4l2_async_notifier_cleanup() documentation mentions
v4l2_fwnode_reference_parse_sensor_common, which was actually
introduced as v4l2_async_notifier_parse_fwnode_sensor_common(),
in commit 7a9ec808ad46 ("media: v4l: fwnode: Add convenience function for
parsing common external refs").

The function drivers do use is
v4l2_async_register_subdev_sensor_common().

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-async.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 0ddc06e36c08..f2cac0931372 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -174,9 +174,11 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
  *
  * @notif: pointer to &struct v4l2_async_notifier
  * @endpoint: local endpoint pointing to the remote sub-device to be matched
- * @asd: Async sub-device struct allocated by the caller. The &struct
- *	 v4l2_async_subdev shall be the first member of the driver's async
- *	 sub-device struct, i.e. both begin at the same memory address.
+ * @asd_struct_size: size of the driver's async sub-device struct, including
+ *		     sizeof(struct v4l2_async_subdev). The &struct
+ *		     v4l2_async_subdev shall be the first member of
+ *		     the driver's async sub-device struct, i.e. both
+ *		     begin at the same memory address.
  *
  * Gets the remote endpoint of a given local endpoint, set it up for fwnode
  * matching and adds the async sub-device to the notifier's @asd_list. The
@@ -184,13 +186,12 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
  * notifier cleanup time.
  *
  * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
- * exception that the fwnode refers to a local endpoint, not the remote one, and
- * the function relies on the caller to allocate the async sub-device struct.
+ * exception that the fwnode refers to a local endpoint, not the remote one.
  */
-int
+struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
 					     struct fwnode_handle *endpoint,
-					     struct v4l2_async_subdev *asd);
+					     unsigned int asd_struct_size);
 
 /**
  * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
@@ -249,7 +250,7 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * notifier after calling
  * @v4l2_async_notifier_add_subdev,
  * @v4l2_async_notifier_parse_fwnode_endpoints or
- * @v4l2_fwnode_reference_parse_sensor_common.
+ * @v4l2_async_register_subdev_sensor_common.
  *
  * There is no harm from calling v4l2_async_notifier_cleanup in other
  * cases as long as its memory has been zeroed after it has been
-- 
2.29.2

