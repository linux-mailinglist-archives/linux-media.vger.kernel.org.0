Return-Path: <linux-media+bounces-63579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4KNkKs8RIGq3vQAAu9opvQ
	(envelope-from <linux-media+bounces-63579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:36:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B36371E4
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:36:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Ib5En+cC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63579-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63579-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CAC73165232
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 11:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4491E44CF22;
	Wed,  3 Jun 2026 11:17:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3B4379C5E;
	Wed,  3 Jun 2026 11:17:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485449; cv=none; b=HT0sFGH2w4IeO7Et/5ZT7VZNCMgCSHFJ+4DdKuZM/omaub57EebmPa9acuW0dHs4HqlR1cn3yAeHvhFujx607EHRu3GgP3FRqe4NZ7qkBdrJ5BAJDT88F+BvxVwfaFNgln6G8UUMhNxazphlpT2Zf5EReN4qczsadHoXVo/j1CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485449; c=relaxed/simple;
	bh=zBbikzSZIUTBkaivxy482PwxDSAMd8xKxabQ4txfnVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQlm2DoP0iAnujvhhHoOEnhfyuQ5pYOCYK2LQM2d6322zZYIa8qAFNYZmGOfZNMt4MGvnh5FJqRK2YWVprnexcMXsE4DJfmeTdqZKUZzAHlkEADaR9jsNWsWZcMLO6ZjotQ2pEgrqhWtcFwfpJ+8huA/Oc1OrpjyJS8uQJkRBK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib5En+cC; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780485448; x=1812021448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zBbikzSZIUTBkaivxy482PwxDSAMd8xKxabQ4txfnVg=;
  b=Ib5En+cCUqS5GWtg9bcq8VR4GQKyZbaZOTMkm+8Vnb32rq11AFV8JRY0
   6sDu2HkC/kUzqX7YIpCwjKkVKt6A3JwVe6C4rs6AOdEhnkFg2veOQbgsT
   hxOKtk63sB/lIdD0QuZ+eI0xWOXCoynYIFRfAbfaX5v/OsgMCLJEd8UjZ
   BXbGHmqEjWpiyulx+2ITEoCEhCR3v4RYtSVrF9fouPU1XxG1UpGkHJO8i
   eCwlPeMJVhQ0l1ljl2EcSNS9xeguF/Gq6dB7P5RYMqgzosvw/lsxpa/4D
   NFy65SOqO4or3fHfmj9B3zmkAGVnrZvSdOxR7mBt9Rxxymol6q/A5bPaw
   g==;
X-CSE-ConnectionGUID: Qis7DKULSrmN0xxbqa0N+g==
X-CSE-MsgGUID: z6KnC4BPR/6UvQ1a+G9hKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92772206"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92772206"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 04:17:27 -0700
X-CSE-ConnectionGUID: fhD7pkCcQ0OpS2+CvxoiGw==
X-CSE-MsgGUID: 8G5N5x7pREaQMvO5VPdVhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="243142672"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 03 Jun 2026 04:17:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5447695; Wed, 03 Jun 2026 13:17:25 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Olli Salonen <olli.salonen@iki.fi>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: tda18250: Use %*ph to print small buffer
Date: Wed,  3 Jun 2026 13:17:24 +0200
Message-ID: <20260603111724.230522-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63579-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:olli.salonen@iki.fi,m:mchehab@kernel.org,m:andriy.shevchenko@linux.intel.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim,linux.intel.com:from_mime,linux.intel.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F27B36371E4

Use %*ph format to print small buffer as hex string.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/tuners/tda18250.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18250.c
index 7bb945ba0989..9dbb5ea3b487 100644
--- a/drivers/media/tuners/tda18250.c
+++ b/drivers/media/tuners/tda18250.c
@@ -804,8 +804,7 @@ static int tda18250_probe(struct i2c_client *client)
 
 	/* read the three chip ID registers */
 	regmap_bulk_read(dev->regmap, R00_ID1, &chip_id, 3);
-	dev_dbg(&client->dev, "chip_id=%02x:%02x:%02x",
-			chip_id[0], chip_id[1], chip_id[2]);
+	dev_dbg(&client->dev, "chip_id=%3phC", chip_id);
 
 	switch (chip_id[0]) {
 	case 0xc7:
-- 
2.50.1


