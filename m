Return-Path: <linux-media+bounces-67118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ac9mK5hbT2p8fAIAu9opvQ
	(envelope-from <linux-media+bounces-67118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:28:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655A72E455
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:28:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=XwW46Yvs;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67118-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67118-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4436330C3EF5
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6623F1ADF;
	Thu,  9 Jul 2026 08:23:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8C3EDE6A;
	Thu,  9 Jul 2026 08:23:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585403; cv=none; b=oaxoDpx9ZIvpp+XxY4GOxwAE5RZcqUu7uL+H2D9uZBAO/WfdiV3gvpRoKo00gKWsIYECR8M7logerqX53wDktMVS9f8464OQ/KQm+11ZJRHKqGddkOXa6baFk7Hj3I62PVY3m2vUJEqeoanbmNiUqmZpvof69nBL5x5lNBgoJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585403; c=relaxed/simple;
	bh=kFfgqYhVxIrHQqeazgKoUPH34tA7OI0IdVdMEy9Nur8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEBfJUGMxzSu8GkUUggjRjDw/v0w6J3CMtLPUgR0LiTGT3tSL3CeNxpRZVh+eVZuXzat3dJYVxup9zlFWUdKb0m12wnuwhOmdSm1aKPAxhpo3YOAMsVvyiPCZynBFWzTFKHV4Xasxeqq3DVKDwmGI5PjvbORK05VAtl+rDkniek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwW46Yvs; arc=none smtp.client-ip=198.175.65.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585402; x=1815121402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kFfgqYhVxIrHQqeazgKoUPH34tA7OI0IdVdMEy9Nur8=;
  b=XwW46YvsGP+BETlSsLGf1uidMYiiIyv+FScqJU9CD0vYJl9C6qmnk93B
   fZqBZtmyTJHUj03LBbIiHRVT5lwaM3y3gpfLYufoF5wXavmNvdjfo54h3
   8OKv2ZdHLfx9U6b/3mXeh8qPk6BWAf+JiZNQ2RXnS3gZ+/vQMfx8Fhn8p
   rb5trt9W99Ff7dRF91CoYjhHUS+avql2V8iYuVhSBwIvgPHvfs7LtkuCg
   QTgaBFiGdE0vyLsG95oMHg1sJbRJRDoIJyVeLZ+eUrt+ln8wmBEY77ezC
   orb/a69wEw680qNIaPZnrbplp5rESg4zMFxnuBS46usB3euXPerIC4SQc
   w==;
X-CSE-ConnectionGUID: BfftX/+6RG63m6uM2uIzlg==
X-CSE-MsgGUID: /DpqdEZfRlyaLu27XnvavA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107055814"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107055814"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:21 -0700
X-CSE-ConnectionGUID: WkS64Z1dQg6GnGsMerGzzw==
X-CSE-MsgGUID: NdPK7QaOS7+mjv5wRDz9IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254631032"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2026 01:23:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8F859A2; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 7/8] media: cec: core: Use predefined time multiplier
Date: Thu,  9 Jul 2026 10:20:59 +0200
Message-ID: <20260709082315.72685-8-andriy.shevchenko@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-67118-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0655A72E455

Instead of relying on custom MS_TO_US() macro, use existing time
multiplier.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 1b6f27a552db..a67c4283fbba 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
+#include <linux/time.h>
 #include <linux/types.h>
 #include <linux/wait.h>
 
@@ -300,7 +301,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->rc->allowed_protocols = RC_PROTO_BIT_CEC;
 	adap->rc->priv = adap;
 	adap->rc->map_name = RC_MAP_CEC;
-	adap->rc->timeout = MS_TO_US(550);
+	adap->rc->timeout = 550 * USEC_PER_MSEC;
 #endif
 	return adap;
 
-- 
2.50.1


