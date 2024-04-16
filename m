Return-Path: <linux-media+bounces-9566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F298A74E3
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18BC8B2246A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B26513A410;
	Tue, 16 Apr 2024 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkGPpK/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE013A265
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296028; cv=none; b=sOC6Tekn8rT2MNFg5gNMeE8ufC1mf/h+oQErCZjBbBFZSHRldB3WtzPc/VquW7J9EHRUHuhvOJaIVC9VayWnf6XDUcO2vIY8aJhCr+Nhx/Nt8R56rvoc9IvipGEKeMZP+xFQm02yRLhmW/Uq1ejpbjhpoG+pg6ZuXW747OWVeNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296028; c=relaxed/simple;
	bh=pqfDcVE/YOyw+XiAges2rgmlpGwMI9/1uNUTAAQIWWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mTXqZ42+8KgkccbLrOCZ9wSBPvEopdy3WGDsAUC1C1ngI1mVCX9H8lYBrwUWdXbQ1g/gYWyD9h88NXrKDLDD4LPT7nmnrbyPoUwEpjdk/3MU9bQO6mR1KfnPse3IefxKAhiSVMYnaOL7WC3EDcCPMSBThXWus6r8oRDDcyWF3M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkGPpK/9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296028; x=1744832028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pqfDcVE/YOyw+XiAges2rgmlpGwMI9/1uNUTAAQIWWQ=;
  b=YkGPpK/9YFrhp6HI65OCDrFoK5eiWbNx8kjNnQVR1bh8lTA+fUlOlR0o
   DPYGVoLosfMMMsfoV6zOLkOEuyjd0RfuCibpzVqIqG9teEYQtlzcMKcav
   uDHBL/k50wppIW8jUOLscGIwXJELvfIKWwr95DwPZUxBAEf/VhKdwJMQ6
   wAFhX9yPr7pPcfF86b6Y7V27wa4cEl3K7iUmvF0UdWH132shjlwa/NYns
   5X2DPJslom0XBVt+p6jadX1sQzkMrhTNdWlXALth7IgUIsf4pYLlZ/1hy
   I8DIxwmiRW9ZvzrPukHphR/Pjf5arxBK3UvSSIqedhdY35XTU7s7MaGJH
   g==;
X-CSE-ConnectionGUID: YEscxNkeTfax6HXafAIdaA==
X-CSE-MsgGUID: Xojo4Bq3SOGkV9Mt/Wujig==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19906086"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19906086"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:46 -0700
X-CSE-ConnectionGUID: ZfTYuS/MR+uBJFXwNO325A==
X-CSE-MsgGUID: E1oXCXqTTceVteD8GLHmDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27155313"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:33:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6FFFD11F879;
	Tue, 16 Apr 2024 22:33:40 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 14/46] media: v4l: subdev: Copy argument back to user also for S_ROUTING
Date: Tue, 16 Apr 2024 22:32:47 +0300
Message-Id: <20240416193319.778192-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the user needs to know what went wrong for S_ROUTING, copy array
arguments back to the user.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2cfc9106857a..1863ecae9ec9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3445,11 +3445,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	 * FIXME: subdev IOCTLS are partially handled here and partially in
 	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
 	 * defined here as part of the 'v4l2_ioctls' array. As
-	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
-	 * in case of failure, but it is not defined here as part of the
+	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications
+	 * even in case of failure, but it is not defined here as part of the
 	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
 	 */
-	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
+	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
+		always_copy = true;
+
+	if (err < 0 && !always_copy)
 		goto out;
 
 	if (has_array_args) {
-- 
2.39.2


