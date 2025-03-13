Return-Path: <linux-media+bounces-28127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7919A5F0D1
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB7103BEDE7
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD1A265CC7;
	Thu, 13 Mar 2025 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPABEYUh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB194263C8A
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861482; cv=none; b=CNeX11ukr6BYR9i/BelEoQbO+uxt/DjnDdRM0SaGQ86VPRuTf92B76KE3u4tk+uGUuCwHNr77I03/B43ijMYS82sRu43XK9kppN2A6nIa15J9MM6jUxb6FhyO8BEWX9Lh9my3h9YjOSGOUwZXsKt1C8AvpNfH9nxhIbqqko4ujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861482; c=relaxed/simple;
	bh=vH5+xbbou20STiGnVyTnCSGVCu5CZJUwwUGfbD4nQ78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d3bnsdibffUuAsoYWAsuA29IUUDOkE6Q7nmrvaNp0V7nL1UMjvsTmeplaRBSe7kCPfPkTdynbt3uSEp6sB8Y1QKHx70WvJhVnY/yjoY6Bj7QJDW2PWvQD26xhn3+ryP/c24UH+atBW0kHmBsqrqSQWt8ABAx1WXtsmUXQ424erU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPABEYUh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861481; x=1773397481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vH5+xbbou20STiGnVyTnCSGVCu5CZJUwwUGfbD4nQ78=;
  b=kPABEYUh+AlgmQE4EBvmBAxXPrUbbzE8/sqwYHFOoMN+Pp9wmEKV+XWw
   v9X9ho+jxTrRKOCVp+40WC0Ion2Bl/H7C36Lyq3tvVZoLX0CB0GrI1x5W
   u5J2mSYqhmuexvNIFiriwUfy48Ns6ZVDXq5wglBhLksoVfJ27Eri9nKlT
   Uppj12xeUfK1M2iyKhP9ZalKzx8rsq5nTdhTVAoxHYHVbcGjq5sNFl0hV
   eUokzdb69gJn/w/s9Y7olEwwpiwStWg74yJSc/twyM+iqd0r1GPMNJmaz
   31yfvR2Pqx2NNLk3ukcmq9Ncsv57TZUsDBIqGyBW7NcsuMNEl996F0U9U
   w==;
X-CSE-ConnectionGUID: 4vVrNd+3QYW867b3TGR/6A==
X-CSE-MsgGUID: waO8MlE6Sqmyw4pr2m2FZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68325129"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="68325129"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:41 -0700
X-CSE-ConnectionGUID: BB+o91l0Tc2M7cfmI3hZrQ==
X-CSE-MsgGUID: jRmkV658R16B26ZWFN7VyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="126099964"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:39 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 1/5] media: intel/ipu6: Add missing new line character in error message
Date: Thu, 13 Mar 2025 11:24:23 +0100
Message-Id: <20250313102427.131832-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
References: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
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


