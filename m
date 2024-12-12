Return-Path: <linux-media+bounces-23322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD689EE7E5
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 14:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F48188936E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70EE2153F1;
	Thu, 12 Dec 2024 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZUN/NU0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FED2153E8
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734010816; cv=none; b=L+GO30IxJJhyNRHDQm3e4rrhdC90bZqU0mairL7r1PQ1ibsbWuuEU9TEGJyaUdRSTFkVXAZ9PWOcA6A7Aw57syoZJWfJVWa6eBVJS/Jw1fGwi8UzCxOpenq9GrULt1mi3uVdQ+PT6SyLGuISPzMP++9V/IYNxp8eDQhDjJb9QyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734010816; c=relaxed/simple;
	bh=b9T64XMF15KAMz31uXe/FWdqex3dJqSis0O15g1AUdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nHR1qQDwMLnRmR9nfLElWZr6rq3kTTQugL2GznIWzEUIuqG0+8gWYGkq8HrtLlxP75wHHd+vhbEN66g1+EM3vVhQVbWV8qFvOgzWVvGezt9BwLxArS2bHAEN9JjFg9Yr9xL/2B55DoShgpFptclTlJqux13BeYqAyGLQQKNh9UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZUN/NU0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734010815; x=1765546815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b9T64XMF15KAMz31uXe/FWdqex3dJqSis0O15g1AUdY=;
  b=IZUN/NU00dbvVHPXxVIsf5rqT7cXiLdZHNR4eDobiRtjdDCyCW+cqm/X
   ctuRLmno8qYDblxGE5iPlM1Kc1+KK544Hx2fLlpQw6/66+MwPWlElN93X
   XF2abxTcre8tg3USR2wHs56QBbSbTBUnvQ7v+02RwrO1XEhLw8VDnOzPg
   TxEezu/C4ITkMQ0EnBdz2l4PHy8T2ROKLNfRNenCRwLd1pFWg03m/vFWY
   qg2uru0QylQEqrRtx/5pJ5nyQ4ymlnUiRFNDtK/FwOUh4LPEAqQx58Cx5
   OgYLwz9BughrWlaANkeTmE4hEi7dL1a6sX0rv6Q1S+PwTJzda5UAiWNtJ
   g==;
X-CSE-ConnectionGUID: 7NQO7kIpSweNw0+Sqmw40Q==
X-CSE-MsgGUID: 90VYUoUwTmay0cubprRWtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38210280"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="38210280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 05:40:15 -0800
X-CSE-ConnectionGUID: 98tihH3rTDaXy5bwn6dvwQ==
X-CSE-MsgGUID: AKwnGOfmStKBFjiMMnEzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="101250105"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.124])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 05:40:13 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v2 1/2] media: ccs: Print a warning on CCS static data parser failure
Date: Thu, 12 Dec 2024 14:40:03 +0100
Message-ID: <dbbf14a0003016c7fd4529918d0e9e8f0c828a7e.1734010609.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Besides returning an error, also print a warning when
ccs_data_parse() fails.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---

v1 -> v2:
- changed commit msg
- removed "file" from the warning

 drivers/media/i2c/ccs/ccs-data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index c40d859166dd..0c1ac406aa17 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -976,6 +976,7 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
 out_cleanup:
 	kvfree(bin.base);
 	memset(ccsdata, 0, sizeof(*ccsdata));
+	dev_warn(dev, "failed to parse CCS static data: %d\n", rval);
 
 	return rval;
 }
-- 
2.47.1


