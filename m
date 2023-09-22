Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7299F7AB375
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjIVOW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234252AbjIVOWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:22:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE18AB
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392568; x=1726928568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kn0wzA+uAt7xFQzvaxyZOJ5t8GgKMQyISUwz6L8y9gw=;
  b=n0R84EwPcTdVGHENsfUBNRTuT4bMq3waGXOmBPJj/mgz7dCeD481mM7K
   7RAYzvrE5uYphtSFNAxYj7f2T7SzjeTI09XzezKvB+0Fy7R+uvVB/GkiR
   BVg5mD9yLAFS17HcrNyeUgHKCLaoYcdVgB18Fd7orJDEG8eSQLLx0CjzH
   3MEkbI07ufdbpRHc5lFOBvQbmqc3bkY0zUWgn2f4GmpgM6TOdSrhsbkTR
   JbWjM8wd178XhhWbeo/ygffkosLrejxAuB2Lu5N7qNx3diJCEu5tXC4Q8
   OQe3fOsdZAzlxoxPc/2tYcX32WvQf1yid3XoF978LUMLhrPJXsr2oUSYe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360218828"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360218828"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741112332"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741112332"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:22:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4A868120810;
        Fri, 22 Sep 2023 17:22:41 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 01/23] media: mc: Add INTERNAL pad flag
Date:   Fri, 22 Sep 2023 17:22:17 +0300
Message-Id: <20230922142239.259425-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.

Also prevent creating links to pads that have been flagged as internal and
initialising source pads with internal flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/glossary.rst         |  6 ++++++
 .../userspace-api/media/mediactl/media-types.rst       |  6 ++++++
 drivers/media/mc/mc-entity.c                           | 10 ++++++++--
 include/uapi/linux/media.h                             |  1 +
 4 files changed, 21 insertions(+), 2 deletions(-)

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
index 543a392f8635..f5f290781021 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		iter->index = i++;
 
 		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+					     MEDIA_PAD_FL_SOURCE)) != 1 ||
+		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
+		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1075,7 +1077,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1100,6 +1103,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(source->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
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

