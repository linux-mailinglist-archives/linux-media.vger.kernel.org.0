Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9960E212A6F
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 18:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgGBQye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 12:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGBQyd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 12:54:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DB9C08C5C1;
        Thu,  2 Jul 2020 09:54:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 610742A5FA5
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com,
        tfiga@chromium.org, eddie.cai.linux@gmail.com,
        zhengsq@rock-chips.com
Subject: [PATCH v3 2/9] media: staging: dt-bindings: rkisp1: add required items in i2c example
Date:   Thu,  2 Jul 2020 13:54:03 -0300
Message-Id: <20200702165410.2583375-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200702165410.2583375-1-helen.koike@collabora.com>
References: <20200702165410.2583375-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing required items in Rockchip ISP1 dt-bindings example for
a complete i2c node.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

Changes in v3: None

Changes in v2:
- new patch in the series
---
 .../devicetree/bindings/media/rockchip-isp1.yaml             | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index a77b6ec500c95..8c7904845788d 100644
--- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -169,6 +169,11 @@ examples:
         };
 
         i2c7: i2c@ff160000 {
+            compatible = "rockchip,rk3399-i2c";
+            reg = <0x0 0xff160000 0x0 0x1000>;
+            interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&cru SCLK_I2C7>, <&cru PCLK_I2C7>;
+            clock-names = "i2c", "pclk";
             clock-frequency = <400000>;
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.26.0

