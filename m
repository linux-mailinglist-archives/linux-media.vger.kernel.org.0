Return-Path: <linux-media+bounces-56985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEwtIrTBw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E891D3237C3
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E30CA305C48D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155943C73EA;
	Wed, 25 Mar 2026 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFMVP/1I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8933C5DC4
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436326; cv=none; b=fBxK2iezKP72/LzT3xWQUikxCJT9AUxVASsTw3p9NWppV6I5na1Fm2+8FmsCdbqt15V9pdqoxp6LpD3icJ8NuS9AoCREG7HyWyvM9PtJJidNMe4ew9Kl0u7ZK3VQY4WrBBOGx+tWzpDoqmcWd0GrEDOoV5J4eA9Hi4elz0UKDFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436326; c=relaxed/simple;
	bh=YlSpV75Lex/EOsT6TeF6z7ZdLFILOmWHShbtZaBuY20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhAHM+uqZSXgcC3ayBCJ/TrwF9YkZ5tkBLZQvqp7ZCGTO/xjYl6iStsV8jMCWhpPVZ8U3fHHUHM9WLYDbMdQZI1O4f9Ku8ipKlVLEx204ZCVb2R5nG8aoyBAlMKM2fKzknrlvVZv8uDIe6lTCcDKy3xpV270y4Waoma84rKjqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFMVP/1I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436325; x=1805972325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YlSpV75Lex/EOsT6TeF6z7ZdLFILOmWHShbtZaBuY20=;
  b=SFMVP/1IC/jPUccezDdM6MNmB9iTWkHdH6piPJUdQfNI0M3pbuMRN8Uc
   OXtnRuobs7L4dE+i53tbLxSshW7ERyRXq3u+DWI8FLacE5pe+ASoawkTY
   4AJJvGj+cpaIGAmEYXX1GARUTmqtXptVeSnWcRLq7h1q4zRCQpeauzjgX
   wMuVN24zroxSqIVoaUuFzdf0hG+OKFnFSnoF1S4TP5PauW9qcEfHvpBqx
   ZgkXDJVo4fvAV+YeSgYlCxtobBnWXJxn67FulXO1bUy20XIZeHMBIOc/r
   Ay1ItjKVfYkum+mgK1dZTK8aeE/516VzK80W6ilTEoJ4qm9qcXPLFRsYy
   Q==;
X-CSE-ConnectionGUID: iHObEB65QOy0yKlsYLYSiw==
X-CSE-MsgGUID: vkesNR5fQXm1CtADbJ7ZAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496340"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:42 -0700
X-CSE-ConnectionGUID: aGZqbIWnRzimZJMs+aFJHQ==
X-CSE-MsgGUID: 3tjRxNrqT7GTVyOsLcfjlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763487"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AA21212231C;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wAd-0MHk;
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
Subject: [PATCH v3 13/22] media: mc: Separate single link validation into a new function
Date: Wed, 25 Mar 2026 12:58:09 +0200
Message-ID: <20260325105818.1176816-14-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56985-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E891D3237C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new function __media_pipeline_validate_one() to validate a single
link in a pipeline. This will soon be used for performing validation in
multiple phases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 74 ++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 6bf4730b89d2..717569bd1a8c 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -768,6 +768,45 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
+static int
+__media_pipeline_validate_one(struct media_pad *origin,
+			      struct media_pad *pad, struct media_link *link,
+			      bool *has_enabled_link)
+{
+	struct media_device *mdev = origin->graph_obj.mdev;
+	struct media_entity *entity = pad->entity;
+	int ret;
+
+	/* Return here if the link is disabled. */
+	if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+		return 0;
+
+	if (has_enabled_link)
+		*has_enabled_link = true;
+
+	/* Skip validation if the current pad isn't the sink pad of the link. */
+	if (link->sink != pad)
+		return 0;
+
+	if (!entity->ops || !entity->ops->link_validate)
+		return 0;
+
+	ret = entity->ops->link_validate(link);
+	if (ret) {
+		dev_dbg(mdev->dev,
+			"Link '%s':%u -> '%s':%u failed validation: %d\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index, ret);
+		return ret;
+	}
+
+	dev_dbg(mdev->dev, "Link '%s':%u -> '%s':%u is valid\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	return 0;
+}
+
 __must_check int __media_pipeline_start(struct media_pad *origin,
 					struct media_pipeline *pipe)
 {
@@ -838,39 +877,10 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 			if (link->sink != pad && link->source != pad)
 				continue;
 
-			/*
-			 * Ensure the link is enabled and if so, record
-			 * it. Proceed to the next link if the current pad isn't
-			 * the sink pad of the link.
-			 */
-			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
-				continue;
-
-			has_enabled_link = true;
-
-			if (link->sink != pad)
-				continue;
-
-			if (!entity->ops || !entity->ops->link_validate)
-				continue;
-
-			ret = entity->ops->link_validate(link);
-			if (ret) {
-				dev_dbg(mdev->dev,
-					"Link '%s':%u -> '%s':%u failed validation: %d\n",
-					link->source->entity->name,
-					link->source->index,
-					link->sink->entity->name,
-					link->sink->index, ret);
+			ret = __media_pipeline_validate_one(origin, pad, link,
+							    &has_enabled_link);
+			if (ret)
 				goto error;
-			}
-
-			dev_dbg(mdev->dev,
-				"Link '%s':%u -> '%s':%u is valid\n",
-				link->source->entity->name,
-				link->source->index,
-				link->sink->entity->name,
-				link->sink->index);
 		}
 
 		/*
-- 
2.47.3


