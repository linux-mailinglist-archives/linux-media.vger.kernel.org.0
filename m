Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896698BAAB
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 15:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbfHMNqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 09:46:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:39193 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728430AbfHMNqa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 09:46:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 06:46:29 -0700
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="167056582"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 06:46:29 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id E974721100;
        Tue, 13 Aug 2019 16:45:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1hxX71-0001Tg-2n; Tue, 13 Aug 2019 16:45:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: smiapp: Align documentation with current practices
Date:   Tue, 13 Aug 2019 16:45:18 +0300
Message-Id: <20190813134518.5640-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- The clock-lanes property is not needed for the sensors do not support
  lane reordering. (The information possibly present in existing clock-lane
  properties is simply not used.)

- There's no need to refer to the sensor device in the DT example, thus
  remove the label.

- Rename the "camera" device node as "camera-sensor".

- Rename the endpoint label as "smiapp_ep" (was: "smiapp_1_1"). There is
  in practice only one anyway.

- Remove the remote-endpoint documentation (it is covered by
  graph.txt to which video-interfaces.txt refers to).

- Add a note on the port and endpoint nodes.

These changes make the smiapp bindings a better example.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../devicetree/bindings/media/i2c/nokia,smia.txt       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
index 8ee7c7972ac79..c3c3479233c4a 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
@@ -7,6 +7,9 @@ of that. These definitions are valid for both types of sensors.
 More detailed documentation can be found in
 Documentation/devicetree/bindings/media/video-interfaces.txt .
 
+The device node should contain a "port" node which may contain one or more
+endpoint nodes, in accordance with video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt .
 
 Mandatory properties
 --------------------
@@ -37,9 +40,7 @@ Optional properties
 Endpoint node mandatory properties
 ----------------------------------
 
-- clock-lanes: <0>
 - data-lanes: <1..n>
-- remote-endpoint: A phandle to the bus receiver's endpoint node.
 
 
 Example
@@ -48,7 +49,7 @@ Example
 &i2c2 {
 	clock-frequency = <400000>;
 
-	smiapp_1: camera@10 {
+	camera-sensor@10 {
 		compatible = "nokia,smia";
 		reg = <0x10>;
 		reset-gpios = <&gpio3 20 0>;
@@ -58,8 +59,7 @@ Example
 		nokia,nvm-size = <512>; /* 8 * 64 */
 		link-frequencies = /bits/ 64 <199200000 210000000 499200000>;
 		port {
-			smiapp_1_1: endpoint {
-				clock-lanes = <0>;
+			smiapp_ep: endpoint {
 				data-lanes = <1 2>;
 				remote-endpoint = <&csi2a_ep>;
 			};
-- 
2.20.1

