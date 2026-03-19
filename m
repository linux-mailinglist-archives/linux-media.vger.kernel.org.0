Return-Path: <linux-media+bounces-56349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKCMDVsbvGlEsQIAu9opvQ
	(envelope-from <linux-media+bounces-56349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:50:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CACBD2CE033
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24CB330977E9
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FD43E8C45;
	Thu, 19 Mar 2026 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hD1Dvp4F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343221ABC9;
	Thu, 19 Mar 2026 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935443; cv=none; b=jT72d6lfbEPYYOP6/t9/RfcYngOSwspH2Km3DvYu4p7XEDX2TxygVBtYV/d234LFpIcjDoU2gfjbmeAb3WWr9tnxTKoyEvJyvOgqUU0YzUicVUEl+oHL4J+CRb3YbVLeDwE0RJ8TSzWZovWfkhO2s/6tO4/c2aH3G7oD9NQLhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935443; c=relaxed/simple;
	bh=I1SRIboeJgKb2mocsfN/M6Novf8Ur8EmTVQoD7QcYA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv+HzGLV2XpLWNellwHlf7fDIe518+kwoagOULXB3JRtyErpjxTCoMM+3vRxB1qfLHUyAn//AeMOpJlnbrEDs5Tj9Z2H9TgsQyadF4ELk5RuCbTjds6nl4KTvV87iJ+5gbeD1A2oNrWd2PYPI6WFNmwFPlFgt34CUsdZzUV1A2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hD1Dvp4F; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773935442; x=1805471442;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I1SRIboeJgKb2mocsfN/M6Novf8Ur8EmTVQoD7QcYA4=;
  b=hD1Dvp4FP9OhC+ozn539ee7m3pcxiNzeEyD6qRB9vRxE4aJ6yt6qGlN6
   6OxHxCUAGUAIU7zllOThaMTg7/5LpXfNau3wO5w16nmoK+ZXGAUTEPV3G
   EJ8gYkiE8r9AAlb/dS40t6Psb1fNzjvm8Q8lxbyPcjim2unea5qhg+cc/
   GmOWPtYRMIrTf3ktRIo13gWi7Qw1u1wSb2y8CyjzU52hC1/cHKu/LUpN4
   AeLl7jEHBuZZgsx7rkSGB5/n8vRggVaTMu0uqNhwBTFpR1C3EyvWV/ELB
   BhzV5UMg1psRR9B4MZqv62T9nWo4+f3+5MTaAMaj15yOXgklLZubyZVbR
   w==;
X-CSE-ConnectionGUID: WdcbdbNuSQWoY9OPfNcuCg==
X-CSE-MsgGUID: TolEcpUrSQuFXMjs3DpFGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86374047"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86374047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:50:41 -0700
X-CSE-ConnectionGUID: LU7MQh7OTfK6r7+BbW2iQQ==
X-CSE-MsgGUID: q3QLrI1STQuskGrq8zvImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="218444614"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO alaakso-DESK.kioski) ([10.245.246.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:50:39 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH 1/2] platform/x86: int3472: Match MSI laptop board name
Date: Thu, 19 Mar 2026 17:50:30 +0200
Message-ID: <20260319155031.1989179-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56349-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.989];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: CACBD2CE033
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure MSI system is correct by checking board name too.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c1ddbf9a82c0..e65067358301 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -404,6 +404,7 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 14 AI+ Evo C2VMG"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-14N3"),
 		},
 		.driver_data = (void *)&msi_p14_ai_evo_tps68470_board_data,
 	},

base-commit: d29c44f16beb1219825461efab46026deb1d4af5
-- 
2.53.0


