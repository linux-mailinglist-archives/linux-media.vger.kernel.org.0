Return-Path: <linux-media+bounces-56984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDYlD6zBw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB33237BA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 062CE30980A6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBCA3C5520;
	Wed, 25 Mar 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmeHu3LT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8613C4574
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436326; cv=none; b=Yai+u6DtbnsteMrNCdBpgu87uQgFCGtPbmGXwksWY3unAiChS5QHvGwHskGb3X1R7i4IRYZWIo/ZdjLZ61zBM0shoXY6/9GRNWIPyBSWiiPShzz8mhlKwXXDfOc96StDvgvxE6DSVW1BkgXLHE4LGRVLCVcflvrnSP1Nrekx83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436326; c=relaxed/simple;
	bh=+qnSYt82nBFk0VGTnlxnFHBa7kXtdA9kCT7lSOsaas8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAMr46tS6MdBoM5EVxFLAbsUQcJ5c9RuRsdt+0HvZrXKdgHaMm0ZYUNzqMzHZcBAP9vKQ6s/U35HDgPJBd+mnR6on2duWgM3ICH9OOG3ylVj3m39FPfiOYzJjZ2QedY33b2B/zgBfL0h3D3bQXP+9CUe+9pI1mnV3Q8lfD1AvbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmeHu3LT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436325; x=1805972325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+qnSYt82nBFk0VGTnlxnFHBa7kXtdA9kCT7lSOsaas8=;
  b=NmeHu3LTDfxOXFB/hUAT/zRnLmWAvTSGvFVV4PxG3Ss87BYvgiNxyDgi
   SbhGVljt4oJGn2Wn++2FEs/Lg8SFdQSoX+NeJ+4Ac427wlAwIpQhtGHXH
   XYBMl+YzSi9/WjgCpWN28EF/TDgZZdFGAKopdCMjdOvIk05rZUMZ9+Xnj
   QOI3OsfscmHn/dsemTJB4asMsxd2sW0GOlTTiW8+nUJMUQvI++i1xsxzo
   9eiK0616uF6qw3m5rAyMVzfycbTn/Wx2vDzJovgmtW1eDOtIPN5vECLrH
   DTwkpZPPg1rVSIfI236OD73pg0DqRmexDthP7KWkEQyhX5EsrhtNfQD/+
   Q==;
X-CSE-ConnectionGUID: FbrTqfkCR8acNeTANwC/qg==
X-CSE-MsgGUID: xWJHRUpCTFWVbBU1wecbZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496329"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:42 -0700
X-CSE-ConnectionGUID: vJ+Z+jw4QFWaf+OVdJb2IA==
X-CSE-MsgGUID: vi0DAftlScqNxdQpzHrNQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763485"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 98252121E4C;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wAR-0APL;
	Wed, 25 Mar 2026 12:58:19 +0200
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 10/22] media: v4l2-subdev: Refactor returning routes
Date: Wed, 25 Mar 2026 12:58:06 +0200
Message-ID: <20260325105818.1176816-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56984-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FAB33237BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor returning the routes by adding a new function that essentially
does a memcopy and sets the number of the routes in the routing table.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 34 +++++++++++++--------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..f8fde395a53a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -629,6 +629,19 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 			     v4l2_subdev_get_unlocked_active_state(sd);
 }
 
+static void copy_routes_state_to_routing(struct v4l2_subdev_routing *routing,
+					 const struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route *routes =
+		(struct v4l2_subdev_route *)(uintptr_t)routing->routes;
+	u32 copy_routes = min(routing->len_routes, state->routing.num_routes);
+
+	for (u32 i = 0; i < copy_routes; i++)
+		routes[i] = state->routing.routes[i];
+
+	routing->num_routes = state->routing.num_routes;
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
@@ -1010,13 +1022,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
-		krouting = &state->routing;
-
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       krouting->routes,
-		       min(krouting->num_routes, routing->len_routes) *
-		       sizeof(*krouting->routes));
-		routing->num_routes = krouting->num_routes;
+		copy_routes_state_to_routing(routing, state);
 
 		return 0;
 	}
@@ -1084,11 +1090,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		 * the routing table.
 		 */
 		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
-			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-			       state->routing.routes,
-			       min(state->routing.num_routes, routing->len_routes) *
-			       sizeof(*state->routing.routes));
-			routing->num_routes = state->routing.num_routes;
+			copy_routes_state_to_routing(routing, state);
 
 			return 0;
 		}
@@ -1102,11 +1104,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (rval < 0)
 			return rval;
 
-		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
-		       state->routing.routes,
-		       min(state->routing.num_routes, routing->len_routes) *
-		       sizeof(*state->routing.routes));
-		routing->num_routes = state->routing.num_routes;
+		copy_routes_state_to_routing(routing, state);
 
 		return 0;
 	}
-- 
2.47.3


