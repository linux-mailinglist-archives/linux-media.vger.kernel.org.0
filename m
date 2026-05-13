Return-Path: <linux-media+bounces-61383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMOBIB5WBGqMHAIAu9opvQ
	(envelope-from <linux-media+bounces-61383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC053187A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 728CF303A4D7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86903F9F41;
	Wed, 13 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dovCoRlc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E2D3F9F5D
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669050; cv=none; b=GF5jQsB+CEJ1YWxL1VZ6KG3DH8S4detAgMRbWbLYdqUVlb8UqlfOUwbxKtoRYiwvMCNm6uxKKgelZu2KAYPvQbshWWd3PVk+CFKpxVSaz2EQOFRYdqJJp0l7ypNOltWo01yw8aSjouZSR0nWKsfFG373dkbNAZcKSnl2FxaUsgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669050; c=relaxed/simple;
	bh=dMCUD2To36hV0hm5GJF9vjOjDmuHV/arU5nsqCvTffs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaxL3tWJh0zMaapFBlgEVX6GEDOh67jkgw7r04YprCw3gCwk11COzQ+tewOKVy4lYoXmreoYpjEaQRJsDJnxVMWMqaUtw3vsAWUCezS1LYmQq2v6FWlIZ6sQFDhkeCilKvESSDo2E61nJXWtTiGFLJm0/X3qrblmJtEdydur3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dovCoRlc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669049; x=1810205049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dMCUD2To36hV0hm5GJF9vjOjDmuHV/arU5nsqCvTffs=;
  b=dovCoRlcum2cV4TsOzoJiftc5IUewWTpABCv2JIM2DVap5DilktAAVAH
   wK3kQ6ux9wC0jO1B3Y13/Y+5JLeMqLWRg11ai0ipQa2q7WxspMHOE6qHn
   lHUfvYZJT5LnBXobU5DeybHwEyOOef3UIzEc6BvLQ6DqO2MvI6C6jBpa5
   uGl3jB3WDfZcWH7ZJ+Hgxx8wkR8Kh5EMQYEVd9svvUcYsBrPRmfulWfIC
   f30lxBTeNZ/ymMCvnAHt9i+UUukqvRxjBJ8g0Nayplxu1AKbloO3nw96J
   CJ8X+3UGP/BNzX+PPBDoXtHE8/hDT7ouhJcQsi4lnFrQwAXEBKe8YxfrZ
   g==;
X-CSE-ConnectionGUID: OkqLj/n0RUagaKwpctXO7A==
X-CSE-MsgGUID: pGf/hFw9SUCHx5841yJo3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464463"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464463"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:07 -0700
X-CSE-ConnectionGUID: tIpyD5/LTjeUdKe6F6iVJQ==
X-CSE-MsgGUID: 8txz958BSWyrjjM8xQFTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599260"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CA29D121CF3;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1S-3CQM;
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
Subject: [PATCH 06/17] media: v4l2-subdev: Change the maximum number of routes
Date: Wed, 13 May 2026 13:43:47 +0300
Message-ID: <20260513104358.2252605-7-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: 5BDC053187A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61383-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As the frame descriptors are now allocated dynamically, allow as many
routes that there can be dynamically allocated frame descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a49aaad595af..43d8c0f8701f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1100,14 +1100,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				num_active_routes++;
 		}
 
-		/*
-		 * Drivers that implement routing need to report a frame
-		 * descriptor accordingly, with up to one entry per route. Until
-		 * the frame descriptors entries get allocated dynamically,
-		 * limit the number of active routes to
-		 * V4L2_FRAME_DESC_ENTRY_PREALLOC.
-		 */
-		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_PREALLOC)
+		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
 			return -E2BIG;
 
 		/*
-- 
2.47.3


