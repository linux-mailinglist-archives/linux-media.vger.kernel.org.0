Return-Path: <linux-media+bounces-9577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB08A74EE
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C37AB2234F
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BC913AA5A;
	Tue, 16 Apr 2024 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqPIuI9Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4C813AA51
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296045; cv=none; b=UdqKEUqxRs+BFngJNtuRvFTME4Fq+Kac1V6oEmJseAFhiG5vKi4qHRdTRbFf0pF1yzF7ZLb6bUVQuJUbdhbMOEqxYJEit3IPS/OPlFMms3SrJ6Yd0+iKdcvPb9yt3YzZdbwfCaqc3+RFFjcZ+jPKjiUDNL55EjuCAEYeKRzEduw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296045; c=relaxed/simple;
	bh=Hf9rHKTR4G7S2fczstF3r4KeIMsUp19YtMkP9Xh7thU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IFkAi8KzUwxN1w7g7dYxQuNyBm4x6/5rO2SFsbJYVICJSWG6yxwr9U/MakHclLZnEH9aGm5/x1/TBhzhF70covQZ0xgg+SCwlAAQMT1N3R7Qw8PZtPg++nRbL2O+POAWaTDqCn0c11Hi60Knuc4IOWk/77Pl2eK0YM8qSiQSX98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqPIuI9Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296044; x=1744832044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hf9rHKTR4G7S2fczstF3r4KeIMsUp19YtMkP9Xh7thU=;
  b=gqPIuI9QLJpCLpdLuGbPeNIQDuIIbPCRG/+HMeG929L0lDDhZXEK8+lu
   oD6SeMnzRTzQFeU6WG4FlbkDZ+Yj8bYWyBvXb2anTpsh6W2h1mGoqNwmb
   yTKJtqURdGxW23RAxp0CjEqqna6nqrMeFevz6n/OMRRuiPNuXlCr3a9aH
   P/QO0y4fix5nE9Q8QOaXIgoP9lWaEN/xxs2btE4V6yoP0zSURXMpLaRJR
   zND+kfDawTPMKaM85lhjkrXbNt0ZrWmuFNrsiWl4JMlXs5UgMqzXOGetg
   kLxqr/wzjzWIJg6WKpYLPvLkBMUchjT4B9c3HKax1YvR8rZeBBT3KsSXF
   g==;
X-CSE-ConnectionGUID: TUtsexymTciTps0bErDxfw==
X-CSE-MsgGUID: Bcv9EzrATnied8O/fDA5cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929825"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:03 -0700
X-CSE-ConnectionGUID: +lxYaFe4T9a6srscWVH6sA==
X-CSE-MsgGUID: l7YfWSaCQwKRVidiZgRCKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380205"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:00 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 509CD1204F6;
	Tue, 16 Apr 2024 22:33:57 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 26/46] media: mc: Add INTERNAL pad flag
Date: Tue, 16 Apr 2024 22:32:59 +0300
Message-Id: <20240416193319.778192-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal sink pads will be used as routing endpoints in V4L2 [GS]_ROUTING
IOCTLs, to indicate that the stream begins in the entity. Internal sink
pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/mediactl/media-types.rst  |  9 +++++++++
 drivers/media/mc/mc-entity.c                      | 15 ++++++++++++---
 include/uapi/linux/media.h                        |  1 +
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263..200c37a1da26 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,14 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. As they are internal to entities, internal pads shall not
+	  be connected with links.
+
+	  The internal flag may currently be present only in a sink pad where it
+	  indicates that the :ref:``stream <media-glossary-stream>`` originates
+	  from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 0e28b9a7936e..7747aa16f37e 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -209,11 +209,16 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		mutex_lock(&mdev->graph_mutex);
 
 	media_entity_for_each_pad(entity, iter) {
+		const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
+						     MEDIA_PAD_FL_SOURCE |
+						     MEDIA_PAD_FL_INTERNAL);
+
 		iter->entity = entity;
 		iter->index = i++;
 
-		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+		if (pad_flags != MEDIA_PAD_FL_SINK &&
+		    pad_flags != (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL) &&
+		    pad_flags != MEDIA_PAD_FL_SOURCE) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1112,7 +1117,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1142,6 +1148,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf..80cfd12a43fc 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.39.2


