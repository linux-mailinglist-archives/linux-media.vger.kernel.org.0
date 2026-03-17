Return-Path: <linux-media+bounces-56081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG4oC1tUuWkNBAIAu9opvQ
	(envelope-from <linux-media+bounces-56081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:17:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A66722AAB06
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1327C3073ABC
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4163CB2CB;
	Tue, 17 Mar 2026 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLTpr1Z1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0641E3CB2CD
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753381; cv=none; b=Nr1+5i+wr+l+f2sMDW6TyV3Kl3IVDTwJz4ekXSuDm1ESRxqDVRatdlytyjFgCIytTBqLrcmQo4/9x6Ml//IxKeAOxQB8bSTfFgn0yR5yF5ZDH7yb2AUXKiRMb/oFisheJnqlZTmPEifYSOmn5jzR4Hbepz9gm3A4g+Uz9jMzCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753381; c=relaxed/simple;
	bh=kIKkK1t1ZOei4p5B3hWqo+EGrVv63LlME1sS7H4xc6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIR2CPe0r02Y2DLMQa6mfgwkRDiYorGTJd1e3WqwD7N75XYIVmuiVgn0HqJCV8X/mAL76v6pcXuTvvzE4GRVGPnmTFVar8CS2My1wCtXKAQe0nwi1+xz97g/THg8kCHkmq3WHKHAwflK1boBKUdJKZJUQgbwrdFPQ6zXTZiuBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLTpr1Z1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753380; x=1805289380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kIKkK1t1ZOei4p5B3hWqo+EGrVv63LlME1sS7H4xc6c=;
  b=YLTpr1Z1RmdjxSnphZYL6gSe7z9sNKolbMKa//qVv5j21L8oAdMFjBF+
   tsfo4g8MuLHuU6pdiTUdE6Kbkv37j4RozCFkUuAaqi/Nw0eMVKBHFnkoa
   m+v12PQ/J8XISz3QhDuNH4Olo/E3YbEur5ZrBQp+x4ldLEJyDJANEnfN1
   FQNGXoXSzkHlkwRFvqwDLl/bHQO5Geeg/w/l2jcujXmMo/+BH9gcTjNay
   U5tQzGeQhBKRzfG+Z/vxuKxQt8PsfX9pVB+Qc67UlPTTweQkIM2aKH+eo
   THtnotJpEnr/D7Iofz+ugEjCkHzE27qgRne4P+vdZU96Nfs9YhhACeKyT
   Q==;
X-CSE-ConnectionGUID: 2v4f1k0TSRmrMRtneGAcBA==
X-CSE-MsgGUID: x6gX7W9wRx+Kkzb+QeuZJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411107"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:18 -0700
X-CSE-ConnectionGUID: 9T7SERhvTpqm32RwJZir9Q==
X-CSE-MsgGUID: hsb6nDK5QUO6fkW3t2olFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226733230"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EDC6C121D8E;
	Tue, 17 Mar 2026 15:16:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UJJ-00000000u09-3dHj;
	Tue, 17 Mar 2026 15:18:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 5/6] Use "stride" in a stride-related error message instead of an internal name
Date: Tue, 17 Mar 2026 15:18:12 +0200
Message-ID: <20260317131813.215230-6-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56081-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A66722AAB06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 raw2rgbpnm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index bdcc8dae1db9..ce02c0ec011f 100644
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


