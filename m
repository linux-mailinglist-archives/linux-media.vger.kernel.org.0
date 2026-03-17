Return-Path: <linux-media+bounces-56026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIUjHDwmuWm1sQEAu9opvQ
	(envelope-from <linux-media+bounces-56026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:00:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF22A7698
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 246863073FA2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA093A4507;
	Tue, 17 Mar 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsCyS44V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AEE3A3833
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741368; cv=none; b=EUtfFM34g+gppv0wDczN64iWy/rGVSsxJ363Wr0+sKPWGwKtil3hg84iV1E8PhHzIJXLFNwsdBz4sQn99ezh+WeTb9jwuwVqduBdzT/EtYL2S+sBsQrjoGegpWV/I7yXUZfnSiNrQM2e3u9XTDW57utM/OR/jqYQczpg3J6veJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741368; c=relaxed/simple;
	bh=9M01TEC0AsjzUom48cj+YReRIcPoswlJzqbhnUopfTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rf1o1H/3TLxlrXK+WHrMmOw+Xe5nHzlGeu3P27fjjWDckl4z9Cx+czup1qxPPo26kYYi4RMIEJ7KkP65zw+CJ0lJEvz0D5EbGvT0Rn2+JsiE1O9APnGSPal49ci6muJMDv8khS17xenj1hodZ42c5bwU0ASOenTOiV8PElEiPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsCyS44V; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773741367; x=1805277367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9M01TEC0AsjzUom48cj+YReRIcPoswlJzqbhnUopfTg=;
  b=lsCyS44VyRRQyOpbovLhzmE6h8PYa+Wep3HzjWb9d6G5aewMrETGKoCO
   S93WwpXY00N081n76r5LSFfZjlMduq8yPhL/MHHDTfpqiDxywzqqRcRB2
   r+3mTwhUiva7flEohO6XVCRbaq2x77RqiLpTzJJN+s4ohx0w92JACjrEi
   YzGppCxyL5Dp56CCWO5sKS7aVzM/Ytqatw9aXgEYAegJhk/8S6vtT1+n1
   LkmCRY/xptfOg7rc2E3yYWQKh0IkvBBN1bNt2NsIHfk0Avv8oqeAXW5Ki
   K8nGtVrR6rACVuOYUxI5segYw9ftoeFxKVS/R3YQPPavphJQvrL88/mG0
   A==;
X-CSE-ConnectionGUID: lS04DfudRDyKgb/w7vOqNw==
X-CSE-MsgGUID: Rylo4dsOTpajKiZMQ8Ue+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62335676"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="62335676"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:06 -0700
X-CSE-ConnectionGUID: QvCQ5eVtQ0CfM1jhXvWnEA==
X-CSE-MsgGUID: LT4qh+4jTjG5vO0yaAbEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226344884"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 02:56:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6E3D8121D8E;
	Tue, 17 Mar 2026 11:56:00 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2RBa-00000000toz-1Vba;
	Tue, 17 Mar 2026 11:58:02 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 6/7] Use "stride" in a stride-related error message instead of an internal name
Date: Tue, 17 Mar 2026 11:58:01 +0200
Message-ID: <20260317095802.214532-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56026-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDBF22A7698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index ef12be820be6..3b92c6ba519b 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -177,7 +177,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
 	line_length = line_length ?: (*width * bpp + 7) / 8;
 	if (!line_length || UINT_MAX / line_length < *height ||
 	    line_length < *width * bpp / 8)
-		error("line_length %u is bad", line_length);
+		error("stride %u is bad", line_length);
 	if (file_size > UINT_MAX)
 		error("too large file");
 	if ((unsigned int)file_size < line_length * *height)
-- 
2.47.3


