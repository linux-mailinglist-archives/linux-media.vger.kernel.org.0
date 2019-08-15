Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621558EACC
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 13:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730330AbfHOL57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 07:57:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58857 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbfHOL56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 07:57:58 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEO7-00042s-5A; Thu, 15 Aug 2019 13:57:51 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hyEO5-0006IW-16; Thu, 15 Aug 2019 13:57:49 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 11/13] media: dt-bindings: tvp5150: add optional tvnorms documentation
Date:   Thu, 15 Aug 2019 13:57:45 +0200
Message-Id: <20190815115747.24018-12-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815115747.24018-1-m.felsch@pengutronix.de>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
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

Document the optional binding to limit the possible tv-norms on the
input connectors.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/tvp5150.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index cc98b38c7e73..93731638b509 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -49,6 +49,13 @@ Required Endpoint Properties for parallel synchronization on output port:
 Note: Do not specify any of these properties if you want to use the embedded
       BT.656 synchronization.
 
+Optional Connector Properties:
+==============================
+
+- tvnorms: Set the possible signals to which the hardware tries to lock instead
+	   of using the autodetection mechnism. Please look at [1] for more
+	   information.
+
 [1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
 
 Example - three input sources:
@@ -56,6 +63,7 @@ Example - three input sources:
 comp_connector_0 {
 	compatible = "composite-video-connector";
 	label = "Composite0";
+	tvnorms = <TVNORM_PAL_M>; /* limit to pal-m signals */
 
 	port {
 		composite0_to_tvp5150: endpoint {
@@ -67,6 +75,7 @@ comp_connector_0 {
 comp_connector_1 {
 	compatible = "composite-video-connector";
 	label = "Composite1";
+	tvnorms = <TVNORM_NTSC_M>; /* limit to ntsc-m signals */
 
 	port {
 		composite1_to_tvp5150: endpoint {
-- 
2.20.1

