Return-Path: <linux-media+bounces-30426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49667A914A8
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39DCD176706
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4852185BE;
	Thu, 17 Apr 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+cv0PQj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5028218EBF
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873314; cv=none; b=VCaIXFabtd6y1z8/1j2c1WA10HNNIXCppjHuJVwtdNcK1CD3Emv4qgYU4so5c2UbAzB7XFZnWzOqmi4USPcatGcr057agmcKCNcdWsLFqLzenxdaQ1BFWFeICPcSy1D52wQmhSlRv5OJVaOBdMozuibZJoSxLER7pmUrM3rLdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873314; c=relaxed/simple;
	bh=/CwgvFAPc3Fp/Ke7HXxooCRhHk8Opl9HiU7HfATjmu4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SS5qVu8iBcBk4Y1B7q80p+N/lNSHc0Zd7Y8hBbqZXbCEdfL3z60SyCD7n51Z7Sg7cvs019vmjmG1AQoVBPaLTNQNblo8dJyWb5R4LaMeueZd0oILuB9owQTMtP0LYTTzG1wWqDVmXF11t77iHCsH61x7K2S26FEAd5Gf9JOEpzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+cv0PQj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744873313; x=1776409313;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/CwgvFAPc3Fp/Ke7HXxooCRhHk8Opl9HiU7HfATjmu4=;
  b=Q+cv0PQjtIOm0iva50HXoWzF1GcAdY07dNNsmMYq/VkqSm52UQQpKo7J
   hkiBnEfkBTTfooAgs/OnqKYvx4XeKhGhDoeDV9iOEaD5llyqQzGZ3W9tL
   0WUvcZtAmz6dzyxBmHHOCi5ArQJHyfulIJADeb3djfZLX4h4JdQc4Io1w
   mRLLZxR52a3KCGusR4Tbnjyg6aJhr70pGXQZw9UufSQ9Vbt+Pafr6NqSZ
   TsOFM8sPzbOJsPgHm+Twd6Bjlb2/8AXmoJzMo5AJj2UBpoehok6I2IQGp
   9Y9JWoUFcrB9TjYtFxBaWjsGv3z79CgXVQvqkF+OHa+P3DQNmHXJvB51w
   Q==;
X-CSE-ConnectionGUID: llWqysI1TfKL2WHWMu4XNQ==
X-CSE-MsgGUID: POtJ8qLKQJ+07j1ySdjQxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45580987"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45580987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:52 -0700
X-CSE-ConnectionGUID: TM1jjJ33SjmXM1nNUeyTrg==
X-CSE-MsgGUID: P2zNPkd6QoGgvH1U6BaDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135883753"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:51 -0700
Received: from svinhufvud.lan (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 52C791205A3
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 10:01:48 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 5/5] media: ccs: Don't complain about lack of quirks
Date: Thu, 17 Apr 2025 10:01:44 +0300
Message-Id: <20250417070144.130199-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417070144.130199-1-sakari.ailus@linux.intel.com>
References: <20250417070144.130199-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generally any deviance from the standard is handled via CCS static data
nowadays and so not having quirks is expected. Don't warn about it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d5c369bbb1b6..89416afea26e 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2853,10 +2853,6 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 		break;
 	}
 
-	if (i >= ARRAY_SIZE(ccs_module_idents))
-		dev_warn(&client->dev,
-			 "no quirks for this module; let's hope it's fully compliant\n");
-
 	dev_dbg(&client->dev, "the sensor is called %s\n", minfo->name);
 
 	return 0;
-- 
2.39.5


