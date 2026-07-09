Return-Path: <linux-media+bounces-67121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xWAUFsRbT2qGfAIAu9opvQ
	(envelope-from <linux-media+bounces-67121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:28:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C767872E469
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:28:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=NEhs2CvX;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67121-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67121-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 605A1302E0E9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80CC38B7A7;
	Thu,  9 Jul 2026 08:23:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94CA3EFFC1;
	Thu,  9 Jul 2026 08:23:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585404; cv=none; b=DTsSkuxRkL7Bi5edcnHuaA/TZjVT6KfEuZZjsr8QbqfXm3uqXxB54GrWUmYqx5beWxj9x31P4JLz3BiNFJjmlNoz5+N2lcC+hgC7f3myoX5psHVvroQXnBxjuUyvpUW61EADs7qWKI0g9Ooq4gSngplQMpXxKRG5/65lqTGEGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585404; c=relaxed/simple;
	bh=p4d4r1FROHdxGnbBHlt/OS2eIvT+qyPPMzQzc4AZ3ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbSap0bCARmKChjV9S4NQXzrEXAQ35oW5/EXDDr2AYcdBjeba3GNovbr8XRlLjnMYoqbv6E44+9G8JS6oyTrAMlxt4PJTn6rOvcu45eKC5kcMgIPPmf52f3wwhZKmOhBj/ykNdHr9ooUI9elPa7Wv+pR2WMZouQ4MC5IPAuL1JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEhs2CvX; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585403; x=1815121403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p4d4r1FROHdxGnbBHlt/OS2eIvT+qyPPMzQzc4AZ3ws=;
  b=NEhs2CvXBw5YZ0H6jwqcxSj2Z6G0fRR13P8Kbn3xHxexZ3vHSeKwp0gY
   GS2V8H3Anerx+MNLmM99kx7u4GEHbkynpCXq/f7ukbzzkyivbDyIP2LYA
   tEF7KTHSeXqt3kDoWUBKpPoL/o2ak2vxu/yqTBPXRO0AjMZF+O+UhfaXn
   N2asD9ZVT48nWxdTWBmpKdcFcPol9AtNHeeA06dNciCtbmlW03dExyD9u
   cKIqTGq3XNsCZYTBP00J+ZLO6r6l+E+DKZpl/u2/Cs8P9JR3tzJ5jacbL
   hRQRIDVBvH3DYLqjn40biGNs5T+GVDp70vA+yyPlvPKpxiX3ZmRbG/Xou
   A==;
X-CSE-ConnectionGUID: dShFuBHKTV+efDx/pSJPww==
X-CSE-MsgGUID: TPn76yFMRTiInKXN0uGMpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83372157"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83372157"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:23:20 -0700
X-CSE-ConnectionGUID: Kd+L+8MDR3aDIfle7+h8lg==
X-CSE-MsgGUID: lgHfW3LxS2iUG9I6envoCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250535886"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 01:23:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9401CA4; Thu, 09 Jul 2026 10:23:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH v1 8/8] media: cec: seco: Use predefined time multiplier
Date: Thu,  9 Jul 2026 10:21:00 +0200
Message-ID: <20260709082315.72685-9-andriy.shevchenko@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-67121-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: C767872E469

Instead of relying on custom MS_TO_US() macro, use existing time
multiplier.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/cec/platform/seco/seco-cec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 97ed9654c78a..654c70503dd5 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -7,14 +7,15 @@
  * Copyright (C) 2018, Aidilab Srl.
  */
 
-#include <linux/module.h>
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/time.h>
 
 /* CEC Framework */
 #include <media/cec-notifier.h>
@@ -356,7 +357,7 @@ static int secocec_ir_probe(void *priv)
 	cec->ir->allowed_protocols = RC_PROTO_BIT_RC5;
 	cec->ir->priv = cec;
 	cec->ir->map_name = RC_MAP_HAUPPAUGE;
-	cec->ir->timeout = MS_TO_US(100);
+	cec->ir->timeout = 100 * USEC_PER_MSEC;
 
 	/* Clear the status register */
 	status = smb_rd16(SECOCEC_STATUS_REG_1, &val);
-- 
2.50.1


