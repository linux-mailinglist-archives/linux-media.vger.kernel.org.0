Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5807B50B1
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236575AbjJBK4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236571AbjJBK4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130C2D3
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244174; x=1727780174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lxUoYpvq1gT4H5LzEfj2cSarQrC08vkJTYj09bcLFIg=;
  b=b4VrfCXm6EDjbY4HG8vBiNvAJTOvDAKTkDVk7qt2qnQLp1fggKtxDl7M
   5kf6GarzBbZORkG7u1dnjYLMMiE8zQtRqbCL+1ETDOR3OK/LgsLt0/jOr
   gWbYAuYVRCXY9yPAyg0S2KSINvRAU7fQ5/ylRZcUJKo0+bcqDNIHGY0y4
   iQywHdAKiyjb1jlr54F0ROqQ1eDaiqtfBzzUxsZcryDshNeDPGdD7ww7p
   vjuUwJOdJa5bJVRQKCtEzJuTdUIlkvIEDV9pG5RJLG67lsn2HGL45p+0f
   ag2FquLsHSkddBDDfcTDK9N92QE78eal3HttD0Z/XH1le1DTWkOfuB2Wp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896358"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896358"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251176"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251176"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:11 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 670151206C3;
        Mon,  2 Oct 2023 13:56:08 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 08/19] media: ccs: Obtain media bus formats before initialising up sub-devices
Date:   Mon,  2 Oct 2023 13:55:46 +0300
Message-Id: <20231002105557.28972-9-sakari.ailus@linux.intel.com>
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

The available mbus codes will soon be needed earlier, at the time
sub-devices are initialisaed. This is due to calling init_cfg() op via the
v4l2_subdev_init_finalize().

Move ccs_get_mbus_formats() before ccs_init_subdev() calls.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index e2669e9299ab..422fb6a4a907 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3553,6 +3553,12 @@ static int ccs_probe(struct i2c_client *client)
 	sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
 	sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
 
+	rval = ccs_get_mbus_formats(sensor);
+	if (rval) {
+		rval = -ENODEV;
+		goto out_cleanup;
+	}
+
 	rval = ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
 			       MEDIA_ENT_F_PROC_VIDEO_SCALER);
 	if (rval)
@@ -3574,12 +3580,6 @@ static int ccs_probe(struct i2c_client *client)
 	if (rval)
 		goto out_cleanup;
 
-	rval = ccs_get_mbus_formats(sensor);
-	if (rval) {
-		rval = -ENODEV;
-		goto out_cleanup;
-	}
-
 	rval = ccs_init_late_controls(sensor);
 	if (rval) {
 		rval = -ENODEV;
-- 
2.39.2

