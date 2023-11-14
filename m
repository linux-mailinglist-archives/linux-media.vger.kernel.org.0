Return-Path: <linux-media+bounces-324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A9B7EACF9
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F83DB20A01
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 09:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F21B168D1;
	Tue, 14 Nov 2023 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMCkSyuE"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A1168B2
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 09:25:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34FC133
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 01:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699953923; x=1731489923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CdjJ4GYBpPZGdE0FhSv5SKcjNj5kL16lQA3yADHBvnc=;
  b=SMCkSyuEO01UlDfHpHcVVNFweYZT6eBrU2pbV1n1ak0o4VcA3SAhh/Ol
   epAzoqWp98EmNSTk0dNzuMaH1FcN/RtX87FOQaK1W2rsYUN+FYBipLZfV
   reVfnOc9IQ+AivATkRciUSGLCicQhvDebPiE1k3nIxxJ+vCRZuwdii8LS
   Je9LdQtlznQDua/J8JASa7EWIf7L+cdB37l9d0rUFJjI+reW5shxGhhVf
   +1gw94EVN6qJNnsqIL88vdXCvZpEletx7OBJoGMdJ4Qv1JmSC/ulz+5ED
   4PHH3Lnz/49ZmgsVrzuSCMolGe10IgjFcL/GvjtuIvu9JjmQQQZuI/bnb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387781716"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="387781716"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938015870"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938015870"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:18 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A02D811FAE8;
	Tue, 14 Nov 2023 11:25:14 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v4 5/6] media: ccs: Better separate CCS static data access
Date: Tue, 14 Nov 2023 11:25:09 +0200
Message-Id: <20231114092510.1443545-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
References: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
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
where as static data (when it comes to ccs_static_data_read_ro_reg())
contains the read-only register values but no hardware registers are
accessed in that case.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 25993445f4fe..03daaa8310a6 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -197,8 +197,8 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 	return 0;
 }
 
-static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
-			   u32 reg, u32 *val)
+static int __ccs_static_data_read_ro_reg(struct ccs_reg *regs, size_t num_regs,
+					 u32 reg, u32 *val)
 {
 	unsigned int width = ccs_reg_width(reg);
 	size_t i;
@@ -235,16 +235,17 @@ static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
 	return -ENOENT;
 }
 
-static int ccs_read_data(struct ccs_sensor *sensor, u32 reg, u32 *val)
+static int
+ccs_static_data_read_ro_reg(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
-	if (!__ccs_read_data(sensor->sdata.sensor_read_only_regs,
-			     sensor->sdata.num_sensor_read_only_regs,
-			     reg, val))
+	if (!__ccs_static_data_read_ro_reg(sensor->sdata.sensor_read_only_regs,
+					   sensor->sdata.num_sensor_read_only_regs,
+					   reg, val))
 		return 0;
 
-	return __ccs_read_data(sensor->mdata.module_read_only_regs,
-			       sensor->mdata.num_module_read_only_regs,
-			       reg, val);
+	return __ccs_static_data_read_ro_reg(sensor->mdata.module_read_only_regs,
+					     sensor->mdata.num_module_read_only_regs,
+					     reg, val);
 }
 
 static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
@@ -253,7 +254,7 @@ static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
 	int rval;
 
 	if (data) {
-		rval = ccs_read_data(sensor, reg, val);
+		rval = ccs_static_data_read_ro_reg(sensor, reg, val);
 		if (!rval)
 			return 0;
 	}
-- 
2.39.2


