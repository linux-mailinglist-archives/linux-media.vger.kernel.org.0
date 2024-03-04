Return-Path: <linux-media+bounces-6375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8718709E8
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 19:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCDA01C20DF0
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 18:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F70378B48;
	Mon,  4 Mar 2024 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNGHmJVP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99ED7869A
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709578292; cv=none; b=CS4tkiOQEEh+RXP71bAxAl0UnzcdUnf1ZwOAVowUp5m2Torf/dRloo1ua7ParAUxSjG9s5F/9Grjv5g1rZdOn8GqnPl0wFd7r0L6z0ZTyR2mHbUBiPmgLJm8Ky2PtM6/FV69ivNrUoyTPPBhdV3fZLoYafGjnq5Xb9sVA1FoIZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709578292; c=relaxed/simple;
	bh=B9RRQJ2p7JhmAPzyVaoK7svQoqaA1weGbEiZkQVOupc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ObvECjrrXI7U/PpXAP31SXoAyXNWjLT+CecwKmV22s96e1eEeqogdTQmUr8CRDLG8HvcXlj0qY0JO6LtiPw/LhNnRTdnQSsKpeudIVPqUQt/O/0WVuym9Wq/gaMx+TwrqQY6OTKlkcj90WYDitAVHrddQDqrbsk54uyUD0vJ2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNGHmJVP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709578290; x=1741114290;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B9RRQJ2p7JhmAPzyVaoK7svQoqaA1weGbEiZkQVOupc=;
  b=NNGHmJVP+tYupb3fLbaFGkDUL3yWrK4LLH00x/EVvKYOUPVigRuvsztQ
   NDLnISsWuE0GJRC/lVh0AXaz0g6usCO0bGmpFj/+DI1HqzFoFGTBJQSOU
   jZ2T1Q76ZVKP4hHXxTKXzRXQqkLaYI971/wXVL+b8VspTgbKtmuTkuleG
   69wKm8wYwNTSt7T3NQk7XQCNSkAB77XK9aC8k0E0p3I8Qjzmr0BNa2/dh
   hOQ9ERTZdnPD4z3X0IiAJt/mL0lnOu3FNwhRHTjvk7fPZSWZ+DBMlGwia
   XeLKb8OOJipvzDRRAqJcIx5Z+5a91Ro2nkmou27x+myV7BOaflLtDl+H4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7905403"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="7905403"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 10:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="32272176"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 10:51:28 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9915F11F819;
	Mon,  4 Mar 2024 20:51:25 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: Kconfig: Select MEDIA_CONTROLLER for VIDEO_V4L2_SUBDEV_API
Date: Mon,  4 Mar 2024 20:51:25 +0200
Message-Id: <20240304185125.33713-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Mostly untested but seems reasonable. MEDIA_CONTROLLER has no dependencies
anymore.

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


