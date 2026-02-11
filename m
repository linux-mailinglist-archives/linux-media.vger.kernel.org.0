Return-Path: <linux-media+bounces-52588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAvQFYxHjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B97D21228FB
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 858423069ADD
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8EB354AF3;
	Wed, 11 Feb 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeyHSKl3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E331350D7E
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800977; cv=none; b=KQeT+nHgUy6uwDmoMHb90mR3ix3PeILYim+bkL73/jql7lVn5hxu/ExOBGq2Wl8jzjVg5AuhQSnpWkl3a0jSVzfR3Aw93UcfVOgiyvpJIDMqaL2/g963jLI18bAFWD2/lUWjR0CT9ojaMxFJHrZnhl5TcF7zfsIGwcwXsnPhOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800977; c=relaxed/simple;
	bh=OlTLK0CqCzBB4WeAVR7jvxv1ulQBxGgpjsvrv0hIQjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1Yphcx55Lkgr+z/8Gw0tPCcAjykPXD3RCinrFvh3m7Iwgive7vJbMhQ5d7BaZl3Blx9D1H0Gt60RpOZf93oy8+8YKmcOnLhe9yCyHHG/pVWcfN374hHHvxBKfPr1pE6QRqUBOsnNsw4iM/WXeoC5UbmmTIUTMxNJbXB832lNso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeyHSKl3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770800976; x=1802336976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OlTLK0CqCzBB4WeAVR7jvxv1ulQBxGgpjsvrv0hIQjY=;
  b=XeyHSKl3NCt/SfF70jmaifuitou1vciS4qSeU+n2RsOXbNNxSrBhA2PW
   WOXPw7PF6F3BMCX9IOzIXie7U3kEw/COofPRVu9hbC1I12LyvjrotENgD
   jwmPyhgx7/ZG5KYLpNGTZLY4g1b75SU4d1ZF6Zn0vmfMGwwjLcy5K6SMC
   Qm+7vSGxkeDxqoFBVC8q68WZIVXA4Oq/N7zpVdiRgScJd0a+GY16Rk/uN
   put/dUqlHnTRH6+RpL7T4v4BevwHdBeabuRW+02b1DOrTyfMQgc7hMl/k
   u5W5lZ0taFXAkk8ZxAanykZC/BhEIMaxJ9Ku4tz5nmCVVM4SvOo6+iW9R
   w==;
X-CSE-ConnectionGUID: OuOgynpXTw234iEVuRU5kw==
X-CSE-MsgGUID: cvd8k+ASQQaTVq+QP/r9kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72019041"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72019041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:32 -0800
X-CSE-ConnectionGUID: N/RJ/kZdTn2S37SSV3qkBA==
X-CSE-MsgGUID: gUu1ki2wSD+jeNSLeHcZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212222861"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:24 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B594B121D4A;
	Wed, 11 Feb 2026 11:09:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vq6Do-00000007la4-2RCe;
	Wed, 11 Feb 2026 11:09:20 +0200
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
Subject: [PATCH v2 05/14] media: v4l2-subdev: Refactor returning routes
Date: Wed, 11 Feb 2026 11:09:11 +0200
Message-ID: <20260211090920.1851141-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52588-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B97D21228FB
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


