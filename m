Return-Path: <linux-media+bounces-56075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JkzHTtUuWkNBAIAu9opvQ
	(envelope-from <linux-media+bounces-56075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:16:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039B2AAAE2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5ECC3054B8C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C023CB2CE;
	Tue, 17 Mar 2026 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8YxBC0q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0C3BD222
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753377; cv=none; b=AREzWbLsZ4IT+gDI9Q74WeDCKimbxEHP1dCyf/o2890EqsB7qsVoYHaHeZ4s0mkbn6bKh+c4qrjUhbbQSOkUzyvQ9JpIMQpouUpUJ+mzybsKzwSgDGKPLzEwgiG3Z4R9MJ2r1/26Ffa0hWu8w+I1wVnRdJQ446HF/v2058mYw+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753377; c=relaxed/simple;
	bh=6JDZQroqoIKxkF6X9OThKtPAw4CM2OJEwL1EqnPT2sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FT2ZSTQnc16//JHBaxdXb0TcDkiweYGmWMtvWWUJ30m0tdamNQF0zsvfpuM+uU57ZgMEgkzA1kpiXcOvLUgh5+PQ+XJLRQz9SZetPKh3uRa2uBlOwv/Yl7H/o2nZCloAlvxr8aU9iQers8rZ79/EMKOHnQMOxhgSDDDf60ytCqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8YxBC0q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753375; x=1805289375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6JDZQroqoIKxkF6X9OThKtPAw4CM2OJEwL1EqnPT2sw=;
  b=V8YxBC0qth8P8tbfn8KBv4ZJ9sh7XXHpzV+BdfYYZxGYImAKwXA2+zQd
   PX9XdhdGoprb2mIxS5B6Nk6nNzcc+XQpib1gXkJZ5q2iv7W5k/7k4CnRE
   G8QV2zw43euvTbFgReqkZn2KLgvtPfvzjDdnlxHTftTkcHgu+vAN7j/qx
   iaTXD6SR00Jx7iuQUVRtxKwOYKHZJtzppopS+F9eWDsgb079vv6mxYMHA
   xOJ5lvINVzopqBVfLccUAiN9ZCkimQCc/IUoYYarWgonsUlvH8fUX1BIw
   MSk+0IVFt5/MSpblnO4CwLM8s/ohd/ip8dR6QXlVFFvvjMo1Jv35ifHdc
   Q==;
X-CSE-ConnectionGUID: sxmDaHQ6SNaCLIJsq/o/Rw==
X-CSE-MsgGUID: c5b57zLHT6+0ShZX+IiKrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411094"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:15 -0700
X-CSE-ConnectionGUID: zxRBUWmLSIK6/4Zz83DE4Q==
X-CSE-MsgGUID: v8H3e+6DRw+arq6OXO66NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226733220"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E7511121D5B;
	Tue, 17 Mar 2026 15:16:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UJJ-00000000u05-3XtR;
	Tue, 17 Mar 2026 15:18:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 4/6] Constify progname
Date: Tue, 17 Mar 2026 15:18:11 +0200
Message-ID: <20260317131813.215230-5-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56075-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0039B2AAAE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 1f00787e80d7..bdcc8dae1db9 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -45,7 +45,7 @@
 #define MAX(a,b)	((a)>(b)?(a):(b))
 #define MIN(a,b)	((a)<(b)?(a):(b))
 
-char *progname = "raw2rgbpnm";
+const char *progname = "raw2rgbpnm";
 
 static int swaprb = 0;
 static int highbits = 0;			/* Bayer RAW10 formats use high bits for data */
-- 
2.47.3


