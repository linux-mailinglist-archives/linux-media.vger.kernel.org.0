Return-Path: <linux-media+bounces-64568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FVNsEtaDKmoxrgMAu9opvQ
	(envelope-from <linux-media+bounces-64568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:45:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C026708B2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MOLvOK2c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64568-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64568-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC73E30598D0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E2C231A23;
	Thu, 11 Jun 2026 09:45:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB640D591
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 09:45:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171104; cv=none; b=hZ/hHq1flRvFE57Qchqv+ReCVFcl7zJJB2wpwbTS1TlkdZZtl/AMLMD7gojZ9UahMQ7JgPowX1ToDgPnjNf4tn1mcXpuNeLmHBAxlJO0NU1NP2LDPIIrq0fvgetNkHU3m6jGipSiisWp/KUlaeQPpmR9Ho+0+W8/fSAUyhwxCWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171104; c=relaxed/simple;
	bh=IKWNsBM0ZFMTSL/bm+FTabC2lBUeBAgGHcQGv9SdaeE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocyTdInZ9sT5mvqV9QLxlEXe8+q1HEAmdlsa8erBMJwSvcs1MMLm3Vw4Gkosi4MRDbNR6Y0AQGKHJt7baZh0T5+TzHgsPQl2JR3Eohh7hmoh6R7VMc3/nrQHWITcKnyMwm0RJK8l4Q/70zbzKt2lE6R8UEZvi6/jeElYEYViHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOLvOK2c; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781171102; x=1812707102;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IKWNsBM0ZFMTSL/bm+FTabC2lBUeBAgGHcQGv9SdaeE=;
  b=MOLvOK2cDMcxXyIuB1XsZCci/eTKTEiq6eR41U5Lh01cdJpPds3TG25B
   sJxvBJyQR3Y5TOrgihV3AjxouLJBC2zBNe+N6jx/1/6YHx0Mukd1eNOpH
   cGLHpaQ7C9dozhNRzsvsP9dZeoRSjW5se4VSTqDCiUsNGHxad0oZV/+9m
   +WTRsLvk9f5ddd0ajv6LyPMSQxbXOwpKvyufNfKi4CiiId2spn3Yo35Bc
   2q2KCoxSMparfRt2X5/cr5Ut8QeWlEpKhXbTGNxQdU56253ktGPNclCYI
   IMFhUPUAtHQs6f0YAhyD7hyaZFOK1W71NAwh4edVjpqB++2UodGZ7+xer
   w==;
X-CSE-ConnectionGUID: L7aZlp/8QC6lmF4kJKs/2A==
X-CSE-MsgGUID: +nctU67vSiC3vOeJeszfXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81984627"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81984627"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:45:02 -0700
X-CSE-ConnectionGUID: SRsK7a4LQW2zb6FKl2YjaA==
X-CSE-MsgGUID: gIx+AV0WS4y7NxKdGTDVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242292055"
Received: from serinyeh-ms-7d25.itwn.intel.com ([10.225.65.16])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2026 02:45:00 -0700
From: Serin Yeh <serin.yeh@intel.com>
To: linux-media@vger.kernel.org
Cc: serin.yeh@intel.com,
	sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane count
Date: Thu, 11 Jun 2026 17:50:46 +0800
Message-Id: <20260611095046.2665272-1-serin.yeh@intel.com>
X-Mailer: git-send-email 2.25.1
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:serin.yeh@intel.com,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:sarang.sapre@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64568-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3C026708B2

The driver currently prints the number of data lanes using
ov8856->cur_mode->data_lanes in ov8856_get_hwcfg(). However,
the ov8856->cur_mode structure is not assigned to a clearly
supported mode at that point. Due to the missing pointer,
enabling dynamic debug may lead to a kernel panic.

Instead, the correct number of CSI-2 data lanes should be taken
from bus_cfg.bus.mipi_csi2.num_data_lanes, which represents the
real hardware configuration determined at runtime.

Signed-off-by: Serin Yeh <serin.yeh@intel.com>
---
 drivers/media/i2c/ov8856.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 9d2b0469a576..6011233a218d 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2318,7 +2318,8 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856)
 		goto check_hwcfg_error;
 	}
 
-	dev_dbg(dev, "Using %u data lanes\n", ov8856->cur_mode->data_lanes);
+	dev_dbg(dev, "Using %u data lanes\n",
+		bus_cfg.bus.mipi_csi2.num_data_lanes);
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes == 2)
 		ov8856->priv_lane = &lane_cfg_2;
-- 
2.25.1


