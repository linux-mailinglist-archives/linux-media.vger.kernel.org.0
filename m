Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D2E158084
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 18:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgBJRHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 12:07:24 -0500
Received: from mailoutvs60.siol.net ([185.57.226.251]:47144 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728006AbgBJRHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 12:07:20 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id A99A8521B89;
        Mon, 10 Feb 2020 18:07:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 6TAoZQl4S_0N; Mon, 10 Feb 2020 18:07:18 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 680B6521AFF;
        Mon, 10 Feb 2020 18:07:18 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 97F90521B89;
        Mon, 10 Feb 2020 18:07:15 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v2 3/5] arm64: dts: allwinner: a64: Add MBUS controller node
Date:   Mon, 10 Feb 2020 18:06:54 +0100
Message-Id: <20200210170656.82265-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210170656.82265-1-jernej.skrabec@siol.net>
References: <20200210170656.82265-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A64 contains MBUS, which is the bus used by DMA devices to access
system memory.

MBUS controller is responsible for arbitration between channels based
on set priority and can do some other things as well, like report
bandwidth used. It also maps RAM region to different address than CPU.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
index 862b47dc9dc9..251c91724de1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -1061,6 +1061,14 @@ pwm: pwm@1c21400 {
 			status =3D "disabled";
 		};
=20
+		mbus: dram-controller@1c62000 {
+			compatible =3D "allwinner,sun50i-a64-mbus";
+			reg =3D <0x01c62000 0x1000>;
+			clocks =3D <&ccu 112>;
+			dma-ranges =3D <0x00000000 0x40000000 0xc0000000>;
+			#interconnect-cells =3D <1>;
+		};
+
 		csi: csi@1cb0000 {
 			compatible =3D "allwinner,sun50i-a64-csi";
 			reg =3D <0x01cb0000 0x1000>;
--=20
2.25.0

