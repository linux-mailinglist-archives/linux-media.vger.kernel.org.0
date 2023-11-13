Return-Path: <linux-media+bounces-275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE97EA0E2
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 17:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E8D5B20A95
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89E222334;
	Mon, 13 Nov 2023 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OY8g5k98"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C1521A0F
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 16:06:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E6E10EC
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 08:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699891569; x=1731427569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s3t1De+Tousi0iV8fKi3KkVJdU43D0s/JKkrxVrCfUg=;
  b=OY8g5k98EDBIKi0HL58A0L7A59IP+1MDr3MT29fv5VYxoCyrf/J+aWGc
   d+lcYSAwIBzSNrrqWjNHmGZ0OvcG2YzxHYlPTbrv7WlzxREOAWCyAiVCd
   296f7gyXLYtWWv9h84U3NQtz1PX9DQvLWKC/8eoalOktib+THgIoRX+De
   YWn9qhsc/+sZ491n00Ql/ZXrDkMq1DwHLkF9yjeWyvQYYpvu+FWe2n/Yr
   UNrieFoYudvfwx04AULDFr92t6BU1ub48OKdrls9rURI28hJkgIjNa0Zm
   0WhtxGsQBqYB+3n1EdVH47tqYKRXpncYVQbwQBWlq7QoFHQht5BgpGb/t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3542966"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3542966"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="887956367"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="887956367"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:06:05 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 11E5F120DDF;
	Mon, 13 Nov 2023 18:06:02 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v3 2/6] media: v4l: cci: Add driver-private bit definitions
Date: Mon, 13 Nov 2023 18:05:57 +0200
Message-Id: <20231113160601.1427972-3-sakari.ailus@linux.intel.com>
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

Provide a few bits for drivers to store private information on register
definitions.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-cci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index f2c2962e936b..ee469f03e440 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -33,6 +33,11 @@ struct cci_reg_sequence {
 #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
 #define CCI_REG_WIDTH_SHIFT		16
 #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
+/*
+ * Private CCI register flags, for the use of drivers.
+ */
+#define CCI_REG_PRIVATE_SHIFT		28U
+#define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)
 
 #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
 #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
-- 
2.39.2


