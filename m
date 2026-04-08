Return-Path: <linux-media+bounces-58262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB2IKKN31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:43:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FC3BE659
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BD52308C508
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BA03D6CDA;
	Wed,  8 Apr 2026 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRUWtPQm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488D3D34BB
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662826; cv=none; b=ZBmTHlsIeSuXUI6O+CMVyC81B8bOqLwu6Yo/a6dAj20X6Feq1q28hIec6SUqelxS25jf6tfz1DOz2E6vwoswE6PXiij8fcuX1ZXklkeiH6gTK+serChPjuGQsw7mfhcjpJFZofByZlrWSeeUpmdnTvKqWUIRD4dInKh0+VzJkr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662826; c=relaxed/simple;
	bh=KSMSdhZ6/yX1qgLA+n7Xqsg4MeLLRAz+lF3J9uYnp9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8QdqptCeW+6QlLwvToWc7oEoyCe7e3GJzFu1+rr30wcHDp8wV0lYa7cT9RSLSNynvYDYyzByB+WkLBfLKgM+VMUi8bMz2+kxeDBzoxx3FCEgHl4HRI9HXKwKxY8Ab39joveSshdxv0s/OzNHfo0SuuLqbXhIPcoixaes8IWp7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRUWtPQm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662824; x=1807198824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KSMSdhZ6/yX1qgLA+n7Xqsg4MeLLRAz+lF3J9uYnp9M=;
  b=DRUWtPQmh9LnudXyKZXtKAKIr43mPnhyFwQqM95ehtqHtzX3fFBG78F3
   GZDOAn6oQR3qNz+dOupSORwOBPaTzne85zTp5DACUV3/bXkXAxHAndL8L
   B1T+ayAy7Elm/jHu0VaP478aNbyctIDOI5Z4TmTkKDr7STHSJhn+ZJcIJ
   XVBgYlqZUwl18YPG3BhF1jn8i+3h4MQZQaBacL/M/UUnVExoVfCr6h3Fv
   4a3U98ApfNF9L0QrpZJCG6QvXhAvBSjwT/HqQij3heQ89M24d+59tfBZr
   hOyKKN7dY4mEfdkZhdUqAS8R4ekEUI0GhIWcVD5hZ0W5Kp/pvJ17FGrYg
   g==;
X-CSE-ConnectionGUID: wUauHaJjRRaO2LcYLNwWgA==
X-CSE-MsgGUID: SrfTLOwMRg6eW2bqdHCX8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038503"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:02 -0700
X-CSE-ConnectionGUID: JEqBnTC8TYyB1ZaYSpYNag==
X-CSE-MsgGUID: 0A9/IEbQTxmGQT9WhusvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740391"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 19637121FEE;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044DK-2FcC;
	Wed, 08 Apr 2026 18:39:39 +0300
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
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 16/29] media: v4l2-subdev: Refactor returning routes
Date: Wed,  8 Apr 2026 18:39:25 +0300
Message-ID: <20260408153939.969381-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
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
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58262-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,collabora.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.927];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 218FC3BE659
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor returning the routes by adding a new function that essentially
does a memcopy and sets the number of the routes in the routing table.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
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


