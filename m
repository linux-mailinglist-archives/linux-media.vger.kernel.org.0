Return-Path: <linux-media+bounces-37614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5AB03FCA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9F4D17F49C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04426253355;
	Mon, 14 Jul 2025 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDCLcuh2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983DF251793;
	Mon, 14 Jul 2025 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499450; cv=none; b=MhYZRw+QJAbE8D9+VDAa0xg8RTmquKGmKgMPe0n7JXtMYz9yVTegugVc7jZbwGPZOCDfksfiNh4TqI1G2rAQWHvJM66xTeTJTuyAqxAcvCHpREqJ682rWgqH2e9dynw+ks5arTA0jlX+AkFfBZYvHaDIwIadxYuaAWSjeAApekI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499450; c=relaxed/simple;
	bh=QwjAUiKmfnYkBvb9mYSuBBbGE4Yr2f5m1crl+9/gD0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSFrUd5XzUP4ZmGjypAEjAflkCFfvDBmDhsb+6L74zDAqB0w7uBTqwKgVabBjHuiuXc2tZpww/jnlyzgCJa2QwGNO0wJLSxoXYkLsKxqovfEYSEEQMM+w/2xmgU1C5bv2xl6FQ+0xIZprmgx/9//MonfwC/0n+sIWFAeTuWZycE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDCLcuh2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752499449; x=1784035449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QwjAUiKmfnYkBvb9mYSuBBbGE4Yr2f5m1crl+9/gD0w=;
  b=ZDCLcuh2WxqCOqAZ5l6nNl5uLTFTjwmHsglcFmnn3edtKkIJKjJn/P/9
   +GXmHBs265EYv/deYCrC311OOX8MyalX8YnK37xXzAgBqwaLWh+Idflyj
   JXLoxVpZcz9a37TIsqAHlpQPiyKaxFSug9cbxMEkSK9JrSuW43Y3cmWLa
   UI1ALEo3GVzoKvfBQ2KtF+X/nhm/VfAgnz3X0ut+IY6mXv14KpfD3e8jN
   3+1U+yCMq4VYf36rBv+sETGeEHB+hkFUSIibAEoYlcWg46emHTp8ZesYQ
   1mbBCb0Y+ZMAqHM0eOYbVoQ0zRwloVdRJEcIXLClfmgVAtaiyyEEo6nqJ
   g==;
X-CSE-ConnectionGUID: e2gWmo8+Tn23QmXD4i4hMA==
X-CSE-MsgGUID: 0QvA4WVZR86iSTeFWWAHwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53802619"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="53802619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 06:24:08 -0700
X-CSE-ConnectionGUID: JGEi9CteTpi93TV1UUp+aQ==
X-CSE-MsgGUID: 364hvLYfRwyi7LAfHkPM2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="160944785"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.75])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 06:24:05 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com,
	arnd@arndb.de,
	laurent.pinchart@ideasonboard.com
Cc: jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org,
	hdegoede@redhat.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH V3] media: i2c: Kconfig: Ensure a dependency on HAVE_CLK for VIDEO_CAMERA_SENSOR
Date: Mon, 14 Jul 2025 15:23:56 +0200
Message-ID: <20250714132356.154971-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both ACPI and DT-based systems are required to obtain the external
camera sensor clock using the new devm_v4l2_sensor_clk_get() helper
function.

Ensure a dependency on HAVE_CLK when config VIDEO_CAMERA_SENSOR is
enabled.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
v2 -> v3:
Suggested by Arnd Bergmann and Sakari:
	- replaced depends on COMMON_CLK by depends on HAVE_CLK

Link v2: https://lore.kernel.org/linux-media/20250709101114.22185-1-mehdi.djait@linux.intel.com/

v1 -> v2:
Suggested by Arnd Bergmann:
	- removed the select statement and replaced it by "depends on
	  COMMON_CLK"

Link v1: https://lore.kernel.org/linux-media/20250708161637.227111-1-mehdi.djait@linux.intel.com

 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index a1a8ef9f35c1..01f348cc3b27 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -27,7 +27,7 @@ config VIDEO_IR_I2C
 
 menuconfig VIDEO_CAMERA_SENSOR
 	bool "Camera sensor devices"
-	depends on MEDIA_CAMERA_SUPPORT && I2C
+	depends on MEDIA_CAMERA_SUPPORT && I2C && HAVE_CLK
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.49.0


