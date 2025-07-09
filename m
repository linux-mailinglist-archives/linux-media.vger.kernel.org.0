Return-Path: <linux-media+bounces-37183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F2AFE55D
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D96D1169F13
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50782288CB2;
	Wed,  9 Jul 2025 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcHOmv4r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB228853D;
	Wed,  9 Jul 2025 10:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055888; cv=none; b=kWH7zbuv/AT1nGYL2XFex6THkU8mB2ZDV0F4JuvI6SOrnqkQchnZQ32suqAU3kTXcsyIU5dGoGjlLyOhyaGvxZ+LfIjbYwwkwUngVZth6tcmMovDCDMiLTNOk/Mqdojc0qAVg/ssvM3JAn2pcvpIpOVCLpl39HivrDO0QRAA1ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055888; c=relaxed/simple;
	bh=DJptW7LgTGPke3AUKi4HZuLn+mvvXZy993BnKokqJQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjwjfCfEnugQBHfsUmKs6a1xPwe4EefEp0Yg1rZQ91EnS1W3LBnu9DSA2ZZqOlEKgaRRk0ihpcNVRyubPY5arQF6pLT2BneT/OM+aLke5wXfy6fv99ZOe9TOnPZUy57nPN/JkkVbFSc1/lDK3nrVR43MtYKLReqApqXQmJked2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcHOmv4r; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752055888; x=1783591888;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DJptW7LgTGPke3AUKi4HZuLn+mvvXZy993BnKokqJQg=;
  b=CcHOmv4rDw+CNTbgEF1PLRmjT3P9NX0dQNpELFXxNsjA62Lc4J2YpLRC
   hLXttYHFCr+v212AR9GKBCJCtt+DAQ1IAnDcQFNXar/rpksU+o6MSogy/
   pTFoJkPDpjLjVTOsgEnEl/N0GNG3I0SCDu1Awr6lOMaW4+DmLa/dBph2P
   zHb6wP3fdylvY1jN1Hrp+BB4Sals37Po/bDGzq9chkOVrXK4k1HQBfSwv
   M1ylENWBb9Zxrolq1yOQ7WACrcH1XJVXf/fEkr1NoOtRMN07XgZROban/
   bHf5uUmQ904TzGzI6Ikj4ZIU7bEq4wleLe3IfVrhFG7RkQ8EgoZySNdGs
   g==;
X-CSE-ConnectionGUID: yPMT5H2kQAayrTNow6TY8w==
X-CSE-MsgGUID: gJIHu9w9Qi+eo0PhgalZag==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64559602"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="64559602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:11:27 -0700
X-CSE-ConnectionGUID: j0JixAXzSHaiM6q23Ua3yg==
X-CSE-MsgGUID: W4n9unvWT7+r1Xwo7kCp2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155148882"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.212])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:11:23 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org,
	hdegoede@redhat.com,
	arnd@arndb.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH V2] media: i2c: Kconfig: Ensure a dependency on COMMON_CLK for VIDEO_CAMERA_SENSOR
Date: Wed,  9 Jul 2025 12:11:14 +0200
Message-ID: <20250709101114.22185-1-mehdi.djait@linux.intel.com>
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

Ensure a dependency on COMMON_CLK when config VIDEO_CAMERA_SENSOR is
enabled.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
v1 -> v2:
Suggested by Arnd Bergmann:
	- removed the select statement and replaced it by "depends on
	  COMMON_CLK"

Link v1: https://lore.kernel.org/linux-media/20250708161637.227111-1-mehdi.djait@linux.intel.com

 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e68202954a8f..98750fa5a7b6 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -27,7 +27,7 @@ config VIDEO_IR_I2C
 
 menuconfig VIDEO_CAMERA_SENSOR
 	bool "Camera sensor devices"
-	depends on MEDIA_CAMERA_SUPPORT && I2C
+	depends on MEDIA_CAMERA_SUPPORT && I2C && COMMON_CLK
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.49.0


