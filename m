Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A61A521E68
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 17:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243530AbiEJP2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 11:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346009AbiEJP04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 11:26:56 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736A9201397
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652195670; x=1683731670;
  h=from:to:cc:subject:date:message-id;
  bh=zacHfELBlZkrrzuQmofo7PR9nJCExga8KfgAflcSDec=;
  b=buEvSeAN2vWL/aglLXmedxQfC1CSfHaEJiS9+Mo5QEBqv9Bb/ZBtSdQA
   UDVAaYiWEjeRhlRxwDM4AGn8H7GAnK6sPBEgznWy0vLPIRG2tafHL69Hd
   Eb+dht6wsz19vW75m/K5SBsJt+GRknEem90MOxW68F+wPRn/Ad5Zhjo5n
   lveGzda1MqUkAPOwriJPQhRaYb1Ll8o+F7+F3H6aGGQSDZW24H/LfDSyW
   +xJKjcxmDnT+M3ZTDeZ4jbaq6aOCcA8GDAJyg3Dt1EFtcly0nrVNkz9p+
   dFTmSxyHMS7Ixp486zY2dZ7mw/2qRd1Q3VRWk+xHkhGXwadahfgWaHoc7
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269339789"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="269339789"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="519801334"
Received: from jimmy-x299-aorus-gaming-7.itwn.intel.com ([10.5.253.29])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2022 08:14:28 -0700
From:   Jimmy Su <jimmy.su@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        jimmy.su@intel.com, yhuang@ovt.com, akeem.chen@ovt.com
Subject: [PATCH v2] UPSTREAM: media: ov8856: skip OTP read in non-zero ACPI D state
Date:   Tue, 10 May 2022 23:12:41 +0800
Message-Id: <20220510151241.12435-1-jimmy.su@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To skip OTP read function while enable non-zero ACPI D state.
This OTP read only influences streaming output with 3280x2464 &
1640x1232 resolution.

Signed-off-by: Jimmy Su <jimmy.su@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/media/i2c/ov8856.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8785764b7a74..f1bb7d882183 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1448,6 +1448,9 @@ struct ov8856 {
 
 	/* True if the device has been identified */
 	bool identified;
+
+	/* True for skipping otp read */
+	bool acpi_skip_otp;
 };
 
 struct ov8856_lane_cfg {
@@ -1692,7 +1695,7 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
 	int ret;
-	u32 val;
+	u32 val, width;
 
 	if (ov8856->identified)
 		return 0;
@@ -1708,6 +1711,10 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 		return -ENXIO;
 	}
 
+	width = ov8856->cur_mode->width;
+	if (ov8856->acpi_skip_otp & ((width == 3280) | (width == 1640)))
+		goto otp_skip;
+
 	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
 			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
 	if (ret)
@@ -1750,6 +1757,11 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 
 	ov8856->identified = true;
 
+	return 0;
+
+otp_skip:
+	ov8856->identified = true;
+
 	return 0;
 }
 
@@ -2499,6 +2511,8 @@ static int ov8856_probe(struct i2c_client *client)
 			dev_err(&client->dev, "failed to find sensor: %d", ret);
 			goto probe_power_off;
 		}
+	} else {
+		ov8856->acpi_skip_otp = true;
 	}
 
 	mutex_init(&ov8856->mutex);
-- 
2.17.1

