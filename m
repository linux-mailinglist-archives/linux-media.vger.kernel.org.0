Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3DC78BDDD
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 07:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbjH2FY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 01:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235732AbjH2FYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 01:24:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B15F199
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 22:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693286676; x=1724822676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=abiapyY0Iirm/LrpuuFmZdHpQr46pg9G1aABbmWT5FY=;
  b=NoeTBOWYn7TSZXtZ9tORs5E//pIZ4qlaW8ICnAd1aMS2ekEI4z/UT8k1
   bk82b4oljVeUw9kgrYWKPA2DgXPlony1iZtn7erGMk3rmK9qg/hHYUqJs
   MLd2GrSiGJErvE4KGxc4wpfymdAz25L4E5rgvn9Y3hWevauUO3tUtVjTl
   7tXJ9OyZTzcT2sSHxnuLbHXrrbnnFGmJ3HP2vrFZ8H5y9n/9eUrlcYSpR
   hCqFc2wQ3zqJlq/6cPBlZHzkBb4vdHKHdx3/atSRPojnLTXRVbbrsphq1
   cPjj/HXTy9yoFDGQDJ6P0tGye9IdFZXK+MWsgEdNKVR/wHPOXpPq0ChJB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354792606"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="354792606"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688370890"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="688370890"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 22:24:34 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 1/3] media: ivsc: csi: remove name identifier
Date:   Tue, 29 Aug 2023 13:24:26 +0800
Message-Id: <1693286668-13055-2-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1693286668-13055-1-git-send-email-wentong.wu@intel.com>
References: <1693286668-13055-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove name identifier to match the device with the
defined UUID when load driver module.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
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

