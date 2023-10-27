Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3387D9579
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 12:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345516AbjJ0Kqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 06:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjJ0Kqo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 06:46:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591F518A
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698403602; x=1729939602;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=63VhitER2JvJbYe/W5yfWR7xa4PMiYJuXe+7lPr078s=;
  b=TQ/WxDuENgkyZwWVddKstX4H2UF3+32YS32Xq4y2r4R0u1ferhdkMNme
   vUiRuBq+cvFd/5zT0zNqerP6gibpVcaYcYk316GO13wD/n64XdNldcEqW
   7iAFjKgMk1QInMeQs9x5nxaFwNYcAMS9pqzI5rY/ly/vzhD+iOSRg2zAG
   h1+yVx70OIfy27Nn1RcOBs7RP5BmxsSi7c0/4f+MikXDsCtyO5x31SxrL
   ky2dZW6+yJgLN/tk6QV1r3dKwr13zBad16XlZIzwQZxzn/jIU/usBqc8j
   niRz7Y/nhgPYDB9C7U7PxxwYWt0IZl1uqmiy0fBPpQJnhuwHErR14fq4n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473992301"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="473992301"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 03:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="829945298"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="829945298"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 03:46:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8FE6911F82E
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 13:36:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: ccs: Print ireal and float limits converted to integers
Date:   Fri, 27 Oct 2023 13:36:19 +0300
Message-Id: <20231027103619.1011553-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A number of CCS register value limits are in ireal or float format.
Also convert them to integers for easier interpretation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 017b53c32d36..1b4e7ced7149 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -173,6 +173,8 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 
 	end = alloc + ccs_limit_offsets[CCS_L_LAST].lim;
 
+	sensor->ccs_limits = alloc;
+
 	for (i = 0, l = 0, ptr = alloc; ccs_limits[i].size; i++) {
 		u32 reg = ccs_limits[i].reg;
 		unsigned int width = ccs_reg_width(reg);
@@ -187,6 +189,7 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 
 		for (j = 0; j < ccs_limits[i].size / width;
 		     j++, reg += width, ptr += width) {
+			char str[16] = "";
 			u32 val;
 
 			ret = ccs_read_addr_noconv(sensor, reg, &val);
@@ -205,8 +208,15 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 
 			ccs_assign_limit(ptr, width, val);
 
-			dev_dbg(&client->dev, "0x%8.8x \"%s\" = %u, 0x%x\n",
-				reg, ccs_limits[i].name, val, val);
+#ifdef CONFIG_DYNAMIC_DEBUG
+			if (reg & (CCS_FL_FLOAT_IREAL | CCS_FL_IREAL))
+				snprintf(str, sizeof(str), ", %u",
+					 ccs_reg_conv(sensor, reg, val));
+#endif
+
+			dev_dbg(&client->dev,
+				"0x%8.8x \"%s\" = %u, 0x%x%s\n",
+				reg, ccs_limits[i].name, val, val, str);
 		}
 
 		if (ccs_limits[i].flags & CCS_L_FL_SAME_REG)
@@ -223,14 +233,13 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 		goto out_err;
 	}
 
-	sensor->ccs_limits = alloc;
-
 	if (CCS_LIM(sensor, SCALER_N_MIN) < 16)
 		ccs_replace_limit(sensor, CCS_L_SCALER_N_MIN, 0, 16);
 
 	return 0;
 
 out_err:
+	sensor->ccs_limits = NULL;
 	kfree(alloc);
 
 	return ret;
-- 
2.39.2

