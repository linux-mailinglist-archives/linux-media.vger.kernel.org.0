Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200E47864EB
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 03:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239151AbjHXBuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 21:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239240AbjHXBtt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 21:49:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9C5173C
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 18:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692841768; x=1724377768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WxEWwFHNYbneuY5PWO+87c3B+iFsJ163HcRWnFTiXFg=;
  b=CZi6tuwzhs/D9Nx/A4Ky8g6B56Dt0/JDGLhmcFuXFAgPyRCQrtxo/2qQ
   wUMWyQXcFGT2blDUPiFvTb39W3kRtuff2q3Cyj6IrRSVj+ZQGSvxj2nuO
   jaecwChOK6vuxSMDL6d9UvgCSc6UCHvR/CqUSp5aucqrXKAMT/ZusNGWC
   cqSCvt8NzNcrx1bxm4xwe25SUU6nxdHhkAOP8VwITrtx6hUtrMZdkUZoJ
   JfhTZBEkj+paBcRMYiQey4xG9cedaJ13KxxGRErPO5xeJ52uJjnu0IZq7
   GauuICwKuHYkzeAu4nym6afHkzifgjTJzIOUr0Hw7q2JNwe/8nQ25AoMC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364491555"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364491555"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 18:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="806909399"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="806909399"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2023 18:49:26 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v1 3/3] media: ivsc: ace: probe ace device after init IPU bridge
Date:   Thu, 24 Aug 2023 09:48:53 +0800
Message-Id: <1692841733-20766-3-git-send-email-wentong.wu@intel.com>
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

Probe ivsc ace device after IPU bridge has been initialized.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
index 7879f1f..504e96f 100644
--- a/drivers/media/pci/intel/ivsc/mei_ace.c
+++ b/drivers/media/pci/intel/ivsc/mei_ace.c
@@ -403,7 +403,7 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
 	snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev->parent), &uuid);
 
 	csi_dev = device_find_child_by_name(dev->parent, name);
-	if (!csi_dev) {
+	if (!csi_dev || !dev_fwnode(csi_dev)) {
 		ret = -EPROBE_DEFER;
 		goto err;
 	}
-- 
2.7.4

