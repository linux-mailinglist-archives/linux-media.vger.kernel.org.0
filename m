Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275A830358F
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 06:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388719AbhAZFpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:31 -0500
Received: from foss.arm.com ([217.140.110.172]:49700 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730119AbhAYPja (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 10:39:30 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 790C51764;
        Mon, 25 Jan 2021 07:19:20 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389903F68F;
        Mon, 25 Jan 2021 07:19:18 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 11/21] dt-bindings: media: IR: Add H616 IR compatible string
Date:   Mon, 25 Jan 2021 15:18:01 +0000
Message-Id: <20210125151811.11871-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210125151811.11871-1-andre.przywara@arm.com>
References: <20210125151811.11871-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the obvious compatible name to the existing IR binding, and pair
it with the existing A31 fallback compatible string, as the devices
are compatible.

On the way use enums to group all compatible devices together.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/allwinner,sun4i-a10-ir.yaml   | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 5fa19d4aeaf3..6d8395d6bca0 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -20,16 +20,12 @@ properties:
       - const: allwinner,sun5i-a13-ir
       - const: allwinner,sun6i-a31-ir
       - items:
-          - const: allwinner,sun8i-a83t-ir
-          - const: allwinner,sun6i-a31-ir
-      - items:
-          - const: allwinner,sun8i-r40-ir
-          - const: allwinner,sun6i-a31-ir
-      - items:
-          - const: allwinner,sun50i-a64-ir
-          - const: allwinner,sun6i-a31-ir
-      - items:
-          - const: allwinner,sun50i-h6-ir
+          - enum:
+              - allwinner,sun8i-a83t-ir
+              - allwinner,sun8i-r40-ir
+              - allwinner,sun50i-a64-ir
+              - allwinner,sun50i-h6-ir
+              - allwinner,sun50i-h616-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.17.5

