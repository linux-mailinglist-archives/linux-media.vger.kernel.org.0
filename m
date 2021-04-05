Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B1B3543F5
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238947AbhDEP72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:59:28 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36762 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238495AbhDEP70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638360; x=1649174360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=84VHzcsJ4TUt5svlhMIaet84Qj9F0UavrZGGg9pJD1A=;
  b=ldQ2BK/2QjBM06niuS7Fdegezmd86KWUASfk1l/wEXJuryVxtcf2nikW
   6YH/2Cx6x51HaYYdfdMvzjlFx9erM76tMU2e6NmJnJcTq6fLZbTf0MfL/
   +gpnfxcYkLYmmx3UD3vYugIFXKNzsemkPxgB9MZ0JoKOP+sPxjBrT3X5p
   8oSSkZ0mW7S0SwVxqki9PxsNjLaoKZjLrjsd3gAFBwxdw7ok+Gg1okHp7
   ZYev54GN1ZFoumBeF4rJ//6nLFMTOTg6RAWGG0sSLdjLtUkwYyyfmNmZ4
   Ya6c0JyjIaQ8dS6Fanqnc8UgomefHq5F8RYaAoevEBOC+gAIMTMJkahnT
   w==;
IronPort-SDR: DzGW4zLD44QFQWfjsNnp1G9t+JfnuR8P33YbNwrDMm5c31rMxuyAM5ta2cb6iWq2ulAi2FLH27
 rWK4+3jFXFdzWEX4uYN0ykZduXYjSXQP+ql5OZieLBVO3gVVQFCT7ZoPhOKYfmUepPpPUkxa5u
 tsVxMWnoT1kyOeEtzbJMtb84bCmMXExD+OOiLM971FQDdvA3h6C2jp1CJYfSjdYPHoqRdhS1EZ
 l7tekmLyhq0NkwYvdo3TY1pw9g4vylyCmFJ+I1N7g79dNoByFB92I3b6mY6jFwn4nsubvMLnlx
 R2o=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="112482268"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:59:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:59:19 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:59:04 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 28/30] dt-bindings: media: atmel: add microchip-xisc binding
Date:   Mon, 5 Apr 2021 18:51:03 +0300
Message-ID: <20210405155105.162529-29-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

