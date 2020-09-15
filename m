Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6436026ABDE
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 20:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgIOS3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 14:29:10 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:49878 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728021AbgIOSVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 14:21:36 -0400
X-Halon-ID: 381a6e66-f780-11ea-a39b-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 381a6e66-f780-11ea-a39b-005056917f90;
        Tue, 15 Sep 2020 20:21:06 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
Date:   Tue, 15 Sep 2020 20:19:42 +0200
Message-Id: <20200915181944.1037620-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915181944.1037620-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200915181944.1037620-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As of [1] the hpd-gpios property is optional, document it as such.

1. commit 269bd1324fbfaa52 ("[media] media: adv7604: improve usage of gpiod API")

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/adv7604.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
index b3e688b77a38cb6d..8c7cdc7cd7aaebc8 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
@@ -19,10 +19,6 @@ Required Properties:
     slave device on the I2C bus. The main address is mandatory, others are
     optional and revert to defaults if not specified.
 
-  - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
-    detection pins, one per HDMI input. The active flag indicates the GPIO
-    level that enables hot-plug detection.
-
 The device node must contain one 'port' child node per device input and output
 port, in accordance with the video interface bindings defined in
 Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
@@ -37,6 +33,9 @@ The digital output port node must contain at least one endpoint.
 
 Optional Properties:
 
+  - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
+    detection pins, one per HDMI input. The active flag indicates the GPIO
+    level that enables hot-plug detection.
   - reset-gpios: Reference to the GPIO connected to the device's reset pin.
   - default-input: Select which input is selected after reset.
   - reg-names : Names of maps with programmable addresses.
-- 
2.28.0

