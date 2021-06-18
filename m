Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F0C3ACB97
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 15:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhFRNFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 09:05:00 -0400
Received: from gloria.sntech.de ([185.11.138.130]:45078 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230393AbhFRNE4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 09:04:56 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1luE8u-0001y0-Tu; Fri, 18 Jun 2021 15:02:40 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v6 02/10] dt-bindings: media: rkisp1: fix pclk clock-name
Date:   Fri, 18 Jun 2021 15:02:30 +0200
Message-Id: <20210618130238.4171196-3-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210618130238.4171196-1-heiko@sntech.de>
References: <20210618130238.4171196-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Having a clock name as "pclk_isp" suggests really hard a remnant from
the vendor kernel.

Right now no driver _and_ no devicetree actually uses this clock name
so there is still time to fix that naming.

Therefore drop the "_isp" suffix and only name it pclk.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index a6b1eff879ed..2f8f0625d22e 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -41,7 +41,7 @@ properties:
       - const: aclk
       - const: hclk
       # only for isp1
-      - const: pclk_isp
+      - const: pclk
 
   iommus:
     maxItems: 1
-- 
2.29.2

