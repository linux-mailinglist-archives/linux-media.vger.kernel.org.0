Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E7B69A89F
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 10:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjBQJwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Feb 2023 04:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbjBQJwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Feb 2023 04:52:41 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071415F257;
        Fri, 17 Feb 2023 01:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676627558; x=1708163558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lhX4V8lSwBHWvHPVySZVBoJwqXgy7TRlcmTRJzZZUcU=;
  b=J8TGb79uwn1SKmK4csic+NKD8dgkKGrSU7a3EyJD2bo9DFgGTFJPdwSB
   ddzFkBlxSCszbL7RcCVIbe7wkSDnw933v+JLbCCT9HQOJrGc1khivaNuY
   CJ04KaYcS2+e7gYJC3DTVwyxpLvoHmoQee1F4olrpijflAJrElDKeup8z
   Ezr7CDqL4N/Erckz6SoZ3bT1vSNG548jBzpgzr6hUPXJIJj0sDe6su0eG
   nOsulDr+3Er+t5MYpSwIxeOnIzGK0SNyNriY9dmvKWknfqLle4JGma/t/
   H3Y1TZUdyCvDnnHe8hk8+wuIwyWBVk5UMV96WuYQtXWDRThnVveca5zDh
   A==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29151774"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 10:52:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 17 Feb 2023 10:52:34 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 10:52:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676627554; x=1708163554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lhX4V8lSwBHWvHPVySZVBoJwqXgy7TRlcmTRJzZZUcU=;
  b=Q1dLRu3ssCt4r3W4OtkNWEg9dO6lNkRiAviWeAFyYQXzvzc03MKNzt41
   OPRZQgrLAroec89P7QP73F/GjMygopr6WTNB+Qglm+d76ZgJWu0pYqhHk
   3C53PzIExSH8sTo0pMq8RqidR/S3eFViwhiAmHHy4DO/SUYRdBFQ5N4mA
   IUEhd3XktHVwvc0LIO7JDjzGckh7MzgqhDYhX0BMHrbsdTX4psKNbQKtb
   L7WJPwwClNQ/+LhfwwnlEnALR2QUZO0wON6l2c48Mpa5xS7Z/Paj6OJHZ
   uHWC5ZLe6ff73DgN7p1/bW42+LCOEXheQ/h4fI1A/qONVPmdno+7hxBDk
   w==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29151773"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Feb 2023 10:52:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1E73C280072;
        Fri, 17 Feb 2023 10:52:34 +0100 (CET)
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
Subject: [PATCH v3 1/2] media: dt-bindings: media: i2c: Add imx327 version to IMX327 bindings
Date:   Fri, 17 Feb 2023 10:52:20 +0100
Message-Id: <20230217095221.499463-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217095221.499463-1-alexander.stein@ew.tq-group.com>
References: <20230217095221.499463-1-alexander.stein@ew.tq-group.com>
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
index cafb6e1a7150e..a531badc16c98 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - sony,imx290lqr # Colour
           - sony,imx290llr # Monochrome
+          - sony,imx327lqr # Colour
       - const: sony,imx290
         deprecated: true
 
-- 
2.34.1

