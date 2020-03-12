Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9BB0182DBF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgCLKcf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:32:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47441 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgCLKc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:32:28 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8X-0002y4-L7; Thu, 12 Mar 2020 11:32:21 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8R-0001Kk-Px; Thu, 12 Mar 2020 11:32:15 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v13 19/21] media: dt-bindings: tvp5150: add optional sdtv standards documentation
Date:   Thu, 12 Mar 2020 11:31:54 +0100
Message-Id: <20200312103156.3178-20-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312103156.3178-1-m.felsch@pengutronix.de>
References: <20200312103156.3178-1-m.felsch@pengutronix.de>
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

Document the optional binding to limit the possible sdtv standards on the
input connectors.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v12:
-fix wrong dt-property enum in examples

v8:
- adapt to new sdtv-standards
- adapt commit message
- fix missing include within example code
---
 .../devicetree/bindings/media/i2c/tvp5150.txt          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index cc98b38c7e73..6c88ce858d08 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -49,13 +49,22 @@ Required Endpoint Properties for parallel synchronization on output port:
 Note: Do not specify any of these properties if you want to use the embedded
       BT.656 synchronization.
 
+Optional Connector Properties:
+==============================
+
+- sdtv-standards: Set the possible signals to which the hardware tries to lock
+                  instead of using the autodetection mechnism. Please look at
+                  [1] for more information.
+
 [1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
 
 Example - three input sources:
+#include <dt-bindings/display/sdtv-standards.h>
 
 comp_connector_0 {
 	compatible = "composite-video-connector";
 	label = "Composite0";
+	sdtv-standards = <SDTV_STD_PAL_M>; /* limit to pal-m signals */
 
 	port {
 		composite0_to_tvp5150: endpoint {
@@ -67,6 +76,7 @@ comp_connector_0 {
 comp_connector_1 {
 	compatible = "composite-video-connector";
 	label = "Composite1";
+	sdtv-standards = <SDTV_STD_NTSC_M>; /* limit to ntsc-m signals */
 
 	port {
 		composite1_to_tvp5150: endpoint {
-- 
2.20.1

