Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2534704D53
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 14:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbjEPMFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 08:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbjEPMFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 08:05:31 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A7149DC
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 05:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684238729; x=1715774729;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e6tv+E2xti9q/2bG6FKz4Hw+IAFefXgb4pG0FB7G0hM=;
  b=YDyWQJ7Y8rRbKMyRkMofFbN4tAw60F1Ol7zar1nhYQ8HaQmd0SqVsNlz
   7C2/ro3dNQ1R+ascmW6sONrhIiO83ZB4vu/ShucjEGN2dZBCPzUVw9vvr
   tRjOkD2qJ7eqh7ysl+xg4/ANCdjiiprSSRlTwCdfGm/RKfVzBDXrifQch
   BYWE3NpcDTOQE0mGLNxRd1SOcRualt7tA9Rh4F/p5JPZ3NuEjniuPkQ21
   GwHpoR4PH//PbPZF2C+b4xGhjG2pBq4HBaK0HiHeE48v1LkGo+StU6QE3
   VNORsFISXG/arWl+HPuy6O4FbVEWGCkwMhinNW2ysBh5z9XGfjNXWPQM9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437799641"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="437799641"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 05:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="771011614"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="771011614"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 05:05:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EE6E0120279
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 15:05:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pytQb-002ZLj-OK
        for linux-media@vger.kernel.org; Tue, 16 May 2023 15:05:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 1/1] media: uapi: Use unsigned int values for assigning bits in u32 fields
Date:   Tue, 16 May 2023 15:05:07 +0300
Message-Id: <20230516120507.612494-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Use unsigned int values annoted by "U" for u32 fields. While this is a
good practice, there doesn't appear to be a bug that this patch would fix.

The patch has been generated using the following command:

The patch has been generated using the following command:

	perl -i -pe 's/\([0-9]+\K <</U <</g; s/\|\s*0\K\)/U\)/' \
		include/uapi/linux/media.h

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/uapi/linux/media.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 3ddadaea849f9..1c80b1d6bbaf3 100644
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
+	((media_version) >= ((4U << 16) | (19U << 8) | 0U))
 
 struct media_v2_entity {
 	__u32 id;
@@ -328,7 +328,7 @@ struct media_v2_interface {
  * struct media_device_info.
  */
 #define MEDIA_V2_PAD_HAS_INDEX(media_version) \
-	((media_version) >= ((4 << 16) | (19 << 8) | 0))
+	((media_version) >= ((4U << 16) | (19U << 8) | 0U))
 
 struct media_v2_pad {
 	__u32 id;
@@ -432,7 +432,7 @@ struct media_v2_topology {
 #define MEDIA_INTF_T_ALSA_TIMER                (MEDIA_INTF_T_ALSA_BASE + 7)
 
 /* Obsolete symbol for media_version, no longer used in the kernel */
-#define MEDIA_API_VERSION			((0 << 16) | (1 << 8) | 0)
+#define MEDIA_API_VERSION			((0U << 16) | (1U << 8) | 0U)
 
 #endif
 
-- 
2.30.2

