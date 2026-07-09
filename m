Return-Path: <linux-media+bounces-67117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4NivK9RbT2qJfAIAu9opvQ
	(envelope-from <linux-media+bounces-67117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:29:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A472E474
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:29:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MrBvcG8N;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67117-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67117-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D33E304C609
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BD03F0AB2;
	Thu,  9 Jul 2026 08:23:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4399A3EB816;
	Thu,  9 Jul 2026 08:23:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585402; cv=none; b=OMj13j2Z8bs9vtQ4B3zsoYgxsSCj3OJo86c8Q/uRNlbglT1hZ/PKr7/ssEPY/UxJiRLeKrwcph9QOvKbm6TN0ORcDxhOFjPzbaCnLlPTdgA2/y+9otPrK/IckcX9acJSowijlJ6DDWCIusIC8CqfE1UdQgr+sXMB7hnBKWru77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585402; c=relaxed/simple;
	bh=YxPzWSjCjtm7LtiKo4SEX0VWh8FxICXLWP74MLWGbpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M16NMq+L6ng/U+SXCsloffgoqSrmLgOk1mSJ7Ds7Vp3XsiOZ8m9UEgXxGbo6GaV5zqLuEV3xy99QTb15L8C/uzgYkDc2vc3ZpQDnHq/cqAUGloktRyWmxl+Gyc2QH2jdewJ6Gjvf8VTbGN1r0IDYuh45cENAVjb9pGhaTqq5aUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrBvcG8N; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585401; x=1815121401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YxPzWSjCjtm7LtiKo4SEX0VWh8FxICXLWP74MLWGbpQ=;
  b=MrBvcG8NvJotL8vt7fRw7fNqKOEQAt4Wo2IKv9ta4W8Sk+Yh0FXv3KIs
   KQgyF1Hw8gY8bO+Gh+pRCYkCH6fmOY+RWlylkJLgMWrFlSYdMbqW9//Xk
   9CH6gDPE/zQ3Q/6chA+yiv8TNkHYMNyonQytvSRFcghWjABWDK9/zTulY
   AGeQ+X8TLy+qGBhs6Y5lR/9G+LgMhuavMEaHvBhJYhIyzQL+lHhO5Cqcz
   qog6fXqN9cx0i0bhzq2HZc9mp7bb0+E+qHGXBDxoJ0T4zqub+YjBe484F
   xvaCTOIvR/Kn0ICYGTVD+I6JqdUwtCZQvsJ4jyRk1+lcU5oWYm5N/B8yP
   A==;
X-CSE-ConnectionGUID: To2P5b8QTV2ZMlNMqXI/kw==
X-CSE-MsgGUID: zNHfK4zhQ0aNCK3NfuYpRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83372144"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83372144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:18 -0700
X-CSE-ConnectionGUID: XzJn1vYPQZeNfG6GU0eE2Q==
X-CSE-MsgGUID: HeaGzBAGTJisaQIcmorlKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250535867"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 01:23:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7B59099; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 2/8] media: cec: core: add missing mutex_destroy to error path and remove
Date: Thu,  9 Jul 2026 10:20:54 +0200
Message-ID: <20260709082315.72685-3-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67117-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B20A472E474

Add missing mutex_destroy() call to error path and remove to properly
clean up the mutex initialized during adapter allocation. Ensure proper
resource cleanup and follows kernel practices.

Found by code review.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 55011e555d35..0c89fac58349 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -302,6 +302,11 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	return adap;
 
 err_free_adap:
+	mutex_destroy(&adap->devnode.lock);
+	mutex_destroy(&adap->devnode.lock_fhs);
+
+	mutex_destroy(&adap->lock);
+
 	kfree(adap);
 	return ERR_PTR(res);
 }
@@ -388,14 +393,23 @@ void cec_delete_adapter(struct cec_adapter *adap)
 {
 	if (IS_ERR_OR_NULL(adap))
 		return;
+
 	if (adap->kthread_config)
 		kthread_stop(adap->kthread_config);
 	kthread_stop(adap->kthread);
+
 	if (adap->ops->adap_free)
 		adap->ops->adap_free(adap);
+
 #ifdef CONFIG_MEDIA_CEC_RC
 	rc_free_device(adap->rc);
 #endif
+
+	mutex_destroy(&adap->devnode.lock);
+	mutex_destroy(&adap->devnode.lock_fhs);
+
+	mutex_destroy(&adap->lock);
+
 	kfree(adap);
 }
 EXPORT_SYMBOL_GPL(cec_delete_adapter);
-- 
2.50.1


