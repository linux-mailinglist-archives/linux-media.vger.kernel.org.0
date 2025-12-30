Return-Path: <linux-media+bounces-49700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C6CE9788
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F40BF302819F
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EE32C3256;
	Tue, 30 Dec 2025 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfbWic1h"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D872D47E9
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091941; cv=none; b=kbq6U1zU/bJuGuFHNlHnjxy+XtnXTKCSQYm/o2SgxtEjVCEUdWjey+QwG91CTd6ckW77eNUHubLMsq8yRViGyZPBdDFR6yqq+aF/nS/pb9qg9XAnT7Lyfcpa86xJqMQ5WfEIBoAuum6hcBQ6vw5a7vA6VP9X2mB0cvZfCqCoReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091941; c=relaxed/simple;
	bh=fgAL4Jcx4y1mfyKTr643543oQvoQKJFZZ14TKaLXFtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPme2Wyos6VxfNH5H/P8kJlQRdH1NxN5Gae8i9EgxwhBhshjS6rJ2o9eTjhatm0pRThcD919JyGILoMZJwOIb8WrbM1Ns4Sk1hE+jgG9EHmFpe/HQ+pmLWKZZ7u3nGORknOwOhtNP03IR73GvSt0V96n+iTra/HQia0k2R5fqJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfbWic1h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091940; x=1798627940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fgAL4Jcx4y1mfyKTr643543oQvoQKJFZZ14TKaLXFtc=;
  b=DfbWic1hwHp1Xu0Cw9QkFXEV2wTxR+MaQ9d6T+WS1aVPNV+2dHIQT6K8
   g+oso/xOV5R3/+9gUBFe6KT4vdgWMP/NnT7du6ZWrFMIs9FqsEs2Vy3ky
   2PHxgoBFKSu8lR2ooQTXtp9pSR4l5qNjNr1hk97g3tBU6whRW5JgPA2XK
   irr3hn74JfCbMzkn+xLqU+LAsyIp5RIdAliWIrwEXV+JObRQeeyoJQcQE
   rBnHF6zVg2OGZlGbdva00KF/iIRZSgA2yelI/867XYsAQO1Kk+OhHeEqh
   Whj6bx9DAWZqTS+AnOT6/6618Hb++qlxUya+jrr53V7LDZ629iR5qyKPx
   g==;
X-CSE-ConnectionGUID: 9Y4Jj+5YSQCs9Rr8ddbMZg==
X-CSE-MsgGUID: Iq1Awws9R1qEqBsMdnkNxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148718"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148718"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:17 -0800
X-CSE-ConnectionGUID: Nx7w6KF6QVSK5DgDxV7YKg==
X-CSE-MsgGUID: 8fwAh7RQQfOhEHNwAsM28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186897"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D470121D81;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQY1-0maf;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 02/13] media: ipu6: Drop MMU hardware initialisation in probe()
Date: Tue, 30 Dec 2025 12:52:11 +0200
Message-ID: <20251230105222.3676928-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
References: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MMU hardware is initialised in the runtime PM resume callback. Do not
do it in probe().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index fc0ec0a4b8f5..eb45544a9f05 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1070,10 +1070,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	if (!isys->csi2)
 		return -ENOMEM;
 
-	ret = ipu6_mmu_hw_init(adev->mmu);
-	if (ret)
-		return ret;
-
 	/* initial sensor type */
 	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
 
-- 
2.47.3


