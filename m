Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5E3787437
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 17:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239655AbjHXPaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 11:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242199AbjHXPaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 11:30:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CDA1BDA
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692890999; x=1724426999;
  h=from:to:cc:subject:date:message-id;
  bh=Sstx62f6Pj/ejch6blaMMnKALy78e4+8T/MVh63yPMQ=;
  b=lRdoLcZwM/lcEN2OyseNCyQqsWExyfd+ojLE10+eeQMcs/4PIDZtqjep
   JqdoKnclbFwlWl8IxEJ53JKNaJgHJCZdKt9FMB7HP/aEwpx06yybriVtI
   SXq6vsk7lHX90XOrrlsPTfV9J6W7fZkzjuLazv+YvfFHM9v4f/PPc7Tte
   4LtqsPgCXZbaL8oGKrtuW8H1UVb9jF8NYV5nrQ7EM0nDKk+hHkaqTVyya
   CBNtGkDWBQELeZazcUNq0mF1jHCpUsNVKr2faB8njh2T44tXszz4o7wc4
   61TppesBfOHNNHJG7ybtRsiRARB4JxyCTlumIHS5LlKKmVwu2w3slRRJf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374440715"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374440715"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 08:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="851552083"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="851552083"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2023 08:13:46 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 1/3] media: ivsc: csi: remove name identifier
Date:   Thu, 24 Aug 2023 23:13:35 +0800
Message-Id: <1692890017-15858-1-git-send-email-wentong.wu@intel.com>
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
v3:
 - no change compared with v1 and v2

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

