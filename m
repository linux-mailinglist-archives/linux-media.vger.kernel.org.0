Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732C131B4C7
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhBOEie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:38:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhBOEib (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:38:31 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4F9F1B1B;
        Mon, 15 Feb 2021 05:28:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363336;
        bh=KelzU6pU9G0fFdPHCW/5odHVOrbiiBYR7sx2Dl76z4o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lZdTkUXhrWL8F6WrE6SL2MKFZJSGbsORS5Re48Zg8S3oV5cNCt8sN0CyRItaPY/kf
         VcVGJRPObLNsGf0NZQS2opz+snH6IHdca40F4ZXfa8dWciHM0IqC9ZrYJGImlS91MB
         XSHPb1D4X6G9Cy6mrjTKRCWoe0m6uvth7cQTuJqQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 58/77] dt-bindings: media: nxp,imx7-mipi-csi2: Drop the reset-names property
Date:   Mon, 15 Feb 2021 06:27:22 +0200
Message-Id: <20210215042741.28850-59-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 .../devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml        | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index 0668332959e7..8d4007caa210 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -44,9 +44,6 @@ properties:
   resets:
     maxItems: 1
 
-  reset-names:
-    const: mrst
-
   clock-frequency:
     description:
       The IP main (system bus) clock frequency in Hertz
@@ -118,7 +115,6 @@ required:
   - power-domains
   - phy-supply
   - resets
-  - reset-names
   - ports
 
 additionalProperties: false
@@ -144,7 +140,6 @@ examples:
             power-domains = <&pgc_mipi_phy>;
             phy-supply = <&reg_1p0d>;
             resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
-            reset-names = "mrst";
             fsl,csis-hs-settle = <3>;
 
             ports {
-- 
Regards,

Laurent Pinchart

