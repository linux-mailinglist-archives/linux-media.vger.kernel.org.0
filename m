Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5779A7865CA
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 05:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbjHXDV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 23:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239587AbjHXDVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 23:21:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C961910EC
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 20:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692847266; x=1724383266;
  h=from:to:cc:subject:date:message-id;
  bh=lMdg0UFrcxtBbXgkKWYS2p3dnsoQT3JYyoMzgshnWjQ=;
  b=CKJ5IVoKWbqJ+MewRAn2xqp2qOM8OQ3UXz751pisJwPEHeiBgdcYbFqE
   B9Xu88jRs2n+5IJSSLCepL0mOrWGE46+uzXx2GlmcaTjCwHvjEiMr086T
   3ihk5Y0KQbvOtzZb55OKe7iK08jAXc2WTHw73mt+/OliNTZ3JhR0sXFRG
   +XZac6jZKB+rUuiW5Lcc1n/MrkN2ftmn1uL194vBWRuLMhZOUkbpFyJak
   I9s6cw560CcfWR/L0InVUYRnsAN7LOl2hvoKCpeL3Hz/iukH5ypxrIpcC
   0zaCDg1axXuLwqV94UE4otWr4Gie/GnkdfMhSZtMCwrZem6y5j9mwkv//
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="354665512"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354665512"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 20:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826972864"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826972864"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 20:21:04 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 1/3] media: ivsc: csi: remove name identifier
Date:   Thu, 24 Aug 2023 11:21:00 +0800
Message-Id: <1692847262-31790-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove name identifier to match the device with the
defined UUID when load driver module.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
v2:
 - no change compared with v1

 drivers/media/pci/intel/ivsc/mei_csi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 264b85b..648c6a8 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -30,7 +30,6 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define MEI_CSI_DRIVER_NAME "ivsc_csi"
 #define MEI_CSI_ENTITY_NAME "Intel IVSC CSI"
 
 #define MEI_CSI_LINK_FREQ_400MHZ 400000000ULL
@@ -804,14 +803,14 @@ static void mei_csi_remove(struct mei_cl_device *cldev)
 			     0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
 
 static const struct mei_cl_device_id mei_csi_tbl[] = {
-	{ MEI_CSI_DRIVER_NAME, MEI_CSI_UUID, MEI_CL_VERSION_ANY },
+	{ .uuid = MEI_CSI_UUID, .version = MEI_CL_VERSION_ANY },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(mei, mei_csi_tbl);
 
 static struct mei_cl_driver mei_csi_driver = {
 	.id_table = mei_csi_tbl,
-	.name = MEI_CSI_DRIVER_NAME,
+	.name = KBUILD_MODNAME,
 
 	.probe = mei_csi_probe,
 	.remove = mei_csi_remove,
-- 
2.7.4

