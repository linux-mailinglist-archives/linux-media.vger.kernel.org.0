Return-Path: <linux-media+bounces-6889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D9D87922E
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 741C82826AC
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5695B79DD3;
	Tue, 12 Mar 2024 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWR5O6YU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB979DAF
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239682; cv=none; b=h7EcDNtzWSJFJVBLDlF1KdpCCxBqjiCWsbbKW+G7HwUt2Do9vIhZGMAp9pzlOpuKpeV0Remu7Zxivafxdtp6CNL+AK0dbXo76JM64ZVR2HYMspds8X+v9pj8Z5LMeL5VpHbe0PHjW47IvIELsBsZV/MZXQCBAuL1f0ua7Q6qi2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239682; c=relaxed/simple;
	bh=WBJkQRl6HUUCoBTVYVQygl04ebZa2GrobqlbR0Xm2nk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I680jp3c+q+fOOfv7Sls65qZnUaivpjosg1pnF4FMTPGz2Ld9/G272KezsCZIsybYlRwu8Cp7Xp+R3AFMBzybgzb0PqnBOQBfqAEitklvmWVfFiLtOyuV/TSaFYkjYG39GruBquj4FJr1rEj1gEg7Fci2CX5ciw6zD0tPPKs4wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWR5O6YU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239682; x=1741775682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WBJkQRl6HUUCoBTVYVQygl04ebZa2GrobqlbR0Xm2nk=;
  b=gWR5O6YUNHtZb32VF7jrOMO51Fe/nCr6AGsfRjujK+HLE24mOh6NaSXF
   oP/AuHCCY+mCedw3eCNrlofVTsPwuY3BqiRq+HHirhBd6U4zRPUgcSvph
   voF9pi/M8dOtsleFPAEj5HnKBAmq0LWp1aXgdz1FrrVl/Dx8q2ooSGzMC
   xACIT5MnBVKatQCJik+dBI9yByebEiZrICeQ2VHU0ZLDMBfH3c8RUl6am
   xJkVefa12ATVP+KdmKHRuxenck5WiCA9hDjnF3iBrL1FW4KZosCVMB2rT
   M2LmnLsknXs8kq/luP7qsUq5YQIIKVkxfB6i72tSZql39CXW8i4AbFyS9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794331"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194105"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:39 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6724211F81D;
	Tue, 12 Mar 2024 12:34:36 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 20/26] media: Documentation: Document how Media device resources are released
Date: Tue, 12 Mar 2024 12:34:16 +0200
Message-Id: <20240312103422.216484-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
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
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/driver-api/media/mc-core.rst | 18 ++++++++++++++++--
 include/media/media-device.h               |  6 ++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 2456950ce8ff..f9108f14d1ed 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -46,13 +46,27 @@ Drivers initialise media device instances by calling
 :c:func:`media_device_init()`. After initialising a media device instance, it is
 registered by calling :c:func:`__media_device_register()` via the macro
 ``media_device_register()`` and unregistered by calling
-:c:func:`media_device_unregister()`. An initialised media device must be
-eventually cleaned up by calling :c:func:`media_device_cleanup()`.
+:c:func:`media_device_unregister()`. The resources of a newly unregistered media
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
index f1afbfc4dca2..fe4625f3f62b 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -252,8 +252,10 @@ static inline void media_device_put(struct media_device *mdev)
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


