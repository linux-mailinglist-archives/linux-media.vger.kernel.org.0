Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF372707D55
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 11:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjERJyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 05:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjERJyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 05:54:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC33211F
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684403677; x=1715939677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yQpUoszA9+HhzMQBfmJUoENT3xcYQVNbWj8/ivE4BiI=;
  b=ixhc6rr+4Klf1QM4+2haB6YOErkcqKa2RwG9AKEiX8oRNY8+hF3KzcXt
   3DMTvLxB8vHBN/5VR05jby5jQshzoU/l4wXjLN1wRcymugjR5StnHPfsh
   US2Ndz3XsjL3N//cgT49Gik2s5x4jHhreLPvkiYwvrCD4qklFbxAS2v1C
   HlXcgNJ82SkMiOnElB7Yztu7254Pp/Dt0KPXGUQJXh52VB/tpx3kRIiT0
   wc7kfdMTGtJ/Qv91OVWXssMx3+EcZbn3jZIf3znnfL/KXsB9Ky/DQznJl
   bqs3qJaQ2W8nnNHEMo3zKfQwgDtii+tEGtjgxiDBvt/qLAWzMJG1fnQ59
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438366466"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="438366466"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 02:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791897250"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; 
   d="scan'208";a="791897250"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by FMSMGA003.fm.intel.com with ESMTP; 18 May 2023 02:54:35 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        dan.scally@ideasonboard.com
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 2/3] media: ipu-bridge: use IPU_MAX_PORTS for bridge instead of CIO2_NUM_PORTS
Date:   Thu, 18 May 2023 18:05:22 +0800
Message-Id: <20230518100523.1578703-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518100523.1578703-1-bingbu.cao@intel.com>
References: <20230518100523.1578703-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Before bridge driver use CIO2_NUM_PORTS as the maximum supported CSI2 port
number. Current bridge driver is moved out of ipu3, so define a new macro
in ipu bridge for all IPUs instead of including CIO2 definition.
This patch also removes the ipu3-cio2.h inclusion in ipu-bridge.h.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 drivers/media/pci/intel/ipu-bridge.h | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index f7134e308696..62daa8c1f6b1 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -301,7 +301,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 		if (!adev->status.enabled)
 			continue;
 
-		if (bridge->n_sensors >= CIO2_NUM_PORTS) {
+		if (bridge->n_sensors >= IPU_MAX_PORTS) {
 			acpi_dev_put(adev);
 			dev_err(&ipu->dev, "Exceeded available IPU ports\n");
 			return -EINVAL;
diff --git a/drivers/media/pci/intel/ipu-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
index d35b5f30ac3f..8cb733c03e2f 100644
--- a/drivers/media/pci/intel/ipu-bridge.h
+++ b/drivers/media/pci/intel/ipu-bridge.h
@@ -6,12 +6,11 @@
 #include <linux/property.h>
 #include <linux/types.h>
 
-#include "ipu3/ipu3-cio2.h"
-
 struct i2c_client;
 
 #define IPU_HID				"INT343E"
 #define IPU_MAX_LANES				4
+#define IPU_MAX_PORTS				4
 #define MAX_NUM_LINK_FREQS			3
 
 /* Values are educated guesses as we don't have a spec */
@@ -140,7 +139,7 @@ struct ipu_bridge {
 	struct software_node ipu_hid_node;
 	u32 data_lanes[4];
 	unsigned int n_sensors;
-	struct ipu_sensor sensors[CIO2_NUM_PORTS];
+	struct ipu_sensor sensors[IPU_MAX_PORTS];
 };
 
 #if IS_ENABLED(CONFIG_IPU_BRIDGE)
-- 
2.40.1

