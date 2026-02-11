Return-Path: <linux-media+bounces-52585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAuyH1NHjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:09:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B91228C2
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0650E3013015
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1172350A20;
	Wed, 11 Feb 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZC8H/dR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E995A354AEC
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800974; cv=none; b=UBI+gi8eUxYhb6AFpLd7djDMdlBOhqVtDMkIbv0Om+f/93MeTpNdllnyA5dD6V0FQ9TERn6wnbtP5hFxIMsJb3diW4ZrvWmPV/dpjIL6PCiNUzBsg3B6DG88Bxxz2SMCOLR6qk9DKq9WT9UjAa8FEM9JIMT2+3Bl46LudWbaI88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800974; c=relaxed/simple;
	bh=kQM/gZXkdLQkqzqbGgSDI6BKLPHZfSYPNyuJcC/rPBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQQXLp6gUA/xNdq9WgovOI4IS8JvFOFsg0zAIiCLBfgPIGF/3esj2FyK8CqbLuPHjB1QGF+7wwLitqFBY1in18dKJTHHJFjtMZ89o3g6tx40FAGMMxKx4KSCspsEtn2jbvB4E4HN3RvsiYnU7DmZ/x1XMhnTn29KfFKBRyAv3J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZC8H/dR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770800973; x=1802336973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kQM/gZXkdLQkqzqbGgSDI6BKLPHZfSYPNyuJcC/rPBM=;
  b=ZZC8H/dRNSDmbVnlQAzoB06RVSZeq5wGnGRQ//GmVG6TX7tTZmqulh35
   6F/YoQ+25ozO6jyN+FyqMCZVrJE5DOF1nq7pJjf95oBMis1/xVjpg6V0L
   FmNFWiPV0V2K8jvdw77ZjS70SZALUBXuu9enZ3xwAestHlrUYys64Q++x
   R2WMgTzYdGfN3l7gwBUH6oUrsGAs0AlPjSHIy6ScTCx45GRpzpaUNJ48a
   o8UrWruwaAAULJCoiqtnChKhf8aeNNw2ZYPDcPfI5PtZ3nqvIFU7DWeUM
   HpOloH1Mj0t0S69lWQB13AnZezJf12bhhG+shcl9lVWMn0eBGcUKqYHvn
   w==;
X-CSE-ConnectionGUID: AuYqopG8SiSyySMtEX+aLQ==
X-CSE-MsgGUID: 5adSrco3Sb6e0XXYAsBn/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72019005"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72019005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:32 -0800
X-CSE-ConnectionGUID: Wkt982z6Qr6zFuhXRxFsbg==
X-CSE-MsgGUID: CYM9hcXjQESyzVtqpBMzdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212222862"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:24 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B78EE121D4B;
	Wed, 11 Feb 2026 11:09:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vq6Do-00000007la8-2Ur4;
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
Subject: [PATCH v2 06/14] media: mc: Separate single link validation into a new function
Date: Wed, 11 Feb 2026 11:09:12 +0200
Message-ID: <20260211090920.1851141-7-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52585-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE9B91228C2
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


