Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C80B21F3FE
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 16:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgGNOZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 10:25:41 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44689 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgGNOZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 10:25:41 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2E693240005;
        Tue, 14 Jul 2020 14:25:37 +0000 (UTC)
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
Subject: [PATCH v2 2/3] dt-bindings: media: i2c: Document 'remote-endpoint'
Date:   Tue, 14 Jul 2020 16:28:55 +0200
Message-Id: <20200714142856.58365-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the 'remote-endpoint' property and add it to the list of required
endpoint properties in imx219 and ov8856 dt-schema binding files.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
 Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
 2 files changed, 10 insertions(+)

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
index 1956b2a32bf4..c1f363bb5aee 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -84,9 +84,14 @@ properties:
               Allowed data bus frequencies. 360000000, 180000000 Hz or both
               are supported by the driver.
 
+          remote-endpoint:
+            description: |-
+              phandle to the video receiver input port
+
 
         required:
           - link-frequencies
+          - remote-endpoint
 
     required:
       - endpoint
-- 
2.27.0

