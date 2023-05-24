Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C17670EBF4
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 05:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbjEXDku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 23:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239301AbjEXDkt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 23:40:49 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FE7C1
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 20:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684899648; x=1716435648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ne7rZaRHNRBcbhTg8fVH6ikTQ12rwNfMYiJ/0YeRzeg=;
  b=btLq3t8nK6mCIpzSx4dja4EVS//Ml8SzrNgrLhGtUg/tm/q/igQdHOFk
   oMGAk3oLkx2/C0/gBiWAAR7YJEbtxQIioPvyVATM7BU3p/si7/RkbaSmL
   b1pGmnltOkmyHHYSEGjgeZxkhooDgjI/ygL4JJhXDi7o4yMkx5filkFho
   xW5bsTnOL4tqTa3qkiv14BtVYDa2cM2STIc8e5SIAsi0ubJ5QKJmJCp+8
   ffoUUBqAe5vm1AGxkokzHZqRXz6Je4BPXAfXQAugExaZTfTugkb4EMynW
   2cfYHGXy53vdsZx2qBluj/EMLRYQ4NYKQ60OaYWaVoWRFaO8vO2fX1khC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416904075"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="416904075"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 20:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="734993514"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="734993514"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga008.jf.intel.com with ESMTP; 23 May 2023 20:40:44 -0700
From:   bingbu.cao@intel.com
To:     djrscally@gmail.com, dan.scally@ideasonboard.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        andriy.shevchenko@linux.intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 3/3] platform/x86: int3472: Add ov13b10 (09B13) sensor module support
Date:   Wed, 24 May 2023 11:51:35 +0800
Message-Id: <20230524035135.90315-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524035135.90315-1-bingbu.cao@intel.com>
References: <20230524035135.90315-1-bingbu.cao@intel.com>
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

From: Hao Yao <hao.yao@intel.com>

Add a new sensor support in INT3472 driver which module name is '09B13'.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index d5d5c650d6d2..63acb48bf8df 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -60,6 +60,8 @@ static const struct int3472_sensor_config int3472_sensor_configs[] = {
 	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
 	/* Surface Go 1&2 - OV5693, Front */
 	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
+	/* OV13B10 */
+	{ "09B13", REGULATOR_SUPPLY("vcc", NULL), NULL },
 };
 
 static const struct int3472_sensor_config *
-- 
2.40.1

