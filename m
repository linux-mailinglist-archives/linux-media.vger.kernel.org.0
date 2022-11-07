Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0739E61E80D
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 01:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiKGA4Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Nov 2022 19:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiKGA4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Nov 2022 19:56:14 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 06A70A1A7;
        Sun,  6 Nov 2022 16:56:14 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E941D139F;
        Sun,  6 Nov 2022 16:56:19 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C47793F703;
        Sun,  6 Nov 2022 16:56:11 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/10] dt-bindings: media: IR: Add F1C100s IR compatible string
Date:   Mon,  7 Nov 2022 00:54:28 +0000
Message-Id: <20221107005433.11079-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CIR controller in the Allwinner F1C100s series of SoCs is compatible
to the ones used in other Allwinner SoCs.

Add the respective compatible name to the existing IR binding, and pair
it with the A31 fallback compatible string.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 704033e21ee8..53945c61325c 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -21,6 +21,7 @@ properties:
       - const: allwinner,sun6i-a31-ir
       - items:
           - enum:
+              - allwinner,suniv-f1c100s-ir
               - allwinner,sun8i-a83t-ir
               - allwinner,sun8i-r40-ir
               - allwinner,sun50i-a64-ir
-- 
2.35.5

