Return-Path: <linux-media+bounces-64096-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2TNrIM7oJWr9NQIAu9opvQ
	(envelope-from <linux-media+bounces-64096-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:55:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5A651C62
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 23:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=edw0CqDi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64096-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64096-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C470302B0BA
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 21:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E7C31F99A;
	Sun,  7 Jun 2026 21:54:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA662DF3F2
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 21:54:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780869268; cv=none; b=ubmSmU59+4o3N99oK7GVTFAXNB54MkITTYEZMSagh6DRl7sbAtjZRHpAlexksxFFrfg1ygrzc69QbjxetGJHOZ50QUc2SFqeNHMlNjSwatDoNnLUBzJjioota1Qfaf4ysO1hYVjgJEnQNVgGR6D23KHzeg0AyQFzBl90OaN2TBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780869268; c=relaxed/simple;
	bh=r+YOsKv552MX84HC0a8qWXuncWHHFimPvYo7i/Sc/Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsK1ln89oJdxenr0HsBw0Tv/RYQ14IGfXXwUJMLIeJtmXqf1EGQ522wjGxAToHXx42bgQYjpKklZ5r4gScEG+HdqvUb1qnY4fg/AfWpjv7LUZ74vLX7/7Orql2tLR7PGpmxpOeV4ugo0BNCxSPiH+25lGsULBthgA0pQ4xsVdMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edw0CqDi; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780869267; x=1812405267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r+YOsKv552MX84HC0a8qWXuncWHHFimPvYo7i/Sc/Ew=;
  b=edw0CqDiJkXrLywsUWCNXGwoTtQR7tMCKIhV7zEUFOHR/kTeSow++snp
   Uh6rJe5jXPwZxd5UY6pmVfbIMieHch6LtPGQfYGo7bhQgMUO1xDNhqxEv
   I503KFljPfh+itLZ5YdutZ5lNy402vHt/fYgnMWdofEHWz2ZUnxnew6Jl
   3EgYio+gmLd7uILmhg1wiMacfQMiiwoKXLe2Zt8u7nF6X/3/38Kkzj04u
   y787Vf+nYjYFJt+vD68+/7MckUsA7QRwpTa+tqi5R9cedSgOU0TaBgWQK
   NXsWjZbv/Gxr4gYSGP+s8mHn4KytKkpZx/+WCDvn8k1Sud55CU1QLti1I
   w==;
X-CSE-ConnectionGUID: HMW91/BHTcCPabsOnOgYuQ==
X-CSE-MsgGUID: I6yopAcOQyC8J1Z0w33U5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107048353"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="107048353"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:24 -0700
X-CSE-ConnectionGUID: CbJeToTLTE6g1wgVfb/pag==
X-CSE-MsgGUID: /LfZKu6qTdav8wUwdBZ0cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="245490512"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.101])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 14:54:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B8003121CDB;
	Mon, 08 Jun 2026 00:54:07 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wWLRM-00000003XIh-1655;
	Mon, 08 Jun 2026 00:53:56 +0300
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
Subject: [PATCH v5 08/10] media: v4l2-subdev: Move subdev client capabilities into a new struct
Date: Mon,  8 Jun 2026 00:53:54 +0300
Message-ID: <20260607215356.842932-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-64096-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,linux.intel.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,nxp.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1A5A651C62

Add struct v4l2_subdev_client_info to hold sub-device client capability
bits that used to be stored in the client_caps field of struct
v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
pad operation callbacks for capability information. The main reason why
this is a new struct instead of a u64 field is that modifying the callback
arguments requires touching almost every sub-device driver and that is
desirable to avoid in the future, should more than the client capability bits
need to be known to the callbacks.

To be squashed to the previous patch.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
 include/media/v4l2-subdev.h           | 12 ++++++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index dc4ac08c210f..e4ac6981e950 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -634,7 +634,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (!(subdev_fh->client_caps &
+		if (!(subdev_fh->ci.client_caps &
 		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
 			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
@@ -673,7 +673,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
 	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
-	bool client_supports_streams = subdev_fh->client_caps &
+	bool client_supports_streams = subdev_fh->ci.client_caps &
 				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 	int rval;
 
@@ -1133,7 +1133,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
 		struct v4l2_subdev_client_capability *client_cap = arg;
 
-		client_cap->capabilities = subdev_fh->client_caps;
+		client_cap->capabilities = subdev_fh->ci.client_caps;
 
 		return 0;
 	}
@@ -1153,7 +1153,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
 					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
 
-		subdev_fh->client_caps = client_cap->capabilities;
+		subdev_fh->ci.client_caps = client_cap->capabilities;
 
 		return 0;
 	}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a25234befbe9..e83ef88fe12c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -741,6 +741,14 @@ struct v4l2_subdev_state {
 	struct v4l2_subdev_stream_configs stream_configs;
 };
 
+/**
+ * struct v4l2_subdev_client_info - Sub-device client information
+ * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
+ */
+struct v4l2_subdev_client_info {
+	u64 client_caps;
+};
+
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
@@ -1144,14 +1152,14 @@ struct v4l2_subdev {
  * @vfh: pointer to &struct v4l2_fh
  * @state: pointer to &struct v4l2_subdev_state
  * @owner: module pointer to the owner of this file handle
- * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
+ * @ci: sub-device client info related to this file handle
  */
 struct v4l2_subdev_fh {
 	struct v4l2_fh vfh;
 	struct module *owner;
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_state *state;
-	u64 client_caps;
+	struct v4l2_subdev_client_info ci;
 #endif
 };
 
-- 
2.47.3


