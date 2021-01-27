Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A143062AB
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 18:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344238AbhA0RwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 12:52:24 -0500
Received: from foss.arm.com ([217.140.110.172]:56914 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343743AbhA0R1j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 12:27:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98ADD1474;
        Wed, 27 Jan 2021 09:26:14 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57C753F66E;
        Wed, 27 Jan 2021 09:26:12 -0800 (PST)
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
Subject: [PATCH v5 11/20] dt-bindings: media: IR: Add H616 IR compatible string
Date:   Wed, 27 Jan 2021 17:24:51 +0000
Message-Id: <20210127172500.13356-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210127172500.13356-1-andre.przywara@arm.com>
References: <20210127172500.13356-1-andre.przywara@arm.com>
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

