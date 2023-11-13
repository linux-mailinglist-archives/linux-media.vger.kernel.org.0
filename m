Return-Path: <linux-media+bounces-241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FFB7E9D8B
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1EA41C20964
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE8620B20;
	Mon, 13 Nov 2023 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0o+IvYl"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933BF208A8
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:45:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395A810FB
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883106; x=1731419106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9eDGvWq7eNETl+uBlWVa9nAB3RTCFgKJKyc5vM2rbrg=;
  b=P0o+IvYlTNnMl5zBILIPuwvm0NHzYlYVSUZaOp46xB8m+HQTHLwgUy6c
   YSraCqF1e765MNdb68+fNtjJ3J8XXKWmOHZsC5IO3+G6y5GqPCvEEH1w8
   ApVPZ8XxlvPg6W8uuit9r8fOdyLAQ/AeRevrt/5MpUNwo0RboUj3gPgYz
   CIWD7dR76NLXqgk/LnDvNgZetbOwl+EbPic+W1oD+PnfiNo6eHoQz6Ng5
   n+58MqNxfHSEHSw8AoLxEviIRhGQmRe01Tm7XOV6VBwvqs4SINnyisEkF
   U+ayvTkU5MYBTKo7peKqdfiyjW0uQbNPOugi9gHDUIqCyJGrYJcw8Q1D0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421531266"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421531266"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793440936"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793440936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:03 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C4015120BDC;
	Mon, 13 Nov 2023 15:45:00 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v2 3/6] media: v4l: cci: Add macros to obtain register width and address
Date: Mon, 13 Nov 2023 15:44:55 +0200
Message-Id: <20231113134458.1423754-4-sakari.ailus@linux.intel.com>
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

Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
CCI_REG_WIDTH_BYTES() to obtain it in bytes.

Also add CCI_REG_ADDR() macro to obtain the address of a register.

Use both macros in v4l2-cci.c, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/v4l2-core/v4l2-cci.c | 8 ++++----
 include/media/v4l2-cci.h           | 9 +++++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

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
index ee469f03e440..50df3aa4af1d 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -7,6 +7,7 @@
 #ifndef _V4L2_CCI_H
 #define _V4L2_CCI_H
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/types.h>
 
@@ -36,8 +37,12 @@ struct cci_reg_sequence {
 /*
  * Private CCI register flags, for the use of drivers.
  */
-#define CCI_REG_PRIVATE_SHIFT		28U
-#define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)
+#define CCI_REG_PRIVATE_SHIFT		28
+#define CCI_REG_PRIVATE_MASK		GENMASK(31, CCI_REG_PRIVATE_SHIFT)
+
+#define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, x)
+#define CCI_REG_WIDTH(x)		(CCI_REG_WIDTH_BYTES(x) << 3)
+#define CCI_REG_ADDR(x)			FIELD_GET(CCI_REG_ADDR_MASK, x)
 
 #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
-- 
2.39.2


