Return-Path: <linux-media+bounces-34388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38934AD2EC6
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C018818937B3
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBD027F170;
	Tue, 10 Jun 2025 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD0/sTRb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3FA2206BB
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540902; cv=none; b=CDooXhjQ8RAZXPsw7MzNtcYc7zEV9+auU3af06g/9K0LxrheEnqVhL6y7r7Yhy3gawVyw7awygDiw/KwvKtdrAZwyIse8e0Ctpbr9Djg/aa25/Hi5GerbGPyE7GWyxmql1WIf71ZWPeRY+sOjV+/nuZVjSwjhbcobnSIMjEAji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540902; c=relaxed/simple;
	bh=13JOyfJ02gXcMqLFeFaMZ9o4rC+JU7y+QoR6IzUTmJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gkt9jXdj/pyEZZDzsplCDpAJ0EsPWN52lOovfSHDqaaOLutHI+gQ1szqMEfJzGLRRmYEJMOiTfqfPkXDQofZBlYwH+1gc/KPCKyzmBJvNr0Zi9XV+o3bXwsBu7ntSQmYHhbOQfpuIbnDWkoV4yBXcwQpKV7UyGuauLzToJL41d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD0/sTRb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749540900; x=1781076900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=13JOyfJ02gXcMqLFeFaMZ9o4rC+JU7y+QoR6IzUTmJ4=;
  b=fD0/sTRbimVHcmjsH0R60+gTMJcVsRV50C9x5VfgiS80KQkUH5A6Q7Zi
   mEyGksDAtZWCmtNvbnKFWeaJzkgqIULNonXzwrvgKptS1rqLQEZIVtdOk
   cuA8MZgZnDmiRncUYB61OOj4ln8ae4CY2ufXrtSUZCspnDuYA3Wj9hBXg
   Wo+xlVTJjPOuiy7i1qZt+s21fumPqxp/mYOGgTOzwKsqvwXPwhPV8c7y9
   p9B97wad7sRXf+U8O30FlabZVUpFRwVzkpqFH16Ewk4DI6CFnfboy6qFO
   KxJj90EE3ToqjIKSi/OlmRYwXpKnh32dafDvEpdv7HIiPevdHEYGbW/JV
   g==;
X-CSE-ConnectionGUID: kWIiSY++S8maYqLoJ0K3uw==
X-CSE-MsgGUID: 9iGPO3DKSU2Ve2rN9qMVcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50746640"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="50746640"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:34:58 -0700
X-CSE-ConnectionGUID: xU7vb2PzSHyLARvFWbEQRQ==
X-CSE-MsgGUID: RjexZZH0QfWQUMlt34BWvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146635366"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2025 00:34:57 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3] media: staging/ipu7: add register definitions cleanup in TODO
Date: Tue, 10 Jun 2025 15:34:56 +0800
Message-Id: <20250610073456.2683730-1-bingbu.cao@intel.com>
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
 drivers/staging/media/ipu7/TODO | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
index 7031d0179c7d..7fbc37059adf 100644
--- a/drivers/staging/media/ipu7/TODO
+++ b/drivers/staging/media/ipu7/TODO
@@ -17,3 +17,12 @@ staging directory.
 - Work with the common IPU module
   Sakari commented much of the driver code is the same than the IPU6 driver.
   IPU7 driver is expected to work with the common IPU module in future.
+
+- Register definition cleanup
+  Cleanup the register definitions - remove some unnecessary definitions
+  remove 'U' suffix for hexadecimal and decimal values and add IPU7 prefix
+  for IPU7 specific registers.
+  Some ISYS IO sub-blocks register definitions are offset values from
+  specific sub-block base, but it is not clear and well suited for driver
+  to use, need to update the register definitions to make it more clear
+  and readable.
-- 
2.34.1


