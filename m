Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B962268BDF4
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 14:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjBFNTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 08:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbjBFNSl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 08:18:41 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0E11724;
        Mon,  6 Feb 2023 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675689466; x=1707225466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TvMCa6vu09SHCzHyeiMY6OaAnGe4C7sBH+wPIv/z2K4=;
  b=PjIDSySTj4vUzaPYKt72mVLSuFLmZsnICuXFmFlXHK68bKDhxZFeMhMB
   iB8XV1M1/H7HzFORGicePYgfuE+/x1UvCUhonKb+V27s4rWs7SQM6+PO5
   ZZ67CH7SQmygXfsvBEKujud3OlkqXGmFIN2oisOAvtakXvigc6QxsZhty
   xULY7yns2aMyQPgPcB8P2gDsusZfhNDTaBb/4q+hknhgDBP2zz6KwC0OK
   OH3ccwdd/ZcG5zLhJhxf7YZAdcIgJdcCd0ZgcVPBtKxIZB7yHaDdpW8t9
   +bGXsmxUbC2JLPqc8XddU5PFVkMdy5bqoAhZ2IxhOCA1VX6XWNNWof3Pw
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28891872"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 14:17:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 06 Feb 2023 14:17:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 14:17:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675689461; x=1707225461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TvMCa6vu09SHCzHyeiMY6OaAnGe4C7sBH+wPIv/z2K4=;
  b=KIMpXQzUU3yKcgyOdPVvQUORCc+cvB5nsuSA0IsovycBUS+I/bP51WhZ
   Wd0OGY8lfZVq5ID2M07VZUrosCzbQLbu2QqqNJxzNKWvt/AS6jCYTpKVJ
   hoVt6I9qFsLT5rXhz1T78f8pkBKYF4KTB2WdQOMd/f9lITeecqyQwpBrp
   uSBSZda0otViqTPqhNw7IkpMVYznWQTmAYAeEPcQoS7g7eyYwDuh9POrI
   5PUFRcwNjCKfEFiqXSbIOFQrdA4NgO7HI4MT4q9LssVFK9g4/w2GFcibq
   wkmSXAbvmCWz4B4epMP2R3yfBeuz55pvcqLhbuZakfzJuTVs1AuY8x5S3
   A==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28891867"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Feb 2023 14:17:40 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 815DC280075;
        Mon,  6 Feb 2023 14:17:40 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add imx327 version to IMX327 bindings
Date:   Mon,  6 Feb 2023 14:17:30 +0100
Message-Id: <20230206131731.548795-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
References: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
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

The imx290 driver can be used for both imx290 and imx327 as they have a
similar register set and configuration. imx327 lacks 8 lanes LVDS and
120 FPS support.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index dacecb0cd9aa..5afe508011ec 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -29,6 +29,7 @@ properties:
       - sony,imx290
       - sony,imx290lqr
       - sony,imx290llr
+      - sony,imx327lqr
 
   reg:
     maxItems: 1
-- 
2.34.1

