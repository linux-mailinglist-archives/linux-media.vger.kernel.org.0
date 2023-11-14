Return-Path: <linux-media+bounces-320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B67EACF5
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 890401C20A72
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 09:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0DD171AE;
	Tue, 14 Nov 2023 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXG8afeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4D168B1
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 09:25:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D688E133
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 01:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699953917; x=1731489917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s3t1De+Tousi0iV8fKi3KkVJdU43D0s/JKkrxVrCfUg=;
  b=aXG8afeQYba0o0G+pUGWsOTlVrIj6VOGozaskRn6cmOoHlRpZ2Dy1W8S
   vblmWFFOcZJkjQjx6AapkAUykf6l5TPc/3td/HIyDdnc8tSwyXOWtFqUY
   9FNrRrSbgb/LHiWegxlmJm69uWZeY5UJV5DIWYKmsCp4mVpo75OjdApQC
   quiHh7RRnYr5PKAWKM6JYplUZSzsGQ3MUGV5nyQuk/xqLm3rHlzOMA0VY
   n8/5f68EOABwOQhNFazsOimR4rUVqY4vcBdf3DUg/FOQ384Wh2pNfC42s
   ype0IDdoVNVKWhfhiezk0LfU66ka8RWUghFSxlL7a1VeUrb6IlpGI59Cn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387781667"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="387781667"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938015856"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938015856"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:15 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 95F0411F89D;
	Tue, 14 Nov 2023 11:25:12 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v4 2/6] media: v4l: cci: Add driver-private bit definitions
Date: Tue, 14 Nov 2023 11:25:06 +0200
Message-Id: <20231114092510.1443545-3-sakari.ailus@linux.intel.com>
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


