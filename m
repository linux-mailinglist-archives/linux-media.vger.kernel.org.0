Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 770E3712400
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 11:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242984AbjEZJsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 05:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243278AbjEZJr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 05:47:57 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129C01BF
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685094477; x=1716630477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BdRgCzsIUVuKGyBAYOaslsS8weuWGN7MSsSxEe0YWNU=;
  b=D6hYMmSQfcJVIMWBksa/ZPtRkldL7va6Vq19fT7OO3Zx0WZGL+1UzG9H
   pzOfPzgtCO/TGWhXo1AbEoxD25RugrYNsVoJnVyRUs3hgTcq6GTilJ64l
   plNfmBltOAeXJ+VhChwg99ttynkDj7khc16Mp2lPL3XKf4az7WlxTZUgw
   HBbhUcFdr1mL2WIE4s8JWs7ba6XlQztGmqiIYF9zGgEipbSpwReeP+9Hz
   XPxNjOB0b2srzpRNQJPXhCUYmxPWy4CGroPpFJktAS4vBk4rYUzFqqmv9
   35Xo3eqEdbx2u2oRIwIqMENZ03J53I+Xu/VXxEvOPNkYG1CFpTDlYxsKo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440521066"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="440521066"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="817478288"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="817478288"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2023 02:47:42 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH 2/4] media: ov13b10: Defer probe if no endpoint found
Date:   Fri, 26 May 2023 17:58:38 +0800
Message-Id: <20230526095839.2443058-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526095839.2443058-1-bingbu.cao@intel.com>
References: <20230526095839.2443058-1-bingbu.cao@intel.com>
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
index ede33899248c..2d48c94659a4 100644
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

