Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09055A60DB
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 12:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiH3Keg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 06:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiH3Kef (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 06:34:35 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29602AA4C9
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661855675; x=1693391675;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gHCEbQfpuFj8LuadWo1XstsLiInGv3iwv3fi+JQq5FY=;
  b=RDjddFSauczDqyXGkF9lD5PiZpUioOS83iCRpJjbYTHXt6u6QPr2HyV/
   ronEiR8/lFzbmMlc8aDZOZTiN/uBHZwv/UVT6aczOoGUWFGdLt0ovwVF5
   6wCRueaewkmY7NLOiXOQJHs3ojY5dvt6lBtUbRx2iKP9luptZf99u7zZg
   aLe1f0/dfq1rh5VJV382A+D0Cpjl5n6iETeLq5uwCjKuTvBvHeHAyhwWk
   6hn9Vf1gb4tbOtNUrCSkdHUo49M3bsnztHj8JiTTtebwNnw2kEUT5qFmx
   RjRbv9031xKasn96BFpBv3+xgtzRakAuFE/RpmVIeEGM3MzNOjITayXqU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="274889259"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="274889259"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 03:34:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="611657612"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 03:34:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id CD9CC200DA;
        Tue, 30 Aug 2022 13:34:31 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oSya8-00DdGj-B7; Tue, 30 Aug 2022 13:34:56 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>
Subject: [PATCH 1/1] ar0521: Fix return value check in writing initial registers
Date:   Tue, 30 Aug 2022 13:34:56 +0300
Message-Id: <20220830103456.3249168-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The return value from register writes is ignored apart from the last
value. Fix this.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ar0521.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 9e90b02b15e36..a586e0fc0ea3f 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -755,11 +755,12 @@ static int ar0521_power_on(struct device *dev)
 		gpiod_set_value(sensor->reset_gpio, 0);
 	usleep_range(4500, 5000); /* min 45000 clocks */
 
-	for (cnt = 0; cnt < ARRAY_SIZE(initial_regs); cnt++)
+	for (cnt = 0; cnt < ARRAY_SIZE(initial_regs); cnt++) {
 		ret = ar0521_write_regs(sensor, initial_regs[cnt].data,
 					initial_regs[cnt].count);
 		if (ret)
 			goto off;
+	}
 
 	ret = ar0521_write_reg(sensor, AR0521_REG_SERIAL_FORMAT,
 			       AR0521_REG_SERIAL_FORMAT_MIPI |
-- 
2.30.2

