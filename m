Return-Path: <linux-media+bounces-22691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7E89E5199
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78A8281D07
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7751D61BC;
	Thu,  5 Dec 2024 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h49lqT1V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7851D5AD3
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733391903; cv=none; b=GK7Y42HUtl9IvD09IxzhIRUUSaaxVWHdK5OxK+znJrZYD8REpu/L+SJYD9nYk+GZJ6IBoV3PaFnS2ms1yYpTiP6tfZ8T3SKeZG1K06cK1SfPT5xRslgqs6W2SpEh+vgy9xxEki5hqoON1japyZXIq8UPyFLw5U5+K5oSLUce/HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733391903; c=relaxed/simple;
	bh=QQ/PVBSpDJnCaP76VSgkdtpKQ1dEdV0uw790VsldScA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XEkucrzv+T85hmA/UbwKiApZiSZxGvH+NaqXEwWxQUIRtBqd1bLkAeUlGJL16OaeeTtjMBSNVMcJHQITzMZY8PEJM6fut1Gdb46xAh/1TnQ3PzU+CPdDpLhczJUb710/CeVVWnXqesCAKa5zhyy/OyHa81hZvbbVcJLg6VUysLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h49lqT1V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733391901; x=1764927901;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QQ/PVBSpDJnCaP76VSgkdtpKQ1dEdV0uw790VsldScA=;
  b=h49lqT1VZjiDm4IKmCB0coMndBnNg/cY62R/mQrUrxEoqCxCx+E11w8c
   uFimTty7HmY/eq5yJ0/h21yJx+piT2u378CUJMLn1nZq10W2LNMo22weJ
   t2Th95fo3nxm6OOl1b+/9JOTsSMcnoDDPHq2rXbZRypEgJHoiLjvyOWob
   CmsyPc7edsLg/woSjOHskyuKnMSGKARFwDu50DJl121+T7/jyfwjfd7TW
   DJH6FLuJR3BvJ4SLVHDBy/fZQ8XHPT7XTP/Rc9KchGHY43qIXsLkx1erJ
   hn3hQ9lwDF+UQeo4YljV4798tGw929ZEMLCKUWaupNAC3Kls90TNqd7oa
   g==;
X-CSE-ConnectionGUID: Zy1FTbYaR+67pdXVv0QZCQ==
X-CSE-MsgGUID: m9//ydMkRle3UxrAPhvTDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56172726"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="56172726"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:45:00 -0800
X-CSE-ConnectionGUID: KgZpOuFESHSrgfwX8CWdEA==
X-CSE-MsgGUID: NqDwPd46S/iew4mtBLVXDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="131473316"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:45:00 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 770AE11F775;
	Thu,  5 Dec 2024 11:44:56 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tJ8Po-006FvQ-1F;
	Thu, 05 Dec 2024 11:44:56 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: david@ixit.cz,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 1/1] media: ccs: Clean up parsed CCS static data on parse failure
Date: Thu,  5 Dec 2024 11:44:46 +0200
Message-Id: <20241205094446.1491176-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_data_parse() releases the allocated in-memory data structure when the
parser fails, but it does not clean up parsed metadata that is there to
help access the actual data. Do that, in order to return the data
structure in a sane state.

Reported-by: David Heidelberg <david@ixit.cz>
Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Properly clean up after all error cases.

 drivers/media/i2c/ccs/ccs-data.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 9d42137f4799..2591dba51e17 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -10,6 +10,7 @@
 #include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #include "ccs-data-defs.h"
 
@@ -948,15 +949,15 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
 
 	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, verbose);
 	if (rval)
-		return rval;
+		goto out_cleanup;
 
 	rval = bin_backing_alloc(&bin);
 	if (rval)
-		return rval;
+		goto out_cleanup;
 
 	rval = __ccs_data_parse(&bin, ccsdata, data, len, dev, false);
 	if (rval)
-		goto out_free;
+		goto out_cleanup;
 
 	if (verbose && ccsdata->version)
 		print_ccs_data_version(dev, ccsdata->version);
@@ -965,15 +966,16 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
 		rval = -EPROTO;
 		dev_dbg(dev, "parsing mismatch; base %p; now %p; end %p\n",
 			bin.base, bin.now, bin.end);
-		goto out_free;
+		goto out_cleanup;
 	}
 
 	ccsdata->backing = bin.base;
 
 	return 0;
 
-out_free:
+out_cleanup:
 	kvfree(bin.base);
+	memset(ccsdata, 0, sizeof(*ccsdata));
 
 	return rval;
 }
-- 
2.39.5


