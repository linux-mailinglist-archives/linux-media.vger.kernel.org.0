Return-Path: <linux-media+bounces-2790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEE819D05
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 949F21F22391
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED741224CA;
	Wed, 20 Dec 2023 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iX9gECs1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC0622326
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068657; x=1734604657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sQFKBCLy6uAbidiSmPj8eSrjfRAtpGGhL2ie4zL4ztY=;
  b=iX9gECs1c3ZlXrXWS+jhWU2D6eq+pm4alniF2QymINc3sgUckv6T0Tz6
   DlGz9t/1cIE9ce5n60otrshlmqNNflIF8PAOlAr+sXnrgJiHqbP+YLZuv
   pu/pDyIdeujAcTPilmIaxh1MqDABgVbvQJ+Jg/g8+zc3SAWsyfBRbuJZB
   11H5cSH1t7NsvJx8aJhS9LuJKzR68PhanVjCdM2B27SHoRi54CCjeAVvX
   0f2d2s+7O4VbHzsy5RjV0vNFX/AjgprzzPGnl7hIkyWv+aOz45mXaytKu
   0E7CAg53aFUPYUlqCT055oYkzzfPc3VUCMJtsePO9nnKSe6ehaZwLKr3b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174418"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544284"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544284"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:34 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4F1A712098A;
	Wed, 20 Dec 2023 12:37:32 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 29/29] media: Documentation: Document media device memory safety helper
Date: Wed, 20 Dec 2023 12:37:13 +0200
Message-Id: <20231220103713.113386-30-sakari.ailus@linux.intel.com>
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

Document how the best effort memory safety helper for accessing media
device works, and that drivers should be converted to refcount the media
device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index d64bb501a3ee..ef8e57a307a6 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -258,6 +258,32 @@ void media_devnode_init(struct media_devnode *devnode)
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


