Return-Path: <linux-media+bounces-56079-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ14MHNWuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56079-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC12AAD42
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89DC5305C7BE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA823CB2F5;
	Tue, 17 Mar 2026 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjqispAL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5273CA4B5
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753380; cv=none; b=gD2wGYv+CHsOqX8spA080SlhTGb6n0ivcUjWcRwXQMnaZV3RhPfR6nHpjI44CXHT96JP1xbUnxuT0+u1vZEhEzFA9mjniIVITdK8vxV10ZWgD2p8AjE2m9JshwJjfL3GrnahjyP7iMDtDJIzyRp165Kh1IZOSHpLvTGpKtFOjWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753380; c=relaxed/simple;
	bh=Clblr5jt1oQY4oN8z8zWP+pn8EN+PhZwV3RAv+YxG9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TgHliYbaVdIIQ6XjsUnxL1v0K2n+ugVATlURiguEri1QFJeqCD7ks24P1Vq5vkCEMBsOKKn90cEM8cCBukS1txH5IvTl3XU7zrMVUwdcBcAp0yFeLG+qbebpy9ZrFqjMxTFQWnGjYjhoDLMcvMG3ToVkn73Qrn64tsosMQPzpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjqispAL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753379; x=1805289379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Clblr5jt1oQY4oN8z8zWP+pn8EN+PhZwV3RAv+YxG9E=;
  b=YjqispALAxyhnPmAGSAhbuBLeLPynlz42x9tdsDLoLM18A1y9yf9tFaS
   B+SUt3pPiM4906Uo3egOzvyQcb2zMFgyofLfAKx57b2CBoj2dWwe18CKU
   P5CqzHvAZh+NEG04LhjoaiLbBcWNhv31yMzCubzEfQWMdMywaGQK9xTJI
   NNFP8e64WXhEBSMyHg/zBJJ5oGyT/VBt6FZQBJ/6ElZOKRiq69gpwW9e/
   xz6N0r6eX8tNanvawtAjG+YUQ4vJQXMIcFzTiEy/tOJZKO8O70nymTV1E
   fzPnRrJkG6Vkff5CIplaTms187nS+5gEFs0VgDc1F9JiSakNpG7Uu9xma
   g==;
X-CSE-ConnectionGUID: eyoh3JTNQJykPaJPQH03yA==
X-CSE-MsgGUID: /q6PPx5bQY6M8ZEW9uS00g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411102"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:15 -0700
X-CSE-ConnectionGUID: 3MNi5AARSq6mYQ4Sl5/UMg==
X-CSE-MsgGUID: PYPwMkYXQ7quuiZDnVhS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226733223"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:16:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E238F121D4F;
	Tue, 17 Mar 2026 15:16:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w2UJJ-00000000tzq-3Hlq;
	Tue, 17 Mar 2026 15:18:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 0/6] raw2rgbpnm cleanups and a fix
Date: Tue, 17 Mar 2026 15:18:07 +0200
Message-ID: <20260317131813.215230-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
	TAGGED_FROM(0.00)[bounces-56079-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0DC12AAD42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi folks,

Here are a few cleanups and fixes found in Laurent's review.

since v1:

- Use old_info->bpp field in reading the original buffer.

- Squash two header sorting patches plus swap two lines.

Sakari Ailus (6):
  Reorder headers alphabetically
  Check we have a supported format first before allocating memory
  Add quotes for "-f help" in help text and do a line wrap
  Constify progname
  Use "stride" in a stride-related error message instead of an internal
    name
  Fix file size check

 raw2rgbpnm.c | 49 ++++++++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

-- 
2.47.3


