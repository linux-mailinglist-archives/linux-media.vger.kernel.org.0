Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB4D743CF9
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 15:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjF3NqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 09:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjF3NqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 09:46:15 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E439C420E
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688132734; x=1719668734;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S8OLqXFtlkyUaSmPZAiDeJYJDznDok7BNuE2vdXur84=;
  b=EQSQspZRc7gJybffoRPg9t6+86lKqzVtBuDBN4ebg90VU3hhvuUoiN1D
   tHdyaYpCBcaTI2PbodxcuoZDlmpGB2PlWu5LyM6TP5gpE/Sfvlw2CDMWZ
   ee/u+3tGCPIy0HJYVKauflD0rNny0aPC72SIHfRGrkRH7HkSXKOq4f3ie
   NcQypMa0unm++8aGq5iOgBADMvjk5ZTf1do8xAUm8FvEQi91cou6SF9tt
   atypx7R2MnZJMHaEshC9ETBusLloP0aVf7DCvl+s1lNBAiPOOPD5D/asj
   34/MvEkShdDaqpl/SQrV3VDy8QR/6IwIAmm7TS0Wa8tx9CTnHQ3/lv4fQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352217360"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="352217360"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="783083742"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="783083742"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:45:28 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1F4581203D3;
        Fri, 30 Jun 2023 16:45:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Wentong Wu <wentong.wu@intel.com>, bingbu.cao@linux.intel.com,
        andriy.shevchenko@intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 2/2] media: ipu-bridge: Make exported IPU bridge symbol GPL-only in a NS
Date:   Fri, 30 Jun 2023 16:45:06 +0300
Message-Id: <20230630134506.109269-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
References: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch to EXPORT_SYMBOL_NS_GPL() on ipu_bridge_instantiate_vcm(). The rest
of the ipu bridge symbols are this way already.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 2811e716ea62..c2f62d98a655 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -549,7 +549,7 @@ int ipu_bridge_instantiate_vcm(struct device *sensor)
 
 	return 0;
 }
-EXPORT_SYMBOL(ipu_bridge_instantiate_vcm);
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_instantiate_vcm, INTEL_IPU_BRIDGE);
 
 static int ipu_bridge_instantiate_ivsc(struct ipu_sensor *sensor)
 {
-- 
2.39.2

