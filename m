Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3437D6B242C
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjCIM2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjCIM2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:28:16 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872C7E1C80
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678364895; x=1709900895;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UtTmCgHupJ+hImF/+YBHCqqgh95ITYLtA1s6b0w/TrE=;
  b=F5shBe2f7LpRq6HZZ0hGlrTLMRBqWtEEMfu5qlVZEHXjhkoffYHw7M//
   MSbT9f02qzYFPxn7bqU0zyPJOWdC07PJ19eMtE70mIeHG9McnxnJX9anF
   1J7MgvVnWByo9amhK7uMfLGWBEaHEMHFdTdIkjEsoqBQCWSz/C12NC3Qh
   WlDEeMzaUSaXtBwvqHdzxEd2RZghGwXUlvmt1lKe6eXr/7WFDBzMPiB4u
   BMYN9OMXw2zA3Cq1NUn09R5jSnCORTG/TmiAng5f1lcM/I5HkOM1GczMA
   vdtph05tgdc6wppnd0Nzz/u89ungQEVQwxW+3+S4MSVR3JTbKmm6gb/+C
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="335135437"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="335135437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:28:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746306592"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="746306592"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:28:07 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C6E48122D85;
        Thu,  9 Mar 2023 14:28:04 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1paFMk-006oWc-K5; Thu, 09 Mar 2023 14:27:26 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        hdegoede@redhat.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Date:   Thu,  9 Mar 2023 14:27:16 +0200
Message-Id: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Link validation currently accesses invalid pointers if the link passed to it
is not between two sub-devices. This is of course a driver bug.

Ignore the error but print a debug message, as this is how it used to work
previously.

Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1bebcda2bd20c..dd911180ec899 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1209,6 +1209,17 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	struct v4l2_subdev_state *source_state, *sink_state;
 	int ret;
 
+	if (!is_media_entity_v4l2_subdev(link->sink->entity)) {
+		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
+			     link->sink->entity->name);
+		return 0;
+	}
+	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
+		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
+			     link->source->entity->name);
+		return 0;
+	}
+
 	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
 	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
 
-- 
2.30.2

