Return-Path: <linux-media+bounces-31442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688EAA4A5E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 867F44A1BC7
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D752259C9B;
	Wed, 30 Apr 2025 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtLaxUco"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D622580DE
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014049; cv=none; b=rFeImBbt7okvyGInPX8muUIfmIIS6fknjLuvMRRYbj3avF+y6509pCDRzmZvF7A1OkLbxFMckDTmtlLjVb0NNcDfpCzVEloFRhA5UNEEn5WIzkI0i7lLXw3W+kqaR8kZ3KpJZ/lru7l6mfYVPZODO/9J+L44Nodcj905ZGaAmGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014049; c=relaxed/simple;
	bh=Z5Z+LTyMmiuLwlSejLDW1VrzaYk1hYetccEFSnjo6qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e4KTeyrsh3vkCS/6TwuwD/InizkWrfLtCS7ODmYKBN51DkGRJPfjJRWOEbFtwbefnrhsxtuYhJkXBFpKXtc6Bj+TuscqB4n0tFh0nKe3Mzb/6XnXQsxgKm6oqZSB1B3kbRoZVa5tg0T1OFXKt+LxiVhv17Z7h4wsCUZQD8XeOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtLaxUco; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746014048; x=1777550048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z5Z+LTyMmiuLwlSejLDW1VrzaYk1hYetccEFSnjo6qw=;
  b=KtLaxUcoCm4LAzRWfwETCGpAJJb+Kqe8DPHtG2u53ryjftlO4X2nzKx/
   77Oj8iBZ4rpEpxxXu9Wn4k7SY9HUeq27z+i154LtaEOGLtlIa8Q8ol2WI
   BQKX4u+R994OjGMFw+vN4ySLFV/0FQr7MmmVC2FKlV4xIswVT8r8WoRcq
   QIVfnYbccUogEU8NXflW2ude1f2E0LDvgFGuTV8tkv4RFi+OKHOA8DPTT
   36/nwp94yiwnjuBXmH3aUcNh8yP1bCfBhFe1kA+79diJLKr/jXt3LWcUK
   5LWHs786JrP6VU+7HixqvnUCx4cgB+vUAV90lzA7VmJRgJ+boTxHuI4do
   A==;
X-CSE-ConnectionGUID: L4z8vqmzQV2BZd2Id2qcQg==
X-CSE-MsgGUID: EnzsbK4wQ1uPt45bgL9JYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58302632"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58302632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:54:08 -0700
X-CSE-ConnectionGUID: jffCBL6BTN+GKxxQA8fagA==
X-CSE-MsgGUID: QepW90EGQaq0NcqDfO63rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="165193778"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:54:06 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 3/5] media: intel/ipu6: Remove deprecated lock comment
Date: Wed, 30 Apr 2025 13:53:48 +0200
Message-Id: <20250430115350.506460-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
References: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pre_streamon_queued is no longer used, remove comment about it.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index b865428a0fce..6b8dec55f200 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -20,9 +20,6 @@ struct ipu6_isys_stream;
 struct ipu6_isys_queue {
 	struct vb2_queue vbq;
 	struct list_head node;
-	/*
-	 * @lock: serialise access to queued and pre_streamon_queued
-	 */
 	spinlock_t lock;
 	struct list_head active;
 	struct list_head incoming;
-- 
2.34.1


