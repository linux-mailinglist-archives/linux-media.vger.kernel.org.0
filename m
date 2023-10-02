Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6A067B50AE
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236568AbjJBK4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236562AbjJBK4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE5AB4
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244169; x=1727780169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2rV5oZR1lD0N8kdUt1c+r+AazqaPEEAyA6KQ9dKEmOI=;
  b=EQjs6GNMcU6eLe0v4MwwDMsp2oDdJKa2/dbx9tu/2kEuujgoVkq96Ytt
   +Be6jsyfmhFU4S50R6ujqDHjKyafsAWJ8i9yp049+hD+efdx+XaL8GRs4
   GLbUDCqkXOLJaTkLKFymGmxRy8eyZeFBsLHBQFxcPoaJOZGNO3rF9alVb
   5agVfehr+lOmmLE3QFxH8NNRFUlYvhDZY5LaMxLXXK0gKTLv7n0Q2rkzV
   oIrXAZdLnjx60sd46QqB5CGV4yM/zfiZ7fXotCUE59RegtoY5td1gcs8Z
   vCuDbnPktu+153f8e2M8z2jv12SgMJtjiMrrVG7Be76eZNFqYhG11Xzv6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896323"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896323"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251162"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251162"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:06 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 77D5A120A59;
        Mon,  2 Oct 2023 13:56:03 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 04/19] media: ccs: Correct error handling in ccs_register_subdev
Date:   Mon,  2 Oct 2023 13:55:42 +0300
Message-Id: <20231002105557.28972-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
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

ccs_register_subdev() did not clean up the media entity in error case, do
that now. Also switch to goto based error handling.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 022e8712d48e..fb823c5c3dd3 100644
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

