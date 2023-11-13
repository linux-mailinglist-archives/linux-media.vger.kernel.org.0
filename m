Return-Path: <linux-media+bounces-243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC07E9D8E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA37EB20AB8
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE78A20B02;
	Mon, 13 Nov 2023 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTpHrOJu"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217BB2033A
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:45:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6D2D53
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883107; x=1731419107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vEOsHOoQFbDjx/fMXgU7+lcn6jtLvfAt8wSFkJ5LgXQ=;
  b=GTpHrOJu1ItI+bd0k77bo/+ST7CalS53Cm1SzYiiGwjOEUKxLce6Lrtk
   Ehlhuc5PxijQ1x+2jrRl3k11jiVY5I96NQPGDBNxljD98uKn0xlSKzdUF
   EbxH+lrpff25d4tni8MsmoXwiyLoQL2UzA+4sDXNEBvQ4QyWl0fBc1tDf
   1oSucCRQNvcRqwtMmVCYferPBdplEeKXQj2MsvK3qxwesLds7t+wHi1Lh
   KMXqNXmP+AQxKPyvFhc6TUBqlmcIHeDZRy/FF+v6KQC54iBvNqysHfION
   jD2AfzzxoolMefXnFCNWq9BQTHupS75kbp2XD8NhK5I/BVaZ5T2mB16mE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421531273"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421531273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793440942"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793440942"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:05 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 58182120E18;
	Mon, 13 Nov 2023 15:45:02 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v2 5/6] media: ccs: Better separate CCS static data access
Date: Mon, 13 Nov 2023 15:44:57 +0200
Message-Id: <20231113134458.1423754-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate CCS static data read-only register access in ccs-reg-access.c by
naming them differently.

The code in this file generally deals with reading and writing registers
where as static data (when it comes to ccs_static_read_only()) contains
the read-only register values but no hardware registers are accessed in
that case.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/drivers/ccs/mk-ccs-regs  |  2 +-
 drivers/media/i2c/ccs/ccs-reg-access.c        | 20 +++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
index 01252ee6062b..3d3152b45821 100755
--- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
+++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
@@ -136,7 +136,7 @@ if (! defined $kernel) {
 
 print $H "#define CCS_FL_FLOAT_IREAL	" . flag_str(\$flag, \$all_flags) . "\n";
 print $H "#define CCS_FL_IREAL		" . flag_str(\$flag, \$all_flags) . "\n";
-print $H "#define CCS_BUILD_BUG \
+print $H "#define CCS_BUILD_BUG \\
 	BUILD_BUG_ON(~CCI_REG_PRIVATE_MASK & ($all_flags))\n"
     if defined $kernel;
 
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 25993445f4fe..652d705a2ef5 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -197,8 +197,8 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 	return 0;
 }
 
-static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
-			   u32 reg, u32 *val)
+static int __ccs_static_read_only(struct ccs_reg *regs, size_t num_regs,
+				  u32 reg, u32 *val)
 {
 	unsigned int width = ccs_reg_width(reg);
 	size_t i;
@@ -235,16 +235,16 @@ static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
 	return -ENOENT;
 }
 
-static int ccs_read_data(struct ccs_sensor *sensor, u32 reg, u32 *val)
+static int ccs_static_read_only(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	if (!__ccs_read_data(sensor->sdata.sensor_read_only_regs,
-			     sensor->sdata.num_sensor_read_only_regs,
-			     reg, val))
+	if (!__ccs_static_read_only(sensor->sdata.sensor_read_only_regs,
+				    sensor->sdata.num_sensor_read_only_regs,
+				    reg, val))
 		return 0;
 
-	return __ccs_read_data(sensor->mdata.module_read_only_regs,
-			       sensor->mdata.num_module_read_only_regs,
-			       reg, val);
+	return __ccs_static_read_only(sensor->mdata.module_read_only_regs,
+				      sensor->mdata.num_module_read_only_regs,
+				      reg, val);
 }
 
 static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
@@ -253,7 +253,7 @@ static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
 	int rval;
 
 	if (data) {
-		rval = ccs_read_data(sensor, reg, val);
+		rval = ccs_static_read_only(sensor, reg, val);
 		if (!rval)
 			return 0;
 	}
-- 
2.39.2


