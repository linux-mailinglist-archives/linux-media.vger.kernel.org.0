Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F8D787435
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 17:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241958AbjHXPaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 11:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242215AbjHXPaG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 11:30:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D2119BD
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 08:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692891003; x=1724427003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e0skZ/DRHRDOOy7PezQvD0QWwxlzVdNp0bVKM6lZOSY=;
  b=YP+ixhxo3e44zEkcoa2aKdgNtFL88Xw+PwumRIJmD1PFogBSMOAh/cjj
   g5n3lfok0jNtdLQ6o57kF86vwRRTNFrhGDQNPK1xr2TvU48lYTfwyGr7s
   E1taiPEc/4xeqBsEqac+IKZ9d0uEpTog7tR0hWBCBSlUld8gARyHIOqMw
   W0JKuVQJjHBWLbVGI1E38mUZO0Vq1bppwKb1y2vh9mhuQzWZ0evLTaXIF
   XCJTi/CJcOew2SwR/dqEY4ihOjeHHujgL+GtXxjBt7qcKtuoRCglIa1PX
   CjVogLJrAUrnUTzeGP6iVdIfkLBqWum0TC+yWfeQuBBig+96rq1NlGnQo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374440753"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374440753"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 08:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="851552127"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="851552127"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2023 08:13:50 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 2/3] media: ivsc: ace: remove name identifier
Date:   Thu, 24 Aug 2023 23:13:36 +0800
Message-Id: <1692890017-15858-2-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692890017-15858-1-git-send-email-wentong.wu@intel.com>
References: <1692890017-15858-1-git-send-email-wentong.wu@intel.com>
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

