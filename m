Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD86A54D192
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 21:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346636AbiFOT0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 15:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346482AbiFOT0a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 15:26:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88DA4EA17;
        Wed, 15 Jun 2022 12:26:27 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9217A6C8;
        Wed, 15 Jun 2022 21:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655321184;
        bh=GAluR8jVnzV6oeYRzWKhXCUT6LqQoGs18k2HP3X8emE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m/26DK+oofwHPiIvIQCFiOWrG5mp1UgTy4j8Cbqwi3FBisASt6wyBEGwRYeLPDKtL
         Jmffy2xfPKPWWBmMg6VNVPRjPupk1IOIg3iwsO81ttGNxm5gIJbdzZAF/k2+gpKGh0
         UfRt9V1PHqcshSZUG2kU8zc5BTgqxx4Xc5CaSVpk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: media: nxp,imx-mipi-csi2: i.MX8MP support
Date:   Wed, 15 Jun 2022 22:26:02 +0300
Message-Id: <20220615192602.25472-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSIS CSI-2 receiver in the i.MX8MP seems to be identical to the
version present in the i.MX8MM. Add a device-specific compatible string,
with a fallback to the i.MX8MM compatible.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml  | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index 36b135bf9f2a..03a23a26c4f3 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -22,9 +22,14 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7-mipi-csi2
-      - fsl,imx8mm-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx7-mipi-csi2
+          - fsl,imx8mm-mipi-csi2
+      - items:
+          - enum:
+              - fsl,imx8mp-mipi-csi2
+          - const: fsl,imx8mm-mipi-csi2
 
   reg:
     maxItems: 1
-- 
Regards,

Laurent Pinchart

