Return-Path: <linux-media+bounces-62032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH62OLlBC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6178957117C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8E02300F1BA
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAEE48BD41;
	Mon, 18 May 2026 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6AusYc5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3E3E1D0B
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122609; cv=none; b=AxseGVIoENc/LU4o3vRUhg+bChs8tf8sDVzfSTpgVHtTjuLz8pbPM3cpKhT6VzlNRWTuBDzP8GKKDlWlHJ7JQV68ywB0QfSGXusAmuNhved2RJLWn/kDv/GvEFBLBldYZc67ZnZexQreC6/UqQNxnE0azxwGWbD0hH8RhVNtajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122609; c=relaxed/simple;
	bh=oXXftzEIKxy3cy06CI/CLN4/UbkMRJoZQ3yhE60SWBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LotqbJbsiFxKEaZRyUkNkIAFBRGLJgAZzAzWoekPuJXj8ULrLV4PxEw6Pjk/Dn+WN1s3uH8xdolXYoFRt8AAQdu+BTcfRUieQHevfJl6bexWRtnuCiuFSADb+zF1Ml4truGDSKIXmrYP0u3qYkqmXqgoDSfY0tJsagsdYZ4f/YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6AusYc5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122609; x=1810658609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oXXftzEIKxy3cy06CI/CLN4/UbkMRJoZQ3yhE60SWBs=;
  b=k6AusYc5YDYwYvdud2QBxd3ozxczahnZDR4ohYkiqpWhN4EyQbLetiYm
   ew1RGcNMsTlmdzJL7ozQwffKO8tAAMLnWUgSHZi1JjixOl77RY0h1m+TH
   hNqYzprsztL6o/7tAReocxyUGCuVZ620D4CaSXejJVTeCdr4sny7XfvK0
   2feeXWxJ07pusQW8c02kNO68mBxnJRMFJxo6urCTS17CRwUKv1whH4zgN
   DLYbWWJXvNu214Z/frDgF+uAEvzrTPNYl8taoagyPztca4NAgOxYfM0PV
   gu4E1Wwv+Gc/Z831a4TwTOpzZ+o4iPF6eEta+P8/MNGxMmdcw2sw4eznP
   g==;
X-CSE-ConnectionGUID: 17HNygFbS0GCzp9CBfup5w==
X-CSE-MsgGUID: UbcBtHsZTn2sJ+wXG0F/Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413838"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413838"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: gJUAz0YxRAaJuwoGp4eDpQ==
X-CSE-MsgGUID: VZv4/ibGQh+4BQ2/dNZcWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019211"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:23 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 32021121CEB;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89t-0bEA;
	Mon, 18 May 2026 19:43:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v2 06/17] media: v4l2-subdev: Change the maximum number of routes
Date: Mon, 18 May 2026 19:43:06 +0300
Message-ID: <20260518164318.3367888-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62032-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:mid,intel.com:email,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6178957117C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As the frame descriptors are now allocated dynamically, allow as many
routes that there can be dynamically allocated frame descriptors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index da8464dfb265..ebcc0b40fac1 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1103,14 +1103,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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


