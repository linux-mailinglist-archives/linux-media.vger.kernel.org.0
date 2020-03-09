Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83B0317DD31
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCIKPE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:15:04 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58885 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgCIKOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:46 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQm-0003mr-R9; Mon, 09 Mar 2020 11:14:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQh-0001mN-0n; Mon, 09 Mar 2020 11:14:35 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v12 16/19] media: dt-bindings: tvp5150: cleanup bindings stlye
Date:   Mon,  9 Mar 2020 11:14:25 +0100
Message-Id: <20200309101428.15267-17-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use underlines to highlight optional and required properties. This is
quite common for all bindings. Align descriptions and start sentence
with uppercase letter. Also reword the usage of the required
endpoint properties for the output port in case BT.656 should be used.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/tvp5150.txt | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index 28b64ad149ef..cc98b38c7e73 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -5,12 +5,14 @@ The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
 with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
 
 Required Properties:
-- compatible: value must be "ti,tvp5150"
-- reg: I2C slave address
+====================
+- compatible:	Value must be "ti,tvp5150".
+- reg:		I2C slave address.
 
 Optional Properties:
-- pdn-gpios: phandle for the GPIO connected to the PDN pin, if any.
-- reset-gpios: phandle for the GPIO connected to the RESETB pin, if any.
+====================
+- pdn-gpios:	Phandle for the GPIO connected to the PDN pin, if any.
+- reset-gpios:	Phandle for the GPIO connected to the RESETB pin, if any.
 
 The device node must contain one 'port' child node per device physical input
 and output port, in accordance with the video interface bindings defined in
@@ -24,9 +26,8 @@ are numbered as follows
 	  Y-OUT		src		2
 
 The device node must contain at least one sink port and the src port. Each input
-port must be linked to an endpoint defined in
-Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt. The
-port/connector layout is as follows
+port must be linked to an endpoint defined in [1]. The port/connector layout is
+as follows
 
 tvp-5150 port@0 (AIP1A)
 	endpoint@0 -----------> Comp0-Con  port
@@ -38,14 +39,17 @@ tvp-5150 port@2
 	endpoint (video bitstream output at YOUT[0-7] parallel bus)
 
 Required Endpoint Properties for parallel synchronization on output port:
+=========================================================================
 
-- hsync-active: active state of the HSYNC signal. Must be <1> (HIGH).
-- vsync-active: active state of the VSYNC signal. Must be <1> (HIGH).
-- field-even-active: field signal level during the even field data
-  transmission. Must be <0>.
+- hsync-active:		Active state of the HSYNC signal. Must be <1> (HIGH).
+- vsync-active:		Active state of the VSYNC signal. Must be <1> (HIGH).
+- field-even-active:	Field signal level during the even field data
+			transmission. Must be <0>.
 
-If none of hsync-active, vsync-active and field-even-active is specified,
-the endpoint is assumed to use embedded BT.656 synchronization.
+Note: Do not specify any of these properties if you want to use the embedded
+      BT.656 synchronization.
+
+[1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
 
 Example - three input sources:
 
-- 
2.20.1

