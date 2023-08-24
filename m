Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B617864EC
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 03:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239145AbjHXBuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 21:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239237AbjHXBtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 21:49:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E35B1733
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 18:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692841767; x=1724377767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UJW4vGbeRBFsjcVSbIjIcDp4j+qb7q2e3F+Im+sDJes=;
  b=hwFbQlnIg8tmW5yscdMBoSJutLXVsxDSumyoUDD9l0tU5ias1e4oZn8G
   3vIWyjdIqSzjL+yTQhFXnQ5dYevN3QkDA/dijNab00uGZod4EsGJNvKX9
   NeihlvaWmUG3ljFGhuLhhZPaarVwkoHPFgSma3duOwVLp9hGIXoZ3dJCB
   DIWivlWm7p0QYHW71B6BG+O/Dx1o3M6T3tdvKarZmo9YZ2zm7NnpVHO6q
   aMmGu3RuTe4vAckqFpozuhasMRyC3ihaoaWP5md1q6Axz3zPPwcM4e//p
   s4ThxeNz8B0FhJiHHCr3BOHPP3HxPjxSClcjNiPEI39DFjZY2OcSAlMIs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364491546"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364491546"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 18:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="806909395"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="806909395"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2023 18:49:24 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v1 2/3] media: ivsc: ace: remove name identifier
Date:   Thu, 24 Aug 2023 09:48:52 +0800
Message-Id: <1692841733-20766-2-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692841733-20766-1-git-send-email-wentong.wu@intel.com>
References: <1692841733-20766-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove name identifier to match the device with the
defined UUID when load driver module.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index bc37f6d..7879f1f 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -30,8 +30,6 @@
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 
-#define	MEI_ACE_DRIVER_NAME	"ivsc_ace"
-
 /* indicating driver message */
 #define	ACE_DRV_MSG		1
 /* indicating set command */
@@ -554,14 +552,14 @@ static const struct dev_pm_ops mei_ace_pm_ops = {
 			     0x9B, 0x78, 0x03, 0x61, 0x63, 0x5E, 0x24, 0x47)
 
 static const struct mei_cl_device_id mei_ace_tbl[] = {
-	{ MEI_ACE_DRIVER_NAME, MEI_ACE_UUID, MEI_CL_VERSION_ANY },
+	{ .uuid = MEI_ACE_UUID, .version = MEI_CL_VERSION_ANY },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(mei, mei_ace_tbl);
 
 static struct mei_cl_driver mei_ace_driver = {
 	.id_table = mei_ace_tbl,
-	.name = MEI_ACE_DRIVER_NAME,
+	.name = KBUILD_MODNAME,
 
 	.probe = mei_ace_probe,
 	.remove = mei_ace_remove,
-- 
2.7.4

