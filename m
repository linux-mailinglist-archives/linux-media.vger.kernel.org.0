Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077702CFDA0
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 19:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgLESkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Dec 2020 13:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgLESkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Dec 2020 13:40:24 -0500
Received: from mxf2.seznam.cz (mxf2.seznam.cz [IPv6:2a02:598:2::123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7A8C061A51;
        Sat,  5 Dec 2020 10:39:38 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc2b.ng.seznam.cz (email-smtpc2b.ng.seznam.cz [10.23.13.45])
        id 63cadaf238c48e9b626316ac;
        Sat, 05 Dec 2020 19:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607193574; bh=ygDjAbkmvKrkg92N0x8aNLj/K1N+J/k2/6ydsyOdGA8=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=RC+cMPncoUpyzIyy5n2XmS5y8kav54nK/qpdEIevJZ/XA5otJHYmtN+DojnkDEOdp
         FYRvxR4WI4Bmf88+zJP+i7vw+W0TDKS4cNoultzsScP70RPabarF5nbs/hDBryYJxn
         Bm3I/3LejD4eJByseeNA38vXLbLGTL/+ssqfuASU=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay3.ng.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Sat, 05 Dec 2020 19:36:22 +0100 (CET)  
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
Subject: [PATCH 2/3] media: dt-bindings: media: i2c: imx219: document clock-frequency property
Date:   Sat,  5 Dec 2020 19:33:54 +0100
Message-Id: <20201205183355.6488-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201205183355.6488-1-michael.srba@seznam.cz>
References: <20201205183355.6488-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch documents the clock-frequency property, which allows the driver
to change the clock frequency from it's default value.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index dfc4d29a4f04..666b8a9da5be 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -27,6 +27,10 @@ properties:
   clocks:
     maxItems: 1
 
+  clock-frequency:
+    description:
+      Frequency of the input clock in Hertz.
+
   VDIG-supply:
     description:
       Digital I/O voltage supply, 1.8 volts
@@ -78,6 +82,7 @@ required:
   - compatible
   - reg
   - clocks
+  - clock-frequency
   - VANA-supply
   - VDIG-supply
   - VDDL-supply
@@ -95,6 +100,7 @@ examples:
             compatible = "sony,imx219";
             reg = <0x10>;
             clocks = <&imx219_clk>;
+            clock-frequency = <24000000>;
             VANA-supply = <&imx219_vana>;   /* 2.8v */
             VDIG-supply = <&imx219_vdig>;   /* 1.8v */
             VDDL-supply = <&imx219_vddl>;   /* 1.2v */
 
-- 
2.29.2

