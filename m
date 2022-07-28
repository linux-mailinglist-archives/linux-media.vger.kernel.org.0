Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3431583F7C
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238518AbiG1NCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236063AbiG1NCs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:48 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC0331921;
        Thu, 28 Jul 2022 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013367; x=1690549367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jHGCy+LY2xn86PxwDOHDZMu5ODeZxv+Kr+sz0BLuCiI=;
  b=kgePlvyEqNOKZc/fvox90VcBtIBBK25kBBHPBYO2tmOrXWVmV/uoPza9
   EobQpBYGqlakiTkzfxbpN0wtAF3Lw0ISPfUpPpqVMet6PPH5NnjUBVMug
   R8Bhm5EKFnKYbpHXvChqqPguGWBTLiLaG2EGfA0u+xS1TePvUNU09oTDP
   wN/Iv1ODoUShP2HYbbcFg6B0FxeblPzWKySp7JdcFU77iElTzx8i2IllP
   A/opAWLdReEttUB04wyAAos2l0TyIN8MaBmNHkGMPrQ8lqT+s1GDg2Fhn
   zGNq2g/o5Mz8S3ffYTiVPLCdeVcmeOafdTLSdaWUJ1PZHXXRfWEZdXsAw
   g==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321365"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013363; x=1690549363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jHGCy+LY2xn86PxwDOHDZMu5ODeZxv+Kr+sz0BLuCiI=;
  b=YBCFy4egfC0LJlW7SvO8ERJqt401SBWGyHa6W8q1AuuxBEIJ81FHMilW
   F5Jx+hPxzIyF1rE3pXYXXSS2EFxN/fQSj89ZdBzhgPX2VI/qiz146wzfS
   NNxI3s5jagFEzTwAOFjnjVAuAJ5YnIRJ/dp1TbssyttU0VjPtEr89lW0f
   FIUwEc9SzzF7nlWBrAVKtB/bVWQEqc74sTCdfuoEh12m50NrEmB+OXm8K
   MSEBXhtEEV+ZFCc7jV0+g8gdmvPIs8mvtjVJ4FHI1FBdRIE46g2vSZVF+
   xykwX6XXGhL27tpa6njwRWB2stZRWgRtMahXx4F0HjRIACt9ai//dw58G
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321364"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 588AB280072;
        Thu, 28 Jul 2022 15:02:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 1/7] media: i2c: ov9282: remove unused and unset i2c_client member
Date:   Thu, 28 Jul 2022 15:02:31 +0200
Message-Id: <20220728130237.3396663-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is not need anyway as the i2c_client is stored in v4l2_subdev.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/i2c/ov9282.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2e0b315801e5..8a252bf3b59f 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -104,7 +104,6 @@ struct ov9282_mode {
 /**
  * struct ov9282 - ov9282 sensor device structure
  * @dev: Pointer to generic device
- * @client: Pointer to i2c client
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
@@ -123,7 +122,6 @@ struct ov9282_mode {
  */
 struct ov9282 {
 	struct device *dev;
-	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
-- 
2.25.1

