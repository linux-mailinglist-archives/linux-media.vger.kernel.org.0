Return-Path: <linux-media+bounces-2785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DA819D00
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78AB4B21ECC
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F31B22309;
	Wed, 20 Dec 2023 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljVEerAw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27DA22060
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068654; x=1734604654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sRLZ1emkDYhb5x7smdmo1s2AjGA9Ic8j2ytBQpH0Jv4=;
  b=ljVEerAw9F3ZPadg8W14gGD3GW1o/XnwZr7SJdiSlfEoFJKw4xdI0qYx
   l6R0ARb8Av2S+QCwG3jeN3EjQeDE2CRuFt5aJU8yFSfPM0kpwHsJe4B1r
   2oO91hlWNkFpxvVfsj98xY3LCCbk/XtmipuPz1AtbT6kLbOg3E+wrWx/u
   xRc3e81/c1Pwv+GOzbZCQEqwdX6/pWQN0Y9pARYBXKCGf+YzK7ctKWcPU
   qLOzsaaVkRdB8wP8rOidi0geqg8xT7iiInvt9rfE04y9OeFeCD/GunGrp
   xzbrjDnGrnYNiUPOXTclEN39Ly58DfAYzkWDdtuUs1wHBSwwKvP1ozkc2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174398"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174398"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544275"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544275"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:32 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3C1241201D0;
	Wed, 20 Dec 2023 12:37:29 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 24/29] media: Documentation: Document how Media device resources are released
Date: Wed, 20 Dec 2023 12:37:08 +0200
Message-Id: <20231220103713.113386-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that after unregistering, Media device memory resources are
released by the release() callback rather than by calling
media_device_cleanup().

Also add that driver memory resources should be bound to the Media device,
not V4L2 device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/mc-core.rst | 18 ++++++++++++++++--
 include/media/media-device.h               |  6 ++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 2456950ce8ff..346f67760671 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -46,13 +46,27 @@ Drivers initialise media device instances by calling
 :c:func:`media_device_init()`. After initialising a media device instance, it is
 registered by calling :c:func:`__media_device_register()` via the macro
 ``media_device_register()`` and unregistered by calling
-:c:func:`media_device_unregister()`. An initialised media device must be
-eventually cleaned up by calling :c:func:`media_device_cleanup()`.
+:c:func:`media_device_unregister()`. The resources of an unregistered media
+device will be released by the ``release()`` callback of :c:type:`media_device`
+ops, which will be called when the last user of the media device has released it
+calling :c:func:`media_device_put()`.
+
+The ``release()`` callback is the way all the resources of the media device are
+released once :c:func:`media_device_init()` has been called. This is also
+relevant during device driver's probe function as the ``release()`` callback
+will also have to be able to safely release the resources related to a partially
+initialised media device.
 
 Note that it is not allowed to unregister a media device instance that was not
 previously registered, or clean up a media device instance that was not
 previously initialised.
 
+Media device and driver's per-device context
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Drivers should use the struct media_device_ops ``release()`` callback to release
+their own resources and not e.g. that of the struct v4l2_device.
+
 Entities
 ^^^^^^^^
 
diff --git a/include/media/media-device.h b/include/media/media-device.h
index c6816be0eee8..98e1892f1b51 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -250,8 +250,10 @@ void media_device_init(struct media_device *mdev);
  *
  * @mdev:	pointer to struct &media_device
  *
- * This function that will destroy the graph_mutex that is
- * initialized in media_device_init().
+ * This function that will destroy the graph_mutex that is initialized in
+ * media_device_init(). Note that *only* drivers that do not manage releasing
+ * the memory of th media device itself call this function. This function is
+ * thus effectively DEPRECATED.
  */
 void media_device_cleanup(struct media_device *mdev);
 
-- 
2.39.2


