Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F0C381C22
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhEPCny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhEPCnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:43:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22350C06174A;
        Sat, 15 May 2021 19:42:32 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C74F4556;
        Sun, 16 May 2021 04:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621132950;
        bh=7ffEfkdq0Dl9dk3eQUnzqt15xyoQr4opL5jgjjY/67c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IonQNSZOkd+7Zr0xk5zuJDtQE5xYAyQ0I7US45hd7/ricILEcbDIqXLgLG8NbESb5
         wIVBT2xiAWfR35iqI5RL/SLXbA1/pIqbgVGt1ZprcOU4990g+zX/TzSGwT4eV8Eh4H
         rIz0qB6o8DmvGUWyD8uPVNrTa/1Uuzr2x33ANmG8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: media: nxp,imx7-csi: Add i.MX8MM support
Date:   Sun, 16 May 2021 05:42:14 +0300
Message-Id: <20210516024216.4576-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MM integrates a CSI bridge IP core, as the i.MX7. There seems
to be no difference between the two SoCs according to the reference
manual, but as documentation may not be accurate, add a compatible
string for the i.MX8MM, with a fallback on the compatible i.MX7.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/nxp,imx7-csi.yaml      | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
index d91575b8ebb9..5922a2795167 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: i.MX7 CMOS Sensor Interface
+title: i.MX7 and i.MX8 CSI bridge (CMOS Sensor Interface)
 
 maintainers:
   - Rui Miguel Silva <rmfrfs@gmail.com>
@@ -15,9 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7-csi
-      - fsl,imx6ul-csi
+    oneOf:
+      - enum:
+          - fsl,imx7-csi
+          - fsl,imx6ul-csi
+      - items:
+          - const: fsl,imx8mm-csi
+          - const: fsl,imx7-csi
 
   reg:
     maxItems: 1
-- 
Regards,

Laurent Pinchart

