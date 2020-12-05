Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CEE2CFD99
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 19:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgLESjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Dec 2020 13:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgLESja (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Dec 2020 13:39:30 -0500
X-Greylist: delayed 117 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 05 Dec 2020 10:38:43 PST
Received: from mxf2.seznam.cz (mxf2.seznam.cz [IPv6:2a02:598:2::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E54C061A4F;
        Sat,  5 Dec 2020 10:38:43 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc27a.ng.seznam.cz (email-smtpc27a.ng.seznam.cz [10.23.18.38])
        id 7f888d572486d93e7e214109;
        Sat, 05 Dec 2020 19:38:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607193519; bh=ovobX8sOi5Y+dScdZ8OoMIVuBxTsi+gvOe2YjIqDOH0=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=NHRElxwC6s4DBWOAcMfgaQkOlNaYcI+9kfE084S0YxabwEmZys3EArXkNn4X0ZIJ/
         ZpMeo1ge540Yl84Y/DMJhHoQZsodsScVDX9a6/Y+vyiGZ1AteN491+2pQ64gR+oyyI
         35/wzBP+LEkhZwIDBtZJZu2+qDBwlB3+cJm3hnpg=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay3.ng.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Sat, 05 Dec 2020 19:36:23 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH 3/3] arm64: dts: update device trees to specify clock-frequency in imx219 node
Date:   Sat,  5 Dec 2020 19:33:55 +0100
Message-Id: <20201205183355.6488-3-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205183355.6488-1-michael.srba@seznam.cz>
References: <20201205183355.6488-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds the clock-frequency property to all device trees that use
the imx219 binding, with the value of exactly 24Mhz which was previously
implicitly assumed.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
index dac6ff49020f..986c6c1f7312 100644
--- a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -82,6 +82,7 @@ imx219: imx219@10 {
 		compatible = "sony,imx219";
 		reg = <0x10>;
 		clocks = <&osc25250_clk>;
+		clock-frequency = <24000000>;
 		VANA-supply = <&imx219_vana_2v8>;
 		VDIG-supply = <&imx219_vdig_1v8>;
 		VDDL-supply = <&imx219_vddl_1v2>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
index f0829e905506..db4b801b17b5 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
@@ -59,6 +59,7 @@ &imx219 {
 	port {
 		imx219_ep: endpoint {
 			clock-lanes = <0>;
+			clock-frequency = <24000000>;
 			data-lanes = <1 2>;
 			link-frequencies = /bits/ 64 <456000000>;
 			/* uncomment remote-endpoint property to tie imx219 to
-- 
2.29.2

