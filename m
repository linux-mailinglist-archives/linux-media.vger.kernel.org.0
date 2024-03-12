Return-Path: <linux-media+bounces-6895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA2879234
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA481F21D25
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23607A13D;
	Tue, 12 Mar 2024 10:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lILlt1sN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A57A127
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239686; cv=none; b=UVbSfyKsSTUM5oXCZLrWJWP2xS9SHvuPAZCm+C6Z6KeowS9vH9BbmSlAYRnV9Wf2uugVqtPTFluog0NIOaUkMr/MJ4otvBZDKC5UZ3LPTnmfkUvFosuAZGZE08t3hXBJMdm15TvIgtrvZXXPJfmCc56sNEczbgnjjiksm+0l4+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239686; c=relaxed/simple;
	bh=1xlSTuEdeFyONt5K7qt6F4QtCG63Eauf7PTfPM9vWqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y9N+89iF8fUdCHYCTRBJxzWbG/5K4v23BvH9UC+d9Q07qwPwoX1BA4SOal5dZA7I4c61QpV1a7oTXQH9tz+Qp5HFsfg34BkNI4/SRkHfhTKZjTHMGbdA8G/PvzoRmk1Rmlq4h1U6KCNFG5jzms5XPJPZc6N4HVXcn2ATXFNYbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lILlt1sN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239685; x=1741775685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xlSTuEdeFyONt5K7qt6F4QtCG63Eauf7PTfPM9vWqk=;
  b=lILlt1sNxDA606q6ZjB/Vtvm8xu3bRDRMy4twNI/gcwckhMoO+ByRPyW
   vK4DMdNXFdugKitTs6lO+CRewL0KuJ2Ls4xg6OPsTOPwHYXSH4K/f9qb0
   +422m+TVZfs5015LK39LXmHHnb0R1URw3ikwRiW+ZN7hFI+M1xwxLsIXr
   3nD3UdHWBdIVcTzDOfi9ePUD1fT3vg36Hdl5ATp4o/C8atJRtlBgGjHHD
   MI2ldDqxinv0gPH/33mCX6e6Io7QyUhNFtrsoUjd7RQSJOa7vooi2/3f/
   k6ASCNCKF7nS+h1fOA3JLOFWTF8Z4IRc99Wu2d7l/I5jqqiv4V3/jJv10
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794349"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194124"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:43 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6884A11F81D;
	Tue, 12 Mar 2024 12:34:40 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 26/26] media: Documentation: Document media device memory safety helper
Date: Tue, 12 Mar 2024 12:34:22 +0200
Message-Id: <20240312103422.216484-27-sakari.ailus@linux.intel.com>
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

Document how the best effort memory safety helper for accessing media
device works, and that drivers should be converted to refcount the media
device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 8742bd7a3521..e5ae187246d6 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -243,6 +243,32 @@ void media_devnode_init(struct media_devnode *devnode)
 	devnode->minor = -1;
 }
 
+/*
+ * Best effort media device lifetime management for old drivers
+ *
+ * Drivers that do not manage the lifetime of the media device are provided with
+ * a best effort lifetime management support. This means that as the driver does
+ * not release the media device once all users are gone but when the device is
+ * unbound, there are bound to be (brief) moments when released memory may get
+ * accessed. All drivers should be converted to release their memory at a safe
+ * time, i.e. provide a release callback in struct media_file_operations to do
+ * so. This is especially important for drivers for devices that are
+ * unpluggable, e.g. USB devices.
+ *
+ * A second struct device is used to manage the lifetime of a helper object,
+ * struct media_devnode_compat_ref. For a media device, one is initialised in
+ * media_devnode_register and put in media_devnode_unregister. This object is
+ * also used as the device of the media character device so file handles to the
+ * media device have a reference to this object. When the media device is
+ * released, any file handle retains a reference to this helper that also
+ * contains the media device's registration status. If a media device is
+ * released and a user space process attempts to access the file handle, an
+ * error is returned.
+ *
+ * The struct device in struct media_devnode is put at media_device_cleanup and
+ * uses an empty release callback, reflecting the expectation the driver will
+ * release the memory of the media device at unbind time.
+ */
 int __must_check media_devnode_register(struct media_devnode *devnode,
 					struct module *owner)
 {
-- 
2.39.2


