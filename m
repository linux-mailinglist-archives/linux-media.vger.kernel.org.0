Return-Path: <linux-media+bounces-55055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAoqIHXar2kzdAIAu9opvQ
	(envelope-from <linux-media+bounces-55055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:46:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4232478ED
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 033263023D4D
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53798368974;
	Tue, 10 Mar 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irJRegcs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C73BFE52
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132346; cv=none; b=Z5uC0VLR1bDgP0WLm/Sa3BJxru110ZIY9vLoicgAfzZD3957iwJG2IzRpLAP95TG5zLBlRMtQSwr4OETJ1+t26UsEpsbF8pxq64xYN76iiSOqhkEiEhV2qauZMvg8nl7zWroRgfuytBnqz3YUrhk5t2uBTnuOXp1Gwo6MOz7oOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132346; c=relaxed/simple;
	bh=01ZFcu8Y5ERntPzMIUMn7FdZ3ELhpMjnIFzXoQArvEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWKIugFbMiNjt5k67SARHSQ7yJuC2x7GSUBwzIYY+tVU/l4B+IYHZ3fpx1qOqOCQkUvUy2iJRgzYiEklLdHpCyC9yYRXOYS5m7Sb85fB5pJqZKACa45U2mKImca9N3WMjUDnuKFc/mV/Uz8/Vasg4WzgTeyuUdsi/JLupyehH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irJRegcs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132345; x=1804668345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=01ZFcu8Y5ERntPzMIUMn7FdZ3ELhpMjnIFzXoQArvEA=;
  b=irJRegcs0ZbjjAHlHP8QWFwa5/ZJL1CVw6kW3WqjMzAXDSPh49DqFBfH
   a2nl+bCp2jzgcG+wblFme9BIT4mYLi0cwEPsIo9F6G2Iqks+d6ZskH2MT
   hnKTrd7/rmPU1HybCW6UCIbIl0JTGDIoFip55nhVjTr/e7GxNOWmyXsEW
   KwQUTjQapqma3e/ZwFsmptKUJGxhB6TuHbtQxTp+M3Plzu64GEFsiogOG
   zz9nghJsu0/8lzOV4A70DVphwEqzdOq53SGLjqDFjlCz4yM2oTxxEDlPD
   ZVT1NV7v5UJ5B0Y2z8bD9+AEd/pkqxYfwdxflD619il6gg4TG4kAPDxRn
   g==;
X-CSE-ConnectionGUID: H6c+cZ4MTVqvywxBaxrOHw==
X-CSE-MsgGUID: tYytgTz/S/WvYzk6EkhsPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501742"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:45 -0700
X-CSE-ConnectionGUID: Y39T3aFRRr6KJpIxIBTbHw==
X-CSE-MsgGUID: TsGxa04CS7SLKe4zg6dPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727681"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:44 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6970A1206B6;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xnP-10uD;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 00/11] 10-bit packed raw support, other fixes and improvements
Date: Tue, 10 Mar 2026 10:46:06 +0200
Message-ID: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F4232478ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55055-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi all,

These patches add support for 10-bit packed raw formats. Adding support
for more bit depths would be trivial (at least up to 16 bits) but I only
needed 10. :-)

The code could be prettier.

since v3:

- Add more patches for cleanups and fixes in general.

- Allow setting stride, with format thhe height is calculated. This is
  practical for use with e.g. yavta, which can write multiple images into
  the same file.

- Simplified calculation of offsets in 10-bit packed Bayer unpacking.

- Compare old format info pointer to determine a supported format has been
  found.

since v2:

- Drop bpc argument from raw_get() and raw_put(). The bpc argument wasn't
  really needed there as the functions don't operate on the values (but
  simply pack or unpack them).

- Use unsigned values where appropriate (i.e. make signed values
  unsigned).

since v1:

- Use __attribute__((fallthrough)) instead of a compiler flag.

- Better error message on what's wrong if a proper unpacked format isn't
  found when processing the newly supported packed 10-bit raw formats.

Sakari Ailus (11):
  Add explicit switch fallthrough notation
  Add compiler options to avoid warnings
  Add 10-bit CSI-2 packed format support
  Support long options and improve help text
  Add "help" for listing formats and de-Bayering algos, document it
  The program has been called raw2rgbpnm, not yuv_to_rgbpnm awhile now
  Arrange headers alphabetically
  Add --stride (-S) option for setting stride
  Improve input validation
  Ensure width is divisible by 4 for packed 10-bit formats
  Add -S option for setting stride

 Makefile     |   2 +-
 raw2rgbpnm.c | 199 ++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 160 insertions(+), 41 deletions(-)

-- 
2.47.3


