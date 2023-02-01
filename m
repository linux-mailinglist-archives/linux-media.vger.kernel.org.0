Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26BEB68709D
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjBAVqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjBAVqF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:05 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD44168AC5
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287963; x=1706823963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0vjvXljbF9nkb2tybijGMYSFUDEMczyzv12TKKFVfdY=;
  b=GVxMb9EWPBQyasUhpbgbAes5cKR5DKVLY1Y3WNezbV/P36y6ONp4f7z0
   +WOaxa4yZJUynGISyCzpvye7SwGM04rZ6RpblKIuajaaPlHTnC4jfSoth
   JgtrKu1PAKEcCCf7iRnSU2XhsJopIQDirc0HpFcYAQ3Qfs1HhQRoBfCOI
   JR0MXDbNw5x2CbMjaA8ab9gXyj0CEsnHT97EOrEgJbzHrNm7fazctJWrN
   ddnt1Tthud4MC2ODiZwS4O0XoWyZY8pHeDWFGm3PUXiFdOIBgA7SB4ZGL
   wpUEnZLTmoSP2KEEJLpJsDzO78G7zDXQ5EdKTuToAMtlFo65VVtxWJBGI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415668"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415668"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527317"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527317"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:52 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 68F401227A0;
        Wed,  1 Feb 2023 23:45:49 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 17/26] omap3isp: Release the isp device struct by media device callback
Date:   Wed,  1 Feb 2023 23:45:26 +0200
Message-Id: <20230201214535.347075-18-sakari.ailus@linux.intel.com>
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

Use the media device release callback to release the isp device's data
structure. This approach has the benefit of not releasing memory which may
still be accessed through open file handles whilst the isp driver is being
unbound.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 25 ++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index e7327e38482d..9665f1eb345e 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -649,8 +649,11 @@ static irqreturn_t isp_isr(int irq, void *_isp)
 	return IRQ_HANDLED;
 }
 
+static void isp_release(struct media_device *mdev);
+
 static const struct media_device_ops isp_media_ops = {
 	.link_notify = v4l2_pipeline_link_notify,
+	.release = isp_release,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1607,7 +1610,6 @@ static void isp_unregister_entities(struct isp_device *isp)
 	omap3isp_stat_unregister_entities(&isp->isp_hist);
 
 	v4l2_device_unregister(&isp->v4l2_dev);
-	media_device_cleanup(&isp->media_dev);
 }
 
 static int isp_link_entity(
@@ -1955,6 +1957,19 @@ static void isp_detach_iommu(struct isp_device *isp)
 #endif
 }
 
+static void isp_release(struct media_device *mdev)
+{
+	struct isp_device *isp =
+		container_of(mdev, struct isp_device, media_dev);
+
+	isp_cleanup_modules(isp);
+
+	media_entity_enum_cleanup(&isp->crashed);
+	v4l2_async_notifier_cleanup(&isp->notifier);
+
+	kfree(isp);
+}
+
 static int isp_attach_iommu(struct isp_device *isp)
 {
 #ifdef CONFIG_ARM_DMA_USE_IOMMU
@@ -2003,17 +2018,15 @@ static int isp_remove(struct platform_device *pdev)
 
 	v4l2_async_nf_unregister(&isp->notifier);
 	isp_unregister_entities(isp);
-	isp_cleanup_modules(isp);
+
 	isp_xclk_cleanup(isp);
 
 	__omap3isp_get(isp, false);
 	isp_detach_iommu(isp);
 	__omap3isp_put(isp, false);
 
-	media_entity_enum_cleanup(&isp->crashed);
-	v4l2_async_nf_cleanup(&isp->notifier);
-
-	kfree(isp);
+	/* May release isp immediately */
+	media_device_put(&isp->media_dev);
 
 	return 0;
 }
-- 
2.30.2

