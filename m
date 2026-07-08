Return-Path: <linux-media+bounces-67066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i7R9L1mgTmoKRAIAu9opvQ
	(envelope-from <linux-media+bounces-67066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 21:09:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 579A5729CC4
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 21:09:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="IiIlus/L";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67066-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67066-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA192307C278
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 19:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC883CF047;
	Wed,  8 Jul 2026 19:08:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60829B764;
	Wed,  8 Jul 2026 19:08:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537706; cv=none; b=ecb92Oz6SgYyXr1Iy5NaJgMJ9Ltjpv1vRhaz+jm7/Ew3Uzce+39uWyN83mfYXb42HhQWNrunsNfTRlkzC4VAxlW0KPqUATLRyf/Lp31Y6hHcLupsQJTF02MPlUI4ReTq5U/KpTNSK2P0MkVB5cfbq5t0cGp+4vsrSHaCbd+oAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537706; c=relaxed/simple;
	bh=pyt7H7xRupVU+mK8VwY1I/Ar3zs3R06s8f3mrxgAI5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXL61Ap8wGVimmDFsdqlQXlJ14z/GZp5IV85nusIfk6yO3lO6BCKnXzgi593iVe0FXvwIRMI/XVZHHPjVcg5odZzGN3ybk8nuv/JisPAmm5CLQdyJjAXy3BhcUNX6nwNPshsixgfTnLFe9c1EPUY3Mhu3UBkJ5CLNLJRqTmVG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiIlus/L; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783537706; x=1815073706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pyt7H7xRupVU+mK8VwY1I/Ar3zs3R06s8f3mrxgAI5E=;
  b=IiIlus/LbM7SUVLGlp+r4yqqqHikTfFLT8xpGsr+/Ao5xSyRC+JRCndW
   nATnivmCtD9Re36Ms3A3wGRM4UsBUxpDwpIqke1IpbPzEQAKpTl1SkHVx
   SCNnUS5Bz16B7AUbJ2IQZs+B0DedZvQ+9jGaIvNSrnP0ctSFEJu+qtnaW
   khEUHX+qQBNN/HN/08kTUc/+4gB1FXLkfe+f1C9q/a6aqlSL8MHWwcJ5m
   McEa+h8G2nQ3SHSS0FAZE3MIEPWj2apmI1Cn+tBzk+uTKNXxyqOk0+fcw
   82Y3COiJBJuw0WfV5tySEi9a53+66qfbiX88bmnH5WqYcQ/JsklmsBS5S
   Q==;
X-CSE-ConnectionGUID: ViifD/4USA6VnmrAuw1nzQ==
X-CSE-MsgGUID: NlJUMwL2R1uclApYLQ9Z6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84329214"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84329214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:08:25 -0700
X-CSE-ConnectionGUID: X2yRQeTRQZChHrBBrRj53A==
X-CSE-MsgGUID: FZQJRIdKS8edGadIj3cb/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="257965921"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.223])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:08:22 -0700
Received: from svinhufvud.intel.com (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 9662D4002A;
	Wed, 08 Jul 2026 14:47:40 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 1/1] MAINTAINERS: Merge int3472 driver patches via the media tree by default
Date: Wed,  8 Jul 2026 14:47:40 +0300
Message-ID: <20260708114740.47134-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67066-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 579A5729CC4

The int3472 driver (under drivers/platform/x86/intel/int3472) implements
an effective kernel API (via instantiating regulators, clocks and GPIOs)
that is primarily used by the drivers under drivers/media. This means that
there are often dependencies between patches to the int3472 driver and the
camera sensor drivers whereas dependencies to other parts of the x86
platform tree are fairly rare.

Assign the int3472 driver tree to the Media tree.

Patches that have dependencies elsewhere than in the Media tree will be
coordinated with the respective maintainers as usual.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2aec6afa8108..d41544a41c07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13379,6 +13379,7 @@ INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
 M:	Daniel Scally <dan.scally@ideasonboard.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
+T:	git git://linuxtv.org/media.git
 F:	drivers/platform/x86/intel/int3472/
 F:	include/linux/platform_data/x86/int3472.h
 
-- 
2.47.3


