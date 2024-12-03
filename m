Return-Path: <linux-media+bounces-22543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D651B9E1D6F
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 14:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CECE284B63
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 13:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70201E1C37;
	Tue,  3 Dec 2024 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ufj8fqTn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F411632D9
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733232057; cv=none; b=DTktmRJvWxSkuzensAfnFwykcJr/26J+t94w1i/pgPDEy908ABjggvJYK9MF4LwSVn0HWLGG45aTJcBp1WPXeRHteoxMd+0UBZLDo+wLOs5QuRJCm+f9gSE0akQk125ur+U8ctwF4b72BMdofbLxwcyyDiszTPE3hfzzo+asKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733232057; c=relaxed/simple;
	bh=UxBvzuYf8AmF7Zl4yUcB1j2gkkJTnoNVIgRbn5cpwEs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cYfXEHTAjfi0zbj8EIcIMfAitj23BpBNQsRlunb5Sx5yVYOmPFl6rMuYeLkp1hgef6O9ziHMW5Ww1xIuNrqH4YXiBjq22L9761yijj0qr27/w8mxZriziEK7YaoeCoajlyDpnjfipGeESBM5xPcWYhVyQCTOc3C3yInHszqd5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ufj8fqTn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733232055; x=1764768055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UxBvzuYf8AmF7Zl4yUcB1j2gkkJTnoNVIgRbn5cpwEs=;
  b=Ufj8fqTnuw7mJUtuEmYIugFUZrENwKeVZ4+QTY5H+Z8Ld8fcTEp35Ifl
   dgrzHqPbmZhJ5C3ZjOTnFu94mRjvj+4lok8z2dj/zE5Wbfi2rogWsYDBK
   G9NO5JJBEbeO6sdHBI76ewxk9q3GwoarbZJ+swTVsKCn7QqM2GgsohyTe
   MaGkkJvUz0ila7O+3fm7STtmTkjU95k9wXTVrcADNhwX4Mtvh0inBbkSP
   LOjVtVLEwCZm5MrnTQrodbZx8LYP1j2LYSRr3xoo0pBKIRXVPQQZKIZiX
   mXgQLPNGgvJFc8gNFQiP/SVlmDU3k+JC1OogYBiE5mYV5M/m1jgRNTvuw
   Q==;
X-CSE-ConnectionGUID: 9WPY/lrCTEql+I5Ccrk9nQ==
X-CSE-MsgGUID: /73KmMdFRLiMPqH9+IQOTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33575966"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33575966"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 05:20:55 -0800
X-CSE-ConnectionGUID: BUFLK/nyTzOXm8zL5alvEg==
X-CSE-MsgGUID: 3nsutMe4S2afOfMcznVp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93319731"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 05:20:54 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6EE5E11F89A;
	Tue,  3 Dec 2024 15:20:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tISpf-005Ia7-14;
	Tue, 03 Dec 2024 15:20:51 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: david@ixit.cz
Subject: [PATCH v2 1/1] media: ccs: Clean up parsed CCS static data on parse failure
Date: Tue,  3 Dec 2024 15:20:41 +0200
Message-Id: <20241203132041.1263059-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_data_parse() releases the allocated in-memory data structure when the
parser fails, but it does not clean up parsed metadata that is there to
help access the actual data. Do that, in order to return the data
structure in a sane state.

Reported-by: David Heidelberg <david@ixit.cz>
Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Add a necessary header and fix a typo.

 drivers/media/i2c/ccs/ccs-data.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 9d42137f4799..0afdc73ead16 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -10,6 +10,7 @@
 #include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #include "ccs-data-defs.h"
 
@@ -974,6 +975,7 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
 
 out_free:
 	kvfree(bin.base);
+	memset(ccsdata, 0, sizeof(*ccsdata));
 
 	return rval;
 }
-- 
2.39.5


