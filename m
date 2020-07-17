Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7D9223C70
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgGQNZn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:25:43 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60637 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgGQNZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:25:41 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D12AC1C000F;
        Fri, 17 Jul 2020 13:25:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 02/13] arm64: dts: qcom: apq8016-sbc: Fix CSI-2 lanes routing
Date:   Fri, 17 Jul 2020 15:28:48 +0200
Message-Id: <20200717132859.237120-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5640 sensor does not support lanes reconfiguration according
to version of the datasheet I have (version 2.03) and the driver
does not parse the properties to try to reconfigure them.

Fix the properties values in the camera and cci node.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
Loic, I see you added the camera nodes in
39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")

Do you have any idea how lanes could be swapped if, from my understanding,
nor the sensor nor the driver supports that ?

Thanks
  j
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 8a4b790aa7ff..fe6613676e45 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -591,8 +591,8 @@ ports {
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-				clock-lanes = <1>;
-				data-lanes = <0 2>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
 				remote-endpoint = <&ov5640_ep>;
 				status = "okay";
 			};
@@ -627,8 +627,8 @@ camera_rear@3b {

 		port {
 			ov5640_ep: endpoint {
-				clock-lanes = <1>;
-				data-lanes = <0 2>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
 		};
--
2.27.0

