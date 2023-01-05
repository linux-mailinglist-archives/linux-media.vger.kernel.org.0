Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838A565E967
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 11:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbjAEKzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 05:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbjAEKyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 05:54:51 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89ECD44C65
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 02:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672916090; x=1704452090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YiB8aT3Cn2TGT4ilr5VBZdMB/asLYoszqmiJWGDD6e0=;
  b=Hzan6CbkojAcOgUPM6T+/AwPRMXSMk7G4xXyuqZJBvMmhYp//WlXsfD3
   +zpQyQY9k4j+DVEOU1t+XUEGRLkovtnIvXBLlleRxvPZEKusdS/witG1G
   Lnjqh+/TDXQ+ZSKYLrrKnA681biVRa9MqBDChXWaK4QL31YHvAG+qnWpL
   Pj16jz/ubTFhH4IGVpVUTUopglp+8c0s98Pdjy6Q7L9ivncKUilxNaZVL
   xY/jr4nf+gGhInIaC5qNoV+SNnJO8ZH3RRbxYyHjHNIASXxYxS6rgLU7u
   I5oQRd79fv56D9C7evBQfU5/5OH22J2frO0BuUL5Xk+shSUfiHLPikeeg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="386608112"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="386608112"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 02:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="718793888"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="718793888"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jan 2023 02:54:48 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, arec.kao@intel.com,
        sakari.ailus@linux.intel.com
Cc:     bingbu.cao@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH] media: ov13b10: remove streaming mode set from reg_list
Date:   Thu,  5 Jan 2023 19:02:49 +0800
Message-Id: <20230105110249.633633-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

It is not expected that trying to set the sensor to
streaming mode when trying to set initial sensor configuration.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 549e5d93e568..841158febfba 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -243,7 +243,6 @@ static const struct ov13b10_reg mipi_data_rate_1120mbps[] = {
 	{0x5047, 0xa4},
 	{0x5048, 0x20},
 	{0x5049, 0xa4},
-	{0x0100, 0x01},
 };
 
 static const struct ov13b10_reg mode_4208x3120_regs[] = {
-- 
2.39.0

