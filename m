Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26D276D9F0
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 23:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbjHBVra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 17:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbjHBVrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 17:47:08 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193643A86
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691012791; x=1722548791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r/SIjrwUReb/l+aDUKCinWddolNalKr3CmKEm3N7G3M=;
  b=XpYIASzBv1foEU3LRJQ8ZsilEW0xJZuzGjTMUGte3wnrlbOdWFE4HgjJ
   BuNYdqmlb9/1SQaFzJlhz0ZeuygsmRw3cON3n1x9tGQ6HeUjO6YimLAdh
   kQzUyYahDFK2Dq459D0l5l20D6XmAJDXTVAAz3g1/Tr8WbOYuac+DTKCX
   I6cUe58TqqKpRGz3j93YGFSsJHDezDAsP8iQB7g9FkYkqucfRx2o6UBnt
   41V1zxDlhkqy8TUuou7Xd50//+gstGlIU/WggYTK0Oe71kQtGDeYJCLqI
   eYV9YwG/bvLR/8ZlcyUqx67B42E7ys7Qs02hiJP0J/uPM99ufMeWXx774
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372442055"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372442055"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853009323"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="853009323"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E17FC120BBB;
        Thu,  3 Aug 2023 00:46:00 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v2 3/9] media: mc: Add INTERNAL pad flag
Date:   Thu,  3 Aug 2023 00:45:50 +0300
Message-Id: <20230802214556.180589-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

