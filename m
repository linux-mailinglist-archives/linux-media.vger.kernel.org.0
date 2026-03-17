Return-Path: <linux-media+bounces-56076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL4bLWdWuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:25:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B532AAD17
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40D4C3059E31
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A24A3CB2D9;
	Tue, 17 Mar 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XV+mRfl3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93B3C6A34
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753378; cv=none; b=BapTs0fwrynOpsJPXjKUpO26tbehNEAQVPsYFyI2FCO5iKcATz8eNKW5d/EtIX2s8CQml6KkVgQZLDELO5C6DA349PQopUnfZktduSGFIFHjPYWBsTHwDB50CCkkJBoZk/hfO0Q+gqTjjxhu2KBfhsZX8CrChhknVkxVZI50xM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753378; c=relaxed/simple;
	bh=LpP/aGT28GE1jPK6ltcVQZucymiy5tYhotrhd/1KCO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnXLTe4psp68ArAc+WtLQVwS/GiQEfn/vG9e8pdgTAacSpTqNDwNJtJdJBcWNdpbT5qWGDwMdBb1DZGrJGQhq+LtiXipWHorHBAvaAJrGE0erPKfSSyZH4wUwbBdCSzxa5qnoLkor/iucaPbkyZ6f3C/LVGoREgpEWrVeyTodV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XV+mRfl3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753377; x=1805289377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LpP/aGT28GE1jPK6ltcVQZucymiy5tYhotrhd/1KCO8=;
  b=XV+mRfl3PlqhryI/Eqk8xBI4i7W8gAg7q/hMTT70xzKMf38XZOkQBcSK
   yMlyCpSlIA5n9rTqF4VvjjcNrz6PQwY1ZphkpaY2i9PPsn1e01gCfHFuS
   COwdq+fdUCLWoVAue52TQXxyxKV1nXrm59g0FcaMTd2wa+UIKhEp8a32V
   IA89K4Exr75/NKboC2c/3S1M3rFCdoxDRjBMj0kmsVZDSOYEKZomRnIlC
   bZCi+mQ35gvuy+vIT/iPaLiWhLTpwZYoQnOT44ugCUpEGisUobCMI6ltv
   XNjiB/11kFG0sJqGR7V5ldXSZbd4prV9JXWgQK4pWGQot2VBd16Zx4cPB
   Q==;
X-CSE-ConnectionGUID: veZmlNJzTUOy+b4CYNJ66Q==
X-CSE-MsgGUID: FDS3A+DjRairSwq0WET9Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411096"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:15 -0700
X-CSE-ConnectionGUID: UFV8Xv3VTNKk6VhNi1ljtw==
X-CSE-MsgGUID: ozfdYEWHQVm11xXG9w3kvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226733221"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E173011F870;
	Tue, 17 Mar 2026 15:16:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UJJ-00000000tzt-3MAU;
	Tue, 17 Mar 2026 15:18:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/6] Reorder headers alphabetically
Date: Tue, 17 Mar 2026 15:18:08 +0200
Message-ID: <20260317131813.215230-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317131813.215230-1-sakari.ailus@linux.intel.com>
References: <20260317131813.215230-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56076-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4B532AAD17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 24a88feddf00..007ee7a37636 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -26,15 +26,17 @@
 #include <ctype.h>
 #include <getopt.h>
 #include <limits.h>
-#include <stdio.h>
 #include <stdint.h>
+#include <stdio.h>
 #include <stdlib.h>
-#include <unistd.h>
 #include <string.h>
-#include <sys/types.h>
+#include <unistd.h>
+
 #include <linux/videodev2.h>
-#include "utils.h"
+#include <sys/types.h>
+
 #include "raw_to_rgb.h"
+#include "utils.h"
 #include "yuv_to_rgb.h"
 
 #define DEFAULT_BGR 0
-- 
2.47.3


