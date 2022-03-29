Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619574EB53D
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 23:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiC2V2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 17:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbiC2V2N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 17:28:13 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56AA2274F0;
        Tue, 29 Mar 2022 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648589189; x=1680125189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a8hNR3L5KIplI+FHdehTC/2eOLUYd86RLqFUchVek5A=;
  b=BTSfZW2ExPkfC7w0liw4c+GLuKYMHQCfM/fOwDWJ4Pxp7eqUnBuPe7aQ
   07IjcipbfA95vLn3XHHYVux+yhplFj7veqBLhJ7UBkdklPCti1DMF8jg3
   6yU4H0X1BvmdlZTpU5HJVALecUdjawR9lIatupzfZn7oOjQ+aTMsV98hc
   ehvTvmX+/OmQveCpZ+X5jqZKIKo/hBml3T/j1zgPmSyaeVo2SH9VidAaM
   NknxqCf9+BZgqmsHmXL7AUFQ5ZDIQJqtTjgKj6QRDGchLVyXzmtTtbnNL
   rGIwAzR1UF8lz9FwgLiKpB4fifd6YlDJtUKrQWsvdkhhZ2ieXmwW5qXoP
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259094748"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259094748"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:26:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="618284917"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 14:26:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id AD19D20676;
        Wed, 30 Mar 2022 00:26:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nZJMd-002Sps-5j; Wed, 30 Mar 2022 00:26:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/2] dw9807-vcm: Add "dongwoon,dw9807" compatible string
Date:   Wed, 30 Mar 2022 00:26:53 +0300
Message-Id: <20220329212654.587451-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220329212654.587451-1-sakari.ailus@linux.intel.com>
References: <20220329212654.587451-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

