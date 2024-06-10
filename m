Return-Path: <linux-media+bounces-12842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B476A901EE0
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6908A1F27102
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCB27CF16;
	Mon, 10 Jun 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tl4/9/Vq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8177D07F
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013959; cv=none; b=H4HOMlftU0a9/8bfoAckAgme5x9A2kS8kMXW8OAbhVdvdp0y04fybywwDa1JZkLBLgUWjJIO57WwIEo00fFiBDGpfJulfiaIUL7XTUotzdjc2YkgWp23ap/uJpD/FCzuQgUFWNP1gKETbsXzSyMyI84e7B4Wq8ezPHqH91/y5KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013959; c=relaxed/simple;
	bh=Vc+IqwTshbHL/bDBQ1XH5h9hSuR4hPHjNIN+v4a7da4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HCLO3SuwXopr0iGgcH2b5dPsMfpTOQueelydDziW8NgKHeopRx4mZ8PcZCJJIM5h6zaGYvb+yY218CIomU4RJXbz1wb+zcqusIQi5hxAN0aLjDc9fURRbRC7Mn6bmDRn88+j7IbOcTGQJeaJaRJQrBwKz8r9kc0RcPrvsbxH43E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tl4/9/Vq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013958; x=1749549958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vc+IqwTshbHL/bDBQ1XH5h9hSuR4hPHjNIN+v4a7da4=;
  b=Tl4/9/Vqhzojxj3hMZI8VGfcnF4bw/47+GnGC8VmmgKD/mlRLTkB+j3t
   b3yPk3fuucV1u8aeRCNaJYhI78Dc2GwOcC5Fx233N/XuObYHeis5ht6FG
   op84PEr4UC2hZe+3AEgjUJupiscvP3E8SU+Qd7O5b2mfmhJ/1M+lk6dDQ
   6eBA2dpT776gvDDWcbOESB+QTbWCQNAfQiwnoIRixT3fZmdtoSMOe0mwm
   I62Gkwia78Mfdtx49gAV4mR/Rfd6GbAVMAXXPRl+No/aStdqJIOuB20fX
   gXNFjfbAvAquDcLii4BSGfET5WF4aCbukavL2TjbBMOq0lB/gGMnMe4A8
   A==;
X-CSE-ConnectionGUID: Q2l9CgQETt20HrYtQNYpzw==
X-CSE-MsgGUID: Hi334fQNTc+hWvDn42MOKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819941"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:52 -0700
X-CSE-ConnectionGUID: aKAb0MufTA+YLLvQRCX6VA==
X-CSE-MsgGUID: vpMkFeWyQx6vxdrATUr8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137359"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 69D88120D3D;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eEP-1J;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 26/26] media: Documentation: Document media device memory safety helper
Date: Mon, 10 Jun 2024 13:05:30 +0300
Message-Id: <20240610100530.1107771-27-sakari.ailus@linux.intel.com>
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

Document how the best effort memory safety helper for accessing media
device works, and that drivers should be converted to refcount the media
device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 758971f310c3..4bc0c03844e5 100644
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


