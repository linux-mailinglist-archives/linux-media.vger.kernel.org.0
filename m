Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8617C6820
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 10:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbjJLIn7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 04:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235478AbjJLIns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 04:43:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED7E10CC
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 01:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697100185; x=1728636185;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vc15TVXd4L7zZpx7LIIykmFF37OBahAS99RFZ8xr0iQ=;
  b=a8Z0Dpv8qF8iOJ9FXa64/oIBNTfOPBt3ZwH5jQ7aLCCzVtlbZYf7IYvn
   znXi+nF9QOrugkgawcAKSbAMIZl+5gyaCj5GyBvYu2S1EP32hJyP0hqnQ
   D77MN63ESxB7KcrC7TcXk2y+JFHw59obGgz1ubwD/KZcg9ZThELJduO8z
   3livCSS3r9KrRi1EODMDLH/JcYDPYEBhckZhEnzoOM8z0k+ZbUjyGyW2H
   D2Rqa3tQ08/R+88z8DFrTc5xQmxYCg3rc1iBRoY0JYpnLBuT/maD/hNX0
   I14I9fYM7fc5Gt99Y9YhenXvkwc3tOwTxaUFCjWNvl70pyuUjXfXr8ZTw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="369931761"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="369931761"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 01:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085577317"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="1085577317"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 01:43:02 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH] yavta: add support for 12-bit packed and 14-bit unpacked/packed bayer formats
Date:   Thu, 12 Oct 2023 16:52:16 +0800
Message-ID: <20231012085216.3346754-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Add bayer formats:
V4L2_PIX_FMT_SBGGR12P
V4L2_PIX_FMT_SGBRG12P
V4L2_PIX_FMT_SGRBG12P
V4L2_PIX_FMT_SRGGB12P
V4L2_PIX_FMT_SBGGR14
V4L2_PIX_FMT_SGBRG14
V4L2_PIX_FMT_SGRBG14
V4L2_PIX_FMT_SRGGB14
V4L2_PIX_FMT_SBGGR14P
V4L2_PIX_FMT_SGBRG14P
V4L2_PIX_FMT_SGRBG14P
V4L2_PIX_FMT_SRGGB14P

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 yavta.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/yavta.c b/yavta.c
index d5628632c1f8..7d10fa39f6f7 100644
--- a/yavta.c
+++ b/yavta.c
@@ -348,6 +348,18 @@ static struct v4l2_format_info {
 	{ "SGBRG12", V4L2_PIX_FMT_SGBRG12, 1 },
 	{ "SGRBG12", V4L2_PIX_FMT_SGRBG12, 1 },
 	{ "SRGGB12", V4L2_PIX_FMT_SRGGB12, 1 },
+	{ "SBGGR12P", V4L2_PIX_FMT_SBGGR12P, 1 },
+	{ "SGBRG12P", V4L2_PIX_FMT_SGBRG12P, 1 },
+	{ "SGRBG12P", V4L2_PIX_FMT_SGRBG12P, 1 },
+	{ "SRGGB12P", V4L2_PIX_FMT_SRGGB12P, 1 },
+	{ "SBGGR14", V4L2_PIX_FMT_SBGGR14, 1 },
+	{ "SGBRG14", V4L2_PIX_FMT_SGBRG14, 1 },
+	{ "SGRBG14", V4L2_PIX_FMT_SGRBG14, 1 },
+	{ "SRGGB14", V4L2_PIX_FMT_SRGGB14, 1 },
+	{ "SBGGR14P", V4L2_PIX_FMT_SBGGR14P, 1 },
+	{ "SGBRG14P", V4L2_PIX_FMT_SGBRG14P, 1 },
+	{ "SGRBG14P", V4L2_PIX_FMT_SGRBG14P, 1 },
+	{ "SRGGB14P", V4L2_PIX_FMT_SRGGB14P, 1 },
 	{ "SBGGR16", V4L2_PIX_FMT_SBGGR16, 1 },
 	{ "SGBRG16", V4L2_PIX_FMT_SGBRG16, 1 },
 	{ "SGRBG16", V4L2_PIX_FMT_SGRBG16, 1 },
-- 
2.42.0

