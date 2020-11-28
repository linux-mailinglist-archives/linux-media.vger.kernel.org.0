Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6472C74F0
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388479AbgK1Vtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:39 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:48102 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgK1SZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 13:25:04 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9BE193AF953;
        Sat, 28 Nov 2020 14:29:37 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 088FF40007;
        Sat, 28 Nov 2020 14:29:11 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: [PATCH v2 10/19] ARM: dts: sun8i: v3s: Add CSI1 controller port for parallel input
Date:   Sat, 28 Nov 2020 15:28:30 +0100
Message-Id: <20201128142839.517949-11-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the CSI controller binding is getting a bit more complex due
to the addition of MIPI CSI-2 bridge support, make the ports node
explicit with the parallel port.

This way, it's clear that the controller only supports parallel
interface input and there's no confusion about the port number.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 7b2d684aeb97..7926c8b2ac5e 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -540,6 +540,15 @@ csi1: camera@1cb4000 {
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi1_in_parallel: port@0 {
+					reg = <0>;
+				};
+			};
 		};
 
 		gic: interrupt-controller@1c81000 {
-- 
2.29.2

