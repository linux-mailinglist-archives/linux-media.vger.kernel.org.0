Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E1B4AAB23
	for <lists+linux-media@lfdr.de>; Sat,  5 Feb 2022 19:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381115AbiBESyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Feb 2022 13:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381059AbiBESyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Feb 2022 13:54:52 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EAEAC043185
        for <linux-media@vger.kernel.org>; Sat,  5 Feb 2022 10:54:48 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A0F29240004;
        Sat,  5 Feb 2022 18:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1644087287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dDCmDmAN+Ty0U7DqUOAg9vP8g2Wl/CIoMBBYtqtH7g8=;
        b=CDEjJlCnsBm3lhVvhpzIl/nmi4riWbPPeXCShzknju9GZh4sGUYCq+KC+pVPMm3sXhQ/V4
        eXerouOKCBsh28ZubTVNey2POl3g3bHWFgfCP8BmqXoSPk8zCMU2//Bkpe+ghoPqdnJlxb
        s+Nyp91hYtYtAc33WlJzi/SZ14FMP46YNwCO8pwMTv58g1WoSBJZ8xg3BxBXXVjKjeoeye
        n2GhVNcWpKpkSlSqdrs++Abyp6MglLgM4+vy5bv5h/2bdJnCAWQehHpZXMQ3QxqUr4uYC+
        LKTAefwtGY2dJkn//aj2g+ass3BZd0plGsR2LZHyE8qqpXVNPEZvTEGDfAMkfA==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 04/66] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
Date:   Sat,  5 Feb 2022 19:53:27 +0100
Message-Id: <20220205185429.2278860-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
References: <20220205185429.2278860-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V3s uses the mbus interconnect to provide DRAM access for a
number of blocks. The SoC can only map 2 GiB of DRAM, which is
reflected in the dma-ranges property.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 084323d5c61c..1b3048b6f197 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -577,6 +577,16 @@ int_mii_phy: ethernet-phy@1 {
 			};
 		};
 
+		mbus: dram-controller@1c62000 {
+			compatible = "allwinner,sun8i-v3s-mbus";
+			reg = <0x01c62000 0x1000>;
+			clocks = <&ccu CLK_MBUS>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x00000000 0x40000000 0x80000000>;
+			#interconnect-cells = <1>;
+		};
+
 		spi0: spi@1c68000 {
 			compatible = "allwinner,sun8i-h3-spi";
 			reg = <0x01c68000 0x1000>;
-- 
2.34.1

