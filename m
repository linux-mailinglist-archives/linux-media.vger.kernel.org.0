Return-Path: <linux-media+bounces-67120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8j4HbZaT2o2fAIAu9opvQ
	(envelope-from <linux-media+bounces-67120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:24:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBF872E3A5
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:24:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=BsPKt3sw;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67120-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67120-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 354EB3048C96
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69823F39FD;
	Thu,  9 Jul 2026 08:23:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391933ED5A4;
	Thu,  9 Jul 2026 08:23:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585404; cv=none; b=jzX++pcx4t4xJUeZKK7nb0a1MOX4SWZS7ynmvUrlmIMJLzBnAaOXcC4OLs7BVN7WuScraix39MdPCvw2oFEIToVh0xkCDlNHWWzp4AdG1cPOAhYOYtNoLBALVHxTbG9DTXtgAPDD8PtfnV3hGoeL1cTvGTyMz3hZeyvjN90VvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585404; c=relaxed/simple;
	bh=93KvbU6yGRUmZpIaEsYV6svbAbF+ZZkUv/ox3DQSciQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfA6J/fcP6pHRZZLY5zI9RMdEaMjcMMbPuLWXKbcJN4GJSw3+eBLO+3cwCUYjOHNBlHGNU0L9iKNaCq2+QtpR280S2dRqWBzCoYHOwvgkZiDy+N6d0IZS1Wd+DL/zOhvwfXq9n/dq679HonHkyzzyaLbQRqqzhH+P2lmNhdt7Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsPKt3sw; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585402; x=1815121402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93KvbU6yGRUmZpIaEsYV6svbAbF+ZZkUv/ox3DQSciQ=;
  b=BsPKt3sw5dVNsoPW3S/5zEW0F1J+99qr6kGkFEVtOwfs7VaOe1GQK23S
   xsyezB6MjVZeIBmB8noZ6p/HIjCCuY41LntXYXIfG/8LKmGevxMLC7Mbb
   0kACT1z5oeYprnU/tYOsc8eNpcpopEXmsyV/BzrnVZlHH0dt+LAGdTKWq
   3aEdG4ocxJRJ8GkH10i6r6gZqCHTJPllBId3XX2RO7Kn9Ucx30qdhBrRe
   fwLU6pFDq413fCYZNfnSIUAEyPyEF++XQprQsiqn1a9j7nAmd3AfTx5Zp
   zxEkRFoLB+/snRqjPEViGfpLNM5yrNW2wO7qEKRKLVlVmUxi00avGIv6/
   w==;
X-CSE-ConnectionGUID: 4554Gs6uQ2+YVHatrD6e1A==
X-CSE-MsgGUID: uDkkSnOlRqKETjiaTlKysA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83372149"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83372149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:18 -0700
X-CSE-ConnectionGUID: VM5amlKtRW21yK/pAYFBlw==
X-CSE-MsgGUID: /AXIiKmoToeUxTcKiY4ECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250535869"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 01:23:17 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7FAF59B; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 3/8] media: cec: core: Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for debugfs
Date: Thu,  9 Jul 2026 10:20:55 +0200
Message-ID: <20260709082315.72685-4-andriy.shevchenko@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67120-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FBF872E3A5

Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for read-write file to reduce some
duplicated code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 0c89fac58349..674bcb6450dc 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -205,19 +205,7 @@ static int cec_error_inj_show(struct seq_file *sf, void *unused)
 
 	return call_op(adap, error_inj_show, sf);
 }
-
-static int cec_error_inj_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, cec_error_inj_show, inode->i_private);
-}
-
-static const struct file_operations cec_error_inj_fops = {
-	.open = cec_error_inj_open,
-	.write = cec_error_inj_write,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_STORE_ATTRIBUTE(cec_error_inj);
 #endif
 
 struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
-- 
2.50.1


