Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62676F8A6F
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 22:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbjEEUyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 16:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbjEEUyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 16:54:23 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C900849E8
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683320062; x=1714856062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=My7wpgvZx5fc0K7pQR1f5jN3NedhZW+uRRqLM5TdxFo=;
  b=GyNMLkynclH4uxT5xN4nb9e2EPD4v5BFRPElLArDPZ6f7VEzKK5mzpDn
   5RPXP5A9EEobWi736GcjtUe6W1HUy6uwaJUUup+t7NS9z2oWubgjff4ZJ
   Y9hIpDBXODteS/KES0y6WroC0I7o9rw6CFLhkfj3MGorjKC4m7PPoerSG
   djgeKPXCp9dHderfiHRlJDdu+vpqgpAJmfXZ4RtfiSOJqUYlS+H3mtx8L
   Se8YyDdpdAgMeBRXfY8NKLaNqrZODGjTC8I4Vy3hGIGZzR5BRyMLprQ1t
   heVwkC9jMuVgpU6VMPnNh5co+Jltu+w/L1Fwnj77uU0uwpgEhzJXM37G5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414842205"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="414842205"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="767265300"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="767265300"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 13:54:20 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 91436120945;
        Fri,  5 May 2023 23:54:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     bingbu.cao@intel.com
Subject: [PATCH 1/2] media: uapi: Make media_entity_get_fwnode_pad() fwnode argument const
Date:   Fri,  5 May 2023 23:54:15 +0300
Message-Id: <20230505205416.55002-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230505205416.55002-1-sakari.ailus@linux.intel.com>
References: <20230505205416.55002-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fwnode_graph_parse_endpoint() fwnode argument is now const, therefore make
media_entity_get_fwnode_pad() fwnode argument const as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 2 +-
 include/media/media-entity.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index c1bc48c4d239..5ea9d3e5d59b 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1426,7 +1426,7 @@ struct media_pad *media_pad_remote_pad_unique(const struct media_pad *pad)
 EXPORT_SYMBOL_GPL(media_pad_remote_pad_unique);
 
 int media_entity_get_fwnode_pad(struct media_entity *entity,
-				struct fwnode_handle *fwnode,
+				const struct fwnode_handle *fwnode,
 				unsigned long direction_flags)
 {
 	struct fwnode_endpoint endpoint;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index e4f556911c3f..2b6cd343ee9e 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1079,7 +1079,7 @@ struct media_pipeline *media_pad_pipeline(struct media_pad *pad);
  * Return: returns the pad number on success or a negative error code.
  */
 int media_entity_get_fwnode_pad(struct media_entity *entity,
-				struct fwnode_handle *fwnode,
+				const struct fwnode_handle *fwnode,
 				unsigned long direction_flags);
 
 /**
-- 
2.30.2

