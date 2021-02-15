Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8CA31B4C9
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhBOEih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:38:37 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBOEie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:38:34 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72ABF1B1E;
        Mon, 15 Feb 2021 05:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363337;
        bh=Ygb30CsmFCiec/JDdeZGvBgjQYI53uGlHSDZnaY99kk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lqDIX2gEjND+opn7e7/YiDIOngHWOe09+wXiyEXmZq4Nfz096ZEGVRmy2fsPHbHjD
         7Kf8Vj5uJJuixReU/N0/UvuuPRjjU6Iq/LJXFlZ4F8Xct13a51SryQmtN1hqN2atdR
         oxt6oYlXvFLR6evI7l7hQ/NoYf1rl7c34StfSQ34=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 59/77] dt-bindings: media: nxp,imx7-mipi-csi2: Drop fsl,csis-hs-settle property
Date:   Mon, 15 Feb 2021 06:27:23 +0200
Message-Id: <20210215042741.28850-60-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fsl,csis-hs-settle property isn't used by the driver anymore. Drop
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 .../devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml       | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index 8d4007caa210..74ff92b5baa3 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -49,11 +49,6 @@ properties:
       The IP main (system bus) clock frequency in Hertz
     default: 166000000
 
-  fsl,csis-hs-settle:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Differential receiver (HS-RX) settle time
-
   ports:
     type: object
     description:
@@ -140,7 +135,6 @@ examples:
             power-domains = <&pgc_mipi_phy>;
             phy-supply = <&reg_1p0d>;
             resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
-            fsl,csis-hs-settle = <3>;
 
             ports {
                     #address-cells = <1>;
-- 
Regards,

Laurent Pinchart

