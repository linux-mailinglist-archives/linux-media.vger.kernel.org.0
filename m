Return-Path: <linux-media+bounces-278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF107EA0E6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 17:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C341F21B2E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D192B224CA;
	Mon, 13 Nov 2023 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvYKoajQ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA82231F
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 16:06:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A4D1711
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 08:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699891570; x=1731427570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CdjJ4GYBpPZGdE0FhSv5SKcjNj5kL16lQA3yADHBvnc=;
  b=BvYKoajQLVH6MFQN+c7nAAWfDTzc/CT2a2czNEA9Xb1CpYkJq5LyCyjF
   TXHLNMJAfRCrF+Fb+z2BgRGhY1FYdPs8S7JvaEa7LFwsBOBjRpChK0zVU
   YblCo+Gij/pYVUX6QUXikVv+cNxBJvv/IXvOswmT+qYCcU/zz9TsS+LyA
   QFse96jBUsaAnGi84R3MCsY8ktW4H4fTrYETuYRP1QGl9wbHU2y0JcOpV
   +Ix+BbxkY7JXrcykQjT6/tD+7oVI0mtQ980XFCTTxcJYG5oATXJnqu333
   zw4N4bndi+CQLsjPNLK50S1sGzk6rdFWJ4OqsgO+Gsm3vVdC6wxeUFb74
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3542983"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3542983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="887956386"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="887956386"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:06:08 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ED7FC120F14;
	Mon, 13 Nov 2023 18:06:04 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v3 5/6] media: ccs: Better separate CCS static data access
Date: Mon, 13 Nov 2023 18:06:00 +0200
Message-Id: <20231113160601.1427972-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113160601.1427972-1-sakari.ailus@linux.intel.com>
References: <20231113160601.1427972-1-sakari.ailus@linux.intel.com>
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


