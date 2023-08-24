Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7227865CC
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 05:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbjHXDV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 23:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239588AbjHXDVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 23:21:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B756E10EC
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 20:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692847268; x=1724383268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0K1zaID0Cy2m1KDJ8X+yDFu8N3Ps/srMRZkPAOJw6WI=;
  b=U2aVljAlOeDONmHTo5xjv/OVjjbyeuQZPsvT9DKHDMx2jNWzmG/L0LUk
   KJ/9mp9neprZMS/qUCm+oRPbL4s0fJpAI5tiJ90danXmChjfgR/oiNYRM
   kUwZ+ugYJlBAWbRd/fjgktwwBTKz9cuv2yidjKkG7CXGNEEwfgpJ+1igI
   eRiN/Zf6qXFetTQdGlnsafXDj0CIBDwPfpX6qAknkAqPg8YVK3PYEa4XK
   coGqLs8OEkIOL2hiN926QskrrNE9+NsvWybmapk042V+BRzrMu0/Q8rfB
   Xm/9lDNAlF41IgZXvDjlvbJL/iyGgpzxa42230VMqgl8XRbcFBi1zXhnH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="354665516"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354665516"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 20:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826972879"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826972879"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 20:21:07 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 2/3] media: ivsc: ace: remove name identifier
Date:   Thu, 24 Aug 2023 11:21:01 +0800
Message-Id: <1692847262-31790-2-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692847262-31790-1-git-send-email-wentong.wu@intel.com>
References: <1692847262-31790-1-git-send-email-wentong.wu@intel.com>
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
 - no changed compared with v1

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

