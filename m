Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDE631B96C
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 13:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhBOMjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 07:39:24 -0500
Received: from retiisi.eu ([95.216.213.190]:49030 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229890AbhBOMjP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 07:39:15 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2FBCC634CBE;
        Mon, 15 Feb 2021 14:36:29 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/1] v4l: async: Fix kerneldoc documentation for async functions
Date:   Mon, 15 Feb 2021 14:37:28 +0200
Message-Id: <20210215123728.16362-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix kerneldoc documentation for functions that add async sub-devices to
notifiers. The functions themselves were improved recently but that left
issues with the kerneldoc documentation. Fix them now.

Also remove underscores from macro argument names.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: b01edcbd409c ("media: v4l2-async: Improve v4l2_async_notifier_add_*_subdev() API")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-async.h | 80 +++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 41 deletions(-)

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 6f22daa6f067..3e2fe7181bee 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -156,42 +156,44 @@ void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd);
 
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
+					struct fwnode_handle *fwnode,
+					unsigned int asd_struct_size);
 /**
  * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async
  *				subdev to the notifier's master asd_list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
- * @fwnode: fwnode handle of the sub-device to be matched
- * @asd_struct_size: size of the driver's async sub-device struct, including
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
+ * @fwnode: fwnode handle of the sub-device to be matched, pointer to
+ *	    &struct fwnode_handle
+ * @type: Type of the driver's async sub-device struct. The &struct
+ *	  v4l2_async_subdev shall be the first member of the driver's async
+ *	  sub-device struct, i.e. both begin at the same memory address.
  *
  * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
  * notifiers @asd_list. The function also gets a reference of the fwnode which
  * is released later at notifier cleanup time.
  */
-struct v4l2_async_subdev *
-__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
-					struct fwnode_handle *fwnode,
-					unsigned int asd_struct_size);
-#define v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode, __type)	\
-((__type *)__v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode,	\
-						   sizeof(__type)))
+#define v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, type)	\
+	((__type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
+							   sizeof(type)))
 
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
+					       struct fwnode_handle *endpoint,
+					       unsigned int asd_struct_size);
 /**
  * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
  *						  remote async subdev to the
  *						  notifier's master asd_list.
  *
- * @notif: pointer to &struct v4l2_async_notifier
- * @endpoint: local endpoint pointing to the remote sub-device to be matched
- * @asd_struct_size: size of the driver's async sub-device struct, including
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
+ * @notifier: pointer to &struct v4l2_async_notifier
+ * @ep: local endpoint pointing to the remote sub-device to be matched,
+ *	pointer to &struct fwnode_handle
+ * @type: Type of the driver's async sub-device struct. The &struct
+ *	  v4l2_async_subdev shall be the first member of the driver's async
+ *	  sub-device struct, i.e. both begin at the same memory address.
  *
  * Gets the remote endpoint of a given local endpoint, set it up for fwnode
  * matching and adds the async sub-device to the notifier's @asd_list. The
@@ -201,36 +203,32 @@ __v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
  * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
  * exception that the fwnode refers to a local endpoint, not the remote one.
  */
-struct v4l2_async_subdev *
-__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
-					       struct fwnode_handle *endpoint,
-					       unsigned int asd_struct_size);
-#define v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep, __type)	\
-((__type *)__v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep,	\
-							  sizeof(__type)))
+#define v4l2_async_notifier_add_fwnode_remote_subdev(notifier, ep, type) \
+	((type *)							\
+	 __v4l2_async_notifier_add_fwnode_remote_subdev(notifier, ep,	\
+							sizeof(type)))
 
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
+				     int adapter_id, unsigned short address,
+				     unsigned int asd_struct_size);
 /**
  * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
  *				subdev to the notifier's master asd_list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
- * @adapter_id: I2C adapter ID to be matched
+ * @adapter: I2C adapter ID to be matched
  * @address: I2C address of sub-device to be matched
- * @asd_struct_size: size of the driver's async sub-device struct, including
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
+ * @type: Type of the driver's async sub-device struct. The &struct
+ *	  v4l2_async_subdev shall be the first member of the driver's async
+ *	  sub-device struct, i.e. both begin at the same memory address.
  *
- * Same as above but for I2C matched sub-devices.
+ * Same as v4l2_async_notifier_add_fwnode_subdev() but for I2C matched
+ * sub-devices.
  */
-struct v4l2_async_subdev *
-__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
-				     int adapter_id, unsigned short address,
-				     unsigned int asd_struct_size);
-#define v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr, __type)	\
-((__type *)__v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr,	\
-						sizeof(__type)))
+#define v4l2_async_notifier_add_i2c_subdev(notifier, adapter, address, type) \
+	((type *)__v4l2_async_notifier_add_i2c_subdev(notifier, adapter, \
+						      address, sizeof(type)))
 
 /**
  * v4l2_async_notifier_register - registers a subdevice asynchronous notifier
-- 
2.29.2

