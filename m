Return-Path: <linux-media+bounces-9614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A881B8A754D
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1470AB21C8D
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188C213A402;
	Tue, 16 Apr 2024 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4V4wDY5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5755D13AA44
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298308; cv=none; b=d8JAd0TGVOFtFbJ4D/30Om219RebGunHoyWW6tiFelpaqQ5igsOjRT/O53qyAsNVgAuedVR5oCuhJatxHt8mLwHLcCBwBFLkM5Mg9qxqMlkdVx7f4O/kX8y/I8cWJH611W834DpbEyw8tUqjJ93IoZnvm9M6Intf/wPouXvNjrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298308; c=relaxed/simple;
	bh=8lL/heTScQ+PZB9LFv3yTDtZHYQgDWC6t8obR5RGX9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AO6ZIxWCEc8YXdJpSrdNNes7qc95j2wjEY0D+jEwkvgQ6Z+ZRl3pquDw89fl/19zDYZGpbpD8A28xbDsyozYW+ji4/T1iSSJoQUOBqB6jpKh85ct34rSLC+0EmLovIq2F9Fzf3UgcUiMnVdluGaOdh0GyZEyJzVTzr00dTZNNoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4V4wDY5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298308; x=1744834308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8lL/heTScQ+PZB9LFv3yTDtZHYQgDWC6t8obR5RGX9M=;
  b=m4V4wDY57VV/CNYmoLtla2ZrxNxS0pq+NwzbqO8Ga4G06dqFgf8v+y0o
   a7Z2WzKDjcmt6pID1UeeTJj9t2ofARmatq1x1EuIY5h1YZtK6if3ux9y1
   lfMZ+YXySXSItGL89YXYEmM74aGBVJ0sakd3zVnrQT3QlguY3rfwxZKcr
   DQh9JlILLdtb6GHuuOOflxYREX3WXlWBKgdWNr0vcIG7EDP4wmlRv+0cw
   FoXv6NrmjGEGADzTOlUVZwMjW/uvUWnxFWRLTw1i5qt8VtYRUhgvzD8Ia
   GM3PDkl+hJORyaBuU8BA8v5oWGgdJ7x+0SMc1hQqZ5LjEYLKW5G7hZQlW
   w==;
X-CSE-ConnectionGUID: SINEj8voSF2TXikOaSNJPg==
X-CSE-MsgGUID: jgNK/sD6TMu9l9etLNUnXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8877605"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8877605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:47 -0700
X-CSE-ConnectionGUID: QzfG9VCmRs6WmQLwxUphwg==
X-CSE-MsgGUID: Xr7l95rlSz+YMRuIs0b0hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22447921"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:43 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 371231204F9;
	Tue, 16 Apr 2024 23:11:39 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v4 15/19] media: Kconfig: Select MEDIA_CONTROLLER for VIDEO_V4L2_SUBDEV_API
Date: Tue, 16 Apr 2024 23:11:01 +0300
Message-Id: <20240416201105.781496-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MEDIA_CONTROLLER has no dependencies and VIDEO_V4L2_SUBDEV_API depends on
it. Select MEDIA_CONTROLLER instead of depending on it. This way Kconfig
options elsewhere do only need to select VIDEO_V4L2_SUBDEV_API, not both.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 331b8e535e5b..d55eff3f31b0 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -10,7 +10,8 @@ config VIDEO_V4L2_I2C
 
 config VIDEO_V4L2_SUBDEV_API
 	bool
-	depends on VIDEO_DEV && MEDIA_CONTROLLER
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
 	help
 	  Enables the V4L2 sub-device pad-level userspace API used to configure
 	  video format, size and frame rate between hardware blocks.
-- 
2.39.2


