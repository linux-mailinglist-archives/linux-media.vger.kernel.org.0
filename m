Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB5D2F52D0
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 19:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbhAMSzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 13:55:50 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:55347 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbhAMSzu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 13:55:50 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id ACAF41C000E;
        Wed, 13 Jan 2021 18:55:05 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com, Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v7 4/7] dt-bindings: media: max9286: Document 'maxim,reverse-channel-microvolt'
Date:   Wed, 13 Jan 2021 19:55:02 +0100
Message-Id: <20210113185506.119808-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
References: <20210113185506.119808-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the 'reverse-channel-microvolt' vendor property in the
bindings document of the max9286 driver.

The newly introduced property allows to specifying the initial
configuration of the GMSL reverse control channel to accommodate
remote serializers pre-programmed with the high threshold power
supply noise immunity enabled.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 68ee8c7d9e79..1406236e37ef 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -50,6 +50,26 @@ properties:
   '#gpio-cells':
     const: 2
 
+  maxim,reverse-channel-microvolt:
+    minimum: 30000
+    maximum: 200000
+    default: 170000
+    description: |
+      Initial amplitude of the reverse control channel, in micro volts.
+
+      The initial amplitude shall be adjusted to a value compatible with the
+      configuration of the connected remote serializer.
+
+      Some camera modules (for example RDACM20) include an on-board MCU that
+      pre-programs the embedded serializer with power supply noise immunity
+      (high-threshold) enabled. A typical value of the deserializer's reverse
+      channel amplitude to communicate with pre-programmed serializers is
+      170000 micro volts.
+
+      A typical value for the reverse channel amplitude to communicate with
+      a remote serializer whose high-threshold noise immunity is not enabled
+      is 100000 micro volts
+
   ports:
     type: object
     description: |
@@ -242,6 +262,8 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
 
+        maxim,reverse-channel-microvolt = <170000>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.29.2

