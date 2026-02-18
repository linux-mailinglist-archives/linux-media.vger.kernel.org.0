Return-Path: <linux-media+bounces-53030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBviJJh3lWl8RwIAu9opvQ
	(envelope-from <linux-media+bounces-53030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:26:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D215404D
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 09:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37000301A3A7
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 08:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3353191AF;
	Wed, 18 Feb 2026 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBXtR8yu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC8F318B92
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403154; cv=none; b=KdliQBdUw4B8V6RVvTe84DBiKxSpcEZXlxN78BfNN+5PFBECB9k0IjTcwtyk+Qc5wS5e0Y9kruonhfDvHQLyLWhgGH/+0J5+LT40uUXbJRV6SfLeAELD4I3gqqkqSCvEY4EDY0iMLKy6TM3fOrTJpfknXCJCWXj/D50thyMuG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403154; c=relaxed/simple;
	bh=2WK/V8Vun3cq6hA4gKArtRxuQu8wBuM+y0KNBsL/CXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHJDxrUFTtu1uG+3QQuvMIJ/XLbo/nOTfrbyw7VhKPzbdwCfKL7eCAQUltdgjJjmzkisNcjz1ILjimTHVoO/qpdfiyE2WgTXJhfIKfAsUzyYdGDltMC8m6OU3ZDezl9uayV4KdxTKhJG1lhX6CXuFqkKBmTOiXdFtXvBhJrcKgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBXtR8yu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771403154; x=1802939154;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2WK/V8Vun3cq6hA4gKArtRxuQu8wBuM+y0KNBsL/CXs=;
  b=hBXtR8yuCP+6jbqdPUsNwY7CBIg864i3Nlx/XO1Y0vgc5ZP5uo2OFdKp
   9+Q2xHHe0ARflIBDQiRZaYB4GYvT6pLtnWiVDMhfHYlJZwNNKDb9R0yL9
   cJjUsjzmaEHVS1GxshANlNgBSkmAK7zXjPdxzQKgO3Y7q0SX8iLb9WG9X
   h8XPqt+/5gM9hHdgimzQdV4WQcYo1I2bv/wtOuu1Vj1I4PthBVH7utqoH
   ++N3f8CjR4+YIgQ/Wwp7cq2rjEnb1P58aU18RsMBh/mzJoRLd1bDEQVfd
   sdC7PqqNykPaqTQqNzwWQ5bUB8tfUeMyoVfFflPjGMch9P/1bQ/ryaVAG
   g==;
X-CSE-ConnectionGUID: VMFHQbfzT2aI64qmTJ9f0w==
X-CSE-MsgGUID: tNxAqeWeTAeE5sP+jM3B+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95102851"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="95102851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:53 -0800
X-CSE-ConnectionGUID: /qRswBFpRPCzKGVLyQzmag==
X-CSE-MsgGUID: 061J4up0QCCgm0ttFuJNAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213375796"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:25:52 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E589E120B7D;
	Wed, 18 Feb 2026 10:26:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vscsw-0000000ACn4-3BCG;
	Wed, 18 Feb 2026 10:26:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v2 0/3] 10-bit packed raw support
Date: Wed, 18 Feb 2026 10:26:11 +0200
Message-ID: <20260218082614.2432432-1-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-53030-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: C04D215404D
X-Rspamd-Action: no action

Hi all,

These patches add support for 10-bit packed raw formats. Adding support
for more bit depths would be trivial (at least up to 16 bits) but I only
needed 10. :-)

The code could be prettier.

since v1:

- Use __attribute__((fallthrough)) instead of a compiler flag.

- Better error message on what's wrong if a proper unpacked format isn't
  found when processing the newly supported packed 10-bit raw formats.

Sakari Ailus (3):
  Add explicit switch fallthrough notation
  Add compiler options to avoid warnings
  Add 10-bit CSI-2 packed format support

 Makefile     |  2 +-
 raw2rgbpnm.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 87 insertions(+), 5 deletions(-)

-- 
2.47.3


