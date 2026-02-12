Return-Path: <linux-media+bounces-52655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI/HA+nKjWmC6wAAu9opvQ
	(envelope-from <linux-media+bounces-52655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:43:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1EF12D807
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EB27303102C
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC33C35970E;
	Thu, 12 Feb 2026 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLViOETv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BCC3570C9
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900195; cv=none; b=cIchK9d+NTxPr5rLm5d2BoSQ+DGcx+zLCjpu3VzXVdJpQTpImbzgvvuogOuIarimMgEGd50rH4xg00zI6Rx7YWCfVzzYmCK8nuhKbM8yQL/AWSsf9NIoNPfodAzHSLRGQ35JtqF6tye9wzwjXadNhckgiiR72uthaqoo+ggTdj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900195; c=relaxed/simple;
	bh=cLp0kGEjci/rJV1EDlL3aXn9Gg7SSkc7MIShnQPMbnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBRi24vTiJQclA8itRNM/zohF6BmsEzzivmzwvwaYcHwzsmjnvUfqLQqiGiqqz0cD93RQamYay7u5UIK0PoHzR3ZduaMKOX9PgGW7R4pSPLTkilPXq39Uwjd814i9hDX7qKoDPbT2BkcT3ZFpansJRMxou8gEeOEiUAvOZh3LCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLViOETv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770900190; x=1802436190;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cLp0kGEjci/rJV1EDlL3aXn9Gg7SSkc7MIShnQPMbnk=;
  b=nLViOETvocCWG3DoMng+SmyYedzSuRkRu4K6Zpzyf18S97eUQ8XWmNEe
   dvrqrEJc4K3Gxfktg2dvLzk/etVGhCpBUFw4EVWjYOEqQZZIiRk4dprky
   vDGul1+V4cX4mbRDc/OdVVfluKkpmxJAJcNcW0gHRcoyOFrOK+CYjWdm5
   sQYGN2qrhfUvSowMpOsBJttnUZbtviBcP1w9HNaNtJWIz9Nt8Fj7o+Sll
   9uyl7EfeKecHeULqmfXcTYZ24RipNVba27Bh0l4gM6Dm2WBUQ/H3QzUrm
   F4vqYKwy/EqqPDChXoah9Xxx3gthIPDsnjUt/ikvCQ21XKyFBa8MyNNIu
   w==;
X-CSE-ConnectionGUID: JHGOiJAXTkathcPfFawm2Q==
X-CSE-MsgGUID: AY+dzDmyRBesL8if2bFBbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72115687"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="72115687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 04:43:09 -0800
X-CSE-ConnectionGUID: 9pr3+gZ/TjuDFduvX68kGg==
X-CSE-MsgGUID: JVxNAYR7RiuTfhcZL1SKeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="217551494"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 04:43:08 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F0F86121D35;
	Thu, 12 Feb 2026 14:43:24 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vqW2W-00000007sNJ-3IKG;
	Thu, 12 Feb 2026 14:43:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [yavta PATCH 1/1] Print integer menu items also in hexadecimal form
Date: Thu, 12 Feb 2026 14:43:24 +0200
Message-ID: <20260212124324.1877305-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-52655-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F1EF12D807
X-Rspamd-Action: no action

Print integer menu items also in hexadecimal form for better readability
on some controls.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 yavta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/yavta.c b/yavta.c
index f2d5ea325072..d4c7216ef3de 100644
--- a/yavta.c
+++ b/yavta.c
@@ -1471,8 +1471,8 @@ static void video_query_menu(struct device *dev,
 			printf("  %u: %.32s%s\n", menu.index, menu.name,
 			       menu.index == value ? " (*)" : "");
 		else
-			printf("  %u: %" PRId64 "%s\n", menu.index,
-			       (int64_t)menu.value,
+			printf("  %u: %" PRId64 " (0x%" PRIx64 ")%s\n", menu.index,
+			       (int64_t)menu.value, (int64_t)menu.value,
 			       menu.index == value ? " (*)" : "");
 	};
 }
-- 
2.47.3


