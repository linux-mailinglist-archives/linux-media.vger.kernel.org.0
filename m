Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A9A6B7216
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 10:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjCMJIw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 05:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjCMJI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 05:08:27 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8E01F5F9
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678698411; x=1710234411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P4a2pa3GBxcLhRJBVdWPcAIwur1JXjNKO6p0aW8xJUA=;
  b=dWopXtO9ur9uFICb6yzSmjo6NtrpbWDGgPjHaRwC+tv3McsTMAk+4D2J
   aTHFwoX6Wy3aWqen09jyJkd3GCax1x7U94qvSwNViFoypbNBKpgmBmhoT
   XzkTJ0LoJlWy6m7ZHbQ7yut4mLOfCaqdmPlukdxrXN46jmh8RoYRSQqyO
   uFYkBYG9itAKy/9IxAhVfkWu4baJSM/nS8VcaTezPLDt0stPL3oNITMin
   NbZozFgyeoeZQk4cKYvTIJeOGl+Wisph61WE8YVjPjUxr/mJqWJPcU3Zd
   UOPTT9NAiC3wcBuB7kL9uQqVg8jXjqsJnxTHkQQesYjo8XfxNUDlUwZwg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="334574584"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="334574584"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 02:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="671828557"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="671828557"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 02:06:49 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ECAD5120D10;
        Mon, 13 Mar 2023 11:06:46 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pbe82-00FTGa-LP; Mon, 13 Mar 2023 11:06:02 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        hdegoede@redhat.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 1/1] media: v4l: subdev: Make link validation safer
Date:   Mon, 13 Mar 2023 11:05:52 +0200
Message-Id: <20230313090552.3687375-1-sakari.ailus@linux.intel.com>
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

Link validation currently accesses invalid pointers if the link passed to
it is not between two sub-devices. This is of course a driver bug.

Ignore the error but print a warning message, as this is how it used to
work previously.

Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
since v2:

- Print the entire link and the problematic end of it.

 drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 03dc5f68ffad6..c7154a7f696a7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1258,6 +1258,16 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	bool states_locked;
 	int ret;
 
+	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
+	    !is_media_entity_v4l2_subdev(link->source->entity)) {
+		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
+			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
+			     "sink" : "source",
+			     link->source->entity->name, link->source->index,
+			     link->sink->entity->name, link->sink->index);
+		return 0;
+	}
+
 	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
 	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
 
-- 
2.30.2

