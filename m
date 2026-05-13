Return-Path: <linux-media+bounces-61376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAbbM0RWBGqMHAIAu9opvQ
	(envelope-from <linux-media+bounces-61376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDB55318BC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21C6C309CF2A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36E439B97A;
	Wed, 13 May 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtbBXHEL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E8D3EE1C1
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669046; cv=none; b=l2G542qjUl07+PCWKgUqrXoJYBk4yFEIreZpMWDoXzI0xBo86pHzb5CdNHsa3M2EEEC6M+v4oGztac+Pvx3FKrKv5iRDcRxYmqugSBpUY983UxReGPD7RAfGwUInIVj7hDW65AJyT2Jo9r5KZsL9dsc+hS2Wh9Idtm4FNzXwQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669046; c=relaxed/simple;
	bh=hLVDVKLLxN9t5/hqUSAYjs0UZX0z2dqoV5rEeeVEPGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsJsMxe/h/2AsTi88xuLjDq2ARPePkwAAl7tcxe3XJdLkpF54+aJoKqcfICH5/sVBoGbQ+s65VIXbTI4+ZCm+peVkk84E/IOb0Br4DwZkjCIYVJqmKr0si5waVRZIXKeOqWyRVsvDTReSY4CvVGE3VGDvElt5Tq5Jb2APfdBxOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtbBXHEL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669045; x=1810205045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hLVDVKLLxN9t5/hqUSAYjs0UZX0z2dqoV5rEeeVEPGI=;
  b=gtbBXHELDREPuKKijBROiqauwOB3GN3x1+rdP14AqJrj2QFQCD2gXRC3
   m+Ft82VrvX/qQUmL0MWteHB9I74hYG4wxlfGF2ndrkpgnquI0muOlssFA
   2JpcqEMjFmgLXccZLA7Yry8U+2UtfZEc9l+HegAtPGHTCQpaWx2d8g9Gl
   bKWu6F+NewpMI/DMZ7JfCzooTMylhR3y/NQM+81+YzMHm1Oq39JsH7DJd
   VO56QBJS+f51MHyu19USo5RES6DAt4Jxwsnn39GOslUSPSsG3y3JojCOO
   KX/zJtJgd9g/zixrsslZBlv4zJe4WJ13hA/Lyuh38z36cTORbkrPjwaLd
   w==;
X-CSE-ConnectionGUID: 0wfUWi4uQSyBFIVZLVaq3A==
X-CSE-MsgGUID: DHKdbPUoSNGoHUv1MEQwMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464442"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:04 -0700
X-CSE-ConnectionGUID: flWKH2lKTOi2+WHSd51jqA==
X-CSE-MsgGUID: 5RSJIKN+TMq+NGwlczHzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599240"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BFD73121CA5;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1C-2wwh;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 02/17] media: v4l2-subdev: Align frame descriptor error codes with routing
Date: Wed, 13 May 2026 13:43:43 +0300
Message-ID: <20260513104358.2252605-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4BDB55318BC
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61376-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

__v4l2_subdev_get_frame_desc_passthrough() returns -ENOSPC when there are
too many routes. There's a subtle difference when compared to -E2BIG, but
-E2BIG can be used in this case as well. In practice this was unlikely to
having been ever returned from the kernel as things currently stand.

-ENOSPC can be then repurposed for signalling of running out of entries in
the statically allocated array.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e9f81b9be9e2..d93ed50255ed 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2639,7 +2639,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 
 			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
-				return -ENOSPC;
+				return -E2BIG;
 			}
 
 			fd->entry[fd->num_entries] = *source_entry;
-- 
2.47.3


