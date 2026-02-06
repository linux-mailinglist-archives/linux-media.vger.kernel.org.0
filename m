Return-Path: <linux-media+bounces-52297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPqVACXphWnCHwQAu9opvQ
	(envelope-from <linux-media+bounces-52297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EAAFDF32
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4CF4300BE80
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71793D7D67;
	Fri,  6 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYBaPHyc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024823D5251
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383625; cv=none; b=poRMhKSGXX8cywL+cLWUTF36G6ZtDVa/TrUBV/bYhiY+Uxz+2Wp4nhGHp9Y5li6OlqLfX8JXmlObxhU7rokeW9JfGpTA7di31Uiwj4WQfGHJIT5ctPkZ2ER0e5wNGAgtx3gEjKxhoI8SBtUJ5avb4TxCG0+n9u2ssrf+j86sJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383625; c=relaxed/simple;
	bh=OlTLK0CqCzBB4WeAVR7jvxv1ulQBxGgpjsvrv0hIQjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=quUcP0WUbgC9TszYM/XgqF8TT+/J8HxyvCOeqepTl8A3y6C4NmmNwBG8ZWJH9wsKm1qWW6QzlvqLIp2oR0TtnmiIwGAG6+XnwnJXFSChpWsZ15i7YFjNwYhWWZfemfWpMy8CFnqpquM7ZvTpXuYrFqJ04Su12bBuHGBPa5Swowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYBaPHyc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383625; x=1801919625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OlTLK0CqCzBB4WeAVR7jvxv1ulQBxGgpjsvrv0hIQjY=;
  b=DYBaPHyc7uoofqUA0K8AUmljgquoCUHxJ0feSzwHtqjI68qXmDB8e+8W
   Of9yB2TDnen9leXT3D7bmMjSeumu0Tvu8EkrDNzIVlPRehbObp88YVK1P
   tZIRBirYcixfHgVjh+6Sre5B69EuXRYACljJIjOCrvIcfX73wL8crJXuR
   /783fE3rwiak/ND5NU4CxzWmMmiWQMcNDMendmW1RFe+RuYNWprFHPYbA
   N970eQRfpfJrYknmHFzi2Mt49C4LtJO/JcvwdcdzlQ7Rq4w9WeuhEDc1Y
   Gc0TEeIv3KVi1kPUthMBtdr9A5/TC8ZelOVX57NTn36mmIKeRSno2RCPt
   Q==;
X-CSE-ConnectionGUID: Q7r0QhZNRH6lMBdrdWhcZQ==
X-CSE-MsgGUID: QDA86rGaQbOdWkAy8QEZow==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441213"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441213"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:44 -0800
X-CSE-ConnectionGUID: CcpaKBhNTLusrGCWpJUwaA==
X-CSE-MsgGUID: W95HVvsBSZahG/tp32gzPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391295"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:38 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6BAF6121E18;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005TsK-1DkB;
	Fri, 06 Feb 2026 15:13:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH 05/13] media: v4l2-subdev: Refactor returning routes
Date: Fri,  6 Feb 2026 15:13:22 +0200
Message-ID: <20260206131329.1306429-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
References: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-52297-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02EAAFDF32
X-Rspamd-Action: no action

Refactor returning the routes by adding a new function that essentially
does a memcopy and sets the number of the number of the routes in the
routing table.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b2105c34478e..8a433d074587 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 			     v4l2_subdev_get_unlocked_active_state(sd);
 }
 
+static void subdev_copy_fix_routes(struct v4l2_subdev_routing *routing,
+				   const struct v4l2_subdev_route *src,
+				   u32 copy_routes, u32 num_routes)
+{
+	struct v4l2_subdev_route *routes =
+		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
+
+	for (u32 i = 0; i < copy_routes; i++)
+		routes[i] = src[i];
+
+	routing->num_routes = num_routes;
+}
+
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			    struct v4l2_subdev_state *state)
 {
@@ -1000,7 +1013,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 	case VIDIOC_SUBDEV_G_ROUTING: {
 		struct v4l2_subdev_routing *routing = arg;
-		struct v4l2_subdev_krouting *krouting;
 
 		if (!v4l2_subdev_enable_streams_api)
 			return -ENOIOCTLCMD;
@@ -1013,13 +1025,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
-		krouting = &state->routing;
-
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       krouting->routes,
-		       min(krouting->num_routes, routing->len_routes) *
-		       sizeof(*krouting->routes));
-		routing->num_routes = krouting->num_routes;
+		subdev_copy_fix_routes(routing, state->routing.routes,
+				       routing->len_routes,
+				       state->routing.num_routes);
 
 		return 0;
 	}
@@ -1090,11 +1098,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		 * the routing table.
 		 */
 		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
-			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-			       state->routing.routes,
-			       min(state->routing.num_routes, routing->len_routes) *
-			       sizeof(*state->routing.routes));
-			routing->num_routes = state->routing.num_routes;
+			subdev_copy_fix_routes(routing, state->routing.routes,
+					       routing->len_routes,
+					       state->routing.num_routes);
 
 			return 0;
 		}
@@ -1108,11 +1114,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (rval < 0)
 			return rval;
 
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       state->routing.routes,
-		       min(state->routing.num_routes, routing->len_routes) *
-		       sizeof(*state->routing.routes));
-		routing->num_routes = state->routing.num_routes;
+		subdev_copy_fix_routes(routing, state->routing.routes,
+				       routing->len_routes,
+				       state->routing.num_routes);
 
 		return 0;
 	}
-- 
2.47.3


