Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BB67B3E79
	for <lists+linux-media@lfdr.de>; Sat, 30 Sep 2023 07:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbjI3Fvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Sep 2023 01:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233996AbjI3Fvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Sep 2023 01:51:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855D51B0;
        Fri, 29 Sep 2023 22:51:38 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:861:388f:1650:2f32:b6ff:a885:7d5e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB6DEEEA;
        Sat, 30 Sep 2023 07:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696052990;
        bh=OQ5mIcobfabGgp4HvF5pTY4/RjgYb9ENH7r14UywQIY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WrdbY+7IWqJGQCCAOM6GUvPHLQtYwDL3mOCLf9xc18bgZk8M+v6J/8ab6u62GzyyE
         5VJHv7gk8k/q57vWW35GPOoWr8dySfk1BAWvVzcqsshnQFpSd+mSgn/dBJhzfxARNn
         JVrgpfVV+Ms79k8ZJQkl6QorbgAWJgwcBmjclkoQ=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de
Subject: [PATCH v2 2/7] media: bindings: hynix,hi846: Restrict endpoint properties
Date:   Sat, 30 Sep 2023 07:51:04 +0200
Message-ID: <20230930055110.1986-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230930055110.1986-1-jacopo.mondi@ideasonboard.com>
References: <20230930055110.1986-1-jacopo.mondi@ideasonboard.com>
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

