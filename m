Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4D17E2168
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjKFM0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjKFM0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:26:19 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D07184
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273576; x=1730809576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0yPoi1idzAOVEIRsEnz58dD3a3SYGpSOsiOb8nUxPts=;
  b=ghSHXDorBTMYr7Pjh6rfvwCLR3FCpPfGP172PgYGpF1VG8K06NOT07Nm
   IAwTSyys61bMiyWXU6exB2wrcyWFYFM6sTBkFA7s9z93UWHdQU2ZQC016
   hbgbUJ1c2WI+XTF5S6b7m1SPZfW4qdKSxGIx/GioigBrLaV/zm3UE+mtW
   vb2YM8J7ccczl8JDSYSxiD3EilyncXCJbaW/jva8oOHntRr3CiwD/njjf
   fp3uR8YarMaWz153ePm7lu2rvrebl0deRnfgWnRBIpdsT58FVPCgZCO2A
   HcnMWo8G0Qsj1W/3XeU+RO5wbB5jaA82SBFuGUb+Zvib+9ExZsr+xJgRl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369469677"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="369469677"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879427746"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="879427746"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:26:13 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4927511FB8D;
        Mon,  6 Nov 2023 14:26:10 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 21/31] media: ccs: Move ccs_validate_csi_data_format up
Date:   Mon,  6 Nov 2023 14:25:29 +0200
Message-Id: <20231106122539.1268265-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
References: <20231106122539.1268265-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index b9f763673366..0afaf6ab1803 100644
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
@@ -2102,20 +2116,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
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

