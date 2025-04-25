Return-Path: <linux-media+bounces-31022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80FA9C352
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 11:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 826421BA231D
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FE02356DA;
	Fri, 25 Apr 2025 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdrIOqS3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C720236426
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573112; cv=none; b=W+KZXQW9aAfkpLS1FWFQN7HpaO76L6Y3hojn3R8S23EGvxH2KNMr9RA79NbkT9GETJW0d+xZTDcUx9H+fq62fqTSLV4lKup9icb1Ur7UzH22/deMM3NNWidQAdyiIK+VcCt+pgtg+XFrT7C3QpbLLlH+jXlHFeEWcsQomm/L3Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573112; c=relaxed/simple;
	bh=Y6nWTZH4sasMUeIKwIZkUErmH2pv0nGSat/U3tgCZCk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hC6ZH+Kn+7s5b8G2suEjipdIDsTHyzv/KQSyCKzzrKlPNepVrkOE5EdJJY3z4rZnNtRk3m9Ffmqzy4YpKAFrQTWIJSgTBHKQ5ql6ij7BDN8yfRGE+y+ySdE0ovOveIHWodYa1XBYAXDb0ypGM5qqP/of2ILJb5soskj9j8ewsFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdrIOqS3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745573111; x=1777109111;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y6nWTZH4sasMUeIKwIZkUErmH2pv0nGSat/U3tgCZCk=;
  b=ZdrIOqS33wP3YegcVij1mh1JrYqqlIsrUADWAJiukHgGG8O3pdUjSJjv
   aVIK9lk5zWxiU4tDzGy53vAsPWeB3DBcNW+3BEiJ8UZI8sGfiHwf5CHxt
   hhpqyjb0v2ednhS/mjZl6NIgNZEo0VN2y8NDVK1CfPFOi505w7Kz2rhCn
   OlAbeD11aXSUBx/p4Y8q00kOUPhSDIhtvRpgiQi5XxI/0T6cVGdLX4W7H
   YjIEqUzSlFCJ9efbRFed1PvUTb3nAcubCgNeLxt5zy34ze3ri4UYsZRFA
   8H+kFzM+7HcsM/Iemb1OE8siAVPD35PyuPrfmrGpmZ+XnHbV8bahIopCo
   Q==;
X-CSE-ConnectionGUID: s/qw5x6AS8+qslwJgYbpsw==
X-CSE-MsgGUID: RW9fUgUtTISrcmRjSWuGOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47365419"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47365419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:25:10 -0700
X-CSE-ConnectionGUID: QL0AZ1m6Q8GRymumllD5fw==
X-CSE-MsgGUID: 5pBmYIscSIC72/xq4U7HCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133839688"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2025 02:25:08 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	dongcheng.yan@intel.com
Cc: bingbu.cao@linux.intel.com
Subject: [PATCH] media: lt6911uxe: select V4L2_CCI_I2C in Kconfig
Date: Fri, 25 Apr 2025 17:25:07 +0800
Message-Id: <20250425092507.15607-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

lt6911uxe driver has dependency on V4L2_CCI_I2C, need select it in
Kconfig to fix the build errors:

ERROR: modpost: "cci_write" [drivers/media/i2c/lt6911uxe.ko] undefined!                                                                                                                                                                    ERROR: modpost: "cci_read" [drivers/media/i2c/lt6911uxe.ko] undefined!

Fixes: e49563c3be09 ("media: i2c: add lt6911uxe hdmi bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e576b213084d..24f3936d0da8 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1151,6 +1151,7 @@ config VIDEO_LT6911UXE
 	tristate "Lontium LT6911UXE decoder"
 	depends on ACPI && VIDEO_DEV
 	select V4L2_FWNODE
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the Lontium
 	  LT6911UXE HDMI to MIPI CSI-2 bridge.
-- 
2.34.1


