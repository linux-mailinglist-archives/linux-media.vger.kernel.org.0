Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784E16A8A1E
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 21:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjCBUW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 15:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCBUW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 15:22:26 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B090451F97
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 12:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677788545; x=1709324545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HFELZ9btV69DHFEm1chUjpxuZH+3MJ7sjTsFzkKxq/E=;
  b=njmoV/8Hx6hIjbi9/4Igedeu+DBuzfifM7vSKGe2ngKHztY6pE06eTVz
   WqvlcsyA8ljVAU0X27ALptieTDsQb898Sb7cGLzolMMZl+5Mx5G8WHfmC
   r4VW19VUxvw1cv20/+CEBncrXjgZaag9rWRu84Med2Bk1iDRXTLQlgsAn
   p5tgJFnzXnN1z8hXKzpyrkb0Qxe2uGfWP0qohSI6QN5QwnW03Nq39biRi
   G09ghZKqIXgflAT88okmKb6BHi5Ktmt8ZO3PTPfJt0so4dBo9hQlCGHo2
   fHjkZqoDnjILrOs+bGBiEn8wST6T+PTsJrYhqLLJAxaRnAMCefZ2DMxZ6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="334871294"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="334871294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="705398150"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="705398150"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 12:22:23 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BFABA1223BA;
        Thu,  2 Mar 2023 22:22:19 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org, hdegoede@redhat.com
Cc:     tomi.valkeinen@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Date:   Thu,  2 Mar 2023 22:22:19 +0200
Message-Id: <20230302202219.846011-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
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
---
Hi Hans,

Could you test this?

The bug is of course in the ImgU driver and this reverts to the old
pre-streams behaviour. It silently fails instead of oopsing. The ImgU driver
needs to be fixed and I think we could make this return an error at the same
time. Right now I can't be sure the ImgU driver is the only one suffering
from this, but if so, it's likely to be broken anyway.

- Sakari

 drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index dff1d9be7841..a6c80096586e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1224,6 +1224,17 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	struct v4l2_subdev_state *source_state, *sink_state;
 	int ret;
 
+	if (!is_media_entity_v4l2_subdev(link->sink->entity)) {
+		pr_debug("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
+			 link->sink->entity->name);
+		return 0;
+	}
+	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
+		pr_debug("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
+			 link->source->entity->name);
+		return 0;
+	}
+
 	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
 	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
 
-- 
2.30.2

