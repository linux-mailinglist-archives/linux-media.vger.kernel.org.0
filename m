Return-Path: <linux-media+bounces-12843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84975901EE1
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944611C21474
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43457E58C;
	Mon, 10 Jun 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYb8fI6H"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80D37D3F1
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013960; cv=none; b=i9MCsivCb/hHmo2TItlxHgVMTVdMG/DogFXUxIuiDC+rsTTx/4srtBpOb2V3pHx6WbFoMGYBzjGq1ROT7qF2GYSTEbExClW1f/y5W4plpE9Od1KUYiWBiaV/jk/tpOWF3Xi0C3uGJooAocuKhpnweZB3/d7vTtzdRV91QDhaD5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013960; c=relaxed/simple;
	bh=WBJkQRl6HUUCoBTVYVQygl04ebZa2GrobqlbR0Xm2nk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bcm94s6OQFxmmymReno79zkeaWuLd4mmVKLBflz9ll2jKXlMug1uhsctFlkQJCj8Ij5EivETalnPMShlri+mhtoM+q3vpptCCNzOvtUtjFi3tBm4YKPyh6oTpEtJzPiYTrfS5RWnm3IGRAEXy3dldlS7q8q6cJCYzeZr5ij/www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYb8fI6H; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013959; x=1749549959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WBJkQRl6HUUCoBTVYVQygl04ebZa2GrobqlbR0Xm2nk=;
  b=ZYb8fI6HgSSE3O/EvqvQgMw1eIskazxCNOlRAXvCpVjlmMIA7lbj6goi
   j5FDMt3K86esCAlpYTyeh7WeNyxkwFTtRRE+dwDwRyP6sBXviPsb9tWt2
   HI9JRfO4RNxZUWSLZ3gOd4HA2D6Jwf0y/ouFbZcb0QrJ5FCS4MQDhHvZt
   NE8AGfbIR4JxkgWIq9wFBolOvLcvAroFPTZo9b4M/53328OhUhg8NlJl8
   7kRbb7xcQY5SM0tXxJP6E9ECg9yjtFXlOI+jsaiEE1HzpM5mV2140dvVk
   39t5sy1fC0HzV37sDCkAEptg013juwTFyjMwxuXW7HaNr4PB2PiKGmoYc
   Q==;
X-CSE-ConnectionGUID: vBeLtpIiTU6fKVZ0dZQmyg==
X-CSE-MsgGUID: f9nUPbecTfqMD1/uB8vCyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819955"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:53 -0700
X-CSE-ConnectionGUID: cF3N9HyXSyOnR16Pn2oDbA==
X-CSE-MsgGUID: KFmbbviUSDWwV7lLoB+EKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137367"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 45CA5120BE5;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eDv-0p;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 20/26] media: Documentation: Document how Media device resources are released
Date: Mon, 10 Jun 2024 13:05:24 +0300
Message-Id: <20240610100530.1107771-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
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


