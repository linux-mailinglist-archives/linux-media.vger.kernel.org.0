Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E4068709F
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjBAVqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjBAVqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:06 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6EA6812D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287964; x=1706823964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iOLvgbUxkhp7ltXZAraG0q1tCmQNTIu8Zaqv8LJXzKw=;
  b=J80EibEp9XHWYFOvB9J+QLTW+v0UTsIQuAx4a0U123ZQ6Cbt+bOwFshd
   eKjc4OJmluhCG46UJB2CJuEkJ4SoSAUUedcBELIQFYGg5QshHdTCB5Jq/
   2LCTd3H0Pzx12eQ27lBnzefJgmRF73JOdnRs2+795SaQ+xMnRRM5pM074
   I8ukkDzQFNG7l7jaWnMJBnACViKBX4ZtQgJETyFBq8NxRkQiJEcKuaAnZ
   zBJLSKRRmXb4V2kM6UX//mpbZpNdxBY4s6SgR0iRznrB6AWFLZkcx5Qsg
   9dvHN/V14pvPdF3Mfmz4sw9FPdaHh3exxO1SEr+PwVQj5684aUqLoYlyU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415671"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527320"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527320"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:52 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0B9781227A1;
        Wed,  1 Feb 2023 23:45:49 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 18/26] omap3isp: Don't use devm_request_irq()
Date:   Wed,  1 Feb 2023 23:45:27 +0200
Message-Id: <20230201214535.347075-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
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

Use request_irq() instead of devm_request_irq(), as a handler set using
devm_request_irq() may still be called once the driver's remove() callback
has been called.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 9665f1eb345e..904a2c2141f9 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2024,6 +2024,7 @@ static int isp_remove(struct platform_device *pdev)
 	__omap3isp_get(isp, false);
 	isp_detach_iommu(isp);
 	__omap3isp_put(isp, false);
+	free_irq(isp->irq_num, isp);
 
 	/* May release isp immediately */
 	media_device_put(&isp->media_dev);
@@ -2419,8 +2420,7 @@ static int isp_probe(struct platform_device *pdev)
 	}
 	isp->irq_num = ret;
 
-	if (devm_request_irq(isp->dev, isp->irq_num, isp_isr, IRQF_SHARED,
-			     "OMAP3 ISP", isp)) {
+	if (request_irq(isp->irq_num, isp_isr, IRQF_SHARED, "OMAP3 ISP", isp)) {
 		dev_err(isp->dev, "Unable to request IRQ\n");
 		ret = -EINVAL;
 		goto error_iommu;
@@ -2429,7 +2429,7 @@ static int isp_probe(struct platform_device *pdev)
 	/* Entities */
 	ret = isp_initialize_modules(isp);
 	if (ret < 0)
-		goto error_iommu;
+		goto error_irq;
 
 	ret = isp_register_entities(isp);
 	if (ret < 0)
@@ -2454,6 +2454,8 @@ static int isp_probe(struct platform_device *pdev)
 	isp_unregister_entities(isp);
 error_modules:
 	isp_cleanup_modules(isp);
+error_irq:
+	free_irq(isp->irq_num, isp);
 error_iommu:
 	isp_detach_iommu(isp);
 error_isp:
-- 
2.30.2

