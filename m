Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264954EBBD6
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 09:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbiC3HhK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 03:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243876AbiC3HhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 03:37:07 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096AB221BAC;
        Wed, 30 Mar 2022 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648625708; x=1680161708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGoR0Bi/9KyxJ4LS3E1AQhZ5W5AGPpkKzrT1an/pEh8=;
  b=nL8mPX9rY3wwjhOjN8qrLEizdrh+az6G/j6R5BKI6UT/K6jVcU21bjLt
   yWegGztXBzZK6ANuGKsoa+hwr6SlQ8djJakdIMNl6QDeodUslVxkHTP/A
   XBpn8XsC4ucMzlC8wZKz7oNCHyqGTLSPJeiCpDCHsVW08oIKfa9+Gm9ou
   x0qGWq5QOSkUPJafhuUHdbBax5xHptZcI+L+vNhcQe2IROcNynRc91lMo
   AYJixhIOjGxKL8X8oIqOJXsoCgY6kT3K+g2ED0tVJ7wXcZOBUcemM4gYJ
   7VeGwzpeWsLDZU3TAbrx7aTfTTSb/8by0qvGNl5oUYo02H2p1nHuLO2qu
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239403613"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="239403613"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:33:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="546745911"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:33:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0590B2066A;
        Wed, 30 Mar 2022 10:33:10 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1nZSpp-002T7e-Ej; Wed, 30 Mar 2022 10:33:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 2/2] dw9807-vcm: Add "dongwoon,dw9807" compatible string
Date:   Wed, 30 Mar 2022 10:33:41 +0300
Message-Id: <20220330073341.588550-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330073341.588550-1-sakari.ailus@linux.intel.com>
References: <20220330073341.588550-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
index 95e06f13bc9ed..01c372925a806 100644
--- a/drivers/media/i2c/dw9807-vcm.c
+++ b/drivers/media/i2c/dw9807-vcm.c
@@ -295,6 +295,8 @@ static int  __maybe_unused dw9807_vcm_resume(struct device *dev)
 
 static const struct of_device_id dw9807_of_table[] = {
 	{ .compatible = "dongwoon,dw9807-vcm" },
+	/* Compatibility for older firmware, NEVER USE THIS IN FIRMWARE! */
+	{ .compatible = "dongwoon,dw9807" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw9807_of_table);
-- 
2.30.2

