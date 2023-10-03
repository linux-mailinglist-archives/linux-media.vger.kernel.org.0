Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA48B7B6891
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjJCMIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbjJCMIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1258FB3
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334920; x=1727870920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF7R6WCcF16DzqQ4oKIzXua2fsuAALVhBA+QmOF5vqA=;
  b=lZWdhLRcAjiqGrM8CRElMoTWD4nhmvQmTine61FWSiwnoyo3rSOU+MfR
   9Kpe7a2k8sCFkwNrZkPc0EKjAhigGyKKtLf1SQXbe11u9KJHYlUpqiDAc
   LXn75N2yXPay0DAY9weAPZzVO12SWTegXMU2P4go9qLm2R/sr/mZ88nqR
   i6QanGqUhlISjyQqcY0DRK6v0w4iUywqZBuBDLjoMKf/ruD39Pcg6qoWj
   t7uVU0FL5wBp4wW4guaoaXe0SXw9FYqnyANjKaIqSYcDBsdiZ72U0Sz9W
   x1fmGzN3SPJk94zdk22zMkOZVRo6EWLB8ydFbZlY7Jd0XiH2J4L+ygVQy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681567"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681567"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285951"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285951"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:37 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E428A120A58;
        Tue,  3 Oct 2023 15:08:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 24/28] media: ccs: Move ccs_validate_csi_data_format up
Date:   Tue,  3 Oct 2023 15:08:09 +0300
Message-Id: <20231003120813.77726-15-sakari.ailus@linux.intel.com>
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

ccs_validate_csi_data_format() will soon be needed elsewhere, above its
current location. Move it up.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 27ecf8688658..4924ec460d81 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1967,6 +1967,20 @@ static int ccs_post_streamoff(struct v4l2_subdev *subdev)
 	return pm_runtime_put(&client->dev);
 }
 
+static const struct ccs_csi_data_format
+*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
+		if (sensor->mbus_frame_fmts & (1 << i) &&
+		    ccs_csi_data_formats[i].code == code)
+			return &ccs_csi_data_formats[i];
+	}
+
+	return sensor->csi_format;
+}
+
 static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_mbus_code_enum *code)
@@ -2098,20 +2112,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 	}
 }
 
-static const struct ccs_csi_data_format
-*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
-		if (sensor->mbus_frame_fmts & (1 << i) &&
-		    ccs_csi_data_formats[i].code == code)
-			return &ccs_csi_data_formats[i];
-	}
-
-	return sensor->csi_format;
-}
-
 static int ccs_set_format_source(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
-- 
2.39.2

