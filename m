Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCEA4DDF5E
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 17:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239395AbiCRQwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239389AbiCRQwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 12:52:40 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BCEF1E86;
        Fri, 18 Mar 2022 09:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647622281; x=1679158281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a8hNR3L5KIplI+FHdehTC/2eOLUYd86RLqFUchVek5A=;
  b=UjAZxver1vzaKdpJ4jgR/XdHFwqBmeALwxyFbxvubPdofKLTJ0bic8VL
   Gylzl+w8LLxWlqC3JFhdLAl1dxqp27CrGNC/h05XgNX5q9Bawwnjr/ruK
   K5TZe5euy2voME/tZsPgLEwQh4YbOmdJnvt86DBu3rjan/ID031zcR9Ko
   J/86/MMuEs3IZgG9lwH5r74KcxsRuAc1JggTTbu/Sd3ALFwO6kGSuOLgW
   apQ3ZVkrAyqG7h6LYanMMSgbqIVSN8O01kA1d1k95iAECOJm5XEb+I+UF
   UeTwDi+Fk7ZX3ufCc3e3Vx4BAfmPDRIfpenKK67AsR+dJ2B/Glhur8C1W
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="256899847"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="256899847"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:51:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="550807242"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 09:51:18 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 237C220695;
        Fri, 18 Mar 2022 18:51:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nVFou-0003BX-4m; Fri, 18 Mar 2022 18:51:20 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 2/2] dw9807-vcm: Add "dongwoon,dw9807" compatible string
Date:   Fri, 18 Mar 2022 18:51:19 +0200
Message-Id: <20220318165119.12191-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is firmware out there that uses "dongwoon,dw9807" compatible string
that never made it to upstream as-is. Add it to the driver to make it load
on such systems.

The chip also has an EEPROM part which is AT24 compatible (for reading
purposes) on a separate I²C address. Adding possible support for this in
the future is not affected by this change.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/dw9807-vcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
index 95e06f13bc9ed..ada8e467a0450 100644
--- a/drivers/media/i2c/dw9807-vcm.c
+++ b/drivers/media/i2c/dw9807-vcm.c
@@ -295,6 +295,8 @@ static int  __maybe_unused dw9807_vcm_resume(struct device *dev)
 
 static const struct of_device_id dw9807_of_table[] = {
 	{ .compatible = "dongwoon,dw9807-vcm" },
+	/* Compatibility for older firmware */
+	{ .compatible = "dongwoon,dw9807" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw9807_of_table);
-- 
2.30.2

