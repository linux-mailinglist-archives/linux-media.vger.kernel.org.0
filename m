Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F207D0749
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 06:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346954AbjJTEK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 00:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346945AbjJTEKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 00:10:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3405106
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 21:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697775053; x=1729311053;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C0VNA/NG8+jhVwJvCjquQ09ojiw1CWDBXoPjAyCFJ3U=;
  b=QPVYz783JFLIRMMl6DwXJWMbw91bem7aPQDwcA7qv40711tItPl5NQ0Q
   XKpHiaYTj2FxsQ1K2223Twx2GQl/peBjKrlEPjUpMdXUuj7azZZFHZG9w
   92pQS8MdCByX4TRvtXPJPSUEyqKGWS5GBwug7HlCjAb4UpYijqD8l9xGY
   HkuxJJT1zxpY8JyGqmqxd4U9ynLrWl9644K0//zse4lvQSOwm59oVZd+9
   PFE3O29sLLcMRrP9gy7BJjNkYGjm3+ZEIH3+m9agVO15kpTxr+z0FRRr0
   VLPORjzwGvw1C2JldPZqY06gDQa/++k2npNVKxeJAolXufj4PPm2kkxYl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366659484"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="366659484"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 21:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="880945060"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="880945060"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.227.107.10])
  by orsmga004.jf.intel.com with ESMTP; 19 Oct 2023 21:10:51 -0700
From:   "Chen, Jason Z" <jason.z.chen@intel.com>
To:     sakari.ailus@linux.intel.com, andy.yeh@intel.com
Cc:     linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com, Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v1] media: ov08x40: Add Signal Integration Adjustments for specific project
Date:   Fri, 20 Oct 2023 12:09:08 +0800
Message-Id: <20231020040908.2706654-1-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jason Chen <jason.z.chen@intel.com>

Due to certain MIPI hardware designs using overly long cables, there
is a loss of signal strength, resulting in failed signal integration.
The patch includes changes to adjust the driving strength in the register
settings for a specific project.

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 0b3b906ebef..4f13e23b325 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -160,6 +160,18 @@ static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
 	{0x6002, 0x2e},
 };
 
+static const struct ov08x40_reg mipi_si_changed_regs[] = {
+	{0x481b, 0x2c}, /* HS Exit: Data Tx TEOT - reducing 8ns */
+	{0x4826, 0x42}, /* HS Entry: Data Tx TREOT - raising 8ns */
+	{0x4829, 0x54}, /* HS Exit: Data Tx TREOT - reducing 8ns */
+	{0x4885, 0x1f}, /* driving strength change */
+};
+
+struct ov08x40_reg_list si_regs = {
+	.regs = mipi_si_changed_regs,
+	.num_of_regs = ARRAY_SIZE(mipi_si_changed_regs),
+};
+
 static const struct ov08x40_reg mode_3856x2416_regs[] = {
 	{0x5000, 0x5d},
 	{0x5001, 0x20},
@@ -2917,6 +2929,11 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
 		return ret;
 	}
 
+	/* Apply SI change to current project */
+	reg_list = &si_regs;
+
+	ov08x40_write_reg_list(ov08x, reg_list);
+
 	/* Apply default values of current mode */
 	reg_list = &ov08x->cur_mode->reg_list;
 	ret = ov08x40_write_reg_list(ov08x, reg_list);
-- 
2.34.1

