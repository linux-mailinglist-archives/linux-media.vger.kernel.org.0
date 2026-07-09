Return-Path: <linux-media+bounces-67115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GDItJVFbT2pmfAIAu9opvQ
	(envelope-from <linux-media+bounces-67115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:26:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4672E414
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:26:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=czNHB981;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67115-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67115-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A36D305F3F4
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84A13EEAFE;
	Thu,  9 Jul 2026 08:23:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5D38B7A7;
	Thu,  9 Jul 2026 08:23:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585402; cv=none; b=Z/WT7quECJQBsJl0l4+4yxYWDu6GTocIwFZgaiMLofmn+XFgGVNTnT716q1ZWfKGOqIvq1KaSTwOYWUGNKiibg3F8IDRrC5eqQDmRVQkZJZKlhKIF295zYWeht5PfqQr3vpjolv2aJhL+ZccKqdDPcyz8IqXpzObvi3ZB3eWsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585402; c=relaxed/simple;
	bh=jxyNpd1EN/8mz03lYe9jI7sYUCPetacXKvPQHcQ/S2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtgfBddISl0m5NhWM3yzfevytUB3/+ZvUSqYNjNIGRmBmjlRliPBaYwHTFkYpbQ5beAVZaZxRpsCu7lMW8ur0CBJCOaruwvqp7+wAsn/Kv4yWlDosnPTnMm8g4qeyDF2S8hQXR/d46u1J1qjBm3uz9ftPvKiNfWOSWlWDPN4TZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czNHB981; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585399; x=1815121399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jxyNpd1EN/8mz03lYe9jI7sYUCPetacXKvPQHcQ/S2k=;
  b=czNHB981iADV3766OglPLAj6DISlV8pOA4/0/BwjyR82KkeDeNqwY0gp
   neTqIdYw1zY1xaSNilNyH0kptABBdH3UzUkf+zagiHbsQMUsft5wshFsa
   fdS3zM8MF2iDUzdMg2A/gVaumOYHiEptt3pEWC+xffUhAVwQF/GeH4ZcG
   ykdD+PCJZ9TjvsJXGdA5+D/BNJGpdRi+UGzNt5hc40SPIUbAg6dqVYsPe
   v9Le/WBL2RzJHpCBSfd8guidToa+K/LwjCdjJz5Uv7IMhxoeTjBTCtTq/
   l4oirr2+3Yg368wVsNkcEI2pbGuyenaMF0SrM5sx3QYUZEQdiQ5daqJFG
   Q==;
X-CSE-ConnectionGUID: zt75uJtQTq+Ptpq1ARE5JQ==
X-CSE-MsgGUID: FM7ZvIANR5mkvkeuRyY+Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83372146"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83372146"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:18 -0700
X-CSE-ConnectionGUID: DCdBOp04RLyi9pNNEFGxSw==
X-CSE-MsgGUID: xPTghnOAQnyLu20MECdoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250535868"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 01:23:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 841679D; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 4/8] media: cec: core: Don't use "proxy" headers
Date: Thu,  9 Jul 2026 10:20:56 +0200
Message-ID: <20260709082315.72685-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709082315.72685-1-andriy.shevchenko@linux.intel.com>
References: <20260709082315.72685-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67115-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ek5.chimenti@gmail.com,m:ek5chimenti@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FA4672E414

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 674bcb6450dc..1f12fb0caca7 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -5,16 +5,30 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/bitops.h>
+#include <linux/bug.h>
+#include <linux/cdev.h>
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
-#include <linux/errno.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/fs.h>
 #include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/kmod.h>
-#include <linux/mm.h>
+#include <linux/kobject.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/printk.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/wait.h>
+
+#include <asm/page.h>
 
 #include "cec-priv.h"
 
-- 
2.50.1


