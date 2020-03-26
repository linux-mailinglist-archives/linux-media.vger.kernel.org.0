Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B86193D8D
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 12:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgCZLDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 07:03:44 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52821 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgCZLDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 07:03:44 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9npV-1jCDEp3dVF-005pc0 for <linux-media@vger.kernel.org>; Thu, 26 Mar
 2020 12:03:42 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A0C7E6503FC
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 11:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zetQkoCUojIG for <linux-media@vger.kernel.org>;
        Thu, 26 Mar 2020 12:03:42 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 48FB664F925
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:03:42 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 12:03:42 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A12B180505; Thu, 26 Mar 2020 11:35:43 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:35:43 +0100
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
Subject: [PATCH v4 8/9] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <37482bdfc6d6c6e231c58550b6bc4582aa29dde0.1585218857.git.alexander.riesen@cetitec.com>
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
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:fPQ3iwsgwFddzHauBh7gTobErMfV/raLxpHPbxFjtWM/d9S0/JH
 Ty16HT/f6EcE4V0a3jU0ba1PAH4uN1j/pXim7ho1AbV8WA/PXme6wXqKKSQGY3S+4qfiopx
 ElT5KV6md0aXFpOQw03lxobUaWovZ5FlowUKO9kQgnmPIYr+lpvdpFfPBPf+K9T4MZxT+ML
 h9YM+aUOCFmU97JY0uq+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VvoLKD5IQwk=:FzasR2vhBLU3n35YaFKfT3
 /O0nps6K7WRB4uT5/aoi4cCkh3YXzS0Vw//HZhTxhiIP+utBWMeNTWJLCNnAZrdbT8Alj1Bxq
 94podsAzRmrAHPxsref/q7rmqTbE/rUtdfi1sXvFT8+1QPlfmqwXvutZjrlf9gKJZsDUyHT1Z
 g99smcRCZxwxyG8GtnfZgLV6n2wPzsAwe01kkL0PAbMIutvVZqV99/eu+FCeXYbirTJJZ4Wm6
 5ajKjylMliXCx4RpXBoZVAohZ6uzsllMxFdBnTLl3ONQB6pxXOJlrEJXMajMQL7uya1iFe2us
 F13KKo5LnKGK+G3Iv1pu7XARdKlHOVbZb2TLUq+minOpBTlAekBuooQYM1aPXcTsKwOA2A4WE
 +k4nVvkqeDk84Pj5XYNRwLiRiTRd7XayffWStRb267zZZ8dOiPu9HCo6XW8ROYzBm5+iDQG5/
 BEQAzhRKxqM0UGWKEBHL1fvJT7yX4kLIG5Rgun6hEjcQJpN1R6NLjSOJ2lA6vvux7TANo0ZpF
 Jq+tiIttRr5PhCCX7RbC4368T6VxBP9ysMYBQP5NfLTMwry/9KCgwEzMX1bio2cS0yhSitqO4
 5AbvsqWcCqo9PGNEaLEe3DDaVZX4bwUherOVz5R0qKvmJy/3vDdXZ1A8GXvfNhlZ9N3mhLjcv
 1Of4Duto1Es9OgnE2slpbOtZTktOzofSYf4lusnW6AP6E6B88Ae1rCZ7RXYA2y75xgZ4tcGlI
 bXaTJWN7baVgPvKnGkaDtRrsBZfBvxNlz5n9UcwBtGJtOwVwVKL6FHPbWDRV/99/BoWC4NlHc
 hDgr5bRa3FoLnqafy3K126gWT5QTdPGMjuz/z9ksbyBn/iHGgdr3ImH6U/O+m6ol1zJp/Am
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


