Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB66B74436A
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 22:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjF3Unw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 16:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbjF3Unu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 16:43:50 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669C23C29
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 13:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688157829; x=1719693829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r/SIjrwUReb/l+aDUKCinWddolNalKr3CmKEm3N7G3M=;
  b=T5ljduepHRFJenSWEQLo5wSc5xrlmuHMqAJ6Ht/O8mdqTdGCO7M2jxoU
   AFfjeHv+Od9DZ/lFlPObRb3pC19Lmoy82FlHbNZLaJmIIxyKH34IkHzG4
   DjCdO/asJyyEBDBIqWIp9ZY8jSUkUrb8HV1f8TwxAYR1FkmFLRie/r8wY
   /jLo4rgh8tEz1lYsjotR/5LfzQGoC20Zsbb8+PaZr9/+9nRJwrwG6lC4z
   RW54ev002Lhubo/QNj9z8UEO1Uss2clopa1XKgl7P0CPKII6bkoP8ac08
   +lelZAnyQDZLiUE7t7svkvcpAI2LvkzKxPNYsni1RZ1Chzmt2ey03c9U5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="448866695"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="448866695"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841987171"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841987171"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:48 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5814A12078C;
        Fri, 30 Jun 2023 23:43:43 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: [PATCH 2/7] media: mc: Add INTERNAL pad flag
Date:   Fri, 30 Jun 2023 23:43:33 +0300
Message-Id: <20230630204338.126583-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.

Also prevent creating links to pads that have been flagged as internal.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/glossary.rst             | 6 ++++++
 Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
 drivers/media/mc/mc-entity.c                               | 6 +++++-
 include/uapi/linux/media.h                                 | 1 +
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 96a360edbf3b..f7b99a4527c7 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -173,6 +173,12 @@ Glossary
 	An integrated circuit that integrates all components of a computer
 	or other electronic systems.
 
+_media-glossary-stream:
+    Stream
+	A distinct flow of data (image data or metadata) over a media pipeline
+	from source to sink. A source may be e.g. an image sensor and a sink
+	e.g. a memory buffer.
+
     V4L2 API
 	**V4L2 userspace API**
 
diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 0ffeece1e0c8..28941da27790 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
 	  when this flag isn't set; the absence of the flag doesn't imply
 	  there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. Such a pad shall not be connected with a link. The
+	  internal flag indicates that the :ref:``stream
+	  <media-glossary-stream>`` either starts or ends in the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 4991281dcccc..03a9e0b8ebab 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1071,7 +1071,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1094,6 +1095,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE &&
+		    source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
 
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

