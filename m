Return-Path: <linux-media+bounces-52-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710287E7F30
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A27701C20F23
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39DC93A279;
	Fri, 10 Nov 2023 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltSibrUe"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C23D974
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:47:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86E4250A1
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 01:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699609631; x=1731145631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Jq82xAbryAD9fi1kC100DlbhXSoH0I2BBYCiDOPDcE=;
  b=ltSibrUeewyeLmhU1WG0VOGIkD96INE9AUADvvuwGGA5NDaX5dAHaP5k
   dBjhBzPE/0CGlvtoLEtTlxAmXX2KvO8tWjm7+1wgyrxTMsCDAJNSWi+50
   4EjfJ8lbTBeozaOGJE5BjTqKkD6qyLL2us8059Snw0LoMrhIB+7Ax6DtM
   53FDuSSFlizJN/a46Q4GYXL14EhBhz5PAwJfM+vr6D96sNrhJPmN7uVXx
   +bmvOKMOTdRqog3MO6DUjdFOb2cRMgy9v/rQPV4iTYnYFPpJXdtk4ALuQ
   tuUuN8nhsuVMkPn3gYy9WfhjUEaA6LmTdwQQ0INWaFZg+HTqlB69/rGm/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421253785"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="421253785"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740114808"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="740114808"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:09 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0A14111F89D;
	Fri, 10 Nov 2023 11:47:06 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH 2/6] media: v4l: cci: Add driver-private bit definitions
Date: Fri, 10 Nov 2023 11:47:01 +0200
Message-Id: <20231110094705.1367083-3-sakari.ailus@linux.intel.com>
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

Provide a few bits for drivers to store private information on register
definitions.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-cci.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index f2c2962e936b..b4ce0a46092c 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -33,6 +33,12 @@ struct cci_reg_sequence {
 #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
 #define CCI_REG_WIDTH_SHIFT		16
 #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
+/*
+ * Private CCI register flags, for the use of drivers.
+ */
+#define CCI_REG_FLAG_PRIVATE_START	28U
+#define CCI_REG_FLAG_PRIVATE_END	31U
+#define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
 
 #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
-- 
2.39.2


