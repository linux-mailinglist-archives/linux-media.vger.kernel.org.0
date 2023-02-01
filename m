Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66816687094
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjBAVp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjBAVpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:54 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC1966EEB
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287951; x=1706823951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gRnTqFdSnV/PtsbR89EbHPCsvx9fLVJgjrTdVHvFkGQ=;
  b=TVcy/+/vWPxLt9MSUNep+Gv3vDFyy7WK+ye60Oozojsap7/mUvoMVRdh
   kkOhW+h8EHPJby8IzHXzT67qDVB49Ss2cCuJ/u3KBrq/Nb7hy1QOVgSCy
   aA6rYDepQ/rP+ZwK5A9skYztJFXL8qdlaYOBtqi71ZIILl1q3VBmGzdXv
   WBhhwxL4QT3MYez962bJ2clA9iMdZ9LR0bPAKjhQk85idDefBMwEcWHU7
   JyltbehTj/qphvht5wY/iGXiee65uW8Gm9jpDa0y4Pq6Bl5becPctoZJe
   NrLMcYSoQZCtU5N7wwuhDKxismwv1/rKlKTnvyGIs+NwlAB5d186gFG3a
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415632"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415632"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527303"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527303"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:45 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1C37212276E;
        Wed,  1 Feb 2023 23:45:43 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 08/26] media device: Drop nop release callback
Date:   Wed,  1 Feb 2023 23:45:17 +0200
Message-Id: <20230201214535.347075-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The release callback is only used to print a debug message. Drop it. (It
will be re-introduced later in a different form.)

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-device.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 5c2e65717c19..64cc6921a8bc 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -570,11 +570,6 @@ static DEVICE_ATTR_RO(model);
  * Registration/unregistration
  */
 
-static void media_device_release(struct media_devnode *devnode)
-{
-	dev_dbg(devnode->parent, "Media device released\n");
-}
-
 static void __media_device_unregister_entity(struct media_entity *entity)
 {
 	struct media_device *mdev = entity->graph_obj.mdev;
@@ -722,7 +717,6 @@ int __must_check __media_device_register(struct media_device *mdev,
 	/* Register the device node. */
 	mdev->devnode.fops = &media_device_fops;
 	mdev->devnode.parent = mdev->dev;
-	mdev->devnode.release = media_device_release;
 
 	/* Set version 0 to indicate user-space that the graph is static */
 	mdev->topology_version = 0;
-- 
2.30.2

