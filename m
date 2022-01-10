Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C636048A1E1
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 22:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344449AbiAJVZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 16:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344355AbiAJVZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 16:25:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C92EC028BE7;
        Mon, 10 Jan 2022 13:25:16 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C9FAA50;
        Mon, 10 Jan 2022 22:25:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641849913;
        bh=mkdFsNJGyB1E0l88zkfvArOdM9a9qAHcUxZLFyVw7o0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rHUv1pJnkLngcwfwh4kEwWK+Mm7ZZes9dcEbnEARRmP9BcOBcrzhFm67N5siVHPbo
         MkK9RSVzqtHCBH6bzzYv/eJNKFt4lvqNiqZKS/HgxsM8mPNqSXk1ntxKKpMUK9kv6c
         LM72KiDHQL6liRGY8WquxLjKoqaW8QJD5G4XDh+U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Nizan <tnizan@witekio.com>, devicetree@vger.kernel.org
Subject: [PATCH v2.1 03/11] dt-bindings: media: i2c: max9286: Add property to select bus width
Date:   Mon, 10 Jan 2022 23:24:46 +0200
Message-Id: <20220110212446.3021-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-4-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GMSL serial data bus width is normally selected by the BWS pin, but
it can also be configured by software. Add a DT property that allows
overriding the value of the BWS-selected bus width to support systems
whose BWS pin doesn't result in the correct value.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Changes since v2:

- Specify the property type
---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 438381eb3cde..c6d92f51aa5a 100644
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

