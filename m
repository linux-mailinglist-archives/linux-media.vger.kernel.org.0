Return-Path: <linux-media+bounces-56998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8COQGh7Aw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:59:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A232368F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 351C1305366B
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D12D3CA483;
	Wed, 25 Mar 2026 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3Tq72Co"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D33CA492
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436338; cv=none; b=hXYjcMpLnkmrY+G+Ay3py8zXMumRgHyF8+UjhNN8aXyhb/3QejQMh5w36P0HrknjDEakvyZ32dJhIaArQ7C3Yj/jh0oQ+PJg0Oyin9t4d1DRQjv4XJn4U79lp2Z5s9n2wi+BXVyqSYS9lbuV1sBVyN5ax/TSmjrWb5vJkQi37dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436338; c=relaxed/simple;
	bh=y8zTeLJ9tc/06iYjwMNwGz02GzlJ1WD4QBgEnKc9F6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0qNUNMhtg6e4BJdm2GHceVCH03LiQPtdx1ijZhgivIZvigLBoQOTjqDB/ffKaigCMkDpILGdGosOoOiYFaQf+x3NEevCRM5UN8LAGYrGDetVtrMqxw5y8hMlczX2EutZZeU/HMTUw4XNLf+sOkW2MJ76Gmh+OsatcO6xbYB0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3Tq72Co; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436335; x=1805972335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y8zTeLJ9tc/06iYjwMNwGz02GzlJ1WD4QBgEnKc9F6E=;
  b=H3Tq72Co41UXBp1gMzg+DhX5YanamAAAfBQfS/M3POdcK61id5Wyyfg8
   rKkniQZfvQGcek8hHC2WGV6ziRoG5rhTNb10lHlH64+dfttcmidOPOhhR
   IHAFM2oMIoK7AIsQB2j6crZwkQb8EdZEG+KBDE3V8tihoRGZn2/OeELQW
   8Kj4LRFGJWlnD3XnS8nqGqBLeweWf9uyjdxA3lwaQEm3Gu8gCZhPaZwCQ
   QiJlNUbeTsj/R9bgMeIFp20x1asT2HjwfjWsJ+9lMutJa8/9YsXNE4EMU
   caNrcz59BIOw+LL8kcteVORQi50s0hukOJ2fXRZmgkDikYyFnNlgZtp2Y
   Q==;
X-CSE-ConnectionGUID: 0SCchw78RhOY7G+KbzL7sw==
X-CSE-MsgGUID: JTaMvaZqTDyR9YfZpQrXZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496500"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:50 -0700
X-CSE-ConnectionGUID: me+r6jFsTfyRh7m6ZwjS9A==
X-CSE-MsgGUID: z8D8lKGQQ4CtUheeujpHiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763545"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:43 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B66E61224A5;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wAt-0g9j;
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
Subject: [PATCH v3 16/22] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
Date: Wed, 25 Mar 2026 12:58:13 +0200
Message-ID: <20260325105818.1176816-18-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56998-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 188A232368F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add MEDIA_LNK_FL_VALIDATE_LATE flag to support late validation of links.
This is serving the use case where video devices are configured and
started streaming indepenently of each other but this sequence may be run
in series, in such a way that a video device in a pipeline starts
streaming before another one is configured.

Before this flag, drivers have resorted to implementing the link
validation separately for the video nodes as part of streaming start
sequence.

media_pipeline_start() shall be called on each leaf entity connected to
the graph with a link where MEDIA_LNK_FL_VALIDATE_LATE is set before
uphardware operation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/mediactl/media-ioc-setup-link.rst   |  4 +
 .../media/mediactl/media-types.rst            |  5 ++
 drivers/media/mc/mc-entity.c                  | 82 ++++++++++++++++++-
 include/uapi/linux/media.h                    |  1 +
 4 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
index 23208300cb61..7c2bced57e77 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
@@ -49,6 +49,10 @@ Only links marked with the ``DYNAMIC`` link flag can be enabled/disabled
 while streaming media data. Attempting to enable or disable a streaming
 non-dynamic link will return an ``EBUSY`` error code.
 
+Pipeline validation may be delayed for links marked with the ``VALIDATE_LATE``
+flag until actual hardware operation even if the rest of the pipeline would be
+validated at an earlier point of time.
+
 If the specified link can't be found the driver returns with an ``EINVAL``
 error code.
 
diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..d6a690655a01 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -391,6 +391,7 @@ must be set for every pad.
 .. _MEDIA-LNK-FL-ENABLED:
 .. _MEDIA-LNK-FL-IMMUTABLE:
 .. _MEDIA-LNK-FL-DYNAMIC:
+.. _MEDIA-LNK-FL-VALIDATE-LATE:
 .. _MEDIA-LNK-FL-LINK-TYPE:
 
 .. flat-table:: Media link flags
@@ -410,6 +411,10 @@ must be set for every pad.
        -  The link enabled state can be modified during streaming. This flag
 	  is set by drivers and is read-only for applications.
 
