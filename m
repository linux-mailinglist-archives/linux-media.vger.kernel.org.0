Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6592241EF
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 22:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfETUSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 16:18:31 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:46818 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfETUSb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 16:18:31 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4579Fd08YGz1rC8T;
        Mon, 20 May 2019 22:18:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4579Fc6rrvz1qqkK;
        Mon, 20 May 2019 22:18:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id A6TefYW26iX6; Mon, 20 May 2019 22:18:27 +0200 (CEST)
X-Auth-Info: T9LOcCiFr0FYTWiL1tsOXrNxwJxcOBz+l3fyL58e8hc=
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz [86.49.110.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 20 May 2019 22:18:27 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
Date:   Mon, 20 May 2019 22:18:11 +0200
Message-Id: <20190520201812.7937-1-marex@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for the Intersil ISL7998x BT656-to-MIPI-CSI2 decoder.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-media@vger.kernel.org
---
 .../bindings/media/i2c/isl7998x.txt           | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isl7998x.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/isl7998x.txt b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
new file mode 100644
index 000000000000..c21703983360
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
@@ -0,0 +1,37 @@
+Intersil ISL7998x BT656-to-MIPI-CSI2 decoder
+
+The Intersil ISL7998x is a BT656-to-MIPI-CSI decoder which, capable of
+receiving up to four analog stream and multiplexing them into up to four
+MIPI CSI2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
+
+Required Properties:
+- compatible: value should be "isil,isl79987"
+- pd-gpios: a GPIO spec for the Power Down pin (active high)
+
+Option Properties:
+- isil,num-inputs: Number of connected inputs (1, 2 or 4)
+
+For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+	i2c_master {
+		isl7998x_mipi@44 {
+			compatible = "isil,isl79987";
+			reg = <0x44>;
+			isil,num-inputs = <4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_videoadc>;
+			pd-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+			status = "okay";
+
+			port {
+				isl79987_to_mipi_csi2: endpoint {
+					remote-endpoint = <&mipi_csi2_in>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
-- 
2.20.1

