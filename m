Return-Path: <linux-media+bounces-65449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8CO1K5BGOmrD5AcAu9opvQ
	(envelope-from <linux-media+bounces-65449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:40:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 089606B553E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:40:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=JFW0W4bs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65449-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65449-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE39D302D099
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 08:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598343CEB9A;
	Tue, 23 Jun 2026 08:40:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30313C76AD
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 08:40:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204038; cv=none; b=MuRE2yLRCMdWma8bpYTRyAX+sD8oj1y5lwL0J2f2IRzerQNt5J+nto4BAIi8p1psiGUSQv8N1ssR6sN1o38cTSshMKUAQvNTG1nGuOT31GetflMFMCpe5JbHIB08nWFrSZzYujCWGE5Uj9I+8I86ewAJ+ZXsp5pwrSmhx11Nn8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204038; c=relaxed/simple;
	bh=74r2sYNEk3jLTAOu/1guK4WwFj5ExNvCuBsg7pFDPrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BqmXKB1GSvMOShcVNU2qheWBAGM7fIFNbzpP0AeCPL0g9a9K0Q6mFRXqf9cSRfHNILhHHWfQQaGNVe6HK/FjdSm96Iqs5MFK4I9C8Jep4vUBkxdH+dqrDyxl+onhmq/WIB6mjce0Mb4Dl/8KuU5JcyjZNisOvnshR3iZr4FgqJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFW0W4bs; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782204038; x=1813740038;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=74r2sYNEk3jLTAOu/1guK4WwFj5ExNvCuBsg7pFDPrk=;
  b=JFW0W4bsGyFE6rxJv0DcE2ubFFzz9HriFcjFcdnBoUR6AyCyfYtj5AiP
   CQAj2PL/z2gvV//JOg8jDtJaDrpUQr25Vt+VCSkfjWVMU5ZRvr1iEgqfw
   t+4RyoJWqG9HGMKUZZQd1LHp8TFTNKLzmrQ4KH8QppsyvYmxifiEM0FdP
   A6nafMEseAcuEBIq1m8UxkgkwdDjSbAALS74wqzqe+jttTMIfTqBZHxFy
   gg582CymfoGkD3d6pG2zItobnsWQ7xbKYMGXbQ6PgQJwV4dI2qIzUuiS0
   Nx3hY/dsTPMTMHq3fowFA2Q7BKaLEOuM32QTeV99oK1HQvI5K51MadZw2
   Q==;
X-CSE-ConnectionGUID: zkXMIltqQFym8ZaU5GdlMQ==
X-CSE-MsgGUID: P8FhJWvRRHOnQHQ6Qp/AzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83055780"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="83055780"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:40:37 -0700
X-CSE-ConnectionGUID: LHeb1ihUQ66FZJx7AWyo5A==
X-CSE-MsgGUID: M2x6XsgQSZOoALRSDwDzDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="243103240"
Received: from serinyeh-ms-7d25.itwn.intel.com ([10.225.65.16])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2026 01:40:35 -0700
From: Serin Yeh <serin.yeh@intel.com>
To: linux-media@vger.kernel.org
Cc: serin.yeh@intel.com,
	sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	sarang.sapre@intel.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 2/2] media: i2c: ov8856: fix debug message to report actual CSI-2 lane count
Date: Tue, 23 Jun 2026 16:46:01 +0800
Message-Id: <20260623084601.3401401-1-serin.yeh@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65449-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:serin.yeh@intel.com,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:sarang.sapre@intel.com,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 089606B553E

The driver currently prints the number of data lanes using
ov8856->cur_mode->data_lanes in ov8856_get_hwcfg(). However,
the ov8856->cur_mode structure is not assigned to a clearly
supported mode at that point. Due to the missing pointer,
enabling dynamic debug may lead to a kernel panic.

Instead, the correct number of CSI-2 data lanes should be taken
from bus_cfg.bus.mipi_csi2.num_data_lanes, which represents the
real hardware configuration determined at runtime.

Fixes: c492ec9ae9ed ("media: ov8856: Add support for 2 data lanes")
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
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


