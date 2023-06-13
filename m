Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6580672D8B9
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 06:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237581AbjFMEo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 00:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbjFMEo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 00:44:27 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C10CE
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 21:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686631465; x=1718167465;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uAWgNXK6xjtUAs72tscZyZenEu0p7YAo05w+/Z98aRU=;
  b=gtBEGJ+PioQGqgjP1tTjSa5P2gso0qbtxcuWZVe6doTt0fzwsafVPVq2
   Y1nad+3JgrX6tJ15bP2gByEX2w4tHDWkCqghEqQW5md3mm+4Fq4KrNus6
   wZ+XDW8hAmwelP4a5NXMTG4+HqzqVokk+R3UH/5uz85Wu3OWBK33IJ5OW
   DAju2a6kr/F+Y3yhE8zrk50Ar6w5XzcDrqCvViWiUvGKJjAHwAUci6GYL
   qcjT6JXZRadWRtxY0/1UJlfsIFsHnpUtBtm5QocAjYI0DhLQShUQaEguH
   D21+szEFsqogNWxa2jlN/dZEablsbIOl43+T6Dkd25IBenxoSk/DePH9T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444603256"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="444603256"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 21:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="744561021"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="744561021"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 21:44:22 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH] media: ov13b10: Defer probe if no endpoint found
Date:   Tue, 13 Jun 2023 12:55:43 +0800
Message-Id: <20230613045543.1535492-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

The ov13b10 need be connected to a CIO2 or IPU device by bridge, sometimes
the bridge driver was not probed before ov13b10 driver, then the absence
of the fwnode endpoint for this device is expected, so driver return
-EPROBE_DEFER in this case to let the probe occur after bridge driver.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index c1430044fb1e..96d3bd6ab3bd 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1331,6 +1331,10 @@ static int ov13b10_check_hwcfg(struct device *dev)
 	if (!fwnode)
 		return -ENXIO;
 
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -EPROBE_DEFER;
+
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 				       &ext_clk);
 	if (ret) {
@@ -1344,10 +1348,6 @@ static int ov13b10_check_hwcfg(struct device *dev)
 		return -EINVAL;
 	}
 
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -ENXIO;
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
2.40.1

