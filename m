Return-Path: <linux-media+bounces-53031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ARaLKB3lWmIRwIAu9opvQ
	(envelope-from <linux-media+bounces-53031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:26:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232E154054
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00E70301FD41
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9559F318124;
	Wed, 18 Feb 2026 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaEpczVX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7708318B98
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403156; cv=none; b=GqrlNX7QPodUtjMdrNWE8bIcvjqpt/Au40mKke6J38SWyk/DSSvJDUEmQNPqlq7Lsdq1sZcic7JgAwSYQKT7h3lmS4FgqFYjveuktGa+ph2APde62nh84hkZbcOfXefFKMd1kvg7/yFeAIBm/ltNuEIZ0CkgigRxfWjPjRdJZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403156; c=relaxed/simple;
	bh=MPN0+UpugGONOEVEH27MRgS+PTV7+Op9eJAe+5SaBcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1H7AnL0ixVP3FUY63LASxoGyIgWBqTPlKKR2j7AKYiFwLYi8KVLV/oRPqZwvn0Pzi+NNoVwORN+Ae4PxY+yoRWC3XT5PtUU8ZCI6IKkhmyg1jdfcrdkz3OmMsTHh74YrQzfOcCRnT8ti3viDFoLqqQTe2Fl8Ky5GUc+YLUB1M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaEpczVX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771403155; x=1802939155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MPN0+UpugGONOEVEH27MRgS+PTV7+Op9eJAe+5SaBcY=;
  b=AaEpczVXZXZOo8MKgOCctf+7qrDQXBUkIR8vx1sfsAkAZCbCOkn3TOko
   urZun0nzjDSusarDzVmA36QKjGKgovS1+BTK/NClsbWm7m0w0w6UAjbqu
   PSuTXYicIKt5wSr3QrwXeMupNfVU8D8yqivNkPD9OhFSs8+AmdW2KLWUu
   l8UiFm96v/82IXmIrqqSW6gVArUIZ02MV+tGvPBmili/W3IUJTLu7MXkZ
   zr+NmixlslkoCc3cBtSZr/GC5Tex/Al2U/K1l1Wx3BWngsGkde+1+/iUM
   pz3Y0HNU79R67/su/IK4M11Zx5wbQXGz8hSBH+MYWd1a96gEnALViCkEd
   g==;
X-CSE-ConnectionGUID: LSeHoMXiQk+0AtrWjQvW7A==
X-CSE-MsgGUID: H9hdle3uSI2mNZo5TJh6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95102854"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="95102854"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:53 -0800
X-CSE-ConnectionGUID: sXIgLqM1TESFLcm6m4NQiQ==
X-CSE-MsgGUID: y5TNZU4EQvGZmKPyzIJBtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213375793"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:52 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E6FEA121D38;
	Wed, 18 Feb 2026 10:26:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vscsw-0000000ACnB-3HI9;
	Wed, 18 Feb 2026 10:26:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v2 2/3] Add compiler options to avoid warnings
Date: Wed, 18 Feb 2026 10:26:13 +0200
Message-ID: <20260218082614.2432432-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218082614.2432432-1-sakari.ailus@linux.intel.com>
References: <20260218082614.2432432-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53031-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1232E154054
X-Rspamd-Action: no action

Add -Wno-missing-field-initializers option to avoid warnings on modern
GCC.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ab363501a212..7545682dbcce 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,7 @@
 CROSS_COMPILE ?=
 
 CC	:= $(CROSS_COMPILE)gcc
-CFLAGS	?= -O2 -W -Wall -Iinclude
+CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers
 LDFLAGS	?=
 
 %.o : %.c
-- 
2.47.3


