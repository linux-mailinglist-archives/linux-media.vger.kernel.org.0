Return-Path: <linux-media+bounces-52301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJcXCTLphWkLIQQAu9opvQ
	(envelope-from <linux-media+bounces-52301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5078EFDF49
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E526300D0A9
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529D73D9043;
	Fri,  6 Feb 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eW3UGreu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBBE3D7D73
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383625; cv=none; b=aHin0W0dkQ7r1uaKJoinNcs/dAx2kpAKeXTisGK5ePThNNJOLRBR1cwjm2gxcolVdKNJSw0u+B95VOJZxiED62NIa7M91zbfJLGfh4SlEMEm7aICQldnidxCBs28VRyRA+hq03w44wUO50dWeLHaPABYMC7ZSGtCJHEtuuVDSG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383625; c=relaxed/simple;
	bh=kQM/gZXkdLQkqzqbGgSDI6BKLPHZfSYPNyuJcC/rPBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuwXXJOzHLDwHHtL2oI2kbY9fHy4sarfAlrLDFvS2poSg8BdO8vdNEbTA556rmYc/4V0RvjegzQ4nKtrjyFpqdnJXGFIP1KjTeoona+2agdtzjZvlrQtncsoGCPVBnhn98xt5zzDeqCurnQBQqXCuWuvfkwi8xs3cGd8XzU5qDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eW3UGreu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383626; x=1801919626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kQM/gZXkdLQkqzqbGgSDI6BKLPHZfSYPNyuJcC/rPBM=;
  b=eW3UGreuO0dbciBvhhUwsdaA34ykntTWKbbebuP1yS/S//uMgUuWvAae
   faP2faaS6PYqoU7EkMLICwwGSlIEVjbAV/mdtjjpzDXram97e9GFffa58
   lCzCPBl+wtbOw0SAWFJqNxoQK41TTelFZXo87UyXkjq7maW+PBwmCbTnu
   cudXeSKVcZ0WUC8CzesCm2Lx8iYvyE97f+aFPCyrfz0T/+6yNl3bWUDql
   LIzhpfk9dm65Le0+3RIjV1Bv9FBNpR5Jokg2uPGdTa+2ED0MZuQu7shwV
   H5z7F9NcUntyeCDCaODICkaJgDCLh6MsOvzDvqZ/vHMtyh8YBYAvtwDlq
   Q==;
X-CSE-ConnectionGUID: P4qIdleLRB25NES+loTl9Q==
X-CSE-MsgGUID: k6ZpE4cxQWaPztPej2LnHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441254"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441254"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:44 -0800
X-CSE-ConnectionGUID: vtH5Ya+iR/OGj78S2JWBZw==
X-CSE-MsgGUID: JAEh2DKeQW+MuCpCqvOcaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391305"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:38 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 73618121E22;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005TsO-1I0c;
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
Subject: [PATCH 06/13] media: mc: Separate single link validation into a new function
Date: Fri,  6 Feb 2026 15:13:23 +0200
Message-ID: <20260206131329.1306429-7-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-52301-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5078EFDF49
X-Rspamd-Action: no action

Add a new function __media_pipeline_validate_one() to validate a single
link in a pipeline. This will soon be used for performing validation in
multiple phases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 80 +++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 33 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 9519a537bfa2..ef959e9bb313 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -768,6 +768,49 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
+static int
+__media_pipeline_validate_one(struct media_pad *origin,
+			      struct media_pipeline *pipe,
+			      struct media_pad *pad, struct media_link *link,
+			      bool *has_enabled_link)
+{
+	struct media_device *mdev = origin->graph_obj.mdev;
+	struct media_entity *entity = pad->entity;
+	int ret;
+
+	/* Record if the pad has links and enabled links. */
+	if (link->flags & MEDIA_LNK_FL_ENABLED && has_enabled_link)
+		*has_enabled_link = true;
+
+	/*
+	 * Validate the link if it's enabled and has the
+	 * current pad as its sink.
+	 */
+	if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+		return 0;
+
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
@@ -838,40 +881,11 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 			if (link->sink != pad && link->source != pad)
 				continue;
 
-			/* Record if the pad has links and enabled links. */
-			if (link->flags & MEDIA_LNK_FL_ENABLED)
-				has_enabled_link = true;
-
-			/*
-			 * Validate the link if it's enabled and has the
-			 * current pad as its sink.
-			 */
-			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
-				continue;
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
+			ret = __media_pipeline_validate_one(origin, pipe,
+							    origin, link,
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


