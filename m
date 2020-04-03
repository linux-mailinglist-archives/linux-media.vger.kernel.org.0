Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B504319DB1D
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 18:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404208AbgDCQQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 12:16:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58032 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404071AbgDCQQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 12:16:21 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E409D29866C;
        Fri,  3 Apr 2020 17:16:14 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com
Subject: [PATCH v2 4/9] media: staging: dt-bindings: phy-rockchip-dphy-rx0: remove non-used reg property
Date:   Fri,  3 Apr 2020 13:15:33 -0300
Message-Id: <20200403161538.1375908-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200403161538.1375908-1-helen.koike@collabora.com>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

reg property is not used in Rockchip MIPI DPHY RX0 bindings, thus remove
it.

Suggested-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

Changes in v2:
- this is a new patch in the series
---
 .../devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml        | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
index 5dacece35702b..7d888d3588239 100644
--- a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
+++ b/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
@@ -18,9 +18,6 @@ properties:
   compatible:
     const: rockchip,rk3399-mipi-dphy-rx0
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: MIPI D-PHY ref clock
-- 
2.26.0

