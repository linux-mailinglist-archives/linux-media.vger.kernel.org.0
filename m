Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5FC7B6890
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjJCMIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbjJCMIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038F1BB
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334919; x=1727870919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rTofabdLgGNT+FGxr0MzNByKxARc+ID4rVgkhnh3neM=;
  b=e2sUR93cfVnIGDO5UdKwCJNmd/rL6aM9da+BKhdRnaBbfR0KByPPzLqF
   zCeL9Wklk9ThQd9HCgoU/ZRLzBXEGv61d3htlhntenQF8IBOIzIVrjwgT
   r/20yC6r8+acz7OokKjq3jgzzdVNTcOINz/8V59VmaEvmsQZTOPwq9Pb0
   PmLYije3PB+GBdQ9rxpIymsAf4f7yb61KV+cxyIznoVhldfL3lRXVuMes
   d7LbDOpcGhRLYTbWowYHSx+wbEJSp4it3FDOa2CiOHQNCwcd8Ma9jjKX0
   FOSU8xJlbONFMdOg6xNT9V/Jkm/4HeSsGciL5ms36XEyu91TECSxLm80B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681562"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681562"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285949"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285949"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A6E91120A57;
        Tue,  3 Oct 2023 15:08:32 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 23/28] media: ccs: Track streaming state
Date:   Tue,  3 Oct 2023 15:08:08 +0300
Message-Id: <20231003120813.77726-14-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
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

With enable_streams and disable_streams, the driver for a device where
streams are not independently started and stopped needs to maintain state
information on streams that have been requested to be started. Do that
now.

In the future, a helper function in the framework is a desirable way to do
this instead.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
 drivers/media/i2c/ccs/ccs.h      |  2 +-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 70e7582bbf5f..27ecf8688658 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1754,6 +1754,11 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	if (sensor->streaming) {
+		sensor->streaming |= streams_mask;
+		return 0;
+	}
+
 	rval = ccs_pm_get_init(sensor);
 	if (rval)
 		return rval;
@@ -1875,7 +1880,7 @@ static int ccs_enable_streams(struct v4l2_subdev *subdev,
 
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_STREAMING);
 
-	sensor->streaming = true;
+	sensor->streaming |= streams_mask;
 
 	return 0;
 
@@ -1897,6 +1902,10 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (pad != CCS_PAD_SRC)
 		return -EINVAL;
 
+	sensor->streaming &= ~streams_mask;
+	if (sensor->streaming)
+		return 0;
+
 	rval = ccs_write(sensor, MODE_SELECT, CCS_MODE_SELECT_SOFTWARE_STANDBY);
 	if (rval)
 		return rval;
@@ -1905,7 +1914,6 @@ static int ccs_disable_streams(struct v4l2_subdev *subdev,
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
-	sensor->streaming = false;
 	pm_runtime_mark_last_busy(&client->dev);
 	pm_runtime_put_autosuspend(&client->dev);
 
@@ -3500,7 +3508,6 @@ static int ccs_probe(struct i2c_client *client)
 		goto out_cleanup;
 	}
 
-	sensor->streaming = false;
 	sensor->dev_init_done = true;
 
 	rval = ccs_write_msr_regs(sensor);
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 9c3587b2fbe7..043a679e115c 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -234,7 +234,7 @@ struct ccs_sensor {
 	u16 image_start; /* image data start line */
 	u16 visible_pixel_start; /* start pixel of the visible image */
 
-	bool streaming;
+	u8 streaming;
 	bool dev_init_done;
 	u8 compressed_min_bpp;
 
-- 
2.39.2

