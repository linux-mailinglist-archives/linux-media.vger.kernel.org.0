Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DA513FE1
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2019 16:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbfEEOBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 May 2019 10:01:06 -0400
Received: from shell.v3.sk ([90.176.6.54]:55699 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727928AbfEEOBF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 5 May 2019 10:01:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 2AB51103B0D;
        Sun,  5 May 2019 16:01:02 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id gDN4k7d2-d6Q; Sun,  5 May 2019 16:00:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 862D5103D28;
        Sun,  5 May 2019 16:00:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XI1YjrdYj3JR; Sun,  5 May 2019 16:00:36 +0200 (CEST)
Received: from nedofet.lan (ip-89-102-31-34.net.upcbroadband.cz [89.102.31.34])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 7A093103D25;
        Sun,  5 May 2019 16:00:35 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        jacopo mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v5 01/10] media: dt-bindings: marvell,mmp2-ccic: Add Marvell MMP2 camera
Date:   Sun,  5 May 2019 16:00:22 +0200
Message-Id: <20190505140031.9636-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505140031.9636-1-lkundrak@v3.sk>
References: <20190505140031.9636-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Marvell MMP2 camera host interface.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v4:
- s/Nust/Must/
- Documented required endpoint properties; bus-type, hsync-active,
  vsync-active and pclk-sample.

Changes since v3:
- Dropped the video-interfaces.txt reference
- Clarify "clocks", "clock-names" and "clock-output-names" descriptions
- Refer to other documentation by full path

Changes since v2:
- Added #clock-cells, clock-names, port

 .../bindings/media/marvell,mmp2-ccic.txt      | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-=
ccic.txt

diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.tx=
t b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
new file mode 100644
index 0000000000000..7ec2c8c8a3b98
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
@@ -0,0 +1,50 @@
+Marvell MMP2 camera host interface
+
+Required properties:
+ - compatible: Should be "marvell,mmp2-ccic".
+ - reg: Register base and size.
+ - interrupts: The interrupt number.
+ - #clock-cells: Must be 0.
+
+Optional properties:
+ - clocks: Reference to the input clock as specified by
+           Documentation/devicetree/bindings/clock/clock-bindings.txt.
+ - clock-names: Names of the clocks used; "axi" for the AXI bus interfac=
e,
+                "func" for the peripheral clock and "phy" for the parall=
el
+                video bus interface.
+ - clock-output-names: Optional clock source for sensors. Shall be "mclk=
".
+
+Required subnodes:
+ - port: The parallel bus interface port with a single endpoint linked t=
o
+         the sensor's endpoint as described in
+         Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Required endpoint properties:
+ - bus-type: data bus type, <5> or <6> for Parallel or Bt.656 respective=
ly
+ - pclk-sample: pixel clock polarity
+ - hsync-active: horizontal synchronization polarity (only required for
+   parallel bus)
+ - vsync-active: vertical synchronization polarity (only required for
+   parallel bus)
+
+Example:
+
+	camera0: camera@d420a000 {
+		compatible =3D "marvell,mmp2-ccic";
+		reg =3D <0xd420a000 0x800>;
+		interrupts =3D <42>;
+		clocks =3D <&soc_clocks MMP2_CLK_CCIC0>;
+		clock-names =3D "axi";
+		#clock-cells =3D <0>;
+		clock-output-names =3D "mclk";
+
+		port {
+			camera0_0: endpoint {
+				remote-endpoint =3D <&ov7670_0>;
+                                bus-type =3D <5>;      /* Parallel */
+                                hsync-active =3D <1>;  /* Active high */
+                                vsync-active =3D <1>;  /* Active high */
+                                pclk-sample =3D <0>;   /* Falling */
+			};
+		};
+	};
--=20
2.21.0

