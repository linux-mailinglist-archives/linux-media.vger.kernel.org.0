Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFEB2F869D
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 21:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387581AbhAOUY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 15:24:56 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37870 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbhAOUYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 15:24:54 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 33B011F45F0C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: v4l2-async: Remove V4L2_ASYNC_MATCH_DEVNAME
Date:   Fri, 15 Jan 2021 17:23:57 -0300
Message-Id: <20210115202357.169556-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The last user for this type of match was the soc-camera/sh_mobile_csi2
driver, which was removed in v4.9. If the support is ever needed,
it can always be restored.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Applies on top of "media: v4l2-async: Remove V4L2_ASYNC_MATCH_CUSTOM"
https://patchwork.linuxtv.org/project/linux-media/patch/20210108171728.39434-1-ezequiel@collabora.com/

 drivers/media/v4l2-core/v4l2-async.c | 38 ----------------------------
 include/media/v4l2-async.h           | 25 ------------------
 2 files changed, 63 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3faf1d12d49d..d05809b81870 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -64,12 +64,6 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
 #endif
 }
 
-static bool match_devname(struct v4l2_async_notifier *notifier,
-			  struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
-{
-	return !strcmp(asd->match.device_name, dev_name(sd->dev));
-}
-
 static bool match_fwnode(struct v4l2_async_notifier *notifier,
 			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
 {
@@ -154,9 +148,6 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 	list_for_each_entry(asd, &notifier->waiting, list) {
 		/* bus_type has been verified valid before */
 		switch (asd->match_type) {
-		case V4L2_ASYNC_MATCH_DEVNAME:
-			match = match_devname;
-			break;
 		case V4L2_ASYNC_MATCH_I2C:
 			match = match_i2c;
 			break;
@@ -185,9 +176,6 @@ static bool asd_equal(struct v4l2_async_subdev *asd_x,
 		return false;
 
 	switch (asd_x->match_type) {
-	case V4L2_ASYNC_MATCH_DEVNAME:
-		return strcmp(asd_x->match.device_name,
-			      asd_y->match.device_name) == 0;
 	case V4L2_ASYNC_MATCH_I2C:
 		return asd_x->match.i2c.adapter_id ==
 			asd_y->match.i2c.adapter_id &&
@@ -454,7 +442,6 @@ static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
 		return -EINVAL;
 
 	switch (asd->match_type) {
-	case V4L2_ASYNC_MATCH_DEVNAME:
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
 		if (v4l2_async_notifier_has_async_subdev(notifier, asd,
@@ -708,31 +695,6 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_i2c_subdev);
 
-struct v4l2_async_subdev *
-v4l2_async_notifier_add_devname_subdev(struct v4l2_async_notifier *notifier,
-				       const char *device_name,
-				       unsigned int asd_struct_size)
-{
-	struct v4l2_async_subdev *asd;
-	int ret;
-
-	asd = kzalloc(asd_struct_size, GFP_KERNEL);
-	if (!asd)
-		return ERR_PTR(-ENOMEM);
-
-	asd->match_type = V4L2_ASYNC_MATCH_DEVNAME;
-	asd->match.device_name = device_name;
-
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
-	if (ret) {
-		kfree(asd);
-		return ERR_PTR(ret);
-	}
-
-	return asd;
-}
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_devname_subdev);
-
 int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *subdev_notifier;
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 8ed42188e7c9..49c14cc5f85a 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -21,7 +21,6 @@ struct v4l2_async_notifier;
  * enum v4l2_async_match_type - type of asynchronous subdevice logic to be used
  *	in order to identify a match
  *
- * @V4L2_ASYNC_MATCH_DEVNAME: Match will use the device name
  * @V4L2_ASYNC_MATCH_I2C: Match will check for I2C adapter ID and address
  * @V4L2_ASYNC_MATCH_FWNODE: Match will use firmware node
  *
@@ -29,7 +28,6 @@ struct v4l2_async_notifier;
  * algorithm that will be used to match an asynchronous device.
  */
 enum v4l2_async_match_type {
-	V4L2_ASYNC_MATCH_DEVNAME,
 	V4L2_ASYNC_MATCH_I2C,
 	V4L2_ASYNC_MATCH_FWNODE,
 };
@@ -42,9 +40,6 @@ enum v4l2_async_match_type {
  * @match.fwnode:
  *		pointer to &struct fwnode_handle to be matched.
  *		Used if @match_type is %V4L2_ASYNC_MATCH_FWNODE.
- * @match.device_name:
- *		string containing the device name to be matched.
- *		Used if @match_type is %V4L2_ASYNC_MATCH_DEVNAME.
  * @match.i2c:	embedded struct with I2C parameters to be matched.
  *		Both @match.i2c.adapter_id and @match.i2c.address
  *		should be matched.
@@ -68,7 +63,6 @@ struct v4l2_async_subdev {
 	enum v4l2_async_match_type match_type;
 	union {
 		struct fwnode_handle *fwnode;
-		const char *device_name;
 		struct {
 			int adapter_id;
 			unsigned short address;
@@ -210,25 +204,6 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 				   int adapter_id, unsigned short address,
 				   unsigned int asd_struct_size);
 
-/**
- * v4l2_async_notifier_add_devname_subdev - Allocate and add a device-name
- *				async subdev to the notifier's master asd_list.
- *
- * @notifier: pointer to &struct v4l2_async_notifier
- * @device_name: device name string to be matched
- * @asd_struct_size: size of the driver's async sub-device struct, including
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
- *
- * Same as above but for device-name matched sub-devices.
- */
-struct v4l2_async_subdev *
-v4l2_async_notifier_add_devname_subdev(struct v4l2_async_notifier *notifier,
-				       const char *device_name,
-				       unsigned int asd_struct_size);
-
 /**
  * v4l2_async_notifier_register - registers a subdevice asynchronous notifier
  *
-- 
2.29.2

