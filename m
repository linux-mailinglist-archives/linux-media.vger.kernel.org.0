Return-Path: <linux-media+bounces-62035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PMvMM9BC2p5FAUAu9opvQ
	(envelope-from <linux-media+bounces-62035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08757118A
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 18:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E69003020FC3
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243C048BD4F;
	Mon, 18 May 2026 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/0mdenc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB348BD40
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122611; cv=none; b=V2sdhD+YIGnyPnUxwWgn3Qqc1it4ODTjhfAaxutBy0MCwrajvtw4PEGT88tZsjC7GEQ35/BNiKvPd/OqQ1JugBDcFOUH62E/cfYIU2YSP3BXy22HwoLs5dMVh4Fz2DmwL4IfP3pvGR5+4I/lBjc00LzuVQP1h3u7qTrnvy1z7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122611; c=relaxed/simple;
	bh=1y4Gn1woo3Szf8fGRc7T10nKv9v5e3I1UXtjCHVgDLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qc82FgBXMRjoF7Eby86xf77TUQ+LlAFEivEcPFCNYmL7PMv6lPKBqBP8uhSRFz3thMirzZCwo2hQ8Ntm/qloOxnMbbV/9bHZiNF2LdJ87f8YX94BDhYfp2OBBesiaSIkPw2lAVQylc5ev/8qYXRRc9kYgTDDUHDircW2aAKQpvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/0mdenc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779122610; x=1810658610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1y4Gn1woo3Szf8fGRc7T10nKv9v5e3I1UXtjCHVgDLg=;
  b=i/0mdencMY35QjEUddmZ5VqoCbIuD0V8GrQtCTU1yn3NpxHWbX8J9o0V
   CnZ1ZrrzGwMGwHDQlfHTa8f8ub+cIARs5QKpcFdmm+z98tojzx8f7aADo
   1jrOams7nJMs6y+5P8O164ugUUh0Ui/Eduq5GchjdM30stxiI98AsOf1u
   UCjnLsDLm4sTEWlPY1P1NX+PYXobUwhimwr9iZNOpQCGSNQ1G1XJq20Ev
   ODK4XtxUuaw1MQNS2ssV9e77fBd1LRnwyL2/x0Zwx+tioS+b8F53U9vTh
   SDPqpoPvpC8kZgwFztcmxpQrCII5byCH/0xDv1zCuHT5nUzN4UsR+y78Q
   g==;
X-CSE-ConnectionGUID: 1grOCFuwSzWQ87kBEY3itw==
X-CSE-MsgGUID: TrbtR4gBQfiuNNxUA10PGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97413847"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97413847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:29 -0700
X-CSE-ConnectionGUID: NAUCcOcRQzqzpMhwcXwq/g==
X-CSE-MsgGUID: xWTXWjndQs64mAeLN3WI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235019221"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.125])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 09:43:24 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 37DAD121CEE;
	Mon, 18 May 2026 19:43:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wP13m-0000000E89z-0fuD;
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
Subject: [PATCH v2 07/17] media: v4l2-subdev: Return dynamically allocated pass-through routes
Date: Mon, 18 May 2026 19:43:07 +0300
Message-ID: <20260518164318.3367888-8-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-62035-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 5E08757118A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Count the number of pass-through routes and then return the full table
once enough memory is available for it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index ebcc0b40fac1..b5eef0baa237 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2653,20 +2653,22 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				return -EPIPE;
 			}
 
-			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
+			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
 				dev_dbg(dev, "Frame desc entry limit reached\n");
 				return -E2BIG;
 			}
 
-			fd->entry[fd->num_entries] = *source_entry;
-
-			fd->entry[fd->num_entries].stream = route->source_stream;
+			if (fd->num_entries < fd->len_entries) {
+				fd->entry[fd->num_entries] = *source_entry;
+				fd->entry[fd->num_entries].stream =
+					route->source_stream;
+			}
 
 			fd->num_entries++;
 		}
 	}
 
-	return 0;
+	return fd->num_entries < fd->len_entries ? 0 : -ENOSPC;
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
 
-- 
2.47.3


