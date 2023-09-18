Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810447A4A22
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 14:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241554AbjIRMwI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 08:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241997AbjIRMwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 08:52:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4A4109
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695041511; x=1726577511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aT4pYhBzrkwrq+wXt4wM5+30kGGY1hcpc5dMcXccWAk=;
  b=YX5oRTRUTRcX4DtyR0UBOhDQfeV3F9hGRlej7IkN89ur8zQpoeJjtRIS
   9ITE6Xl+fDes40IT3X2jiHLDZInJqzhv1OskJ/VeVEDFjK2We/MFPOjE0
   QzfVbAdOFKOYc8sNt8cdhFeh0mbj5jFRlJPFlfHhzlaTXJS6s4z54KLVq
   /wI+dt2EmJ9LpukHelvYNPMCqBIJKp4WArek1InRsuWY9wnPrRlUtOqR1
   +6kMcXc2qFvGqqPPG54P2kpMFxbWN5x4lr8Mx+3axfMKhB9mX8cieKcGN
   qXLk4ziV/cuKeQfy1Q/io8heyZ00lD6GZykw+NQkIYez4l/oFoLajmnz7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364688944"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="364688944"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836005441"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="836005441"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:51:46 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BDA6A1201D0;
        Mon, 18 Sep 2023 15:51:43 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v2 04/12] media: ccs: Correct error handling in ccs_register_subdev
Date:   Mon, 18 Sep 2023 15:51:30 +0300
Message-Id: <20230918125138.90002-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
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

