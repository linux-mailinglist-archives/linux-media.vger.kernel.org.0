Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E66519C972
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbgDBTLK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:11:10 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:59053 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731689AbgDBTLK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:11:10 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1cvQ-1jDe9E07eS-0122ab for <linux-media@vger.kernel.org>; Thu, 02 Apr
 2020 21:11:08 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id AE49C650ABD
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 19:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pawzmrpyMw0D for <linux-media@vger.kernel.org>;
        Thu,  2 Apr 2020 21:11:06 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 3E2D464F42F
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 21:11:06 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 21:08:44 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 34C0C80505; Thu,  2 Apr 2020 20:35:06 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:35:06 +0200
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
Subject: [PATCH v5 8/9] dt-bindings: adv748x: add information about serial
 audio interface (I2S/TDM)
Message-ID: <337b689519806178458ab77385c8ac6f510cb0da.1585852001.git.alexander.riesen@cetitec.com>
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
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:SPg5b4N94NVzAScZGVN7iTZJ0se/aNq0FHI5AlMDet/mC4EI+1H
 qjz4I+gJ4bTm6fM97NVfCELM6Nh0Fc1LnpFqVO8Ch3rth/Fwl+LvBdf3314fiQW6JkJaD93
 wSItqtAGvujAbxg4X/SSKzqtdbu3TrkSLgwGj7XJ2bwfWesCcaL8S+9Ska+YYyQfQNgHehC
 LluC/fwXgpiOHgo59887Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tk5l9sG2w4k=:q7g9UzKyZctVnQcfrLcFVh
 Lfhauz/kosa6mh1FPKzxyU9mRf3AlVioS43y3iyY+s7yDHePXn3g2wx0yQGfMStU+8pqdN3XD
 WA7KdPVWbD9ZOUh1ZB4G1r7N8XBKlRLg4xMF8BXZjEq41wC+BPUijrm2hcmSYUy20YhbEcOX0
 LzP/xyckYNA+Of192wBRpIs6iKsbz1cQ2vOU5rPZ3meS3aQttyOCKKGvDTvRZferf4O7wwbl6
 rQCs2zxpmq8g02PnQQyCu/M1Pnc3uTuCE+w9tBLmSrbWU9/oSYJx1TUMHv+OmQcwJzBUQtQM0
 QSFDcRMtM6FwQQ3fRzqdHHYEa34FBFHnqPq3mCCeC1kXgNL3nR2TOzND75lcIjhz1MZwGYc6q
 RHm6nrWC4j5Eb6I6HXGdnozXHi44BRL2zUbWXJnIaTHMEWYyUU55XioSSckVfLG61u6souPyy
 3R0FXE05WWChIWNs/fXfQnQ7kq7pCTrB4MyQJwPqnE0VbMg7/PPzYtvvWgWLl4OuIF98Kjuen
 rkR14asFmyzadqKBvS8KYx50oI0zM2hR0UrC9pmleaLUz4dqSyLqHIdF6FPz2d7r4HRU+WK/2
 sqPn+UUy4TRQShy96uOfFPxhKCB64dj/UtwdbNsgI4FElPXRQnDinXleYZpGgBTw/m7KWx/fq
 JzxlblE+PNLlE1DWOt4/xq2K6Zdc8QNCVdeRr4dLhxPhee8dQtsY9+4CVQkOqra8vEFgv4czW
 Om0DEfGL9eDTVAt34ZJzld9xQib8ItBpgfB8wDIiokU0PZyIFnBClyLvjjvLsethDgASy4J9H
 G3J2fkCrX4RipqaKVz+8pfB3GhOE2h/CMkjkqdDdlnAypEoNRFhAso4W+MdtMIY6zm95+E3
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


