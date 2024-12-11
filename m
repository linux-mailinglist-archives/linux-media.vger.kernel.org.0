Return-Path: <linux-media+bounces-23193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9CD9ECD36
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 14:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 660911681F5
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 13:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2FC1A8414;
	Wed, 11 Dec 2024 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbwbOEz9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945F7346F;
	Wed, 11 Dec 2024 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923858; cv=none; b=AgvOB6WRInED1BU527Gglx/htkO+V3tP95JN0U1VhBIU6RBTX6mndFJT61cLZAMDATFqR/6meJVJWntrrIL9zOIHuMyy5wAbXZVTd4ZdomvivMf2WcaODnXMLtwjHNeMjrIgULKXAnCETOoQJGQn5IYsiGFb0OB0isDSN3ptMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923858; c=relaxed/simple;
	bh=4w1AmPdI2C4N5nSYsKCE2vUhvsNyStlJiys+pg7vdAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vu7H2CewTQma0ChxG/yhDHkgJmGhNDEJdFyFGi8pHyQGuSTWCTJi1Lj36lKX63v0u0xaQdc3nUqhvI7sJQ46V5NyE9JlrU7pBBegsQPPzvhWtBL5LI+kBd8dFstskWpKXA3rnopn8WYcBVPjQ7AUy5t/K747y5FC2HIkwSgxMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbwbOEz9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733923856; x=1765459856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4w1AmPdI2C4N5nSYsKCE2vUhvsNyStlJiys+pg7vdAM=;
  b=MbwbOEz9y72ZhisjYvFB9RvmVw316yc7+CGitl2Ov3J88Enc7XhnVXcP
   8GGRMtuW2cOVxll+tPz/CaNvsHpbeINdR+8HmfNutEfF2GjwTYxOleqA+
   MHg+TM3hTnKHJHRTVOgPCZBjy065YXmXgfICEUq3+l1wN3/gWE8jwIaId
   mnoSz8kzF9Ek8RtUJR1Wk8mVqXLMlWMl48Ganbhc8H1Qy5h+eOvfBpzcl
   7J4iXtyqTcRAXErFnuKsITuDlQlpPjFssAkXNz4r0ENtI/l3M5A/V1xO2
   YgfTnQW6XVI8iw8K67+T6gCVCzJEYxaCKNPaLm3Zhtv02Yoc7hXZLskzZ
   w==;
X-CSE-ConnectionGUID: dy7J09UrT0Cy+CR5FCreGA==
X-CSE-MsgGUID: WU5SBXiwSDqCE+xJP1K/SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59693450"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="59693450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 05:30:55 -0800
X-CSE-ConnectionGUID: b5jWgADjS5qLi2GYd7zs2Q==
X-CSE-MsgGUID: x8g8v2cxQ+KKStStW2BdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100344590"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.213])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 05:30:54 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: ccs: Fix cleanup order in ccs_probe()
Date: Wed, 11 Dec 2024 14:30:45 +0100
Message-ID: <20241211133045.85118-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_limits is allocated in ccs_read_all_limits() after the allocation of
mdata.backing. Ensure that resources are freed in the reverse order of
their allocation by moving out_free_ccs_limits up.

Fixes: a11d3d6891f0 ("media: ccs: Read CCS static data from firmware binaries")
Cc: stable@vger.kernel.org
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9dfc31afa200..19049f36e041 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3946,15 +3946,15 @@ static int ccs_probe(struct i2c_client *client)
 out_cleanup:
 	ccs_cleanup(sensor);
 
+out_free_ccs_limits:
+	kfree(sensor->ccs_limits);
+
 out_release_mdata:
 	kvfree(sensor->mdata.backing);
 
 out_release_sdata:
 	kvfree(sensor->sdata.backing);
 
-out_free_ccs_limits:
-	kfree(sensor->ccs_limits);
-
 out_power_off:
 	ccs_power_off(&client->dev);
 	mutex_destroy(&sensor->mutex);
-- 
2.47.1


