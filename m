Return-Path: <linux-media+bounces-322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290497EACF7
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D556E280D21
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 09:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD9F1803D;
	Tue, 14 Nov 2023 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NufK8xqD"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEB168C3
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 09:25:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8B1134
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 01:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699953918; x=1731489918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xycAisPFI+PHwHHMOTHkXIKypDQu2/iXZgctF8Ww9s8=;
  b=NufK8xqDNzNeyQntBezxvMotfcVEbqRLrx3QDcdbZIXjXx0KHM4MK5Ac
   /f/7yolA11pgtBC1VmDRns/e0eMBr93YVsP58YQwAOWJqrd9fsJXQO1zD
   rJ+LoamhV0PF/2QJgCJUxGtpPXT2SnaNdDoUOf1wlJ/DjE/JHbbq66y/l
   CYPsoxAP3dQHQvTMSqrCLKtzRggn1ubnELra3HZLONqQ/QKZSq0ML5uRy
   qQiTsOWHkOHgGqX3Om78Je1IMmu7QYZaXkdlwJUmp2B8k90l7X1s+YINQ
   rfZewYlda+OKL9OwKNFTCBe/glmNQqXQV7rx+dPJIhesqbmH4i6iDVRvs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387781680"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="387781680"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938015857"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938015857"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:16 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4C56011F950;
	Tue, 14 Nov 2023 11:25:13 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v4 3/6] media: v4l: cci: Add macros to obtain register width and address
Date: Tue, 14 Nov 2023 11:25:07 +0200
Message-Id: <20231114092510.1443545-4-sakari.ailus@linux.intel.com>
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

Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
CCI_REG_WIDTH_BYTES() to obtain it in bytes.

Also add CCI_REG_ADDR() macro to obtain the address of a register.

Use both macros in v4l2-cci.c, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/v4l2-core/v4l2-cci.c | 8 ++++----
 include/media/v4l2-cci.h           | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
index bc2dbec019b0..3179160abde3 100644
--- a/drivers/media/v4l2-core/v4l2-cci.c
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -25,8 +25,8 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
-	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
+	len = CCI_REG_WIDTH_BYTES(reg);
+	reg = CCI_REG_ADDR(reg);
 
 	ret = regmap_bulk_read(map, reg, buf, len);
 	if (ret) {
@@ -75,8 +75,8 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
 	if (err && *err)
 		return *err;
 
-	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
-	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
+	len = CCI_REG_WIDTH_BYTES(reg);
+	reg = CCI_REG_ADDR(reg);
 
 	switch (len) {
 	case 1:
diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index ee469f03e440..406772a4e32e 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -7,6 +7,7 @@
 #ifndef _V4L2_CCI_H
 #define _V4L2_CCI_H
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/types.h>
 
@@ -39,6 +40,10 @@ struct cci_reg_sequence {
 #define CCI_REG_PRIVATE_SHIFT		28U
 #define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)
 
+#define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, x)
+#define CCI_REG_WIDTH(x)		(CCI_REG_WIDTH_BYTES(x) << 3)
+#define CCI_REG_ADDR(x)			FIELD_GET(CCI_REG_ADDR_MASK, x)
+
 #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
-- 
2.39.2


