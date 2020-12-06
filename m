Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75DCD2D0658
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 18:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgLFRd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 12:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgLFRdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 12:33:23 -0500
Received: from mxf1.seznam.cz (mxf1.seznam.cz [IPv6:2a02:598:a::78:123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07999C0613D3;
        Sun,  6 Dec 2020 09:32:37 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc12a.ko.seznam.cz (email-smtpc12a.ko.seznam.cz [10.53.11.105])
        id 33927368689c2701323bbf36;
        Sun, 06 Dec 2020 18:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1607275954; bh=OsqIBbxu6dHOZRO3EWBlE2gBad2O349VxgymSsZsbuc=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=BXoeWDuqgxmuSKf9kafBb8TjlOgNBXmz/9KWGBv4VXHxuDM/UQsITY3hETXOF+z5l
         moTvUO0f9wzyFqsdys+ZJ1ofk2Rinz0CJMlB+jt5nc/UNwxVpNTLS11RD/R2NPwuKv
         z8RFxhFyGt2WXousV4MENyoj0W/MOJpX0rZMk1Wo=
Received: from localhost.localdomain (ip-228-128.dynamic.ccinternet.cz [212.69.128.228])
        by email-relay23.ko.seznam.cz (Seznam SMTPD 1.3.122) with ESMTP;
        Sun, 06 Dec 2020 18:29:46 +0100 (CET)  
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
Subject: [PATCH v2 2/3] media: dt-bindings: media: i2c: imx219: document clock-frequency property
Date:   Sun,  6 Dec 2020 18:27:19 +0100
Message-Id: <20201206172720.9406-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201206172720.9406-1-michael.srba@seznam.cz>
References: <20201206172720.9406-1-michael.srba@seznam.cz>
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

changes since v1: none

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

