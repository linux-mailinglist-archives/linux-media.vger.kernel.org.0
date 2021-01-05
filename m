Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32FE2EAED4
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbhAEPig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:38:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbhAEPif (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:38:35 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D78991BEA;
        Tue,  5 Jan 2021 16:30:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860616;
        bh=s76zZJfcRt9wW5Lw9OfDHVspf3tyAVGMIqynLyAQwsc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bqgg0Sl/xPTTlOUrPzYyksiKLbrmAeiPpayoVLEy0hLRkDLPewROOxt2X7zcZf4Vu
         w4S8DGyZPQ+S1/icFVrh0WQAyKyszAavGS+XANCWcKIBztIyrxJcFJj323NyqDsOmW
         9fWmvCYN68QqFXVFzLWzPQaYnwYak50dU10Mng+Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 58/75] dt-bindings: media: fsl,imx7-mipi-csi2: Drop the reset-names property
Date:   Tue,  5 Jan 2021 17:28:35 +0200
Message-Id: <20210105152852.5733-59-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The reset-names property is incorrect, as it references the reset of the
MIPI D-PHY master, which is used by the DSI controller. Fixing the
property name would create backward-compatibility issues. As the device
has a single reset, we can instead drop reset-names completely, which
also simplifies the binding.

Fix the example accordingly to use the correct reset.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml     | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
index 2df997293780..d8918ba3b06c 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
@@ -45,10 +45,6 @@ properties:
     items:
       - description: MIPI D-PHY slave reset
 
-  reset-names:
-    items:
-      - const: mrst
-
   power-domains: true
 
   phy-supply:
@@ -150,7 +146,6 @@ required:
   - clocks
   - clock-names
   - resets
-  - reset-names
   - power-domains
   - phy-supply
   - ports
@@ -174,8 +169,7 @@ examples:
         clock-frequency = <166000000>;
         power-domains = <&pgc_mipi_phy>;
         phy-supply = <&reg_1p0d>;
-        resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
-        reset-names = "mrst";
+        resets = <&src IMX7_RESET_MIPI_PHY_SRST>;
         fsl,csis-hs-settle = <3>;
 
         ports {
-- 
Regards,

Laurent Pinchart

