Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D687B50B0
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236574AbjJBK4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236567AbjJBK4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDB4B3
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244171; x=1727780171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FaA/nLXvYqmfem4MiRUUluTVvT2KbapP2gjmlEyGwxU=;
  b=mbi3onHISjva6Sp074gMHuBuxmhZKEX8KP9atnzw8oe58Tyb3G/kGoVy
   Q93ZtCtN3A7yJD4jo1qwGN3WpUGWekUb/ktbpdLI+oNmY6eg7bY9hO13p
   TIUgz8ujh1PbTTQy0Imj19OnfABNHY8o9gLY9fqnWjeEHfJOKTco4F7zs
   2pHOWOjVteGZMcbqIFNiZbRXYvE18kYK6ZGNt122O68SBhtUz+44nheXw
   Gu/xZJDmK88cUTE4UadBd1u7nLB7yrjzQmXTXg74mR/7UxYWWrQ2T9XjI
   Ij5qMMG5H83NyhcCgl4g0uB9JmZaGgljfJrt5Soj1EWjk0iVCDCg/4WFr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896343"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896343"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251170"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251170"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:08 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D272F11F964;
        Mon,  2 Oct 2023 13:56:05 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 06/19] media: ccs: Rename ccs_create_subdev as ccs_init_subdev
Date:   Mon,  2 Oct 2023 13:55:44 +0300
Message-Id: <20231002105557.28972-7-sakari.ailus@linux.intel.com>
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

The ccs_create_subdev() function initialises a sub-device in the CCS
driver, including CCS specific needs. Rename it as ccs_init_subdev() as it
better reflects what the function does.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9e8769603704..6bcce908f93b 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3038,9 +3038,9 @@ static void ccs_cleanup(struct ccs_sensor *sensor)
 	ccs_free_controls(sensor);
 }
 
-static void ccs_create_subdev(struct ccs_sensor *sensor,
-			      struct ccs_subdev *ssd, const char *name,
-			      unsigned short num_pads, u32 function)
+static void ccs_init_subdev(struct ccs_sensor *sensor,
+			    struct ccs_subdev *ssd, const char *name,
+			    unsigned short num_pads, u32 function)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 
@@ -3553,12 +3553,12 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
-	ccs_create_subdev(sensor, sensor->scaler, " scaler", 2,
-			  MEDIA_ENT_F_PROC_VIDEO_SCALER);
-	ccs_create_subdev(sensor, sensor->binner, " binner", 2,
-			  MEDIA_ENT_F_PROC_VIDEO_SCALER);
-	ccs_create_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
-			  MEDIA_ENT_F_CAM_SENSOR);
+	ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
+			MEDIA_ENT_F_PROC_VIDEO_SCALER);
+	ccs_init_subdev(sensor, sensor->binner, " binner", 2,
+			MEDIA_ENT_F_PROC_VIDEO_SCALER);
+	ccs_init_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
+			MEDIA_ENT_F_CAM_SENSOR);
 
 	rval = ccs_init_controls(sensor);
 	if (rval < 0)
-- 
2.39.2

