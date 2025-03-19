Return-Path: <linux-media+bounces-28480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB881A68C76
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 13:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46CDB19C053E
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECAC255259;
	Wed, 19 Mar 2025 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAhKj0wY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED1D25525E
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386253; cv=none; b=JCv53S0FjE9a4giry5IR9v7/gtMhjxaeScspDbFtIn1VEVFurmtNhVllQbFcy9vJ74vTEdXh0DKMMb9n8HsxmXQimq1LZsuemNTcbUMddwCs9OR7bZlsEMwllvRyGoSl31UdTGwNQjDtkShKdvSaI/j8z6S8GpM0HJfnrWkoKLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386253; c=relaxed/simple;
	bh=vH5+xbbou20STiGnVyTnCSGVCu5CZJUwwUGfbD4nQ78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uXyrtRpxnI5ZzWjKJU/RyKv9aGEOuC+D8ckHPVUNP3T8TgHDAIKKmsUATV0F7nng1O+ZGueNkpxhJggk4yXt6sgTu5/sYPRbrOQRS54gcow1piss3NcEQEFlBHELhH/qi74YLoEZH1HtAaMFieVNyMWwWmhHEqZFi0r/jQI66Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAhKj0wY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742386253; x=1773922253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vH5+xbbou20STiGnVyTnCSGVCu5CZJUwwUGfbD4nQ78=;
  b=bAhKj0wYnIgRmyV2s8a+Gch+eGxbWbVwuxTF2e4wHEqVjTEF1Idn3kxj
   EZKh61jY4G0MJeJEb2FHRTNS5MZnwSmG58czUNuhrGkgl78jIQOUFnEBI
   pKUJ2XjhkmUs+AIoZngdVEGnfZ1/hD+wUY8nYI6SWfWPyOf0NqRygPXxO
   lyMup5HLfzHkcJghH2/ezcFCbhEh056IUIsSPZgetVRI096bAfLSF02a9
   1uwHn6ZiRGIioBffI64ZM4COUpFs5+ZCOFrLTUhxdoMRCHZz+i/m9OFtZ
   GVftSvo207vCfRky9ib3VobK3N0jEXR7DgFOgbcb9E6+8lLXI4OCPOzZd
   g==;
X-CSE-ConnectionGUID: lMgpWDU0RtqqtljUrseJsw==
X-CSE-MsgGUID: Zk2Yoh6/TReL0qlcWVUhxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53785886"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="53785886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:10:52 -0700
X-CSE-ConnectionGUID: v7Kx3IzQQNygzJMRPyLy3A==
X-CSE-MsgGUID: A16WTS+sQHKTPor8qz9q9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123086679"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:10:52 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 1/5] media: intel/ipu6: Add missing new line character in error message
Date: Wed, 19 Mar 2025 13:10:40 +0100
Message-Id: <20250319121044.113705-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
References: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

End error message with new line.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 72f5f987ef48..9a19695abbaf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -797,7 +797,7 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 		return;
 	}
 
-	dev_err(dev, "Failed to find a matching video buffer");
+	dev_err(dev, "Failed to find a matching video buffer\n");
 
 	spin_unlock_irqrestore(&aq->lock, flags);
 }
-- 
2.34.1


