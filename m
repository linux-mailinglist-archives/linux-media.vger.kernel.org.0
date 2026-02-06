Return-Path: <linux-media+bounces-52298-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED9BMzrphWnCHwQAu9opvQ
	(envelope-from <linux-media+bounces-52298-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68580FDF50
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1432305BD7A
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70AB3D902A;
	Fri,  6 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKlFnfpe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09B3D668B
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383625; cv=none; b=SEKXn8fOFJsbYJJTg/X57jUsJtIcY2wghRywYTjkKbjbTx+UX+hSgw0uVpeRSTBqV/smZE3tkDMbf0Kb+N/s/PGTgPbH/Fw43OcvMlTT1cWu5mQGoa0h0JqL9RPfJ6i3ujpn6G/g+UIorNuOjMhWsVV4ZlfgPngGoYXfvmo7pHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383625; c=relaxed/simple;
	bh=D2Y0Wyl7Zmidn5S05hOMSpy6zWgZ26n1xgPifjSYBvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVNmC0LLOtzt5gMXZZozObQ+0gYDZOKqjZ13i+28QGUNVQgQana4VIJrNDpHQi2aOjIJI9k7kj53+H6nCodjO1WnE0cC35TrSlCndEqHU/yyO8Q/5VFOcj8/Gt5cvsgMod4DOS0Xe9OEe+Lp9zlKmrdwMgEoA/m16XSMVBaJIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKlFnfpe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383625; x=1801919625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D2Y0Wyl7Zmidn5S05hOMSpy6zWgZ26n1xgPifjSYBvw=;
  b=dKlFnfperA3PDkXhZGKxhf4XhQ9dbZ3icpVyZA3kkE+VKMa2rzgK+HSI
   Nh7PGn7/BWiF44Qlxf9UVAztOdcaE+AhStmO7SnAq717jwnez72eZaph6
   S7pcsZA+vBqrNqrhR0i3dLEPUxPHAHuaTzzzJ2KKj1jlqEal7jJoiwhVn
   bgc9OdK435a0iakVi/7n6ucf5cee/c9TjBkoZhyWCm7rfcSBkdAxokE6R
   UUts1p7KWgNbx9CEpfXWJytIzns5FAHMuNVW58uyeSUQDxabZsNZlTNTB
   6Sra7z2JJH/ZygPoSpo/k/YE/qxJKWTtceCSifGJxoEhyWiHdao3JOjt/
   Q==;
X-CSE-ConnectionGUID: vZXzUhksTqmLNQT2eNye5Q==
X-CSE-MsgGUID: eOdtbb9aS5+z999Bl1EXpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441235"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441235"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:44 -0800
X-CSE-ConnectionGUID: WXxM/iBlSTugl0zRmvowpg==
X-CSE-MsgGUID: hGu3PSWmQjKHznndJfCs3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391300"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:38 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7647F121E8F;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005TsS-1NlE;
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
Subject: [PATCH 07/13] media: mc: Add MEDIA_LNK_FL_VALIDATE_LATE
Date: Fri,  6 Feb 2026 15:13:24 +0200
Message-ID: <20260206131329.1306429-8-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-52298-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68580FDF50
X-Rspamd-Action: no action

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
 .../media/mediactl/media-ioc-setup-link.rst   |  4 ++
 .../media/mediactl/media-types.rst            |  5 ++
 drivers/media/mc/mc-entity.c                  | 58 ++++++++++++++++++-
 include/uapi/linux/media.h                    |  1 +
 4 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
index 23208300cb61..7a9a43c71cde 100644
--- a/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
+++ b/Documentation/userspace-api/media/mediactl/media-ioc-setup-link.rst
@@ -49,6 +49,10 @@ Only links marked with the ``DYNAMIC`` link flag can be enabled/disabled
 while streaming media data. Attempting to enable or disable a streaming
 non-dynamic link will return an ``EBUSY`` error code.
 
+The ``VALIDATE_LATE`` flag is used to signal that the validation of the link may
+be delayed until actual hardware operation even if the rest of the pipeline
+would be validated at an earlier point of time.
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
index ef959e9bb313..b29b519237d6 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -772,7 +772,7 @@ static int
 __media_pipeline_validate_one(struct media_pad *origin,
 			      struct media_pipeline *pipe,
 			      struct media_pad *pad, struct media_link *link,
-			      bool *has_enabled_link)
+			      bool *has_enabled_link, bool skip_validation)
 {
 	struct media_device *mdev = origin->graph_obj.mdev;
 	struct media_entity *entity = pad->entity;
@@ -782,6 +782,9 @@ __media_pipeline_validate_one(struct media_pad *origin,
 	if (link->flags & MEDIA_LNK_FL_ENABLED && has_enabled_link)
 		*has_enabled_link = true;
 
+	if (skip_validation)
+		return 0;
+
 	/*
 	 * Validate the link if it's enabled and has the
 	 * current pad as its sink.
@@ -833,7 +836,24 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 	 * valid, so just increase the start count.
 	 */
 	if (pipe->start_count) {
+		struct media_link *link;
+
+		link = __media_entity_next_link(origin->entity, NULL,
+						MEDIA_LNK_FL_DATA_LINK);
+		if (link && link->flags & MEDIA_LNK_FL_VALIDATE_LATE) {
+			dev_dbg(mdev->dev,
+				"Validating pad '%s':%u late\n",
+				origin->entity->name, origin->index);
+
+			ret = __media_pipeline_validate_one(link->sink, pipe,
+							    link->sink, link,
+							    NULL, false);
+			if (ret)
+				return ret;
+		}
+
 		pipe->start_count++;
+
 		return 0;
 	}
 
@@ -881,9 +901,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 			if (link->sink != pad && link->source != pad)
 				continue;
 
+			/* Skip late-validated links not connected to origin. */
+			bool skip_validation =
+				link->flags & MEDIA_LNK_FL_VALIDATE_LATE &&
+				(link->sink == origin ||
+				 link->source == origin);
+
 			ret = __media_pipeline_validate_one(origin, pipe,
 							    origin, link,
-							    &has_enabled_link);
+							    &has_enabled_link,
+							    skip_validation);
 			if (ret)
 				goto error;
 		}
@@ -1163,6 +1190,33 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
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


