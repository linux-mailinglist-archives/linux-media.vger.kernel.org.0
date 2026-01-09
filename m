Return-Path: <linux-media+bounces-50279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45BD0988F
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 13:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9EB03033BC9
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 12:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD3E35A941;
	Fri,  9 Jan 2026 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAXv2hKR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E38359713
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961071; cv=none; b=UK4OVvl0u+QdDcMOTI5Iy1ka8OR/vrwEWH9gE9PjY0FMme+YXyOHpg6Ga2pbTqn4bhXpTCcpC7wKv5SQxd/CZrEZDmdlQcrd8MVu22SYi/OmDdMquZ1RixwgbQYumYhn3WMqh9+3nxPGrm/eSlf8ATZGrsoZK92Rz1cwbY5glsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961071; c=relaxed/simple;
	bh=X8kXsU2i9RTKCFlCHL6kq4U0O5ef3kU8r57TSnnKZXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sXsRQDDbBEWK+QKoouh8/5/Ny2wEpQBEKVqFq9cWRITrlvTD7AUGvqKg08R6vDG0x2XnN6k7n9HDoMVIojDd4/jQtqszmeoAx8AFxGf5oVZ74cStkmZWJj1/SzQ9OBek67yXKuglDCcK7FyTh6Ie0S/nsWCs3Oilgod1IEa+r9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAXv2hKR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767961071; x=1799497071;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X8kXsU2i9RTKCFlCHL6kq4U0O5ef3kU8r57TSnnKZXE=;
  b=PAXv2hKRDMejvCf+nkpOdwS2SRV3c+UyLPTCSsJm93geLpdQYMxHjzCY
   t+BfBdbO1pRF7nOCdjX+BWF06aTQqHIrY9hngRBFuA1EuXZLz/MdcCfmE
   SVkgX9R9wMHv/5C5h21uqnJlmqLOyLmDac5OW0IlkeJuWqlWpdLicmlhh
   PomM+Xs3UORI2DUYt27/QdxFn7q79gDaefuz5exAvTQWFA+vCYOcHnHcU
   yp1eNqZonHOB9nUp4FrKPpWjvw0bvSDEUvyke5AzD/Z15f4heB+O4Wcj8
   sqEdITRCgtyOzH7vqpTkM0HfioDCdmTHLbzKRZmND5nnYZGMqRHxnrrVt
   A==;
X-CSE-ConnectionGUID: dzixAW4DS3WVKPcdBjz2nA==
X-CSE-MsgGUID: 5LIT80/SRJW9MauCpGTHAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69274821"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69274821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:17:49 -0800
X-CSE-ConnectionGUID: 70Q03UhBQOCynmB49lXCTA==
X-CSE-MsgGUID: YhVHcSYvSLC2twjHB0ItzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203739545"
Received: from vverma7-desk1.amr.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.124.223.84])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:17:47 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B5C55120D05;
	Fri, 09 Jan 2026 14:17:59 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1veBRG-00000002Soy-1jjz;
	Fri, 09 Jan 2026 14:17:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/2] media: ccs: Clean up ccs_get_hwcfg() a little
Date: Fri,  9 Jan 2026 14:17:57 +0200
Message-ID: <20260109121758.587434-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style issues and do other small cleanups in ccs_get_hwcfg().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 33 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d7038f5b3689..4508a561428a 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3145,11 +3145,9 @@ static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
 
 static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 {
-	struct ccs_hwconfig *hwcfg = &sensor->hwcfg;
 	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_UNKNOWN };
-	struct fwnode_handle *ep;
-	struct fwnode_handle *fwnode = dev_fwnode(dev);
-	unsigned int i;
+	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	struct ccs_hwconfig *hwcfg = &sensor->hwcfg;
 	int rval;
 
 	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
@@ -3176,9 +3174,9 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		break;
 	case V4L2_MBUS_CSI1:
 	case V4L2_MBUS_CCP2:
-		hwcfg->csi_signalling_mode = (bus_cfg.bus.mipi_csi1.strobe) ?
-		SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE :
-		SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_CLOCK;
+		hwcfg->csi_signalling_mode = bus_cfg.bus.mipi_csi1.strobe ?
+			SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE :
+			SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_CLOCK;
 		hwcfg->lanes = 1;
 		break;
 	default:
@@ -3187,11 +3185,7 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		goto out_err;
 	}
 
-	rval = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-					&hwcfg->ext_clk);
-
-	dev_dbg(dev, "clk %u, mode %u\n", hwcfg->ext_clk,
-		hwcfg->csi_signalling_mode);
+	dev_dbg(dev, "signalling mode: %u\n", hwcfg->csi_signalling_mode);
 
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_warn(dev, "no link frequencies defined\n");
@@ -3199,23 +3193,22 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 		goto out_err;
 	}
 
-	hwcfg->op_sys_clock = devm_kcalloc(
-		dev, bus_cfg.nr_of_link_frequencies + 1 /* guardian */,
-		sizeof(*hwcfg->op_sys_clock), GFP_KERNEL);
+	hwcfg->op_sys_clock =
+		devm_kcalloc(dev,
+			     bus_cfg.nr_of_link_frequencies + 1 /* guardian */,
+			     sizeof(*hwcfg->op_sys_clock), GFP_KERNEL);
 	if (!hwcfg->op_sys_clock) {
 		rval = -ENOMEM;
 		goto out_err;
 	}
 
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
+	for (unsigned int i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
 		hwcfg->op_sys_clock[i] = bus_cfg.link_frequencies[i];
 		dev_dbg(dev, "freq %u: %lld\n", i, hwcfg->op_sys_clock[i]);
 	}
 
-	v4l2_fwnode_endpoint_free(&bus_cfg);
-	fwnode_handle_put(ep);
-
-	return 0;
+	fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				 &hwcfg->ext_clk);
 
 out_err:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.47.3


