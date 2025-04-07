Return-Path: <linux-media+bounces-29516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D191A7DFE2
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D83211889991
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664CD1B4F08;
	Mon,  7 Apr 2025 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nldYzU95"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A817A311
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033267; cv=none; b=peiKn1MVm4ovZk8EG2v/P7jj156ONMN9m+Sbn1aYnF/0KTvBkw/YqCzz4cReYmTGQJH7+ESNEAjVbj6PqpI99oEyyginvJZIaxcYD/8yHYxg+VnHlF+PWRMdiFvo/u/gDBJdpCwRqyFiPXYv1qlzn++h9NWfEXgEcZ7MzvOlWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033267; c=relaxed/simple;
	bh=1aiCIjnnrMymNtFHYlO64gBpU46ETrSTVp8n2bFrom8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9U02+A7GVb86/Sha9SiAN4/X0/ufOiHeUHjuheeH2CGOw28AJRsW0FMtDNDeaC/ZyJonrb1EH3dZUbb2emYcnlrdi36wVIcDcITrbycekuL2Mqpfg5oyqnAVnvbNRnENw7rb0L5NlGfA8OthynP3YDwg3KQJfUItoai6BuqS34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nldYzU95; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033266; x=1775569266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1aiCIjnnrMymNtFHYlO64gBpU46ETrSTVp8n2bFrom8=;
  b=nldYzU951y1b3xjnJyIulMsyZibDe0N/Hl4sBdhL78vziOC7YbGQ4wNh
   1PDDsYqeflKeFqhnYKLv0xyygtlcvNkjbiHD+xcqhs9P4v7u8Q/SDMxVr
   DF8MIlMnzoBOaoWMswpN4kj0FuO0RNwj9A2n+kPwNEcp4lfkZoghEZM6m
   e/GiAFmyhSF0s0Nn2HZSqbPYoRpQEXqXa8rjGjUxUNZLq7zXsrRWS9zTI
   ASheXmCUPREk6Vdy/L1svyUrT69KW6SiZzlficlw8/dPLWoe8Z7lLiqv2
   rnIJrs1djsq//ufp1LFBj2TbV2oxCRF51I+7q8z4RGkSNkm0lre2kaaPY
   w==;
X-CSE-ConnectionGUID: Ezf6by67RaSMQvDHBE9vfg==
X-CSE-MsgGUID: OzWk0EMfTUKRy7pbytaJww==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45322444"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45322444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:06 -0700
X-CSE-ConnectionGUID: UkJBzVkMR8CEYRpB34Uf7A==
X-CSE-MsgGUID: GCAOLWAIRDSY4bQ1Lfcj4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127713272"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:04 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 5/7] media: intel/ipu6: Remove deprecated lock comment
Date: Mon,  7 Apr 2025 15:40:35 +0200
Message-Id: <20250407134037.808367-6-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
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
 drivers/media/pci/intel/ipu6/isys.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/isys.h b/drivers/media/pci/intel/ipu6/isys.h
index d5736ea2b036..ef61dca085a6 100644
--- a/drivers/media/pci/intel/ipu6/isys.h
+++ b/drivers/media/pci/intel/ipu6/isys.h
@@ -27,9 +27,6 @@ struct isys_subdev {
 struct isys_queue {
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


