Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B850064E558
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 01:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiLPApJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Dec 2022 19:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiLPApI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Dec 2022 19:45:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F88132BA9;
        Thu, 15 Dec 2022 16:45:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA756505;
        Fri, 16 Dec 2022 01:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671151504;
        bh=as8piRAsDXFXF+yWkpC8+SXsiz2x3HwRngvZHRf1PeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mdF/HyzKSJAV42ygH98VrCvvT/374ei48PBJzsnZLdQBKo8MgP7NkB0VjMn//iuei
         f4uXilCCmUiwmmrmF7YLuF6ZBZ/00AJHrAkNSMrJW1VrZMh9h7/kyt0BGpBQniH0CK
         89ViUmLQxdTu6Iacz4e7NwV7oJ/Qag/ehZc0cCEs=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3.1 02/12] dt-bindings: media: i2c: max9286: Add property to select I2C speed
Date:   Fri, 16 Dec 2022 02:45:00 +0200
Message-Id: <20221216004500.4263-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
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

The I2C speed on the remote side (the I2C master bus of the connected
serializers) is configurable, and doesn't need to match the speed of the
local bus (the slave bus of the MAX9286). All remote buses must use the
same speed, and the MAX9286 needs to be programmed accordingly. Add a
new DT property to select the speed to make it configurable.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v3:

- Drop the property type
- Add maxim,i2c-remote-bus-hz property to example

Changes since v2:

- Rename property to maxim,i2c-remote-bus-hz
- Specify the property type
---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 4f28690eabcd..75c2d8b8c809 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -50,6 +50,13 @@ properties:
   '#gpio-cells':
     const: 2
 
+  maxim,i2c-remote-bus-hz:
+    enum: [ 8470, 28300, 84700, 105000, 173000, 339000, 533000, 837000 ]
+    default: 105000
+    description: |
+      The I2C clock frequency for the remote I2C buses. The value must match
+      the configuration of the remote serializers.
+
   maxim,reverse-channel-microvolt:
     minimum: 30000
     maximum: 200000
@@ -234,6 +241,7 @@ examples:
             gpio-controller;
             #gpio-cells = <2>;
 
+            maxim,i2c-remote-bus-hz = <339000>;
             maxim,reverse-channel-microvolt = <170000>;
 
             ports {
-- 
Regards,

Laurent Pinchart

