Return-Path: <linux-media+bounces-62655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDTeFeveEGr2ewYAu9opvQ
	(envelope-from <linux-media+bounces-62655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:55:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFAE5BB455
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 00:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D0DD3004CB7
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 22:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD4338C2A7;
	Fri, 22 May 2026 22:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5YZopwW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3609C366DCF
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490528; cv=none; b=EmCUTBy4NRbNEGi3mm3rWARB640K+DdFv3i1pH2sgfnYqKTiXM4hqtpGAf4Tu8fwdBc6aCo84iQB4mtQC828l0K2zYmMpJXsctuT5P6+AdAx2JIRrev82L1XNWMyYKG6xTstVWLRJEuNP7dGfW3GwxQI9kptcnNYIb9o3u24UCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490528; c=relaxed/simple;
	bh=ZOOG5MvS2i7JuN7tG3EEI/hqJG4eq8Z9AdCejHFON80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gb+Q/c78ao2BLQyo8wFby5zG2kkUF+8j2TTx/RL1FhAbzQQVK7T/uH9gkn/WZmU77K0hY+cLO+ZfmobNqJafPm/y43KgqjdBkALj43RbSOL8l5y6QO0EOfukcjn+Jz1wwZm2CbBMjyjMGIqkAE7R6tiqSxZAuk1IdxQm28Tb+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5YZopwW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779490526; x=1811026526;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZOOG5MvS2i7JuN7tG3EEI/hqJG4eq8Z9AdCejHFON80=;
  b=F5YZopwW7bckCcMkFWaFwA2gaeDxcXqjqkwEkdlmkkkyZ2DzyZJABoxW
   TQGSJy9DW+d9yB0lh60rsH9jR4kxXzWpZ4FRqreLeN3euLXSJk8bQZucM
   NXEj6yRGIIWqbCR/4u3ymPaX29BJfNd3c6z5pw2hEsmLYB9YYcjMBOPX/
   V1TF1erQkv1FNrKYPzVxC+Pddw5X7H02TQfzEgaTFnehFPsag8ayu92VF
   l/SbhVsbl/rPUpMtxfGHI8xar24qIdYy+m3Te1Nl/tDLmoC2iXvMlo97z
   7x8apZLOZfgZWKaV9ZUCi93N+w5SpsXnJ5GJL/kR1BZfL/RpGdjNUurI0
   A==;
X-CSE-ConnectionGUID: jujQ3WosTaOTcfpMMvOZOQ==
X-CSE-MsgGUID: j5BSrwPWQMOzm9rvTwFKTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80457952"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="80457952"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:26 -0700
X-CSE-ConnectionGUID: G6b+pnp7R2qpsm6oWoLo+Q==
X-CSE-MsgGUID: +q6gFB67Tnm1TItTw/9tmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="240198776"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.81])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 15:55:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BBB3B121D50;
	Sat, 23 May 2026 01:54:02 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wQYkk-000000012HM-1aVU;
	Sat, 23 May 2026 01:54:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 1/1] staging: media: ipu3-imgu: Ensure correct binary selection
Date: Sat, 23 May 2026 01:54:02 +0300
Message-ID: <20260522225402.247080-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-62655-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EFAE5BB455
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ImgU has two sets of binaries, those that support striping (fixed at
2) and those that don't. There's overlap between the stripes and so that
implies a minimum width for the images themselves, or the Bayer downscale
rectangle in particular.

Take this account in binary selection.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Ricardo,

I'm not sure if this makes smatch happy but it somehow addresses the issue
it found. In the end it's up to the userspace to configure this
correctly...

Compile tested only.

- Sakari

 drivers/staging/media/ipu3/ipu3-css.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246fb..3e4e03a8fa3a 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1613,6 +1613,12 @@ static int imgu_css_find_binary(struct imgu_css *css,
 		    in->height > bi->info.isp.sp.input.max_height)
 			continue;
 
+		/* Check the striping overlap isn't wider than the stripe. */
+		if (bi->info.isp.sp.iterator.num_stripes > 1 &&
+		    rects[IPU3_CSS_RECT_BDS].width <
+		    4 * IPU3_UAPI_ISP_VEC_ELEMS * 2)
+			continue;
+
 		if (imgu_css_queue_enabled(&queue[IPU3_CSS_QUEUE_OUT])) {
 			if (bi->info.isp.num_output_pins <= 0)
 				continue;
-- 
2.47.3


