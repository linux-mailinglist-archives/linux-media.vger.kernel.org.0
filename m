Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1817B688E
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbjJCMIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbjJCMIj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF1FB0
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334916; x=1727870916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bF/BcJQaDDRuRcpdS4pVMfaIZJcjCXS5pYDwceWseeA=;
  b=O/ze4aQ0wojwcYTaswT3zCs/R7xZexJ0ExBmA/Nblo5B5uZ8nwgnI/Sr
   4znwqZ3fWRiivUQx9frp1/gBZA0AT3i17LQsz10CSvdIIHT33Hr2MDIL2
   4SwS1009MFJdGoFCvpZzOf1CCWL6rdPc30U3PkPcH3IiMM1NBzRmNKHVs
   kB3l7AknyZA24gM1DkmtUWx0/aprZJu4yKpxiXn4iaZBtvaP2pFSSORqv
   IXOrDfuc9IasSq1oxQGnWassRawfHlQNEScRyFtxTsdLYnasPW83/NRsk
   6fBI7X/h6c3iZVUMSjQiIbU1K19rPMB0aJZcq7A3EHPAgKsGxaLzQM9LC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681553"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681553"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285934"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285934"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:33 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2916F120A2E;
        Tue,  3 Oct 2023 15:08:30 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 21/28] media: ccs: No need to set streaming to false in power off
Date:   Tue,  3 Oct 2023 15:08:06 +0300
Message-Id: <20231003120813.77726-12-sakari.ailus@linux.intel.com>
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

Streaming will have been stopped by the sensor is powered off, and so
sensor->streaming is also false already. Do not set it as part of the
runtime suspend callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 2abfd5932e02..0c518145b2c8 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1700,7 +1700,6 @@ static int ccs_power_off(struct device *dev)
 	usleep_range(5000, 5000);
 	regulator_bulk_disable(ARRAY_SIZE(ccs_regulators),
 			       sensor->regulators);
-	sensor->streaming = false;
 
 	return 0;
 }
-- 
2.39.2

