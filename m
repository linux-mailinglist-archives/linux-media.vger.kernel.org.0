Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63ADA7A629F
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 14:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjISMTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 08:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbjISMTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 08:19:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9356E59
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 05:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695125894; x=1726661894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aT4pYhBzrkwrq+wXt4wM5+30kGGY1hcpc5dMcXccWAk=;
  b=N2adbyFq3YQ23A0YeMbR0kPTDcERMKvvR8dAeGY2KREimBgsj80mrD1c
   CWUKCr6isYKNkyQ/p+PxMTZoeDR1lb5BFTAohh4Pja6d6vllHHLB45jbM
   FaxCVpdUg6YPJ3t5Cniy4N4lMgBDJtZD4M7vHtWXWaGWHJGWZHNony6Hb
   t0Sz9+XCvscOjbJaA8N17/c3ck4ibwWtecz7fJAeTdoOaSoaD7EjUIx9c
   mepI5WfshxxVpiIRnw8OxbK4B4vyPatICgTWR1PKBcEJLyBpBR4hvemjk
   VBfbqcxURlI5UmnHSd7m7skizB8STqBrEiokIaXejOvJZKxU4GrQjAZW0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466250978"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="466250978"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811701525"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="811701525"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:17:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 356F5121380;
        Tue, 19 Sep 2023 15:17:34 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v3 04/12] media: ccs: Correct error handling in ccs_register_subdev
Date:   Tue, 19 Sep 2023 15:17:20 +0300
Message-Id: <20230919121728.126781-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ccs_register_subdev() did not clean up the media entity in error case, do
that now. Also switch to goto based error handling.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 6f8fbd82e21c..3fed071b65ab 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2968,7 +2968,7 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 	rval = v4l2_device_register_subdev(sensor->src->sd.v4l2_dev, &ssd->sd);
 	if (rval) {
 		dev_err(&client->dev, "v4l2_device_register_subdev failed\n");
-		return rval;
+		goto out_media_entity_cleanup;
 	}
 
 	rval = media_create_pad_link(&ssd->sd.entity, source_pad,
@@ -2976,11 +2976,18 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
 				     link_flags);
 	if (rval) {
 		dev_err(&client->dev, "media_create_pad_link failed\n");
-		v4l2_device_unregister_subdev(&ssd->sd);
-		return rval;
+		goto out_v4l2_device_unregister_subdev;
 	}
 
 	return 0;
+
+out_v4l2_device_unregister_subdev:
+	v4l2_device_unregister_subdev(&ssd->sd);
+
+out_media_entity_cleanup:
+	media_entity_cleanup(&ssd->sd.entity);
+
+	return rval;
 }
 
 static void ccs_unregistered(struct v4l2_subdev *subdev)
-- 
2.39.2

