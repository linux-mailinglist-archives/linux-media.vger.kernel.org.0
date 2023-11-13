Return-Path: <linux-media+bounces-239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33D27E9D89
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96505280D8E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD1B20B18;
	Mon, 13 Nov 2023 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLCaTwro"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDA208D3
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:45:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E7D10E2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883105; x=1731419105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dSRoGLNGkzB/cewjB4rN6vNiiKu4LDQf2s9zKDElRU0=;
  b=MLCaTwroFXWx4J1+ebE72904UHBfgdMT+tOSd1oEX3tsfvQUGa+lJKwi
   yRcUUROyFUNVQKtdtNjo2D7seNGsFVx4VQMVvew1QvOR4eG+HmFny3DVX
   Otk+qgvARt3lmu38HMDnvMccWEfY3yW/SjuPw0kxbKdfDxLXJcJ9hxAxn
   ahvVSbeFmPKge118QZ8xJaVJKW+McPAFxMYMOjKGwaIoyckR3krbDHJAI
   trGbfQBH4KFHfet+vthekSfphJM1d07e90c0AqZ08blMC5CYOLMglQWGN
   CXOy8VfkrfAYDrveU2JArhXevaDj6GJa69JjhM6wVlTbiMyYBr00vQrFn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421531262"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421531262"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793440933"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793440933"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:03 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 46307120BA7;
	Mon, 13 Nov 2023 15:45:00 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v2 2/6] media: v4l: cci: Add driver-private bit definitions
Date: Mon, 13 Nov 2023 15:44:54 +0200
Message-Id: <20231113134458.1423754-3-sakari.ailus@linux.intel.com>
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

Provide a few bits for drivers to store private information on register
definitions.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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


