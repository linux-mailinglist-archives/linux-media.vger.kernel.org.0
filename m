Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D863928F698
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 18:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389731AbgJOQ1k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 12:27:40 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:40973 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389699AbgJOQ1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 12:27:39 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 63BA7FF804;
        Thu, 15 Oct 2020 16:27:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/7] dt-bindings: media: max9286: Document 'maxim,high-threshold'
Date:   Thu, 15 Oct 2020 20:27:05 +0200
Message-Id: <20201015182710.54795-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the 'maxim,high-threshold' vendor property in the bindings
document of the max9286 driver.

The newly introduced boolean property allows controlling the initial
configuration of the GMSL reverse control channel to accommodate
remote serializers pre-programmed with the high threshold power
supply noise immunity enabled.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 9ea827092fdd..50e08a7d3204 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -51,6 +51,19 @@ properties:
   '#gpio-cells':
     const: 2
 
+  maxim,high-threshold:
+    description: |
+      A boolean property to increase the initial amplitude of the reverse
+      control channel to compensate for remote serializers pre-programmed with
+      high threshold noise-immunity.
+
+      Some camera modules (in example the RDACM20 one) include an on-board MCU
+      that pre-programs the embedded serializer with reverse channel power
+      supply noise immunity enabled. The deserializer shall increase its
+      reverse channel amplitude to compensate that and be able to communicate
+      with the remote end.
+    type: boolean
+
   ports:
     type: object
     description: |
@@ -243,6 +256,8 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
 
+        maxim,high-threshold;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.28.0