+    *  -  ``MEDIA_LNK_FL_VALIDATE_LATE``
+       -  The validation of the link may be delayed up to until the start of
+	  hardware operation.
+
     *  -  ``MEDIA_LNK_FL_LINK_TYPE``
        -  This is a bitmask that defines the type of the link. The following
 	  link types are currently supported:
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 287eded356bb..bb639ce4d86e 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -771,7 +771,7 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 static int
 __media_pipeline_validate_one(struct media_pad *origin,
 			      struct media_pad *pad, struct media_link *link,
-			      bool *has_enabled_link)
+			      bool *has_enabled_link, bool skip_validation)
 {
 	struct media_device *mdev = origin->graph_obj.mdev;
 	struct media_entity *entity = pad->entity;
@@ -784,6 +784,9 @@ __media_pipeline_validate_one(struct media_pad *origin,
 	if (has_enabled_link)
 		*has_enabled_link = true;
 
+	if (skip_validation)
+		return 0;
+
 	/* Skip validation if the current pad isn't the sink pad of the link. */
 	if (link->sink != pad)
 		return 0;
@@ -825,11 +828,48 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 		return -EINVAL;
 
 	/*
-	 * If the pipeline has already been started, it is guaranteed to be
-	 * valid, so just increase the start count.
+	 * Increase start count on pipelines that have been validated
+	 * earlier. Also check links with the VALIDATE_LATE flag here.
 	 */
 	if (pipe->start_count) {
+		struct media_link *link;
+
+		link = __media_entity_next_link(origin->entity, NULL,
+						MEDIA_LNK_FL_DATA_LINK);
+		if (link && link->flags & MEDIA_LNK_FL_VALIDATE_LATE) {
+			struct media_link *link2 =
+				__media_entity_next_link(origin->entity, link,
+							 MEDIA_LNK_FL_DATA_LINK);
+			bool has_enabled_link = false;
+
+			/*
+			 * Only a single pad is allowed for VALIDATE_LATE
+			 * links. That pad needs to have exactly one link.
+			 */
+			if (origin->entity->num_pads != 1)
+				return -EINVAL;
+
+			if (!link || link2)
+				return -EINVAL;
+
+			dev_dbg(mdev->dev,
+				"Validating pad '%s':%u late\n",
+				origin->entity->name, origin->index);
+
+			ret = __media_pipeline_validate_one(link->sink,
+							    link->sink, link,
+							    &has_enabled_link,
+							    false);
+			if (ret)
+				return ret;
+
+			if (origin->flags & MEDIA_PAD_FL_MUST_CONNECT &&
+			    !has_enabled_link)
+				return -ENOLINK;
+		}
+
 		pipe->start_count++;
+
 		return 0;
 	}
 
@@ -873,12 +913,19 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 		 * the connected sink pad to avoid duplicating checks.
 		 */
 		for_each_media_entity_data_link(entity, link) {
+			/* Skip late-validated links not connected to origin. */
+			bool skip_validation =
+				link->flags & MEDIA_LNK_FL_VALIDATE_LATE &&
+				(link->sink == origin ||
+				 link->source == origin);
+
 			/* Skip links unrelated to the current pad. */
 			if (link->sink != pad && link->source != pad)
 				continue;
 
 			ret = __media_pipeline_validate_one(origin, pad, link,
-							    &has_enabled_link);
+							    &has_enabled_link,
+							    skip_validation);
 			if (ret)
 				goto error;
 		}
@@ -1158,6 +1205,33 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
 
+	/*
+	 * With the late validate flag, either source or sink shall have exactly
+	 * one pad and no links before this one. Similarly, no links may be
+	 * added to entities with a single pad and an existing late-validated
+	 * link.
+	 */
+	if (flags & MEDIA_LNK_FL_VALIDATE_LATE) {
+		if (!(source->num_pads == 1 && !source->num_links) &&
+		    !(sink->num_pads == 1 && !sink->num_links))
+			return -EINVAL;
+	} else {
+		struct media_entity *entities[] = { source, sink };
+
+		for (unsigned int i = 0; i < ARRAY_SIZE(entities); i++) {
+			if (entities[i]->num_pads != 1)
+				continue;
+
+			struct media_link *__link =
+				__media_entity_next_link(entities[i], NULL,
+							 MEDIA_LNK_FL_DATA_LINK);
+
+			if (__link &&
+			    __link->flags & MEDIA_LNK_FL_VALIDATE_LATE)
+				return -EINVAL;
+		}
+	}
+
 	link = media_add_link(&source->links);
 	if (link == NULL)
 		return -ENOMEM;
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..c96e2118ea99 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -219,6 +219,7 @@ struct media_pad_desc {
 #define MEDIA_LNK_FL_ENABLED			(1U << 0)
 #define MEDIA_LNK_FL_IMMUTABLE			(1U << 1)
 #define MEDIA_LNK_FL_DYNAMIC			(1U << 2)
+#define MEDIA_LNK_FL_VALIDATE_LATE		(1U << 3)
 
 #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
 #  define MEDIA_LNK_FL_DATA_LINK		(0U << 28)
-- 
2.47.3


