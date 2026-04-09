Return-Path: <linux-media+bounces-58437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIekFTYK2Gm5WggAu9opvQ
	(envelope-from <linux-media+bounces-58437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A53CF6D4
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2822F30963B9
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3275134AAF7;
	Thu,  9 Apr 2026 20:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgBJWAas"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EEA346A08
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765735; cv=none; b=SnUbIIVXsAOpthUZX0qltvJ2/aihRaECGj6yJrFk32RBnvRgyl5xm7hfspd/yzFnxR1OcU6dXWDQfyuL+6VC7vsu0UWSUmNmaWTyRNoliJTuUBxGl9XEIyhPpnotFmZjzaO6lidxA4grWKYPGZaNDpTSbYoOuyfjekIf+Bdu/Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765735; c=relaxed/simple;
	bh=ntMlB8k4iMpkSdxXBR7Sy3KrR/fO+j3pgfSdMGM/Ce8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C2rq9dWSgBYrxhQIvTdh/kTbpObzIa0OzWkuU9RqmyslFaxIO29tsaREYniJ3cvIc8phvF8N36EPyFSGsZTwzxib6ghctuLdY3InjQaHLLCogCqAJQV/ZeWc+5HxZ34dSgA3Z9hFbz2BztQttu3pUzkgt9af8Iwfci4RXB2+huo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgBJWAas; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765734; x=1807301734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ntMlB8k4iMpkSdxXBR7Sy3KrR/fO+j3pgfSdMGM/Ce8=;
  b=PgBJWAas75ZvGObvc6NCrvUln1Lr7pdf4uH5cAZONWO9DylJ7olmnH9n
   zjrkWVMc40DJjXsUDesiEn6/WUedVmZv3FrCm/toStPGh1WTM3ExBsbDG
   aYMusUNjEAw7lPU1laOLkVsV9WFqBtZsGRID4b7EmkJ65dnWBlD5fbUrk
   NjD1MC8yMZ5YpycvxkGNbT78N70pKALzaaXDdfg0L3ci6vpeym/1wNxbx
   1oKgSUBS6mMkb8OIcz6WlT2PbxfNVqjqvCBfu6Cey0sRsmxFP21jpRaAD
   TmKcEaDSo+h7DyqfCznFfzY1fmvmFBUYjO/vn+lc3JBTyt6tL9O0+r6mb
   g==;
X-CSE-ConnectionGUID: qOaWEA8jS0mLQIVc6+u/MQ==
X-CSE-MsgGUID: q6JBh7OiRwC4Fsdj4JU8wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="94176518"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="94176518"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:26 -0700
X-CSE-ConnectionGUID: IzmbLgsZTsmTYIw3J8LhMw==
X-CSE-MsgGUID: VQORDjPtSmyzLuZ5mdfYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="228047538"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7A44F122734;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045m1-3twY;
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
Subject: [PATCH v12 21/86] media: Documentation: Document IMMUTABLE and STATIC route flags
Date: Thu,  9 Apr 2026 23:13:56 +0300
Message-ID: <20260409201501.975242-22-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58437-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,ideasonboard.com:email,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B75A53CF6D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Include the V4L2_SUBDEV_ROUTE_FL_IMMUTABLE and V4L2_SUBDEV_ROUTE_FL_STATIC
flags in V4L2 sub-device documentation that discusses routing.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst         | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 57bd44dbbeea..6b67f526f312 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -602,11 +602,15 @@ depending on the hardware. In all cases, however, only routes that have the
 ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set are active.
 
 Devices generating the streams may allow enabling and disabling some of the
-routes or have a fixed routing configuration. If the routes can be disabled, not
-declaring the routes (or declaring them without ``V4L2_SUBDEV_ROUTE_FL_ACTIVE``
-flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
-``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes back to the user in
-the routes array, with the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
+routes or have a fixed routing configuration. Routes that are bound to hardware
+resources and are always present are marked with ``V4L2_SUBDEV_ROUTE_FL_STATIC``
+flag. Static routes that cannot be disabled are marked with
+``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` route flag. Static routes can be disabled by
+not declaring the routes (or declaring them without
+``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set) in
+``VIDIOC_SUBDEV_S_ROUTING``. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such
+routes back to the user in the routes array, with the
+``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
 
 Devices transporting the streams almost always have more configurability with
 respect to routing. Typically any route between the sub-device's sink and source
-- 
2.47.3


