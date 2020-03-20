Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C113518D4AC
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 17:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgCTQlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 12:41:14 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39993 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgCTQlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 12:41:14 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M3UhQ-1jFsfi3aIk-000g5u for <linux-media@vger.kernel.org>; Fri, 20 Mar
 2020 17:41:12 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A270F64E339
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 16:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TQxaAPHktGrO for <linux-media@vger.kernel.org>;
        Fri, 20 Mar 2020 17:41:12 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4728264DBD9
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 17:41:12 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:41:12 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 33D6A80505; Fri, 20 Mar 2020 17:12:04 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:04 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 08/11] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <5e7da04cd003778cf525eac96d8bacdf4a245a13.1584720678.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:HKVgQes/b86XuOKUVep06S4Y6/ZIDQi9Pl7B/vLYwi6VkNvQfZE
 ril+01pF5kAPOikfib7R975fciyZ4CCe/lOeRzZ+TY3MeSlSOjONY4hkmk3NhqJc0BgW6vp
 WEvfxmKU0Mi1aXlv4ljn2etUglmHrMmtkw4jUSQfxE1ZCyC2A7vtUfehcXlhnw/wVNKKbTp
 CfL1LJWiR/p3iHannrhdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4fIq7OhkGT8=:vaNYXfn3lptKJhUnotVWn/
 mPQGe2bAnUBfjwcvomWVe4XHsIjZutJseSxQb08hyN6fi1wW6nDdevcVM6jINnKOm3UyjUE0b
 og5FEGg8EHDDfktT2UdlxeOkGMzViKVEcMwJybqd/uX/8f+NCWkt0+8BH5jo1/PrSH5nsGcxM
 Jigiv6wUehfOKanKRmX5lkP1X/lt4z6ltW4NfeubU7YeiZvVAz+YGCiARSzjlqGRTe6KFWlDw
 O0z6yvTvO7M3HwEOvasyI5UfGScPbXh1dPQ3T5HNVf0tyD0UGLdj5OFa/a9TJfrvkxkVW+ItR
 fFn13IQiMgw+tQmXJIzT54ERHajvRMmhCBV32/XKFilf+YRzJ4UVxNuI6b+JEatCYtfx9w84q
 mT7Ovs706llXyIfcC6Qzc2MZkYqcCQKm9h7ylZIE1PmpYMCjR/YJgV7/7j3oHfM+pyX9hYUkC
 zrUE/Bg24TccfVl5KbR4aU493Xt6OwfwW2Uk3dWPg1wQFXs12wmYn2h3FlF42h/2zOQ/88gY6
 SOkK7Y7Fte2rdSQGwXDHCKOzDL0zDpcfy4YhJ1uOSQ/l2sQqL6Lvjxrevo6ge9KBt2p+PnxCq
 AdKX1aR8a11S43UodMh9s27q3kvADyTZ4m6FQUyyQc7NV8yqyBoS9hZ9n61oJdogaTLvYFoRN
 3l6pUm7BwvIISaxKidxXaTzxYxZuffE37w1283kcITCKcdcZbzZqTl68/dO2H4A0RFGMPUrHA
 pA0z8ku05Z6ezDELGBpIf53aViJO6KMPnOSvsKw0W5Iu07mkWY+u8QWApDqG/DrGpBMImeZh1
 WcuRo7uWj/n7VGwU0PE5BfYoBCE5dT14+DUeaRJJaVvm2KSqZdnyyrV+XddxHOXETZzBOAJnE
 9vF7xcnb5AWCBMFWIApkmKpYCQZYwcbc7xmmTIBbuhEM1iZ6Z9dWQ8WbKQZp+jTYCimLOP7BQ
 9GdulsMzf0Qi7DXUbTpUul26fn4Kb/ZQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the driver has some support for the audio interface of the device,
the bindings file should mention it.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--

v3: remove optionality off MCLK clock cell to ensure the description
    matches the hardware no matter if the line is connected.
    Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 .../devicetree/bindings/media/i2c/adv748x.txt    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
index 4f91686e54a6..50a753189b81 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
@@ -2,7 +2,9 @@
 
 The ADV7481 and ADV7482 are multi format video decoders with an integrated
 HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
-from three input sources HDMI, analog and TTL.
+from three input sources HDMI, analog and TTL. There is also support for an
+I2S-compatible interface connected to the audio processor of the HDMI decoder.
+The interface has TDM capability (8 slots, 32 bits, left or right justified).
 
 Required Properties:
 
@@ -16,6 +18,8 @@ Required Properties:
     slave device on the I2C bus. The main address is mandatory, others are
     optional and remain at default values if not specified.
 
+  - #clock-cells: must be <0>
+
 Optional Properties:
 
   - interrupt-names: Should specify the interrupts as "intrq1", "intrq2" and/or
@@ -47,6 +51,7 @@ are numbered as follows.
 	  TTL		sink		9
 	  TXA		source		10
 	  TXB		source		11
+	  I2S		source		12
 
 The digital output port nodes, when present, shall contain at least one
 endpoint. Each of those endpoints shall contain the data-lanes property as
@@ -72,6 +77,7 @@ Example:
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#clock-cells = <0>;
 
 		interrupt-parent = <&gpio6>;
 		interrupt-names = "intrq1", "intrq2";
@@ -113,4 +119,12 @@ Example:
 				remote-endpoint = <&csi20_in>;
 			};
 		};
+
+		port@c {
+			reg = <12>;
+
+			adv7482_i2s: endpoint {
+				remote-endpoint = <&i2s_in>;
+			};
+		};
 	};
-- 
2.25.1.25.g9ecbe7eb18


