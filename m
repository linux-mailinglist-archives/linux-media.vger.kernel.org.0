Return-Path: <linux-media+bounces-58259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGSdCpN31mm9FggAu9opvQ
	(envelope-from <linux-media+bounces-58259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:43:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 814713BE635
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 260AA3080784
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9143D8138;
	Wed,  8 Apr 2026 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkk92LZT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD03A3A2579
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662823; cv=none; b=Osl9FaortDNzkF/iEOhlAYNMm4bkWYu1yvyebiB88D7E+Aflg+Xexyh6Chjc0LS9CoygJpnbLt2Xuaz7hLgF/3jNU+y57K4KHATai74VvgbAXnmHQ+yWpAjz7kcP4b2h6mB7ff5vlPRYbgDzBYTQdi2LwoYZbTtR2nSmHbnVi8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662823; c=relaxed/simple;
	bh=d6ewd0OgnjdCKMEMQLVVi5WVY9nK65gp+GsUlIM3QjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSJVJ1UuvBNrPVusR3r9cvRv98jVlE+xJU121U+IAW+SQ/n2M0vzmMn+Cebg8NfRAq30TQR4SBsXejaKOL0c1EZmvBlFjQNsyjEaN7cNpqQlQkS4S2NRsM6JxYHOPZ6OeuHYGxdzfPedmNfTBQynDmbHM67/fPj7lI7f1bEV8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkk92LZT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662820; x=1807198820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d6ewd0OgnjdCKMEMQLVVi5WVY9nK65gp+GsUlIM3QjM=;
  b=hkk92LZTwZD/mo4E4Rl++IRdN7rUNESHu5IBROuF44o6UPBDuLS8nojK
   x7MU3X+N5FJ0Cy5X+WnpbPuiLSE2EvzJIXsNwIvwU4F7O1dWWHW/YoqOs
   0YbT4ZhrTFl6K6RxQl2sk2/JGTjbRXXYggHmoCx7NkICXQX7PphvXxgTF
   8B+zY0J5gfpEgiwzxTvYyX+uBWIqEK7vyc/XnrdX9tmSFNztuJC9Qg9MD
   CxhnmaBy1e4qWjEJWCgTSNXdUh5L/KotEVxZj8wiJE2cFwA3Nxht2M7FP
   7JyCPEz0GU4+Ab9ualA4Uw0vLGh6/c/i4LLiDjqDhhzl/540upVZN/lgc
   g==;
X-CSE-ConnectionGUID: U5021tn6Rz+WA0VHHjYYpA==
X-CSE-MsgGUID: 8vJ/otGXRROO7SGH7EMm8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038479"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:01 -0700
X-CSE-ConnectionGUID: hpRdWruSSg25XTv6SJC7dA==
X-CSE-MsgGUID: R+KzmNenTOmTgFmm1/liLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740387"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 341DA1220BA;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044De-2dKz;
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
Subject: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in MEDIA_IOC_LINK_SETUP
Date: Wed,  8 Apr 2026 18:39:30 +0300
Message-ID: <20260408153939.969381-22-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58259-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.938];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 814713BE635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
flags that are set by the driver are correctly set as the driver expects.
This poses a problem for adding new flags as programs could not work with
links that have unknown flags even when the use of these flags wouldn't
affect the program.

Ignore the non-settable link flags.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 717569bd1a8c..287eded356bb 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1319,7 +1319,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
 
 int __media_entity_setup_link(struct media_link *link, u32 flags)
 {
-	const u32 mask = MEDIA_LNK_FL_ENABLED;
+	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
 	struct media_device *mdev;
 	struct media_pad *source, *sink;
 	int ret = -EBUSY;
@@ -1327,9 +1327,9 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 	if (link == NULL)
 		return -EINVAL;
 
-	/* The non-modifiable link flags must not be modified. */
-	if ((link->flags & ~mask) != (flags & ~mask))
-		return -EINVAL;
+	/* Only allow changing user-settable flags. */
+	flags &= settable_flags;
+	flags |= link->flags & ~settable_flags;
 
 	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
 		return link->flags == flags ? 0 : -EINVAL;
-- 
2.47.3


