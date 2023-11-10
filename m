Return-Path: <linux-media+bounces-22-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF4E7E7EE2
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF2CB21A1B
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829C73B78F;
	Fri, 10 Nov 2023 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOilA3vQ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3CF3AC24
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528AB250A6
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699609634; x=1731145634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QJWnER7Q+8D+Bl7nUb5VB3orb5Qiwr8fqqGoImREF58=;
  b=KOilA3vQx8oKaoNVCkNTXjcxsWI6y9qgXP0tIgRtxhN54PQkEliB0/S1
   2oc1gLlYXr7MpTnqwai8ljibc/YHA2e9GPjhyYGdqD1Ym7oZOnJ8ndPDV
   W/QQUmUbLjhZpBn1VS/v+InFixvQgaLyyZc7VASvNkXjUwhcA7q7rp+pz
   jy3/SF4K+orp3BlX75M7MeZCd1pa+4MbcKnV1M9ExVBr924cfG3CKwwFl
   lSfYETOozYua1/dVT60q6jVmAs+4EEkfdtlYfFaXNTsdSnXEfbPejMx07
   emfCNOoAhyWtDsnVEoT8ayoFEs22O58Wofmv1B+IPg+Qt61DXxMldCSRk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421253798"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="421253798"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740114817"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="740114817"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:12 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 76DBB120788;
	Fri, 10 Nov 2023 11:47:09 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH 5/6] media: ccs: Better separate CCS static data access
Date: Fri, 10 Nov 2023 11:47:04 +0200
Message-Id: <20231110094705.1367083-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate CCS static data read-only register access in ccs-reg-access.c.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

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


