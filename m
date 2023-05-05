Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8DC46F8A69
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 22:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbjEEUvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 16:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbjEEUvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 16:51:10 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC4B4EFF
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683319869; x=1714855869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5pBhdVLsjBvV23LtAYJ/Lqj+fpSnmsQVgSjUXYNeuMI=;
  b=B/FS+5e0mWInhA/aQx/Z2AV6u0TEXKO5NHRrIAuklYc8vnCFqG0CPnNT
   IdiP9cg910wYOIQ/8OT1c2iNY+zkUQizl+gQivCJ2xaT76AkIa85/av27
   OcntABYUqOG5inScI/WfLM+vZfu7kNyD8te+b6I2shgsywIXWnZefYpg4
   aND/FolpO5bFjZOD6TGdCIZGu319nIJmkh8WMSiFj4lxD69PWvedIw9/q
   AeOV6qCP9uJxAatJ+e0tStAz/tpZTF9yjBbK+UE5qhOgG4oFW1jeMMlge
   ddPu/SkAaXHso+lK2Wq5cctKRGVTQXZbvtz1YXOTYjC1hE8YIHsbW+5Qi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352346075"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="352346075"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="762602663"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="762602663"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:51:06 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 14310121525;
        Fri,  5 May 2023 23:51:03 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com
Subject: [PATCH 3/3] media: uapi: Use unsigned int values for assigning bits in u32 fields
Date:   Fri,  5 May 2023 23:51:01 +0300
Message-Id: <20230505205101.54569-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
References: <20230505205101.54569-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use unsigned int values annoted by "U" for u32 fields. While this is a
good practice, there doesn't appear to be a bug that this patch would fix.

The patch has been generated using the following command:

	perl -i -pe 's/\([0-9]+\K <</U <</g' -- include/uapi/linux/media.h

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/media.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 3ddadaea849f..edb8dfef9eba 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -140,8 +140,8 @@ struct media_device_info {
 #define MEDIA_ENT_F_DV_ENCODER			(MEDIA_ENT_F_BASE + 0x6002)
 
 /* Entity flags */
-#define MEDIA_ENT_FL_DEFAULT			(1 << 0)
-#define MEDIA_ENT_FL_CONNECTOR			(1 << 1)
+#define MEDIA_ENT_FL_DEFAULT			(1U << 0)
+#define MEDIA_ENT_FL_CONNECTOR			(1U << 1)
 
 /* OR with the entity id value to find the next entity */
 #define MEDIA_ENT_ID_FLAG_NEXT			(1U << 31)
@@ -205,9 +205,9 @@ struct media_entity_desc {
 	};
 };
 
-#define MEDIA_PAD_FL_SINK			(1 << 0)
-#define MEDIA_PAD_FL_SOURCE			(1 << 1)
-#define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
+#define MEDIA_PAD_FL_SINK			(1U << 0)
+#define MEDIA_PAD_FL_SOURCE			(1U << 1)
+#define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
@@ -216,14 +216,14 @@ struct media_pad_desc {
 	__u32 reserved[2];
 };
 
-#define MEDIA_LNK_FL_ENABLED			(1 << 0)
-#define MEDIA_LNK_FL_IMMUTABLE			(1 << 1)
-#define MEDIA_LNK_FL_DYNAMIC			(1 << 2)
+#define MEDIA_LNK_FL_ENABLED			(1U << 0)
+#define MEDIA_LNK_FL_IMMUTABLE			(1U << 1)
+#define MEDIA_LNK_FL_DYNAMIC			(1U << 2)
 
 #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
-#  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
-#  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
-#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
+#  define MEDIA_LNK_FL_DATA_LINK		(0U << 28)
+#  define MEDIA_LNK_FL_INTERFACE_LINK		(1U << 28)
+#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2U << 28)
 
 struct media_link_desc {
 	struct media_pad_desc source;
@@ -293,7 +293,7 @@ struct media_links_enum {
  * struct media_device_info.
  */
 #define MEDIA_V2_ENTITY_HAS_FLAGS(media_version) \
-	((media_version) >= ((4 << 16) | (19 << 8) | 0))
+	((media_version) >= ((4U << 16) | (19U << 8) | 0))
 
 struct media_v2_entity {
 	__u32 id;
@@ -328,7 +328,7 @@ struct media_v2_interface {
  * struct media_device_info.
  */
 #define MEDIA_V2_PAD_HAS_INDEX(media_version) \
-	((media_version) >= ((4 << 16) | (19 << 8) | 0))
+	((media_version) >= ((4U << 16) | (19U << 8) | 0))
 
 struct media_v2_pad {
 	__u32 id;
@@ -432,7 +432,7 @@ struct media_v2_topology {
 #define MEDIA_INTF_T_ALSA_TIMER                (MEDIA_INTF_T_ALSA_BASE + 7)
 
 /* Obsolete symbol for media_version, no longer used in the kernel */
-#define MEDIA_API_VERSION			((0 << 16) | (1 << 8) | 0)
+#define MEDIA_API_VERSION			((0U << 16) | (1U << 8) | 0)
 
 #endif
 
-- 
2.30.2

