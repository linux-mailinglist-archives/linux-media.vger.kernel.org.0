Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8E07B367D
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 17:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbjI2PSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 11:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbjI2PSw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 11:18:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71977DD;
        Fri, 29 Sep 2023 08:18:50 -0700 (PDT)
Received: from uno.localdomain (mob-5-90-203-152.net.vodafone.it [5.90.203.152])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EC00208C;
        Fri, 29 Sep 2023 17:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696000624;
        bh=aHh7Onb6E17lxgt1ybvhKJ4mmnRpYjWTEzrAMv8wWlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OEvGh9UQ4wRBvypbARrqGknv9gfCLjajM2WlqIIvjgGc7rMEbAGCjVBpshZs9QQx4
         lOX6hi6sMif2k2gZ/CnQz2HQYgq/ZtqxF6N8uXhVduOPycG/5ExwPNeLbJvSuN0oOu
         ipp3YsKli/Chdg1GJ/IQdCnizkOEMsc4bgnpB7Ng=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de
Subject: [PATCH 2/7] media: bindings: hynix,hi846: Restrict endpoint properties
Date:   Fri, 29 Sep 2023 17:18:20 +0200
Message-ID: <20230929151825.6535-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929151825.6535-1-jacopo.mondi@ideasonboard.com>
References: <20230929151825.6535-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only properties explicitly listed in the schema are accepted as
endpoint properties.

Make sure this is actually enforced by setting 'additionalProperties'
to false and explicitly allow 'remote-endpoint' in the list of
endpoint properties.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 60f19e1152b3..f2ca86501d3c 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -58,7 +58,7 @@ properties:
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#
-        unevaluatedProperties: false
+        additionalProperties: false

         properties:
           data-lanes:
@@ -73,6 +73,7 @@ properties:
                   - const: 2

           link-frequencies: true
+          remote-endpoint: true

         required:
           - data-lanes
--
2.42.0

