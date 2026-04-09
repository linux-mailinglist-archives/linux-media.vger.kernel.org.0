Return-Path: <linux-media+bounces-58419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD3xBQgK2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:20:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 734093CF665
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF8A630214D5
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C668341062;
	Thu,  9 Apr 2026 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu4ye7Id"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D6C33DEF2
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765730; cv=none; b=AEfk1F0x3orMDHqAm/FTXaJ68gF4xpfK0uK2LUvcwEfj6nNgQqKS4YYLXvlqSpiDfxSW0NEOG8p2DTAo9bVHn+qHKVKGYKqIXM/uqUOR4Z0EI+FJXJhT3SJDrqsesnWYLihqXUY1ebkRUS2CeWIkczClFUV0dbCIjJMgsKRFZRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765730; c=relaxed/simple;
	bh=wVJMh4y0O9wGOPz+B7UvBTM7HbUFVPyTi7c2qZSPl18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7vbyecDFD1BOGsBaizR9QGZTU11z+RcYrGAYiYKPD7d12ByOBRYbA4M/GpG53Sc5x7nu6zvAU1TfgRUUDxo9uC4kbOyEzacqd2252C0SA7UehAFMR17J7a1JD3Mso1JhZymg26uNDe/NKws15PRTceqTkcDCimcgNz3cURQo5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu4ye7Id; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765730; x=1807301730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wVJMh4y0O9wGOPz+B7UvBTM7HbUFVPyTi7c2qZSPl18=;
  b=Mu4ye7Id+ibk//60XlnNkyFCvXnOTskwpvoumZvh6/7vKuyGOFfkB1lt
   3XkwhyF6mu7PHFXN2I7kikiFCadqIfxCopVTXbgMJZQPzT6KbffCPSvb1
   K3PPwC8MOXycnMQmF3NzM1e8j8czmIPqIvfY33bWsg8ewc/mxc1r3O2ie
   xrqJUvS2RrdVo3aeLWuAH0g3RmXxxqLemBUBx58wYjoXqMPu8xkwgrhhW
   OE2zZiDqbcb+z5YdVebhY9z0v7AiGaTKTITh/OyDT/eCEGCPZgB6VXiPw
   8CHcvCyE7eroFrzVC+LooYfh9iSRAx2gtPNqEg18TrrWEuf5SWhqiuupy
   Q==;
X-CSE-ConnectionGUID: CzJh0FmeR0qC1i4KWM8cNg==
X-CSE-MsgGUID: A+U+KMK+RTiMwkzYJhic7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176421"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:25 -0700
X-CSE-ConnectionGUID: 1nphXwFwTwKnbGatN10Pyg==
X-CSE-MsgGUID: kYMhDHZ6QS+0lSsJZ8s6aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047522"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:20 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A3E0D1228C1;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045mj-0PrM;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 32/86] media: uapi: v4l: subdev: Enable streams API
Date: Thu,  9 Apr 2026 23:14:07 +0300
Message-ID: <20260409201501.975242-33-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58419-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid,nxp.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 734093CF665
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove v4l2_subdev_enable_streams_api variable that was used to easily
enable streams API for development, and conditions that use the variable.

This patch enables the streams API for V4L2 sub-device interface which
allows transporting multiple streams on a single MC link.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 30 ---------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3f671282ee91..af9024b0f788 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -51,15 +51,6 @@ struct v4l2_subdev_stream_config {
 	struct v4l2_fract interval;
 };
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-/*
- * The Streams API is an experimental feature. To use the Streams API, set
- * 'v4l2_subdev_enable_streams_api' to 1 below.
- */
-
-static bool v4l2_subdev_enable_streams_api;
-#endif
-
 /*
  * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
  * of streams.
@@ -720,13 +711,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 	int rval;
 
-	/*
-	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
-	 * Remove this when the API is no longer experimental.
-	 */
-	if (!v4l2_subdev_enable_streams_api)
-		streams_subdev = false;
-
 	switch (cmd) {
 	case VIDIOC_SUBDEV_QUERYCAP: {
 		struct v4l2_subdev_capability *cap = arg;
@@ -1081,9 +1065,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_ROUTING: {
 		struct v4l2_subdev_routing *routing = arg;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -1105,9 +1086,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		unsigned int num_active_routes = 0;
 		unsigned int i;
 
-		if (!v4l2_subdev_enable_streams_api)
-			return -ENOIOCTLCMD;
-
 		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
 			return -ENOIOCTLCMD;
 
@@ -1193,14 +1171,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_S_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		/*
-		 * Clear V4L2_SUBDEV_CLIENT_CAP_STREAMS if streams API is not
-		 * enabled. Remove this when streams API is no longer
-		 * experimental.
-		 */
-		if (!v4l2_subdev_enable_streams_api)
-			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
-
 		/* Filter out unsupported capabilities */
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
 					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH |
-- 
2.47.3


