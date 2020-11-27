Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB502C634C
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgK0KiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:38:16 -0500
Received: from retiisi.eu ([95.216.213.190]:44910 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729118AbgK0KiK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:38:10 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B1A0A634CBD;
        Fri, 27 Nov 2020 12:37:17 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 22/29] dt-bindings: nokia,smia: Fix link-frequencies documentation
Date:   Fri, 27 Nov 2020 12:33:18 +0200
Message-Id: <20201127103325.29814-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
References: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The link-frequencies property belongs to the endpoint, not to the node
representing the device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/nokia,smia.txt          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
index 10ece8108081..6c45c79ef91f 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
@@ -20,8 +20,6 @@ Mandatory properties
   dependent).
 - clocks: External clock to the sensor
 - clock-frequency: Frequency of the external clock to the sensor
-- link-frequencies: List of allowed data link frequencies. An array of
-  64-bit elements.
 
 
 Optional properties
@@ -39,6 +37,8 @@ Endpoint node mandatory properties
 ----------------------------------
 
 - data-lanes: <1..n>
+- link-frequencies: List of allowed data link frequencies. An array of
+  64-bit elements.
 
 
 Example
@@ -55,11 +55,13 @@ Example
 		clocks = <&omap3_isp 0>;
 		clock-frequency = <9600000>;
 		nokia,nvm-size = <512>; /* 8 * 64 */
-		link-frequencies = /bits/ 64 <199200000 210000000 499200000>;
 		port {
 			smiapp_ep: endpoint {
 				data-lanes = <1 2>;
 				remote-endpoint = <&csi2a_ep>;
+				link-frequencies =
+					/bits/ 64 <199200000 210000000
+						   499200000>;
 			};
 		};
 	};
-- 
2.27.0

