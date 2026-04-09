Return-Path: <linux-media+bounces-58415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEeGMgQJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A463CF43F
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3551B302541F
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB9133D6C0;
	Thu,  9 Apr 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IecPp4wN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436383368BF
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765729; cv=none; b=boV3yDb0FjBpZr3/jJyW38maJ/Lrgpca2DLs6dRdZ/PmY/CEqgVtZBrcBBAxNFCT/vrP51ZI5eZkcwUrBjovEX3X852gqUzCXHrC93iGNnnFcK7ywoBDRY7zVDOgfJoR6Kvsqkt/QvNIvhwBR+bbDQxRY0JU0n2k04sVPP1MdcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765729; c=relaxed/simple;
	bh=T5S2bvQj6fXB70DjJp8NzQpwZVtkHUorK2aq8hBMPc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vt3vLIqMXnlg4vypvHFb0Via8wkbGKQtATbxPOceqwzpbZDtwpE5DD+j49AyRLQuVV5w9LvBEDFylEGHVB/T58cDP8lnZS2JlOxWwhyT3uYjkOaolihDMicqmvPF165xYcFLYsy5M5u3PsOGOUX9Az306TYq8NoCds38xHG9X6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IecPp4wN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765728; x=1807301728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5S2bvQj6fXB70DjJp8NzQpwZVtkHUorK2aq8hBMPc0=;
  b=IecPp4wNYR7c2SLIlhsBiKmmqiMuewTKVn97GvjxdyeE38QF2G/ttWpF
   3oDC3TW1l4mQb9dj+eD0et1TuSMs3SaFL5UQ36DcfPPSPstZNAuDwMHer
   MC5Eh0CsELM3MjrS2gNgBm/fcdukjD6JrZRwJlWM/afK4DCBD+Vud4Cgs
   gvbq0aIbVJqHHBgh9UIa0frSMecNrVXdweC50eIUF2PvliMX6tKDQw7Ru
   WoX3Oumf/apQhoD3qNa50PiYY/sktJH8AmJCLymECBFkii5/p2BaVun3y
   blJqoSMCMESUR113fpO9j7qwdWRaKroOaWN6Qf3gXmgn5BkF+Zq9T4FA2
   Q==;
X-CSE-ConnectionGUID: CdG9X+hwShanhdHVdT6vLw==
X-CSE-MsgGUID: LaNTWYezRJSXj0lLRlh1pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176399"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:25 -0700
X-CSE-ConnectionGUID: yjlPaDXgQDSzHu99wZWX8g==
X-CSE-MsgGUID: WN13hxJ5TBWoE735dbpE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047515"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 713101226D1;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lp-3iFP;
	Thu, 09 Apr 2026 23:15:01 +0300
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
Subject: [PATCH v12 18/86] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
Date: Thu,  9 Apr 2026 23:13:53 +0300
Message-ID: <20260409201501.975242-19-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58415-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93A463CF43F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
Such routes cannot be changed and they're always active.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst         | 4 +++-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
 include/uapi/linux/v4l2-subdev.h                             | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 39c281991460..78842b9fbe67 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -571,7 +571,9 @@ internal pad always has a single stream only (0).
 Routes from an internal sink pad to an external source pad are created by the
 driver and can be activated and deactivated using the
 :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
-on the device capabilities.
+on the device capabilities. The :ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+<v4l2-subdev-routing-flags>` flag indicates that the
+``V4L2_SUBDEV_ROUTE_FLAG_ACTIVE`` of the route may not be unset.
 
 Interaction between routes, streams, formats and selections
 -----------------------------------------------------------
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 6f66ca38589e..2fd55d875075 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -146,6 +146,11 @@ wants to retrieve the missing routes, it can issue a new
     * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - 0x0001
       - The route is enabled. Set by applications.
+    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+      - 0x0002
+      - The route is immutable. Set by the driver. Indicates that the
+	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
+	unset.
 
 Return Value
 ============
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 6160c3e21436..2be7db814288 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -207,6 +207,11 @@ struct v4l2_subdev_capability {
  * on a video node.
  */
 #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
+/*
+ * Is the route immutable? The ACTIVE flag of an immutable route may not be
+ * unset.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
-- 
2.47.3


