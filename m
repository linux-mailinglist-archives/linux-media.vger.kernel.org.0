Return-Path: <linux-media+bounces-28759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E1A7101C
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 06:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15EC716F629
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 05:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A4517A31D;
	Wed, 26 Mar 2025 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXRkvQhn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0581F16B
	for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 05:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742966731; cv=none; b=GsoPoB/WO6ApQvtvL/eYGS3dAccLD6oVTqZ4OHVoWQpiV+jeik5f2UCLz7gwXvXZRIbOM+bXsOdlGw8BM+TGjXCsmX5n9NxaMt3VLKqDOfs8ovCR6IHMqg/iwUkUeShmzUDOqVI84ePxVhJ+8RQW/m5wntnPn0DkCnPZZypoq2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742966731; c=relaxed/simple;
	bh=BmzEk9/JRkBlHsP8RNi7fEz1UuCUd4ARtj4BLzSyVvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1qdIZBjwPSz9p655p5NIxMYZvx2mCdErs9xGZjmVamc+seyxJ07aASMz709XevditA5xGo0QFNmT64T+xzWQP4WzauwpOphxy4UE1Vs9haPW37PRA+II8BS70u2nRSbMNmCXNIoIsatC8aAftm1GYNeRfGR3pMLUfpK5vRjfd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXRkvQhn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742966730; x=1774502730;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BmzEk9/JRkBlHsP8RNi7fEz1UuCUd4ARtj4BLzSyVvs=;
  b=DXRkvQhnp0JMsXQq2IBovhfSRqtm9aVNkBKfLHd94bfAhJM7+jxFdV9R
   mBnJOZPaUM9W/Gtvxe+aVy4HxRhIvH+p/NJdEg2pymNu2WRvORaLRV8dg
   K/R3hRFzx6kqZXivu1mkfol76u5EG+O1l1B+jZ5Zq57UBGe3io69xWfGj
   qfr7VjmlEt6FeoG4CUiMucr8fE/hNi47YCOTVLAYMAYM/EqsbZWcHYbUa
   MuyhUP0bWblz1lPN/ec+lpa+6WR1r8nofVKij500m2ij13BTVLu7zswbL
   uv2IdXsIlV1aaoqv+HtlLlWPCyzWFmbWz0zNE2rLx0vgUn3ToBNXmKzlc
   A==;
X-CSE-ConnectionGUID: b4Yz3Ki3TeutkNQ5fsF+Jg==
X-CSE-MsgGUID: g6RxB2RFQVuazcNG32Ld+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48114118"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="48114118"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 22:25:29 -0700
X-CSE-ConnectionGUID: 7wKV2MzgSYe9K1G3aTgWPA==
X-CSE-MsgGUID: Su/fahzeQVSd0uM3Dq/lVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="124806848"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 22:25:27 -0700
From: Dongcheng Yan <dongcheng.yan@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl,
	ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	hdegoede@redhat.com,
	dongcheng.yan@linux.intel.com
Subject: [PATCH v1] media: ipu-bridge: add ACPI HID for lt6911uxe bridge
Date: Wed, 26 Mar 2025 13:24:47 +0800
Message-Id: <20250326052447.2347154-1-dongcheng.yan@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lontium lt6911uxe is a HDMI to CSI-2 bridge, without a fixed
link frequency.

Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1cb745855600..83e682e1a4b7 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -66,6 +66,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Hynix Hi-556 */
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
+	/* Lontium lt6911uxe */
+	IPU_SENSOR_CONFIG("INTC10C5", 0),
 	/* Omnivision OV01A10 / OV01A1S */
 	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),

base-commit: f2151613e040973c868d28c8b00885dfab69eb75
-- 
2.34.1


