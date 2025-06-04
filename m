Return-Path: <linux-media+bounces-34033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F5ACD656
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 05:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C127188A8AA
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 03:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EAE221DBD;
	Wed,  4 Jun 2025 03:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFfoSdyJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01384BA42
	for <linux-media@vger.kernel.org>; Wed,  4 Jun 2025 03:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749006759; cv=none; b=P/79+IR/yHQAAtqjtHc8YviBVb6XOK3z/2P9X2mFSjpPaT/UmoG0HlanFaEo9zTz22zZYR4Wz9MfRm5jp8CWkicZSVmsXU/lKUHQd8G8J8Xd6e5udpr7FWmb1uB+ZmPw2e1aNYaVNtg6cfHvpBTU0iItHCGyVsO63p6TYqZmFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749006759; c=relaxed/simple;
	bh=uAeh2tMsrGw2mpMV4gYETX0lRmK53w71gdTJXqa/vEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IZkak0ttOtIPlKmdRUBZikTRH/Zp9I+BudXCCn1zCKBwskPWl+e12pNx9GGu+rpiAaUqFnOh6/dU5bivM5qe0cSJrKgbTkJCxnmdjDVOd1RLs5Z2liHjd/A09FdV52IZI7bJMoD2/QpMpjDMeb8Y1lr6od6Y08DMTI+kTGOgD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFfoSdyJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749006758; x=1780542758;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uAeh2tMsrGw2mpMV4gYETX0lRmK53w71gdTJXqa/vEM=;
  b=JFfoSdyJoLUhCOWexIZvPvAlP+AcDKlP4iS/BliDiRbMZAidvE92iRFr
   dAcRj4ncAeHXbrnow+Uye5LCidsB5FEUsNheTAJC1Hc6uQHan4HSct1+4
   ru4GE+/Ly8uF90B6zkQ9Ivd6ai70Q037spOnvUOaRmKq9gLYUaR1I8sm7
   oemCCx50pqxaxNPcq9JNnc31RfdIkMCnSSyXVKSjI9vdYjHWSMURAtUaW
   F4zrcev70Zm87oJ/b48WzS/KRdsqpgt5MHBWNqG/xDzUzHuhtOPJb6oDn
   br4bWTEtBDXjC786i25ktAcUjW41VDdd3ATQoUFSTfeCoI12PGQT+q6jK
   Q==;
X-CSE-ConnectionGUID: sRfvlp7PR362lkJy36C5fQ==
X-CSE-MsgGUID: DTq+zi94TQWcoBmFiGodbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="38701129"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="38701129"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 20:12:37 -0700
X-CSE-ConnectionGUID: NE9flz0CRwSTbJih8uh4yA==
X-CSE-MsgGUID: T8Y4glvJQiuzlbsBGNOuRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="145068103"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2025 20:12:35 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: staging/ipu7: add register definitions cleanup in TODO
Date: Wed,  4 Jun 2025 11:12:34 +0800
Message-Id: <20250604031234.426278-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Some register definitions need a cleanup, so add a new item
in TODO.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/TODO | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
index 7031d0179c7d..be4caf5cbe25 100644
--- a/drivers/staging/media/ipu7/TODO
+++ b/drivers/staging/media/ipu7/TODO
@@ -17,3 +17,8 @@ staging directory.
 - Work with the common IPU module
   Sakari commented much of the driver code is the same than the IPU6 driver.
   IPU7 driver is expected to work with the common IPU module in future.
+
+- Register definition cleanup
+  Cleanup the register definitions - remove some unnecessary definitions
+  remove 'U' suffix for hexadecimal and decimal values and add IPU7 prefix
+  for IPU7 specific registers.
-- 
2.34.1


