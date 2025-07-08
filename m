Return-Path: <linux-media+bounces-37136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB3AFD068
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1EF81884B7D
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 16:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC1F2E4251;
	Tue,  8 Jul 2025 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eok7irmG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE062E06D2;
	Tue,  8 Jul 2025 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751991410; cv=none; b=HKYBk7duVOEvY2nkt+Lm3Sya2TiKYCBpfafM9AOmVKWw93Bg2xaFWqMtkg6Lf9944lqWPcVnd4c/ZrzacfNmW4obwZXpK9diKuWBqd1jLUF6+RNLouCevjqDT7O8Tr4ek7+ETY+VBkPqWW/fD7PZ8WNoRC79+d038ngw7HUJ6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751991410; c=relaxed/simple;
	bh=oLmz6Fo1/TvWmKFf6rPPDzGVB5g4NzA93/BjJnvHq2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZRj/NowOJ9SHrYuLy7cOwPciAoBBkQImNbnVaUpGQjMprXRme+nA6ueN0s3JSJ7ZRyKo0K+8sNjv5hzy/xwo+GbAIwhDQ2lcleR/f6ycmadP4mMNqrkbV0Wm/9bQNsDSg3hamYoMDNXSsvyY/RYDqFVfNF+MTAWsGyECvh17PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eok7irmG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751991409; x=1783527409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oLmz6Fo1/TvWmKFf6rPPDzGVB5g4NzA93/BjJnvHq2o=;
  b=Eok7irmG6avLOVrewEHdNFLcPU/+kLThIPL2Hzh2iLTL0Ewvf166/Ocy
   e6m2s9cjIwLeHEssNYGkw+57x/zKKlUPpla9nBZG7bUTlFwMcrlFaLjNR
   k+gmpYUbWtCFgYrKDBn9YmWbsTZihiAGPYyajY67gdwUB4jyjBQga62dk
   Hiu/oYnLXhDIygiYp36cECDqpuEh2lEM3Dbsuj020gyezfdqyWnbVtxJg
   eUWLrcjE2Q9y5A1lRIfxyBfEpCl7zxX2TssU6QU/y5j02zgNdV8EG7PSN
   0D9yKIdIVqQyc5HbRglmlh/HbLkJLpEd3FqlRnkMt2ICw2jOe1ugwGxs/
   g==;
X-CSE-ConnectionGUID: vHrD9/W8SjaRZAwrhiTy9Q==
X-CSE-MsgGUID: r4R+yrjeTXuAPX3xddsTmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53448668"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="53448668"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 09:16:48 -0700
X-CSE-ConnectionGUID: d4BrDOQBSJ60sdDivdIpEQ==
X-CSE-MsgGUID: tUSkg3WkTcWC7TQM13IyDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="154947950"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.81])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 09:16:45 -0700
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
Subject: [PATCH] media: i2c: Kconfig: Select COMMON_CLK for ACPI-based systems
Date: Tue,  8 Jul 2025 18:16:37 +0200
Message-ID: <20250708161637.227111-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI-based systems are required to create and register a fixed rate clock
using the new v4l2 helper devm_v4l2_sensor_clk_get() that uses the
common clk framework.

Ensure that COMMON_CLK is selected.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e68202954a8f..f974a0e0dcec 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -31,6 +31,7 @@ menuconfig VIDEO_CAMERA_SENSOR
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
+	select COMMON_CLK if ACPI && !HAVE_LEGACY_CLK
 	default y
 
 if VIDEO_CAMERA_SENSOR
-- 
2.49.0


