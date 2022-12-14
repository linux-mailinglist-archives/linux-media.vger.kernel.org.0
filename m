Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C1064D388
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiLNXij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiLNXig (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605C631EEA;
        Wed, 14 Dec 2022 15:38:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D7EB987;
        Thu, 15 Dec 2022 00:38:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061112;
        bh=eo/NeYqEer4lhcTGCCxf/wNVfPyqdl/SuDt5MSNwMBE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L7E80Pp9Syqj5SPur6rklwWNWu5yZ32yQHvzu/o2uFXiwGLisanfSmFAf/ELkyKHg
         R/GGiryxhFe+rQBtB7DKCTLHhZC2Hnh3b2CJck6vKYgeeox1G4qeTp1k4niYC5GS+S
         Oc2NO1aQYsAT6wj4wHwAEvW/rHd7QvOgiZsWTVX8=
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
Subject: [PATCH v3 02/12] dt-bindings: media: i2c: max9286: Add property to select I2C speed
Date:   Thu, 15 Dec 2022 01:38:15 +0200
Message-Id: <20221214233825.13050-3-laurent.pinchart+renesas@ideasonboard.com>
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

The I2C speed on the remote side (the I2C master bus of the connected
serializers) is configurable, and doesn't need to match the speed of the
local bus (the slave bus of the MAX9286). All remote buses must use the
same speed, and the MAX9286 needs to be programmed accordingly. Add a
new DT property to select the speed to make it configurable.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:

- Rename property to maxim,i2c-remote-bus-hz
- Specify the property type
---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 4f28690eabcd..315a6eef6198 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -50,6 +50,14 @@ properties:
   '#gpio-cells':
     const: 2
 
+  maxim,i2c-remote-bus-hz:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 8470, 28300, 84700, 105000, 173000, 339000, 533000, 837000 ]
+    default: 105000
+    description: |
+      The I2C clock frequency for the remote I2C buses. The value must match
+      the configuration of the remote serializers.
+
   maxim,reverse-channel-microvolt:
     minimum: 30000
     maximum: 200000
-- 
Regards,

Laurent Pinchart

