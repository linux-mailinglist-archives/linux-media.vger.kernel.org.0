Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC197AFB85
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjI0G55 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjI0G5x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:57:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24490F9
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695797873; x=1727333873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2rV5oZR1lD0N8kdUt1c+r+AazqaPEEAyA6KQ9dKEmOI=;
  b=MKUdW5j04bFDNGUvDdi7e1TURWgCOicTR8IZt0EgU5JJnphPeoE0LlLj
   Kucx6rnzWnbLGxq2ZAqZjY3ZzPTZjSrS33GjeN4fWHmuT7cw2tw1J5SHA
   vlcucAGCCIoDYraljn/BwM04JI//X7Ra76p4SBMVJlpKnHdJg5B9z+MKg
   tVpwdHPimKcpbiHwZgXwuyXPr0lDfynhbXuy0rFDWb1nL9c4PMveM8Os9
   JRXTf8w/Ck1cnuzZ/00W5rtIc95twK323wr+FPutefusmH/Vgm5PUkDVK
   dTEEB75YhDkVxr7aF9d97MZjKN92Dj3n0fj7sQ2A/MhwCQ8h8GvmEtA68
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372083338"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="372083338"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="892489897"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="892489897"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:56:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0E78E120A68;
        Wed, 27 Sep 2023 09:41:28 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v6 04/13] media: ccs: Correct error handling in ccs_register_subdev
Date:   Wed, 27 Sep 2023 09:41:11 +0300
Message-Id: <20230927064120.367561-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
References: <20230927064120.367561-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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

