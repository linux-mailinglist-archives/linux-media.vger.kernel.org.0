Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 423106F8BA5
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 23:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbjEEVxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 17:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbjEEVxG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 17:53:06 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5E34C29
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 14:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683323585; x=1714859585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NP1l/tnRjqy3OjQxoOH+KSpm+18ukdCogG2Ir80SSkI=;
  b=T50WOirzLWwgaqlWT4//fx3EQIEVHQ2qLQnAAB1iHGe8E/NXREflh/5i
   XTjQc37vLF5cIPMVZIfZbAOcQVgR8By4H9R3xCK8OSazTLi5z4KS3PdUK
   WAP0X4coKMVef55S6YCsgFkHerut7U50m+iPiXNUUD0u9xh/X5WTuZ44l
   TLKtTWzAfy8VTYETpWNQXc/kxKIe0Uj4dVvp4zXEbo2gJjewkmO389n3k
   4hShMXSexFUL6qX7TEbyPAWbYYejGF2vkZsebJXC36COsEInvzvTTYAO5
   m0ejX4u0RNRlm/yDapM/DJz7iRrYDp78yIWV4T360rk3pjPjHsbeO1e2X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328925833"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="328925833"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700626124"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="700626124"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:53:02 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 81D5312244C;
        Sat,  6 May 2023 00:52:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Date:   Sat,  6 May 2023 00:52:51 +0300
Message-Id: <20230505215257.60704-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
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
 .../userspace-api/media/mediactl/media-types.rst          | 7 +++++++
 drivers/media/mc/mc-entity.c                              | 8 +++++++-
 include/uapi/linux/media.h                                | 1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 0ffeece1e0c8..c724139ad46c 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL-SOURCE:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -382,6 +383,12 @@ Types and flags used to represent the media graph elements
 	  when this flag isn't set; the absence of the flag doesn't imply
 	  there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL_SOURCE``
+       -  This flag indicates an internal pad that has no external
+	  connections. Such a pad may not be connected with a link. The internal
+	  flag indicates that the stream either starts or ends in the
+	  entity. For a given pad, the INTERNAL_SOURCE flag may not be set if
+	  either SINK or SOURCE flags is set.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index ef34ddd715c9..ed99160a2487 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1062,7 +1062,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL_SOURCE)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1087,6 +1088,11 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(sink->pads[sink_pad].flags &
+		    MEDIA_PAD_FL_INTERNAL_SOURCE) ||
+	    WARN_ON(source->pads[source_pad].flags &
+		    MEDIA_PAD_FL_INTERNAL_SOURCE))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index edb8dfef9eba..0e2577e8b425 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL_SOURCE		(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.30.2

