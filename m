Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B9878BDD6
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 07:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235726AbjH2FY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 01:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235744AbjH2FYl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 01:24:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D3F198
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 22:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693286679; x=1724822679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UJW4vGbeRBFsjcVSbIjIcDp4j+qb7q2e3F+Im+sDJes=;
  b=ZPUbKxee8AHQhjLidLqd0jH4JDmZmA2FlPPqitnMy0If9gu+2Gshch4D
   BTvTXdzKrw8+Og7JWez2WGZyyRwPU4403o7sFXKgoD5V9i9ZTfe2rgxpO
   a9LYwRlcpsidH2BGISbwAsuD70xxOQMBjGZb8sBl1cuTyNze63uujxAXP
   afj91r9wcLoT2t1rO1krh54mVRhzHcGhJr9gYMriNFzmdB3BdP3sEOl/8
   n8Ej1QJtXSzBOuR7iT4b6Dz1senAehJ+NYcs4T2qIBmBduXrSZj3NCoZJ
   Ga43zdxivIwOm1xARqdYt98RncgQBKyk/n40bW7lIrfF3BWAuVIlghku6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354792616"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="354792616"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 22:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688370908"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="688370908"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 22:24:37 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 2/3] media: ivsc: ace: remove name identifier
Date:   Tue, 29 Aug 2023 13:24:27 +0800
Message-Id: <1693286668-13055-3-git-send-email-wentong.wu@intel.com>
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

