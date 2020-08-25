Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D46251E66
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgHYRfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:35:44 -0400
Received: from mailoutvs3.siol.net ([185.57.226.194]:60510 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726257AbgHYRfk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:35:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 543CC5247BB;
        Tue, 25 Aug 2020 19:35:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id HCB8E6ksnexE; Tue, 25 Aug 2020 19:35:36 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id DE2B952476A;
        Tue, 25 Aug 2020 19:35:35 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 8F50A524801;
        Tue, 25 Aug 2020 19:35:33 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Subject: [PATCH 2/5] ARM: dts: sun8i: r40: Add node for system controller
Date:   Tue, 25 Aug 2020 19:35:20 +0200
Message-Id: <20200825173523.1289379-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825173523.1289379-1-jernej.skrabec@siol.net>
References: <20200825173523.1289379-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 has system controller and SRAM C1 region similar to that
in A10.

Add nodes for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r=
40.dtsi
index dff9a3dc1fba..0c7526365896 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -190,6 +190,29 @@ mixer1_out_tcon_top: endpoint {
 			};
 		};
=20
+		syscon: system-control@1c00000 {
+			compatible =3D "allwinner,sun8i-r40-system-control",
+				     "allwinner,sun4i-a10-system-control";
+			reg =3D <0x01c00000 0x30>;
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+			ranges;
+
+			sram_c: sram@1d00000 {
+				compatible =3D "mmio-sram";
+				reg =3D <0x01d00000 0xd0000>;
+				#address-cells =3D <1>;
+				#size-cells =3D <1>;
+				ranges =3D <0 0x01d00000 0xd0000>;
+
+				ve_sram: sram-section@0 {
+					compatible =3D "allwinner,sun8i-r40-sram-c1",
+						     "allwinner,sun4i-a10-sram-c1";
+					reg =3D <0x000000 0x80000>;
+				};
+			};
+		};
+
 		nmi_intc: interrupt-controller@1c00030 {
 			compatible =3D "allwinner,sun7i-a20-sc-nmi";
 			interrupt-controller;
--=20
2.28.0

