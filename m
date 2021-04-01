Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8F6351A44
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbhDAR6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:58:52 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64963 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbhDAR4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299766; x=1648835766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=84VHzcsJ4TUt5svlhMIaet84Qj9F0UavrZGGg9pJD1A=;
  b=0j1dj9xNvkOHC/EWsMlbFG4IX6n97+mBWebteuUiVo4ceNiFBwPZmQoY
   voN/76WViYMF0zNpAcSkixcgMSXzjsQBSHSKpcfHueurhW1s8yQDAX4Cp
   6eey1mhpBKvs8BjpRFhzt2VZ/rmfe7Lsy9oPOnmiCztTSEyQ6iltM4shT
   WfwG816HMKr1vQ7GUzj8KEZJFC7Uos2GcYgCgSslQWgEg6ZpMk4mDexTe
   GxdtDd9f6NWROeUfmpJSeR8xumGlPVIQIoeNhHIG54lVB5ZqwWJzkRtkA
   lQK7abOxduSbQFq8V/9yPuJxJQ2PIkFcGtiZEVlwUYOe+4DuCHKNed49l
   g==;
IronPort-SDR: hGF7t1o5vyrXOWv44bSddjFkWj2ABF4+p/s/aYFlZ56JJPAMxefxIKKhZLk9ORuQgdL9C52mqV
 HtoKmm+JT9FJnkUTyvsNnNg2jTlfAY2CzBFm37fX9L4MA7zY4MIIYCmj0keoYDxMK7DEFIdMjV
 K5IAcLU5fP/c25EyYTQKcpJxXL7Tc2Ku4OTOM/WS1QBbOA5/v6kTr0O38TQyp4AjciqeiaCKyv
 /dngYVp4TRnu44mdmU3urmIwx/UfPb2vrsui1/bALACeMzp7kCA/FBAz8Q5QOXOLawjuReG+xA
 WEo=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49671239"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:34:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:34:32 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:34:19 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 28/30] dt-bindings: media: atmel: add microchip-xisc binding
Date:   Thu, 1 Apr 2021 14:27:21 +0300
Message-ID: <20210401112723.189107-29-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for the microchip xisc, a driver based on atmel-isc.
It shares common code with atmel-isc, but the xisc is the next generation
ISC which is present on sama7g5 product.
It has an enhanced pipeline, additional modules, formats, and it supports
not only parallel sensors, but also serial sensors, by connecting to a demux
endpoint present on sama7g5.
One of the key points for creating a new binding is the clocking scheme, as
atmel-isc requires 3 mandatory clocks, the microchip-xisc requires a single
input clock.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

Hello Rob, all,

I did not convert this yet to yaml because I would like first your feedback
if the binding is good.
If it's fine I will convert both this new binding and the old atmel-isc
to yaml.

Thanks for your feedback,
Eugen

 .../bindings/media/microchip-xisc.txt         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/microchip-xisc.txt

diff --git a/Documentation/devicetree/bindings/media/microchip-xisc.txt b/Documentation/devicetree/bindings/media/microchip-xisc.txt
new file mode 100644
index 000000000000..080a357ed84d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/microchip-xisc.txt
@@ -0,0 +1,64 @@
+Microchip eXtended Image Sensor Controller (XISC)
+----------------------------------------------
+
+Required properties for XISC:
+- compatible
+	Must be "microchip,sama7g5-xisc".
+- reg
+	Physical base address and length of the registers set for the device.
+- interrupts
+	Should contain IRQ line for the XISC.
+- clocks
+	List of clock specifiers, corresponding to entries in
+	the clock-names property;
+	Please refer to clock-bindings.txt.
+- clock-names
+	Required elements: "hclock".
+	This is the clock that clocks the sensor controller, and is usually
+	fed from the clock tree. It is used for the internal controller logic.
+- #clock-cells
+	Should be 0.
+- clock-output-names
+	Should be "isc-mck".
+- pinctrl-names, pinctrl-0
+	Please refer to pinctrl-bindings.txt.
+
+Optional properties for XISC:
+- microchip,mipi-mode;
+	As the XISC is usually connected to a demux/bridge, the XISC receives
+	the same type of input, however, it should be aware of the type of
+	signals received. The mipi-mode enables different internal handling
+	of the data and clock lines.
+
+XISC supports a single port node with internal parallel bus.
+It should contain one 'port' child node with child 'endpoint' node.
+Please refer to the bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+This endpoint has to be connected to a bridge that acts as a demux from either
+a serial interface or acts as a simple direct bridge to a parallel sensor.
+
+Example:
+xisc: xisc@e1408000 {
+	compatible = "microchip,sama7g5-isc";
+	reg = <0xe1408000 0x2000>;
+	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
+	clock-names = "hclock";
+	#clock-cells = <0>;
+	clock-output-names = "isc-mck";
+	microchip,mipi-mode;
+
+	port@1 {
+		reg = <1>;
+		xisc_in: endpoint {
+		bus-width = <12>;
+		hsync-active = <1>;
+		vsync-active = <1>;
+		remote-endpoint = <&csi2dc_out>;
+		};
+	};
+};
+
-- 
2.25.1

