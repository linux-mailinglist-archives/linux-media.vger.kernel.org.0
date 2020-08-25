Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE27251DF5
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHYROt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:14:49 -0400
Received: from mailoutvs4.siol.net ([185.57.226.195]:34395 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726784AbgHYROU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:14:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E4C50524B30;
        Tue, 25 Aug 2020 19:14:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id tm1MSW7P3ZD9; Tue, 25 Aug 2020 19:14:13 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id A924C524B4C;
        Tue, 25 Aug 2020 19:14:13 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 71931524B30;
        Tue, 25 Aug 2020 19:14:11 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable IR
Date:   Tue, 25 Aug 2020 19:13:58 +0200
Message-Id: <20200825171358.1286902-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825171358.1286902-1-jernej.skrabec@siol.net>
References: <20200825171358.1286902-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

BananaPi M2 Ultra has IR receiver connected to IR0.

Enable it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm=
/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index ea15073f0c79..2fc62ef0cb3e 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -164,6 +164,10 @@ axp22x: pmic@34 {
=20
 #include "axp22x.dtsi"
=20
+&ir0 {
+	status =3D "okay";
+};
+
 &mmc0 {
 	vmmc-supply =3D <&reg_dcdc1>;
 	bus-width =3D <4>;
--=20
2.28.0

