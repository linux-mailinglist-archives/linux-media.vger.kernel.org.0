Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64025482829
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbiAAS2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41358 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbiAAS2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:17 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3858FC9;
        Sat,  1 Jan 2022 19:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061694;
        bh=o0tyhyzYWH47JWnsREc9KPEBXdX+IXo7x/GMJj2UNwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OdYgFPK1TJ0AVjgZWEX31ERmVx1Vko9YqUHhhLupLJohGsLlTM0uu48xSpOrMlXjF
         fojKRCNUYmymJr+DIfLlf0KA3AFLplwN/nBxRy5WKon3kBLkjNvjKDom3r2nA7g6sU
         KWRJuo3IYfP3beeY3gS4yLJ9FKVTmXHrppJwZOx0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 02/11] dt-bindings: media: i2c: max9286: Add property to select I2C speed
Date:   Sat,  1 Jan 2022 20:27:57 +0200
Message-Id: <20220101182806.19311-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The I2C speed on the remote side (the I2C master bus of the connected
serializers) is configurable, and doesn't need to match the speed of the
local bus (the slave bus of the MAX9286). All remote buses must use the
same speed, and the MAX9286 needs to be programmed accordingly. Add a
new DT property to select the speed to make it configurable.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index c20557b52e45..5d3e99027a79 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -50,6 +50,13 @@ properties:
   '#gpio-cells':
     const: 2
 
+  maxim,i2c-clock-frequency:
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

