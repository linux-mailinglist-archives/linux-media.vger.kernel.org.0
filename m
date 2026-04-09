Return-Path: <linux-media+bounces-58412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO++CQQJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBD23CF431
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26BF23014882
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FC233DEFC;
	Thu,  9 Apr 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWhSEqpd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F3233DEDF
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765729; cv=none; b=PipEpCXixtWOPNtbrlInvQBq6Nw1XbMXbGyUb/RPmsOPqg3QD5+wyLP7cVCjrWvaaJg3BhlgYj041hiHpo5lKwPOExs2lIAAGWRonRKDCz8vN+p3KnXIEOCbydrypVJDeKYRdc/YMrOlWvS99p7Edpe0xfnIpCF+lzK8vx67378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765729; c=relaxed/simple;
	bh=kmtiAEu6HA5CdtdAB70EkgffD8Xh1bX0O5Gxv5wjkqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiiJ+aagS5f4syL5e8EBHcA7IR87cOfputZxKCDFzkJ85efL+EdbYgnFYcJ0HhEIgJAKPhX34m0njADkS3IxUz5ZKwdchwLryj7EcqyG9lHnIpaOI0VsfY+tU8YvPQP4mNIsO+oq1eflQWMLLBvqWx+woVtBZFtPQyhxTb7ZIU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWhSEqpd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765726; x=1807301726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kmtiAEu6HA5CdtdAB70EkgffD8Xh1bX0O5Gxv5wjkqI=;
  b=MWhSEqpdnjCmYn7MpnlhkHTHEqPS/OvbS01MGx4QYYwjrVpRgKEaWVli
   +eH4T8XmXSHIxBjTjFi651lsOD5cp8JqWLHGWaueP2s5kSqseWsfT7vE4
   wGFoLNVQVJoLEO88Lzmc0Vjm9mZnpL5vbP5boO1DoKa5DRx8NjDAYZAH9
   25mAO8XZK1HG0jgApaZazs8y+uweJJEMziSr564tWRYHYMAOaZAJ0RX3q
   maNqkB7uMCzQbaj+sSeg2L6en5vKLqNh0Ih/2L1vGRjburzlJuFu5SkZ7
   XBxhg7pAzhk/FJ6D5RgrTWM0OkRO2Eoc4RIlryX5AQ00mASk1Uk9BwMDq
   A==;
X-CSE-ConnectionGUID: j3ZzuRk2SbSS+77m0EpJTg==
X-CSE-MsgGUID: vL+c4jLCSM20E8tzLJGEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176388"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:25 -0700
X-CSE-ConnectionGUID: EBk31lqBR1OzlfdEkkfUIQ==
X-CSE-MsgGUID: c/u+OXnNSHGGqLPYerN2Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047516"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 744281226DE;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lt-3m7P;
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
Subject: [PATCH v12 19/86] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_STATIC sub-device routing flag
Date: Thu,  9 Apr 2026 23:13:54 +0300
Message-ID: <20260409201501.975242-20-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58412-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCBD23CF431
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a flag to denote static routes, V4L2_SUBDEV_ROUTE_FL_STATIC. Such
routes cannot be removed as they are related to hardware features.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst     | 6 +++++-
 include/uapi/linux/v4l2-subdev.h                            | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 2fd55d875075..e99c83d21165 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -150,7 +150,11 @@ wants to retrieve the missing routes, it can issue a new
       - 0x0002
       - The route is immutable. Set by the driver. Indicates that the
 	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
-	unset.
+	unset. Implies ``V4L2_SUBDEV_ROUTE_FL_STATIC``.
+    * - ``V4L2_SUBDEV_ROUTE_FL_STATIC``
+      - 0x0004
+      - The route is static. Set by the driver. Indicates that the route is
+        always present and cannot be removed.
 
 Return Value
 ============
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 2be7db814288..477d3ce3ddb4 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -212,6 +212,10 @@ struct v4l2_subdev_capability {
  * unset.
  */
 #define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
+/*
+ * Is the route static? Routes with the STATIC flag are not removable.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_STATIC		(1U << 2)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
-- 
2.47.3


