Return-Path: <linux-media+bounces-33964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97179ACBF39
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 06:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4057C1712B3
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 04:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D1E18FC89;
	Tue,  3 Jun 2025 04:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+X9DRr7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3578C91
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 04:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748925589; cv=none; b=K+91M3hoqVhSJlsk6c/AF9nfUsKlkIILy1Z0UpR4y7CbcBq6UaX5WumrQn9pQ7THGKxwmuPcyoDemai+28oUxYQQcwG6UET6vkOhtHSjtJepYKmyFdkttUTl0xwyY4qslM+8K85PNGPG5/4zU493SPb8M9BuIY+e4JsVUZM6JK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748925589; c=relaxed/simple;
	bh=KgqHvKFg8ZTJgaOeZXIxvn1flfuczSbqahIysVvWA3w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M/aq+K5aC6jywyilE++zdKCJeiNBmvLoa7IaRCohgR2DvSVUj30JGu1y8+PioqiXWgmpMj18P1HpJqQeHc7yjue9PuIwJRke0HovldzlWqHJ1eTTWlxV71zV+v4W/68aj+PD1kL1lHvCTZI12iwSWQ8riCyexDdvs6uLXGVfpbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+X9DRr7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748925588; x=1780461588;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KgqHvKFg8ZTJgaOeZXIxvn1flfuczSbqahIysVvWA3w=;
  b=B+X9DRr74mBwK3loD/CK4A0eGGDUYm5UMmjEGnBYpJagG8z0ZjFvz8yK
   aMd6S+eFRuPVvotBGMJ8sSu2vnellrxtaJWBpUfNTbqJu9QgrYLyk1ZZU
   0ggxRPj5JiDJSbRsXu2KEL/4CePQl64GstOAzhHzNLtRPFb5kow5ivqIW
   HcTgL8nLWbVMdFu8tcZWgDeMP5s7jMWTRRt6aGu7LbgXaRsdm80BOlINP
   qPwOuAqlgsZbUmKQP2jer+uaj5db1xODSYXzM6ERJZjdJ3NewlFeiuTEd
   GtFOv2MElUebJFw0lcSTrULR2IZsYdsTOyUY4EZdKFYfkOefj0hU365Bq
   g==;
X-CSE-ConnectionGUID: cGtPi1qCRICrX/nKBZC1+Q==
X-CSE-MsgGUID: C1YFia2QRASB48rFfzIaSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50070877"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="50070877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 21:39:48 -0700
X-CSE-ConnectionGUID: 9wmCnl93T0eRoFRHrQYwfw==
X-CSE-MsgGUID: 309dDZ06ReGLq1uHZAS2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="175696035"
Received: from unknown (HELO jasonz-MS-7D25.itwn.intel.com) ([10.225.65.15])
  by orviesa002.jf.intel.com with ESMTP; 02 Jun 2025 21:39:45 -0700
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	arun.t@intel.com,
	hao.yao@intel.com,
	bingbu.cao@linux.intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v1] media: ipu-bridge: Add support for additional link frequencies
Date: Tue,  3 Jun 2025 12:39:23 +0800
Message-Id: <20250603043923.3147509-1-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Chen <jason.z.chen@intel.com>

Support two additional frequencies for the ov08x40 sensor using 2 lanes

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1cb745855600..7893a44723f1 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -76,7 +76,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV08A10 */
 	IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
 	/* Omnivision OV08x40 */
-	IPU_SENSOR_CONFIG("OVTI08F4", 1, 400000000),
+	IPU_SENSOR_CONFIG("OVTI08F4", 3, 400000000, 749000000, 800000000),
 	/* Omnivision OV13B10 */
 	IPU_SENSOR_CONFIG("OVTI13B1", 1, 560000000),
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
-- 
2.34.1


