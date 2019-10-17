Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFBDDB656
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 20:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503175AbfJQShz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 14:37:55 -0400
Received: from mailoutvs42.siol.net ([185.57.226.233]:37998 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2438951AbfJQShz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 14:37:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 0306D52531B;
        Thu, 17 Oct 2019 20:37:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id HYG7a9iB14RX; Thu, 17 Oct 2019 20:37:51 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id A96F652545C;
        Thu, 17 Oct 2019 20:37:51 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 5AB9352544A;
        Thu, 17 Oct 2019 20:37:49 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH v4 3/6] ARM: dts: sunxi: h3/h5: Add MBUS controller node
Date:   Thu, 17 Oct 2019 20:37:35 +0200
Message-Id: <20191017183738.68069-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017183738.68069-1-jernej.skrabec@siol.net>
References: <20191017183738.68069-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both, H3 and H5, contain MBUS, which is the bus used by DMA devices to
access system memory.

MBUS controller is responsible for arbitration between channels based
on set priority and can do some other things as well, like report
bandwidth used. It also maps RAM region to different address than CPU.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi=
-h3-h5.dtsi
index 107eeafad20a..66bee3bea633 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -109,6 +109,7 @@
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
+		dma-ranges;
 		ranges;
=20
 		display_clocks: clock@1000000 {
@@ -544,6 +545,14 @@
 			};
 		};
=20
+		mbus: dram-controller@1c62000 {
+			compatible =3D "allwinner,sun8i-h3-mbus";
+			reg =3D <0x01c62000 0x1000>;
+			clocks =3D <&ccu 113>;
+			dma-ranges =3D <0x00000000 0x40000000 0xc0000000>;
+			#interconnect-cells =3D <1>;
+		};
+
 		spi0: spi@1c68000 {
 			compatible =3D "allwinner,sun8i-h3-spi";
 			reg =3D <0x01c68000 0x1000>;
--=20
2.23.0

