Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDDA73A8C09
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 00:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbhFOWxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 18:53:00 -0400
Received: from gloria.sntech.de ([185.11.138.130]:53070 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229908AbhFOWw5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 18:52:57 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1ltHtG-0002WY-Ax; Wed, 16 Jun 2021 00:50:38 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v3 03/10] dt-bindings: media: rkisp1: document different irq possibilities
Date:   Wed, 16 Jun 2021 00:50:16 +0200
Message-Id: <20210615225023.3929434-4-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210615225023.3929434-1-heiko@sntech.de>
References: <20210615225023.3929434-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Some variants have one irq signaling all of MI, MIPI and ISP events
while some rkisp1 variants use separate irqs for each.

Adapt the binding to handle both cases.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 .../devicetree/bindings/media/rockchip-isp1.yaml         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 2f8f0625d22e..80709a01c6fd 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -21,7 +21,14 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: isp
+      - const: mi
+      - const: mipi
 
   clocks:
     minItems: 3
-- 
2.29.2

