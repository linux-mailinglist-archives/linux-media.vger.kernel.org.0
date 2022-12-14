Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36DC564D389
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiLNXil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiLNXig (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCF131EEC;
        Wed, 14 Dec 2022 15:38:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6D8AFA0;
        Thu, 15 Dec 2022 00:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061114;
        bh=679xmMXS4rnWIiDxA1UejuDU2cFH/rEKZoZsFdSVxsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FYaxRT3USwHgr8kKJgl5I8dyOIL9duU6sP3PUXnp9JeA2mEWfDcuWi9W3HHSb12ui
         AhkSErTEricNMKqJyW+MelSM/ue41J4U+jRu+n/c1ES6clZ+vSiU+d4FKmPvSLv9Yz
         HcYgDnyKp0wHVl2w/Yao3Q7g1QTZ4V+O3el2Biuk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 03/12] dt-bindings: media: i2c: max9286: Add property to select bus width
Date:   Thu, 15 Dec 2022 01:38:16 +0200
Message-Id: <20221214233825.13050-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GMSL serial data bus width is normally selected by the BWS pin, but
it can also be configured by software. Add a DT property that allows
overriding the value of the BWS-selected bus width to support systems
whose BWS pin doesn't result in the correct value.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:

- Specify the property type
---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 315a6eef6198..fbacf2a45dfc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -50,6 +50,14 @@ properties:
   '#gpio-cells':
     const: 2
 
+  maxim,bus-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 24, 27, 32 ]
+    description: |
+      The GMSL serial data bus width. This setting is normally controlled by
+      the BWS pin, but may be overridden with this property. The value must
+      match the configuration of the remote serializers.
+
   maxim,i2c-remote-bus-hz:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 8470, 28300, 84700, 105000, 173000, 339000, 533000, 837000 ]
-- 
Regards,

Laurent Pinchart

