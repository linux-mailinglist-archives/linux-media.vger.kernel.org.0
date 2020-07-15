Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F35220D3D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 14:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbgGOMp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 08:45:29 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55615 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgGOMp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 08:45:29 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1DCDEC0006;
        Wed, 15 Jul 2020 12:45:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        dave.stevenson@raspberrypi.com, dongchun.zhu@mediatek.com,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v3 2/3] dt-bindings: media: i2c: Document 'remote-endpoint'
Date:   Wed, 15 Jul 2020 14:48:37 +0200
Message-Id: <20200715124838.84552-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715124838.84552-1-jacopo+renesas@jmondi.org>
References: <20200715124838.84552-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the 'remote-endpoint' property and add it to the list of required
endpoint properties in imx219 and ov8856 dt-schema binding files.

While at it, remove 'endpoint' from the list of required properties in
the ov8856 bindings file, as it is allowed to specify port nodes without
a connected endpoint.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
 Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 7 ++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index dfc4d29a4f04..0251e15fe0a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -71,8 +71,13 @@ properties:
             description:
               Allowed data bus frequencies.
 
+          remote-endpoint:
+            description: |-
+              phandle to the video receiver input port
+
         required:
           - link-frequencies
+          - remote-endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
index 1956b2a32bf4..8d662f9dac5f 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -84,12 +84,13 @@ properties:
               Allowed data bus frequencies. 360000000, 180000000 Hz or both
               are supported by the driver.
 
+          remote-endpoint:
+            description: |-
+              phandle to the video receiver input port
 
         required:
           - link-frequencies
-
-    required:
-      - endpoint
+          - remote-endpoint
 
 required:
   - compatible
-- 
2.27.0

