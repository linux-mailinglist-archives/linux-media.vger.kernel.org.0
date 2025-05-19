Return-Path: <linux-media+bounces-32831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF74ABC31E
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 17:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E50661B6105A
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC7B2882B9;
	Mon, 19 May 2025 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxrQWBwp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D9286888;
	Mon, 19 May 2025 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669837; cv=none; b=msq0qmJQnmXYGVaxCufxsNBRwsm5B5nEgXhlC+/DA0yRr9L90Js7b00Nb6e0p2GOSelUZI3YkHx4SNjV2d2foS7mzW/0QzY2qd70W3kUx6qH0BJeNb6KDa6vRv5XLFPFH2jQnbccGuQX2AYXsgjRyf2DMPxmEaVKSEOl384Qlx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669837; c=relaxed/simple;
	bh=SbfybxeRa2xIWz0oHLGf8Yvut8GFTIY8+BPlypFLWTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwysY27X6zqqWEna4lUUUKCBpNzCWAWOBFRyaHSVd6aspUCYwRJ0/nIbPGnarggT4ZZEwMOKArss0BUfv++Pz30JByFvPceICV58MEUuMXEOHc6N3ed7E02TOWikXYkIqeA3leUmxlrsum8Rw+J1aSNuOSZTqXfG7O5H1ihvqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxrQWBwp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669836; x=1779205836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SbfybxeRa2xIWz0oHLGf8Yvut8GFTIY8+BPlypFLWTU=;
  b=TxrQWBwp1c+BNF/Vy4DbqPlbi3T1y37UKTY2LPr4Dqe+j62ZK3wbAXME
   R1O2P05XAW3qTmUPcp7PLACFhbBwnuLxQxfLhznzuCR1JVasXoYBw5xb2
   X5lZ3fG7+biha4XF9JCrYIER7VUub/9S9vlyl7Azei+/Lf7tE2rJPHyWS
   P0Mvo58GuxXIjTKPHgpt01KLx1lfd3B/XuAGQnoUwgyyMZ3Q0D40gYX4P
   VoH6GoGFkgNX48lY6ioRan2J/WUhXMZW+RKKUPtSgNFBDFsm4V9euirze
   EpQXc0uQoo4YLhw/YTGDPz1nsG+tHjvX9uL3/yG8Bmia0XaKX+mdcv+89
   A==;
X-CSE-ConnectionGUID: pczvm9ohR3GNE7VglLDqng==
X-CSE-MsgGUID: a5Dp314ZQhGpEF8OO1yDgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49480083"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49480083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:50:34 -0700
X-CSE-ConnectionGUID: wckLsARXQYeOsU1mU0Bc2g==
X-CSE-MsgGUID: 0ZynUHDmStqIIbmp7lMygQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144405903"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 08:50:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7EF6526B; Mon, 19 May 2025 18:50:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 3/3] media: atomisp: Remove no more used macros from math_support.h
Date: Mon, 19 May 2025 18:46:49 +0300
Message-ID: <20250519155028.526453-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
References: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After recent cleanups the few macros become unused. Remove them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/hive_isp_css_include/math_support.h    | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
index 6d45d0d8d060..2cb5c986790a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/math_support.h
@@ -10,14 +10,9 @@
 /* Override the definition of max/min from Linux kernel */
 #include <linux/minmax.h>
 
-/* force a value to a lower even value */
-#define EVEN_FLOOR(x)        ((x) & ~1)
-
 #define CEIL_DIV(a, b)       (((b) != 0) ? ((a) + (b) - 1) / (b) : 0)
 #define CEIL_MUL(a, b)       (CEIL_DIV(a, b) * (b))
-#define CEIL_MUL2(a, b)      (((a) + (b) - 1) & ~((b) - 1))
 #define CEIL_SHIFT(a, b)     (((a) + (1 << (b)) - 1) >> (b))
-#define CEIL_SHIFT_MUL(a, b) (CEIL_SHIFT(a, b) << (b))
 
 /*
  * For SP and ISP, SDK provides the definition of OP_std_modadd.
-- 
2.47.2


